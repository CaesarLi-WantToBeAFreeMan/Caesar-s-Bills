<template>
    <nav>
        <router-link :to = "{name: 'billList'}">list</router-link>
        <router-link :to = "{name: 'billCreate'}">create</router-link>
    </nav>
    <router-view></router-view>
</template>

<script>
    export default{
        name: "App"
    };
</script>

<style scoped>
    nav{
        padding: 5px 10px;
        font-size: 30px;
        margin: 0 auto;
        background-color: rgba(224, 219, 175, 0.7);
        display: flex;
        justify-content: center;
        justify-items: center;
        align-content: center;
        align-items: center;
        column-gap: 30px;
        border-radius: 12px;
    }

    nav a{
        font-weight: bold;
        color: white;
        padding: 5px 10px;
        text-decoration: none;
    }

    nav a.router-link-exact-active{
        color: cyan;
        background-color: orange;
        border-radius: 50px;
    }
</style>