<template>
    <body>
        <div id="app">
            <div>
                <b-navbar toggleable="lg" type="dark" variant="purple">
                    <b-navbar-brand v-on:click="changePage('/')">Octatoniq</b-navbar-brand>
                    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
                    <b-collapse id="nav-collapse" is-nav>
                        <b-navbar-nav>
                            <b-nav-item v-on:click="changePage('/games/picnic')">Games</b-nav-item>
                        </b-navbar-nav>
                    </b-collapse>
                </b-navbar>

                <router-view/>
            </div>
        </div>
    </body>
</template>

<script>
export default {
    methods: {
        changePage(newPage) {
            this.$router.push(newPage)
        }
    }
}
</script>

<style>
.bg-purple {
    background-color: #6141c4;
}
body, html {
  padding: 0;
  margin: 0;
  width: 100%;
  min-height: 100vh;
}
body {
  background-color: #856cd8;
}
</style>