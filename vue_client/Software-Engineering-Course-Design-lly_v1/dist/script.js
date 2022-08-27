const IN_FAVORITES_COLOR = 'pink'
const NOT_FAVORITES_COLOR = 'grey'

window.onload = function () {
  var cookie = document.cookie

  function getValueByKey(key) {
    var start = cookie.indexOf(key)
    var slice = cookie.substring(start)
    var end = slice.indexOf(';')
    slice = slice.substring(0, end)
    console.log(slice.split('=')[1])
    return slice.split('=')[1]
  }
  
  var userID = getValueByKey('user_id')
  var parkID = getValueByKey('park_id')
  app.setInitInfo(userID, parkID)
}

var app = new Vue({
  el: '#app',
  vuetify: new Vuetify(),
  props: {
    source: String,
  },
  data: () => ({
    drawer: null,

    // 状态信息
    userID: 5,
    parkID: 1,
    parkName: '同济大学(嘉定校区)',

    // 收藏
    favorites: [],

    // 搜索
    searchInput: "",
    searchRes: [],

    // 收藏按钮
    heartColor: IN_FAVORITES_COLOR,

    // 景点
    spots: [
      { name: '示例景点', detail: '示例景点', img: '示例景点' },
    ],
    isSpotsUpdated: false,

    // 评论
    score: 1,
    content: '',
    comments: [
      { score: '1', content: '示例评论' },
    ],
    isCommentsUpdated: false,
  }),
  methods: {
    setInitInfo: function (userID, parkID, latitude, longitude) {
      this.userID = userID
      this.chosePark(parkID)
    },

    // 展示收藏列表
    showFavorties: function () {
      this.drawer = !this.drawer
      fetch(`http://localhost:8000/favorites/${this.userID}`, {
        method: 'get',
      })
        .then(res => {
          if (res.ok) return res.json()
        })
        .then(response => {
          this.favorites = response
        })
    },

    // 收藏、搜索栏选择公园
    chosePark: function (id) {
      fetch(`http://localhost:8000/parks/${id}`, {
        method: 'get',
      })
        .then(res => {
          if (res.ok) return res.json()
        })
        .then(response => {
          this.parkID = id
          this.parkName = response.name
          updateMap(response.longitude, response.latitude)

          // 切换公园时不立即拉取该公园的景点、评论信息
          // 使用bool值记录当前景点、评论信息是否为最新
          // 点击“景点”|“评论”按钮后根据该bool值判断是否需要拉取相应信息
          this.isSpotsUpdated = false
          this.isCommentsUpdated = false
        })
    },

    // 搜索
    search: function () {
      fetch(`http://localhost:8000/parks/${this.searchInput}/search`, {
        method: 'get',
      })
        .then(res => {
          if (res.ok) return res.json()
        })
        .then(response => {
          this.searchRes = response
        })
    },

    // 点击收藏按钮
    clickHeart: function () {
      if (this.heartColor == IN_FAVORITES_COLOR) {
        fetch(`http://localhost:8000/favorites/${this.userID}/${this.parkID}`, {
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
        fetch(`http://localhost:8000/favorites/${this.userID}/${this.parkID}`, {
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
        fetch(`http://localhost:8000/parks/${this.parkID}/spots`, {
          method: 'get',
        })
          .then(res => {
            if (res.ok) return res.json()
          })
          .then(response => {
            this.spots = response
            this.isSpotsUpdated = true
          })
      }
    },

    // 浏览评论
    showComments: function () {
      if (!this.isCommentsUpdated) {
        fetch(`http://localhost:8000/parks/${this.parkID}/comments`, {
          method: 'get',
        })
          .then(res => {
            if (res.ok) return res.json()
          })
          .then(response => {
            this.comments = response
            this.isCommentsUpdated = true
          })
      }
    },

    // 发表评论
    comment: function () {
      fetch(`http://localhost:8000/comment`, {
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
    },
  }
})

var map = new BMapGL.Map('container'); // 创建Map实例
map.centerAndZoom(new BMapGL.Point(116.404, 39.915), 16); // 初始化地图,设置中心点坐标和地图级别
map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放

function updateMap(x, y) {
  map.centerAndZoom(new BMapGL.Point(x, y), 16);
}
