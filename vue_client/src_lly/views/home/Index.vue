<template>
<v-app style="width:100%">
        <div>
            <commonheader></commonheader>
        </div>
        <div>
            <router-view></router-view>
        </div>
</v-app>

</template>
<script>
import axios from 'axios';
import commonheader from '../../components/commonheader.vue'
export default{
    name:"Home" ,
    components:{
        commonheader
    },
}
</script>