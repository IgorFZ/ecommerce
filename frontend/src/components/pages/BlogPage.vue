<template>
    <div>
        <section id="page-header" class="blog-header">
            <h2>#readymore</h2>
            <p>Read all case studies about our products!</p>
        </section>

        <section id="filter">
            <Filter :filterAdvancedActive="false" @search="searchPostByName"/>
        </section>
        
        <section id="blog">
            <div class="blog-box" v-for="post in getPosts" :key="post.id">
                <div class="blog-image">
                    <img :src="post.image_url" alt="">
                </div>
                <div class="blog-details">
                    <h4>{{ post.title }}</h4>
                    <p>{{ (post.content).slice(0, 350) }}...</p>
                        <router-link :to="{ name: 'Post', params: { id: post.id }}">CONTINUE READING</router-link>
                </div>
                <h1>{{ post['created_at'].slice(5, 7) }}/{{ post.created_at.slice(8, 10) }}</h1>
            </div>
        </section>
    </div>
</template>


<script>
import Filter from '../Filter.vue'
import { mapActions, mapGetters } from 'vuex';
export default {
    name: 'Blog',
    components: { 
        Filter,
    },
    data(){
        return {
            linkImage: '../src/assets/img/blog/b1.jpg',
        }
    },
    computed: {
        ...mapGetters(["getPosts"]),
    },
    methods: {
        ...mapActions(["getAllPosts"]),
        searchPostByName(search) {
            let data = {
                title: search.value,
                direction: 'desc',
            }
            this.getAllPosts(data);
        },
    },
    mounted() {
        var data = {
            direction: 'desc',
        }
        this.getAllPosts(data);
    }
}
</script>


<style scoped>
    #filter {
        padding: 10px 150px 0px 0px;
    }

    @media (max-width:800px) { 
        #blog {
            padding: 80px 40px 0 40px;
        }
        #filter {
            padding: 10px 40px 0px 0px;
        }
    }
    @media (max-width:500px) { 
        #filter {
            padding: 0px 0px 0px 0px;
            text-align: center;
        }
    }
</style>