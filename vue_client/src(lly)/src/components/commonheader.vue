<template v-slot:extension>
  <v-tabs align-with-title
    fixed-tabs
    background-color="indigo"
    dark
  >
    <v-tab @click="GotoIndex">
      主页
    </v-tab>
    <v-tab @click="GotoPersonal">
      个人中心
    </v-tab>
    <v-tab @click="GotoAbout">
      评价我们
    </v-tab>
    <v-tab @click="GotoContact">
      联系我们
    </v-tab>
  </v-tabs>
</template>
<script>
 export default {
  methods: {
              GotoIndex(){
                  this.$router.push('/index')
              },
              GotoPersonal(){
                  this.$router.push('/personal')
              },
              GotoAbout(){
                  this.$router.push('/about')
              },
              GotoContact(){
                  this.$router.push('/contact')
              }
  }
 }
</script>

