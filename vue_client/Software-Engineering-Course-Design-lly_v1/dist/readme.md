# 接口说明

## GET /allparks

- 场景：首页拉取全部公园信息

- 参数：
  - 无

- 期望返回数据：
  - parks:列表，包含各个公园信息
    - id: 公园id
    - parkname：公园名称
    - picture：公园图片
    - detail：公园介绍

## GET /parks/${id}

- 场景：用户点击收藏列表或搜索栏中的公园，切换当前公园

- 参数：
  - id：公园id

- 期望返回数据：
  - name：公园名称
  - longitude：公园经度
  - latitude：公园纬度

## GET /parks/${searchInput}/search

- 场景：用户在搜索框输入关键字，搜索公园
- 参数：
  - searchInput：用户输入
- 期望返回数据：
  - 公园列表：
    - id：公园id
    - name: 公园名称

## PUT /favorites/${userID}/${parkID}

- 场景：用户点击灰色收藏按钮，将当前公园添加至收藏夹中
- 参数：
  - userID：用户id
  - parkID：公园id

## DELETE /favorites/${userID}/${parkID}

- 场景：用户点击红色收藏按钮，将当前公园从收藏夹移除
- 参数：
  - userID：用户id
  - parkID：公园id

## GET /parks/${id}/spots

- 场景：用户点击“景点”按钮，拉取当前公园的景点信息
- 参数：
  - id：公园id
- 期望返回数据：
  - 景点列表：
    - name：景点名称
    - detail：景点介绍
    - img：景点图片地址

## GET /parks/${id}/comments

- 场景：用户点击“评论”按钮，拉取当前公园的评论信息
- 参数：
  - id：公园id
- 期望返回数据：
  - 评论列表：
  - score：评分
  - content：评论内容

## PUT /comment

- 场景：用户对当前公园发表评论
- 请求体内容（json格式）：
  - park_id：公园id
  - user_id：用户id
  - score：评分
  - content：评论内容
  