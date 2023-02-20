import axios from 'axios';

const BASE_URL = "http://127.0.0.1:3000/order"

const state = {
    cart: []
}

const getters = {
    getCart(state) {
        return state.cart;
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
                commit("", response);
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
    getCartOrder({ commit }, payload) {
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}/${payload}`)
            .then((response) => {
                commit("setCart", response);
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
}

const mutations = {
    setCart(state, data) {
        state.cart = data.data;
    },
}

export default {
    state,
    getters,
    actions,
    mutations,
}