<template>
  <div class="d-flex justify-center">
    <v-btn density="compact" class="ma-2" variant="text" icon="mdi-pencil" @click="edit"></v-btn>
  </div>
</template>

<script>
export default {
  name: 'ModelCell',
  data() {
    return {};
  },
  methods: {
    edit() {
      this.$emitter.emit('openModal', {
        url: `/resource/${this.params.data.id}`,
        method: 'PATCH',
        header: `${this.params.model} ${this.params.data.id}`,
        eventName: 'edit-entry',
        relations: this.params.relations,
        fields: this.composeFields(),
        hidden: [{ key: '_model', value: this.params.model }],
      });
    },
    composeFields() {
      const keys = Object.keys(this.params.relations);
      return Object.keys(this.params.data)
        .map((key) => {
          if (keys.includes(key)) {
            return {
              key: key,
              label: key,
              value: this.params.data[key],
              relation: true,
            };
          } else {
            return {
              key: key,
              label: key,
              value: this.params.data[key],
            };
          }
        })
        .filter((c) => c.key !== 'id' && c.key !== '_action');
    },
  },
};
</script>
