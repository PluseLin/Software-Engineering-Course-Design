<template>
  <v-card
    class="elevation-16 mx-auto"
    width="100%"
  >
    <v-card-title class="text-h5">
      评价我们的作品
    </v-card-title>
    <v-card-text>
      如果你觉得我们设计的网站有用，那么你可以在下面的评分系统做出一定的评价，将会对我们有很大的帮助

      <div class="text-center mt-12">
        <v-rating
          v-model="rating"
          color="yellow darken-3"
          background-color="grey darken-1"
          empty-icon="$ratingFull"
          half-increments
          hover
          large
        ></v-rating>
      </div>
    </v-card-text>
    <v-divider></v-divider>
    <v-card-actions class="justify-space-between">
      <v-btn text @click="GotoIndex">
        残忍拒绝
      </v-btn>
      <v-btn
        color="primary"
        text
        @click="GotoIndex"
      >
        直接打分！
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
  export default {
    data: () => ({
      rating: 4.5,
    }),
     methods: {
              GotoIndex(){
                  this.$router.push('/index')
              },
     }
  }
</script>