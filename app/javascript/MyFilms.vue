<template>
<section>
  <section class="w-full flex justify-center space-x-1 pt-2">
    <input type="text" class="p-2 rounded-l" placeholder="Search by name..." v-model="nameQuery">
    <select id="filmDirector" class="rounded-r" v-model="directorQuery">
      <option :value="null">Search by director...</option>
      <option v-for="director in directors" :key="director.id" :selected="directorQuery === director.id" :value="director.id">
        {{ director.surname }}, {{ director.name }}
      </option>
    </select>
  </section>
  <section class="flex justify-center pt-6">
    <ul class="flex flex-wrap justify-center">
      <li v-for="film in filteredFilms" :key="film.id" class="w-40 h-52 bg-red-100 m-1 bg-cover bg-no-repeat" :style="{backgroundImage: `url('${film.url}')`}">
        <router-link :to="filmLink(film.id)">
          <div class="w-40 h-52 bg-gray-900 bg-opacity-0 text-opacity-0 hover:bg-opacity-50 hover:text-opacity-100 flex justify-center items-center text-gray-50 text-center">
            {{ film.title }}<br>
            ({{ film.year }})
          </div>
        </router-link>
      </li>
      <li class="w-40 h-52 bg-gray-100 bg-opacity-10 hover:bg-opacity-20 m-1">
        <router-link to="/film/create" class="text-gray-50 w-full h-full flex justify-center items-center">+ Add new movie</router-link>
      </li>
    </ul>
  </section>
  <section class="w-full flex justify-center align-end space-x-1 pt-2">
    <input type="text" class="rounded-l" placeholder="Name" v-model="newDirector.name">
    <input type="text" placeholder="Surname" v-model="newDirector.surname">
    <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-r" @click="addDirector">Add Director</button>
  </section>
</section>
</template>

<script>
import request from 'superagent';

export default {
  data: function() {
    return {
      films: [],
      directors: [],
      nameQuery: null,
      directorQuery: null,
      newDirector: {
        name: "",
        surname: ""
      }
    };
  },
  methods: {
    filmLink(id) {
      return `/film/${id}`;
    },
    addDirector: function() {
      request.post(`/api/directors`)
        .set('X-CSRF-Token', this.$CSRF)
        .send({
          director: this.newDirector
        })
        .then(res => {
          alert(`Director #${res.body.id} added to database.`);
          this.newDirector = { name: "", surname: "" };
          this.directors.push(res.body);
        });          this.$router.push("/");
    }
  },
  computed: {
    filteredFilms: function() {
      return this.films
        .filter(film => this.directorQuery === null || film.director_id === this.directorQuery)
        .filter(film => this.nameQuery === null || film.title.toLowerCase().includes(this.nameQuery.toLowerCase()));
    }
  },
  created: function() {
    if (this.$route.query.director_id) {
      this.directorQuery = Number(this.$route.query.director_id);
    }

    request.get('/api/films').then(res => {
      this.films = res.body;
    });
    request.get('/api/directors').then(res => this.directors = res.body)
  },
};
</script>
