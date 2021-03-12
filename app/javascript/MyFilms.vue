<template>
<section class="flex justify-center pt-6">
  <ul class="flex flex-wrap justify-center">
    <li v-for="film in films" :key="film.id" class="w-40 h-52 bg-red-100 m-1">
      <img class="object-contain" src="https://images-na.ssl-images-amazon.com/images/I/91ebheNmoUL._RI_.jpg" />
    </li>
    <li class="w-40 h-52 bg-gray-100 bg-opacity-10 hover:bg-opacity-20 m-1 flex justify-center items-center">
      <router-link to="/" class="text-gray-50">+ Add new movie</router-link>
    </li>
  </ul>
</section>
</template>

<script>
export default {
  data: function() {
    return {
      films: [{id: 1}, {id: 2}, {id: 3}, {id: 4}, {id: 5}, {id: 6}, {id: 7}, {id: 8}, {id: 9}],
    };
  }
};
</script>
