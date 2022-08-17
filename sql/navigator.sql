/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : navigator

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 17/08/2022 14:42:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL,
  `adminname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `u_id` int(0) NOT NULL,
  `p_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_collection_p_id`(`p_id`) USING BTREE,
  INDEX `fk_collection_u_id`(`u_id`) USING BTREE,
  CONSTRAINT `fk_collection_p_id` FOREIGN KEY (`p_id`) REFERENCES `park` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_collection_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (22, 2, 1);
INSERT INTO `collection` VALUES (25, 2, 2);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `u_id` int(0) NOT NULL,
  `p_id` int(0) NOT NULL,
  `comment_time` datetime(0) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_comment_u_id`(`u_id`) USING BTREE,
  INDEX `fk_comment_p_id`(`p_id`) USING BTREE,
  CONSTRAINT `fk_comment_p_id` FOREIGN KEY (`p_id`) REFERENCES `park` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 2, 2, '2022-08-16 20:16:28', '风景好看，餐品一般！', 4);
INSERT INTO `comment` VALUES (2, 2, 1, '2022-08-16 23:37:36', '家人们欢迎来到世界最高城！', 4);
INSERT INTO `comment` VALUES (5, 2, 1, '2022-08-16 23:39:14', '这不是顶真嘛?!', 1);
INSERT INTO `comment` VALUES (6, 2, 2, '2022-08-17 12:25:50', '家人们欢迎来到世界最高城！', 4);
INSERT INTO `comment` VALUES (7, 2, 2, '2022-08-17 12:26:22', '朋友们扣1送门票哦！', 5);
INSERT INTO `comment` VALUES (9, 2, 1, '2022-08-17 14:25:58', '同济大学嘉定校区好美啊欢迎报考同济大学！', 5);
INSERT INTO `comment` VALUES (10, 2, 3, '2022-08-17 14:29:06', '每年桃花开的时候我都会来！', 4);
INSERT INTO `comment` VALUES (11, 2, 3, '2022-08-17 14:29:44', '五星好评！', 5);
INSERT INTO `comment` VALUES (12, 2, 3, '2022-08-17 14:29:58', '缺少自然氛围！', 3);
INSERT INTO `comment` VALUES (13, 2, 4, '2022-08-17 14:31:43', '春风得意马蹄疾一日看尽长安花', 5);
INSERT INTO `comment` VALUES (14, 2, 4, '2022-08-17 14:32:04', '公园不错！', 4);
INSERT INTO `comment` VALUES (15, 2, 4, '2022-08-17 14:32:45', '景色不错，动物种类也很丰富值得一看', 5);
INSERT INTO `comment` VALUES (16, 2, 5, '2022-08-15 14:33:35', '77年前的今天，日本投降！', 5);
INSERT INTO `comment` VALUES (17, 2, 5, '2022-08-17 14:34:39', '公园很美，很有情趣！', 5);
INSERT INTO `comment` VALUES (18, 2, 5, '2022-08-17 14:35:20', '家人们一定要去划船~', 4);

-- ----------------------------
-- Table structure for park
-- ----------------------------
DROP TABLE IF EXISTS `park`;
CREATE TABLE `park`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `parkname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `map` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `longitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `latitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of park
-- ----------------------------
INSERT INTO `park` VALUES (1, '同济大学(嘉定校区)', '2022-08-12 09:52:13', '11', '上海市嘉定区曹安公路4800号\r\n电话：(021)69589455', '121.220631', '31.291873');
INSERT INTO `park` VALUES (2, '嘉北郊野公园', '2022-08-16 20:16:10', '12', '上海市嘉定区沪宜公路5051号\r\n电话：(021)39935800', '121.206817', '31.36376');
INSERT INTO `park` VALUES (3, '上海海昌海洋公园', '2022-08-17 13:29:24', '123', '上海市浦东新区南汇新城镇银飞路166号\r\n电话：4006016699', '121.910782', '30.920947');
INSERT INTO `park` VALUES (4, '上海野生动物园', '2022-08-17 13:36:03', '11', '上海市浦东新区宣桥镇南六公路178号\r\n电话：(021)58036000', '121.728256', '31.061244');
INSERT INTO `park` VALUES (5, '上海吴淞炮台湾湿地森林公园', '2022-08-17 13:56:46', '12', '上海市宝山区塘后路206号\r\n电话：(021)56579009', '121.515535', '31.402995');

-- ----------------------------
-- Table structure for spot
-- ----------------------------
DROP TABLE IF EXISTS `spot`;
CREATE TABLE `spot`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `p_id` int(0) NOT NULL,
  `detail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `spotname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `map` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_spot_p_id`(`p_id`) USING BTREE,
  CONSTRAINT `fk_spot_p_id` FOREIGN KEY (`p_id`) REFERENCES `park` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of spot
-- ----------------------------
INSERT INTO `spot` VALUES (1, 2, '嘉北郊野公园溪流大峡谷', '2022-08-17 10:15:09', '溪流大峡谷', '暂空');
INSERT INTO `spot` VALUES (2, 2, '嘉北郊野公园海鹰垂钓中心', '2022-08-17 10:35:05', '海鹰垂钓中心', '暂空');
INSERT INTO `spot` VALUES (3, 1, '同济大学生态农庄', '2022-08-17 14:00:28', '生态农庄', '暂空');
INSERT INTO `spot` VALUES (4, 1, '休闲广场', '2022-08-17 14:01:35', '满天星广场', '暂空');
INSERT INTO `spot` VALUES (5, 1, '同济大学嘉定校区农家乐', '2022-08-17 14:02:25', '同济嘉定校区农家乐', '暂空');
INSERT INTO `spot` VALUES (6, 2, '上海市嘉定区周果路嘉北郊野公园', '2022-08-17 14:04:47', '花海拾光', '暂空');
INSERT INTO `spot` VALUES (7, 2, '嘉北郊野公园白马桥', '2022-08-17 14:05:00', '白马桥', '暂空');
INSERT INTO `spot` VALUES (8, 2, '嘉北郊野公园内露营野餐基地', '2022-08-17 14:06:13', '露营野餐基地', '暂空');
INSERT INTO `spot` VALUES (9, 3, '浦东新区南汇新城镇银飞路166号上海海昌海洋公园内', '2022-08-17 14:10:51', '海豚过山车', '暂空');
INSERT INTO `spot` VALUES (10, 3, '浦东新区南汇新城镇银飞路166号上海海昌海洋公园内', '2022-08-17 14:11:39', '火山漂流', '暂空');
INSERT INTO `spot` VALUES (11, 3, '浦东新区南汇新城镇银飞路166号上海海昌海洋公园内', '2022-08-17 14:12:10', '虎鲸剧场', '暂空');
INSERT INTO `spot` VALUES (12, 3, '浦东新区杞青路777号', '2022-08-17 14:12:36', '珊瑚水母馆', '暂空');
INSERT INTO `spot` VALUES (13, 3, '上海海昌海洋公园内游戏游艺', '2022-08-17 14:14:00', '超感4D影院', '暂空');
INSERT INTO `spot` VALUES (14, 4, '浦东新区宣桥镇南六公路178号灵猴天地\r\n风景区', '2022-08-17 14:15:52', '灵猴天地', '暂空');
INSERT INTO `spot` VALUES (15, 4, '浦东新区宣桥镇南六公路178号上海野生动物园内水禽湖', '2022-08-17 14:16:21', '水禽湖', '暂空');
INSERT INTO `spot` VALUES (16, 4, '浦东新区宣桥镇南六公路178号上海野生动物园内风景区', '2022-08-17 14:19:10', '狼区', '暂空');
INSERT INTO `spot` VALUES (17, 4, '浦东新区南六公路178号上海野生动物园内', '2022-08-17 14:19:59', '海狮剧场', '暂空');
INSERT INTO `spot` VALUES (18, 4, '生活服务', '2022-08-17 14:20:42', '志愿者服务亭', '暂空');
INSERT INTO `spot` VALUES (19, 4, '宣桥镇南六公路178号上海野生动物园内', '2022-08-17 14:21:22', '骑马场', '暂空');
INSERT INTO `spot` VALUES (20, 4, '浦东新区南六公路178号上海野生动物园内', '2022-08-17 14:22:14', '亚洲食草动物区', '暂空');
INSERT INTO `spot` VALUES (21, 5, '宝山区郊环隧道零点广场东南侧约110米', '2022-08-17 14:22:55', '泛舟揽胜', '暂空');
INSERT INTO `spot` VALUES (22, 5, '宝山区塘后路206号上海吴淞炮台湾国家湿地公园内', '2022-08-17 14:23:21', '矿坑花园', '暂空');
INSERT INTO `spot` VALUES (23, 5, '文物古迹-吴淞炮台纪念遗址', '2022-08-17 14:23:35', '吴淞炮台纪念遗址', '暂空');
INSERT INTO `spot` VALUES (24, 5, '宝山区塘后路206号上海吴淞炮台湾国家湿地公园内', '2022-08-17 14:23:52', '和平园', '暂空');
INSERT INTO `spot` VALUES (25, 5, '宝山区塘后路206号上海吴淞炮台湾国家湿地公园内', '2022-08-17 14:24:23', '木兰雅苑', '暂空');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reg_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'Lin', '1234', '1390297535@qq.com', '2022-07-31 17:54:26');

SET FOREIGN_KEY_CHECKS = 1;
