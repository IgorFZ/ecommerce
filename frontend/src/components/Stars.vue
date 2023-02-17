<template lang="">
    <div class="star">
        <div v-for="n in 5" >
            <i v-if="n <= stars" class="fas fa-star"></i>
            <i v-if="n > stars" class="fas fa-star" id="gray"></i>
        </div>
    </div>
</template>


<script>
export default {
    name: 'Stars',
    props: {
        stars: Number,
    }
}
</script>


<style scoped>
    .star {
        display: flex;   
        flex-direction: row;
    }
    #gray {
	font-size: 12px;
	color: rgb(184, 184, 184);
    }
</style>