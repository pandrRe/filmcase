import VueRouter from 'vue-router';
import MyFilms from './MyFilms.vue';
import Film from './Film.vue';
import CreateFilm from './CreateFilm.vue';

const router = new VueRouter({
  mode: 'history',
  routes: [
    { path: '/film/create', component: CreateFilm },
    { path: '/film/:id', component: Film },
    { path: '/', name: 'index', component: MyFilms },
    { path: '*', component: MyFilms },
  ],
});

export default router;
