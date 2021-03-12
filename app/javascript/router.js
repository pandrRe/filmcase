import VueRouter from 'vue-router';
import MyFilms from './MyFilms.vue';

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '*', component: MyFilms }
  ],
});

export default router;
