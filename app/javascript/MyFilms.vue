<template>
<section class="flex justify-center pt-6">
  <ul class="flex flex-wrap justify-center">
    <li v-for="film in films" :key="film.id" class="w-40 h-52 bg-red-100 m-1 bg-cover bg-no-repeat" :style="{backgroundImage: `url('${film.url}')`}">
      <router-link :to="filmLink(film.id)">
        <div class="w-40 h-52 bg-gray-900 bg-opacity-0 text-opacity-0 hover:bg-opacity-50 hover:text-opacity-100 flex justify-center items-center text-gray-50 text-center">
          {{ film.title }}<br>
          ({{ film.year }})
        </div>
      </router-link>
    </li>
    <li class="w-40 h-52 bg-gray-100 bg-opacity-10 hover:bg-opacity-20 m-1">
      <router-link to="/" class="text-gray-50 w-full h-full flex justify-center items-center">+ Add new movie</router-link>
    </li>
  </ul>
</section>
</template>

<script>
import request from 'superagent';

export default {
  data: function() {
    return {
      films: [],
    };
  },
  methods: {
    filmLink(id) {
      return `/film/${id}`;
    }
  },
  created: function() {
    request.get('/api/films').then(res => {
      this.films = res.body;
    });
  }
};
</script>
