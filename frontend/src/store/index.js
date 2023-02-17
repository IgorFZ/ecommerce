import { createStore } from 'vuex'
import sessionManager from '../store/modules/session_manager'
import postsManager from '../store/modules/posts_manager'
import productsManager from '../store/modules/products_manager'

const store = createStore({
    modules: {
        sessionManager,
        postsManager,
        productsManager,
    }
})

export default store