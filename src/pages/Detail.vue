<template>
  <div v-if="book">
    <div>Detail</div>
    <img :src="book.volumeInfo.imageLinks.thumbnail" alt="">
    <p>title : {{ book.volumeInfo.title }}</p>
    <p>sub title : {{ book.volumeInfo.subtitle }}</p>
    <p>description : {{ book.volumeInfo.description }}</p>
    <a v-if="book.saleInfo.buyLink" target="_blank" :href="book.saleInfo.buyLink">buy</a>
  </div>
</template>

<script>
  import axios from 'axios'
  const ENDPOINT = 'https://www.googleapis.com/books/v1/volumes'

  export default {
    data() {
      return {
        book: null
      }
    },
    created() {
      const id = this.$route.params.id
      axios.get(`${ENDPOINT}/${id}`).then((res) => {
        if (res.data) {
          this.book = res.data
        }
      })
    }
  }
</script>

<style scoped></style>
