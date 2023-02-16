import { createStore } from 'vuex'
import sessionManager from '../store/modules/session_manager'

const store = createStore({
    modules: {
        sessionManager,
    }
})

export default store