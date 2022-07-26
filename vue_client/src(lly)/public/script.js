const IN_FAVORITES_COLOR = 'pink'
const NOT_FAVORITES_COLOR = 'grey'

var app = new Vue({
  el: '#app',
  vuetify: new Vuetify(),
  props: {
    source: String,
  },
  data: () => ({
    drawer: null,

    // 状态信息
    userID: 0,
    parkID: 0,
    parkName: '1号公园',

    // 收藏
    favorites: [
      { id: 1, name: '1号公园' },
      { id: 2, name: '2号公园' },
      { id: 3, name: '3号公园' },
      { id: 4, name: '4号公园' },
      { id: 5, name: '5号公园' },
    ],

    // 搜索
    searchInput: "",
    searchRes: [
      { id: 1, name: '1号公园' },
      { id: 2, name: '2号公园' },
      { id: 3, name: '3号公园' },
      { id: 4, name: '4号公园' },
      { id: 5, name: '5号公园' },
    ],

    // 收藏按钮
    heartColor: IN_FAVORITES_COLOR,

    // 景点
    spots: [
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
      { name: '景点1', detail: '这是景点1', img: '这是图片' },
    ],
    isSpotsUpdated: false,

    // 评论
    score: 1,
    content: '',
    comments: [
      { score: '1', content: '这是评论1' },
      { score: '1', content: '这是评论1' },
      { score: '1', content: '这是评论1' },
      { score: '1', content: '这是评论1' },
      { score: '1', content: '这是评论1' },
      { score: '1', content: '这是评论1' },
      { score: '1', content: '这是评论1' },
      { score: '1', content: '这是评论1' },
      { score: '1', content: '这是评论1' },
      { score: '1', content: '这是评论1' },
    ],
    isCommentsUpdated: false,
  }),
  methods: {
    // 收藏、搜索栏选择公园
    chosePark: function (id) {
      fetch(`/parks/${id}`, {
        method: 'get',
      })
        .then(res => {
          if (res.ok) return res.json()
        })
        .then(response => {
          this.id = id
          this.parkName = response.data[0].name
          updateMap(response.data[0].longitude, response.data[0].latitude)

          // 切换公园时不立即拉取该公园的景点、评论信息
          // 使用bool值记录当前景点、评论信息是否为最新
          // 点击“景点”|“评论”按钮后根据该bool值判断是否需要拉取相应信息
          this.isSpotsUpdated = false
          this.isCommentsUpdated = false
        })
    },

    // 搜索
    search: function () {
      fetch(`/parks/${this.searchInput}/search`, {
        method: 'get',
      })
        .then(res => {
          if (res.ok) return res.json()
        })
        .then(response => {
          this.searchRes = response.data
        })
    },

    // 点击收藏按钮
    clickHeart: function () {
      if (this.heartColor == IN_FAVORITES_COLOR) {
        fetch(`/favorites/${this.userID}/${this.parkID}`, {
          method: 'delete',
        })
          .then(res => {
            if (res.ok) return res.json()
          })
          .then(response => {
            this.heartColor = NOT_FAVORITES_COLOR
            this.favorites = this.favorites.filter(function (item) { return item.id != this.parkID })
          })
      }
      else if (this.heartColor == NOT_FAVORITES_COLOR) {
        fetch(`/favorites/${this.userID}/${this.parkID}`, {
          method: 'put',
        })
          .then(res => {
            if (res.ok) return res.json()
          })
          .then(response => {
            this.heartColor = IN_FAVORITES_COLOR
            this.favorites.unshift({ id: this.parkID, name: this.parkName })
          })
      }
    },

    // 浏览景点
    showSpots: function () {
      if (!this.isSpotsUpdated) {
        fetch(`/parks/${this.id}/spots`, {
          method: 'get',
        })
          .then(res => {
            if (res.ok) return res.json()
          })
          .then(response => {
            this.spots = response.data
            this.isSpotsUpdated = true
          })
      }
    },

    // 浏览评论
    showComments: function () {
      if (!this.isCommentsUpdated) {
        fetch(`/parks/${this.id}/comments`, {
          method: 'get',
        })
          .then(res => {
            if (res.ok) return res.json()
          })
          .then(response => {
            this.comments = response.data
            this.isCommentsUpdated = true
          })
      }
    },

    // 发表评论
    comment: function () {
      if (!this.isCommentsUpdated) {
        fetch(`/comment`, {
          method: 'put',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            park_id: this.parkID,
            user_id: this.userID,
            score: this.score,
            content: this.content
          })
        })
          .then(res => {
            if (res.ok) return res.json()
          })
          .then(response => {
            this.comments.unshift({ score: this.score, content: this.content })
            this.content = ''
          })
      }
    },
  }
})

var map = new BMapGL.Map('container'); // 创建Map实例
map.centerAndZoom(new BMapGL.Point(116.404, 39.915), 14); // 初始化地图,设置中心点坐标和地图级别
map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放

function updateMap(x, y) {
  map.centerAndZoom(new BMapGL.Point(x, y), 12);
}
