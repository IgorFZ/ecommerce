<template lang="">
    <section>
        <form @submit.prevent="$emit('search', this.search)" class="search-form">
            <div v-if="filterAdvancedActive" class="advanced-filter">
                <select class="select-filter radius-5-left" @click.prevent="$emit('search', this.search)" v-model="search.direction" name="" id="">
                    <option value="desc">Desc</option>
                    <option value="asc">Asc</option>
                </select>
                <select class="select-filter radius-5-right" @click.prevent="$emit('search', this.search)" v-model="search.mode" name="" id="">
                    <option value="stars">Rating</option>
                    <option value="name">Name</option>
                    <option value="price">Price</option>
                </select>
            </div>
            <div class="form">
                <input class="input-form" type="text" v-model="search.value" placeholder="Search by Name"/>
                <button @click.prevent="$emit('search', this.search)" type="submit" class="button-form">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>
    </section>
</template>


<script>
export default {
    name: 'Filter',
    emits: ["search"],
    props: {
        filterAdvancedActive: Boolean,
    },
    data(){
        return {
            search: {
                value: null,
                mode: 'stars',
                direction: 'desc',
            }  
        }
    },
}
</script>


<style scoped>
    .search-form {
        display: flex;
        justify-content: flex-end;
        padding: 30px 20px 0px 0px;
    }
    .search-form input {
        border-radius: 5px 0px 0px 5px;
        width: 200px;
        height: 32px;
        font-size: 13px;
        outline: 0;
    }
    .form {
        display: block;
        flex-shrink: 0;
    }
    .button-form {
        background-color: #fff;
        color: rgb(102, 100, 100);
        border: 1px solid #e2e9e1;
        border-radius: 0px 5px 5px 0px;
        width: 32px;
        height: 32px;
        padding: 5px;
        transition: ease 0.5s;
    }
    .button-form:hover {
        background-color: rgb(85, 84, 84);
        border: 1px solid rgb(85, 84, 84);
        color: rgb(255, 255, 255);
    }
    .advanced-filter {
        margin-right: 10px;
    }
    .select-filter {
        font-size: 13px;
        background-color: #fff;
        color: rgb(102, 100, 100);
        border: 1px solid #e2e9e1;
        height: 32px;
        width: 75px;
        padding: 8px;
        transition: ease 0.3s;
    }
    .radius-5-left {
        border-radius: 5px 0 0 5px;
    }
    .radius-5-right {
        border-radius: 0 5px 5px 0;
    }


    @media (max-width:1000px) { 
        /* .search-form {
            /* text-align: end;
            flex-direction: column-reverse; */
        /* } */
        #blog {
            padding: 80px ;
        }
        .advanced-filter {
            margin-right: 0px;
        }
    }

    @media (max-width:500px) { 
        .search-form {
            justify-content: center;
            flex-direction: column-reverse;
            padding: 30px 0px 0px 0px;
        }
    }
</style>