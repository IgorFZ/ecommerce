import { createStore } from 'vuex'
import createPersistedState from "vuex-persistedstate";
import sessionManager from '../store/modules/session_manager'
import postsManager from '../store/modules/posts_manager'
import productsManager from '../store/modules/products_manager'
import ordersManager from '../store/modules/orders_manager'

const store = createStore({
    plugins: [createPersistedState()],
    modules: {
        sessionManager,
        postsManager,
        productsManager,
        ordersManager,
    }
})

export default store