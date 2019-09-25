/*
 Navicat Premium Data Transfer

 Source Server         : 我的服务器
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : 49.232.44.19:3306
 Source Schema         : yanyuanorder

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 23/09/2019 15:02:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for budaimo
-- ----------------------------
DROP TABLE IF EXISTS `budaimo`;
CREATE TABLE `budaimo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单分类',
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜名',
  `food_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜品图片',
  `food_price` decimal(10, 0) UNSIGNED DEFAULT NULL COMMENT '菜品价格',
  `food_static` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '菜品状态\r\n0为告罄\r\n1为正常',
  `add_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of budaimo
-- ----------------------------
INSERT INTO `budaimo` VALUES (1, '一元', '青椒', 'http://49.232.44.19:8080/images/BuDaiMo/region_1/qingJiao.jpg', 1, '1', NULL);
INSERT INTO `budaimo` VALUES (2, '一元', '金针菇', 'http://49.232.44.19:8080/images/BuDaiMo/region_1/jinZhenGu.jpg', 1, '1', NULL);
INSERT INTO `budaimo` VALUES (3, '一元', '香菇', 'http://49.232.44.19:8080/images/BuDaiMo/region_1/xiangGu.jpg', 1, '1', NULL);
INSERT INTO `budaimo` VALUES (4, '一元', '平菇', 'http://49.232.44.19:8080/images/BuDaiMo/region_1/pingGu.jpg', 1, '1', NULL);
INSERT INTO `budaimo` VALUES (5, '二元', '大骨连', 'http://49.232.44.19:8080/images/BuDaiMo/region_2/daGuLian.jpg', 2, '1', NULL);
INSERT INTO `budaimo` VALUES (6, '二元', '双鸡柳', 'http://49.232.44.19:8080/images/BuDaiMo/region_2/jiLiu.jpg', 2, '1', NULL);
INSERT INTO `budaimo` VALUES (7, '二元', '鸡皮', 'http://49.232.44.19:8080/images/BuDaiMo/region_2/jiPi.jpg', 2, '1', NULL);
INSERT INTO `budaimo` VALUES (8, '二元', '鸡心', 'http://49.232.44.19:8080/images/BuDaiMo/region_2/jiXin.jpg', 2, '1', NULL);
INSERT INTO `budaimo` VALUES (9, '拌饭', '拌饭', 'http://49.232.44.19:8080/images/BuDaiMo/banFan/banFan.jpg', 10, '1', NULL);
INSERT INTO `budaimo` VALUES (10, '黄焖鸡', '黄焖鸡大份', 'http://49.232.44.19:8080/images/BuDaiMo/HuangMenJi.jpg', 12, '1', NULL);
INSERT INTO `budaimo` VALUES (11, '黄焖鸡', '黄焖鸡中份', 'http://49.232.44.19:8080/images/BuDaiMo/HuangMenJi.jpg', 15, '1', NULL);
INSERT INTO `budaimo` VALUES (12, '黄焖鸡', '黄焖鸡小份', 'http://49.232.44.19:8080/images/BuDaiMo/HuangMenJi.jpg', 18, '1', NULL);
INSERT INTO `budaimo` VALUES (13, '米饭', '米饭', 'http://49.232.44.19:8080/images/BuDaiMo/MiFan.jpg', 1, '1', NULL);
INSERT INTO `budaimo` VALUES (14, '饮料', '可口可乐', 'http://49.232.44.19:8080/images/BuDaiMo/KeKoKeLe.jpg', 3, '1', NULL);
INSERT INTO `budaimo` VALUES (15, '测试', '测试', '49.232.44.19:8080/images/uploadFiles/测试.png', 1, '1', '2019-09-21 00:20:20');

-- ----------------------------
-- Table structure for customerinfo
-- ----------------------------
DROP TABLE IF EXISTS `customerinfo`;
CREATE TABLE `customerinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户名字',
  `dormitory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户宿舍号',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户电话',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户性别',
  `add_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '添加时间\r\n',
  PRIMARY KEY (`id`, `phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customerinfo
-- ----------------------------
INSERT INTO `customerinfo` VALUES (15, '测试名称', '1514', '95598', '男', '2019-09-18 23:35:48');
INSERT INTO `customerinfo` VALUES (16, '测试名称', '1514', '95598', '男', '2019-09-18 23:35:55');
INSERT INTO `customerinfo` VALUES (17, '关梦楠', '1514', '15137242414', '男', '2019-09-19 18:43:22');
INSERT INTO `customerinfo` VALUES (18, '关梦楠', '1514', '15137242414', '男', '2019-09-19 18:47:40');
INSERT INTO `customerinfo` VALUES (19, '关梦楠', '1514', '15137242414', '男', '2019-09-19 18:57:02');
INSERT INTO `customerinfo` VALUES (20, 'noob', '1514', '998273', '男', '2019-09-21 01:07:15');
INSERT INTO `customerinfo` VALUES (21, 'noob', '1514', '998273', '男', '2019-09-21 01:50:19');
INSERT INTO `customerinfo` VALUES (22, 'noob', '1514', '998273', '男', '2019-09-21 01:58:34');
INSERT INTO `customerinfo` VALUES (23, '测试名称', '1514', '95598', '男', '2019-09-23 14:47:40');

-- ----------------------------
-- Table structure for dapanji
-- ----------------------------
DROP TABLE IF EXISTS `dapanji`;
CREATE TABLE `dapanji`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `food_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `food_price` decimal(10, 2) DEFAULT NULL,
  `food_static` int(2) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dapanji
-- ----------------------------
INSERT INTO `dapanji` VALUES (1, '大盘鸡', '大盘鸡小份', 'http://49.232.44.19:8080/images/DaPanJi/DaPanJi.png', 22.00, 1);
INSERT INTO `dapanji` VALUES (2, '大盘鸡', '大盘鸡中份', 'http://49.232.44.19:8080/images/DaPanJi/DaPanJi.png', 26.00, 1);
INSERT INTO `dapanji` VALUES (3, '大盘鸡', '大盘鸡大份', 'http://49.232.44.19:8080/images/DaPanJi/DaPanJi.png', 28.00, 1);
INSERT INTO `dapanji` VALUES (4, '米饭', '米饭', 'http://49.232.44.19:8080/images/BuDaiMo/MiFan.jpg', 1.00, 1);
INSERT INTO `dapanji` VALUES (5, '饮料', '可口可乐', 'http://49.232.44.19:8080/images/BuDaiMo/KeKoKeLe.jpg', 3.00, 1);

-- ----------------------------
-- Table structure for gaijiaofan
-- ----------------------------
DROP TABLE IF EXISTS `gaijiaofan`;
CREATE TABLE `gaijiaofan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `food_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `food_price` decimal(10, 2) DEFAULT NULL,
  `food_static` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gaijiaofan
-- ----------------------------
INSERT INTO `gaijiaofan` VALUES (1, '盖浇饭', '鱼香肉丝盖饭', NULL, 12.00, '1');
INSERT INTO `gaijiaofan` VALUES (2, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `merchant_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商家名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商家电话',
  `recommend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '介绍',
  `publicity_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商家图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES (1, '1111', '布袋馍', '12580', '布袋馍介绍', 'http://49.232.44.19:8080/images/BuDaiMo/BuDaiMoIndex.jpg');
INSERT INTO `merchant` VALUES (2, '1112', '大盘鸡', '688686', '大盘鸡介绍', 'http://49.232.44.19:8080/images/BuDaiMo/region_3/daLianJiPai.jpg');
INSERT INTO `merchant` VALUES (3, '1113', '盖浇饭', '797979', '盖浇饭介绍', 'http://49.232.44.19:8080/images/BuDaiMo/region_2/daGuLian.jpg');
INSERT INTO `merchant` VALUES (4, '1114', '扁粉菜', '2413432', '扁粉菜介绍', 'http://49.232.44.19:8080/images/bianfencai/bianfencai.jpg');
INSERT INTO `merchant` VALUES (5, '1115', '斗鱼三丑', '2435235', '我五五开没有开挂！', 'http://49.232.44.19:8080/images/feifei/feifei.jpg');
INSERT INTO `merchant` VALUES (6, '1116', '赛文', '1243553', '世界聚焦于你', 'http://49.232.44.19:8080/images/7777/7777.jpg');

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `idKey` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键唯一标示',
  `merchant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商家',
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜品名称',
  `food_num` int(3) NOT NULL COMMENT '菜品数量',
  `food_price` int(4) NOT NULL COMMENT '菜品单价',
  `total_num` int(4) NOT NULL COMMENT '菜品总数',
  `total_price` int(4) NOT NULL COMMENT '总价',
  `cus_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户电话',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `order_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES (30, 'D79hdr0920145649', '布袋馍', '平菇', 1, 1, 5, 8, '15137242414', '备注', '2019-09-20 14:56:49');
INSERT INTO `orderinfo` VALUES (31, 'D79hdr0920145649', '布袋馍', '金针菇', 1, 1, 5, 8, '15137242414', '备注', '2019-09-20 14:56:49');
INSERT INTO `orderinfo` VALUES (32, 'D79hdr0920145649', '布袋馍', '鸡皮', 1, 2, 5, 8, '15137242414', '备注', '2019-09-20 14:56:49');
INSERT INTO `orderinfo` VALUES (33, 'D79hdr0920145649', '布袋馍', '米饭', 1, 1, 5, 8, '15137242414', '备注', '2019-09-20 14:56:49');
INSERT INTO `orderinfo` VALUES (34, 'D79hdr0920145649', '布袋馍', '可口可乐', 1, 3, 5, 8, '15137242414', '备注', '2019-09-20 14:56:49');
INSERT INTO `orderinfo` VALUES (35, 'iSX4oi0920145859', '布袋馍', '大骨连', 1, 2, 2, 17, '15137242414', '备注', '2019-09-20 14:58:59');
INSERT INTO `orderinfo` VALUES (36, 'iSX4oi0920145859', '布袋馍', '黄焖鸡中份', 1, 15, 2, 17, '15137242414', '备注', '2019-09-20 14:58:59');
INSERT INTO `orderinfo` VALUES (37, 'WN8h9U0920145951', '布袋馍', '可口可乐', 1, 3, 1, 3, '15137242414', '备注', '2019-09-20 14:59:51');
INSERT INTO `orderinfo` VALUES (38, 'DJ5itY092015043', '布袋馍', '米饭', 1, 1, 1, 1, '15137242414', '备注', '2019-09-20 15:00:43');
INSERT INTO `orderinfo` VALUES (39, '8428o409201513', '大盘鸡', '米饭', 1, 1, 1, 1, '15137242414', '备注', '2019-09-20 15:01:03');
INSERT INTO `orderinfo` VALUES (40, '3WM124092015134', '布袋馍', '平菇', 1, 1, 1, 1, '15137242414', '备注', '2019-09-20 15:01:34');
INSERT INTO `orderinfo` VALUES (41, '6390T8092015232', '布袋馍', '大骨连', 1, 2, 1, 2, '15137242414', '备注', '2019-09-20 15:02:32');
INSERT INTO `orderinfo` VALUES (42, 'i6kB6F092015418', '布袋馍', '米饭', 1, 1, 1, 1, '15137242414', '备注', '2019-09-20 15:04:18');
INSERT INTO `orderinfo` VALUES (43, '1bW32D092015442', '布袋馍', '米饭', 1, 1, 1, 1, '15137242414', '备注', '2019-09-20 15:04:42');
INSERT INTO `orderinfo` VALUES (44, '3kcW480920151234', '布袋馍', '香菇', 1, 1, 1, 1, '15137242414', '备注', '2019-09-20 15:12:34');
INSERT INTO `orderinfo` VALUES (45, 'D13YB0092102119', '布袋馍', '米饭', 1, 1, 5, 28, '2w3213432', '备注', '2019-09-21 02:11:09');
INSERT INTO `orderinfo` VALUES (46, 'D13YB0092102119', '布袋馍', '可口可乐', 1, 3, 5, 28, '2w3213432', '备注', '2019-09-21 02:11:09');
INSERT INTO `orderinfo` VALUES (47, 'D13YB0092102119', '布袋馍', '黄焖鸡大份', 1, 12, 5, 28, '2w3213432', '备注', '2019-09-21 02:11:09');
INSERT INTO `orderinfo` VALUES (48, 'D13YB0092102119', '布袋馍', '拌饭', 1, 10, 5, 28, '2w3213432', '备注', '2019-09-21 02:11:09');
INSERT INTO `orderinfo` VALUES (49, 'D13YB0092102119', '布袋馍', '鸡皮', 1, 2, 5, 28, '2w3213432', '备注', '2019-09-21 02:11:09');
INSERT INTO `orderinfo` VALUES (50, '627Yc50921021411', '布袋馍', '青椒', 1, 1, 5, 7, '1111000', '备注', '2019-09-21 02:14:11');
INSERT INTO `orderinfo` VALUES (51, '627Yc50921021411', '布袋馍', '香菇', 1, 1, 5, 7, '1111000', '备注', '2019-09-21 02:14:11');
INSERT INTO `orderinfo` VALUES (52, '627Yc50921021411', '布袋馍', '平菇', 1, 1, 5, 7, '1111000', '备注', '2019-09-21 02:14:11');
INSERT INTO `orderinfo` VALUES (53, '627Yc50921021411', '布袋馍', '大骨连', 1, 2, 5, 7, '1111000', '备注', '2019-09-21 02:14:11');
INSERT INTO `orderinfo` VALUES (54, '627Yc50921021411', '布袋馍', '大骨连', 1, 2, 5, 7, '1111000', '备注', '2019-09-21 02:14:11');
INSERT INTO `orderinfo` VALUES (55, '7y5T770921021840', '布袋馍', '大骨连', 1, 2, 2, 3, '1111000', '备注', '2019-09-21 02:18:40');
INSERT INTO `orderinfo` VALUES (56, '7y5T770921021840', '布袋馍', '香菇', 1, 1, 2, 3, '1111000', '备注', '2019-09-21 02:18:40');
INSERT INTO `orderinfo` VALUES (57, 'fzN2B10921022811', '布袋馍', '米饭', 1, 1, 2, 16, '2w3213432', '备注', '2019-09-21 02:28:11');
INSERT INTO `orderinfo` VALUES (58, 'fzN2B10921022811', '布袋馍', '黄焖鸡中份', 1, 15, 2, 16, '2w3213432', '备注', '2019-09-21 02:28:11');
INSERT INTO `orderinfo` VALUES (59, '93m2200923095010', '布袋馍', '金针菇', 1, 1, 2, 2, '15137242414', '备注', '2019-09-23 09:50:10');
INSERT INTO `orderinfo` VALUES (60, '93m2200923095010', '布袋馍', '香菇', 1, 1, 2, 2, '15137242414', '备注', '2019-09-23 09:50:10');
INSERT INTO `orderinfo` VALUES (61, '3Jm378092309515', '布袋馍', '双鸡柳', 1, 2, 2, 4, '15137242414', '备注', '2019-09-23 09:51:05');
INSERT INTO `orderinfo` VALUES (62, '3Jm378092309515', '布袋馍', '大骨连', 1, 2, 2, 4, '15137242414', '备注', '2019-09-23 09:51:05');
INSERT INTO `orderinfo` VALUES (63, '6447270923105750', '布袋馍', '香菇', 2, 1, 4, 6, '15137242414', '备注', '2019-09-23 10:57:50');
INSERT INTO `orderinfo` VALUES (64, '6447270923105750', '布袋馍', '双鸡柳', 1, 2, 4, 6, '15137242414', '备注', '2019-09-23 10:57:50');
INSERT INTO `orderinfo` VALUES (65, '6447270923105750', '布袋馍', '鸡皮', 1, 2, 4, 6, '15137242414', '备注', '2019-09-23 10:57:50');
INSERT INTO `orderinfo` VALUES (66, '22Hg5q092314505', '测试店家名1', '测试菜品名称1', 5, 5, 5, 5, '555555555', '测试备注', '2019-09-23 14:50:05');
INSERT INTO `orderinfo` VALUES (67, '22Hg5q092314505', '测试店家名2', '测试菜品名称2', 5, 5, 5, 5, '555555555', '测试备注', '2019-09-23 14:50:05');

-- ----------------------------
-- Table structure for scollbar
-- ----------------------------
DROP TABLE IF EXISTS `scollbar`;
CREATE TABLE `scollbar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `photo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `scollBar_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of scollbar
-- ----------------------------
INSERT INTO `scollbar` VALUES (1, '美食1', 'http://49.232.44.19:8080/images/LunBoImages/LunBo1.jpg', '雁园点餐发布啦~~~');
INSERT INTO `scollbar` VALUES (2, '美食2', 'http://49.232.44.19:8080/images/LunBoImages/LunBo2.jpg', '恭喜雁园点餐点击量突破一亿次~~~');
INSERT INTO `scollbar` VALUES (3, '美食3', 'http://49.232.44.19:8080/images/LunBoImages/LunBo3.jpg', '我喜欢唱、跳、rap、篮球…');

SET FOREIGN_KEY_CHECKS = 1;
