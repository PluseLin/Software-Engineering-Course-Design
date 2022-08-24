<template>
<v-sheet>
  <v-carousel
    cycle
    height="800"
    hide-delimiter-background
    show-arrows-on-hover
    style="padding-top:2%"
  >
    <template v-slot:prev="{ on, attrs }">
      <v-btn
        color="success"
        v-bind="attrs"
        v-on="on"
      >上一个公园</v-btn>
    </template>
    <template v-slot:next="{ on, attrs }">
      <v-btn
        color="info"
        v-bind="attrs"
        v-on="on"
      >下一个公园</v-btn>
    </template>
    <v-carousel-item
      v-for="(slide, i) in slides"
      :key="i"
    >

        <v-row
          class="fill-height"
          align="center"
          justify="center"
        >
        <v-card height="800" width="70%">
        <v-img
        :src="srcs[i]"
        height="800"
        >  
        </v-img>
        <v-col>
          <div class="text-h2" style="padding-top:10%">
            {{ slide }} Slide
          </div>
        </v-col>
        </v-card>
        <v-col>
            <v-card
            height="800" 
            width="60%"
            color="#fff5ee"
            class="mx-auto"
        >
            <v-card-text>
            <p class="text-h5 text--primary">
                {{title[i]}}
            </p>
            <div class="text--primary">
                {{brief_intro[i]}}
            </div>
            </v-card-text>
            <v-card-actions>
            <v-btn
                text
                color="deep-purple accent-4"
                @click="GotoDetail(i)"
            >
               详情查看
            </v-btn>
            </v-card-actions>
        </v-card>
        </v-col>
        </v-row>
      
    </v-carousel-item>
  </v-carousel>
</v-sheet>
</template>
<script>
import axios from 'axios';
import Cookies from 'js-cookie'
  export default {
    methods: {
        GotoDetail(value){
        var url_temp='http://localhost:8000/parks/'
        axios.get(url_temp+value).then((data) => {
          Cookies.set('longitude',data.data.longitude);
          Cookies.set('latitude',data.data.latitude);
        })
                
                this.$router.push('/next')//在此处修改url跳转地址！！！！
                
            },
    },
    data () {
      return {
        slides: [
          'First',
          'Second',
          'Third',
          'Fourth',
          'Fifth',
        ],
        srcs:[
            require('../../assets/img/1.jpg'),
            require('../../assets/img/2.jpg'),
            require('../../assets/img/3.webp'),
            require('../../assets/img/4.jpg'),
            require('../../assets/img/5.jpg'),
        ],
        title:[
            '同济大学（嘉定校区）',
            '嘉北郊野公园',
            '上海海昌海洋公园',
            '上海野生动物园',
            '上海吴淞炮台湾湿地森林公园'

        ],
        brief_intro:[
            '同济大学嘉定校区位于上海市嘉定区国际汽车城内，曹安公路北侧、嘉松北路西侧、桃浦快速延伸段以南。地址为曹安公路4800号，是上海国际汽车城的重要组成部分，属市重点工程项目。',
            '嘉北郊野公园位于上海市嘉定新城主城区西北部，东侧紧邻城北大型居住社区，南侧为上海国际赛车场，距轨道交通11号线嘉定西站2公里，规划面积13.98平方公里。规划定位为近郊休闲型郊野公园。',
            '上海海昌海洋公园围绕海洋文化特色，分为人鱼海湾、极地小镇、冰雪王国、海底奇域、海洋部落五大主题区和富有特色的海洋主题度假酒店；六大动物展示场馆——南极企鹅馆、海兽探秘馆、冰山北极馆、海底世界馆、火山鲨鱼馆、珊瑚水母馆；九大明星剧目——《虎鲸科普秀》《海豚恋曲》《白鲸之恋》《海象嘻游记》《人鱼童话》《水舞鱼间》《海洋梦幻花车巡游》《小镇派对》《水上飞人》；六大游乐设备——火山漂流、海豚过山车、时空缆车、深海奇航、天幕影院、超感4D影院。',
            '上海野生动物园，位于上海浦东新区南六公路178号，是由上海市人民政府和中国国家林业局合作建设的中国首座国家级野生动物园，占地153公顷（约2300亩），距上海市中心35公里，于1995年11月18日正式对外开放。2007年5月8日，上海野生动物园经国家旅游局正式批准为国家AAAAA级旅游景区。园区居住着大熊猫、金丝猴、金毛羚牛、朱鹮、长颈鹿、斑马、羚羊、白犀牛、猎豹等来自国内外的珍稀野生动物200余种，上万余只，园区分为车入区和步行区两大参观区域。',
            '吴淞炮台湾湿地森林公园：总面积为53.46公顷的吴淞炮台湾湿地森林公园位于宝山区东部，背山面水，东临长江、黄浦江，西倚炮台山，南迄塘后支路，北至宝杨路，沿江的岸线长达1974.13米，其西南角是著名的吴淞口，清朝时借此地形建造水师炮台，所以得名为炮台湾。该公园的设计突出生态恢复及文化重建理念，不仅让原有的滩涂湿地在设计中得到有效的保护，并在沿江岸线一侧利用大小生态岛的组合及潮起潮落的水位变化，营造11公顷的迷人湿地景观。'
        ]
      }
    },
  }
</script>