<template>
  <div ref="jsoneditor"></div>
</template>

<script>
import JSONEditor from 'jsoneditor';
import 'jsoneditor/dist/jsoneditor.css';

export default {
  name: 'JsonEditor',
  data() {
    return {
      jsoneditor: null,
    };
  },
  mounted() {
    this.jsoneditor = new JSONEditor(this.$refs.jsoneditor, {
      mode: 'tree',
      onChangeJSON: this.onChangeJSON,
    });
  },
  methods: {
    onChangeJSON() {
      this.$emit('update:json', this.jsoneditor.get());
    },
  },
  beforeUnmount() {
    this.jsoneditor.destroy();
  },
};
</script>
