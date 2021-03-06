import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import AdminPage from '../views/AdminPage.vue'
import BrewerPage from '../views/BrewerPage.vue'
import BeerLoverPage from '../views/BeerLoverPage.vue'
import ReviewForm from '../components/ReviewForm.vue'
import BreweryPage from '../views/BreweryPage.vue'
import AllBeers from '../views/AllBeers.vue'
import AllBreweries from '../views/AllBreweries.vue'

import BeerPage from '../views/BeerPage.vue'
Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/admin",
      name: "admin",
      component: AdminPage,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/brewer",
      name: "brewer",
      component: BrewerPage,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/beerlover",
      name: "beerlover",
      component: BeerLoverPage,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/reviews",
      name: "reviews",
      component: ReviewForm,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/beerpage",
      name: "beerpage",
      component: BeerPage,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/brewerypage',
      name: 'brewerypage',
      component: BreweryPage,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/beers',
      name: 'allbeers',
      component: AllBeers,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/breweries',
      name: 'allbreweries',
      component: AllBreweries,
      meta: {
        requiresAuth: false
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
