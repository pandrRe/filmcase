<template>
<section class="flex justify-center pt-6">
  <section v-if="film" class="flex space-x-4 align-center">
    <img class="w-60 h-80" :src="film.url">
    <div class="my-auto">
      <div class="p-1 flex space-x-1 justify-between">
        <div>
          <label for="filmTitle" class="text-gray-50">Title: </label><br>
          <input id="filmTitle" type="text" v-model="film.title">
        </div>

        <div>
          <label for="filmYear" class="text-gray-50">Year: </label><br>
          <input id="filmYear" type="number" v-model="film.year">
        </div>
      </div>
      <div class="p-1 flex space-x-1 justify-between">
        <div class="w-full">
          <label for="filmSynopsis" class="text-gray-50">Synopsis: </label><br>
          <textarea id="filmSynopsis" class="w-full" v-model="film.synopsis"></textarea>
        </div>  
      </div>
      <div class="p-1 flex space-x-1 justify-between">
        <div>
          <div>
            <label for="filmRating" class="text-gray-50">Rating: </label><br>
            <input id="filmRating" type="number" min="1" max="5" v-model="film.rating">
          </div>
        </div>
        <div class="w-full">
          <label for="filmDirector" class="text-gray-50">Director: </label><br>
          <select id="filmDirector" class="w-full">
            <option v-for="director in directors" :key="director.id" :selected="film.director_id === director.id">
              {{ director.surname }}, {{ director.name }}
            </option>
          </select>
        </div>
      </div>
      <div class="p-1 w-full">
        <label for="filmUrl" class="text-gray-50">Poster URL: </label><br>
        <input id="filmUrl" type="text" class="w-full" v-model="film.url">
      </div>
    </div>
  </section>
  <section class="text-gray-50" v-else>...</section>
</section>
</template>

<script>
import request from 'superagent';

export default {
  data: function() {
    return {
      film: null,
      directors: [],
    };
  },
  created: function() {
    request.get(`/api/films/${this.$route.params.id}`)
      .then(res => this.film = res.body);
    request.get('/api/directors').then(res => this.directors = res.body)
  }
};
</script>
