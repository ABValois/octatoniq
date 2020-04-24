
<template>
    <body>
        <div id="app">
            <div>
                <b-navbar toggleable="lg" type="dark" variant="primary">
                    <b-navbar-brand v-on:click="changePage('/')">
                        <img alt="Octatoniq" src="./assets/logo.png" width="100" height="100" class="logo">
                    </b-navbar-brand>
                    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
                    <b-collapse id="nav-collapse" is-nav>
                        <b-navbar-nav>
                            <b-nav-item v-on:click="changePage('/about')">About</b-nav-item>
                            <b-nav-item-dropdown text="Games" right>
                                    <b-dropdown-item v-on:click="changePage('/games/picnic')">Picnic!</b-dropdown-item>
                                    <b-dropdown-item v-on:click="changePage('/games/perennial')">Perennial</b-dropdown-item>
                            </b-nav-item-dropdown>
                            <b-nav-item-dropdown text="Music" right>
                                    <b-dropdown-item v-on:click="changePage('/music/marimba')">Marimba Solos</b-dropdown-item>
                            </b-nav-item-dropdown>
                            <b-nav-item-dropdown text="Technology" right>
                                    <b-dropdown-item v-on:click="changePage('/technology/thissite')">This Site</b-dropdown-item>
                                    <b-dropdown-item v-on:click="changePage('/technology/career')">Career</b-dropdown-item>
                            </b-nav-item-dropdown>
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
.logo:hover {
  opacity: 0.7;
}
</style>
