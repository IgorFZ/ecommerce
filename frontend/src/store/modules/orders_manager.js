import axios from 'axios';

const BASE_URL = "http://127.0.0.1:3000/"

const AUTH = {
    headers: {
        authorization: localStorage.auth_token,
    },
};

const state = {
    cart: [],
    orders: []
}

const getters = {
    getCart(state) {
        return state.cart;
    },
    getOrders(state) {
        return state.orders;
    },
}

const actions = {
    addProductToCart({ commit }, payload) {
        const config = {
            headers: {
                authorization: localStorage.auth_token
            },
            params: payload,
        }
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}add`, config)
            .then((response) => {
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
    getUserCart({ commit }) {
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}cart`, AUTH)
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
                reject(error);
            });
        });
    },
    checkoutCart({ commit }) {
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}/checkout`, AUTH)
            .then((response) => {
                window.location.href = response.data.url;
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
    getUserOrders({ commit }) {
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}orders`, AUTH)
            .then((response) => {
                commit("setOrders", response);
                console.log(response.data)
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
    setOrders(state, data) {
        state.orders = data.data;
    },
}

export default {
    state,
    getters,
    actions,
    mutations,
}