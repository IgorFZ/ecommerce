import axios from 'axios';

const BASE_URL = "http://127.0.0.1:3000/order"

const state = {
    order: []
}

const getters = {
    getOrder(state) {
        console.log(state.order)
        return state.order;
    },
}

const actions = {
    addProductToCart({ commit }, payload) {
        const config = {
            params: payload,
        }
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}`, config)
            .then((response) => {
                commit("setPost", response);
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
}

const mutations = {
    setPosts(state, data) {
        state.posts = data.data;
    },
    setPost(state, data) {
        state.post = data.data;
    },
}

export default {
    state,
    getters,
    actions,
    mutations,
}