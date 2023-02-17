import axios from 'axios';

const BASE_URL = "http://127.0.0.1:3000/"

const state = {
    product: [],
    products: [],
    category: "",
}

const getters = {
    getProducts(state) {
        return state.products;
    },
    getProduct(state) {
        return state.product;
    },
    getCategory(state) {
        return state.category;
    },
}

const actions = {
    getAllProducts({ commit }, payload) {
        const config = {
            params: {
                name: payload['name'],
                mode: payload['mode'],
                direction: payload['direction'],
                limit: payload['limit'],
            }
        }
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}products/`, config)
            .then((response) => {
                commit("setProducts", response);
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
    getProductById({ commit }, payload) {
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}products/${payload}`)
            .then((response) => {
                commit("setProduct", response);
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
    getCategoryById({ commit }, payload) {
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}categories/${payload}`)
            .then((response) => {
                commit("setCategory", response);
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
}

const mutations = {
    setProducts(state, data) {
        state.products = data.data;
    },
    setProduct(state, data) {
        state.product = data.data;
    },
    setCategory(state, data) {
        state.category = data.data;
    },
}

export default {
    state,
    getters,
    actions,
    mutations,
}