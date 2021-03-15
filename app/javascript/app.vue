<template>
  <div id="app">
    <header class="bg-gray-900 px-2 py-3">
      <p class="text-xl text-gray-50">filmcase</p>
    </header>
    <router-view></router-view>
  </div>
</template>

<style>
@import "tailwindcss/base";
@import "tailwindcss/components";
@import "tailwindcss/utilities";

input, select, option, textarea {
  @apply p-2;
}
</style>
