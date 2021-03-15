<template>
<section class="flex justify-center pt-6">
  <section v-if="film" class="flex space-x-4 align-center">
    <img v-if="film.url" class="w-60 h-80" :src="film.url">
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
          <select id="filmDirector" class="w-full" v-model="film.director_id">
            <option disabled selected :value="null">Choose a director...</option>
            <option v-for="director in directors" :key="director.id" :selected="film.director_id === director.id" :value="director.id">
              {{ director.surname }}, {{ director.name }}
            </option>
          </select>
        </div>
      </div>
      <div class="p-1 w-full">
        <label for="filmUrl" class="text-gray-50">Poster URL: </label><br>
        <input id="filmUrl" type="text" class="w-full" v-model="film.url">
      </div>
      <div class="p-1 w-full">
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" @click="goBack">Back</button>
        <div class="float-right">
          <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded" @click="submitCreate">Create</button>
        </div>
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
      film: {
        title: null,
        year: null,
        synopsis: null,
        rating: null,
        director_id: null,
        url: null,
      },
      directors: [],
    };
  },
  created: function() {
    request.get('/api/directors').then(res => this.directors = res.body)
  },
  methods: {
    goBack: function() {
      this.$router.go(-1);
    },
    submitCreate: function() {
      request.post(`/api/films`)
        .set('X-CSRF-Token', this.$CSRF)
        .send({
          film: this.film
        })
        .then(res => {
          alert(`Film #${res.body.id} added to database.`);
          this.$router.push("/");
        });
    }
  }
};
</script>
