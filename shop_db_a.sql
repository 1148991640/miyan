/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50730
Source Host           : localhost:3306
Source Database       : shop_db_a

Target Server Type    : MYSQL
Target Server Version : 50730
File Encoding         : 65001

Date: 2020-09-22 20:21:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `title` varchar(50) NOT NULL COMMENT '轮播图标题',
  `img` varchar(255) NOT NULL COMMENT '轮播图图片地址',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '轮播图1', '/uploads/banner/795597a0-fa58-11ea-a62a-aff8ecef1bef.jpg', '1');
INSERT INTO `banner` VALUES ('2', '轮播图2', '/uploads/banner/7cf04640-b51a-11ea-8f98-3b344c58e56b.jpg', '1');
INSERT INTO `banner` VALUES ('3', '轮播图3', '/uploads/banner/21ebfe00-b51b-11ea-8f98-3b344c58e56b.jpg', '1');
INSERT INTO `banner` VALUES ('4', '轮播图4', '/uploads/banner/8b58cc60-fa58-11ea-a62a-aff8ecef1bef.png', '1');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车主键',
  `uid` varchar(50) NOT NULL COMMENT '用户id',
  `goodsid` int(11) NOT NULL COMMENT '商品编号',
  `num` tinyint(3) NOT NULL COMMENT '数量',
  `status` tinyint(1) NOT NULL COMMENT '选中状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`goodsid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '2be08210-70fa-11ea-9c17-a5b3f9b0d2ba', '1', '3', '1');
INSERT INTO `cart` VALUES ('3', '2be08210-70fa-11ea-9c17-a5b3f9b0d2ba', '3', '1', '1');
INSERT INTO `cart` VALUES ('6', '83b04130-7283-11ea-8498-dd0ed7f822e5', '1', '1', '1');
INSERT INTO `cart` VALUES ('7', '83b04130-7283-11ea-8498-dd0ed7f822e5', '3', '1', '1');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级分类编号',
  `catename` varchar(50) NOT NULL COMMENT '分类名称',
  `img` varchar(255) NOT NULL COMMENT '分类图片',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '家用电器', '', '1');
INSERT INTO `category` VALUES ('2', '0', '手机通讯', '', '1');
INSERT INTO `category` VALUES ('3', '0', '电脑办公', '', '1');
INSERT INTO `category` VALUES ('7', '1', '电视', '/uploads/category/fc3abc50-6c2c-11ea-b86c-579aced212c2.jpg', '1');
INSERT INTO `category` VALUES ('8', '1', '空调', '/uploads/category/354b31f0-6c2d-11ea-b86c-579aced212c2.jpg', '1');
INSERT INTO `category` VALUES ('9', '1', '洗衣机', '/uploads/category/436e9470-6c2d-11ea-b86c-579aced212c2.jpg', '1');
INSERT INTO `category` VALUES ('10', '2', '手机', '/uploads/category/fee7e580-6c2d-11ea-b86c-579aced212c2.png', '1');
INSERT INTO `category` VALUES ('11', '3', '笔记本', '/uploads/category/ddb0b9f0-6de0-11ea-a8e1-0d680bf54839.jpg', '1');
INSERT INTO `category` VALUES ('15', '0', '生活用品', '/uploads/category/49bfea70-fc0d-11ea-a628-35ff2f71e512.png', '1');
INSERT INTO `category` VALUES ('16', '15', '卫生纸', '/uploads/category/57309ec0-fc0d-11ea-a628-35ff2f71e512.jpg', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `first_cateid` smallint(5) unsigned NOT NULL COMMENT '一级分类编号',
  `second_cateid` smallint(6) NOT NULL COMMENT '二级分类编号',
  `goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `img` varchar(255) NOT NULL COMMENT '商品图片',
  `description` text COMMENT '商品描述',
  `specsid` int(11) NOT NULL COMMENT '规格id',
  `specsattr` varchar(255) NOT NULL COMMENT '规则属性值',
  `isnew` tinyint(1) NOT NULL COMMENT '是否新品1是2不是',
  `ishot` tinyint(1) NOT NULL COMMENT '是否热卖1是2不是',
  `status` tinyint(1) NOT NULL COMMENT '状态1启用2禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', '7', '电视10', '3999.00', '2222.00', '/uploads/fa5c2790-6c48-11ea-b894-9bd516f4e52e.jpg', '<p><br></p>', '9', '绿色', '2', '1', '1');
INSERT INTO `goods` VALUES ('3', '1', '8', '空调9X', '5555.00', '5555.00', '/uploads/d6a0eff0-70be-11ea-91a2-9395060d7390.jpg', '<p><br></p>', '9', '蓝色', '1', '2', '1');
INSERT INTO `goods` VALUES ('4', '2', '10', '手机30', '3999.00', '4999.00', '/uploads/fb704ec0-70be-11ea-91a2-9395060d7390.jpg', '', '9', '黑色', '2', '2', '1');
INSERT INTO `goods` VALUES ('5', '3', '11', '笔记本55', '4299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '', '9', '黑色', '2', '1', '1');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用户编号',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `password` char(32) NOT NULL COMMENT '密码',
  `randstr` char(5) NOT NULL COMMENT '密码随机串',
  `addtime` char(13) NOT NULL COMMENT '注册时间',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('2', '2be08210-70fa-11ea-9c17-a5b3f9b0d2ba', '18811112222', '小U', '7517681df84ea092349aaff40c23925e', 'c9DCu', '1585403036849', '1');
INSERT INTO `member` VALUES ('3', '83b04130-7283-11ea-8498-dd0ed7f822e5', '18811113333', '小明', 'd06000aac4b3c99ac6a52517f293d176', '4AkD7', '1585571976387', '1');
INSERT INTO `member` VALUES ('4', '7730a980-bd07-11ea-981e-8bad1149c4db', '17342065909', '中原一点红', '2c24e221965fff72687a9dfe413f409c', 'JJpNe', '1593765035032', '1');
INSERT INTO `member` VALUES ('5', 'c6970c30-bd07-11ea-981e-8bad1149c4db', '17342065901', '中原一点红', 'c6c226f2f774727708dac762a331cc9a', 'HTtYA', '1593765168243', '1');
INSERT INTO `member` VALUES ('6', 'cf74a3d0-bd07-11ea-981e-8bad1149c4db', '17342065911', '中原一点红', 'e6c45cc46c14ca7dc0c510e5d4a84533', 'YpNix', '1593765183117', '1');
INSERT INTO `member` VALUES ('7', '1d2937d0-bd08-11ea-981e-8bad1149c4db', '17342065912', '中原一点红', 'd6b5f1ced3f8b68369cf04733a1f87eb', 'W6dEu', '1593765313485', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `pid` smallint(6) NOT NULL COMMENT '上级菜单编号',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(100) NOT NULL COMMENT '菜单图标',
  `type` tinyint(1) NOT NULL COMMENT '菜单类型1目录2菜单',
  `url` varchar(100) NOT NULL COMMENT '菜单地址',
  `status` tinyint(1) NOT NULL COMMENT '菜单状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单权限表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', 'el-icon-setting', '1', '', '1');
INSERT INTO `menu` VALUES ('2', '1', '菜单管理', '', '2', '/menu', '1');
INSERT INTO `menu` VALUES ('3', '1', '角色管理', '', '2', '/role', '1');
INSERT INTO `menu` VALUES ('7', '1', '管理员管理', ' ', '2', '/user', '1');
INSERT INTO `menu` VALUES ('8', '0', '商城管理', 'el-icon-s-goods', '1', '', '1');
INSERT INTO `menu` VALUES ('9', '8', '商品分类', ' ', '2', '/cate', '1');
INSERT INTO `menu` VALUES ('10', '8', '商品规格', ' ', '2', '/spec', '1');
INSERT INTO `menu` VALUES ('11', '8', '商品管理', ' ', '2', '/good', '1');
INSERT INTO `menu` VALUES ('12', '8', '会员管理', ' ', '2', '/memb', '1');
INSERT INTO `menu` VALUES ('14', '8', '轮播图管理', ' ', '2', '/bann', '1');
INSERT INTO `menu` VALUES ('15', '8', '秒杀活动', ' ', '2', '/seck', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `rolename` varchar(100) NOT NULL COMMENT '角色名称',
  `menus` varchar(255) NOT NULL COMMENT '菜单权限 存放的是菜单编号，用逗号隔开',
  `status` tinyint(1) NOT NULL COMMENT '角色状态1正常2禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('6', '超级管理员', '1,2,3,7,8,9,10,11,12,14,15,16,1,2,3,7,8,9,10,11,12,14,15,16', '1');
INSERT INTO `role` VALUES ('7', '普通管理员', '2,8,9,10,11,12,14,15,2,8,9,10,11,12,14,15', '1');

-- ----------------------------
-- Table structure for seckill
-- ----------------------------
DROP TABLE IF EXISTS `seckill`;
CREATE TABLE `seckill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '秒杀表id',
  `title` varchar(100) NOT NULL COMMENT '活动名称',
  `begintime` char(13) NOT NULL COMMENT '秒杀开始时间',
  `endtime` char(13) NOT NULL COMMENT '秒杀结束时间',
  `first_cateid` smallint(5) NOT NULL COMMENT '商品一级分类编号',
  `second_cateid` smallint(5) NOT NULL COMMENT '商品二级分类编号',
  `goodsid` int(11) NOT NULL COMMENT '商品编号',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='限时秒杀活动表';

-- ----------------------------
-- Records of seckill
-- ----------------------------
INSERT INTO `seckill` VALUES ('6', '挖速腾', '1595260800000', '1598371200000', '2', '10', '4', '1');
INSERT INTO `seckill` VALUES ('7', '电视小米', '1601481600000', '1601568000000', '1', '7', '1', '1');
INSERT INTO `seckill` VALUES ('11', '荣耀空调', '1578499200000', '1582214400000', '1', '7', '1', '1');
INSERT INTO `seckill` VALUES ('12', '艾弗森', '1600185600000', '1602691200000', '2', '10', '4', '1');
INSERT INTO `seckill` VALUES ('13', '阿萨德', '1600099200000', '1603296000000', '1', '8', '3', '1');

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `specsname` varchar(50) NOT NULL COMMENT '规格名称',
  `status` tinyint(1) NOT NULL COMMENT '规格状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格表';

-- ----------------------------
-- Records of specs
-- ----------------------------
INSERT INTO `specs` VALUES ('9', '颜色', '1');
INSERT INTO `specs` VALUES ('10', '内存', '1');

-- ----------------------------
-- Table structure for specs_attr
-- ----------------------------
DROP TABLE IF EXISTS `specs_attr`;
CREATE TABLE `specs_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格项编号',
  `specsid` int(11) NOT NULL COMMENT '规格的specsid',
  `specsval` varchar(50) NOT NULL COMMENT '规格值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格明细表';

-- ----------------------------
-- Records of specs_attr
-- ----------------------------
INSERT INTO `specs_attr` VALUES ('19', '9', '红色');
INSERT INTO `specs_attr` VALUES ('20', '9', '黄色');
INSERT INTO `specs_attr` VALUES ('21', '9', '蓝色');
INSERT INTO `specs_attr` VALUES ('22', '9', '紫色');
INSERT INTO `specs_attr` VALUES ('23', '9', '金色');
INSERT INTO `specs_attr` VALUES ('24', '9', '黑色');
INSERT INTO `specs_attr` VALUES ('25', '9', '绿色');
INSERT INTO `specs_attr` VALUES ('26', '9', '橙色');
INSERT INTO `specs_attr` VALUES ('27', '10', '32G');
INSERT INTO `specs_attr` VALUES ('28', '10', '64G');
INSERT INTO `specs_attr` VALUES ('29', '10', '128G');
INSERT INTO `specs_attr` VALUES ('30', '10', '256G');
INSERT INTO `specs_attr` VALUES ('31', '10', '512G');
INSERT INTO `specs_attr` VALUES ('32', '10', '1T');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '住建',
  `uid` varchar(50) NOT NULL COMMENT '管理员编号',
  `roleid` smallint(5) NOT NULL COMMENT '角色编号',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `randstr` char(5) NOT NULL COMMENT '随机加密串',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15', 'a09be0c0-f761-11ea-9d09-add7f668695f', '6', '宋洪超', 'b50c2f424a2a8003c3f0620e1c512d25', 'a03ni', '1');
INSERT INTO `user` VALUES ('16', '434cd620-fb3c-11ea-a9d4-83f98977b02a', '6', '宋大', '93cedd95dedba218f7a5678e2ee77e22', 'E3TPx', '1');
INSERT INTO `user` VALUES ('17', '4e2441f0-fb3c-11ea-a9d4-83f98977b02a', '7', '宋宋', '331ac9e47e7db4ad28d6d4d064568ea9', 'ftNgK', '1');
