/*
MySQL Backup
Database: yanyuanorder
Backup Time: 2019-08-21 11:09:03
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `yanyuanorder`.`budaimo`;
DROP TABLE IF EXISTS `yanyuanorder`.`customerinfomation`;
DROP TABLE IF EXISTS `yanyuanorder`.`dapanji`;
DROP TABLE IF EXISTS `yanyuanorder`.`gaijiaofan`;
DROP TABLE IF EXISTS `yanyuanorder`.`images`;
DROP TABLE IF EXISTS `yanyuanorder`.`merchant`;
DROP TABLE IF EXISTS `yanyuanorder`.`orderinformation`;
DROP TABLE IF EXISTS `yanyuanorder`.`scollbar`;
DROP TABLE IF EXISTS `yanyuanorder`.`user`;
CREATE TABLE `budaimo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_class` varchar(255) DEFAULT NULL COMMENT '菜单分类',
  `food_name` varchar(255) DEFAULT NULL COMMENT '菜名',
  `food_image` varchar(255) DEFAULT NULL COMMENT '菜品图片',
  `food_price` decimal(10,0) unsigned DEFAULT NULL COMMENT '菜品价格',
  `food_static` varchar(3) DEFAULT '1' COMMENT '菜品状态\r\n0为告罄\r\n1为正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
CREATE TABLE `customerinfomation` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_dormitory` varchar(255) DEFAULT NULL,
  `user_phone` varchar(11) NOT NULL,
  `user_sex` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`user_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
CREATE TABLE `dapanji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_class` varchar(255) DEFAULT '',
  `food_name` varchar(255) DEFAULT NULL,
  `food_image` varchar(255) DEFAULT NULL,
  `food_price` decimal(10,2) DEFAULT NULL,
  `food_static` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
CREATE TABLE `gaijiaofan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_class` varchar(255) DEFAULT NULL,
  `food_name` varchar(255) DEFAULT NULL,
  `food_image` varchar(255) DEFAULT NULL,
  `food_price` decimal(10,2) DEFAULT NULL,
  `food_static` varchar(255) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) NOT NULL COMMENT '图片名称',
  `image_path` varchar(255) NOT NULL COMMENT '图片地址',
  `upload_time` varchar(255) NOT NULL COMMENT '添加时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` varchar(4) NOT NULL,
  `merchant_name` varchar(255) DEFAULT NULL COMMENT '商家名',
  `phone` varchar(255) DEFAULT NULL COMMENT '商家电话',
  `recommend` varchar(255) DEFAULT NULL COMMENT '介绍',
  `publicity_image` varchar(255) DEFAULT NULL COMMENT '商家图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
CREATE TABLE `orderinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_time` datetime DEFAULT NULL COMMENT '订单时间',
  `order_menu` varchar(255) DEFAULT NULL COMMENT '订单菜品',
  `cus_name` varchar(255) DEFAULT NULL COMMENT '顾客姓名',
  `cus_phone` varchar(11) DEFAULT NULL COMMENT '顾客电话',
  `cus_dormitory` varchar(255) DEFAULT NULL COMMENT '顾客宿舍',
  `cus_sex` varchar(5) DEFAULT NULL COMMENT '顾客性别',
  `order_merchant` varchar(255) DEFAULT NULL COMMENT '订单商家',
  `order_money` varchar(255) DEFAULT NULL COMMENT '订单金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
CREATE TABLE `scollbar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_name` varchar(255) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `scollBar_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `creat_time` varchar(255) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
BEGIN;
LOCK TABLES `yanyuanorder`.`budaimo` WRITE;
DELETE FROM `yanyuanorder`.`budaimo`;
INSERT INTO `yanyuanorder`.`budaimo` (`id`,`menu_class`,`food_name`,`food_image`,`food_price`,`food_static`) VALUES (1, '一元', '青椒', 'http://192.168.199.161:8080/images/BuDaiMo/region_1/qingJiao.jpg', 1, '1'),(2, '一元', '金针菇', 'http://192.168.199.161:8080/images/BuDaiMo/region_1/jinZhenGu.jpg', 1, '1'),(3, '一元', '香菇', 'http://192.168.199.161:8080/images/BuDaiMo/region_1/xiangGu.jpg', 1, '1'),(4, '一元', '平菇', 'http://192.168.199.161:8080/images/BuDaiMo/region_1/pingGu.jpg', 1, '1'),(5, '二元', '大骨连', 'http://192.168.199.161:8080/images/BuDaiMo/region_2/daGuLian.jpg', 2, '1'),(6, '二元', '双鸡柳', 'http://192.168.199.161:8080/images/BuDaiMo/region_2/jiLiu.jpg', 2, '1'),(7, '二元', '鸡皮', 'http://192.168.199.161:8080/images/BuDaiMo/region_2/jiPi.jpg', 2, '1'),(8, '二元', '鸡心', 'http://192.168.199.161:8080/images/BuDaiMo/region_2/jiXin.jpg', 2, '1'),(9, '拌饭', '拌饭', 'http://192.168.199.161:8080/images/BuDaiMo/banFan/banFan.jpg', 10, '1'),(10, '黄焖鸡', '黄焖鸡大份', 'http://192.168.199.161:8080/images/BuDaiMo/HuangMenJi.jpg', 12, '1'),(11, '黄焖鸡', '黄焖鸡中份', 'http://192.168.199.161:8080/images/BuDaiMo/HuangMenJi.jpg', 15, '1'),(12, '黄焖鸡', '黄焖鸡小份', 'http://192.168.199.161:8080/images/BuDaiMo/HuangMenJi.jpg', 18, '1'),(13, '米饭', '米饭', 'http://192.168.199.161:8080/images/BuDaiMo/MiFan.jpg', 1, '1'),(14, '饮料', '可口可乐', 'http://192.168.199.161:8080/images/BuDaiMo/KeKoKeLe.jpg', 3, '1');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `yanyuanorder`.`customerinfomation` WRITE;
DELETE FROM `yanyuanorder`.`customerinfomation`;
INSERT INTO `yanyuanorder`.`customerinfomation` (`user_id`,`user_name`,`user_dormitory`,`user_phone`,`user_sex`) VALUES (1, '1', '2', '3', '女'),(2, 'guan', '1415', '21333333333', '男'),(3, '贾总幺', '14444', '23114234234', '男'),(4, '贾总幺', '14444', '23114234234', '男'),(5, '贾总幺', '14444', '23114234234', '男'),(6, '贾总幺', '14444', '23114234234', '男'),(7, '关梦楠', '1514', '13123214231', '男'),(8, 'jzy', '1514', '110', '男'),(9, '关梦楠', '1514', '13123214231', '男'),(10, '关梦楠', '1514', '15137242414', '男');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `yanyuanorder`.`dapanji` WRITE;
DELETE FROM `yanyuanorder`.`dapanji`;
INSERT INTO `yanyuanorder`.`dapanji` (`id`,`menu_class`,`food_name`,`food_image`,`food_price`,`food_static`) VALUES (1, '大盘鸡', '大盘鸡小份', 'http://192.168.199.161:8080/images/DaPanJi/DaPanJi.png', 22.00, 1),(2, '大盘鸡', '大盘鸡中份', 'http://192.168.199.161:8080/images/DaPanJi/DaPanJi.png', 26.00, 1),(3, '大盘鸡', '大盘鸡大份', 'http://192.168.199.161:8080/images/DaPanJi/DaPanJi.png', 28.00, 1),(4, '米饭', '米饭', 'http://192.168.199.161:8080/images/BuDaiMo/MiFan.jpg', 1.00, 1),(5, '饮料', '可口可乐', 'http://192.168.199.161:8080/images/BuDaiMo/KeKoKeLe.jpg', 3.00, 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `yanyuanorder`.`gaijiaofan` WRITE;
DELETE FROM `yanyuanorder`.`gaijiaofan`;
INSERT INTO `yanyuanorder`.`gaijiaofan` (`id`,`menu_class`,`food_name`,`food_image`,`food_price`,`food_static`) VALUES (1, '盖浇饭', '鱼香肉丝盖饭', NULL, 12.00, '1'),(2, NULL, NULL, NULL, NULL, NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `yanyuanorder`.`images` WRITE;
DELETE FROM `yanyuanorder`.`images`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `yanyuanorder`.`merchant` WRITE;
DELETE FROM `yanyuanorder`.`merchant`;
INSERT INTO `yanyuanorder`.`merchant` (`id`,`merchant_id`,`merchant_name`,`phone`,`recommend`,`publicity_image`) VALUES (1, '1111', '布袋馍', '12580', '布袋馍介绍', 'http://192.168.199.161:8080/images/BuDaiMo/BuDaiMoIndex.jpg'),(2, '1112', '大盘鸡', '688686', '大盘鸡介绍', 'http://192.168.199.161:8080/images/BuDaiMo/region_3/daLianJiPai.jpg'),(3, '1113', '盖浇饭', '797979', '盖浇饭介绍', 'http://192.168.199.161:8080/images/BuDaiMo/region_2/daGuLian.jpg');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `yanyuanorder`.`orderinformation` WRITE;
DELETE FROM `yanyuanorder`.`orderinformation`;
INSERT INTO `yanyuanorder`.`orderinformation` (`id`,`order_time`,`order_menu`,`cus_name`,`cus_phone`,`cus_dormitory`,`cus_sex`,`order_merchant`,`order_money`,`remark`) VALUES (21, '2019-06-26 15:19:56', 'kkk', '关梦娜', '12580', '1514', '男', '布袋馍', '16', '无备注'),(22, '2019-06-26 15:20:17', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(23, '2019-06-26 15:26:39', 'kkk', '关梦娜', '12580', '1514', '男', '布袋馍', '16', '无备注'),(24, '2019-06-26 15:27:15', 'kkk', '关梦娜', '12580', '1514', '男', '布袋馍', '16', '无备注'),(25, '2019-06-26 15:32:14', 'kkk', '关梦娜', '12580', '1514', '男', '布袋馍', '16', '无备注'),(26, '2019-06-26 15:32:23', 'kkk', '关梦娜', '12580', '1514', '男', '布袋馍', NULL, '无备注'),(27, '2019-06-26 15:32:34', 'kkk', '关梦娜', '12580', '1514', '男', '布袋馍', '16', '无备注'),(28, '2019-06-26 15:38:47', 'kkk', '关梦娜', '12580', '1514', '男', '布袋馍', '16', '无备注'),(29, '2019-06-26 15:55:27', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(30, '2019-06-26 15:56:31', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(31, '2019-06-26 15:59:54', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(32, '2019-06-26 16:00:12', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(33, '2019-06-26 16:05:23', 'kkk', '关梦娜', '12580', '1514', '男', '布袋馍', '16', '无备注'),(34, '2019-06-26 16:05:48', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(35, '2019-06-26 16:07:25', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(36, '2019-06-26 16:13:33', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(37, '2019-06-26 16:13:39', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(38, '2019-06-26 16:16:00', 'sss', 'jzy', '110', '1514', '男', 'sssad', NULL, 'dsad'),(39, '2019-06-26 16:18:39', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(40, '2019-06-26 16:21:58', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(41, '2019-06-26 16:25:28', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(42, '2019-06-26 16:29:55', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(43, '2019-06-26 16:30:18', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(44, '2019-06-26 16:31:17', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(45, '2019-06-26 16:38:10', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(46, '2019-06-26 16:50:12', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(47, '2019-06-26 16:50:35', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(48, '2019-06-26 16:54:46', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(49, '2019-06-26 16:55:58', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(50, '2019-06-26 16:56:50', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(51, '2019-06-26 17:26:50', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(52, '2019-06-26 17:27:49', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(53, '2019-06-26 17:29:51', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(54, '2019-06-26 17:29:58', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(55, '2019-06-26 17:30:12', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad'),(56, '2019-06-26 17:30:20', 'sss', NULL, NULL, NULL, NULL, 'sssad', NULL, 'dsad');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `yanyuanorder`.`scollbar` WRITE;
DELETE FROM `yanyuanorder`.`scollbar`;
INSERT INTO `yanyuanorder`.`scollbar` (`id`,`photo_name`,`photo_url`,`scollBar_type`) VALUES (1, '美食1', 'http://192.168.199.161:8080/images/LunBoImages/LunBo1.jpg', '雁园点餐发布啦~~~'),(2, '美食2', 'http://192.168.199.161:8080/images/LunBoImages/LunBo2.jpg', '恭喜雁园点餐点击量突破一亿次~~~'),(3, '美食3', 'http://192.168.199.161:8080/images/LunBoImages/LunBo3.jpg', '我喜欢唱、跳、rap、篮球…');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `yanyuanorder`.`user` WRITE;
DELETE FROM `yanyuanorder`.`user`;
UNLOCK TABLES;
COMMIT;
