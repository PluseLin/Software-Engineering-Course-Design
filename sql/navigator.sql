/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.28 : Database - software_pro
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`navigator` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `navigator`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `adminname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `admin` */

/*Table structure for table `collection` */

DROP TABLE IF EXISTS `collection`;

CREATE TABLE `collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `p_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_collection_p_id` (`p_id`) USING BTREE,
  KEY `fk_collection_u_id` (`u_id`) USING BTREE,
  CONSTRAINT `fk_collection_p_id` FOREIGN KEY (`p_id`) REFERENCES `park` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_collection_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `collection` */

insert  into `collection`(`id`,`u_id`,`p_id`) values (22,2,1),(25,2,2),(30,5,1),(31,5,3),(32,5,4);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `p_id` int NOT NULL,
  `comment_time` datetime NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_comment_u_id` (`u_id`) USING BTREE,
  KEY `fk_comment_p_id` (`p_id`) USING BTREE,
  CONSTRAINT `fk_comment_p_id` FOREIGN KEY (`p_id`) REFERENCES `park` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `comment` */

insert  into `comment`(`id`,`u_id`,`p_id`,`comment_time`,`content`,`score`) values (1,2,2,'2022-08-16 20:16:28','风景好看，餐品一般！',4),(2,2,1,'2022-08-16 23:37:36','家人们欢迎来到世界最高城！',4),(5,2,1,'2022-08-16 23:39:14','这不是顶真嘛?!',1),(6,2,2,'2022-08-17 12:25:50','家人们欢迎来到世界最高城！',4),(7,2,2,'2022-08-17 12:26:22','朋友们扣1送门票哦！',5),(9,2,1,'2022-08-17 14:25:58','同济大学嘉定校区好美啊欢迎报考同济大学！',5),(10,2,3,'2022-08-17 14:29:06','每年桃花开的时候我都会来！',4),(11,2,3,'2022-08-17 14:29:44','五星好评！',5),(12,2,3,'2022-08-17 14:29:58','缺少自然氛围！',3),(13,2,4,'2022-08-17 14:31:43','春风得意马蹄疾一日看尽长安花',5),(14,2,4,'2022-08-17 14:32:04','公园不错！',4),(15,2,4,'2022-08-17 14:32:45','景色不错，动物种类也很丰富值得一看',5),(16,2,5,'2022-08-15 14:33:35','77年前的今天，日本投降！',5),(17,2,5,'2022-08-17 14:34:39','公园很美，很有情趣！',5),(18,2,5,'2022-08-17 14:35:20','家人们一定要去划船~',4);

/*Table structure for table `park` */

DROP TABLE IF EXISTS `park`;

CREATE TABLE `park` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parkname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default.jpg',
  `detail` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `longitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `latitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `park` */

insert  into `park`(`id`,`parkname`,`update_time`,`picture`,`detail`,`longitude`,`latitude`) values (1,'同济大学(嘉定校区)','2022-08-12 09:52:13','1.jpg','同济大学嘉定校区位于上海市嘉定区国际汽车城内，曹安公路北侧、嘉松北路西侧、桃浦快速延伸段以南。地址为曹安公路4800号，是上海国际汽车城的重要组成部分，属市重点工程项目。','121.220631','31.291873'),(2,'嘉北郊野公园','2022-08-16 20:16:10','2.jpg','上海市嘉定区沪宜公路5051号\r\n嘉北郊野公园位于上海市嘉定新城主城区西北部，东侧紧邻城北大型居住社区，南侧为上海国际赛车场，距轨道交通11号线嘉定西站2公里，规划面积13.98平方公里。规划定位为近郊休闲型郊野公园。','121.206817','31.36376'),(3,'上海海昌海洋公园','2022-08-17 13:29:24','3.webp','上海市浦东新区南汇新城镇银飞路166号\r\n上海海昌海洋公园围绕海洋文化特色，分为人鱼海湾、极地小镇、冰雪王国、海底奇域、海洋部落五大主题区和富有特色的海洋主题度假酒店；六大动物展示场馆——南极企鹅馆、海兽探秘馆、冰山北极馆、海底世界馆、火山鲨鱼馆、珊瑚水母馆；九大明星剧目——《虎鲸科普秀》《海豚恋曲》《白鲸之恋》《海象嘻游记》《人鱼童话》《水舞鱼间》《海洋梦幻花车巡游》《小镇派对》《水上飞人》；六大游乐设备——火山漂流、海豚过山车、时空缆车、深海奇航、天幕影院、超感4D影院。','121.910782','30.920947'),(4,'上海野生动物园','2022-08-17 13:36:03','4.jpg','上海市浦东新区宣桥镇南六公路178号\r\n上海野生动物园，位于上海浦东新区南六公路178号，是由上海市人民政府和中国国家林业局合作建设的中国首座国家级野生动物园，占地153公顷（约2300亩），距上海市中心35公里，于1995年11月18日正式对外开放。2007年5月8日，上海野生动物园经国家旅游局正式批准为国家AAAAA级旅游景区。园区居住着大熊猫、金丝猴、金毛羚牛、朱鹮、长颈鹿、斑马、羚羊、白犀牛、猎豹等来自国内外的珍稀野生动物200余种，上万余只，园区分为车入区和步行区两大参观区域。','121.728256','31.061244'),(5,'上海吴淞炮台湾湿地森林公园','2022-08-17 13:56:46','5.jpg','上海市宝山区塘后路206号\r\n吴淞炮台湾湿地森林公园：总面积为53.46公顷的吴淞炮台湾湿地森林公园位于宝山区东部，背山面水，东临长江、黄浦江，西倚炮台山，南迄塘后支路，北至宝杨路，沿江的岸线长达1974.13米，其西南角是著名的吴淞口，清朝时借此地形建造水师炮台，所以得名为炮台湾。该公园的设计突出生态恢复及文化重建理念，不仅让原有的滩涂湿地在设计中得到有效的保护，并在沿江岸线一侧利用大小生态岛的组合及潮起潮落的水位变化，营造11公顷的迷人湿地景观。','121.515535','31.402995');

/*Table structure for table `spot` */

DROP TABLE IF EXISTS `spot`;

CREATE TABLE `spot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `detail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime NOT NULL,
  `spotname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_spot_p_id` (`p_id`) USING BTREE,
  CONSTRAINT `fk_spot_p_id` FOREIGN KEY (`p_id`) REFERENCES `park` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `spot` */

insert  into `spot`(`id`,`p_id`,`detail`,`update_time`,`spotname`,`picture`) values (1,2,'嘉北郊野公园溪流大峡谷','2022-08-17 10:15:09','溪流大峡谷','default.jpg'),(2,2,'嘉北郊野公园海鹰垂钓中心','2022-08-17 10:35:05','海鹰垂钓中心','default.jpg'),(3,1,'同济大学生态农庄','2022-08-17 14:00:28','生态农庄','default.jpg'),(4,1,'休闲广场','2022-08-17 14:01:35','满天星广场','default.jpg'),(5,1,'同济大学嘉定校区农家乐','2022-08-17 14:02:25','同济嘉定校区农家乐','default.jpg'),(6,2,'上海市嘉定区周果路嘉北郊野公园','2022-08-17 14:04:47','花海拾光','default.jpg'),(7,2,'嘉北郊野公园白马桥','2022-08-17 14:05:00','白马桥','default.jpg'),(8,2,'嘉北郊野公园内露营野餐基地','2022-08-17 14:06:13','露营野餐基地','default.jpg'),(9,3,'浦东新区南汇新城镇银飞路166号上海海昌海洋公园内','2022-08-17 14:10:51','海豚过山车','default.jpg'),(10,3,'浦东新区南汇新城镇银飞路166号上海海昌海洋公园内','2022-08-17 14:11:39','火山漂流','default.jpg'),(11,3,'浦东新区南汇新城镇银飞路166号上海海昌海洋公园内','2022-08-17 14:12:10','虎鲸剧场','default.jpg'),(12,3,'浦东新区杞青路777号','2022-08-17 14:12:36','珊瑚水母馆','default.jpg'),(13,3,'上海海昌海洋公园内游戏游艺','2022-08-17 14:14:00','超感4D影院','default.jpg'),(14,4,'浦东新区宣桥镇南六公路178号灵猴天地\r\n风景区','2022-08-17 14:15:52','灵猴天地','default.jpg'),(15,4,'浦东新区宣桥镇南六公路178号上海野生动物园内水禽湖','2022-08-17 14:16:21','水禽湖','default.jpg'),(16,4,'浦东新区宣桥镇南六公路178号上海野生动物园内风景区','2022-08-17 14:19:10','狼区','default.jpg'),(17,4,'浦东新区南六公路178号上海野生动物园内','2022-08-17 14:19:59','海狮剧场','default.jpg'),(18,4,'生活服务','2022-08-17 14:20:42','志愿者服务亭','default.jpg'),(19,4,'宣桥镇南六公路178号上海野生动物园内','2022-08-17 14:21:22','骑马场','default.jpg'),(20,4,'浦东新区南六公路178号上海野生动物园内','2022-08-17 14:22:14','亚洲食草动物区','default.jpg'),(21,5,'宝山区郊环隧道零点广场东南侧约110米','2022-08-17 14:22:55','泛舟揽胜','default.jpg'),(22,5,'宝山区塘后路206号上海吴淞炮台湾国家湿地公园内','2022-08-17 14:23:21','矿坑花园','default.jpg'),(23,5,'文物古迹-吴淞炮台纪念遗址','2022-08-17 14:23:35','吴淞炮台纪念遗址','default.jpg'),(24,5,'宝山区塘后路206号上海吴淞炮台湾国家湿地公园内','2022-08-17 14:23:52','和平园','default.jpg'),(25,5,'宝山区塘后路206号上海吴淞炮台湾国家湿地公园内','2022-08-17 14:24:23','木兰雅苑','default.jpg');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reg_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`reg_time`) values (2,'Lin','1234','1390297535@qq.com','2022-07-31 17:54:26'),(3,'AAAA','123123123','1390297535@qq.com','2022-08-24 09:02:50'),(4,'','1234','123@111.com','2022-08-24 20:50:24'),(5,'lly3','12345','lileyang10@sina.com','2022-08-24 23:12:33');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
