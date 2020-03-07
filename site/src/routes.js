import Home from './components/Home.vue'
import Picnic from './components/Picnic.vue'
import Perennial from './components/Perennial.vue'


const routes = [   
    { path: '/', component: Home },
    { path: '/games/picnic', component: Picnic },
    { path: '/games/perennial', component: Perennial }
];

export default routes;