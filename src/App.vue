

<template>
    <div>
        <ThemeSwitcher />
      <router-link to="/">Home</router-link> | 
      <router-link to="/about">About</router-link>
      
      <router-view></router-view> <!-- To tutaj renderowane będą strony -->
    </div>
  </template>
  
  <script>
  export default {
    name: 'App'
  };
  </script>
  