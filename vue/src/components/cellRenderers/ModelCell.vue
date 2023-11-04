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
        model: this.params.model,
        relations: this.params.relations,
        fields: this.composeFields(),
      });
    },
    composeFields() {
      const keys = Object.keys(this.params.relations);
      console.log(this.params.data);
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
        .filter((c) => c.key !== 'id' && c.key !== 'action');
    },
  },
};
</script>
