import VueRouter from 'vue-router';
import MyFilms from './MyFilms.vue';
import Film from './Film.vue';

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/film/:id', component: Film },
    { path: '*', component: MyFilms },
  ],
});

export default router;
