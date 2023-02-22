import axios from 'axios';

const BASE_URL = "http://127.0.0.1:3000/"

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
            .get(`${BASE_URL}order`, config)
            .then((response) => {
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
            .get(`${BASE_URL}order/${payload}`)
            .then((response) => {
                commit("setCart", response);
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
    removeItemOrder({ commit }, payload) {
        new Promise((resolve, reject) => {
            axios
            .delete(`${BASE_URL}/order_items/${payload}`)
            .then((response) => {
                resolve(response.data);
            })
            .catch((error) => {
                console.log(error)
                reject(error);
            });
        });
    },
    checkoutCart({ commit }) {
        const config = {
            headers: {
              authorization: localStorage.auth_token,
            },
        };
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}/checkout`, config)
            .then((response) => {
                window.location.href = response.data.url;
                resolve(response.data);
            })
            .catch((error) => {
                console.log(error)
                reject(error);
            });
        });
    }
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