import axios from 'axios';

const BASE_URL = "http://localhost:3000/"

const state = {
    auth_token: null,
    user: {
        id: null,
        email: null,
        full_name: null,
    },
}

const getters = {
    getAuthToken(state) {
        return state.auth_token;
    },
    getUserEmail(state) {
        return state.user?.email;
    },
    getUserID(state) {
        return state.user?.id;
    },
    getUserName(state) {
      return state.user?.full_name;
  },
    isLoggedIn(state) {
        const loggedOut = state.auth_token == null || state.auth_token == JSON.stringify(null);
        return !loggedOut;
    },
}

const actions = {
    registerUser({ commit }, payload) {
        console.log("Payload:")
        console.log(payload)
        return new Promise((resolve, reject) => {
          axios
            .post(`${BASE_URL}users`, payload)
            .then((response) => {
              commit("setUserInfoFromToken", response);
              resolve(response);
            })
            .catch((error) => {
              reject(error);
            });
        });
    },
    editUserInfo({ commit }, payload) {
      return new Promise((resolve, reject) => {
        axios
          .put(`${BASE_URL}users/${payload.id}`, payload)
          .then((response) => {
            commit("setUserInfoFromToken", response);
            resolve(response);
          })
          .catch((error) => {
            reject(error);
          });
      });
    },
    loginUser({ commit }, payload) {
        new Promise((resolve, reject) => {
            axios
            .post(`${BASE_URL}users/sign_in`, payload)
            .then((response) => {
                commit("setUserInfo", response);
                resolve(response);
            })
            .catch((error) => {
                reject(error);
            });
        });
    },
    logoutUser({ commit }) {
        const config = {
          headers: {
            authorization: state.auth_token,
          },
        };
        new Promise((resolve, reject) => {
          axios
            .delete(`${BASE_URL}users/sign_out`, config)
            .then(() => {
              commit("resetUserInfo");
              resolve();
            })
            .catch((error) => {
              reject(error);
            });
        });
    },
    loginUserWithToken({ commit }, payload) {
        const config = {
          headers: {
            authorization: payload.auth_token,            
          },
        };
        new Promise((resolve, reject) => {
          axios
            .get(`${BASE_URL}member-data`, config)
            .then((response) => {
              commit("setUserInfoFromToken", response);
              resolve(response);
            })
            .catch((error) => {
              commit("resetUserInfo");
              reject(error);
            });
        });
      },
}

const mutations = {
    setUserInfo(state, data) {
        state.user = data.data.user;
        state.auth_token = data.headers.authorization;
        axios.defaults.headers.common["Authorization"] = data.headers.authorization;
        localStorage.setItem("auth_token", data.headers.authorization);
    },
    setUserInfoFromToken(state, data) {
        state.user = data.data.user;
        state.auth_token = localStorage.getItem("auth_token");
    },
    resetUserInfo(state) {
        state.user = {
          id: null,
          email: null,
          full_name: null,
        };
        state.auth_token = null;
        localStorage.removeItem("auth_token");
        axios.defaults.headers.common["Authorization"] = null;
      },
}

export default {
    state,
    getters,
    actions,
    mutations,
}