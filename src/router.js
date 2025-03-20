import { createRouter, createWebHistory } from 'vue-router';
import HomePage from './pages/Home.vue';
import AboutPage from './pages/About.vue';

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomePage
  },
  {
    path: '/about',
    name: 'about',
    component: AboutPage
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
