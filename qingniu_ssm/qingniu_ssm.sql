/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : 127.0.0.1:3306
Source Database       : qingniu_ssm

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-12-18 19:23:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `cata_id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cata_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', '果品类');
INSERT INTO `catalog` VALUES ('2', '水产类');
INSERT INTO `catalog` VALUES ('3', '粮油类');
INSERT INTO `catalog` VALUES ('4', '肉禽类');
INSERT INTO `catalog` VALUES ('5', '药食类');
INSERT INTO `catalog` VALUES ('6', '蔬菜类');
INSERT INTO `catalog` VALUES ('7', '调味类');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `good_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `parameter_id` int(11) DEFAULT NULL,
  `catalog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`good_id`),
  KEY `fk_cata` (`catalog_id`),
  KEY `fk_param` (`parameter_id`),
  CONSTRAINT `fk_cata` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`cata_id`),
  CONSTRAINT `fk_param` FOREIGN KEY (`parameter_id`) REFERENCES `good_parameter` (`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '海买大西洋三文鱼段 260g', '海买大西洋三文鱼段 260g', null, '1', '2');
INSERT INTO `good` VALUES ('2', '天谱乐食澳洲牛肉块 1000', '天谱乐食Tender Plus 澳洲牛肉块 1000g', '', '2', '1');
INSERT INTO `good` VALUES ('3', '丹麦皇冠 天然谷饲猪肋排 500g', '丹麦皇冠 天然谷饲猪肋排 500g', '', '3', '1');
INSERT INTO `good` VALUES ('4', '大原祥 乳羔羊后腿肉坯 500g', '大原祥 乳羔羊后腿肉坯 500g', '', '4', '1');
INSERT INTO `good` VALUES ('5', '墨菲丝 熟制贻贝450g', '墨菲丝 熟制贻贝450g', '', '5', '1');
INSERT INTO `good` VALUES ('6', '海买阿根廷红虾仁 350g', '海买阿根廷红虾仁 350g', '', '6', '1');
INSERT INTO `good` VALUES ('7', '海洋兄弟 挪威北极鳕颈肉 500g', '海洋兄弟 挪威北极鳕颈肉 500g', '', '7', '1');
INSERT INTO `good` VALUES ('8', '冻阿根廷红虾20/30 2kg', '冻阿根廷红虾20/30 2kg', '', '8', '1');
INSERT INTO `good` VALUES ('9', 'Sunkist 新奇士橙 4.5kg', 'Sunkist 新奇士橙 4.5kg', '', '9', '4');
INSERT INTO `good` VALUES ('10', '国产新鲜蓝莓4盒*125g', '国产新鲜蓝莓4盒*125g', '', '10', '4');
INSERT INTO `good` VALUES ('11', '越南进口火龙果*5kg', '越南进口红心火龙果5斤装\r\n', '', '11', '4');
INSERT INTO `good` VALUES ('12', '山东烟台大樱桃大红灯', '山东烟台大樱桃大红灯', '', '12', '4');
INSERT INTO `good` VALUES ('13', '妃子笑荔枝5斤装', '妃子笑荔枝5斤装', '', '13', '4');
INSERT INTO `good` VALUES ('14', '新西兰绿奇异果整箱装', '新西兰绿奇异果整箱装', '', '14', '4');
INSERT INTO `good` VALUES ('15', '佳尚新蔬 速冻玉米粒 500', '佳尚新蔬 速冻玉米粒 500', '', '15', '4');
INSERT INTO `good` VALUES ('16', '豪棒棒牛奶水果玉米棒', '豪棒棒牛奶水果玉米棒', '', '16', '4');
INSERT INTO `good` VALUES ('17', '法国乐骑士干红750ml*6', '法国乐骑士干红750ml*6', '', '17', '3');
INSERT INTO `good` VALUES ('18', '弗莱斯 罗马起泡葡萄酒', '弗莱斯 罗马起泡葡萄酒', '', '18', '3');
INSERT INTO `good` VALUES ('19', '马代苏 赤霞珠干红750ml', '马代苏 赤霞珠干红750ml', '', '19', '3');
INSERT INTO `good` VALUES ('20', '卡慕 雷岛特酿干邑白兰地', '卡慕 雷岛特酿干邑白兰地', '', '20', '3');
INSERT INTO `good` VALUES ('21', '百佳黄啤酒 330ml*3', '百佳黄啤酒 330ml*3', '', '21', '3');
INSERT INTO `good` VALUES ('22', '亿纯矿泉水750ml*12', '亿纯矿泉水750ml*12', '', '22', '3');
INSERT INTO `good` VALUES ('23', '五粮液 马到成功 52度', '五粮液 马到成功 52度', '', '23', '3');
INSERT INTO `good` VALUES ('24', '剑南春 52°500ml', '剑南春 52°500ml', '', '24', '3');
INSERT INTO `good` VALUES ('25', '纷时乐美式蜂蜜烤碧根果100g', '纷时乐美式蜂蜜烤碧根果100g', '', '25', '5');
INSERT INTO `good` VALUES ('26', '雅可 花生慕斯夹心巧克力', '雅可 花生慕斯夹心巧克力', '', '26', '5');
INSERT INTO `good` VALUES ('27', '啪啪通 虾片烤番茄味', '啪啪通 虾片烤番茄味', '', '27', '5');
INSERT INTO `good` VALUES ('28', '乐家 扁桃仁糖375g', '乐家 扁桃仁糖375g', '', '28', '5');
INSERT INTO `good` VALUES ('29', '红色拖拉机原味速食燕麦', '红色拖拉机原味速食燕麦', '', '29', '5');
INSERT INTO `good` VALUES ('30', '乐维萨欧罗金咖啡豆 250g', '乐维萨欧罗金咖啡豆 250g', '', '30', '5');
INSERT INTO `good` VALUES ('31', '迪尔玛 伯爵红茶 100g', '迪尔玛 伯爵红茶 100g', '', '31', '5');
INSERT INTO `good` VALUES ('32', '欧利美食蓝莓果酱 300g', '欧利美食蓝莓果酱 300g', '', '32', '5');
INSERT INTO `good` VALUES ('33', '大洋世家oceanfamiy鲜虾仁', '大洋世家oceanfamiy鲜虾仁', '', '33', '1');
INSERT INTO `good` VALUES ('34', 'Ocean Jade爱尔兰野黄道蟹 1kg', 'Ocean Jade爱尔兰野黄道蟹 1k', '', '34', '1');
INSERT INTO `good` VALUES ('35', '新西兰带骨羊肉块100g', '新西兰带骨羊肉块100g', '', '35', '1');
INSERT INTO `good` VALUES ('36', '大洋世家oceanfamily 巴沙鱼柳', '大洋世家oceanfamily 巴沙鱼柳', '', '36', '1');
INSERT INTO `good` VALUES ('37', '荷裕 柠檬香煎鱼排 200g', '荷裕 柠檬香煎鱼排 200g', '', '37', '1');
INSERT INTO `good` VALUES ('38', '新西兰带骨羊肉块100g', '新西兰带骨羊肉块100g', '', '38', '1');
INSERT INTO `good` VALUES ('39', '大洋世家oceanfamily 鲳鱼200g', '大洋世家oceanfamily 鲳鱼200g', '', '39', '1');
INSERT INTO `good` VALUES ('40', '大洋世家oceanfamily 半壳贻贝', '大洋世家oceanfamily 半壳贻贝', '', '40', '1');
INSERT INTO `good` VALUES ('41', '海买大西洋三文鱼段 260g', '海买大西洋三文鱼段 260g', '', '41', '5');

-- ----------------------------
-- Table structure for good_details
-- ----------------------------
DROP TABLE IF EXISTS `good_details`;
CREATE TABLE `good_details` (
  `details_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_img` varchar(255) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`details_id`),
  KEY `fk_details_goodid` (`good_id`),
  CONSTRAINT `fk_details_goodid` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_details
-- ----------------------------
INSERT INTO `good_details` VALUES ('1', '1001.jpg', '1');
INSERT INTO `good_details` VALUES ('2', 'yu01.png', '41');
INSERT INTO `good_details` VALUES ('4', 'yu02.png', '41');
INSERT INTO `good_details` VALUES ('5', 'yu03.png', '41');
INSERT INTO `good_details` VALUES ('43', 'yu05.png', '41');
INSERT INTO `good_details` VALUES ('44', 'yu06.png', '41');
INSERT INTO `good_details` VALUES ('45', 'yu07.png', '41');
INSERT INTO `good_details` VALUES ('47', 'yu08.png', '41');
INSERT INTO `good_details` VALUES ('48', 'yu09.png', '41');

-- ----------------------------
-- Table structure for good_parameter
-- ----------------------------
DROP TABLE IF EXISTS `good_parameter`;
CREATE TABLE `good_parameter` (
  `param_id` int(11) NOT NULL AUTO_INCREMENT,
  `net_volum` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `places` varchar(255) DEFAULT NULL,
  `shelf_life` varchar(255) DEFAULT NULL,
  `storage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_parameter
-- ----------------------------
INSERT INTO `good_parameter` VALUES ('1', '20kg', '新西兰羔羊', '200', '10天', '冷藏');
INSERT INTO `good_parameter` VALUES ('2', '23kg', '大洋世家', '203', '13天', '阴凉');
INSERT INTO `good_parameter` VALUES ('3', '24kg', '新西兰带骨羊肉块', '204', '14天', '干燥');
INSERT INTO `good_parameter` VALUES ('4', '25kg', '伯爵红茶', '205', '15天', '高温');
INSERT INTO `good_parameter` VALUES ('5', '26kg', '扁桃仁糖', '206', '16天', '冷藏');
INSERT INTO `good_parameter` VALUES ('6', '27kg', '欧利美食蓝莓果酱', '207', '17天', '冷藏');
INSERT INTO `good_parameter` VALUES ('7', '28kg', '罗马起泡葡萄酒', '208', '18天', '常温');
INSERT INTO `good_parameter` VALUES ('8', '29kg', '山东烟台大樱桃大红灯', '209', '19天', '阴凉');
INSERT INTO `good_parameter` VALUES ('9', '30kg', '海买阿根廷红虾仁', '210', '20天', '干燥');
INSERT INTO `good_parameter` VALUES ('10', '31kg', '国产新鲜蓝莓', '211', '21天', '高温');
INSERT INTO `good_parameter` VALUES ('11', '32kg', '墨菲丝', '212', '22天', '冷藏');
INSERT INTO `good_parameter` VALUES ('12', '10g', '海洋兄弟', '213', '23天', '冷藏');
INSERT INTO `good_parameter` VALUES ('13', '11g', '越南进口火龙果', '214', '24天', '常温');
INSERT INTO `good_parameter` VALUES ('14', '12g', '新西兰羔羊', '215', '25天', '阴凉');
INSERT INTO `good_parameter` VALUES ('15', '13g', '雅可', '216', '26天', '干燥');
INSERT INTO `good_parameter` VALUES ('16', '14g', '乐维萨欧罗', '217', '27天', '高温');
INSERT INTO `good_parameter` VALUES ('17', '15g', '大洋世家', '218', '28天', '冷藏');
INSERT INTO `good_parameter` VALUES ('18', '16g', '新西兰带骨羊肉块', '219', '29天', '冷藏');
INSERT INTO `good_parameter` VALUES ('19', '17g', '伯爵红茶', '220', '30天', '常温');
INSERT INTO `good_parameter` VALUES ('20', '18g', '扁桃仁糖', '221', '31天', '阴凉');
INSERT INTO `good_parameter` VALUES ('21', '19g', '欧利美食蓝莓果酱', '222', '32天', '干燥');
INSERT INTO `good_parameter` VALUES ('22', '20g', '罗马起泡葡萄酒', '223', '33天', '高温');
INSERT INTO `good_parameter` VALUES ('23', '21g', '山东烟台大樱桃大红灯', '224', '34天', '冷藏');
INSERT INTO `good_parameter` VALUES ('24', '22g', '海买阿根廷红虾仁', '225', '35天', '冷藏');
INSERT INTO `good_parameter` VALUES ('25', '23g', '国产新鲜蓝莓', '226', '36天', '常温');
INSERT INTO `good_parameter` VALUES ('26', '24g', '墨菲丝', '227', '37天', '阴凉');
INSERT INTO `good_parameter` VALUES ('27', '25g', '海洋兄弟', '228', '38天', '干燥');
INSERT INTO `good_parameter` VALUES ('28', '26g', '越南进口火龙果', '229', '39天', '高温');
INSERT INTO `good_parameter` VALUES ('29', '27g', '新西兰羔羊', '230', '40天', '冷藏');
INSERT INTO `good_parameter` VALUES ('30', '28g', '雅可', '231', '41天', '冷藏');
INSERT INTO `good_parameter` VALUES ('31', '29g', '乐维萨欧罗', '232', '42天', '常温');
INSERT INTO `good_parameter` VALUES ('32', '30g', '大洋世家', '233', '43天', '阴凉');
INSERT INTO `good_parameter` VALUES ('33', '31g', '新西兰带骨羊肉块', '234', '44天', '干燥');
INSERT INTO `good_parameter` VALUES ('34', '32g', '伯爵红茶', '235', '45天', '高温');
INSERT INTO `good_parameter` VALUES ('35', '33g', '扁桃仁糖', '236', '46天', '冷藏');
INSERT INTO `good_parameter` VALUES ('36', '34g', '欧利美食蓝莓果酱', '237', '47天', '冷藏');
INSERT INTO `good_parameter` VALUES ('37', '35g', '新西兰羔羊', '238', '48天', '常温');
INSERT INTO `good_parameter` VALUES ('38', '36g', '雅可', '239', '49天', '阴凉');
INSERT INTO `good_parameter` VALUES ('39', '37g', '乐维萨欧罗', '240', '50天', '干燥');
INSERT INTO `good_parameter` VALUES ('40', '38g', '大洋世家', '241', '51天', '高温');
INSERT INTO `good_parameter` VALUES ('41', '39g', '新西兰带骨羊肉块', '242', '52天', '冷藏');
INSERT INTO `good_parameter` VALUES ('42', '40g', '伯爵红茶', '243', '53天', '冷藏');
INSERT INTO `good_parameter` VALUES ('43', '41g', '扁桃仁糖', '244', '54天', '冷藏');
INSERT INTO `good_parameter` VALUES ('44', '42g', '欧利美食蓝莓果酱', '245', '55天', '冷藏');
INSERT INTO `good_parameter` VALUES ('45', '43g', '罗马起泡葡萄酒', '246', '56天', '常温');
INSERT INTO `good_parameter` VALUES ('46', '44g', '山东烟台大樱桃大红灯', '247', '57天', '阴凉');
INSERT INTO `good_parameter` VALUES ('47', '45g', '海买阿根廷红虾仁', '248', '58天', '干燥');
INSERT INTO `good_parameter` VALUES ('48', '46g', '新西兰羔羊', '249', '59天', '高温');
INSERT INTO `good_parameter` VALUES ('49', '47g', '雅可', '250', '60天', '冷藏');
INSERT INTO `good_parameter` VALUES ('50', '48g', '乐维萨欧罗', '251', '61天', '冷藏');
INSERT INTO `good_parameter` VALUES ('51', '49g', '大洋世家', '252', '62天', '常温');
INSERT INTO `good_parameter` VALUES ('52', '50g', '新西兰带骨羊肉块', '253', '63天', '阴凉');
INSERT INTO `good_parameter` VALUES ('53', '51g', '伯爵红茶', '254', '64天', '干燥');
INSERT INTO `good_parameter` VALUES ('54', '52g', '扁桃仁糖', '255', '65天', '高温');
INSERT INTO `good_parameter` VALUES ('55', '53g', '新西兰羔羊', '256', '66天', '冷藏');
INSERT INTO `good_parameter` VALUES ('56', '54g', '雅可', '257', '67天', '冷藏');
INSERT INTO `good_parameter` VALUES ('57', '55g', '乐维萨欧罗', '258', '68天', '常温');
INSERT INTO `good_parameter` VALUES ('58', '56g', '大洋世家', '259', '69天', '阴凉');
INSERT INTO `good_parameter` VALUES ('59', '57g', '新西兰带骨羊肉块', '260', '70天', '干燥');
INSERT INTO `good_parameter` VALUES ('60', '58g', '伯爵红茶', '261', '71天', '高温');
INSERT INTO `good_parameter` VALUES ('61', '59g', '扁桃仁糖', '262', '72天', '冷藏');
INSERT INTO `good_parameter` VALUES ('62', '60g', '欧利美食蓝莓果酱', '263', '73天', '冷藏');
INSERT INTO `good_parameter` VALUES ('63', '61g', '罗马起泡葡萄酒', '264', '74天', '常温');
INSERT INTO `good_parameter` VALUES ('64', '62g', '山东烟台大樱桃大红灯', '265', '75天', '阴凉');
INSERT INTO `good_parameter` VALUES ('65', '63g', '海买阿根廷红虾仁', '266', '76天', '干燥');
INSERT INTO `good_parameter` VALUES ('66', '64g', '国产新鲜蓝莓', '267', '77天', '高温');
INSERT INTO `good_parameter` VALUES ('67', '65g', '墨菲丝', '268', '78天', '冷藏');
INSERT INTO `good_parameter` VALUES ('68', '66g', '海洋兄弟', '269', '79天', '冷藏');
INSERT INTO `good_parameter` VALUES ('69', '67g', '越南进口火龙果', '270', '80天', '冷藏');
INSERT INTO `good_parameter` VALUES ('70', '68g', '新西兰羔羊', '271', '81天', '常温');
INSERT INTO `good_parameter` VALUES ('71', '69g', '雅可', '272', '82天', '阴凉');
INSERT INTO `good_parameter` VALUES ('72', '70g', '乐维萨欧罗', '273', '83天', '干燥');
INSERT INTO `good_parameter` VALUES ('73', '71g', '大洋世家', '274', '84天', '高温');
INSERT INTO `good_parameter` VALUES ('74', '72g', '新西兰羔羊', '275', '85天', '冷藏');
INSERT INTO `good_parameter` VALUES ('75', '73g', '新西兰羔羊', '276', '86天', '冷藏');
INSERT INTO `good_parameter` VALUES ('76', '74g', '雅可', '277', '87天', '常温');
INSERT INTO `good_parameter` VALUES ('77', '75g', '乐维萨欧罗', '278', '88天', '阴凉');
INSERT INTO `good_parameter` VALUES ('78', '76g', '大洋世家', '279', '89天', '干燥');
INSERT INTO `good_parameter` VALUES ('79', '77g', '新西兰带骨羊肉块', '280', '90天', '高温');
INSERT INTO `good_parameter` VALUES ('80', '78g', '伯爵红茶', '281', '91天', '冷藏');
INSERT INTO `good_parameter` VALUES ('81', '79g', '扁桃仁糖', '282', '92天', '冷藏');
INSERT INTO `good_parameter` VALUES ('82', '80g', '欧利美食蓝莓果酱', '283', '93天', '常温');
INSERT INTO `good_parameter` VALUES ('83', '81g', '罗马起泡葡萄酒', '284', '94天', '阴凉');
INSERT INTO `good_parameter` VALUES ('84', '82g', '山东烟台大樱桃大红灯', '285', '95天', '干燥');
INSERT INTO `good_parameter` VALUES ('85', '83g', '海买阿根廷红虾仁', '286', '96天', '高温');
INSERT INTO `good_parameter` VALUES ('86', '84g', '国产新鲜蓝莓', '287', '97天', '冷藏');
INSERT INTO `good_parameter` VALUES ('87', '85g', '墨菲丝', '288', '98天', '冷藏');
INSERT INTO `good_parameter` VALUES ('88', '86g', '海洋兄弟', '289', '99天', '常温');
INSERT INTO `good_parameter` VALUES ('89', '87g', '越南进口火龙果', '290', '100天', '阴凉');

-- ----------------------------
-- Table structure for good_preview
-- ----------------------------
DROP TABLE IF EXISTS `good_preview`;
CREATE TABLE `good_preview` (
  `pre_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) DEFAULT NULL,
  `pre_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pre_id`),
  KEY `fk_pre_goodid` (`good_id`),
  CONSTRAINT `fk_pre_goodid` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_preview
-- ----------------------------
INSERT INTO `good_preview` VALUES ('1', '1', '1001.jpg');
INSERT INTO `good_preview` VALUES ('2', '2', '1002.jpg');
INSERT INTO `good_preview` VALUES ('3', '3', '1003.jpg');
INSERT INTO `good_preview` VALUES ('4', '4', '1004.jpg');
INSERT INTO `good_preview` VALUES ('5', '5', '1005.jpg');
INSERT INTO `good_preview` VALUES ('6', '6', '1006.jpg');
INSERT INTO `good_preview` VALUES ('7', '7', '1007.jpg');
INSERT INTO `good_preview` VALUES ('8', '8', '1008.jpg');
INSERT INTO `good_preview` VALUES ('9', '9', '4001.jpg');
INSERT INTO `good_preview` VALUES ('10', '10', '4002.jpg');
INSERT INTO `good_preview` VALUES ('11', '11', '4003.jpg');
INSERT INTO `good_preview` VALUES ('12', '12', '4004.jpg');
INSERT INTO `good_preview` VALUES ('13', '13', '4005.jpg');
INSERT INTO `good_preview` VALUES ('14', '14', '4006.jpg');
INSERT INTO `good_preview` VALUES ('15', '15', '4007.jpg');
INSERT INTO `good_preview` VALUES ('16', '16', '4008.jpg');
INSERT INTO `good_preview` VALUES ('17', '17', '3001.jpg');
INSERT INTO `good_preview` VALUES ('18', '18', '3002.jpg');
INSERT INTO `good_preview` VALUES ('19', '19', '3003.jpg');
INSERT INTO `good_preview` VALUES ('20', '20', '3004.jpg');
INSERT INTO `good_preview` VALUES ('21', '21', '3005.jpg');
INSERT INTO `good_preview` VALUES ('22', '22', '3006.jpg');
INSERT INTO `good_preview` VALUES ('23', '23', '3007.jpg');
INSERT INTO `good_preview` VALUES ('24', '24', '3008.jpg');
INSERT INTO `good_preview` VALUES ('25', '25', '5001.jpg');
INSERT INTO `good_preview` VALUES ('27', '26', '5002.jpg');
INSERT INTO `good_preview` VALUES ('28', '27', '5003.jpg');
INSERT INTO `good_preview` VALUES ('29', '28', '5004.jpg');
INSERT INTO `good_preview` VALUES ('30', '29', '5005.jpg');
INSERT INTO `good_preview` VALUES ('31', '30', '5006.jpg');
INSERT INTO `good_preview` VALUES ('32', '31', '5007.jpg');
INSERT INTO `good_preview` VALUES ('33', '32', '5008.jpg');
INSERT INTO `good_preview` VALUES ('35', '33', '1009.jpg');
INSERT INTO `good_preview` VALUES ('36', '34', '1010.jpg');
INSERT INTO `good_preview` VALUES ('37', '35', '1011.jpg');
INSERT INTO `good_preview` VALUES ('38', '36', '1012.jpg');
INSERT INTO `good_preview` VALUES ('39', '37', '1013.jpg');
INSERT INTO `good_preview` VALUES ('40', '38', '1014.jpg');
INSERT INTO `good_preview` VALUES ('41', '39', '1015.jpg');
INSERT INTO `good_preview` VALUES ('42', '40', '1016.jpg');
INSERT INTO `good_preview` VALUES ('45', '41', '5041.png');
INSERT INTO `good_preview` VALUES ('46', '41', '5042.png');
INSERT INTO `good_preview` VALUES ('47', '41', '5043.png');
INSERT INTO `good_preview` VALUES ('48', '41', '5044.png');

-- ----------------------------
-- Table structure for good_standard
-- ----------------------------
DROP TABLE IF EXISTS `good_standard`;
CREATE TABLE `good_standard` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `specification` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`spec_id`),
  KEY `fk_stand_goodid` (`good_id`),
  CONSTRAINT `fk_stand_goodid` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_standard
-- ----------------------------
INSERT INTO `good_standard` VALUES ('1', '1', '11', '1kg');
INSERT INTO `good_standard` VALUES ('2', '2', '11', '1kg');
INSERT INTO `good_standard` VALUES ('3', '3', '13', '1kg');
INSERT INTO `good_standard` VALUES ('4', '4', '19', '1kg');
INSERT INTO `good_standard` VALUES ('5', '5', '24', '1kg');
INSERT INTO `good_standard` VALUES ('6', '6', '19', '1kg');
INSERT INTO `good_standard` VALUES ('7', '7', '17', '1kg');
INSERT INTO `good_standard` VALUES ('8', '8', '24', '1kg');
INSERT INTO `good_standard` VALUES ('9', '9', '20', '1kg');
INSERT INTO `good_standard` VALUES ('10', '10', '16', '1kg');
INSERT INTO `good_standard` VALUES ('11', '11', '21', '1kg');
INSERT INTO `good_standard` VALUES ('12', '12', '20', '1kg');
INSERT INTO `good_standard` VALUES ('13', '13', '25', '1kg');
INSERT INTO `good_standard` VALUES ('14', '14', '12', '1kg');
INSERT INTO `good_standard` VALUES ('15', '15', '15', '1kg');
INSERT INTO `good_standard` VALUES ('16', '16', '18', '1kg');
INSERT INTO `good_standard` VALUES ('17', '17', '18', '1kg');
INSERT INTO `good_standard` VALUES ('18', '18', '14', '1kg');
INSERT INTO `good_standard` VALUES ('19', '19', '18', '1kg');
INSERT INTO `good_standard` VALUES ('20', '20', '10', '1kg');
INSERT INTO `good_standard` VALUES ('21', '21', '21', '1kg');
INSERT INTO `good_standard` VALUES ('22', '22', '16', '1kg');
INSERT INTO `good_standard` VALUES ('23', '23', '13', '1kg');
INSERT INTO `good_standard` VALUES ('24', '24', '17', '1kg');
INSERT INTO `good_standard` VALUES ('25', '25', '15', '1kg');
INSERT INTO `good_standard` VALUES ('26', '26', '19', '1kg');
INSERT INTO `good_standard` VALUES ('27', '27', '23', '1kg');
INSERT INTO `good_standard` VALUES ('28', '28', '25', '1kg');
INSERT INTO `good_standard` VALUES ('29', '29', '13', '1kg');
INSERT INTO `good_standard` VALUES ('30', '30', '20', '1kg');
INSERT INTO `good_standard` VALUES ('31', '31', '21', '1kg');
INSERT INTO `good_standard` VALUES ('32', '32', '13', '1kg');
INSERT INTO `good_standard` VALUES ('33', '33', '13', '1kg');
INSERT INTO `good_standard` VALUES ('34', '34', '20', '1kg');
INSERT INTO `good_standard` VALUES ('35', '35', '12', '1kg');
INSERT INTO `good_standard` VALUES ('36', '36', '11', '1kg');
INSERT INTO `good_standard` VALUES ('37', '37', '25', '1kg');
INSERT INTO `good_standard` VALUES ('38', '38', '19', '1kg');
INSERT INTO `good_standard` VALUES ('39', '39', '20', '1kg');
INSERT INTO `good_standard` VALUES ('40', '40', '14', '1kg');
INSERT INTO `good_standard` VALUES ('41', '41', '20', '1kg');
INSERT INTO `good_standard` VALUES ('42', '1', '27', '2.5kg');
INSERT INTO `good_standard` VALUES ('43', '2', '30', '2.5kg');
INSERT INTO `good_standard` VALUES ('44', '3', '28', '2.5kg');
INSERT INTO `good_standard` VALUES ('45', '4', '28', '2.5kg');
INSERT INTO `good_standard` VALUES ('46', '5', '26', '2.5kg');
INSERT INTO `good_standard` VALUES ('47', '6', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('48', '7', '29', '2.5kg');
INSERT INTO `good_standard` VALUES ('49', '8', '27', '2.5kg');
INSERT INTO `good_standard` VALUES ('50', '9', '27', '2.5kg');
INSERT INTO `good_standard` VALUES ('51', '10', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('52', '11', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('53', '12', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('54', '13', '29', '2.5kg');
INSERT INTO `good_standard` VALUES ('55', '14', '29', '2.5kg');
INSERT INTO `good_standard` VALUES ('56', '15', '26', '2.5kg');
INSERT INTO `good_standard` VALUES ('57', '16', '26', '2.5kg');
INSERT INTO `good_standard` VALUES ('58', '17', '29', '2.5kg');
INSERT INTO `good_standard` VALUES ('59', '18', '30', '2.5kg');
INSERT INTO `good_standard` VALUES ('60', '19', '30', '2.5kg');
INSERT INTO `good_standard` VALUES ('61', '20', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('62', '21', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('63', '22', '29', '2.5kg');
INSERT INTO `good_standard` VALUES ('64', '23', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('65', '24', '29', '2.5kg');
INSERT INTO `good_standard` VALUES ('66', '25', '29', '2.5kg');
INSERT INTO `good_standard` VALUES ('67', '26', '29', '2.5kg');
INSERT INTO `good_standard` VALUES ('68', '27', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('69', '28', '30', '2.5kg');
INSERT INTO `good_standard` VALUES ('70', '29', '26', '2.5kg');
INSERT INTO `good_standard` VALUES ('71', '30', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('72', '31', '28', '2.5kg');
INSERT INTO `good_standard` VALUES ('73', '32', '28', '2.5kg');
INSERT INTO `good_standard` VALUES ('74', '33', '30', '2.5kg');
INSERT INTO `good_standard` VALUES ('75', '34', '25', '2.5kg');
INSERT INTO `good_standard` VALUES ('76', '35', '29', '2.5kg');
INSERT INTO `good_standard` VALUES ('77', '36', '26', '2.5kg');
INSERT INTO `good_standard` VALUES ('78', '37', '28', '2.5kg');
INSERT INTO `good_standard` VALUES ('79', '38', '28', '2.5kg');
INSERT INTO `good_standard` VALUES ('80', '39', '27', '2.5kg');
INSERT INTO `good_standard` VALUES ('81', '40', '28', '2.5kg');
INSERT INTO `good_standard` VALUES ('82', '41', '30', '2.5kg');
INSERT INTO `good_standard` VALUES ('83', '1', '37', '3kg');
INSERT INTO `good_standard` VALUES ('84', '2', '38', '3kg');
INSERT INTO `good_standard` VALUES ('85', '3', '36', '3kg');
INSERT INTO `good_standard` VALUES ('86', '4', '35', '3kg');
INSERT INTO `good_standard` VALUES ('87', '5', '38', '3kg');
INSERT INTO `good_standard` VALUES ('88', '6', '36', '3kg');
INSERT INTO `good_standard` VALUES ('89', '7', '34', '3kg');
INSERT INTO `good_standard` VALUES ('90', '8', '30', '3kg');
INSERT INTO `good_standard` VALUES ('91', '9', '32', '3kg');
INSERT INTO `good_standard` VALUES ('92', '10', '30', '3kg');
INSERT INTO `good_standard` VALUES ('93', '11', '36', '3kg');
INSERT INTO `good_standard` VALUES ('94', '12', '35', '3kg');
INSERT INTO `good_standard` VALUES ('95', '13', '34', '3kg');
INSERT INTO `good_standard` VALUES ('96', '14', '34', '3kg');
INSERT INTO `good_standard` VALUES ('97', '15', '35', '3kg');
INSERT INTO `good_standard` VALUES ('98', '16', '34', '3kg');
INSERT INTO `good_standard` VALUES ('99', '17', '33', '3kg');
INSERT INTO `good_standard` VALUES ('100', '18', '39', '3kg');
INSERT INTO `good_standard` VALUES ('101', '19', '34', '3kg');
INSERT INTO `good_standard` VALUES ('102', '20', '32', '3kg');
INSERT INTO `good_standard` VALUES ('103', '21', '37', '3kg');
INSERT INTO `good_standard` VALUES ('104', '22', '33', '3kg');
INSERT INTO `good_standard` VALUES ('105', '23', '34', '3kg');
INSERT INTO `good_standard` VALUES ('106', '24', '37', '3kg');
INSERT INTO `good_standard` VALUES ('107', '25', '35', '3kg');
INSERT INTO `good_standard` VALUES ('108', '26', '36', '3kg');
INSERT INTO `good_standard` VALUES ('109', '27', '32', '3kg');
INSERT INTO `good_standard` VALUES ('110', '28', '32', '3kg');
INSERT INTO `good_standard` VALUES ('111', '29', '40', '3kg');
INSERT INTO `good_standard` VALUES ('112', '30', '33', '3kg');
INSERT INTO `good_standard` VALUES ('113', '31', '36', '3kg');
INSERT INTO `good_standard` VALUES ('114', '32', '37', '3kg');
INSERT INTO `good_standard` VALUES ('115', '33', '30', '3kg');
INSERT INTO `good_standard` VALUES ('116', '34', '37', '3kg');
INSERT INTO `good_standard` VALUES ('117', '35', '34', '3kg');
INSERT INTO `good_standard` VALUES ('118', '36', '31', '3kg');
INSERT INTO `good_standard` VALUES ('119', '37', '32', '3kg');
INSERT INTO `good_standard` VALUES ('120', '38', '34', '3kg');
INSERT INTO `good_standard` VALUES ('121', '39', '38', '3kg');
INSERT INTO `good_standard` VALUES ('122', '40', '36', '3kg');
INSERT INTO `good_standard` VALUES ('123', '41', '35', '3kg');
INSERT INTO `good_standard` VALUES ('124', '1', '45', '4kg');
INSERT INTO `good_standard` VALUES ('125', '2', '33', '4kg');
INSERT INTO `good_standard` VALUES ('126', '3', '35', '4kg');
INSERT INTO `good_standard` VALUES ('127', '4', '30', '4kg');
INSERT INTO `good_standard` VALUES ('128', '5', '36', '4kg');
INSERT INTO `good_standard` VALUES ('129', '6', '47', '4kg');
INSERT INTO `good_standard` VALUES ('130', '7', '43', '4kg');
INSERT INTO `good_standard` VALUES ('131', '8', '30', '4kg');
INSERT INTO `good_standard` VALUES ('132', '9', '39', '4kg');
INSERT INTO `good_standard` VALUES ('133', '10', '30', '4kg');
INSERT INTO `good_standard` VALUES ('134', '11', '39', '4kg');
INSERT INTO `good_standard` VALUES ('135', '12', '49', '4kg');
INSERT INTO `good_standard` VALUES ('136', '13', '31', '4kg');
INSERT INTO `good_standard` VALUES ('137', '14', '50', '4kg');
INSERT INTO `good_standard` VALUES ('138', '15', '50', '4kg');
INSERT INTO `good_standard` VALUES ('139', '16', '48', '4kg');
INSERT INTO `good_standard` VALUES ('140', '17', '32', '4kg');
INSERT INTO `good_standard` VALUES ('141', '18', '40', '4kg');
INSERT INTO `good_standard` VALUES ('142', '19', '30', '4kg');
INSERT INTO `good_standard` VALUES ('143', '20', '34', '4kg');
INSERT INTO `good_standard` VALUES ('144', '21', '44', '4kg');
INSERT INTO `good_standard` VALUES ('145', '22', '31', '4kg');
INSERT INTO `good_standard` VALUES ('146', '23', '37', '4kg');
INSERT INTO `good_standard` VALUES ('147', '24', '41', '4kg');
INSERT INTO `good_standard` VALUES ('148', '25', '32', '4kg');
INSERT INTO `good_standard` VALUES ('149', '26', '49', '4kg');
INSERT INTO `good_standard` VALUES ('150', '27', '40', '4kg');
INSERT INTO `good_standard` VALUES ('151', '28', '47', '4kg');
INSERT INTO `good_standard` VALUES ('152', '29', '39', '4kg');
INSERT INTO `good_standard` VALUES ('153', '30', '31', '4kg');
INSERT INTO `good_standard` VALUES ('154', '31', '31', '4kg');
INSERT INTO `good_standard` VALUES ('155', '32', '30', '4kg');
INSERT INTO `good_standard` VALUES ('156', '33', '46', '4kg');
INSERT INTO `good_standard` VALUES ('157', '34', '38', '4kg');
INSERT INTO `good_standard` VALUES ('158', '35', '35', '4kg');
INSERT INTO `good_standard` VALUES ('159', '36', '34', '4kg');
INSERT INTO `good_standard` VALUES ('160', '37', '37', '4kg');
INSERT INTO `good_standard` VALUES ('161', '38', '31', '4kg');
INSERT INTO `good_standard` VALUES ('162', '39', '31', '4kg');
INSERT INTO `good_standard` VALUES ('163', '40', '39', '4kg');
INSERT INTO `good_standard` VALUES ('164', '41', '40', '4kg');

-- ----------------------------
-- Table structure for jikeuser
-- ----------------------------
DROP TABLE IF EXISTS `jikeuser`;
CREATE TABLE `jikeuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of jikeuser
-- ----------------------------
INSERT INTO `jikeuser` VALUES ('2', 'jike00100', '666666');
INSERT INTO `jikeuser` VALUES ('3', 'jike00200', '888888');
INSERT INTO `jikeuser` VALUES ('8', 'author001', '123456');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(40) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(40) DEFAULT NULL COMMENT '手机号码',
  `register_date` date DEFAULT NULL COMMENT '注册日期',
  PRIMARY KEY (`user_id`),
  KEY `u_name` (`user_name`),
  KEY `email` (`email`,`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'auss', '123456', '651844829@qq.com', '15624666532', '2016-12-17');
INSERT INTO `user` VALUES ('11', 'aaa5555', '123456', 'sfeng95@qq.com', null, '2016-12-18');
