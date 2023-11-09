<template>
  <div class="d-flex flex-column">
    <v-autocomplete class="mr-2" variant="outlined" :items="models" v-model="model" @update:model-value="onModelUpdate"></v-autocomplete>
    <div class="d-flex mb-2">
      <div class="mr-auto">
        <v-card-title class="text-h6 text-md-h5 text-lg-h4">{{ tableHeader }}</v-card-title>
        <v-card-text> {{ tableDescription }} </v-card-text>
      </div>
      <div class="mt-auto mb-2">
        <v-btn class="mr-2" color="primary" @click="editSchema">schema</v-btn>
        <v-btn class="mr-2" color="primary" @click="addEntry">Добавить</v-btn>
        <v-btn class="mr-2" color="primary" @click="cloneEntry">Клонировать</v-btn>
        <v-btn color="primary" @click="deleteEntry">Удалить</v-btn>
      </div>
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
  >
  </AgGridVue>
</template>

<script>
import { AgGridVue } from 'ag-grid-vue3';
import { storeToRefs } from 'pinia';
import { useStore } from '../stores/main';
const store = useStore();
const { settings } = storeToRefs(store);
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
      columnApi: null,
      defaultColDef: {
        sortable: true,
        flex: 1,
        filter: 'agTextColumnFilter',
        floatingFilter: true,
      },
      getRowId: function (params) {
        return params.data.id;
      },
      relations: [],
      models: [],
      model: null,
      trigger: 0,
    };
  },
  beforeUnmount() {
    this.$emitter.off('delete-entry');
    this.$emitter.off('new-entry');
    this.$emitter.off('edit-entry');
    this.$emitter.off('edit-schema');
  },
  created() {
    window.addEventListener('beforeunload', () => {
      //save column state to store
      if (this.columnApi) {
        settings.value.models[this.model] = this.columnApi.getColumnState();
      }
    });
  },
  computed: {
    tableHeader() {
      if (!this.model) return '';
      this.trigger;
      const schema = this.$meta.find((c) => c.title == this.model);
      return schema.alias || schema?.title;
    },
    tableDescription() {
      this.trigger;
      if (!this.model) return '';
      const schema = this.$meta.find((c) => c.title == this.model);
      return schema.description;
    },
  },
  methods: {
    editSchema() {
      const schema = this.$meta.find((c) => c.title == this.model);
      if (!schema) return;
      this.$emitter.emit('openModal', {
        url: `/configs/meta/`,
        method: 'PATCH',
        header: 'Изменить',
        eventName: 'edit-schema',
        fields: [{ key: 'schema', value: schema, type: 'json' }],
      });
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
        relations: this.relations,
        eventName: 'new-entry',
        model: this.model,
        fields: this.composeFields(),
      });
    },
    composeFields() {
      const keys = Object.keys(this.relations);
      return this.gridApi
        .getColumnDefs()
        .filter((c) => c.field !== 'id' && c.field !== '_action')
        .map((c) => {
          if (keys.includes(c.field)) {
            return {
              key: c.field,
              label: c.field,
              value: null,
              relation: true,
            };
          } else {
            return {
              key: c.field,
              label: c.field,
              value: null,
            };
          }
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
    // onDisplayedColumnsChanged(a) {
    //   if (this.columnApi) {
    //     //save to store
    //     console.log('saved', a);
    //     settings.value.models[this.model] = this.columnApi.getColumnState();
    //   }
    // },
    onModelUpdate() {
      return new Promise((resolve) => {
        this.$http({ method: 'GET', url: `/v1/resource?model=${this.model}` }).then((res) => {
          //save last model
          settings.value.lastModel = this.model;
          const columns = [];
          //apply formatters only to those field which are relations
          const keys = Object.keys(res.data.relations);
          if (res.data.entities.length) {
            const columnKeys = Object.keys(res.data.entities[0]);
            for (const key of columnKeys) {
              if (keys.includes(key)) {
                columns.push({
                  field: key,
                  headerName: key,
                  valueFormatter: this.baseFormatter,
                });
              } else {
                columns.push({
                  field: key,
                  headerName: key,
                });
              }
            }
          }

          if (columns.length) {
            columns[0].headerCheckboxSelection = true;
            columns[0].checkboxSelection = true;
            columns.push({
              field: '_action',
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
          //load column state from store
          if (settings.value.models[this.model]) {
            this.columnApi.applyColumnState({ state: settings.value.models[this.model] });
          }
          resolve();
        });
      });
    },
    baseFormatter(params) {
      //check if custom formatting exists
      const relationName = this.relations[params.colDef.field]?.table_name;
      const schema = this.$meta.find((c) => c.title == relationName);
      if (relationName && schema?.formatter.length) {
        let formatted = '';
        const related = this.relations[params.colDef.field].entities.find((c) => c.id == params.value);
        if (related) {
          for (const key of schema.formatter) {
            formatted += `${related[key]} `;
          }
        }
        return formatted;
      }
      return params.value;
    },
    onGridReady(params) {
      this.gridApi = params.api;
      this.columnApi = params.columnApi;
      this.$http({ method: 'GET', url: `/v1/resource/models` }).then(async (res) => {
        this.models = res.data;
        if (this.$route.query.relation) {
          this.model = this.$route.query.relation;
          await this.onModelUpdate();
          if (this.$route.query.id) {
            this.gridApi.forEachNode((node) => {
              if (node.data.id == this.$route.query.id) {
                node.setSelected(true);
              }
            });
          }
        } else {
          //load lastmodel from store
          this.model = settings.value.lastModel;
          await this.onModelUpdate();
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
      this.$emitter.on('edit-schema', (evt) => {
        //rewrite schema
        const schemaIndex = this.$meta.findIndex((c) => c.title == evt.schema.title);
        this.$meta.splice(schemaIndex, 1, evt.schema);
        this.trigger++;
      });
      this.$emitter.on('edit-entry', (evt) => {
        const rowNode = this.gridApi.getRowNode(evt.id);
        rowNode.setData(evt);
      });
    },
  },
};
</script>
