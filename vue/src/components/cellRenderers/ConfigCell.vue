<template>
  <div class="d-flex justify-center">
    <v-btn density="compact" class="ma-2" variant="text" icon="mdi-pencil" @click="edit"></v-btn>
  </div>
</template>

<script>
export default {
  name: 'ConfigCell',
  data() {
    return {};
  },
  methods: {
    edit() {
      this.$emitter.emit('openModal', {
        url: `/configs/${this.params.data.id}`,
        method: 'PATCH',
        header: this.params.data.name,
        eventName: 'edit-config',
        fields: [
          {
            key: 'value',
            label: 'Значение',
            type: 'textarea',
            value: this.params.data.value,
          },
          {
            key: 'description',
            label: 'Описание',
            type: 'textarea',
            value: this.params.data.description,
          },
        ],
      });
    },
  },
};
</script>
