<template>
<section class="flex justify-center pt-6">
  <section v-if="film" class="flex space-x-4 align-center">
    <div class="flex flex-col">
      <img class="w-60 h-80" :src="film.url">
      <small v-if="selectedDirector" class="text-center text-gray-50">Directed by
        <router-link class="text-blue-400 hover:text-blue-600" :to="{ name: 'index', query: { director_id: selectedDirector.id }}">
          {{ selectedDirector.name }} {{ selectedDirector.surname }}
        </router-link>
      </small>
    </div>
    <div class="my-auto">
      <div class="p-1 flex space-x-1">
        <div class="flex-grow">
          <label for="filmTitle" class="text-gray-50">Title: </label><br>
          <input id="filmTitle" type="text" class="w-full" v-model="film.title">
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
          <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" @click="deleteFilm">Delete</button>
          <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded" @click="submitEdit">Edit</button>
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
      film: null,
      directors: [],
    };
  },
  created: function() {
    request.get(`/api/films/${this.$route.params.id}`)
      .then(res => this.film = res.body);
    request.get('/api/directors').then(res => this.directors = res.body)
  },
  computed: {
    selectedDirector: function() {
      return this.directors.find((director) => this.film.director_id === director.id);
    },
  },
  methods: {
    goBack: function() {
      this.$router.go(-1);
    },
    submitEdit: function() {
      request.put(`/api/films/${this.film.id}`)
        .set('X-CSRF-Token', this.$CSRF)
        .send({
          film: {
            title: this.film.title,
            year: this.film.year,
            synopsis: this.film.synopsis,
            director_id: this.film.director_id,
            rating: this.film.rating,
            url: this.film.url,
          }
        })
        .then(_ => {
          alert('Film updated in database.');
          this.$router.push("/");
        });
    },
    deleteFilm: function() {
      if (confirm(`Are you sure you want to delete ${this.film.title}?`)) {
        request.delete(`/api/films/${this.film.id}`)
          .set('X-CSRF-Token', this.$CSRF)
          .then(res => {
            alert(`Deleted film #${res.body.id}.`);
            this.$router.push("/");
          });
      }
    }
  }
};
</script>
