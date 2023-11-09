import { defineStore } from 'pinia';

export const useStore = defineStore('main', {
  state: () => ({
    settings: {
      lastModel: '',
      models: {},
    },
  }),
  actions: {
    updateSettings(partialSettings: any) {
      this.settings = {
        ...this.settings,
        ...partialSettings,
      };
    },
  },
  persist: true,
});
