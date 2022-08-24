import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'login',
            component: () =>import('../views/login/Index.vue')
        },
        {
            path: '/submit',
            name: 'submit',
            component: () =>import('../views/submit/Index.vue')
        },
        {
            path: '/home',
            name: 'home',
            component: () =>import('../views/home/Index.vue'),
            children:[
                {
                    path: '/index',
                    name:'index',
                    component:() =>import('../views/index/Index.vue')
                }
            ]
        },
        
    ]
})