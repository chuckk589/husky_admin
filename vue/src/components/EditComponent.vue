<template>
  <v-navigation-drawer :model-value="show" @update:modelValue="close" location="right" temporary style="width: unset">
    <div class="d-flex h-100">
      <div class="h-100">
        <v-expand-x-transition v-show="expand">
          <AgGridVue
            :style="'width: ' + remainingWidth + 'px'"
            class="ag-theme-alpine h-100"
            animateRows
            suppressCellFocus
            :get-row-id="getRowId"
            pagination
            :defaultColDef="defaultColDef"
            @grid-ready="onGridReady"
            :onRowClicked="onRowClicked"
          >
          </AgGridVue>
        </v-expand-x-transition>
      </div>
      <div>
        <v-card-title>{{ payload.header }}</v-card-title>
        <v-card-text style="min-width: 500px">
          <template v-for="(field, index) in payload.fields">
            <v-textarea v-if="field.type == 'textarea'" :key="'t' + index" :label="field.label || field.key" density="comfortable" :hint="field.hint" v-model="field.value" />
            <v-select v-else-if="field.type == 'select'" :key="'s' + index" :label="field.label || field.key" density="comfortable" v-model="field.value" :hint="field.hint" :items="field.options" />
            <v-text-field v-else-if="field.type == 'date'" type="date" density="comfortable" :key="'d' + index" :label="field.label || field.key" :hint="field.hint" v-model="field.value" />
            <JsonEditor v-else-if="field.type == 'json'" :key="'j' + index" v-model="field.value"></JsonEditor>
            <v-text-field
              v-else
              density="comfortable"
              :key="'r' + index"
              :label="field.label || field.key"
              :hint="field.hint"
              v-model="field.value"
              :append-inner-icon="field.relation ? 'mdi-table-arrow-left' : ''"
              @click:append-inner="field.relation ? relationHandler(field.key, $event) : null"
            >
            </v-text-field>
          </template>
        </v-card-text>
        <v-card-actions class="mt-auto">
          <v-btn variant="elevated" v-if="!payload.noSave" class="ml-auto" color="primary" @click="save">Сохранить</v-btn>
          <v-btn variant="elevated" color="primary" @click="close">Отмена</v-btn>
        </v-card-actions>
      </div>
    </div>
  </v-navigation-drawer>
</template>
<script>
import { AgGridVue } from 'ag-grid-vue3';
import JsonEditor from './JsonEditor.vue';
export default {
  components: {
    AgGridVue,
    JsonEditor,
  },
  name: 'EditComponent',
  data() {
    return {
      expand: false,
      payload: {},
      gridApi: null,
      show: false,
      currentRelation: null,
      defaultColDef: {
        sortable: true,
        filter: 'agTextColumnFilter',
        floatingFilter: true,
      },
    };
  },
  computed: {
    remainingWidth() {
      return document.body.clientWidth - 17 - 500;
    },
  },
  created() {
    this.$emitter.on('openModal', (evt) => {
      this.show = true;
      this.payload = evt;
    });
  },
  beforeUnmount() {
    this.$emitter.off('openModal');
  },
  methods: {
    close() {
      this.expand = false;
      this.show = false;
    },
    getRowId(params) {
      return params.data.id;
    },
    onGridReady(params) {
      this.gridApi = params.api;
    },
    onRowClicked(row) {
      this.payload.fields.forEach((field) => {
        if (field.key == this.currentRelation) {
          field.value = row.data.id;
        }
      });
    },
    relationHandler(relation) {
      this.expand = !this.expand;
      this.currentRelation = relation;
      if (this.expand) {
        const columns = [];
        if (this.payload.relations[relation].entities.length) {
          const columnKeys = Object.keys(this.payload.relations[relation].entities[0]);
          for (const key of columnKeys) {
            columns.push({
              field: key,
              headerName: key,
            });
          }
        }
        this.gridApi.setColumnDefs(columns);
        this.gridApi.setRowData(this.payload.relations[relation].entities);
        this.gridApi.redrawRows();
      }
    },
    save() {
      this.$http({
        method: this.payload.method,
        url: `/v1${this.payload.url}`,
        data: this.payload.fields.reduce(
          (s, c) => {
            if (c.key) {
              s[c.key] = c.value;
            }
            return s;
          },
          { model: this.payload.model },
        ),
      }).then((res) => {
        this.payload.eventName && this.$emitter.emit(this.payload.eventName, res.data);
        this.close();
      });
    },
  },
};
</script>
<style>
.dialog-bottom-transition-enter-active,
.dialog-bottom-transition-leave-active {
  transition: transform 0.3s ease-in-out;
}
</style>
