import axios from 'axios';

const BASE_URL = "http://127.0.0.1:3000/"

const AUTH = {
    headers: {
        authorization: localStorage.auth_token,
    },
};

const state = {
    cart: [],
    orders: [],
    coupon: {
        id: null,
        code: null,
        stripe_coupon_id: null,
        amount_off: null,
        percent_off: null,
    },
}

const getters = {
    getCart(state) {
        return state.cart;
    },
    getOrders(state) {
        return state.orders;
    },
    getCoupon(state) {
        return state.coupon;
    }
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
                commit("setCart", response);
                resolve(response.data);
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
    checkoutCart({ commit }, payload) {
        const config = {
            headers: {
                authorization: localStorage.auth_token
            },
            params: payload,
        }
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}/checkout`, config)
            .then((response) => {
                window.location.href = response.data.url;
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
    checkCoupon( { commit }, payload){
        const config = {
            params: payload,
        }
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}/coupon`, config)
            .then((response) => {
                if (response.data.coupon != null) {
                    commit("setCoupon", response);    
                }
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },

    removeCoupon({ commit }) {
        const response = {
            data: {
                coupon: {
                    id: null,
                    code: null,
                    stripe_coupon_id: null,
                    amount_off: null,
                    percent_off: null,
                }
            }
        }
        commit("setCoupon", response);
    },

    getUserOrders({ commit }) {
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}orders`, AUTH)
            .then((response) => {
                commit("setOrders", response);
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
    setCoupon(state, data) {
        console.log(data.data)
        state.coupon = data.data.coupon;
    },
}

export default {
    state,
    getters,
    actions,
    mutations,
}