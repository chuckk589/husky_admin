import { createRouter, createWebHistory } from 'vue-router';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Home',
      component: () => import('../components/Container.vue'),
      redirect: '/models',
      children: [
        {
          path: 'models',
          name: 'models',
          component: () => import('../views/Models.vue'),
        },

        {
          path: 'settings',
          name: 'settings',
          component: () => import('../views/Settings.vue'),
        },
      ],
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/Login.vue'),
    },
  ],
});

export default router;
