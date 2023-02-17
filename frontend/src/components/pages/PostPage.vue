<template>
    <div>
        <section id="page-header" class="blog-header">
            <h2>#readymore</h2>
            <p>Read all case studies about our products!</p>
        </section>
        
        <section id="blog">
            <div class="blog-box">
                <div class="blog-image">
                    <img :src=" getPost['image_url']" alt="">
                </div>
                <div class="blog-details">
                    <h2>{{ getPost['title'] }}</h2>
                    <p>{{ paragraph }}.</p>
                </div>
                <h1>{{ month }}/{{ day }}</h1>
            </div>
        </section>
    </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';

export default {
    data(){
        return {
            idPost: this.$route.params.id,
            month: null,
            day: null,
            paragraph: null,
        }
    },
    computed: {
        ...mapGetters(["getPost"]),
    },
    methods: {
        ...mapActions(["getPostById"]),
        setData() { 
            this.month = this.getPost['created_at'].slice(5, 7),
            this.day = this.getPost['created_at'].slice(8, 10)
            this.paragraph = this.getPost['content'].slice(0, 600)
        }
    },
    beforeCreate() {
        return this.$route.params.id
    },
    created() {
        this.getPostById(this.idPost);
    },
    updated() {
        this.setData();
    }
}
</script>


<style scoped>
#blog{
    padding: 150px 150px 0 150px;
}

#blog .blog-box {
    display: flex;
    align-items: center;
    width: 100%;
    position: relative;
    padding-bottom: 90px;
}

#blog .blog-image {
    width: 50%;
}

#blog img {
      width: 100%;
      height: 100%;
      object-fit: cover;
}

#blog .blog-details {
    width: 50%;
}

#blog p {
	font-size: 20px;
	color: rgb(85, 85, 85) ;
	margin: 15px 0 20px 0;
}

@media (max-width:1000px) { 
    #blog {
        padding: 150px 110px 0 110px;
    }
    #blog .blog-box {
        flex-direction: column;
        align-items: center;
        width: 100%;
        position: relative;
        padding-bottom: 90px;
    }
    #blog .blog-image {
        width: 100%;
        margin-bottom: 30px;
        margin-right: 0;
    }
    #blog .blog-details {
        width: 100%;
        text-align: justify;
        text-justify: inter-word;
    }
}

@media (max-width:800px) { 
    #blog {
        padding: 150px 70px 0 70px;
    }
}

@media (max-width:500px) { 
    #blog {
        padding: 120px 30px 0 30px;
    }
}


</style>