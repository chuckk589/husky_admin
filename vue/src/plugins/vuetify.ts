// Styles
import '@mdi/font/css/materialdesignicons.css';
import 'vuetify/styles';

// Vuetify
import { createVuetify } from 'vuetify';

export default createVuetify({
  defaults: {
    VSelect: {
      density: 'compact',
    },
    VAutocomplete: {
      density: 'compact',
    },
    VInput: {
      density: 'compact',
    },
    VBtn: {
      size: 'small',
    },
  },
});
// https://vuetifyjs.com/en/introduction/why-vuetify/#feature-guides
