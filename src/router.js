import { createRouter, createWebHistory } from 'vue-router';
import About from './pages/Documents.vue';
import TopBar from './components/TopBar.vue';
import Documents from './pages/Documents.vue';

const routes = [
 
  {
    path: '/documents',
    name: 'Documents',
    component: Documents
  },
 
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
