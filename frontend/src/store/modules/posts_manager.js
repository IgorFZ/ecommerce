import axios from 'axios';

const BASE_URL = "http://127.0.0.1:3000/posts"

const state = {
    post: [],
    posts: [],
}

const getters = {
    getPosts(state) {
        return state.posts;
    },
    getPost(state) {
        console.log(state.post)
        return state.post;
    },
}

const actions = {
    getAllPosts({ commit }, payload) {
        const config = {
            params: {
                title: payload['title'],
                direction: payload['direction']
            }
        }
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}`, config)
            .then((response) => {
                commit("setPosts", response);
                resolve(response.data);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
    getPostById({ commit }, payload) {
        new Promise((resolve, reject) => {
            axios
            .get(`${BASE_URL}/${payload}`)
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