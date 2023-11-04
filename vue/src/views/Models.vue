<template>
  <div class="d-flex flex-column">
    <v-autocomplete class="mr-2" variant="outlined" :items="models" v-model="model" @update:model-value="onModelUpdate"></v-autocomplete>
    <div class="d-flex mb-2 ml-auto">
      <v-btn class="mr-2" color="primary" @click="addEntry">Добавить</v-btn>
      <v-btn class="mr-2" color="primary" @click="cloneEntry">Клонировать</v-btn>
      <v-btn color="primary" @click="deleteEntry">Удалить</v-btn>
    </div>
  </div>
  <AgGridVue
    class="ag-theme-alpine"
    :default-col-def="defaultColDef"
    animateRows
    :get-row-id="getRowId"
    rowSelection="multiple"
    suppressRowClickSelection
    pagination
    style="height: 100%"
    @grid-ready="onGridReady"
    suppressExcelExport
    enableCellTextSelection
    :onCellDoubleClicked="onCellDoubleClicked"
    rowMultiSelectWithClick
    :getMainMenuItems="getMainMenuItems"
  >
  </AgGridVue>
</template>

<script>
import { AgGridVue } from 'ag-grid-vue3';
import ModelCell from '../components/cellRenderers/ModelCell.vue';
export default {
  name: 'ModelView',
  components: {
    AgGridVue,
    ModelCell,
  },
  data() {
    return {
      defaultCsvExportParams: null,
      gridApi: null,
      defaultColDef: {
        sortable: true,
        flex: 1,
        filter: true,
      },
      getRowId: function (params) {
        return params.data.id;
      },
      relations: [],
      models: [],
      model: null,
    };
  },
  beforeUnmount() {
    this.$emitter.off('delete-entry');
    this.$emitter.off('new-entry');
    this.$emitter.off('edit-entry');
  },
  methods: {
    getMainMenuItems(params) {
      // you don't need to switch, we switch below to just demonstrate some different options
      // you have on how to build up the menu to return
      // switch (params.column.getId()) {
      //   // return the defaults, put add some extra items at the end
      //   case 'athlete':
      //     const athleteMenuItems = params.defaultItems.slice(0);
      //     athleteMenuItems.push({
      //       name: 'AG Grid Is Great',
      //       action: () => {
      //         console.log('AG Grid is great was selected');
      //       },
      //     });
      //     athleteMenuItems.push({
      //       name: 'Casio Watch',
      //       action: () => {
      //         console.log('People who wear casio watches are cool');
      //       },
      //     });
      //     return athleteMenuItems;
      //   default:
      //     // make no changes, just accept the defaults
      //     console.log(params.column.getId());

      //     return params.defaultItems;
      // }
      const relations = Object.keys(this.relations);
      if (relations.includes(params.column.getId())) {
        const relationMenuItems = params.defaultItems.slice(0);
        relationMenuItems.push({
          name: 'Добавить',
          action: () => {
            this.$emitter.emit('openModal', {
              url: `/resource/`,
              method: 'POST',
              header: 'Добавить',
              eventName: 'new-entry',
              model: params.column.getId(),
              fields: this.relations[params.column.getId()].map((c) => ({ key: c.field, label: c.headerName })).filter((c) => c.key !== 'id' && c.key !== 'action'),
            });
          },
        });
        return relationMenuItems;
      } else {
        return params.defaultItems;
      }
    },
    onCellDoubleClicked(cell) {
      //open new window
      const relation = this.relations[cell.column.colId];
      if (relation) {
        window.open(`${window.location.href}?relation=${relation.table_name}&id=${cell.value}`);
      }
    },
    addEntry() {
      if (!this.model) return;
      this.$emitter.emit('openModal', {
        url: `/resource/`,
        method: 'POST',
        header: 'Добавить',
        eventName: 'new-entry',
        model: this.model,
        fields: this.gridApi
          .getColumnDefs()
          .map((c) => ({ key: c.field, label: c.headerName }))
          .filter((c) => c.key !== 'id' && c.key !== 'action'),
      });
    },
    cloneEntry() {
      const selectedRows = this.gridApi.getSelectedRows();
      if (!selectedRows.length) return;
      this.$http({
        method: 'POST',
        url: `/v1/resource/clone`,
        data: { model: this.model, entities: selectedRows },
      }).then((res) => {
        setTimeout(() => {
          this.gridApi.applyTransaction({
            add: res.data,
          });
          this.gridApi.deselectAll();
          this.gridApi.forEachNode((node) => {
            if (res.data.find((c) => c.id == node.data.id)) {
              node.setSelected(true);
            }
          });
        }, 0);
      });
    },
    deleteEntry() {
      const selectedRows = this.gridApi.getSelectedRows();
      if (!selectedRows.length) return;
      const ids = selectedRows.map((c) => c.id);
      this.$emitter.emit('openDialog', {
        header: 'Удаление записей',
        message: 'Удалить выбранные записи?',
        eventName: 'delete-entry',
        id: ids,
      });
    },
    onModelUpdate() {
      return new Promise((resolve) => {
        this.$http({ method: 'GET', url: `/v1/resource?model=${this.model}` }).then((res) => {
          const columns = res.data.entities.length
            ? Object.keys(res.data.entities[0]).map((key) => ({
                field: key,
                headerName: key,
                valueFormatter: this.baseFormatter,
              }))
            : [];

          if (columns.length) {
            columns[0].headerCheckboxSelection = true;
            columns[0].checkboxSelection = true;
            columns.push({
              field: 'action',
              headerName: '',
              cellRenderer: 'ModelCell',
              filter: false,
              sortable: false,
              maxWidth: 70,
              cellRendererParams: {
                model: this.model,
                relations: res.data.relations,
              },
            });
          }
          this.relations = res.data.relations;
          this.gridApi.setColumnDefs(columns);
          this.gridApi.setRowData(res.data.entities);
          this.gridApi.redrawRows();
          resolve();
        });
      });
    },
    baseFormatter(params) {
      //check if custom formatting exists
      const relationName = this.relations[params.colDef.field]?.table_name;

      if (relationName && this.$meta[relationName]?.formatter) {
        let formatted = '';
        const related = this.relations[params.colDef.field].entities.find((c) => c.id == params.value);
        if (related) {
          for (const key of this.$meta[relationName].formatter) {
            formatted += `${related[key]} `;
          }
        }
        return formatted;
      }
      return params.value;
    },
    onGridReady(params) {
      this.gridApi = params.api;
      this.$http({ method: 'GET', url: `/v1/resource/models` }).then((res) => {
        this.models = res.data;
        if (this.$route.query.relation) {
          this.model = this.$route.query.relation;
          this.onModelUpdate().then(() => {
            if (this.$route.query.id) {
              this.gridApi.forEachNode((node) => {
                if (node.data.id == this.$route.query.id) {
                  node.setSelected(true);
                }
              });
            }
          });
        }
      });
      this.$emitter.on('delete-entry', (ids) => {
        this.$http({
          method: 'DELETE',
          url: `/v1/resource?ids=${ids.join(',')}`,
          data: { model: this.model },
        }).then((res) => {
          setTimeout(
            () =>
              this.gridApi.applyTransaction({
                remove: res.data.map((id) => this.gridApi.getRowNode(id)),
              }),
            0,
          );
        });
      });
      this.$emitter.on('new-entry', (evt) => {
        setTimeout(() => this.gridApi.applyTransaction({ add: [evt] }), 0);
      });
      this.$emitter.on('edit-entry', (evt) => {
        const rowNode = this.gridApi.getRowNode(evt.id);
        rowNode.setData(evt);
      });
    },
  },
};
</script>
