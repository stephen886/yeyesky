-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1:3306
-- 生成日期: 2016 年 06 月 27 日 17:57
-- 服务器版本: 5.1.28
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `qingniu`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(200) NOT NULL,
  `apwd` varchar(200) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `admin`
--

INSERT INTO `admin` (`aid`, `aname`, `apwd`) VALUES
(1, 'xing', '123456'),
(2, 'admin', '123456');

-- --------------------------------------------------------

--
-- 表的结构 `encry_problem`
--

CREATE TABLE IF NOT EXISTS `encry_problem` (
  `problem_id` int(11) NOT NULL,
  `problem_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `encry_problem`
--

INSERT INTO `encry_problem` (`problem_id`, `problem_text`) VALUES
(1, '你最爱的人是谁'),
(2, '你的第一个小学老师是谁'),
(3, '你老豆的名字');

-- --------------------------------------------------------

--
-- 表的结构 `evaluate`
--

CREATE TABLE IF NOT EXISTS `evaluate` (
  `evaluate_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `evaluate_text` varchar(255) DEFAULT NULL,
  `evaluate_date` date NOT NULL,
  PRIMARY KEY (`evaluate_id`),
  KEY `fk_goodsid` (`goods_id`),
  KEY `fk_userid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `evaluate`
--


-- --------------------------------------------------------

--
-- 表的结构 `favorite`
--

CREATE TABLE IF NOT EXISTS `favorite` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`collect_id`),
  KEY `fku` (`uid`),
  KEY `fk_g` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `favorite`
--


-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `goods_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `category_id` int(11) NOT NULL,
  `commodity_name` varchar(255) NOT NULL COMMENT '商品名称',
  `commodity_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `commodity_price` varchar(10) DEFAULT NULL COMMENT '价格',
  `production_address` varchar(255) DEFAULT '阿根廷' COMMENT '生产地址',
  `production_day` date DEFAULT '2016-06-15',
  `shelf_life` int(11) DEFAULT '30' COMMENT '保质期',
  `unit` varchar(255) DEFAULT 'kg' COMMENT '单位名称',
  `values` varchar(11) DEFAULT '20' COMMENT '单位数值',
  PRIMARY KEY (`goods_id`),
  KEY `fgh` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- 导出表中的数据 `goods`
--

INSERT INTO `goods` (`goods_id`, `category_id`, `commodity_name`, `commodity_desc`, `commodity_price`, `production_address`, `production_day`, `shelf_life`, `unit`, `values`) VALUES
(1, 1, '新西兰羔羊去骨羊肩肉', 'OVATION 新西兰 羔羊去骨羊肩肉（散养羔羊腿肉/手切羊肉）1kg ', '108', '阿根廷', '2016-05-19', 20, 'kg', '20'),
(2, 1, '天谱乐食澳洲牛肉块 1000', '天谱乐食Tender Plus 澳洲牛肉块 1000g', '69', '阿根廷', '2016-05-19', 20, 'kg', '20'),
(3, 1, '丹麦皇冠 天然谷饲猪肋排 500g', '丹麦皇冠 天然谷饲猪肋排 500g', '20', '阿根廷', '2016-05-19', 20, 'kg', '20'),
(4, 1, '大原祥 乳羔羊后腿肉坯 500g', '大原祥 乳羔羊后腿肉坯 500g', '20', '阿根廷', '2016-05-19', 20, 'kg', '10'),
(5, 1, '墨菲丝 熟制贻贝450g', '墨菲丝 熟制贻贝450g', '30', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(6, 1, '海买阿根廷红虾仁 350g', '海买阿根廷红虾仁 350g', '20', '阿根廷', '2016-05-19', 51, 'kg', '20'),
(7, 1, '海洋兄弟 挪威北极鳕颈肉 500g', '海洋兄弟 挪威北极鳕颈肉 500g', '20', '阿根廷', '2016-05-19', 45, 'kg', '250'),
(8, 1, '冻阿根廷红虾20/30 2kg', '冻阿根廷红虾20/30 2kg', '50', '阿根廷', '2016-05-19', 10, 'kg', '50'),
(9, 4, 'Sunkist 新奇士橙 4.5kg', 'Sunkist 新奇士橙 4.5kg', '66', '阿根廷', '2016-05-19', 20, 'kg', '20'),
(10, 4, '国产新鲜蓝莓4盒*125g', '国产新鲜蓝莓4盒*125g', '20', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(11, 4, '越南进口火龙果*5kg', '越南进口红心火龙果5斤装\r\n', '50', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(12, 4, '山东烟台大樱桃大红灯', '山东烟台大樱桃大红灯', '50', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(13, 4, '妃子笑荔枝5斤装', '妃子笑荔枝5斤装', '50', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(14, 4, '新西兰绿奇异果整箱装', '新西兰绿奇异果整箱装', '54', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(15, 4, '佳尚新蔬 速冻玉米粒 500', '佳尚新蔬 速冻玉米粒 500', '54', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(16, 4, '豪棒棒牛奶水果玉米棒', '豪棒棒牛奶水果玉米棒', '50', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(17, 3, '法国乐骑士干红750ml*6', '法国乐骑士干红750ml*6', '20', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(18, 3, '弗莱斯 罗马起泡葡萄酒', '弗莱斯 罗马起泡葡萄酒', '50', '阿根廷', '2016-05-19', 50, 'kg', '20'),
(19, 3, '马代苏 赤霞珠干红750ml', '马代苏 赤霞珠干红750ml', '50', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(20, 3, '卡慕 雷岛特酿干邑白兰地', '卡慕 雷岛特酿干邑白兰地', '63', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(21, 3, '百佳黄啤酒 330ml*3', '百佳黄啤酒 330ml*3', '53', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(22, 3, '亿纯矿泉水750ml*12', '亿纯矿泉水750ml*12', '53', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(23, 3, '五粮液 马到成功 52度', '五粮液 马到成功 52度', '56', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(24, 3, '剑南春 52°500ml', '剑南春 52°500ml', '65', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(25, 5, '纷时乐美式蜂蜜烤碧根果100g', '纷时乐美式蜂蜜烤碧根果100g', '56', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(26, 5, '雅可 花生慕斯夹心巧克力', '雅可 花生慕斯夹心巧克力', '45', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(27, 5, '啪啪通 虾片烤番茄味', '啪啪通 虾片烤番茄味', '48', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(28, 5, '乐家 扁桃仁糖375g', '乐家 扁桃仁糖375g', '87', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(29, 5, '红色拖拉机原味速食燕麦', '红色拖拉机原味速食燕麦', '75', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(30, 5, '乐维萨欧罗金咖啡豆 250g', '乐维萨欧罗金咖啡豆 250g', '54', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(31, 5, '迪尔玛 伯爵红茶 100g', '迪尔玛 伯爵红茶 100g', '45', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(32, 5, '欧利美食蓝莓果酱 300g', '欧利美食蓝莓果酱 300g', '47', '阿根廷', '2016-05-19', 30, 'kg', '20'),
(33, 1, '大洋世家oceanfamiy鲜虾仁', '大洋世家oceanfamiy鲜虾仁', '54', '阿根廷', '2016-06-15', 30, 'kg', '20'),
(34, 1, 'Ocean Jade爱尔兰野黄道蟹 1kg', 'Ocean Jade爱尔兰野黄道蟹 1k', '33', '阿根廷', '2016-06-15', 30, 'kg', '20'),
(35, 1, '新西兰带骨羊肉块100g', '新西兰带骨羊肉块100g', '45', '阿根廷', '2016-06-15', 30, 'kg', '20'),
(36, 1, '大洋世家oceanfamily 巴沙鱼柳', '大洋世家oceanfamily 巴沙鱼柳', '23', '阿根廷', '2016-06-15', 30, 'kg', '20'),
(37, 1, '荷裕 柠檬香煎鱼排 200g', '荷裕 柠檬香煎鱼排 200g', '50', '阿根廷', '2016-06-15', 30, 'kg', '20'),
(38, 1, '新西兰带骨羊肉块100g', '新西兰带骨羊肉块100g', '43', '阿根廷', '2016-06-15', 30, 'kg', '20'),
(39, 1, '大洋世家oceanfamily 鲳鱼200g', '大洋世家oceanfamily 鲳鱼200g', '50', '阿根廷', '2016-06-15', 30, 'kg', '20'),
(40, 1, '大洋世家oceanfamily 半壳贻贝', '大洋世家oceanfamily 半壳贻贝', '42', '阿根廷', '2016-06-15', 30, 'kg', '20'),
(41, 5, '海买大西洋三文鱼段 260g', '海买大西洋三文鱼段 260g', '230', '阿根廷', '2016-06-15', 30, 'kg', '20');

-- --------------------------------------------------------

--
-- 表的结构 `goods_amount`
--

CREATE TABLE IF NOT EXISTS `goods_amount` (
  `goods_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `goods_amount`
--


-- --------------------------------------------------------

--
-- 表的结构 `goods_category`
--

CREATE TABLE IF NOT EXISTS `goods_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `goods_category`
--

INSERT INTO `goods_category` (`category_id`, `category_name`) VALUES
(4, '果品类'),
(5, '水产类'),
(6, '粮油类'),
(1, '肉禽类'),
(3, '药食类'),
(2, '蔬菜类'),
(7, '调味类');

-- --------------------------------------------------------

--
-- 表的结构 `goods_desc_img`
--

CREATE TABLE IF NOT EXISTS `goods_desc_img` (
  `describle_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品描述ID',
  `goods_id` int(11) NOT NULL,
  `desc_img` varchar(255) NOT NULL COMMENT '商品描述图片',
  PRIMARY KEY (`describle_id`),
  KEY `fk_gd` (`goods_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 导出表中的数据 `goods_desc_img`
--

INSERT INTO `goods_desc_img` (`describle_id`, `goods_id`, `desc_img`) VALUES
(1, 1, '1001.jpg'),
(2, 41, 'yu01.png'),
(4, 41, 'yu02.png'),
(5, 41, 'yu03.png'),
(43, 41, 'yu05.png'),
(44, 41, 'yu06.png'),
(45, 41, 'yu07.png'),
(47, 41, 'yu08.png'),
(48, 41, 'yu09.png');

-- --------------------------------------------------------

--
-- 表的结构 `goods_preview_img`
--

CREATE TABLE IF NOT EXISTS `goods_preview_img` (
  `goods_id` int(11) NOT NULL,
  `preview_img` varchar(255) NOT NULL COMMENT '商品预览图',
  `preview_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`preview_id`),
  KEY `fk_goodp` (`goods_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 导出表中的数据 `goods_preview_img`
--

INSERT INTO `goods_preview_img` (`goods_id`, `preview_img`, `preview_id`) VALUES
(1, '1001.jpg', 1),
(2, '1002.jpg', 2),
(3, '1003.jpg', 3),
(4, '1004.jpg', 4),
(5, '1005.jpg', 5),
(6, '1006.jpg', 6),
(7, '1007.jpg', 7),
(8, '1008.jpg', 8),
(9, '4001.jpg', 9),
(10, '4002.jpg', 10),
(11, '4003.jpg', 11),
(12, '4004.jpg', 12),
(13, '4005.jpg', 13),
(14, '4006.jpg', 14),
(15, '4007.jpg', 15),
(16, '4008.jpg', 16),
(17, '3001.jpg', 17),
(18, '3002.jpg', 18),
(19, '3003.jpg', 19),
(20, '3004.jpg', 20),
(21, '3005.jpg', 21),
(22, '3006.jpg', 22),
(23, '3007.jpg', 23),
(24, '3008.jpg', 24),
(25, '5001.jpg', 25),
(26, '5002.jpg', 27),
(27, '5003.jpg', 28),
(28, '5004.jpg', 29),
(29, '5005.jpg', 30),
(30, '5006.jpg', 31),
(31, '5007.jpg', 32),
(32, '5008.jpg', 33),
(33, '1009.jpg', 35),
(34, '1010.jpg', 36),
(35, '1011.jpg', 37),
(36, '1012.jpg', 38),
(37, '1013.jpg', 39),
(38, '1014.jpg', 40),
(39, '1015.jpg', 41),
(40, '1016.jpg', 42),
(41, '5041.png', 45),
(41, '5042.png', 46),
(41, '5043.png', 47),
(41, '5044.png', 48);

-- --------------------------------------------------------

--
-- 表的结构 `goods_specifications`
--

CREATE TABLE IF NOT EXISTS `goods_specifications` (
  `specifi_id` int(255) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `specifition` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  PRIMARY KEY (`specifi_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=gbk AUTO_INCREMENT=165 ;

--
-- 导出表中的数据 `goods_specifications`
--

INSERT INTO `goods_specifications` (`specifi_id`, `goods_id`, `specifition`, `price`) VALUES
(1, 1, '1kg', '11'),
(2, 2, '1kg', '11'),
(3, 3, '1kg', '13'),
(4, 4, '1kg', '19'),
(5, 5, '1kg', '24'),
(6, 6, '1kg', '19'),
(7, 7, '1kg', '17'),
(8, 8, '1kg', '24'),
(9, 9, '1kg', '20'),
(10, 10, '1kg', '16'),
(11, 11, '1kg', '21'),
(12, 12, '1kg', '20'),
(13, 13, '1kg', '25'),
(14, 14, '1kg', '12'),
(15, 15, '1kg', '15'),
(16, 16, '1kg', '18'),
(17, 17, '1kg', '18'),
(18, 18, '1kg', '14'),
(19, 19, '1kg', '18'),
(20, 20, '1kg', '10'),
(21, 21, '1kg', '21'),
(22, 22, '1kg', '16'),
(23, 23, '1kg', '13'),
(24, 24, '1kg', '17'),
(25, 25, '1kg', '15'),
(26, 26, '1kg', '19'),
(27, 27, '1kg', '23'),
(28, 28, '1kg', '25'),
(29, 29, '1kg', '13'),
(30, 30, '1kg', '20'),
(31, 31, '1kg', '21'),
(32, 32, '1kg', '13'),
(33, 33, '1kg', '13'),
(34, 34, '1kg', '20'),
(35, 35, '1kg', '12'),
(36, 36, '1kg', '11'),
(37, 37, '1kg', '25'),
(38, 38, '1kg', '19'),
(39, 39, '1kg', '20'),
(40, 40, '1kg', '14'),
(41, 41, '1kg', '20'),
(42, 1, '2.5kg', '27'),
(43, 2, '2.5kg', '30'),
(44, 3, '2.5kg', '28'),
(45, 4, '2.5kg', '28'),
(46, 5, '2.5kg', '26'),
(47, 6, '2.5kg', '25'),
(48, 7, '2.5kg', '29'),
(49, 8, '2.5kg', '27'),
(50, 9, '2.5kg', '27'),
(51, 10, '2.5kg', '25'),
(52, 11, '2.5kg', '25'),
(53, 12, '2.5kg', '25'),
(54, 13, '2.5kg', '29'),
(55, 14, '2.5kg', '29'),
(56, 15, '2.5kg', '26'),
(57, 16, '2.5kg', '26'),
(58, 17, '2.5kg', '29'),
(59, 18, '2.5kg', '30'),
(60, 19, '2.5kg', '30'),
(61, 20, '2.5kg', '25'),
(62, 21, '2.5kg', '25'),
(63, 22, '2.5kg', '29'),
(64, 23, '2.5kg', '25'),
(65, 24, '2.5kg', '29'),
(66, 25, '2.5kg', '29'),
(67, 26, '2.5kg', '29'),
(68, 27, '2.5kg', '25'),
(69, 28, '2.5kg', '30'),
(70, 29, '2.5kg', '26'),
(71, 30, '2.5kg', '25'),
(72, 31, '2.5kg', '28'),
(73, 32, '2.5kg', '28'),
(74, 33, '2.5kg', '30'),
(75, 34, '2.5kg', '25'),
(76, 35, '2.5kg', '29'),
(77, 36, '2.5kg', '26'),
(78, 37, '2.5kg', '28'),
(79, 38, '2.5kg', '28'),
(80, 39, '2.5kg', '27'),
(81, 40, '2.5kg', '28'),
(82, 41, '2.5kg', '30'),
(83, 1, '3kg', '37'),
(84, 2, '3kg', '38'),
(85, 3, '3kg', '36'),
(86, 4, '3kg', '35'),
(87, 5, '3kg', '38'),
(88, 6, '3kg', '36'),
(89, 7, '3kg', '34'),
(90, 8, '3kg', '30'),
(91, 9, '3kg', '32'),
(92, 10, '3kg', '30'),
(93, 11, '3kg', '36'),
(94, 12, '3kg', '35'),
(95, 13, '3kg', '34'),
(96, 14, '3kg', '34'),
(97, 15, '3kg', '35'),
(98, 16, '3kg', '34'),
(99, 17, '3kg', '33'),
(100, 18, '3kg', '39'),
(101, 19, '3kg', '34'),
(102, 20, '3kg', '32'),
(103, 21, '3kg', '37'),
(104, 22, '3kg', '33'),
(105, 23, '3kg', '34'),
(106, 24, '3kg', '37'),
(107, 25, '3kg', '35'),
(108, 26, '3kg', '36'),
(109, 27, '3kg', '32'),
(110, 28, '3kg', '32'),
(111, 29, '3kg', '40'),
(112, 30, '3kg', '33'),
(113, 31, '3kg', '36'),
(114, 32, '3kg', '37'),
(115, 33, '3kg', '30'),
(116, 34, '3kg', '37'),
(117, 35, '3kg', '34'),
(118, 36, '3kg', '31'),
(119, 37, '3kg', '32'),
(120, 38, '3kg', '34'),
(121, 39, '3kg', '38'),
(122, 40, '3kg', '36'),
(123, 41, '3kg', '35'),
(124, 1, '4kg', '45'),
(125, 2, '4kg', '33'),
(126, 3, '4kg', '35'),
(127, 4, '4kg', '30'),
(128, 5, '4kg', '36'),
(129, 6, '4kg', '47'),
(130, 7, '4kg', '43'),
(131, 8, '4kg', '30'),
(132, 9, '4kg', '39'),
(133, 10, '4kg', '30'),
(134, 11, '4kg', '39'),
(135, 12, '4kg', '49'),
(136, 13, '4kg', '31'),
(137, 14, '4kg', '50'),
(138, 15, '4kg', '50'),
(139, 16, '4kg', '48'),
(140, 17, '4kg', '32'),
(141, 18, '4kg', '40'),
(142, 19, '4kg', '30'),
(143, 20, '4kg', '34'),
(144, 21, '4kg', '44'),
(145, 22, '4kg', '31'),
(146, 23, '4kg', '37'),
(147, 24, '4kg', '41'),
(148, 25, '4kg', '32'),
(149, 26, '4kg', '49'),
(150, 27, '4kg', '40'),
(151, 28, '4kg', '47'),
(152, 29, '4kg', '39'),
(153, 30, '4kg', '31'),
(154, 31, '4kg', '31'),
(155, 32, '4kg', '30'),
(156, 33, '4kg', '46'),
(157, 34, '4kg', '38'),
(158, 35, '4kg', '35'),
(159, 36, '4kg', '34'),
(160, 37, '4kg', '37'),
(161, 38, '4kg', '31'),
(162, 39, '4kg', '31'),
(163, 40, '4kg', '39'),
(164, 41, '4kg', '40');

-- --------------------------------------------------------

--
-- 表的结构 `index_desc`
--

CREATE TABLE IF NOT EXISTS `index_desc` (
  `field` varchar(255) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`field`),
  KEY `fk_indexdesc` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `index_desc`
--

INSERT INTO `index_desc` (`field`, `goods_id`) VALUES
('1002', 1),
('1003', 2),
('1004', 3),
('2001', 4),
('1005', 7),
('2004', 7),
('2005', 8),
('2006', 10),
('3001', 14),
('1006', 15),
('2007', 15),
('2008', 16),
('3002', 18),
('3003', 19),
('3004', 20),
('3005', 21),
('3006', 22),
('2002', 23),
('3007', 23),
('3008', 24),
('4001', 25),
('4002', 26),
('4003', 27),
('4004', 28),
('4005', 29),
('4006', 30),
('4007', 31),
('2003', 32),
('4008', 32),
('1007', 38),
('1008', 39),
('1001', 41);

-- --------------------------------------------------------

--
-- 表的结构 `index_sildebox`
--

CREATE TABLE IF NOT EXISTS `index_sildebox` (
  `field_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `index_sildebox`
--

INSERT INTO `index_sildebox` (`field_id`, `img`, `url`) VALUES
(1, 'pic1.jpg', 'product'),
(2, 'pic2.jpg', 'product'),
(3, 'pic3.jpg', 'product'),
(4, 'pic4.jpg', 'product');

-- --------------------------------------------------------

--
-- 表的结构 `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `opid` int(11) NOT NULL AUTO_INCREMENT,
  `ooid` int(11) NOT NULL,
  `oppid` int(11) NOT NULL,
  `opmount` int(11) NOT NULL,
  `opprice` varchar(200) NOT NULL,
  PRIMARY KEY (`opid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `order_product`
--


-- --------------------------------------------------------

--
-- 表的结构 `order_user`
--

CREATE TABLE IF NOT EXISTS `order_user` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `ouid` int(11) NOT NULL,
  `oname` varchar(200) NOT NULL,
  `ophone` varchar(200) NOT NULL,
  `oadress` varchar(500) NOT NULL,
  `ostate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `order_user`
--


-- --------------------------------------------------------

--
-- 表的结构 `shopping_cart`
--

CREATE TABLE IF NOT EXISTS `shopping_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列id',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_amount` int(11) NOT NULL COMMENT '商品数量',
  `goods_price` varchar(255) NOT NULL COMMENT '价格',
  `add_date` date NOT NULL COMMENT '添加日期',
  PRIMARY KEY (`cart_id`),
  KEY `fk_goods` (`goods_id`),
  KEY `fk_user` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 导出表中的数据 `shopping_cart`
--

INSERT INTO `shopping_cart` (`cart_id`, `uid`, `goods_id`, `goods_amount`, `goods_price`, `add_date`) VALUES
(3, 2, 35, 13, '20', '2016-06-27'),
(13, 2, 10, 2, '35', '2016-06-25'),
(14, 2, 25, 8, '20', '2016-06-27'),
(15, 2, 25, 2, '30', '2016-06-27'),
(16, 2, 1, 17, '11', '2016-06-27'),
(17, 2, 14, 1, '20', '2016-06-27'),
(18, 2, 24, 1, '20', '2016-06-27');

-- --------------------------------------------------------

--
-- 表的结构 `trading`
--

CREATE TABLE IF NOT EXISTS `trading` (
  `trading_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `real_price` varchar(255) NOT NULL,
  `trading_time` datetime NOT NULL,
  `payment_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`trading_id`),
  KEY `fk_uidh` (`uid`),
  KEY `fk_gid` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `trading`
--


-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `u_name` varchar(40) NOT NULL COMMENT '用户名',
  `u_passwd` varchar(40) NOT NULL COMMENT '密码',
  `email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(40) DEFAULT NULL COMMENT '手机号码',
  `register_date` date NOT NULL COMMENT '注册日期',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email` (`email`,`phone`),
  KEY `u_name` (`u_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `user`
--

INSERT INTO `user` (`uid`, `u_name`, `u_passwd`, `email`, `phone`, `register_date`) VALUES
(1, 'tarta', '123456', 'dddsgffdh@sadfd.fvb', NULL, '2016-05-10'),
(2, 'aaa', '123456', 'dddsgffdh@sadfd.fvb', '15890345245', '2016-05-10'),
(3, 'sfeng95', '1qaz2wsx', 'sfengdf95@qq.com', NULL, '0000-00-00');

-- --------------------------------------------------------

--
-- 表的结构 `user_detail_userinfo`
--

CREATE TABLE IF NOT EXISTS `user_detail_userinfo` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `realname` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `portait` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `sex` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `residential` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '居住地址',
  PRIMARY KEY (`uid`),
  KEY `realname` (`realname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ÓÃ»§ÏêÏ¸ÐÅÏ¢±í';

--
-- 导出表中的数据 `user_detail_userinfo`
--

INSERT INTO `user_detail_userinfo` (`uid`, `realname`, `portait`, `sex`, `birthday`, `residential`) VALUES
(1, '张三', NULL, '0', '2016-06-15', '北京市东风阿飞街78号'),
(2, '李四', NULL, '1', '2007-06-15', '清远市积分是否街67号');

-- --------------------------------------------------------

--
-- 表的结构 `user_encry_problem`
--

CREATE TABLE IF NOT EXISTS `user_encry_problem` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `problem_id` int(40) NOT NULL,
  `answer` varchar(40) NOT NULL,
  PRIMARY KEY (`eid`,`uid`),
  KEY `fk_pro` (`problem_id`),
  KEY `fk_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `user_encry_problem`
--


--
-- 限制导出的表
--

--
-- 限制表 `evaluate`
--
ALTER TABLE `evaluate`
  ADD CONSTRAINT `fk_goodsid` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- 限制表 `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `fku` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  ADD CONSTRAINT `fk_g` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`);

--
-- 限制表 `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `fk_cate` FOREIGN KEY (`category_id`) REFERENCES `goods_category` (`category_id`);

--
-- 限制表 `goods_amount`
--
ALTER TABLE `goods_amount`
  ADD CONSTRAINT `fkgoodsids` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`);

--
-- 限制表 `goods_desc_img`
--
ALTER TABLE `goods_desc_img`
  ADD CONSTRAINT `fk_gidss` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`);

--
-- 限制表 `goods_preview_img`
--
ALTER TABLE `goods_preview_img`
  ADD CONSTRAINT `fgrgre` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`);

--
-- 限制表 `index_desc`
--
ALTER TABLE `index_desc`
  ADD CONSTRAINT `fk_indexdesc` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`);

--
-- 限制表 `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `fk_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- 限制表 `trading`
--
ALTER TABLE `trading`
  ADD CONSTRAINT `fk_gid` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  ADD CONSTRAINT `fk_uidh` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- 限制表 `user_detail_userinfo`
--
ALTER TABLE `user_detail_userinfo`
  ADD CONSTRAINT `fk_usid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- 限制表 `user_encry_problem`
--
ALTER TABLE `user_encry_problem`
  ADD CONSTRAINT `fk_pro` FOREIGN KEY (`problem_id`) REFERENCES `encry_problem` (`problem_id`),
  ADD CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);
