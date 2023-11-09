<template>
  <div ref="jsoneditor" class="h-100"></div>
</template>

<script>
import JSONEditor from 'jsoneditor';
import 'jsoneditor/dist/jsoneditor.css';

export default {
  name: 'JsonEditor',
  emits: ['update:modelValue'],
  props: {
    modelValue: {
      type: [Object, Array],
      default: null,
    },
  },
  data() {
    return {
      jsoneditor: null,
    };
  },
  watch: {
    modelValue: {
      handler(value) {
        this.jsoneditor?.update(value);
      },
    },
  },
  mounted() {
    this.jsoneditor = new JSONEditor(this.$refs.jsoneditor, {
      mode: 'tree',
      onChangeJSON: this.onChangeJSON,
    });
    this.jsoneditor.update(this.modelValue);
  },
  methods: {
    onChangeJSON(value) {
      this.$emit('update:modelValue', value);
    },
  },
  beforeUnmount() {
    this.jsoneditor.destroy();
  },
};
</script>
