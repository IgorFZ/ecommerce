import { createStore } from 'vuex'
import sessionManager from '../store/modules/session_manager'
import postsManager from '../store/modules/posts_manager'

const store = createStore({
    modules: {
        sessionManager,
        postsManager,
    }
})

export default store