import Home from './components/Home.vue'
import NotFound from './components/NotFound.vue'
import About from './components/About.vue'
import Picnic from './components/Picnic.vue'
import Perennial from './components/Perennial.vue'
import Marimba from './components/Marimba.vue'
import ThisSite from './components/ThisSite.vue'
import Career from './components/Career.vue'


const routes = [   
    { path: '/', component: Home },
    { path: '/about', component: About },
    { path: '/games/picnic', component: Picnic },
    { path: '/games/perennial', component: Perennial },
    { path: '/music/marimba', component: Marimba },
    { path: '/technology/thissite', component: ThisSite },
    { path: '/technology/career', component: Career },
    { path: '*', component: NotFound }
];

export default routes;