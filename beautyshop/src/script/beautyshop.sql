/*
Navicat MySQL Data Transfer

Source Server         : bs@local
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : beautyshop

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2014-03-08 18:52:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dc_attribute
-- ----------------------------
DROP TABLE IF EXISTS `dc_attribute`;
CREATE TABLE `dc_attribute` (
  `ATTR_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `ATTR_CODE` varchar(40) NOT NULL,
  `ATTR_NAME` varchar(50) DEFAULT NULL,
  `ATTR_DESC` varchar(200) DEFAULT NULL,
  `VALUE_TYPE` varchar(3) DEFAULT NULL,
  `INPUT_METHOD` varchar(3) DEFAULT NULL,
  `NULLABLE` varchar(1) DEFAULT NULL,
  `DEFAULT_VALUE` varchar(30) DEFAULT NULL,
  `MIN_VALUE` varchar(30) DEFAULT NULL,
  `MAX_VALUE` varchar(30) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ATTR_ID`),
  UNIQUE KEY `IDX_ATTRIBUTE_ATTR_CODE` (`ATTR_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_attribute
-- ----------------------------
INSERT INTO `dc_attribute` VALUES ('1', 'TEST', '测试', '测试', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('2', 'MERCHANT_KIND', '商户性质', '商户性质', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('3', 'MERCHANT_LEVEL', '商户等级', '商户等级', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('4', 'LEGAL_CERT_TYPE', '法人证件类型', '法人证件类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('5', 'MERCHANT_STATE', '商户状态', '商户状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('6', 'MERCHANT_TYPE', '商户类型', '商户类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('7', 'ADMIN_PRIVILEGE_TYPE', '权限类型', '后台权限类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('8', 'ADMIN_ROLE_STATE', '角色状态', '角色状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('9', 'ADMIN_ORG_LAN', '组织本地网', '组织本地网', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('10', 'ADMIN_ORG_LEVEL', '组织级别', '组织级别', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('11', 'ADMIN_ORG_STATUS', '组织状态', '组织状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('12', 'ADMIN_ORG_TYPE', '组织类型', '组织类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('13', 'ADMIN_STAFF_STATE', '员工状态', '员工状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('14', 'ADMIN_STAFF_GENDER', '员工性别', '员工性别', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('15', 'ADMIN_GOOD_SALEWAY', '商品销售方式', '商品销售方式', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('16', 'ADMIN_GOOD_TYPE', '商品类型', '商品类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('17', 'ADMIN_GOOD_STATE', '商品状态', '商品状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('18', 'ADMIN_TAG_TYPE', '标签类型', '标签类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('19', 'ADMIN_CATALOG_STATE', '商品目录状态', '商品目录状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('20', 'MERCHANT_PROVINCE', '商户省份', '商户省份', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('21', 'MERCHANT_CITY', '商户城市', '商户城市', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('22', 'MERCHANT_DISTRICT', '商户行政区', '商户行政区', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('23', 'ADMIN_PACKAGE_STATE', '商品包状态', '商品包状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('24', 'ADMIN_AD_LEVEL', '广告促销级别', '广告促销级别', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('25', 'ADMIN_GOODPLAN_STATE', '定价计划状态', '定价计划状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('26', 'ADMIN_GOODPLAN_TYPE', '定价计划类型', '定价计划类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('27', 'ADMIN_GOODPLAN_GOODSTYPE', '定价计划商品类型', '定价计划商品类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('28', 'IS_DRAWUP', '是否出具发票', '是否出具发票', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('29', 'NOTICE_STATE', '公告发布状态', '公告发布状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('30', 'INTERFACE_STATE', '接口状态', '接口状态', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('31', 'INTERFACE_TYPE', '接口类型', '接口类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('32', 'ADMIN_MSG_TYPE', '消息类型', '消息类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('33', 'ADMIN_MSG_RECIVERTYPE', '接收人类型', '接收人类型', null, null, null, null, null, null, '00A');
INSERT INTO `dc_attribute` VALUES ('34', 'ORDER_STATE', '订单状态', '订单状态', null, null, null, null, null, null, '00A');

-- ----------------------------
-- Table structure for dc_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `dc_attr_value`;
CREATE TABLE `dc_attr_value` (
  `ATTR_VALUE_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `ATTR_ID` int(9) DEFAULT NULL,
  `ATTR_VALUE` varchar(30) DEFAULT NULL,
  `ATTR_VALUE_DESC` varchar(250) DEFAULT NULL,
  `SORTBY` int(3) DEFAULT NULL,
  PRIMARY KEY (`ATTR_VALUE_ID`),
  KEY `IDX_ATTR_VALUE_ATTR_ID` (`ATTR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15288 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_attr_value
-- ----------------------------
INSERT INTO `dc_attr_value` VALUES ('1', '1', '0', '是', '1');
INSERT INTO `dc_attr_value` VALUES ('2', '1', '1', '否', '2');
INSERT INTO `dc_attr_value` VALUES ('3', '2', 'A', '国有', '1');
INSERT INTO `dc_attr_value` VALUES ('4', '2', 'B', '股份制', '2');
INSERT INTO `dc_attr_value` VALUES ('5', '2', 'C', '私营', '3');
INSERT INTO `dc_attr_value` VALUES ('6', '2', 'D', '个人', '4');
INSERT INTO `dc_attr_value` VALUES ('7', '3', 'L05', '五级', '1');
INSERT INTO `dc_attr_value` VALUES ('8', '3', 'L04', '四级', '2');
INSERT INTO `dc_attr_value` VALUES ('9', '3', 'L03', '三级', '3');
INSERT INTO `dc_attr_value` VALUES ('10', '3', 'L02', '二级', '4');
INSERT INTO `dc_attr_value` VALUES ('11', '3', 'L01', '一级', '5');
INSERT INTO `dc_attr_value` VALUES ('12', '4', 'T01', '身份证', '1');
INSERT INTO `dc_attr_value` VALUES ('13', '4', 'T02', '军人证', '2');
INSERT INTO `dc_attr_value` VALUES ('14', '4', 'T03', '户口薄', '3');
INSERT INTO `dc_attr_value` VALUES ('15', '4', 'T04', '单位公章证明', '4');
INSERT INTO `dc_attr_value` VALUES ('16', '5', '00A', '有效', '1');
INSERT INTO `dc_attr_value` VALUES ('17', '5', '00X', '无效', '2');
INSERT INTO `dc_attr_value` VALUES ('18', '5', '00L', '锁定', '3');
INSERT INTO `dc_attr_value` VALUES ('19', '6', '01', '集团', '1');
INSERT INTO `dc_attr_value` VALUES ('20', '6', '02', '个体', '2');
INSERT INTO `dc_attr_value` VALUES ('21', '6', '03', '分公司', '3');
INSERT INTO `dc_attr_value` VALUES ('22', '7', 'MENU', '菜单', '1');
INSERT INTO `dc_attr_value` VALUES ('23', '7', 'DATA', '数据', '2');
INSERT INTO `dc_attr_value` VALUES ('24', '7', 'BTN', '按钮', '3');
INSERT INTO `dc_attr_value` VALUES ('25', '8', '00A', '有效', '1');
INSERT INTO `dc_attr_value` VALUES ('26', '8', '00X', '无效', '2');
INSERT INTO `dc_attr_value` VALUES ('27', '9', '1', '本地网1', '1');
INSERT INTO `dc_attr_value` VALUES ('28', '10', '1', '级别1', '1');
INSERT INTO `dc_attr_value` VALUES ('29', '10', '2', '级别2', '2');
INSERT INTO `dc_attr_value` VALUES ('30', '11', '00A', '有效', '1');
INSERT INTO `dc_attr_value` VALUES ('31', '11', '00X', '无效', '2');
INSERT INTO `dc_attr_value` VALUES ('32', '12', '1', '组织类型1', '1');
INSERT INTO `dc_attr_value` VALUES ('33', '12', '2', '组织类型2', '2');
INSERT INTO `dc_attr_value` VALUES ('34', '13', '00A', '有效', '1');
INSERT INTO `dc_attr_value` VALUES ('35', '13', '00X', '无效', '2');
INSERT INTO `dc_attr_value` VALUES ('36', '14', '1', '男', '1');
INSERT INTO `dc_attr_value` VALUES ('37', '14', '0', '女', '2');
INSERT INTO `dc_attr_value` VALUES ('38', '15', '1', '销售方式1', '1');
INSERT INTO `dc_attr_value` VALUES ('39', '15', '2', '销售方式2', '2');
INSERT INTO `dc_attr_value` VALUES ('40', '16', '1', '类型1', '1');
INSERT INTO `dc_attr_value` VALUES ('41', '16', '2', '类型2', '2');
INSERT INTO `dc_attr_value` VALUES ('42', '17', '00E', '编辑中', '1');
INSERT INTO `dc_attr_value` VALUES ('43', '17', '00A', '上架', '2');
INSERT INTO `dc_attr_value` VALUES ('44', '18', '1', '类型1', '1');
INSERT INTO `dc_attr_value` VALUES ('45', '18', '2', '类型2', '2');
INSERT INTO `dc_attr_value` VALUES ('46', '19', '1', '有效', '1');
INSERT INTO `dc_attr_value` VALUES ('47', '19', '2', '无效', '2');
INSERT INTO `dc_attr_value` VALUES ('48', '17', '00X', '下架', '3');
INSERT INTO `dc_attr_value` VALUES ('52', '23', '1', '状态1', '1');
INSERT INTO `dc_attr_value` VALUES ('53', '23', '2', '状态2', '2');
INSERT INTO `dc_attr_value` VALUES ('54', '24', '1', '首页轮播广告', '1');
INSERT INTO `dc_attr_value` VALUES ('55', '24', '2', '二级广告', '2');
INSERT INTO `dc_attr_value` VALUES ('57', '25', '00A', '有效', '1');
INSERT INTO `dc_attr_value` VALUES ('58', '25', '00X', '无效', '2');
INSERT INTO `dc_attr_value` VALUES ('59', '26', '01', '数据营销', '1');
INSERT INTO `dc_attr_value` VALUES ('60', '26', '02', '分析服务', '2');
INSERT INTO `dc_attr_value` VALUES ('61', '27', '2', '商品包', '2');
INSERT INTO `dc_attr_value` VALUES ('62', '27', '1', '商品', '1');
INSERT INTO `dc_attr_value` VALUES ('3577', '28', 'Y', '是', '1');
INSERT INTO `dc_attr_value` VALUES ('3578', '28', 'N', '否', '2');
INSERT INTO `dc_attr_value` VALUES ('3579', '29', '00A', '有效', '1');
INSERT INTO `dc_attr_value` VALUES ('3580', '29', '00X', '无效', '2');
INSERT INTO `dc_attr_value` VALUES ('3581', '30', '00A', '有效', '1');
INSERT INTO `dc_attr_value` VALUES ('3582', '30', '00X', '无效', '1');
INSERT INTO `dc_attr_value` VALUES ('3583', '31', '1', 'WebService', '1');
INSERT INTO `dc_attr_value` VALUES ('3584', '31', '2', '消息接口', '2');
INSERT INTO `dc_attr_value` VALUES ('3585', '31', '3', '文件接口', '3');
INSERT INTO `dc_attr_value` VALUES ('3586', '31', '4', '其他', '4');
INSERT INTO `dc_attr_value` VALUES ('3588', '32', '01', '系统消息', '1');
INSERT INTO `dc_attr_value` VALUES ('3589', '32', '02', '用户消息', '2');
INSERT INTO `dc_attr_value` VALUES ('3590', '32', '03', '管理员消息', '3');
INSERT INTO `dc_attr_value` VALUES ('3591', '33', 'A', '全体', null);
INSERT INTO `dc_attr_value` VALUES ('3592', '33', 'U', '用户', null);
INSERT INTO `dc_attr_value` VALUES ('15284', '34', '10A', '待付款', null);
INSERT INTO `dc_attr_value` VALUES ('15285', '34', '10B', '已付款', null);
INSERT INTO `dc_attr_value` VALUES ('15286', '34', '10C', '已取消', null);
INSERT INTO `dc_attr_value` VALUES ('15287', '34', '10D', '已发货', null);


-- ----------------------------
-- Table structure for dm_address
-- ----------------------------
DROP TABLE IF EXISTS `dm_address`;
CREATE TABLE `dm_address` (
  `ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `MERCHANT_ID` int(9) DEFAULT NULL,
  `CONTACT_PERSON` varchar(20) DEFAULT NULL,
  `MOBILE_PHONE` varchar(13) DEFAULT NULL,
  `PROVINCE` varchar(10) DEFAULT NULL,
  `CITY` varchar(10) DEFAULT NULL,
  `DISTRICT` varchar(10) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `ZIP_CODE` varchar(6) DEFAULT NULL,
  `IS_DEFAULT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_address
-- ----------------------------

INSERT INTO `dm_address` VALUES ('1', '11', '千颂伊', '13838383838', '北京', '东城区', '', '紫禁城', '100000', '0');
INSERT INTO `dm_address` VALUES ('2', '11', '全智贤', '13883838383', '北京', '西城区', '', '天安门', '100000', '0');

-- ----------------------------
-- Table structure for dm_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `dm_advertisement`;
CREATE TABLE `dm_advertisement` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(9) DEFAULT NULL,
  `AD_NAME` varchar(50) DEFAULT NULL,
  `IMAGE_URL` varchar(200) DEFAULT NULL,
  `AD_DESC` varchar(100) DEFAULT NULL,
  `AD_LEVEL` char(1) DEFAULT NULL COMMENT '1:首页轮播广告,2:二级广告',
  `AD_ORDER` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_advertisement
-- ----------------------------

-- ----------------------------
-- Table structure for dm_biz_circle
-- ----------------------------
DROP TABLE IF EXISTS `dm_biz_circle`;
CREATE TABLE `dm_biz_circle` (
  `CIRCLE_ID` int(12) NOT NULL AUTO_INCREMENT,
  `INST_ID` int(12) DEFAULT NULL,
  `STATUS` varchar(6) DEFAULT NULL COMMENT '00A 有效 00N 未生效',
  `STATUS_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`CIRCLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_biz_circle
-- ----------------------------

-- ----------------------------
-- Table structure for dm_consultation
-- ----------------------------
DROP TABLE IF EXISTS `dm_consultation`;
CREATE TABLE `dm_consultation` (
  `ID` int(9) NOT NULL,
  `GOODS_ID` int(9) DEFAULT NULL,
  `MERCHANT_ID` int(9) DEFAULT NULL,
  `CONSULT_TYPE` char(1) DEFAULT NULL,
  `CONTENT` varchar(200) DEFAULT NULL,
  `COMMIT_TIME` date DEFAULT NULL,
  `REPLY_CONTENT` varchar(200) DEFAULT NULL,
  `REPLY_TIME` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_61` (`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_consultation
-- ----------------------------

-- ----------------------------
-- Table structure for dm_contact
-- ----------------------------
DROP TABLE IF EXISTS `dm_contact`;
CREATE TABLE `dm_contact` (
  `CONTACT_ID` int(9) NOT NULL AUTO_INCREMENT,
  `MERCHANT_ID` int(9) DEFAULT NULL,
  `CONTACT_NAME` varchar(20) DEFAULT NULL,
  `CONTACT_TITLE` varchar(20) DEFAULT NULL,
  `CONTACT_PHONE` varchar(20) DEFAULT NULL,
  `MOBILE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `CONTACT_DUTY` varchar(200) DEFAULT NULL,
  `COMMENTS` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`CONTACT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_contact
-- ----------------------------

-- ----------------------------
-- Table structure for dm_cust_comment
-- ----------------------------
DROP TABLE IF EXISTS `dm_cust_comment`;
CREATE TABLE `dm_cust_comment` (
  `COMMENT_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(9) DEFAULT NULL,
  `MERCHANT_ID` int(9) NOT NULL,
  `ORD_DETAIL_NO` int(9) DEFAULT NULL,
  `SCORE` int(2) DEFAULT NULL,
  `ADVANTAGE` varchar(500) DEFAULT NULL,
  `DISADVANTAGE` varchar(500) DEFAULT NULL,
  `CUST_COMMENT` varchar(2000) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `STATE` varchar(3) NOT NULL,
  PRIMARY KEY (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='客户根据订单信息对商品评价';

-- ----------------------------
-- Records of dm_cust_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dm_cust_order
-- ----------------------------
DROP TABLE IF EXISTS `dm_cust_order`;
CREATE TABLE `dm_cust_order` (
  `ORDER_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `ORDER_NO` varchar(20) NOT NULL,
  `MERCHANT_ID` int(9) NOT NULL,
  `AMOUNT` float(8,2) DEFAULT NULL,
  `RELA_MAN` varchar(20) DEFAULT NULL,
  `RELA_TEL` varchar(20) DEFAULT NULL,
  `RELA_PROVINCE` varchar(10) DEFAULT NULL,
  `RELA_CITY` varchar(10) DEFAULT NULL,
  `RELA_DISTRICT` varchar(10) DEFAULT NULL,
  `RELA_ADDR` varchar(200) DEFAULT NULL,
  `ZIP_CODE` varchar(6) DEFAULT NULL,
  `CARD_TYPE` varchar(3) DEFAULT NULL,
  `CARD_NO` varchar(50) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(1) DEFAULT NULL COMMENT '1:在线支付',
  `INVOICE_TYPE` varchar(1) DEFAULT NULL COMMENT '1:普通发票,2:增值发票',
  `INVOICE_NOTES` varchar(100) DEFAULT NULL,
  `INVOICE_DETAIL` varchar(100) DEFAULT NULL,
  `ORD_NOTES` varchar(2000) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `STATE` varchar(3) NOT NULL COMMENT '10A：待确认\r\n,10B：已确认\r\n,10C：已取消 ,10D：已完成,',
  `OPER_DATE` datetime DEFAULT NULL,
  `OPER_STAFF_NO` varchar(20) DEFAULT NULL,
  `OPER_NOTES` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20131267 DEFAULT CHARSET=utf8 COMMENT='客户订单';

-- ----------------------------
-- Records of dm_cust_order
-- ----------------------------

-- ----------------------------
-- Table structure for dm_execute_list
-- ----------------------------
DROP TABLE IF EXISTS `dm_execute_list`;
CREATE TABLE `dm_execute_list` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACT_ID` int(9) NOT NULL,
  `PHONE_NO` varchar(11) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL COMMENT '0:未处理,1:已处理\r\n            ',
  `DEAL_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_exe_list_act_id` (`ACT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='由大数据平台实时营销模块写入\r\n';

-- ----------------------------
-- Records of dm_execute_list
-- ----------------------------

-- ----------------------------
-- Table structure for dm_goods
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods`;
CREATE TABLE `dm_goods` (
  `GOODS_ID` int(9) NOT NULL AUTO_INCREMENT,
  `CATALOG_ID` int(9) DEFAULT NULL,
  `GOODS_NO` varchar(100) DEFAULT NULL,
  `GOODS_NAME` varchar(100) DEFAULT NULL,
  `ALIAS` varchar(200) DEFAULT NULL,
  `TYPE` varchar(3) DEFAULT NULL COMMENT '01:数据营销,02:数据服务\r\n            02 分析服务',
  `IMAGE_URI` varchar(100) DEFAULT NULL,
  `SALE_WAY` varchar(3) DEFAULT NULL COMMENT '01:短信,02:彩信,03:报告',
  `PRICE` float(10,2) DEFAULT NULL,
  `ORI_PRICE` float(10,2) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL COMMENT '00C:未上架,00A:已上架,00X:已下架',
  `CREATE_STAFF` varchar(6) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `EFF_DATE` datetime DEFAULT NULL,
  `EXP_DATE` datetime DEFAULT NULL,
  `PUTAWAY_TIME` datetime DEFAULT NULL,
  `GOODS_DESC` varchar(2000) DEFAULT NULL,
  `GOODS_PROPS` varchar(2000) DEFAULT NULL,
  `VIEW_COUNT` int(8) DEFAULT NULL,
  `HINTS` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_goods
-- ----------------------------
INSERT INTO `dm_goods` VALUES ('8', '10', 'CHANEL5', '香奈儿5号', '香奈儿5号', null, '/photos//goods/8/622a7b7a6b4c45b98354012a09e7d81b.jpg', null, '1999.00', '3000.00', '00A', '管理员', '2014-03-02 14:18:29', '2014-03-02 14:18:29', '2099-12-31 00:00:00', '2014-03-02 14:39:50', '香奈儿5号', null, null, '');

-- ----------------------------
-- Table structure for dm_goods_catalog
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_catalog`;
CREATE TABLE `dm_goods_catalog` (
  `CATALOG_ID` int(9) NOT NULL AUTO_INCREMENT,
  `CATALOG_NAME` varchar(200) DEFAULT NULL,
  `ALIAS` varchar(200) DEFAULT NULL,
  `CATALOG_DESC` varchar(2000) DEFAULT NULL,
  `UP_CATALOG_ID` int(9) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL,
  `CREATE_STAFF_NO` varchar(6) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `ORDER_ID` decimal(8,0) DEFAULT NULL,
  `IS_LEAF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`CATALOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_goods_catalog
-- ----------------------------
INSERT INTO `dm_goods_catalog` VALUES ('1', '香水', '香水', '香水', '-1', '1', null, '2013-12-16 12:04:55', '1', '0');
INSERT INTO `dm_goods_catalog` VALUES ('10', '女士香水', '女士香水', '女士香水', '1', '1', '管理员', '1970-01-01 08:00:00', null, '1');

-- ----------------------------
-- Table structure for dm_goods_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_evaluation`;
CREATE TABLE `dm_goods_evaluation` (
  `EVALUATION_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(9) DEFAULT NULL,
  `TOTAL_COUNT` int(8) NOT NULL,
  `AVG_SCORE` int(2) DEFAULT NULL,
  `LIKE_COUNT` int(8) DEFAULT NULL COMMENT '打分3分以上',
  `FAVOURITE_COUNT` int(8) DEFAULT NULL COMMENT '打分4分以上人数',
  `DISLIKE_COUNT` int(8) DEFAULT NULL COMMENT '打分2分以下',
  PRIMARY KEY (`EVALUATION_ID`),
  KEY `idx_goods_evaluation_goods_id` (`GOODS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品评价：根据客户评价汇总而得到的总评价';

-- ----------------------------
-- Records of dm_goods_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for dm_goods_inst
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_inst`;
CREATE TABLE `dm_goods_inst` (
  `INST_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `MERCHANT_ID` int(9) NOT NULL,
  `GOODS_ID` int(9) DEFAULT NULL,
  `GOODS_NAME` varchar(100) DEFAULT NULL,
  `GOODS_TYPE` varchar(3) DEFAULT NULL COMMENT '01:数据营销,02:数据服务',
  `PLAN_ID` int(9) DEFAULT NULL,
  `PRICE` float(8,2) DEFAULT NULL,
  `INST_NUM` int(6) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL COMMENT '00P:准备中,00R:就绪,00D:已使用',
  PRIMARY KEY (`INST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_goods_inst
-- ----------------------------

-- ----------------------------
-- Table structure for dm_goods_inst_base_rel
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_inst_base_rel`;
CREATE TABLE `dm_goods_inst_base_rel` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `CIRCLE_ID` int(12) DEFAULT NULL,
  `BASE_STATION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_goods_inst_base_rel
-- ----------------------------

-- ----------------------------
-- Table structure for dm_goods_inst_data
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_inst_data`;
CREATE TABLE `dm_goods_inst_data` (
  `ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `GOODS_INST_ID` int(9) DEFAULT NULL,
  `PHONE_NO` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GOODS_INST_DATA_INST_ID` (`GOODS_INST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品实例对应的用户号码，调用大数据接口获取';

-- ----------------------------
-- Records of dm_goods_inst_data
-- ----------------------------
INSERT INTO `dm_goods_inst_data` VALUES ('1', '1', '13800000000');
INSERT INTO `dm_goods_inst_data` VALUES ('2', '1', '18600000000');

-- ----------------------------
-- Table structure for dm_goods_inst_tag_item
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_inst_tag_item`;
CREATE TABLE `dm_goods_inst_tag_item` (
  `INST_TAG_ITEM_ID` int(9) NOT NULL AUTO_INCREMENT,
  `INST_ID` int(9) DEFAULT NULL,
  `ITEM_ID` int(9) DEFAULT NULL,
  PRIMARY KEY (`INST_TAG_ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_goods_inst_tag_item
-- ----------------------------

-- ----------------------------
-- Table structure for dm_goods_package
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_package`;
CREATE TABLE `dm_goods_package` (
  `PACKAGE_ID` int(9) NOT NULL AUTO_INCREMENT,
  `PACKAGE_CODE` varchar(50) NOT NULL,
  `PLAN_ID` int(9) DEFAULT NULL,
  `PACKAGE_NAME` varchar(50) NOT NULL,
  `PACKAGE_DESC` varchar(512) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL COMMENT '00A 有效\r\n            00X 无效',
  `EFF_DATE` datetime DEFAULT NULL,
  `EXP_DATE` datetime DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`PACKAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_goods_package
-- ----------------------------

-- ----------------------------
-- Table structure for dm_goods_plan
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_plan`;
CREATE TABLE `dm_goods_plan` (
  `PLAN_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(9) NOT NULL,
  `GOODS_TYPE` char(1) DEFAULT NULL COMMENT '1:商品,2:商品包',
  `PLAN_NAME` varchar(50) DEFAULT NULL,
  `PLAN_INTRO` varchar(200) DEFAULT NULL,
  `PLAN_PRICE` float(8,2) DEFAULT NULL,
  `PLAN_SHOW_PRICE` float(8,2) DEFAULT NULL,
  `PLAN_DESC` varchar(1000) DEFAULT NULL,
  `EFF_DATE` datetime NOT NULL,
  `EXP_DATE` datetime NOT NULL,
  `STATE_DATE` datetime DEFAULT NULL,
  `OPER_STAFF_ID` varchar(20) DEFAULT NULL,
  `OPER_STAFF_NAME` varchar(50) DEFAULT NULL,
  `PLAN_TYPE` varchar(3) DEFAULT NULL COMMENT '01 数据营销\r\n            02 分析服务',
  `STATE` varchar(3) NOT NULL COMMENT '00A 有效\r\n            00X 无效',
  PRIMARY KEY (`PLAN_ID`),
  KEY `idx_dm_goods_plan_goods_id` (`GOODS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_goods_plan
-- ----------------------------

-- ----------------------------
-- Table structure for dm_goods_tag
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_tag`;
CREATE TABLE `dm_goods_tag` (
  `TAG_GROUP_ID` int(9) NOT NULL AUTO_INCREMENT,
  `TAG_ID` int(9) DEFAULT NULL,
  `GOODS_ID` int(9) DEFAULT NULL,
  PRIMARY KEY (`TAG_GROUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_goods_tag
-- ----------------------------

-- ----------------------------
-- Table structure for dm_goods_tag_value
-- ----------------------------
DROP TABLE IF EXISTS `dm_goods_tag_value`;
CREATE TABLE `dm_goods_tag_value` (
  `TAG_VALUE_ID` int(9) NOT NULL AUTO_INCREMENT,
  `TAG_GROUP_ID` int(9) DEFAULT NULL,
  `ITEM_ID` int(9) DEFAULT NULL,
  PRIMARY KEY (`TAG_VALUE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_goods_tag_value
-- ----------------------------

-- ----------------------------
-- Table structure for dm_menu
-- ----------------------------
DROP TABLE IF EXISTS `dm_menu`;
CREATE TABLE `dm_menu` (
  `MENU_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `MENU_CODE` varchar(20) NOT NULL,
  `MENU_NAME` varchar(20) NOT NULL,
  `PARENT_MENU` int(9) NOT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `ICON` varchar(100) DEFAULT NULL,
  `IS_LEAF` char(1) DEFAULT NULL COMMENT '1:0',
  `MENU_PATH` varchar(100) DEFAULT NULL,
  `MENU_DESC` varchar(200) DEFAULT NULL,
  `MENU_ORDER` int(3) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_menu
-- ----------------------------
INSERT INTO `dm_menu` VALUES ('28', 'menu', '菜单管理', '56', '/admin/system/menu.jsp', null, '1', null, '菜单管理', null, '00A');
INSERT INTO `dm_menu` VALUES ('33', 'staffmanager', '员工管理', '56', '/admin/security/staff/staffmanager.jsp', null, '1', null, '员工管理', null, '00A');
INSERT INTO `dm_menu` VALUES ('34', 'orgmanager', '组织管理', '56', '/admin/security/org/orgmanager.jsp', null, '1', null, '组织管理', null, '00A');
INSERT INTO `dm_menu` VALUES ('35', 'rolemanager', '角色管理', '56', '/admin/security/role/rolemanager.jsp', null, '1', null, '角色管理', null, '00A');
INSERT INTO `dm_menu` VALUES ('36', 'privilegemanager', '权限管理', '56', '/admin/security/privilege/privilegemanager.jsp', null, '1', null, '权限管理', null, '00A');
INSERT INTO `dm_menu` VALUES ('55', 'user', '商家中心', '-1', null, null, '0', null, '商家中心', '2', '00X');
INSERT INTO `dm_menu` VALUES ('56', 'Backstage manager', '系统管理', '-1', null, null, '0', null, '后台管理', '3', '00A');
INSERT INTO `dm_menu` VALUES ('57', 'POC', '运营管理', '-1', null, null, '0', null, '平台运营中心', '4', '00A');
INSERT INTO `dm_menu` VALUES ('58', 'account', '商户管理', '57', '/admin/merchant/account.jsp', null, '1', null, '商户管理', '1', null);
INSERT INTO `dm_menu` VALUES ('59', 'audit', '商户资质审核', '57', '/admin/merchant/audit.jsp', null, '1', null, '商户资质审核', '2', null);
INSERT INTO `dm_menu` VALUES ('60', 'tagsmanager', '标签管理', '57', '/admin/goods/tags/tagsmanager.jsp', null, '1', null, '标签管理', '3', '00A');
INSERT INTO `dm_menu` VALUES ('61', 'tagsitemmanager', '标签值管理', '57', '/admin/goods/tagitems/tagsitemmanager.jsp', null, '1', null, '标签值管理', '4', '00A');
INSERT INTO `dm_menu` VALUES ('63', 'catalogmanager', '商品目录管理', '57', '/admin/goods/catalogs/catalogmanager.jsp', null, '1', null, '商品目录管理', '5', '00A');
INSERT INTO `dm_menu` VALUES ('64', 'goodsmanager', '商品管理', '57', '/admin/goods/good/goodsmanager.jsp', null, '1', null, '商品管理', '6', '00A');
INSERT INTO `dm_menu` VALUES ('65', 'goodpackagemanager', '商品包管理', '56', '/admin/goods/package/goodpackagemanager.jsp', null, '1', null, '商品包管理', '1', null);
INSERT INTO `dm_menu` VALUES ('66', 'goodplanmanager', '商品定价管理', '57', '/admin/goods/plan/goodplanmanager.jsp', null, '1', null, '商品定价管理', '7', null);
INSERT INTO `dm_menu` VALUES ('67', 'admanager', '广告管理', '57', '/admin/goods/ad/admanager.jsp', null, '1', null, '广告管理', '8', '00A');
INSERT INTO `dm_menu` VALUES ('68', 'invoice', '发货管理', '57', '/admin/order/orderadmin.jsp', null, '1', null, '发货管理', '2', '00A');
INSERT INTO `dm_menu` VALUES ('69', 'consulationmanager', '咨询管理', '57', '/admin/goods/consulation/consulationmanager.jsp', null, '1', null, '咨询管理', '3', '00X');
INSERT INTO `dm_menu` VALUES ('70', 'notice', '公告管理', '57', '/admin/notice/notice.jsp', null, '1', null, '公告管理', '4', '00A');
INSERT INTO `dm_menu` VALUES ('71', 'intemanager', '接口管理', '56', '/admin/inte/intemanager.jsp', null, '1', null, '接口管理', '5', '00X');
INSERT INTO `dm_menu` VALUES ('72', 'rebate', '返利管理', '57', '/admin/order/rebate.jsp', null, '1', null, '返利管理', '3', '00A');

-- ----------------------------
-- Table structure for dm_merchant
-- ----------------------------
DROP TABLE IF EXISTS `dm_merchant`;
CREATE TABLE `dm_merchant` (
  `MERCHANT_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '??ID',
  `USER_ID` int(9) DEFAULT NULL,
  `MERCHANT_CODE` varchar(40) DEFAULT NULL COMMENT '??????',
  `MERCHANT_NAME` varchar(200) DEFAULT NULL,
  `GENDER` char(1) DEFAULT NULL,
  `KIND` varchar(20) DEFAULT NULL COMMENT 'A???B????C???D??',
  `LEVEL` varchar(20) DEFAULT NULL COMMENT 'L05 ??\r\n            L04 ??\r\n            L03 ??\r\n            L02 ??\r\n            L01 ??',
  `PROVINCE` varchar(10) DEFAULT NULL,
  `CITY` varchar(10) DEFAULT NULL,
  `DISTRICT` varchar(10) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `MERCHANT_DESC` varchar(500) DEFAULT NULL,
  `LEGAL_PERSON` varchar(20) DEFAULT NULL,
  `LEGAL_CERT_TYPE` varchar(20) DEFAULT NULL COMMENT 'T01 ???\r\n            T02 ???\r\n            T03 ???\r\n            T04 ??????',
  `LEGAL_CERT_NO` varchar(40) DEFAULT NULL,
  `LICENSES_NO` varchar(40) DEFAULT NULL,
  `TAX_NO` varchar(40) DEFAULT NULL,
  `REGISTER_DATE` datetime DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL COMMENT '00A ??rn            00X ??rn            00L ??',
  `CREATE_DATE` datetime DEFAULT NULL,
  `STATE_DATE` datetime DEFAULT NULL,
  `MERCHANT_TYPE` varchar(20) DEFAULT NULL COMMENT '01 ??\r\n            02 ??\r\n            03 ???',
  PRIMARY KEY (`MERCHANT_ID`),
  KEY `FK_Reference_19` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='????????';

-- ----------------------------
-- Records of dm_merchant
-- ----------------------------
INSERT INTO `dm_merchant` VALUES ('0', '1', null, '腾讯科技', null, 'B', null, null, null, null, '华景', null, null, null, null, null, null, null, '00X', null, null, null);
INSERT INTO `dm_merchant` VALUES ('11', '18', null, '中兴软创', '1', null, null, '河南', '信阳', '浉河区', '华景新城111号', null, null, null, '', null, null, null, '00L', '2013-12-31 16:21:36', '2013-12-31 16:21:36', '01');
INSERT INTO `dm_merchant` VALUES ('17', '23', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 17:23:46', '2014-01-25 17:23:46', '01');
INSERT INTO `dm_merchant` VALUES ('20', '26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 17:36:30', '2014-01-25 17:36:30', '01');
INSERT INTO `dm_merchant` VALUES ('26', '32', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 17:46:24', '2014-01-25 17:46:24', '01');
INSERT INTO `dm_merchant` VALUES ('27', '33', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 17:47:06', '2014-01-25 17:47:06', '01');
INSERT INTO `dm_merchant` VALUES ('32', '38', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 17:52:49', '2014-01-25 17:52:49', '01');
INSERT INTO `dm_merchant` VALUES ('34', '40', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:20:27', '2014-01-25 18:20:27', '01');
INSERT INTO `dm_merchant` VALUES ('35', '41', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:22:37', '2014-01-25 18:22:37', '01');
INSERT INTO `dm_merchant` VALUES ('36', '42', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:23:13', '2014-01-25 18:23:13', '01');
INSERT INTO `dm_merchant` VALUES ('37', '43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:24:02', '2014-01-25 18:24:02', '01');
INSERT INTO `dm_merchant` VALUES ('38', '44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:25:22', '2014-01-25 18:25:22', '01');
INSERT INTO `dm_merchant` VALUES ('39', '45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:27:47', '2014-01-25 18:27:47', '01');
INSERT INTO `dm_merchant` VALUES ('40', '46', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:29:01', '2014-01-25 18:29:01', '01');
INSERT INTO `dm_merchant` VALUES ('41', '47', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:29:38', '2014-01-25 18:29:38', '01');
INSERT INTO `dm_merchant` VALUES ('42', '48', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:30:05', '2014-01-25 18:30:05', '01');
INSERT INTO `dm_merchant` VALUES ('43', '49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:30:30', '2014-01-25 18:30:30', '01');
INSERT INTO `dm_merchant` VALUES ('44', '50', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:31:02', '2014-01-25 18:31:02', '01');
INSERT INTO `dm_merchant` VALUES ('45', '51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:31:26', '2014-01-25 18:31:26', '01');
INSERT INTO `dm_merchant` VALUES ('46', '52', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 18:32:03', '2014-01-25 18:32:03', '01');
INSERT INTO `dm_merchant` VALUES ('47', '53', null, '小号', '1', null, null, '山东', '聊城', '东昌府区', '试试', null, null, null, '', null, null, null, '00L', '2014-01-25 18:47:05', '2014-01-25 18:47:05', '01');
INSERT INTO `dm_merchant` VALUES ('48', '54', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 19:33:06', '2014-01-25 19:33:06', '01');
INSERT INTO `dm_merchant` VALUES ('51', '57', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-01-25 19:41:03', '2014-01-25 19:41:03', '01');
INSERT INTO `dm_merchant` VALUES ('52', '58', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-03-01 11:19:25', '2014-03-01 11:19:25', '01');
INSERT INTO `dm_merchant` VALUES ('53', '59', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '00L', '2014-03-01 11:23:07', '2014-03-01 11:23:07', '01');

-- ----------------------------
-- Table structure for dm_merchant_activity
-- ----------------------------
DROP TABLE IF EXISTS `dm_merchant_activity`;
CREATE TABLE `dm_merchant_activity` (
  `ACT_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `GOODS_INST_ID` int(9) NOT NULL,
  `MERCHANT_ID` int(9) NOT NULL,
  `ACT_NAME` varchar(32) NOT NULL,
  `SEND_METHOD` varchar(10) NOT NULL COMMENT 'SMS:短信方式,MMS:彩信方式\r\n            ',
  `SMS_CONTENT` varchar(1000) DEFAULT NULL COMMENT '短信推送的内容的，\r\n            如果为空，\r\n            则需要再计算。',
  `BEGIN_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `PRODUCE_TIME` datetime DEFAULT NULL,
  `RULE_TIME` varchar(500) DEFAULT NULL COMMENT '用于定义实时营销活动执行的时间规则\r\n            用于实时触发时候的时间判断，不达到时间要求，则不触发。\r\n            \r\n            规则采用：\r\n            年;月;日;时间  用分号分隔，用-1表示周期性，\r\n            每个分号内可以用逗号分隔表示离散值，\r\n            用-表示连续范围值\r\n            \r\n            比如：\r\n            1、2013年7月15号 09点到18点要执行营销活动，配置为：\r\n            2013;07;15;09-18\r\n            2、2013年每月5号到10号的早上09点到18点要执行营销活动，配置为：\r\n            2013;-1;05-10;09-18;\r\n            3、每天的23点至24点要执行营销活动\r\n            -1;-1;-1;23-24\r\n            \r\n            \r\n            ',
  `CREATE_TIME` datetime DEFAULT NULL,
  `STATE` varchar(1) DEFAULT NULL COMMENT '1待审批2审批通过3审批不通过\r\n            B:待审批。已提交，待审批状态。\r\n            C:有效。已经审批通过。\r\n            D:审批未通过。已经审批过，但审批未通过。',
  `STATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ACT_ID`),
  KEY `idx_mc_act_good_inst_id` (`GOODS_INST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_merchant_activity
-- ----------------------------
INSERT INTO `dm_merchant_activity` VALUES ('4', '1', '0', '营销活动3', 'MMS', 'test3', '2013-12-10 15:41:38', '2013-12-10 17:41:46', null, null, null, '1', '2013-12-10 15:42:40');
INSERT INTO `dm_merchant_activity` VALUES ('5', '1', '0', 'test', 'MMS', 'test', '2013-12-10 00:00:00', '2013-12-10 00:00:00', null, null, null, '0', null);
INSERT INTO `dm_merchant_activity` VALUES ('13', '1', '0', '测试营销', 'SMS', '测试测试', '2013-12-11 00:00:00', '2013-12-11 00:00:00', null, null, null, '0', null);
INSERT INTO `dm_merchant_activity` VALUES ('14', '1', '0', '111', 'SMS', '2', '2013-12-12 00:00:00', '2013-12-12 00:00:00', null, null, null, '0', null);
INSERT INTO `dm_merchant_activity` VALUES ('16', '1', '0', 'test', 'SMS', 'adfadfasdfwefr ', '2013-12-13 00:00:00', '2013-12-13 00:00:00', null, null, '2013-12-13 11:32:27', '0', '2013-12-13 11:32:27');
INSERT INTO `dm_merchant_activity` VALUES ('18', '1', '0', '1', 'SMS', '1', '2013-12-13 00:00:00', '2013-12-13 00:00:00', null, null, '2013-12-13 14:23:46', '0', '2013-12-13 14:23:46');
INSERT INTO `dm_merchant_activity` VALUES ('19', '2', '0', '来唱K', 'SMS', '携好基友来唱K，送妹子了', '2013-12-26 00:00:00', '2013-12-27 00:00:00', null, null, '2013-12-25 10:09:12', '0', '2013-12-25 10:09:12');

-- ----------------------------
-- Table structure for dm_merchant_file
-- ----------------------------
DROP TABLE IF EXISTS `dm_merchant_file`;
CREATE TABLE `dm_merchant_file` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `MERCHANT_ID` int(12) DEFAULT NULL COMMENT '序列生成',
  `NAME` varchar(2000) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL COMMENT '01 营业执照\n            02 商户店面照片',
  `URI` varchar(2000) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL COMMENT '见 Checks\n            \n            00A	有效\n            00X	无效',
  `STATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_merchant_file
-- ----------------------------
INSERT INTO `dm_merchant_file` VALUES ('1', '2', null, '01', '/photos/data_market_p/merchant/a.jpg', '2001-01-08 14:04:44', '00A', null);
INSERT INTO `dm_merchant_file` VALUES ('2', '2', null, '02', '/photos/data_market_p/merchant/b.jpg', '2001-01-08 14:05:12', '00A', null);
INSERT INTO `dm_merchant_file` VALUES ('4', '2', null, '01', '/photos/data_market_p/merchant/d.jpg', '2001-01-08 14:06:01', '00A', null);
INSERT INTO `dm_merchant_file` VALUES ('5', '2', null, '02', '/photos/data_market_p/merchant/e.jpg', '2001-01-08 14:06:04', '00A', null);
INSERT INTO `dm_merchant_file` VALUES ('6', '13', '营业执照', '01', '/photos/data_market_p/mf/13/88fb8ab723e2461a9ec9193c9e9e44d8.jpg', '2014-01-02 10:37:27', '00A', '2014-01-02 10:37:27');

-- ----------------------------
-- Table structure for dm_notice
-- ----------------------------
DROP TABLE IF EXISTS `dm_notice`;
CREATE TABLE `dm_notice` (
  `NOTICE_ID` int(9) NOT NULL AUTO_INCREMENT,
  `NOTICE_TITLE` varchar(200) DEFAULT NULL,
  `NOTICE_DEST` varchar(200) DEFAULT NULL,
  `NOTICE_CONTEXT` varchar(2000) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL COMMENT '00A:??,00X:??',
  `CREATE_DATE` datetime DEFAULT NULL,
  `ORDER_ID` int(9) DEFAULT NULL,
  `PUBLISHER` varchar(200) DEFAULT NULL,
  `PUBLISH_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`NOTICE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_notice
-- ----------------------------
INSERT INTO `dm_notice` VALUES ('1', '年终送美女', '商户', '你还在耿耿于怀公司的年终奖吗，你还在眼红别人年终送车、送金条吗？？别傻啦，来商户营销平台吧，这里有美女送啊，寒夜里有人帮你暖床！！', '00A', '2014-01-16 06:00:46', '1', '商户营销平台', '2014-01-17 09:46:21');
INSERT INTO `dm_notice` VALUES ('2', '红包派发', '商户', '红包派发啦!', '00A', '2014-01-16 06:06:15', '2', '管理员', '2014-01-17 09:44:25');
INSERT INTO `dm_notice` VALUES ('3', '优惠大促销', '商户', '优惠大促销活动！！', '00A', '2014-01-16 06:06:41', '3', '商户营销平台', '2014-01-17 09:45:30');
INSERT INTO `dm_notice` VALUES ('4', '降价通知', '商户', '降价活动通知！', '00A', '2014-01-17 09:50:39', '4', '商户营销平台', '2014-01-17 11:08:44');
INSERT INTO `dm_notice` VALUES ('5', '降价商品认领', '商户', '来、来、来，降价商品认领啦！！', '00A', '2014-01-17 11:01:43', '3', '商户营销平台', '2014-01-17 11:06:46');
INSERT INTO `dm_notice` VALUES ('6', '促销', '商户', '促销', '00A', '2014-01-23 04:57:29', '5', '数据员', '2014-01-23 16:58:34');

-- ----------------------------
-- Table structure for dm_order_invoice
-- ----------------------------
DROP TABLE IF EXISTS `dm_order_invoice`;
CREATE TABLE `dm_order_invoice` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(9) DEFAULT NULL,
  `IS_DRAWUP` char(1) DEFAULT NULL,
  `INVOICE_NO` varchar(20) DEFAULT NULL,
  `MERCHANT_CODE` varchar(40) DEFAULT NULL,
  `MERCHANT_NAME` varchar(200) DEFAULT NULL,
  `RECEIVER` varchar(20) DEFAULT NULL,
  `RECEIVE_ADDRESS` varchar(100) DEFAULT NULL,
  `DRAWUP_TIME` date DEFAULT NULL,
  `OPERATOR` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_order_invoice
-- ----------------------------
INSERT INTO `dm_order_invoice` VALUES ('1', '20131248', 'Y', '1140102150000012', null, null, null, null, '2014-02-12', '管理员');

-- ----------------------------
-- Table structure for dm_organization
-- ----------------------------
DROP TABLE IF EXISTS `dm_organization`;
CREATE TABLE `dm_organization` (
  `ORG_ID` int(9) NOT NULL AUTO_INCREMENT COMMENT '同CRM',
  `PARENT_ORG_ID` int(9) DEFAULT NULL,
  `ORG_CODE` varchar(40) NOT NULL COMMENT '该字段存放4A编码，同时也是4A的org_id。接口同步时使用，也是各系统间的统一组织编码。',
  `ORG_NAME` varchar(40) NOT NULL,
  `ORG_LEVEL` int(9) DEFAULT NULL,
  `ORG_CONTENT` varchar(2000) DEFAULT NULL,
  `STATUS_CD` varchar(3) DEFAULT NULL,
  `STATUS_DATE` datetime DEFAULT NULL,
  `PATH_NAME` varchar(250) DEFAULT NULL,
  `PATH_CODE` varchar(250) DEFAULT NULL,
  `ORG_TYPE` varchar(40) DEFAULT NULL,
  `LAN_ID` int(9) DEFAULT NULL,
  `BUSINESS_ID` int(9) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `IS_LEAF` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ORG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='[P]组织';

-- ----------------------------
-- Records of dm_organization
-- ----------------------------
INSERT INTO `dm_organization` VALUES ('13', '-1', 'guangdong', '广东电信', '1', '广东电信', '00A', '2013-12-20 15:34:31', '广东电信', '13', '1', '1', null, '1970-01-01 08:00:00', '0');
INSERT INTO `dm_organization` VALUES ('14', '13', 'zidianxin', '子电信', '1', '', '00A', '2013-12-20 15:35:41', '广东电信.子电信', '13.14', '1', '1', null, '1970-01-01 08:00:00', '1');
INSERT INTO `dm_organization` VALUES ('15', '-1', 'ztesoft', '中兴通信', '1', '1111', '00A', '2013-12-23 09:24:53', '中兴通信', '15', '1', '1', null, '1970-01-01 08:00:00', '0');
INSERT INTO `dm_organization` VALUES ('16', '-1', 'guangzhouztesoft', '广州软创', '1', '测试添加根组织', '00A', '2013-12-23 09:50:57', '广州软创', '16', '1', '1', null, '1970-01-01 08:00:00', '0');

-- ----------------------------
-- Table structure for dm_package_detail
-- ----------------------------
DROP TABLE IF EXISTS `dm_package_detail`;
CREATE TABLE `dm_package_detail` (
  `PACKAGE_ID` int(9) NOT NULL,
  `GOODS_ID` int(9) NOT NULL,
  PRIMARY KEY (`PACKAGE_ID`,`GOODS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_package_detail
-- ----------------------------
INSERT INTO `dm_package_detail` VALUES ('1', '1');
INSERT INTO `dm_package_detail` VALUES ('1', '2');
INSERT INTO `dm_package_detail` VALUES ('1', '3');
INSERT INTO `dm_package_detail` VALUES ('1', '4');
INSERT INTO `dm_package_detail` VALUES ('1', '5');
INSERT INTO `dm_package_detail` VALUES ('1', '6');

-- ----------------------------
-- Table structure for dm_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `dm_pay_config`;
CREATE TABLE `dm_pay_config` (
  `ID` int(9) unsigned NOT NULL DEFAULT '0',
  `PARAM_CODE` varchar(30) NOT NULL,
  `PARAM_VALUE` varchar(255) DEFAULT NULL,
  `PARAM_DESC` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_pay_config
-- ----------------------------
INSERT INTO `dm_pay_config` VALUES ('1', 'MERCHANTID', '123456789', 'MERCHANTID');
INSERT INTO `dm_pay_config` VALUES ('2', 'MERCHANTURL', 'http://localhost:8080/DataMarket/market/pay/receive.jsp', 'MERCHANTURL');
INSERT INTO `dm_pay_config` VALUES ('3', 'ENCODETYPE', '1', 'ENCODETYPE');
INSERT INTO `dm_pay_config` VALUES ('4', 'KEY', '123456', 'KEY');
INSERT INTO `dm_pay_config` VALUES ('5', 'BANKUL', 'http://localhost:8080/DataMarket/BankServlet', 'BANKUL');
INSERT INTO `dm_pay_config` VALUES ('6', 'BANKKEY', '123456', 'BANKKEY');
INSERT INTO `dm_pay_config` VALUES ('7', 'RETNCODE', '0000', '处理结果码');
INSERT INTO `dm_pay_config` VALUES ('8', 'RETNINFO', '0000', '处理结果解释码');

-- ----------------------------
-- Table structure for dm_points
-- ----------------------------
DROP TABLE IF EXISTS `dm_points`;
CREATE TABLE `dm_points` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` int(9) DEFAULT NULL,
  `total_points` int(9) DEFAULT NULL,
  `last_exchange_time` datetime DEFAULT NULL,
  `last_exchange_points` int(11) DEFAULT NULL,
  `remainder_points` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_points
-- ----------------------------
INSERT INTO `dm_points` VALUES ('1', '18', '50', '2014-03-08 14:36:47', '20', '20');
INSERT INTO `dm_points` VALUES ('2', '32', '10', '2014-03-08 14:12:30', '10', '0');
INSERT INTO `dm_points` VALUES ('3', '46', '30', '2014-03-08 14:36:00', '30', '0');

-- ----------------------------
-- Table structure for dm_points_detail
-- ----------------------------
DROP TABLE IF EXISTS `dm_points_detail`;
CREATE TABLE `dm_points_detail` (
  `POINT_ID` int(9) NOT NULL AUTO_INCREMENT,
  `MERCHANT_ID` int(9) DEFAULT NULL COMMENT '序列生成',
  `POINT` int(9) DEFAULT NULL,
  `ORDER_NO` varchar(20) DEFAULT NULL,
  `POINT_DESC` varchar(200) DEFAULT NULL,
  `GAIN_TIME` datetime DEFAULT NULL,
  `EFF_TIME` datetime DEFAULT NULL,
  `EXP_TIME` datetime DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`POINT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_points_detail
-- ----------------------------

-- ----------------------------
-- Table structure for dm_privilege
-- ----------------------------
DROP TABLE IF EXISTS `dm_privilege`;
CREATE TABLE `dm_privilege` (
  `PRIVILEGE_ID` int(9) NOT NULL AUTO_INCREMENT,
  `PARENT_PRIVILEGE_ID` int(9) DEFAULT NULL,
  `MENU_ID` int(9) DEFAULT NULL,
  `PRIVILEGE_NAME` varchar(20) DEFAULT NULL,
  `TYPE` varchar(5) DEFAULT NULL COMMENT 'MENU;BTN;DATA',
  `IS_LEAF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`PRIVILEGE_ID`),
  KEY `FK_Reference_34` (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_privilege
-- ----------------------------
INSERT INTO `dm_privilege` VALUES ('1', '-1', '28', '测试', 'MENU', '0');
INSERT INTO `dm_privilege` VALUES ('6', '-1', '28', '菜单权限测试', 'MENU', '0');
INSERT INTO `dm_privilege` VALUES ('7', '-1', '28', '菜单权限测试2', 'MENU', '0');
INSERT INTO `dm_privilege` VALUES ('8', '-1', '28', '员工管理', 'MENU', '0');
INSERT INTO `dm_privilege` VALUES ('9', '8', null, '员工删数据权限修改', 'DATA', '0');
INSERT INTO `dm_privilege` VALUES ('10', '-1', '27', '系统管理', 'MENU', '0');
INSERT INTO `dm_privilege` VALUES ('13', '10', '28', '菜单管理', 'MENU', '1');
INSERT INTO `dm_privilege` VALUES ('14', '10', '33', '员工管理', 'MENU', '1');
INSERT INTO `dm_privilege` VALUES ('15', '10', '36', '权限管理', 'MENU', '1');

-- ----------------------------
-- Table structure for dm_role
-- ----------------------------
DROP TABLE IF EXISTS `dm_role`;
CREATE TABLE `dm_role` (
  `ROLE_ID` int(9) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(50) DEFAULT NULL,
  `ROLE_DESC` varchar(250) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL COMMENT '00A 有效 00X 无效',
  `STATE_DATE` datetime DEFAULT NULL,
  `CREATE_OPER_ID` int(9) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_role
-- ----------------------------
INSERT INTO `dm_role` VALUES ('9', '土豪', '土豪 插入角色测试', '2013-12-03 03:40:56', '00A', '2013-12-03 03:40:58', '1');
INSERT INTO `dm_role` VALUES ('11', '系统管理员', '系统管理员', '2013-12-20 15:05:56', '00A', '2013-12-20 15:06:09', null);
INSERT INTO `dm_role` VALUES ('13', '测试人员', '测试人员jut', '2013-12-20 03:07:09', '00A', '2013-12-20 03:07:17', null);

-- ----------------------------
-- Table structure for dm_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `dm_role_privilege`;
CREATE TABLE `dm_role_privilege` (
  `ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(9) DEFAULT NULL,
  `PRIVILEGE_ID` int(9) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_25` (`ROLE_ID`),
  KEY `FK_Reference_26` (`PRIVILEGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_role_privilege
-- ----------------------------
INSERT INTO `dm_role_privilege` VALUES ('7', '11', '1');
INSERT INTO `dm_role_privilege` VALUES ('8', '9', '1');
INSERT INTO `dm_role_privilege` VALUES ('9', '9', '8');
INSERT INTO `dm_role_privilege` VALUES ('10', '9', '9');

-- ----------------------------
-- Table structure for dm_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `dm_shopping_cart`;
CREATE TABLE `dm_shopping_cart` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(9) DEFAULT NULL,
  `MERCHANT_ID` int(9) NOT NULL,
  `ORDER_ID` int(3) DEFAULT NULL COMMENT '顺序',
  `ITEM_NO` int(3) DEFAULT NULL,
  `CTEATE_TIME` datetime DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for dm_staff
-- ----------------------------
DROP TABLE IF EXISTS `dm_staff`;
CREATE TABLE `dm_staff` (
  `STAFF_ID` int(9) NOT NULL AUTO_INCREMENT,
  `ORG_ID` int(9) DEFAULT NULL,
  `STAFF_CODE` varchar(30) NOT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `STAFF_NAME` varchar(50) NOT NULL,
  `GENDER` varchar(3) DEFAULT NULL,
  `STAFF_DESC` varchar(256) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `EFF_DATE` datetime DEFAULT NULL,
  `PARTY_ID` int(9) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`STAFF_ID`),
  KEY `FK_Reference_21` (`ORG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='[P]员工(人员)';

-- ----------------------------
-- Records of dm_staff
-- ----------------------------
INSERT INTO `dm_staff` VALUES ('5', '-1', '1010101', '1f63f2f345e418b3de9c4ae501942629', '管理员', null, null, null, null, null, '00A');

-- ----------------------------
-- Table structure for dm_staff_privilege
-- ----------------------------
DROP TABLE IF EXISTS `dm_staff_privilege`;
CREATE TABLE `dm_staff_privilege` (
  `ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `STAFF_ID` int(9) DEFAULT NULL,
  `PRIVILEGE_ID` int(9) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_24` (`PRIVILEGE_ID`),
  KEY `FK_Reference_23` (`STAFF_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_staff_privilege
-- ----------------------------
INSERT INTO `dm_staff_privilege` VALUES ('13', '3', '1');
INSERT INTO `dm_staff_privilege` VALUES ('14', '3', '8');
INSERT INTO `dm_staff_privilege` VALUES ('15', '3', '10');
INSERT INTO `dm_staff_privilege` VALUES ('16', '3', '15');
INSERT INTO `dm_staff_privilege` VALUES ('17', '3', '13');
INSERT INTO `dm_staff_privilege` VALUES ('18', '3', '14');
INSERT INTO `dm_staff_privilege` VALUES ('19', '5', '13');
INSERT INTO `dm_staff_privilege` VALUES ('20', '5', '14');
INSERT INTO `dm_staff_privilege` VALUES ('21', '5', '15');
INSERT INTO `dm_staff_privilege` VALUES ('22', '5', '10');

-- ----------------------------
-- Table structure for dm_staff_role
-- ----------------------------
DROP TABLE IF EXISTS `dm_staff_role`;
CREATE TABLE `dm_staff_role` (
  `ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(9) DEFAULT NULL,
  `STAFF_ID` int(9) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_17` (`STAFF_ID`),
  KEY `FK_Reference_18` (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='员工角色';

-- ----------------------------
-- Records of dm_staff_role
-- ----------------------------
INSERT INTO `dm_staff_role` VALUES ('3', '9', '1');
INSERT INTO `dm_staff_role` VALUES ('9', '11', '3');
INSERT INTO `dm_staff_role` VALUES ('10', '9', '3');
INSERT INTO `dm_staff_role` VALUES ('11', '11', '5');

-- ----------------------------
-- Table structure for dm_sub_cust_order
-- ----------------------------
DROP TABLE IF EXISTS `dm_sub_cust_order`;
CREATE TABLE `dm_sub_cust_order` (
  `SUB_ORDER_ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `PLAN_ID` int(9) DEFAULT NULL,
  `ORDER_ID` int(9) DEFAULT NULL,
  `GOODS_INST_ID` int(9) DEFAULT NULL,
  `GOODS_NAME` varchar(100) DEFAULT NULL,
  `ITEM_NO` int(5) NOT NULL,
  `PRICE` float(8,2) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `COMMENTATED` char(1) DEFAULT '0' COMMENT '是否评论过 1:是，0:否',
  `STATE` varchar(3) NOT NULL COMMENT '10A：待确认\r\n10B：已确认\r\n10C：已取消\r\n10D：已完成',
  `NOTES` varchar(2000) DEFAULT NULL,
  `OPER_DATE` datetime DEFAULT NULL,
  `OPER_STAFF_NO` varchar(20) DEFAULT NULL,
  `OPER_NOTES` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`SUB_ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_sub_cust_order
-- ----------------------------
INSERT INTO `dm_sub_cust_order` VALUES ('46', null, '20131259', '6', '手机2', '2', '498.00', '2014-01-11 14:53:01', '0', '10A', null, null, null, null);
INSERT INTO `dm_sub_cust_order` VALUES ('47', null, '20131260', '2', '运动达人包', '1', '99.99', '2014-01-11 15:27:45', '0', '10A', null, null, null, null);
INSERT INTO `dm_sub_cust_order` VALUES ('48', null, '20131261', '1', '运动达人包', '3', '299.97', '2014-01-11 18:07:14', '0', '10A', null, null, null, null);
INSERT INTO `dm_sub_cust_order` VALUES ('49', null, '20131262', '2', '法拉利', '1', '88888.88', '2014-02-16 15:03:43', '0', '10A', null, null, null, null);
INSERT INTO `dm_sub_cust_order` VALUES ('50', null, '20131263', '3', '三星3', '1', '88.88', '2014-02-16 18:26:37', '0', '10A', null, null, null, null);
INSERT INTO `dm_sub_cust_order` VALUES ('51', null, '20131264', '4', '三星3', '1', '88.88', '2014-02-16 18:30:43', '0', '10A', null, null, null, null);
INSERT INTO `dm_sub_cust_order` VALUES ('52', null, '20131265', '5', '法拉利', '5', '444444.41', '2014-03-01 17:35:54', '0', '10A', null, null, null, null);
INSERT INTO `dm_sub_cust_order` VALUES ('53', null, '20131265', '6', '三星3', '4', '355.52', '2014-03-01 17:35:54', '1', '10A', null, null, null, null);
INSERT INTO `dm_sub_cust_order` VALUES ('54', null, '20131266', '7', '乐动达人包', '1', '199.99', '2014-03-08 17:13:27', '0', '10A', null, null, null, null);
INSERT INTO `dm_sub_cust_order` VALUES ('55', null, '20131266', '8', '三星3', '1', '88.88', '2014-03-08 17:13:27', '0', '10A', null, null, null, null);

-- ----------------------------
-- Table structure for dm_tags
-- ----------------------------
DROP TABLE IF EXISTS `dm_tags`;
CREATE TABLE `dm_tags` (
  `TAG_ID` int(9) NOT NULL AUTO_INCREMENT,
  `TAG_NAME` varchar(200) DEFAULT NULL,
  `TAG_TYPE` varchar(20) DEFAULT NULL,
  `PARENT_TAG_ID` int(9) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_OPER_ID` int(9) DEFAULT NULL,
  `IS_LEAF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`TAG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_tags
-- ----------------------------
INSERT INTO `dm_tags` VALUES ('1', '面膜', null, '-1', null, null, null);

-- ----------------------------
-- Table structure for dm_tags_item
-- ----------------------------
DROP TABLE IF EXISTS `dm_tags_item`;
CREATE TABLE `dm_tags_item` (
  `ITEM_ID` int(9) NOT NULL AUTO_INCREMENT,
  `TAG_ID` int(9) DEFAULT NULL,
  `ITEM_VALUE` varchar(30) DEFAULT NULL,
  `ITEM_DESC` varchar(200) DEFAULT NULL,
  `ORDER_ID` int(3) DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_tags_item
-- ----------------------------
INSERT INTO `dm_tags_item` VALUES ('14', '1', '补水', '', null);
INSERT INTO `dm_tags_item` VALUES ('15', '1', '抗痘', '', null);

-- ----------------------------
-- Table structure for dm_trade_log
-- ----------------------------
DROP TABLE IF EXISTS `dm_trade_log`;
CREATE TABLE `dm_trade_log` (
  `TRADE_ID` int(9) NOT NULL AUTO_INCREMENT,
  `ORDER_NO` varchar(20) DEFAULT NULL,
  `INTERFACE_TYPE` varchar(20) DEFAULT NULL,
  `AMOUNT` varchar(20) DEFAULT NULL,
  `SEND_CONTENT` varchar(2000) DEFAULT NULL,
  `ACCEPT_CONTENT` varchar(2000) DEFAULT NULL,
  `TRADE_RESULT` varchar(50) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`TRADE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_trade_log
-- ----------------------------

-- ----------------------------
-- Table structure for dm_user
-- ----------------------------
DROP TABLE IF EXISTS `dm_user`;
CREATE TABLE `dm_user` (
  `USER_ID` int(9) NOT NULL AUTO_INCREMENT,
  `LOGON_NAME` varchar(20) NOT NULL,
  `USER_NAME` varchar(20) DEFAULT NULL,
  `HEAD_IMAGE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PASSWD` varchar(50) NOT NULL,
  `PASSWD_QUESTION` varchar(50) DEFAULT NULL,
  `PASSWD_ANSWER` varchar(40) DEFAULT NULL,
  `STATE` varchar(10) NOT NULL COMMENT '00A 有效\n            00X 无效\n            00L 锁定',
  `CREATE_TIME` datetime DEFAULT NULL,
  `ACTIVE_TIME` datetime DEFAULT NULL,
  `MODIFY_PWD_TIME` datetime DEFAULT NULL,
  `LOCK_TIME` datetime DEFAULT NULL,
  `LOGON_FAILED_COUNT` int(11) NOT NULL,
  `LAST_LOGIN_TIME` datetime DEFAULT NULL,
  `LEVEL` int(2) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dm_user
-- ----------------------------
INSERT INTO `dm_user` VALUES ('1', '18900000001', '乐扣乐扣', '/photos/data_market_p/user/t1_5170f5a931844827a303627624206633.jpg', null, '1399d54349a96d40c848626cfc74efd2', null, null, '00A', '2013-12-24 10:48:39', null, null, null, '0', '2014-01-04 17:11:34', '1');
INSERT INTO `dm_user` VALUES ('18', '18664604464', '国家地理', null, 'xxxx@gmail.com', 'a215a07ba964cd2a2916f292cff19d11', '你的老婆叫什么', '彭丽媛', '00A', '2013-12-31 16:21:36', null, null, null, '0', '2014-03-08 17:07:04', '1');
INSERT INTO `dm_user` VALUES ('23', '18664604465', null, null, null, 'c75ca173378d564f9d4e3f554a9b48ec', null, null, '00A', '2014-01-25 17:23:46', null, null, null, '0', '2014-01-25 17:23:46', '1');
INSERT INTO `dm_user` VALUES ('26', '18600000000', null, null, null, '6eb48a9c027ab90dbf01fac827695570', null, null, '00A', '2014-01-25 17:36:29', null, null, null, '0', '2014-01-25 17:36:29', '1');
INSERT INTO `dm_user` VALUES ('32', '18600001000', null, null, null, 'd2bd6aa34218104d55a2c1812f25bd9d', null, null, '00A', '2014-01-25 17:46:23', null, null, null, '0', '2014-01-25 17:46:23', '2');
INSERT INTO `dm_user` VALUES ('33', '18600002000', null, null, null, 'b58dc4634b40bd166f8dbd5b96796f01', null, null, '00A', '2014-01-25 17:47:05', null, null, null, '0', '2014-01-25 17:47:05', '2');
INSERT INTO `dm_user` VALUES ('38', '18600001100', null, null, null, '0b1b7e57abef4d2e6cd9af502e8fd8db', null, null, '00A', '2014-01-25 17:52:48', null, null, null, '0', '2014-01-25 17:52:48', '3');
INSERT INTO `dm_user` VALUES ('40', '18600001200', null, null, null, '47ecc2097745734cde3f85f690f20385', null, null, '00A', '2014-01-25 18:20:27', null, null, null, '0', '2014-01-25 18:20:27', '3');
INSERT INTO `dm_user` VALUES ('41', '18600002100', null, null, null, 'a10dc680f299c1719419af2a92aa0238', null, null, '00A', '2014-01-25 18:22:36', null, null, null, '0', '2014-01-25 18:22:36', '3');
INSERT INTO `dm_user` VALUES ('42', '18600002200', null, null, null, '2ac97118832c556b196edb9391574f1d', null, null, '00A', '2014-01-25 18:23:12', null, null, null, '0', '2014-01-25 18:23:12', '3');
INSERT INTO `dm_user` VALUES ('43', '18600001110', null, null, null, '47a525040e62202f05d979e674c497e7', null, null, '00A', '2014-01-25 18:24:01', null, null, null, '0', '2014-01-25 18:24:01', '4');
INSERT INTO `dm_user` VALUES ('44', '18600001120', null, null, null, 'e15f97cc823ade57fd110fbd73e867bd', null, null, '00A', '2014-01-25 18:25:21', null, null, null, '0', '2014-01-25 18:25:21', '4');
INSERT INTO `dm_user` VALUES ('45', '18600002110', null, null, null, '34e2d6283cd995ff0d5284bddfd589ff', null, null, '00A', '2014-01-25 18:27:47', null, null, null, '0', '2014-01-25 18:27:47', '4');
INSERT INTO `dm_user` VALUES ('46', '18600002120', null, null, null, 'e03ae86064407873ea653bd8825e6fd4', null, null, '00A', '2014-01-25 18:29:01', null, null, null, '0', '2014-01-25 18:29:01', '4');
INSERT INTO `dm_user` VALUES ('47', '18600002130', null, null, null, 'cff59b4592c9d546385029d993c576a1', null, null, '00A', '2014-01-25 18:29:37', null, null, null, '0', '2014-01-25 18:29:37', '4');
INSERT INTO `dm_user` VALUES ('48', '18600002140', null, null, null, '64e6ace9b205d82fb0b147d7af17727a', null, null, '00A', '2014-01-25 18:30:05', null, null, null, '0', '2014-01-25 18:30:05', '4');
INSERT INTO `dm_user` VALUES ('49', '18600002150', null, null, null, '9eb589c54bba60e3d51bb40a3b7d0e0c', null, null, '00A', '2014-01-25 18:30:29', null, null, null, '0', '2014-01-25 18:30:29', '4');
INSERT INTO `dm_user` VALUES ('50', '18600002160', null, null, null, '30a2266cfe8e12a48f4769ffe11f61c1', null, null, '00A', '2014-01-25 18:31:02', null, null, null, '0', '2014-01-25 18:31:02', '4');
INSERT INTO `dm_user` VALUES ('51', '18600002170', null, null, null, '64dacc7bf210a48fd6df5337a29e0ba5', null, null, '00A', '2014-01-25 18:31:26', null, null, null, '0', '2014-01-25 18:31:26', '5');
INSERT INTO `dm_user` VALUES ('52', '18600022200', null, null, null, '603c9a768a0c90e1467cd605ea7cf9c6', null, null, '00A', '2014-01-25 18:32:03', null, null, null, '0', '2014-01-25 18:32:03', '5');
INSERT INTO `dm_user` VALUES ('53', '18610000000', '小号', null, null, '672fecaafe54b06e1b4c99590a04436c', null, null, '00A', '2014-01-25 18:47:05', null, null, null, '0', '2014-01-25 18:47:05', '2');
INSERT INTO `dm_user` VALUES ('54', '18700000000', null, null, null, '13167a4516bd491fc2361e02c2452947', null, null, '00A', '2014-01-25 19:33:06', null, null, null, '0', '2014-01-25 19:33:06', '2');
INSERT INTO `dm_user` VALUES ('57', '18800000000', '顺丰快递', null, null, 'f58fc7a23dd52d7cc0beb6785d827ffc', null, null, '00A', '2014-01-25 19:41:03', null, null, null, '0', '2014-01-25 19:41:03', '2');
INSERT INTO `dm_user` VALUES ('59', '13926100921', '', null, null, '872d208d10eb30e6f2b39e9e3a61825b', null, null, '00A', '2014-03-01 11:23:07', null, null, null, '0', '2014-03-01 16:43:39', '2');

-- ----------------------------
-- Table structure for referrer_info
-- ----------------------------
DROP TABLE IF EXISTS `referrer_info`;
CREATE TABLE `referrer_info` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `referrer_id` int(9) DEFAULT NULL,
  `presentee_id` int(9) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of referrer_info
-- ----------------------------
INSERT INTO `referrer_info` VALUES ('7', '18', '32', '2014-01-25 17:46:25');
INSERT INTO `referrer_info` VALUES ('8', '18', '33', '2014-01-25 17:47:06');
INSERT INTO `referrer_info` VALUES ('11', '32', '38', '2014-01-25 17:53:12');
INSERT INTO `referrer_info` VALUES ('13', '32', '40', '2014-01-25 18:21:26');
INSERT INTO `referrer_info` VALUES ('14', '33', '41', '2014-01-25 18:22:53');
INSERT INTO `referrer_info` VALUES ('15', '33', '42', '2014-01-25 18:23:31');
INSERT INTO `referrer_info` VALUES ('16', '41', '43', '2014-01-25 18:24:40');
INSERT INTO `referrer_info` VALUES ('17', '41', '44', '2014-01-25 18:27:25');
INSERT INTO `referrer_info` VALUES ('18', '38', '45', '2014-01-25 18:28:38');
INSERT INTO `referrer_info` VALUES ('19', '38', '46', '2014-01-25 18:29:05');
INSERT INTO `referrer_info` VALUES ('20', '40', '47', '2014-01-25 18:29:41');
INSERT INTO `referrer_info` VALUES ('21', '42', '48', '2014-01-25 18:30:08');
INSERT INTO `referrer_info` VALUES ('22', '40', '49', '2014-01-25 18:30:35');
INSERT INTO `referrer_info` VALUES ('23', '42', '50', '2014-01-25 18:31:02');
INSERT INTO `referrer_info` VALUES ('24', '47', '51', '2014-01-25 18:31:26');
INSERT INTO `referrer_info` VALUES ('25', '48', '52', '2014-01-25 18:32:03');
INSERT INTO `referrer_info` VALUES ('26', '26', '53', '2014-01-25 18:47:16');
INSERT INTO `referrer_info` VALUES ('27', '26', '54', '2014-01-25 19:33:10');
INSERT INTO `referrer_info` VALUES ('30', '18', '57', '2014-01-25 19:41:03');
INSERT INTO `referrer_info` VALUES ('31', '18', '59', '2014-03-01 11:23:08');
INSERT INTO `referrer_info` VALUES ('32', '51', '99', '2014-03-01 16:08:49');

-- ----------------------------
-- Table structure for sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `sensitive_word`;
CREATE TABLE `sensitive_word` (
  `ID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `WORD` varchar(30) NOT NULL,
  `PINYIN` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6306 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sensitive_word
-- ----------------------------
INSERT INTO `sensitive_word` VALUES ('1', '六四', null);
INSERT INTO `sensitive_word` VALUES ('2', '共产党', null);
INSERT INTO `sensitive_word` VALUES ('3', '法轮功', null);
INSERT INTO `sensitive_word` VALUES ('4', '法轮大法', null);
INSERT INTO `sensitive_word` VALUES ('5', '阿扁推翻', null);
INSERT INTO `sensitive_word` VALUES ('6', '阿宾', null);
INSERT INTO `sensitive_word` VALUES ('7', '阿賓', null);
INSERT INTO `sensitive_word` VALUES ('8', '挨了一炮', null);
INSERT INTO `sensitive_word` VALUES ('9', '爱液横流', null);
INSERT INTO `sensitive_word` VALUES ('10', '安街逆', null);
INSERT INTO `sensitive_word` VALUES ('11', '安局办公楼', null);
INSERT INTO `sensitive_word` VALUES ('12', '安局豪华', null);
INSERT INTO `sensitive_word` VALUES ('13', '安门事', null);
INSERT INTO `sensitive_word` VALUES ('14', '安眠藥', null);
INSERT INTO `sensitive_word` VALUES ('15', '案的准确', null);
INSERT INTO `sensitive_word` VALUES ('16', '八九民', null);
INSERT INTO `sensitive_word` VALUES ('17', '八九学', null);
INSERT INTO `sensitive_word` VALUES ('18', '八九政治', null);
INSERT INTO `sensitive_word` VALUES ('19', '把病人整', null);
INSERT INTO `sensitive_word` VALUES ('20', '把邓小平', null);
INSERT INTO `sensitive_word` VALUES ('21', '把学生整', null);
INSERT INTO `sensitive_word` VALUES ('22', '罢工门', null);
INSERT INTO `sensitive_word` VALUES ('23', '白黄牙签', null);
INSERT INTO `sensitive_word` VALUES ('24', '败培训', null);
INSERT INTO `sensitive_word` VALUES ('25', '办本科', null);
INSERT INTO `sensitive_word` VALUES ('26', '办理本科', null);
INSERT INTO `sensitive_word` VALUES ('27', '办理各种', null);
INSERT INTO `sensitive_word` VALUES ('28', '办理票据', null);
INSERT INTO `sensitive_word` VALUES ('29', '办理文凭', null);
INSERT INTO `sensitive_word` VALUES ('30', '办理真实', null);
INSERT INTO `sensitive_word` VALUES ('31', '办理证书', null);
INSERT INTO `sensitive_word` VALUES ('32', '办理资格', null);
INSERT INTO `sensitive_word` VALUES ('33', '办文凭', null);
INSERT INTO `sensitive_word` VALUES ('34', '办怔', null);
INSERT INTO `sensitive_word` VALUES ('35', '办证', null);
INSERT INTO `sensitive_word` VALUES ('36', '半刺刀', null);
INSERT INTO `sensitive_word` VALUES ('37', '辦毕业', null);
INSERT INTO `sensitive_word` VALUES ('38', '辦證', null);
INSERT INTO `sensitive_word` VALUES ('39', '谤罪获刑', null);
INSERT INTO `sensitive_word` VALUES ('40', '磅解码器', null);
INSERT INTO `sensitive_word` VALUES ('41', '磅遥控器', null);
INSERT INTO `sensitive_word` VALUES ('42', '宝在甘肃修', null);
INSERT INTO `sensitive_word` VALUES ('43', '保过答案', null);
INSERT INTO `sensitive_word` VALUES ('44', '报复执法', null);
INSERT INTO `sensitive_word` VALUES ('45', '爆发骚', null);
INSERT INTO `sensitive_word` VALUES ('46', '北省委门', null);
INSERT INTO `sensitive_word` VALUES ('47', '被打死', null);
INSERT INTO `sensitive_word` VALUES ('48', '被指抄袭', null);
INSERT INTO `sensitive_word` VALUES ('49', '被中共', null);
INSERT INTO `sensitive_word` VALUES ('50', '本公司担', null);
INSERT INTO `sensitive_word` VALUES ('51', '本无码', null);
INSERT INTO `sensitive_word` VALUES ('52', '毕业證', null);
INSERT INTO `sensitive_word` VALUES ('53', '变牌绝', null);
INSERT INTO `sensitive_word` VALUES ('54', '辩词与梦', null);
INSERT INTO `sensitive_word` VALUES ('55', '冰毒', null);
INSERT INTO `sensitive_word` VALUES ('56', '冰火毒', null);
INSERT INTO `sensitive_word` VALUES ('57', '冰火佳', null);
INSERT INTO `sensitive_word` VALUES ('58', '冰火九重', null);
INSERT INTO `sensitive_word` VALUES ('59', '冰火漫', null);
INSERT INTO `sensitive_word` VALUES ('60', '冰淫传', null);
INSERT INTO `sensitive_word` VALUES ('61', '冰在火上', null);
INSERT INTO `sensitive_word` VALUES ('62', '波推龙', null);
INSERT INTO `sensitive_word` VALUES ('63', '博彩娱', null);
INSERT INTO `sensitive_word` VALUES ('64', '博会暂停', null);
INSERT INTO `sensitive_word` VALUES ('65', '博园区伪', null);
INSERT INTO `sensitive_word` VALUES ('66', '不查都', null);
INSERT INTO `sensitive_word` VALUES ('67', '不查全', null);
INSERT INTO `sensitive_word` VALUES ('68', '不思四化', null);
INSERT INTO `sensitive_word` VALUES ('69', '布卖淫女', null);
INSERT INTO `sensitive_word` VALUES ('70', '部忙组阁', null);
INSERT INTO `sensitive_word` VALUES ('71', '部是这样', null);
INSERT INTO `sensitive_word` VALUES ('72', '才知道只生', null);
INSERT INTO `sensitive_word` VALUES ('73', '财众科技', null);
INSERT INTO `sensitive_word` VALUES ('74', '采花堂', null);
INSERT INTO `sensitive_word` VALUES ('75', '踩踏事', null);
INSERT INTO `sensitive_word` VALUES ('76', '苍山兰', null);
INSERT INTO `sensitive_word` VALUES ('77', '苍蝇水', null);
INSERT INTO `sensitive_word` VALUES ('78', '藏春阁', null);
INSERT INTO `sensitive_word` VALUES ('79', '藏獨', null);
INSERT INTO `sensitive_word` VALUES ('80', '操了嫂', null);
INSERT INTO `sensitive_word` VALUES ('81', '操嫂子', null);
INSERT INTO `sensitive_word` VALUES ('82', '策没有不', null);
INSERT INTO `sensitive_word` VALUES ('83', '插屁屁', null);
INSERT INTO `sensitive_word` VALUES ('84', '察象蚂', null);
INSERT INTO `sensitive_word` VALUES ('85', '拆迁灭', null);
INSERT INTO `sensitive_word` VALUES ('86', '车牌隐', null);
INSERT INTO `sensitive_word` VALUES ('87', '成人电', null);
INSERT INTO `sensitive_word` VALUES ('88', '成人卡通', null);
INSERT INTO `sensitive_word` VALUES ('89', '成人聊', null);
INSERT INTO `sensitive_word` VALUES ('90', '成人片', null);
INSERT INTO `sensitive_word` VALUES ('91', '成人视', null);
INSERT INTO `sensitive_word` VALUES ('92', '成人图', null);
INSERT INTO `sensitive_word` VALUES ('93', '成人文', null);
INSERT INTO `sensitive_word` VALUES ('94', '成人小', null);
INSERT INTO `sensitive_word` VALUES ('95', '城管灭', null);
INSERT INTO `sensitive_word` VALUES ('96', '惩公安', null);
INSERT INTO `sensitive_word` VALUES ('97', '惩贪难', null);
INSERT INTO `sensitive_word` VALUES ('98', '充气娃', null);
INSERT INTO `sensitive_word` VALUES ('99', '冲凉死', null);
INSERT INTO `sensitive_word` VALUES ('100', '抽着大中', null);
INSERT INTO `sensitive_word` VALUES ('101', '抽着芙蓉', null);
INSERT INTO `sensitive_word` VALUES ('102', '出成绩付', null);
INSERT INTO `sensitive_word` VALUES ('103', '出售发票', null);
INSERT INTO `sensitive_word` VALUES ('104', '出售军', null);
INSERT INTO `sensitive_word` VALUES ('105', '穿透仪器', null);
INSERT INTO `sensitive_word` VALUES ('106', '春水横溢', null);
INSERT INTO `sensitive_word` VALUES ('107', '纯度白', null);
INSERT INTO `sensitive_word` VALUES ('108', '纯度黄', null);
INSERT INTO `sensitive_word` VALUES ('109', '次通过考', null);
INSERT INTO `sensitive_word` VALUES ('110', '催眠水', null);
INSERT INTO `sensitive_word` VALUES ('111', '催情粉', null);
INSERT INTO `sensitive_word` VALUES ('112', '催情药', null);
INSERT INTO `sensitive_word` VALUES ('113', '催情藥', null);
INSERT INTO `sensitive_word` VALUES ('114', '挫仑', null);
INSERT INTO `sensitive_word` VALUES ('115', '达毕业证', null);
INSERT INTO `sensitive_word` VALUES ('116', '答案包', null);
INSERT INTO `sensitive_word` VALUES ('117', '答案提供', null);
INSERT INTO `sensitive_word` VALUES ('118', '打标语', null);
INSERT INTO `sensitive_word` VALUES ('119', '打错门', null);
INSERT INTO `sensitive_word` VALUES ('120', '打飞机专', null);
INSERT INTO `sensitive_word` VALUES ('121', '打死经过', null);
INSERT INTO `sensitive_word` VALUES ('122', '打死人', null);
INSERT INTO `sensitive_word` VALUES ('123', '打砸办公', null);
INSERT INTO `sensitive_word` VALUES ('124', '大鸡巴', null);
INSERT INTO `sensitive_word` VALUES ('125', '大雞巴', null);
INSERT INTO `sensitive_word` VALUES ('126', '大纪元', null);
INSERT INTO `sensitive_word` VALUES ('127', '大揭露', null);
INSERT INTO `sensitive_word` VALUES ('128', '大奶子', null);
INSERT INTO `sensitive_word` VALUES ('129', '大批贪官', null);
INSERT INTO `sensitive_word` VALUES ('130', '大肉棒', null);
INSERT INTO `sensitive_word` VALUES ('131', '大嘴歌', null);
INSERT INTO `sensitive_word` VALUES ('132', '代办发票', null);
INSERT INTO `sensitive_word` VALUES ('133', '代办各', null);
INSERT INTO `sensitive_word` VALUES ('134', '代办文', null);
INSERT INTO `sensitive_word` VALUES ('135', '代办学', null);
INSERT INTO `sensitive_word` VALUES ('136', '代办制', null);
INSERT INTO `sensitive_word` VALUES ('137', '代辦', null);
INSERT INTO `sensitive_word` VALUES ('138', '代表烦', null);
INSERT INTO `sensitive_word` VALUES ('139', '代開', null);
INSERT INTO `sensitive_word` VALUES ('140', '代考', null);
INSERT INTO `sensitive_word` VALUES ('141', '代理发票', null);
INSERT INTO `sensitive_word` VALUES ('142', '代理票据', null);
INSERT INTO `sensitive_word` VALUES ('143', '代您考', null);
INSERT INTO `sensitive_word` VALUES ('144', '代写毕', null);
INSERT INTO `sensitive_word` VALUES ('145', '代写论', null);
INSERT INTO `sensitive_word` VALUES ('146', '代孕', null);
INSERT INTO `sensitive_word` VALUES ('147', '贷办', null);
INSERT INTO `sensitive_word` VALUES ('148', '贷借款', null);
INSERT INTO `sensitive_word` VALUES ('149', '贷开', null);
INSERT INTO `sensitive_word` VALUES ('150', '戴海静', null);
INSERT INTO `sensitive_word` VALUES ('151', '当代七整', null);
INSERT INTO `sensitive_word` VALUES ('152', '当官要精', null);
INSERT INTO `sensitive_word` VALUES ('153', '当官在于', null);
INSERT INTO `sensitive_word` VALUES ('154', '党的官', null);
INSERT INTO `sensitive_word` VALUES ('155', '党后萎', null);
INSERT INTO `sensitive_word` VALUES ('156', '党前干劲', null);
INSERT INTO `sensitive_word` VALUES ('157', '刀架保安', null);
INSERT INTO `sensitive_word` VALUES ('158', '导的情人', null);
INSERT INTO `sensitive_word` VALUES ('159', '导叫失', null);
INSERT INTO `sensitive_word` VALUES ('160', '导人的最', null);
INSERT INTO `sensitive_word` VALUES ('161', '导人最', null);
INSERT INTO `sensitive_word` VALUES ('162', '导小商', null);
INSERT INTO `sensitive_word` VALUES ('163', '到花心', null);
INSERT INTO `sensitive_word` VALUES ('164', '得财兼', null);
INSERT INTO `sensitive_word` VALUES ('165', '的同修', null);
INSERT INTO `sensitive_word` VALUES ('166', '灯草和', null);
INSERT INTO `sensitive_word` VALUES ('167', '等级證', null);
INSERT INTO `sensitive_word` VALUES ('168', '等屁民', null);
INSERT INTO `sensitive_word` VALUES ('169', '等人老百', null);
INSERT INTO `sensitive_word` VALUES ('170', '等人是老', null);
INSERT INTO `sensitive_word` VALUES ('171', '等人手术', null);
INSERT INTO `sensitive_word` VALUES ('172', '邓爷爷转', null);
INSERT INTO `sensitive_word` VALUES ('173', '邓玉娇', null);
INSERT INTO `sensitive_word` VALUES ('174', '地产之歌', null);
INSERT INTO `sensitive_word` VALUES ('175', '地下先烈', null);
INSERT INTO `sensitive_word` VALUES ('176', '地震哥', null);
INSERT INTO `sensitive_word` VALUES ('177', '帝国之梦', null);
INSERT INTO `sensitive_word` VALUES ('178', '递纸死', null);
INSERT INTO `sensitive_word` VALUES ('179', '点数优惠', null);
INSERT INTO `sensitive_word` VALUES ('180', '电狗', null);
INSERT INTO `sensitive_word` VALUES ('181', '电话监', null);
INSERT INTO `sensitive_word` VALUES ('182', '电鸡', null);
INSERT INTO `sensitive_word` VALUES ('183', '甸果敢', null);
INSERT INTO `sensitive_word` VALUES ('184', '蝶舞按', null);
INSERT INTO `sensitive_word` VALUES ('185', '丁香社', null);
INSERT INTO `sensitive_word` VALUES ('186', '丁子霖', null);
INSERT INTO `sensitive_word` VALUES ('187', '顶花心', null);
INSERT INTO `sensitive_word` VALUES ('188', '东北独立', null);
INSERT INTO `sensitive_word` VALUES ('189', '东复活', null);
INSERT INTO `sensitive_word` VALUES ('190', '东京热', null);
INSERT INTO `sensitive_word` VALUES ('191', '東京熱', null);
INSERT INTO `sensitive_word` VALUES ('192', '洞小口紧', null);
INSERT INTO `sensitive_word` VALUES ('193', '都当警', null);
INSERT INTO `sensitive_word` VALUES ('194', '都当小姐', null);
INSERT INTO `sensitive_word` VALUES ('195', '都进中央', null);
INSERT INTO `sensitive_word` VALUES ('196', '毒蛇钻', null);
INSERT INTO `sensitive_word` VALUES ('197', '独立台湾', null);
INSERT INTO `sensitive_word` VALUES ('198', '赌球网', null);
INSERT INTO `sensitive_word` VALUES ('199', '短信截', null);
INSERT INTO `sensitive_word` VALUES ('200', '对日强硬', null);
INSERT INTO `sensitive_word` VALUES ('201', '多美康', null);
INSERT INTO `sensitive_word` VALUES ('202', '躲猫猫', null);
INSERT INTO `sensitive_word` VALUES ('203', '俄羅斯', null);
INSERT INTO `sensitive_word` VALUES ('204', '恶势力操', null);
INSERT INTO `sensitive_word` VALUES ('205', '恶势力插', null);
INSERT INTO `sensitive_word` VALUES ('206', '恩氟烷', null);
INSERT INTO `sensitive_word` VALUES ('207', '儿园惨', null);
INSERT INTO `sensitive_word` VALUES ('208', '儿园砍', null);
INSERT INTO `sensitive_word` VALUES ('209', '儿园杀', null);
INSERT INTO `sensitive_word` VALUES ('210', '儿园凶', null);
INSERT INTO `sensitive_word` VALUES ('211', '二奶大', null);
INSERT INTO `sensitive_word` VALUES ('212', '发牌绝', null);
INSERT INTO `sensitive_word` VALUES ('213', '发票出', null);
INSERT INTO `sensitive_word` VALUES ('214', '发票代', null);
INSERT INTO `sensitive_word` VALUES ('215', '发票销', null);
INSERT INTO `sensitive_word` VALUES ('216', '發票', null);
INSERT INTO `sensitive_word` VALUES ('217', '法车仑', null);
INSERT INTO `sensitive_word` VALUES ('218', '法伦功', null);
INSERT INTO `sensitive_word` VALUES ('219', '法轮佛', null);
INSERT INTO `sensitive_word` VALUES ('220', '法维权', null);
INSERT INTO `sensitive_word` VALUES ('221', '法一轮', null);
INSERT INTO `sensitive_word` VALUES ('222', '法院给废', null);
INSERT INTO `sensitive_word` VALUES ('223', '法正乾', null);
INSERT INTO `sensitive_word` VALUES ('224', '反测速雷', null);
INSERT INTO `sensitive_word` VALUES ('225', '反雷达测', null);
INSERT INTO `sensitive_word` VALUES ('226', '反屏蔽', null);
INSERT INTO `sensitive_word` VALUES ('227', '范燕琼', null);
INSERT INTO `sensitive_word` VALUES ('228', '方迷香', null);
INSERT INTO `sensitive_word` VALUES ('229', '防电子眼', null);
INSERT INTO `sensitive_word` VALUES ('230', '防身药水', null);
INSERT INTO `sensitive_word` VALUES ('231', '房贷给废', null);
INSERT INTO `sensitive_word` VALUES ('232', '仿真枪', null);
INSERT INTO `sensitive_word` VALUES ('233', '仿真证', null);
INSERT INTO `sensitive_word` VALUES ('234', '诽谤罪', null);
INSERT INTO `sensitive_word` VALUES ('235', '费私服', null);
INSERT INTO `sensitive_word` VALUES ('236', '封锁消', null);
INSERT INTO `sensitive_word` VALUES ('237', '佛同修', null);
INSERT INTO `sensitive_word` VALUES ('238', '夫妻交换', null);
INSERT INTO `sensitive_word` VALUES ('239', '福尔马林', null);
INSERT INTO `sensitive_word` VALUES ('240', '福娃的預', null);
INSERT INTO `sensitive_word` VALUES ('241', '福娃頭上', null);
INSERT INTO `sensitive_word` VALUES ('242', '福香巴', null);
INSERT INTO `sensitive_word` VALUES ('243', '府包庇', null);
INSERT INTO `sensitive_word` VALUES ('244', '府集中领', null);
INSERT INTO `sensitive_word` VALUES ('245', '妇销魂', null);
INSERT INTO `sensitive_word` VALUES ('246', '附送枪', null);
INSERT INTO `sensitive_word` VALUES ('247', '复印件生', null);
INSERT INTO `sensitive_word` VALUES ('248', '复印件制', null);
INSERT INTO `sensitive_word` VALUES ('249', '富民穷', null);
INSERT INTO `sensitive_word` VALUES ('250', '富婆给废', null);
INSERT INTO `sensitive_word` VALUES ('251', '改号软件', null);
INSERT INTO `sensitive_word` VALUES ('252', '感扑克', null);
INSERT INTO `sensitive_word` VALUES ('253', '冈本真', null);
INSERT INTO `sensitive_word` VALUES ('254', '肛交', null);
INSERT INTO `sensitive_word` VALUES ('255', '肛门是邻', null);
INSERT INTO `sensitive_word` VALUES ('256', '岡本真', null);
INSERT INTO `sensitive_word` VALUES ('257', '钢针狗', null);
INSERT INTO `sensitive_word` VALUES ('258', '钢珠枪', null);
INSERT INTO `sensitive_word` VALUES ('259', '港澳博球', null);
INSERT INTO `sensitive_word` VALUES ('260', '港馬會', null);
INSERT INTO `sensitive_word` VALUES ('261', '港鑫華', null);
INSERT INTO `sensitive_word` VALUES ('262', '高就在政', null);
INSERT INTO `sensitive_word` VALUES ('263', '高考黑', null);
INSERT INTO `sensitive_word` VALUES ('264', '高莺莺', null);
INSERT INTO `sensitive_word` VALUES ('265', '搞媛交', null);
INSERT INTO `sensitive_word` VALUES ('266', '告长期', null);
INSERT INTO `sensitive_word` VALUES ('267', '告洋状', null);
INSERT INTO `sensitive_word` VALUES ('268', '格证考试', null);
INSERT INTO `sensitive_word` VALUES ('269', '各类考试', null);
INSERT INTO `sensitive_word` VALUES ('270', '各类文凭', null);
INSERT INTO `sensitive_word` VALUES ('271', '跟踪器', null);
INSERT INTO `sensitive_word` VALUES ('272', '工程吞得', null);
INSERT INTO `sensitive_word` VALUES ('273', '工力人', null);
INSERT INTO `sensitive_word` VALUES ('274', '公安错打', null);
INSERT INTO `sensitive_word` VALUES ('275', '公安网监', null);
INSERT INTO `sensitive_word` VALUES ('276', '公开小姐', null);
INSERT INTO `sensitive_word` VALUES ('277', '攻官小姐', null);
INSERT INTO `sensitive_word` VALUES ('278', '共狗', null);
INSERT INTO `sensitive_word` VALUES ('279', '共王储', null);
INSERT INTO `sensitive_word` VALUES ('280', '狗粮', null);
INSERT INTO `sensitive_word` VALUES ('281', '狗屁专家', null);
INSERT INTO `sensitive_word` VALUES ('282', '鼓动一些', null);
INSERT INTO `sensitive_word` VALUES ('283', '乖乖粉', null);
INSERT INTO `sensitive_word` VALUES ('284', '官商勾', null);
INSERT INTO `sensitive_word` VALUES ('285', '官也不容', null);
INSERT INTO `sensitive_word` VALUES ('286', '官因发帖', null);
INSERT INTO `sensitive_word` VALUES ('287', '光学真题', null);
INSERT INTO `sensitive_word` VALUES ('288', '跪真相', null);
INSERT INTO `sensitive_word` VALUES ('289', '滚圆大乳', null);
INSERT INTO `sensitive_word` VALUES ('290', '国际投注', null);
INSERT INTO `sensitive_word` VALUES ('291', '国家妓', null);
INSERT INTO `sensitive_word` VALUES ('292', '国家软弱', null);
INSERT INTO `sensitive_word` VALUES ('293', '国家吞得', null);
INSERT INTO `sensitive_word` VALUES ('294', '国库折', null);
INSERT INTO `sensitive_word` VALUES ('295', '国一九五七', null);
INSERT INTO `sensitive_word` VALUES ('296', '國內美', null);
INSERT INTO `sensitive_word` VALUES ('297', '哈药直销', null);
INSERT INTO `sensitive_word` VALUES ('298', '海访民', null);
INSERT INTO `sensitive_word` VALUES ('299', '豪圈钱', null);
INSERT INTO `sensitive_word` VALUES ('300', '号屏蔽器', null);
INSERT INTO `sensitive_word` VALUES ('301', '和狗交', null);
INSERT INTO `sensitive_word` VALUES ('302', '和狗性', null);
INSERT INTO `sensitive_word` VALUES ('303', '和狗做', null);
INSERT INTO `sensitive_word` VALUES ('304', '黑火药的', null);
INSERT INTO `sensitive_word` VALUES ('305', '红色恐怖', null);
INSERT INTO `sensitive_word` VALUES ('306', '红外透视', null);
INSERT INTO `sensitive_word` VALUES ('307', '紅色恐', null);
INSERT INTO `sensitive_word` VALUES ('308', '胡江内斗', null);
INSERT INTO `sensitive_word` VALUES ('309', '胡紧套', null);
INSERT INTO `sensitive_word` VALUES ('310', '胡錦濤', null);
INSERT INTO `sensitive_word` VALUES ('311', '胡适眼', null);
INSERT INTO `sensitive_word` VALUES ('312', '胡耀邦', null);
INSERT INTO `sensitive_word` VALUES ('313', '湖淫娘', null);
INSERT INTO `sensitive_word` VALUES ('314', '虎头猎', null);
INSERT INTO `sensitive_word` VALUES ('315', '华国锋', null);
INSERT INTO `sensitive_word` VALUES ('316', '华门开', null);
INSERT INTO `sensitive_word` VALUES ('317', '化学扫盲', null);
INSERT INTO `sensitive_word` VALUES ('318', '划老公', null);
INSERT INTO `sensitive_word` VALUES ('319', '还会吹萧', null);
INSERT INTO `sensitive_word` VALUES ('320', '还看锦涛', null);
INSERT INTO `sensitive_word` VALUES ('321', '环球证件', null);
INSERT INTO `sensitive_word` VALUES ('322', '换妻', null);
INSERT INTO `sensitive_word` VALUES ('323', '皇冠投注', null);
INSERT INTO `sensitive_word` VALUES ('324', '黄冰', null);
INSERT INTO `sensitive_word` VALUES ('325', '浑圆豪乳', null);
INSERT INTO `sensitive_word` VALUES ('326', '活不起', null);
INSERT INTO `sensitive_word` VALUES ('327', '火车也疯', null);
INSERT INTO `sensitive_word` VALUES ('328', '机定位器', null);
INSERT INTO `sensitive_word` VALUES ('329', '机号定', null);
INSERT INTO `sensitive_word` VALUES ('330', '机号卫', null);
INSERT INTO `sensitive_word` VALUES ('331', '机卡密', null);
INSERT INTO `sensitive_word` VALUES ('332', '机屏蔽器', null);
INSERT INTO `sensitive_word` VALUES ('333', '基本靠吼', null);
INSERT INTO `sensitive_word` VALUES ('334', '绩过后付', null);
INSERT INTO `sensitive_word` VALUES ('335', '激情电', null);
INSERT INTO `sensitive_word` VALUES ('336', '激情短', null);
INSERT INTO `sensitive_word` VALUES ('337', '激情妹', null);
INSERT INTO `sensitive_word` VALUES ('338', '激情炮', null);
INSERT INTO `sensitive_word` VALUES ('339', '级办理', null);
INSERT INTO `sensitive_word` VALUES ('340', '级答案', null);
INSERT INTO `sensitive_word` VALUES ('341', '急需嫖', null);
INSERT INTO `sensitive_word` VALUES ('342', '集体打砸', null);
INSERT INTO `sensitive_word` VALUES ('343', '集体腐', null);
INSERT INTO `sensitive_word` VALUES ('344', '挤乳汁', null);
INSERT INTO `sensitive_word` VALUES ('345', '擠乳汁', null);
INSERT INTO `sensitive_word` VALUES ('346', '佳静安定', null);
INSERT INTO `sensitive_word` VALUES ('347', '家一样饱', null);
INSERT INTO `sensitive_word` VALUES ('348', '家属被打', null);
INSERT INTO `sensitive_word` VALUES ('349', '甲虫跳', null);
INSERT INTO `sensitive_word` VALUES ('350', '甲流了', null);
INSERT INTO `sensitive_word` VALUES ('351', '奸成瘾', null);
INSERT INTO `sensitive_word` VALUES ('352', '兼职上门', null);
INSERT INTO `sensitive_word` VALUES ('353', '监听器', null);
INSERT INTO `sensitive_word` VALUES ('354', '监听王', null);
INSERT INTO `sensitive_word` VALUES ('355', '简易炸', null);
INSERT INTO `sensitive_word` VALUES ('356', '江胡内斗', null);
INSERT INTO `sensitive_word` VALUES ('357', '江太上', null);
INSERT INTO `sensitive_word` VALUES ('358', '江系人', null);
INSERT INTO `sensitive_word` VALUES ('359', '江贼民', null);
INSERT INTO `sensitive_word` VALUES ('360', '疆獨', null);
INSERT INTO `sensitive_word` VALUES ('361', '蒋彦永', null);
INSERT INTO `sensitive_word` VALUES ('362', '叫自慰', null);
INSERT INTO `sensitive_word` VALUES ('363', '揭贪难', null);
INSERT INTO `sensitive_word` VALUES ('364', '姐包夜', null);
INSERT INTO `sensitive_word` VALUES ('365', '姐服务', null);
INSERT INTO `sensitive_word` VALUES ('366', '姐兼职', null);
INSERT INTO `sensitive_word` VALUES ('367', '姐上门', null);
INSERT INTO `sensitive_word` VALUES ('368', '金扎金', null);
INSERT INTO `sensitive_word` VALUES ('369', '金钟气', null);
INSERT INTO `sensitive_word` VALUES ('370', '津大地震', null);
INSERT INTO `sensitive_word` VALUES ('371', '津地震', null);
INSERT INTO `sensitive_word` VALUES ('372', '进来的罪', null);
INSERT INTO `sensitive_word` VALUES ('373', '京地震', null);
INSERT INTO `sensitive_word` VALUES ('374', '京要地震', null);
INSERT INTO `sensitive_word` VALUES ('375', '经典谎言', null);
INSERT INTO `sensitive_word` VALUES ('376', '精子射在', null);
INSERT INTO `sensitive_word` VALUES ('377', '警察被', null);
INSERT INTO `sensitive_word` VALUES ('378', '警察的幌', null);
INSERT INTO `sensitive_word` VALUES ('379', '警察殴打', null);
INSERT INTO `sensitive_word` VALUES ('380', '警察说保', null);
INSERT INTO `sensitive_word` VALUES ('381', '警车雷达', null);
INSERT INTO `sensitive_word` VALUES ('382', '警方包庇', null);
INSERT INTO `sensitive_word` VALUES ('383', '警用品', null);
INSERT INTO `sensitive_word` VALUES ('384', '径步枪', null);
INSERT INTO `sensitive_word` VALUES ('385', '敬请忍', null);
INSERT INTO `sensitive_word` VALUES ('386', '究生答案', null);
INSERT INTO `sensitive_word` VALUES ('387', '九龙论坛', null);
INSERT INTO `sensitive_word` VALUES ('388', '九评共', null);
INSERT INTO `sensitive_word` VALUES ('389', '酒象喝汤', null);
INSERT INTO `sensitive_word` VALUES ('390', '酒像喝汤', null);
INSERT INTO `sensitive_word` VALUES ('391', '就爱插', null);
INSERT INTO `sensitive_word` VALUES ('392', '就要色', null);
INSERT INTO `sensitive_word` VALUES ('393', '举国体', null);
INSERT INTO `sensitive_word` VALUES ('394', '巨乳', null);
INSERT INTO `sensitive_word` VALUES ('395', '据说全民', null);
INSERT INTO `sensitive_word` VALUES ('396', '绝食声', null);
INSERT INTO `sensitive_word` VALUES ('397', '军长发威', null);
INSERT INTO `sensitive_word` VALUES ('398', '军刺', null);
INSERT INTO `sensitive_word` VALUES ('399', '军品特', null);
INSERT INTO `sensitive_word` VALUES ('400', '军用手', null);
INSERT INTO `sensitive_word` VALUES ('401', '开邓选', null);
INSERT INTO `sensitive_word` VALUES ('402', '开锁工具', null);
INSERT INTO `sensitive_word` VALUES ('403', '開碼', null);
INSERT INTO `sensitive_word` VALUES ('404', '開票', null);
INSERT INTO `sensitive_word` VALUES ('405', '砍杀幼', null);
INSERT INTO `sensitive_word` VALUES ('406', '砍伤儿', null);
INSERT INTO `sensitive_word` VALUES ('407', '康没有不', null);
INSERT INTO `sensitive_word` VALUES ('408', '康跳楼', null);
INSERT INTO `sensitive_word` VALUES ('409', '考答案', null);
INSERT INTO `sensitive_word` VALUES ('410', '考后付款', null);
INSERT INTO `sensitive_word` VALUES ('411', '考机构', null);
INSERT INTO `sensitive_word` VALUES ('412', '考考邓', null);
INSERT INTO `sensitive_word` VALUES ('413', '考联盟', null);
INSERT INTO `sensitive_word` VALUES ('414', '考前答', null);
INSERT INTO `sensitive_word` VALUES ('415', '考前答案', null);
INSERT INTO `sensitive_word` VALUES ('416', '考前付', null);
INSERT INTO `sensitive_word` VALUES ('417', '考设备', null);
INSERT INTO `sensitive_word` VALUES ('418', '考试包过', null);
INSERT INTO `sensitive_word` VALUES ('419', '考试保', null);
INSERT INTO `sensitive_word` VALUES ('420', '考试答案', null);
INSERT INTO `sensitive_word` VALUES ('421', '考试机构', null);
INSERT INTO `sensitive_word` VALUES ('422', '考试联盟', null);
INSERT INTO `sensitive_word` VALUES ('423', '考试枪', null);
INSERT INTO `sensitive_word` VALUES ('424', '考研考中', null);
INSERT INTO `sensitive_word` VALUES ('425', '考中答案', null);
INSERT INTO `sensitive_word` VALUES ('426', '磕彰', null);
INSERT INTO `sensitive_word` VALUES ('427', '克分析', null);
INSERT INTO `sensitive_word` VALUES ('428', '克千术', null);
INSERT INTO `sensitive_word` VALUES ('429', '克透视', null);
INSERT INTO `sensitive_word` VALUES ('430', '空和雅典', null);
INSERT INTO `sensitive_word` VALUES ('431', '孔摄像', null);
INSERT INTO `sensitive_word` VALUES ('432', '控诉世博', null);
INSERT INTO `sensitive_word` VALUES ('433', '口手枪', null);
INSERT INTO `sensitive_word` VALUES ('434', '骷髅死', null);
INSERT INTO `sensitive_word` VALUES ('435', '快速办', null);
INSERT INTO `sensitive_word` VALUES ('436', '矿难不公', null);
INSERT INTO `sensitive_word` VALUES ('437', '拉登说', null);
INSERT INTO `sensitive_word` VALUES ('438', '拉开水晶', null);
INSERT INTO `sensitive_word` VALUES ('439', '来福猎', null);
INSERT INTO `sensitive_word` VALUES ('440', '拦截器', null);
INSERT INTO `sensitive_word` VALUES ('441', '狼全部跪', null);
INSERT INTO `sensitive_word` VALUES ('442', '浪穴', null);
INSERT INTO `sensitive_word` VALUES ('443', '老虎机', null);
INSERT INTO `sensitive_word` VALUES ('444', '雷人女官', null);
INSERT INTO `sensitive_word` VALUES ('445', '类准确答', null);
INSERT INTO `sensitive_word` VALUES ('446', '黎阳平', null);
INSERT INTO `sensitive_word` VALUES ('447', '李洪志', null);
INSERT INTO `sensitive_word` VALUES ('448', '李咏曰', null);
INSERT INTO `sensitive_word` VALUES ('449', '理各种证', null);
INSERT INTO `sensitive_word` VALUES ('450', '理是影帝', null);
INSERT INTO `sensitive_word` VALUES ('451', '理证件', null);
INSERT INTO `sensitive_word` VALUES ('452', '理做帐报', null);
INSERT INTO `sensitive_word` VALUES ('453', '力骗中央', null);
INSERT INTO `sensitive_word` VALUES ('454', '力月西', null);
INSERT INTO `sensitive_word` VALUES ('455', '丽媛离', null);
INSERT INTO `sensitive_word` VALUES ('456', '利他林', null);
INSERT INTO `sensitive_word` VALUES ('457', '连发手', null);
INSERT INTO `sensitive_word` VALUES ('458', '聯繫電', null);
INSERT INTO `sensitive_word` VALUES ('459', '炼大法', null);
INSERT INTO `sensitive_word` VALUES ('460', '两岸才子', null);
INSERT INTO `sensitive_word` VALUES ('461', '两会代', null);
INSERT INTO `sensitive_word` VALUES ('462', '两会又三', null);
INSERT INTO `sensitive_word` VALUES ('463', '聊视频', null);
INSERT INTO `sensitive_word` VALUES ('464', '聊斋艳', null);
INSERT INTO `sensitive_word` VALUES ('465', '了件渔袍', null);
INSERT INTO `sensitive_word` VALUES ('466', '猎好帮手', null);
INSERT INTO `sensitive_word` VALUES ('467', '猎枪销', null);
INSERT INTO `sensitive_word` VALUES ('468', '猎槍', null);
INSERT INTO `sensitive_word` VALUES ('469', '獵槍', null);
INSERT INTO `sensitive_word` VALUES ('470', '领土拿', null);
INSERT INTO `sensitive_word` VALUES ('471', '流血事', null);
INSERT INTO `sensitive_word` VALUES ('472', '六合彩', null);
INSERT INTO `sensitive_word` VALUES ('473', '六死', null);
INSERT INTO `sensitive_word` VALUES ('474', '六四事', null);
INSERT INTO `sensitive_word` VALUES ('475', '六月联盟', null);
INSERT INTO `sensitive_word` VALUES ('476', '龙湾事件', null);
INSERT INTO `sensitive_word` VALUES ('477', '隆手指', null);
INSERT INTO `sensitive_word` VALUES ('478', '陆封锁', null);
INSERT INTO `sensitive_word` VALUES ('479', '陆同修', null);
INSERT INTO `sensitive_word` VALUES ('480', '氯胺酮', null);
INSERT INTO `sensitive_word` VALUES ('481', '乱奸', null);
INSERT INTO `sensitive_word` VALUES ('482', '乱伦类', null);
INSERT INTO `sensitive_word` VALUES ('483', '乱伦小', null);
INSERT INTO `sensitive_word` VALUES ('484', '亂倫', null);
INSERT INTO `sensitive_word` VALUES ('485', '伦理大', null);
INSERT INTO `sensitive_word` VALUES ('486', '伦理电影', null);
INSERT INTO `sensitive_word` VALUES ('487', '伦理毛', null);
INSERT INTO `sensitive_word` VALUES ('488', '伦理片', null);
INSERT INTO `sensitive_word` VALUES ('489', '轮功', null);
INSERT INTO `sensitive_word` VALUES ('490', '轮手枪', null);
INSERT INTO `sensitive_word` VALUES ('491', '论文代', null);
INSERT INTO `sensitive_word` VALUES ('492', '罗斯小姐', null);
INSERT INTO `sensitive_word` VALUES ('493', '裸聊网', null);
INSERT INTO `sensitive_word` VALUES ('494', '裸舞视', null);
INSERT INTO `sensitive_word` VALUES ('495', '落霞缀', null);
INSERT INTO `sensitive_word` VALUES ('496', '麻古', null);
INSERT INTO `sensitive_word` VALUES ('497', '麻果配', null);
INSERT INTO `sensitive_word` VALUES ('498', '麻果丸', null);
INSERT INTO `sensitive_word` VALUES ('499', '麻将透', null);
INSERT INTO `sensitive_word` VALUES ('500', '麻醉狗', null);
INSERT INTO `sensitive_word` VALUES ('501', '麻醉枪', null);
INSERT INTO `sensitive_word` VALUES ('502', '麻醉槍', null);
INSERT INTO `sensitive_word` VALUES ('503', '麻醉藥', null);
INSERT INTO `sensitive_word` VALUES ('504', '蟆叫专家', null);
INSERT INTO `sensitive_word` VALUES ('505', '卖地财政', null);
INSERT INTO `sensitive_word` VALUES ('506', '卖发票', null);
INSERT INTO `sensitive_word` VALUES ('507', '卖银行卡', null);
INSERT INTO `sensitive_word` VALUES ('508', '卖自考', null);
INSERT INTO `sensitive_word` VALUES ('509', '漫步丝', null);
INSERT INTO `sensitive_word` VALUES ('510', '忙爱国', null);
INSERT INTO `sensitive_word` VALUES ('511', '猫眼工具', null);
INSERT INTO `sensitive_word` VALUES ('512', '毛一鲜', null);
INSERT INTO `sensitive_word` VALUES ('513', '媒体封锁', null);
INSERT INTO `sensitive_word` VALUES ('514', '每周一死', null);
INSERT INTO `sensitive_word` VALUES ('515', '美艳少妇', null);
INSERT INTO `sensitive_word` VALUES ('516', '妹按摩', null);
INSERT INTO `sensitive_word` VALUES ('517', '妹上门', null);
INSERT INTO `sensitive_word` VALUES ('518', '门按摩', null);
INSERT INTO `sensitive_word` VALUES ('519', '门保健', null);
INSERT INTO `sensitive_word` VALUES ('520', '門服務', null);
INSERT INTO `sensitive_word` VALUES ('521', '氓培训', null);
INSERT INTO `sensitive_word` VALUES ('522', '蒙汗药', null);
INSERT INTO `sensitive_word` VALUES ('523', '迷幻型', null);
INSERT INTO `sensitive_word` VALUES ('524', '迷幻药', null);
INSERT INTO `sensitive_word` VALUES ('525', '迷幻藥', null);
INSERT INTO `sensitive_word` VALUES ('526', '迷昏口', null);
INSERT INTO `sensitive_word` VALUES ('527', '迷昏药', null);
INSERT INTO `sensitive_word` VALUES ('528', '迷昏藥', null);
INSERT INTO `sensitive_word` VALUES ('529', '迷魂香', null);
INSERT INTO `sensitive_word` VALUES ('530', '迷魂药', null);
INSERT INTO `sensitive_word` VALUES ('531', '迷魂藥', null);
INSERT INTO `sensitive_word` VALUES ('532', '迷奸药', null);
INSERT INTO `sensitive_word` VALUES ('533', '迷情水', null);
INSERT INTO `sensitive_word` VALUES ('534', '迷情药', null);
INSERT INTO `sensitive_word` VALUES ('535', '迷藥', null);
INSERT INTO `sensitive_word` VALUES ('536', '谜奸药', null);
INSERT INTO `sensitive_word` VALUES ('537', '蜜穴', null);
INSERT INTO `sensitive_word` VALUES ('538', '灭绝罪', null);
INSERT INTO `sensitive_word` VALUES ('539', '民储害', null);
INSERT INTO `sensitive_word` VALUES ('540', '民九亿商', null);
INSERT INTO `sensitive_word` VALUES ('541', '民抗议', null);
INSERT INTO `sensitive_word` VALUES ('542', '明慧网', null);
INSERT INTO `sensitive_word` VALUES ('543', '铭记印尼', null);
INSERT INTO `sensitive_word` VALUES ('544', '摩小姐', null);
INSERT INTO `sensitive_word` VALUES ('545', '母乳家', null);
INSERT INTO `sensitive_word` VALUES ('546', '木齐针', null);
INSERT INTO `sensitive_word` VALUES ('547', '幕没有不', null);
INSERT INTO `sensitive_word` VALUES ('548', '幕前戲', null);
INSERT INTO `sensitive_word` VALUES ('549', '内射', null);
INSERT INTO `sensitive_word` VALUES ('550', '南充针', null);
INSERT INTO `sensitive_word` VALUES ('551', '嫩穴', null);
INSERT INTO `sensitive_word` VALUES ('552', '嫩阴', null);
INSERT INTO `sensitive_word` VALUES ('553', '泥马之歌', null);
INSERT INTO `sensitive_word` VALUES ('554', '你的西域', null);
INSERT INTO `sensitive_word` VALUES ('555', '拟涛哥', null);
INSERT INTO `sensitive_word` VALUES ('556', '娘两腿之间', null);
INSERT INTO `sensitive_word` VALUES ('557', '妞上门', null);
INSERT INTO `sensitive_word` VALUES ('558', '浓精', null);
INSERT INTO `sensitive_word` VALUES ('559', '怒的志愿', null);
INSERT INTO `sensitive_word` VALUES ('560', '女被人家搞', null);
INSERT INTO `sensitive_word` VALUES ('561', '女激情', null);
INSERT INTO `sensitive_word` VALUES ('562', '女技师', null);
INSERT INTO `sensitive_word` VALUES ('563', '女人和狗', null);
INSERT INTO `sensitive_word` VALUES ('564', '女任职名', null);
INSERT INTO `sensitive_word` VALUES ('565', '女上门', null);
INSERT INTO `sensitive_word` VALUES ('566', '女優', null);
INSERT INTO `sensitive_word` VALUES ('567', '鸥之歌', null);
INSERT INTO `sensitive_word` VALUES ('568', '拍肩神药', null);
INSERT INTO `sensitive_word` VALUES ('569', '拍肩型', null);
INSERT INTO `sensitive_word` VALUES ('570', '牌分析', null);
INSERT INTO `sensitive_word` VALUES ('571', '牌技网', null);
INSERT INTO `sensitive_word` VALUES ('572', '炮的小蜜', null);
INSERT INTO `sensitive_word` VALUES ('573', '陪考枪', null);
INSERT INTO `sensitive_word` VALUES ('574', '配有消', null);
INSERT INTO `sensitive_word` VALUES ('575', '喷尿', null);
INSERT INTO `sensitive_word` VALUES ('576', '嫖俄罗', null);
INSERT INTO `sensitive_word` VALUES ('577', '嫖鸡', null);
INSERT INTO `sensitive_word` VALUES ('578', '平惨案', null);
INSERT INTO `sensitive_word` VALUES ('579', '平叫到床', null);
INSERT INTO `sensitive_word` VALUES ('580', '仆不怕饮', null);
INSERT INTO `sensitive_word` VALUES ('581', '普通嘌', null);
INSERT INTO `sensitive_word` VALUES ('582', '期货配', null);
INSERT INTO `sensitive_word` VALUES ('583', '奇迹的黄', null);
INSERT INTO `sensitive_word` VALUES ('584', '奇淫散', null);
INSERT INTO `sensitive_word` VALUES ('585', '骑单车出', null);
INSERT INTO `sensitive_word` VALUES ('586', '气狗', null);
INSERT INTO `sensitive_word` VALUES ('587', '气枪', null);
INSERT INTO `sensitive_word` VALUES ('588', '汽狗', null);
INSERT INTO `sensitive_word` VALUES ('589', '汽枪', null);
INSERT INTO `sensitive_word` VALUES ('590', '氣槍', null);
INSERT INTO `sensitive_word` VALUES ('591', '铅弹', null);
INSERT INTO `sensitive_word` VALUES ('592', '钱三字经', null);
INSERT INTO `sensitive_word` VALUES ('593', '枪出售', null);
INSERT INTO `sensitive_word` VALUES ('594', '枪的参', null);
INSERT INTO `sensitive_word` VALUES ('595', '枪的分', null);
INSERT INTO `sensitive_word` VALUES ('596', '枪的结', null);
INSERT INTO `sensitive_word` VALUES ('597', '枪的制', null);
INSERT INTO `sensitive_word` VALUES ('598', '枪货到', null);
INSERT INTO `sensitive_word` VALUES ('599', '枪决女犯', null);
INSERT INTO `sensitive_word` VALUES ('600', '枪决现场', null);
INSERT INTO `sensitive_word` VALUES ('601', '枪模', null);
INSERT INTO `sensitive_word` VALUES ('602', '枪手队', null);
INSERT INTO `sensitive_word` VALUES ('603', '枪手网', null);
INSERT INTO `sensitive_word` VALUES ('604', '枪销售', null);
INSERT INTO `sensitive_word` VALUES ('605', '枪械制', null);
INSERT INTO `sensitive_word` VALUES ('606', '枪子弹', null);
INSERT INTO `sensitive_word` VALUES ('607', '强权政府', null);
INSERT INTO `sensitive_word` VALUES ('608', '强硬发言', null);
INSERT INTO `sensitive_word` VALUES ('609', '抢其火炬', null);
INSERT INTO `sensitive_word` VALUES ('610', '切听器', null);
INSERT INTO `sensitive_word` VALUES ('611', '窃听器', null);
INSERT INTO `sensitive_word` VALUES ('612', '禽流感了', null);
INSERT INTO `sensitive_word` VALUES ('613', '勤捞致', null);
INSERT INTO `sensitive_word` VALUES ('614', '氢弹手', null);
INSERT INTO `sensitive_word` VALUES ('615', '清除负面', null);
INSERT INTO `sensitive_word` VALUES ('616', '清純壆', null);
INSERT INTO `sensitive_word` VALUES ('617', '情聊天室', null);
INSERT INTO `sensitive_word` VALUES ('618', '情妹妹', null);
INSERT INTO `sensitive_word` VALUES ('619', '情视频', null);
INSERT INTO `sensitive_word` VALUES ('620', '情自拍', null);
INSERT INTO `sensitive_word` VALUES ('621', '氰化钾', null);
INSERT INTO `sensitive_word` VALUES ('622', '氰化钠', null);
INSERT INTO `sensitive_word` VALUES ('623', '请集会', null);
INSERT INTO `sensitive_word` VALUES ('624', '请示威', null);
INSERT INTO `sensitive_word` VALUES ('625', '请愿', null);
INSERT INTO `sensitive_word` VALUES ('626', '琼花问', null);
INSERT INTO `sensitive_word` VALUES ('627', '区的雷人', null);
INSERT INTO `sensitive_word` VALUES ('628', '娶韩国', null);
INSERT INTO `sensitive_word` VALUES ('629', '全真证', null);
INSERT INTO `sensitive_word` VALUES ('630', '群奸暴', null);
INSERT INTO `sensitive_word` VALUES ('631', '群起抗暴', null);
INSERT INTO `sensitive_word` VALUES ('632', '群体性事', null);
INSERT INTO `sensitive_word` VALUES ('633', '绕过封锁', null);
INSERT INTO `sensitive_word` VALUES ('634', '惹的国', null);
INSERT INTO `sensitive_word` VALUES ('635', '人权律', null);
INSERT INTO `sensitive_word` VALUES ('636', '人体艺', null);
INSERT INTO `sensitive_word` VALUES ('637', '人游行', null);
INSERT INTO `sensitive_word` VALUES ('638', '人在云上', null);
INSERT INTO `sensitive_word` VALUES ('639', '人真钱', null);
INSERT INTO `sensitive_word` VALUES ('640', '认牌绝', null);
INSERT INTO `sensitive_word` VALUES ('641', '任于斯国', null);
INSERT INTO `sensitive_word` VALUES ('642', '柔胸粉', null);
INSERT INTO `sensitive_word` VALUES ('643', '肉洞', null);
INSERT INTO `sensitive_word` VALUES ('644', '肉棍', null);
INSERT INTO `sensitive_word` VALUES ('645', '如厕死', null);
INSERT INTO `sensitive_word` VALUES ('646', '乳交', null);
INSERT INTO `sensitive_word` VALUES ('647', '软弱的国', null);
INSERT INTO `sensitive_word` VALUES ('648', '赛后骚', null);
INSERT INTO `sensitive_word` VALUES ('649', '三挫', null);
INSERT INTO `sensitive_word` VALUES ('650', '三级片', null);
INSERT INTO `sensitive_word` VALUES ('651', '三秒倒', null);
INSERT INTO `sensitive_word` VALUES ('652', '三网友', null);
INSERT INTO `sensitive_word` VALUES ('653', '三唑', null);
INSERT INTO `sensitive_word` VALUES ('654', '骚妇', null);
INSERT INTO `sensitive_word` VALUES ('655', '骚浪', null);
INSERT INTO `sensitive_word` VALUES ('656', '骚穴', null);
INSERT INTO `sensitive_word` VALUES ('657', '骚嘴', null);
INSERT INTO `sensitive_word` VALUES ('658', '扫了爷爷', null);
INSERT INTO `sensitive_word` VALUES ('659', '色电影', null);
INSERT INTO `sensitive_word` VALUES ('660', '色妹妹', null);
INSERT INTO `sensitive_word` VALUES ('661', '色视频', null);
INSERT INTO `sensitive_word` VALUES ('662', '色小说', null);
INSERT INTO `sensitive_word` VALUES ('663', '杀指南', null);
INSERT INTO `sensitive_word` VALUES ('664', '山涉黑', null);
INSERT INTO `sensitive_word` VALUES ('665', '煽动不明', null);
INSERT INTO `sensitive_word` VALUES ('666', '煽动群众', null);
INSERT INTO `sensitive_word` VALUES ('667', '上门激', null);
INSERT INTO `sensitive_word` VALUES ('668', '烧公安局', null);
INSERT INTO `sensitive_word` VALUES ('669', '烧瓶的', null);
INSERT INTO `sensitive_word` VALUES ('670', '韶关斗', null);
INSERT INTO `sensitive_word` VALUES ('671', '韶关玩', null);
INSERT INTO `sensitive_word` VALUES ('672', '韶关旭', null);
INSERT INTO `sensitive_word` VALUES ('673', '射网枪', null);
INSERT INTO `sensitive_word` VALUES ('674', '涉嫌抄袭', null);
INSERT INTO `sensitive_word` VALUES ('675', '深喉冰', null);
INSERT INTO `sensitive_word` VALUES ('676', '神七假', null);
INSERT INTO `sensitive_word` VALUES ('677', '神韵艺术', null);
INSERT INTO `sensitive_word` VALUES ('678', '生被砍', null);
INSERT INTO `sensitive_word` VALUES ('679', '生踩踏', null);
INSERT INTO `sensitive_word` VALUES ('680', '生肖中特', null);
INSERT INTO `sensitive_word` VALUES ('681', '圣战不息', null);
INSERT INTO `sensitive_word` VALUES ('682', '盛行在舞', null);
INSERT INTO `sensitive_word` VALUES ('683', '尸博', null);
INSERT INTO `sensitive_word` VALUES ('684', '失身水', null);
INSERT INTO `sensitive_word` VALUES ('685', '失意药', null);
INSERT INTO `sensitive_word` VALUES ('686', '狮子旗', null);
INSERT INTO `sensitive_word` VALUES ('687', '十八等', null);
INSERT INTO `sensitive_word` VALUES ('688', '十大谎', null);
INSERT INTO `sensitive_word` VALUES ('689', '十大禁', null);
INSERT INTO `sensitive_word` VALUES ('690', '十个预言', null);
INSERT INTO `sensitive_word` VALUES ('691', '十类人不', null);
INSERT INTO `sensitive_word` VALUES ('692', '十七大幕', null);
INSERT INTO `sensitive_word` VALUES ('693', '实毕业证', null);
INSERT INTO `sensitive_word` VALUES ('694', '实体娃', null);
INSERT INTO `sensitive_word` VALUES ('695', '实学历文', null);
INSERT INTO `sensitive_word` VALUES ('696', '士康事件', null);
INSERT INTO `sensitive_word` VALUES ('697', '式粉推', null);
INSERT INTO `sensitive_word` VALUES ('698', '视解密', null);
INSERT INTO `sensitive_word` VALUES ('699', '是躲猫', null);
INSERT INTO `sensitive_word` VALUES ('700', '手变牌', null);
INSERT INTO `sensitive_word` VALUES ('701', '手答案', null);
INSERT INTO `sensitive_word` VALUES ('702', '手狗', null);
INSERT INTO `sensitive_word` VALUES ('703', '手机跟', null);
INSERT INTO `sensitive_word` VALUES ('704', '手机监', null);
INSERT INTO `sensitive_word` VALUES ('705', '手机窃', null);
INSERT INTO `sensitive_word` VALUES ('706', '手机追', null);
INSERT INTO `sensitive_word` VALUES ('707', '手拉鸡', null);
INSERT INTO `sensitive_word` VALUES ('708', '手木仓', null);
INSERT INTO `sensitive_word` VALUES ('709', '手槍', null);
INSERT INTO `sensitive_word` VALUES ('710', '守所死法', null);
INSERT INTO `sensitive_word` VALUES ('711', '兽交', null);
INSERT INTO `sensitive_word` VALUES ('712', '售步枪', null);
INSERT INTO `sensitive_word` VALUES ('713', '售纯度', null);
INSERT INTO `sensitive_word` VALUES ('714', '售单管', null);
INSERT INTO `sensitive_word` VALUES ('715', '售弹簧刀', null);
INSERT INTO `sensitive_word` VALUES ('716', '售防身', null);
INSERT INTO `sensitive_word` VALUES ('717', '售狗子', null);
INSERT INTO `sensitive_word` VALUES ('718', '售虎头', null);
INSERT INTO `sensitive_word` VALUES ('719', '售火药', null);
INSERT INTO `sensitive_word` VALUES ('720', '售假币', null);
INSERT INTO `sensitive_word` VALUES ('721', '售健卫', null);
INSERT INTO `sensitive_word` VALUES ('722', '售军用', null);
INSERT INTO `sensitive_word` VALUES ('723', '售猎枪', null);
INSERT INTO `sensitive_word` VALUES ('724', '售氯胺', null);
INSERT INTO `sensitive_word` VALUES ('725', '售麻醉', null);
INSERT INTO `sensitive_word` VALUES ('726', '售冒名', null);
INSERT INTO `sensitive_word` VALUES ('727', '售枪支', null);
INSERT INTO `sensitive_word` VALUES ('728', '售热武', null);
INSERT INTO `sensitive_word` VALUES ('729', '售三棱', null);
INSERT INTO `sensitive_word` VALUES ('730', '售手枪', null);
INSERT INTO `sensitive_word` VALUES ('731', '售五四', null);
INSERT INTO `sensitive_word` VALUES ('732', '售信用', null);
INSERT INTO `sensitive_word` VALUES ('733', '售一元硬', null);
INSERT INTO `sensitive_word` VALUES ('734', '售子弹', null);
INSERT INTO `sensitive_word` VALUES ('735', '售左轮', null);
INSERT INTO `sensitive_word` VALUES ('736', '书办理', null);
INSERT INTO `sensitive_word` VALUES ('737', '熟妇', null);
INSERT INTO `sensitive_word` VALUES ('738', '术牌具', null);
INSERT INTO `sensitive_word` VALUES ('739', '双管立', null);
INSERT INTO `sensitive_word` VALUES ('740', '双管平', null);
INSERT INTO `sensitive_word` VALUES ('741', '水阎王', null);
INSERT INTO `sensitive_word` VALUES ('742', '丝护士', null);
INSERT INTO `sensitive_word` VALUES ('743', '丝情侣', null);
INSERT INTO `sensitive_word` VALUES ('744', '丝袜保', null);
INSERT INTO `sensitive_word` VALUES ('745', '丝袜恋', null);
INSERT INTO `sensitive_word` VALUES ('746', '丝袜美', null);
INSERT INTO `sensitive_word` VALUES ('747', '丝袜妹', null);
INSERT INTO `sensitive_word` VALUES ('748', '丝袜网', null);
INSERT INTO `sensitive_word` VALUES ('749', '丝足按', null);
INSERT INTO `sensitive_word` VALUES ('750', '司长期有', null);
INSERT INTO `sensitive_word` VALUES ('751', '司法黑', null);
INSERT INTO `sensitive_word` VALUES ('752', '私房写真', null);
INSERT INTO `sensitive_word` VALUES ('753', '死法分布', null);
INSERT INTO `sensitive_word` VALUES ('754', '死要见毛', null);
INSERT INTO `sensitive_word` VALUES ('755', '四博会', null);
INSERT INTO `sensitive_word` VALUES ('756', '四大扯个', null);
INSERT INTO `sensitive_word` VALUES ('757', '四小码', null);
INSERT INTO `sensitive_word` VALUES ('758', '苏家屯集', null);
INSERT INTO `sensitive_word` VALUES ('759', '诉讼集团', null);
INSERT INTO `sensitive_word` VALUES ('760', '素女心', null);
INSERT INTO `sensitive_word` VALUES ('761', '速代办', null);
INSERT INTO `sensitive_word` VALUES ('762', '速取证', null);
INSERT INTO `sensitive_word` VALUES ('763', '酸羟亚胺', null);
INSERT INTO `sensitive_word` VALUES ('764', '蹋纳税', null);
INSERT INTO `sensitive_word` VALUES ('765', '太王四神', null);
INSERT INTO `sensitive_word` VALUES ('766', '泰兴幼', null);
INSERT INTO `sensitive_word` VALUES ('767', '泰兴镇中', null);
INSERT INTO `sensitive_word` VALUES ('768', '泰州幼', null);
INSERT INTO `sensitive_word` VALUES ('769', '贪官也辛', null);
INSERT INTO `sensitive_word` VALUES ('770', '探测狗', null);
INSERT INTO `sensitive_word` VALUES ('771', '涛共产', null);
INSERT INTO `sensitive_word` VALUES ('772', '涛一样胡', null);
INSERT INTO `sensitive_word` VALUES ('773', '特工资', null);
INSERT INTO `sensitive_word` VALUES ('774', '特码', null);
INSERT INTO `sensitive_word` VALUES ('775', '特上门', null);
INSERT INTO `sensitive_word` VALUES ('776', '体透视镜', null);
INSERT INTO `sensitive_word` VALUES ('777', '替考', null);
INSERT INTO `sensitive_word` VALUES ('778', '替人体', null);
INSERT INTO `sensitive_word` VALUES ('779', '天朝特', null);
INSERT INTO `sensitive_word` VALUES ('780', '天鹅之旅', null);
INSERT INTO `sensitive_word` VALUES ('781', '天推广歌', null);
INSERT INTO `sensitive_word` VALUES ('782', '田罢工', null);
INSERT INTO `sensitive_word` VALUES ('783', '田田桑', null);
INSERT INTO `sensitive_word` VALUES ('784', '田停工', null);
INSERT INTO `sensitive_word` VALUES ('785', '庭保养', null);
INSERT INTO `sensitive_word` VALUES ('786', '庭审直播', null);
INSERT INTO `sensitive_word` VALUES ('787', '通钢总经', null);
INSERT INTO `sensitive_word` VALUES ('788', '偷電器', null);
INSERT INTO `sensitive_word` VALUES ('789', '偷肃贪', null);
INSERT INTO `sensitive_word` VALUES ('790', '偷听器', null);
INSERT INTO `sensitive_word` VALUES ('791', '偷偷贪', null);
INSERT INTO `sensitive_word` VALUES ('792', '头双管', null);
INSERT INTO `sensitive_word` VALUES ('793', '透视功能', null);
INSERT INTO `sensitive_word` VALUES ('794', '透视镜', null);
INSERT INTO `sensitive_word` VALUES ('795', '透视扑', null);
INSERT INTO `sensitive_word` VALUES ('796', '透视器', null);
INSERT INTO `sensitive_word` VALUES ('797', '透视眼镜', null);
INSERT INTO `sensitive_word` VALUES ('798', '透视药', null);
INSERT INTO `sensitive_word` VALUES ('799', '透视仪', null);
INSERT INTO `sensitive_word` VALUES ('800', '秃鹰汽', null);
INSERT INTO `sensitive_word` VALUES ('801', '突破封锁', null);
INSERT INTO `sensitive_word` VALUES ('802', '突破网路', null);
INSERT INTO `sensitive_word` VALUES ('803', '推油按', null);
INSERT INTO `sensitive_word` VALUES ('804', '脱衣艳', null);
INSERT INTO `sensitive_word` VALUES ('805', '瓦斯手', null);
INSERT INTO `sensitive_word` VALUES ('806', '袜按摩', null);
INSERT INTO `sensitive_word` VALUES ('807', '外透视镜', null);
INSERT INTO `sensitive_word` VALUES ('808', '外围赌球', null);
INSERT INTO `sensitive_word` VALUES ('809', '湾版假', null);
INSERT INTO `sensitive_word` VALUES ('810', '万能钥匙', null);
INSERT INTO `sensitive_word` VALUES ('811', '万人骚动', null);
INSERT INTO `sensitive_word` VALUES ('812', '王立军', null);
INSERT INTO `sensitive_word` VALUES ('813', '王益案', null);
INSERT INTO `sensitive_word` VALUES ('814', '网民案', null);
INSERT INTO `sensitive_word` VALUES ('815', '网民获刑', null);
INSERT INTO `sensitive_word` VALUES ('816', '网民诬', null);
INSERT INTO `sensitive_word` VALUES ('817', '微型摄像', null);
INSERT INTO `sensitive_word` VALUES ('818', '围攻警', null);
INSERT INTO `sensitive_word` VALUES ('819', '围攻上海', null);
INSERT INTO `sensitive_word` VALUES ('820', '维汉员', null);
INSERT INTO `sensitive_word` VALUES ('821', '维权基', null);
INSERT INTO `sensitive_word` VALUES ('822', '维权人', null);
INSERT INTO `sensitive_word` VALUES ('823', '维权谈', null);
INSERT INTO `sensitive_word` VALUES ('824', '委坐船', null);
INSERT INTO `sensitive_word` VALUES ('825', '谓的和谐', null);
INSERT INTO `sensitive_word` VALUES ('826', '温家堡', null);
INSERT INTO `sensitive_word` VALUES ('827', '温切斯特', null);
INSERT INTO `sensitive_word` VALUES ('828', '温影帝', null);
INSERT INTO `sensitive_word` VALUES ('829', '溫家寶', null);
INSERT INTO `sensitive_word` VALUES ('830', '瘟加饱', null);
INSERT INTO `sensitive_word` VALUES ('831', '瘟假饱', null);
INSERT INTO `sensitive_word` VALUES ('832', '文凭证', null);
INSERT INTO `sensitive_word` VALUES ('833', '文强', null);
INSERT INTO `sensitive_word` VALUES ('834', '纹了毛', null);
INSERT INTO `sensitive_word` VALUES ('835', '闻封锁', null);
INSERT INTO `sensitive_word` VALUES ('836', '瓮安', null);
INSERT INTO `sensitive_word` VALUES ('837', '我的西域', null);
INSERT INTO `sensitive_word` VALUES ('838', '我搞台独', null);
INSERT INTO `sensitive_word` VALUES ('839', '乌蝇水', null);
INSERT INTO `sensitive_word` VALUES ('840', '无耻语录', null);
INSERT INTO `sensitive_word` VALUES ('841', '无码专', null);
INSERT INTO `sensitive_word` VALUES ('842', '五套功', null);
INSERT INTO `sensitive_word` VALUES ('843', '五月天', null);
INSERT INTO `sensitive_word` VALUES ('844', '午夜电', null);
INSERT INTO `sensitive_word` VALUES ('845', '午夜极', null);
INSERT INTO `sensitive_word` VALUES ('846', '武警暴', null);
INSERT INTO `sensitive_word` VALUES ('847', '武警殴', null);
INSERT INTO `sensitive_word` VALUES ('848', '武警已增', null);
INSERT INTO `sensitive_word` VALUES ('849', '务员答案', null);
INSERT INTO `sensitive_word` VALUES ('850', '务员考试', null);
INSERT INTO `sensitive_word` VALUES ('851', '雾型迷', null);
INSERT INTO `sensitive_word` VALUES ('852', '西藏限', null);
INSERT INTO `sensitive_word` VALUES ('853', '西服进去', null);
INSERT INTO `sensitive_word` VALUES ('854', '希脏', null);
INSERT INTO `sensitive_word` VALUES ('855', '习进平', null);
INSERT INTO `sensitive_word` VALUES ('856', '习晋平', null);
INSERT INTO `sensitive_word` VALUES ('857', '席复活', null);
INSERT INTO `sensitive_word` VALUES ('858', '席临终前', null);
INSERT INTO `sensitive_word` VALUES ('859', '席指着护', null);
INSERT INTO `sensitive_word` VALUES ('860', '洗澡死', null);
INSERT INTO `sensitive_word` VALUES ('861', '喜贪赃', null);
INSERT INTO `sensitive_word` VALUES ('862', '先烈纷纷', null);
INSERT INTO `sensitive_word` VALUES ('863', '现大地震', null);
INSERT INTO `sensitive_word` VALUES ('864', '现金投注', null);
INSERT INTO `sensitive_word` VALUES ('865', '线透视镜', null);
INSERT INTO `sensitive_word` VALUES ('866', '限制言', null);
INSERT INTO `sensitive_word` VALUES ('867', '陷害案', null);
INSERT INTO `sensitive_word` VALUES ('868', '陷害罪', null);
INSERT INTO `sensitive_word` VALUES ('869', '相自首', null);
INSERT INTO `sensitive_word` VALUES ('870', '香港论坛', null);
INSERT INTO `sensitive_word` VALUES ('871', '香港马会', null);
INSERT INTO `sensitive_word` VALUES ('872', '香港一类', null);
INSERT INTO `sensitive_word` VALUES ('873', '香港总彩', null);
INSERT INTO `sensitive_word` VALUES ('874', '硝化甘', null);
INSERT INTO `sensitive_word` VALUES ('875', '小穴', null);
INSERT INTO `sensitive_word` VALUES ('876', '校骚乱', null);
INSERT INTO `sensitive_word` VALUES ('877', '协晃悠', null);
INSERT INTO `sensitive_word` VALUES ('878', '写两会', null);
INSERT INTO `sensitive_word` VALUES ('879', '泄漏的内', null);
INSERT INTO `sensitive_word` VALUES ('880', '新建户', null);
INSERT INTO `sensitive_word` VALUES ('881', '新疆叛', null);
INSERT INTO `sensitive_word` VALUES ('882', '新疆限', null);
INSERT INTO `sensitive_word` VALUES ('883', '新金瓶', null);
INSERT INTO `sensitive_word` VALUES ('884', '新唐人', null);
INSERT INTO `sensitive_word` VALUES ('885', '信访专班', null);
INSERT INTO `sensitive_word` VALUES ('886', '信接收器', null);
INSERT INTO `sensitive_word` VALUES ('887', '兴中心幼', null);
INSERT INTO `sensitive_word` VALUES ('888', '星上门', null);
INSERT INTO `sensitive_word` VALUES ('889', '行长王益', null);
INSERT INTO `sensitive_word` VALUES ('890', '形透视镜', null);
INSERT INTO `sensitive_word` VALUES ('891', '型手枪', null);
INSERT INTO `sensitive_word` VALUES ('892', '姓忽悠', null);
INSERT INTO `sensitive_word` VALUES ('893', '幸运码', null);
INSERT INTO `sensitive_word` VALUES ('894', '性爱日', null);
INSERT INTO `sensitive_word` VALUES ('895', '性福情', null);
INSERT INTO `sensitive_word` VALUES ('896', '性感少', null);
INSERT INTO `sensitive_word` VALUES ('897', '性推广歌', null);
INSERT INTO `sensitive_word` VALUES ('898', '胸主席', null);
INSERT INTO `sensitive_word` VALUES ('899', '徐玉元', null);
INSERT INTO `sensitive_word` VALUES ('900', '学骚乱', null);
INSERT INTO `sensitive_word` VALUES ('901', '学位證', null);
INSERT INTO `sensitive_word` VALUES ('902', '學生妹', null);
INSERT INTO `sensitive_word` VALUES ('903', '丫与王益', null);
INSERT INTO `sensitive_word` VALUES ('904', '烟感器', null);
INSERT INTO `sensitive_word` VALUES ('905', '严晓玲', null);
INSERT INTO `sensitive_word` VALUES ('906', '言被劳教', null);
INSERT INTO `sensitive_word` VALUES ('907', '言论罪', null);
INSERT INTO `sensitive_word` VALUES ('908', '盐酸曲', null);
INSERT INTO `sensitive_word` VALUES ('909', '颜射', null);
INSERT INTO `sensitive_word` VALUES ('910', '恙虫病', null);
INSERT INTO `sensitive_word` VALUES ('911', '姚明进去', null);
INSERT INTO `sensitive_word` VALUES ('912', '要人权', null);
INSERT INTO `sensitive_word` VALUES ('913', '要射精了', null);
INSERT INTO `sensitive_word` VALUES ('914', '要射了', null);
INSERT INTO `sensitive_word` VALUES ('915', '要泄了', null);
INSERT INTO `sensitive_word` VALUES ('916', '夜激情', null);
INSERT INTO `sensitive_word` VALUES ('917', '液体炸', null);
INSERT INTO `sensitive_word` VALUES ('918', '一小撮别', null);
INSERT INTO `sensitive_word` VALUES ('919', '遗情书', null);
INSERT INTO `sensitive_word` VALUES ('920', '蚁力神', null);
INSERT INTO `sensitive_word` VALUES ('921', '益关注组', null);
INSERT INTO `sensitive_word` VALUES ('922', '益受贿', null);
INSERT INTO `sensitive_word` VALUES ('923', '阴间来电', null);
INSERT INTO `sensitive_word` VALUES ('924', '陰唇', null);
INSERT INTO `sensitive_word` VALUES ('925', '陰道', null);
INSERT INTO `sensitive_word` VALUES ('926', '陰戶', null);
INSERT INTO `sensitive_word` VALUES ('927', '淫魔舞', null);
INSERT INTO `sensitive_word` VALUES ('928', '淫情女', null);
INSERT INTO `sensitive_word` VALUES ('929', '淫肉', null);
INSERT INTO `sensitive_word` VALUES ('930', '淫騷妹', null);
INSERT INTO `sensitive_word` VALUES ('931', '淫兽', null);
INSERT INTO `sensitive_word` VALUES ('932', '淫兽学', null);
INSERT INTO `sensitive_word` VALUES ('933', '淫水', null);
INSERT INTO `sensitive_word` VALUES ('934', '淫穴', null);
INSERT INTO `sensitive_word` VALUES ('935', '隐形耳', null);
INSERT INTO `sensitive_word` VALUES ('936', '隐形喷剂', null);
INSERT INTO `sensitive_word` VALUES ('937', '应子弹', null);
INSERT INTO `sensitive_word` VALUES ('938', '婴儿命', null);
INSERT INTO `sensitive_word` VALUES ('939', '咏妓', null);
INSERT INTO `sensitive_word` VALUES ('940', '用手枪', null);
INSERT INTO `sensitive_word` VALUES ('941', '幽谷三', null);
INSERT INTO `sensitive_word` VALUES ('942', '游精佑', null);
INSERT INTO `sensitive_word` VALUES ('943', '有奶不一', null);
INSERT INTO `sensitive_word` VALUES ('944', '右转是政', null);
INSERT INTO `sensitive_word` VALUES ('945', '幼齿类', null);
INSERT INTO `sensitive_word` VALUES ('946', '娱乐透视', null);
INSERT INTO `sensitive_word` VALUES ('947', '愚民同', null);
INSERT INTO `sensitive_word` VALUES ('948', '愚民政', null);
INSERT INTO `sensitive_word` VALUES ('949', '与狗性', null);
INSERT INTO `sensitive_word` VALUES ('950', '玉蒲团', null);
INSERT INTO `sensitive_word` VALUES ('951', '育部女官', null);
INSERT INTO `sensitive_word` VALUES ('952', '冤民大', null);
INSERT INTO `sensitive_word` VALUES ('953', '鸳鸯洗', null);
INSERT INTO `sensitive_word` VALUES ('954', '园惨案', null);
INSERT INTO `sensitive_word` VALUES ('955', '园发生砍', null);
INSERT INTO `sensitive_word` VALUES ('956', '园砍杀', null);
INSERT INTO `sensitive_word` VALUES ('957', '园凶杀', null);
INSERT INTO `sensitive_word` VALUES ('958', '园血案', null);
INSERT INTO `sensitive_word` VALUES ('959', '原一九五七', null);
INSERT INTO `sensitive_word` VALUES ('960', '原装弹', null);
INSERT INTO `sensitive_word` VALUES ('961', '袁腾飞', null);
INSERT INTO `sensitive_word` VALUES ('962', '晕倒型', null);
INSERT INTO `sensitive_word` VALUES ('963', '韵徐娘', null);
INSERT INTO `sensitive_word` VALUES ('964', '遭便衣', null);
INSERT INTO `sensitive_word` VALUES ('965', '遭到警', null);
INSERT INTO `sensitive_word` VALUES ('966', '遭警察', null);
INSERT INTO `sensitive_word` VALUES ('967', '遭武警', null);
INSERT INTO `sensitive_word` VALUES ('968', '择油录', null);
INSERT INTO `sensitive_word` VALUES ('969', '曾道人', null);
INSERT INTO `sensitive_word` VALUES ('970', '炸弹教', null);
INSERT INTO `sensitive_word` VALUES ('971', '炸弹遥控', null);
INSERT INTO `sensitive_word` VALUES ('972', '炸广州', null);
INSERT INTO `sensitive_word` VALUES ('973', '炸立交', null);
INSERT INTO `sensitive_word` VALUES ('974', '炸药的制', null);
INSERT INTO `sensitive_word` VALUES ('975', '炸药配', null);
INSERT INTO `sensitive_word` VALUES ('976', '炸药制', null);
INSERT INTO `sensitive_word` VALUES ('977', '张春桥', null);
INSERT INTO `sensitive_word` VALUES ('978', '找枪手', null);
INSERT INTO `sensitive_word` VALUES ('979', '找援交', null);
INSERT INTO `sensitive_word` VALUES ('980', '找政法委副', null);
INSERT INTO `sensitive_word` VALUES ('981', '赵紫阳', null);
INSERT INTO `sensitive_word` VALUES ('982', '针刺案', null);
INSERT INTO `sensitive_word` VALUES ('983', '针刺伤', null);
INSERT INTO `sensitive_word` VALUES ('984', '针刺事', null);
INSERT INTO `sensitive_word` VALUES ('985', '针刺死', null);
INSERT INTO `sensitive_word` VALUES ('986', '侦探设备', null);
INSERT INTO `sensitive_word` VALUES ('987', '真钱斗地', null);
INSERT INTO `sensitive_word` VALUES ('988', '真钱投注', null);
INSERT INTO `sensitive_word` VALUES ('989', '真善忍', null);
INSERT INTO `sensitive_word` VALUES ('990', '真实文凭', null);
INSERT INTO `sensitive_word` VALUES ('991', '真实资格', null);
INSERT INTO `sensitive_word` VALUES ('992', '震惊一个民', null);
INSERT INTO `sensitive_word` VALUES ('993', '震其国土', null);
INSERT INTO `sensitive_word` VALUES ('994', '证到付款', null);
INSERT INTO `sensitive_word` VALUES ('995', '证件办', null);
INSERT INTO `sensitive_word` VALUES ('996', '证件集团', null);
INSERT INTO `sensitive_word` VALUES ('997', '证生成器', null);
INSERT INTO `sensitive_word` VALUES ('998', '证书办', null);
INSERT INTO `sensitive_word` VALUES ('999', '证一次性', null);
INSERT INTO `sensitive_word` VALUES ('1000', '政府操', null);
INSERT INTO `sensitive_word` VALUES ('1001', '政论区', null);
INSERT INTO `sensitive_word` VALUES ('1002', '證件', null);
INSERT INTO `sensitive_word` VALUES ('1003', '植物冰', null);
INSERT INTO `sensitive_word` VALUES ('1004', '殖器护', null);
INSERT INTO `sensitive_word` VALUES ('1005', '指纹考勤', null);
INSERT INTO `sensitive_word` VALUES ('1006', '指纹膜', null);
INSERT INTO `sensitive_word` VALUES ('1007', '指纹套', null);
INSERT INTO `sensitive_word` VALUES ('1008', '至国家高', null);
INSERT INTO `sensitive_word` VALUES ('1009', '志不愿跟', null);
INSERT INTO `sensitive_word` VALUES ('1010', '制服诱', null);
INSERT INTO `sensitive_word` VALUES ('1011', '制手枪', null);
INSERT INTO `sensitive_word` VALUES ('1012', '制证定金', null);
INSERT INTO `sensitive_word` VALUES ('1013', '制作证件', null);
INSERT INTO `sensitive_word` VALUES ('1014', '中的班禅', null);
INSERT INTO `sensitive_word` VALUES ('1015', '中共黑', null);
INSERT INTO `sensitive_word` VALUES ('1016', '种公务员', null);
INSERT INTO `sensitive_word` VALUES ('1017', '种学历证', null);
INSERT INTO `sensitive_word` VALUES ('1018', '众像羔', null);
INSERT INTO `sensitive_word` VALUES ('1019', '州惨案', null);
INSERT INTO `sensitive_word` VALUES ('1020', '州大批贪', null);
INSERT INTO `sensitive_word` VALUES ('1021', '州三箭', null);
INSERT INTO `sensitive_word` VALUES ('1022', '宙最高法', null);
INSERT INTO `sensitive_word` VALUES ('1023', '昼将近', null);
INSERT INTO `sensitive_word` VALUES ('1024', '主席忏', null);
INSERT INTO `sensitive_word` VALUES ('1025', '住英国房', null);
INSERT INTO `sensitive_word` VALUES ('1026', '助考', null);
INSERT INTO `sensitive_word` VALUES ('1027', '助考网', null);
INSERT INTO `sensitive_word` VALUES ('1028', '专业办理', null);
INSERT INTO `sensitive_word` VALUES ('1029', '专业代', null);
INSERT INTO `sensitive_word` VALUES ('1030', '专业代写', null);
INSERT INTO `sensitive_word` VALUES ('1031', '专业助', null);
INSERT INTO `sensitive_word` VALUES ('1032', '转是政府', null);
INSERT INTO `sensitive_word` VALUES ('1033', '赚钱资料', null);
INSERT INTO `sensitive_word` VALUES ('1034', '装弹甲', null);
INSERT INTO `sensitive_word` VALUES ('1035', '装枪套', null);
INSERT INTO `sensitive_word` VALUES ('1036', '装消音', null);
INSERT INTO `sensitive_word` VALUES ('1037', '着护士的胸', null);
INSERT INTO `sensitive_word` VALUES ('1038', '着涛哥', null);
INSERT INTO `sensitive_word` VALUES ('1039', '姿不对死', null);
INSERT INTO `sensitive_word` VALUES ('1040', '资格證', null);
INSERT INTO `sensitive_word` VALUES ('1041', '资料泄', null);
INSERT INTO `sensitive_word` VALUES ('1042', '梓健特药', null);
INSERT INTO `sensitive_word` VALUES ('1043', '字牌汽', null);
INSERT INTO `sensitive_word` VALUES ('1044', '自己找枪', null);
INSERT INTO `sensitive_word` VALUES ('1045', '自慰用', null);
INSERT INTO `sensitive_word` VALUES ('1046', '自由圣', null);
INSERT INTO `sensitive_word` VALUES ('1047', '自由亚', null);
INSERT INTO `sensitive_word` VALUES ('1048', '总会美女', null);
INSERT INTO `sensitive_word` VALUES ('1049', '足球玩法', null);
INSERT INTO `sensitive_word` VALUES ('1050', '最牛公安', null);
INSERT INTO `sensitive_word` VALUES ('1051', '醉钢枪', null);
INSERT INTO `sensitive_word` VALUES ('1052', '醉迷药', null);
INSERT INTO `sensitive_word` VALUES ('1053', '醉乙醚', null);
INSERT INTO `sensitive_word` VALUES ('1054', '尊爵粉', null);
INSERT INTO `sensitive_word` VALUES ('1055', '左转是政', null);
INSERT INTO `sensitive_word` VALUES ('1056', '作弊器', null);
INSERT INTO `sensitive_word` VALUES ('1057', '作各种证', null);
INSERT INTO `sensitive_word` VALUES ('1058', '作硝化甘', null);
INSERT INTO `sensitive_word` VALUES ('1059', '唑仑', null);
INSERT INTO `sensitive_word` VALUES ('1060', '做爱小', null);
INSERT INTO `sensitive_word` VALUES ('1061', '做原子弹', null);
INSERT INTO `sensitive_word` VALUES ('1062', '做证件', null);
INSERT INTO `sensitive_word` VALUES ('1063', '怀孕', null);
INSERT INTO `sensitive_word` VALUES ('1064', 'TMD', null);
INSERT INTO `sensitive_word` VALUES ('1065', '厅长', null);
INSERT INTO `sensitive_word` VALUES ('1067', '伊斯兰', null);
INSERT INTO `sensitive_word` VALUES ('1068', '公投', null);
INSERT INTO `sensitive_word` VALUES ('1069', 'TNT', null);
INSERT INTO `sensitive_word` VALUES ('1070', '藏人', null);
INSERT INTO `sensitive_word` VALUES ('1071', '穆斯林', null);
INSERT INTO `sensitive_word` VALUES ('1072', 'TAM', null);
INSERT INTO `sensitive_word` VALUES ('1073', '纪委', null);
INSERT INTO `sensitive_word` VALUES ('1074', '信访', null);
INSERT INTO `sensitive_word` VALUES ('1075', '周铁农', null);
INSERT INTO `sensitive_word` VALUES ('1076', '陈昌智', null);
INSERT INTO `sensitive_word` VALUES ('1077', '陈至立', null);
INSERT INTO `sensitive_word` VALUES ('1078', '王兆', null);
INSERT INTO `sensitive_word` VALUES ('1079', '刘少奇', null);
INSERT INTO `sensitive_word` VALUES ('1080', '习近平', null);
INSERT INTO `sensitive_word` VALUES ('1081', '建敏', null);
INSERT INTO `sensitive_word` VALUES ('1082', '贾庆林', null);
INSERT INTO `sensitive_word` VALUES ('1083', '树声', null);
INSERT INTO `sensitive_word` VALUES ('1084', '路甬祥', null);
INSERT INTO `sensitive_word` VALUES ('1085', '铁力瓦尔地', null);
INSERT INTO `sensitive_word` VALUES ('1086', '吴邦', null);
INSERT INTO `sensitive_word` VALUES ('1087', '乌云其木格', null);
INSERT INTO `sensitive_word` VALUES ('1088', '严隽琪', null);
INSERT INTO `sensitive_word` VALUES ('1089', '投公', null);
INSERT INTO `sensitive_word` VALUES ('1090', '台海', null);
INSERT INTO `sensitive_word` VALUES ('1091', '罢免', null);
INSERT INTO `sensitive_word` VALUES ('1092', '李鹏', null);
INSERT INTO `sensitive_word` VALUES ('1093', '韩启德', null);
INSERT INTO `sensitive_word` VALUES ('1094', '叶剑英', null);
INSERT INTO `sensitive_word` VALUES ('1095', '李先念', null);
INSERT INTO `sensitive_word` VALUES ('1096', '张春贤', null);
INSERT INTO `sensitive_word` VALUES ('1097', '张德江', null);
INSERT INTO `sensitive_word` VALUES ('1098', '张庆伟', null);
INSERT INTO `sensitive_word` VALUES ('1099', '张维庆', null);
INSERT INTO `sensitive_word` VALUES ('1100', '张云川', null);
INSERT INTO `sensitive_word` VALUES ('1101', '回良玉', null);
INSERT INTO `sensitive_word` VALUES ('1102', '回族', null);
INSERT INTO `sensitive_word` VALUES ('1103', '杜青林', null);
INSERT INTO `sensitive_word` VALUES ('1104', '曾培炎', null);
INSERT INTO `sensitive_word` VALUES ('1105', '杨洁篪', null);
INSERT INTO `sensitive_word` VALUES ('1106', '周小川', null);
INSERT INTO `sensitive_word` VALUES ('1107', '周生贤', null);
INSERT INTO `sensitive_word` VALUES ('1108', '周永康', null);
INSERT INTO `sensitive_word` VALUES ('1109', '抢劫', null);
INSERT INTO `sensitive_word` VALUES ('1110', '李金华', null);
INSERT INTO `sensitive_word` VALUES ('1111', '李克强', null);
INSERT INTO `sensitive_word` VALUES ('1112', '李岚清', null);
INSERT INTO `sensitive_word` VALUES ('1113', '李盛霖', null);
INSERT INTO `sensitive_word` VALUES ('1114', '李铁映', null);
INSERT INTO `sensitive_word` VALUES ('1115', '李学举', null);
INSERT INTO `sensitive_word` VALUES ('1116', '陈德铭', null);
INSERT INTO `sensitive_word` VALUES ('1117', '陈竺', null);
INSERT INTO `sensitive_word` VALUES ('1118', '尹蔚民', null);
INSERT INTO `sensitive_word` VALUES ('1119', '王岐山', null);
INSERT INTO `sensitive_word` VALUES ('1120', '王学军', null);
INSERT INTO `sensitive_word` VALUES ('1121', '薄熙来', null);
INSERT INTO `sensitive_word` VALUES ('1122', '薄一波', null);
INSERT INTO `sensitive_word` VALUES ('1123', '黄菊', null);
INSERT INTO `sensitive_word` VALUES ('1124', '金人庆', null);
INSERT INTO `sensitive_word` VALUES ('1125', '朱镕基', null);
INSERT INTO `sensitive_word` VALUES ('1126', '刘家义', null);
INSERT INTO `sensitive_word` VALUES ('1127', '刘延东', null);
INSERT INTO `sensitive_word` VALUES ('1128', '华建敏', null);
INSERT INTO `sensitive_word` VALUES ('1129', '蔡武', null);
INSERT INTO `sensitive_word` VALUES ('1130', '曹刚川', null);
INSERT INTO `sensitive_word` VALUES ('1131', '戴秉', null);
INSERT INTO `sensitive_word` VALUES ('1132', '耿惠昌', null);
INSERT INTO `sensitive_word` VALUES ('1133', '韩长赋', null);
INSERT INTO `sensitive_word` VALUES ('1134', '姜伟新', null);
INSERT INTO `sensitive_word` VALUES ('1135', '梁光烈', null);
INSERT INTO `sensitive_word` VALUES ('1136', '马馼', null);
INSERT INTO `sensitive_word` VALUES ('1137', '孟建柱', null);
INSERT INTO `sensitive_word` VALUES ('1138', '孙家正', null);
INSERT INTO `sensitive_word` VALUES ('1139', '孙政才', null);
INSERT INTO `sensitive_word` VALUES ('1140', '田成平', null);
INSERT INTO `sensitive_word` VALUES ('1141', '汪光焘', null);
INSERT INTO `sensitive_word` VALUES ('1142', '吴爱英', null);
INSERT INTO `sensitive_word` VALUES ('1143', '吴仪', null);
INSERT INTO `sensitive_word` VALUES ('1144', '谢旭人', null);
INSERT INTO `sensitive_word` VALUES ('1145', '徐绍史', null);
INSERT INTO `sensitive_word` VALUES ('1146', '吾尔', null);
INSERT INTO `sensitive_word` VALUES ('1147', '马凯', null);
INSERT INTO `sensitive_word` VALUES ('1148', '周济', null);
INSERT INTO `sensitive_word` VALUES ('1149', '教育部', null);
INSERT INTO `sensitive_word` VALUES ('1150', '陈雷', null);
INSERT INTO `sensitive_word` VALUES ('1151', '李毅中', null);
INSERT INTO `sensitive_word` VALUES ('1152', '水利部', null);
INSERT INTO `sensitive_word` VALUES ('1153', '万钢', null);
INSERT INTO `sensitive_word` VALUES ('1154', '罗干', null);
INSERT INTO `sensitive_word` VALUES ('1156', '李斌', null);
INSERT INTO `sensitive_word` VALUES ('1157', '张海阳', null);
INSERT INTO `sensitive_word` VALUES ('1158', '陈炳德', null);
INSERT INTO `sensitive_word` VALUES ('1159', '邓昌友', null);
INSERT INTO `sensitive_word` VALUES ('1160', '常万全', null);
INSERT INTO `sensitive_word` VALUES ('1161', '范长龙', null);
INSERT INTO `sensitive_word` VALUES ('1162', '郭伯雄', null);
INSERT INTO `sensitive_word` VALUES ('1163', '靖志远', null);
INSERT INTO `sensitive_word` VALUES ('1164', '廖锡龙', null);
INSERT INTO `sensitive_word` VALUES ('1165', '彭小枫', null);
INSERT INTO `sensitive_word` VALUES ('1166', '吴胜利', null);
INSERT INTO `sensitive_word` VALUES ('1167', '徐才厚', null);
INSERT INTO `sensitive_word` VALUES ('1168', '许其亮', null);
INSERT INTO `sensitive_word` VALUES ('1169', '张高丽', null);
INSERT INTO `sensitive_word` VALUES ('1170', '俞正声', null);
INSERT INTO `sensitive_word` VALUES ('1171', '刘淇', null);
INSERT INTO `sensitive_word` VALUES ('1172', '王胜俊', null);
INSERT INTO `sensitive_word` VALUES ('1173', '李源潮', null);
INSERT INTO `sensitive_word` VALUES ('1174', '王乐泉', null);
INSERT INTO `sensitive_word` VALUES ('1175', '四人帮', null);
INSERT INTO `sensitive_word` VALUES ('1176', '刘云山', null);
INSERT INTO `sensitive_word` VALUES ('1177', '耀邦', null);
INSERT INTO `sensitive_word` VALUES ('1178', '汪东兴', null);
INSERT INTO `sensitive_word` VALUES ('1179', '维权', null);
INSERT INTO `sensitive_word` VALUES ('1181', '张宝顺', null);
INSERT INTO `sensitive_word` VALUES ('1182', '陈良宇', null);
INSERT INTO `sensitive_word` VALUES ('1183', '刘奇葆', null);
INSERT INTO `sensitive_word` VALUES ('1184', '白恩培', null);
INSERT INTO `sensitive_word` VALUES ('1185', '郭声琨', null);
INSERT INTO `sensitive_word` VALUES ('1186', '秦光荣', null);
INSERT INTO `sensitive_word` VALUES ('1187', '黄丽满', null);
INSERT INTO `sensitive_word` VALUES ('1188', '白景富', null);
INSERT INTO `sensitive_word` VALUES ('1189', '列确', null);
INSERT INTO `sensitive_word` VALUES ('1190', '厉无畏', null);
INSERT INTO `sensitive_word` VALUES ('1191', '王光亚', null);
INSERT INTO `sensitive_word` VALUES ('1192', '冷溶', null);
INSERT INTO `sensitive_word` VALUES ('1193', '林文漪', null);
INSERT INTO `sensitive_word` VALUES ('1194', '高智晟', null);
INSERT INTO `sensitive_word` VALUES ('1195', '谭作人', null);
INSERT INTO `sensitive_word` VALUES ('1196', '泛蓝', null);
INSERT INTO `sensitive_word` VALUES ('1197', '泛绿', null);
INSERT INTO `sensitive_word` VALUES ('1198', '阿旺晋美', null);
INSERT INTO `sensitive_word` VALUES ('1199', '粟戎生', null);
INSERT INTO `sensitive_word` VALUES ('1200', '刘云耕', null);
INSERT INTO `sensitive_word` VALUES ('1201', '曹建明', null);
INSERT INTO `sensitive_word` VALUES ('1202', '维汉', null);
INSERT INTO `sensitive_word` VALUES ('1203', '张志新', null);
INSERT INTO `sensitive_word` VALUES ('1205', 'zedong', null);
INSERT INTO `sensitive_word` VALUES ('1206', 'zedоng', null);
INSERT INTO `sensitive_word` VALUES ('1207', '南街村', null);
INSERT INTO `sensitive_word` VALUES ('1208', '辛灏年', null);
INSERT INTO `sensitive_word` VALUES ('1209', '江清', null);
INSERT INTO `sensitive_word` VALUES ('1210', '子宫', null);
INSERT INTO `sensitive_word` VALUES ('1211', '利比亚', null);
INSERT INTO `sensitive_word` VALUES ('1212', '何清涟', null);
INSERT INTO `sensitive_word` VALUES ('1213', 'Tank', null);
INSERT INTO `sensitive_word` VALUES ('1214', '民反', null);
INSERT INTO `sensitive_word` VALUES ('1215', '干你', null);
INSERT INTO `sensitive_word` VALUES ('1216', '干他', null);
INSERT INTO `sensitive_word` VALUES ('1217', '干她', null);
INSERT INTO `sensitive_word` VALUES ('1218', '开苞', null);
INSERT INTO `sensitive_word` VALUES ('1219', '狂干', null);
INSERT INTO `sensitive_word` VALUES ('1220', '露点', null);
INSERT INTO `sensitive_word` VALUES ('1221', '压倒一切', null);
INSERT INTO `sensitive_word` VALUES ('1222', '大麻', null);
INSERT INTO `sensitive_word` VALUES ('1223', '回派', null);
INSERT INTO `sensitive_word` VALUES ('1224', '天灭中', null);
INSERT INTO `sensitive_word` VALUES ('1225', '屄', null);
INSERT INTO `sensitive_word` VALUES ('1226', '管制', null);
INSERT INTO `sensitive_word` VALUES ('1227', '幼女', null);
INSERT INTO `sensitive_word` VALUES ('1228', '集会', null);
INSERT INTO `sensitive_word` VALUES ('1229', '考题', null);
INSERT INTO `sensitive_word` VALUES ('1230', '群P', null);
INSERT INTO `sensitive_word` VALUES ('1231', '群干', null);
INSERT INTO `sensitive_word` VALUES ('1232', '群交', null);
INSERT INTO `sensitive_word` VALUES ('1233', '裤袜', null);
INSERT INTO `sensitive_word` VALUES ('1234', '食精', null);
INSERT INTO `sensitive_word` VALUES ('1235', '偷欢', null);
INSERT INTO `sensitive_word` VALUES ('1236', '援交', null);
INSERT INTO `sensitive_word` VALUES ('1237', '出台', null);
INSERT INTO `sensitive_word` VALUES ('1238', '走形式', null);
INSERT INTO `sensitive_word` VALUES ('1239', '三峡', null);
INSERT INTO `sensitive_word` VALUES ('1240', '博彩', null);
INSERT INTO `sensitive_word` VALUES ('1241', '销售', null);
INSERT INTO `sensitive_word` VALUES ('1242', '抵押贷款', null);
INSERT INTO `sensitive_word` VALUES ('1243', '资金短缺', null);
INSERT INTO `sensitive_word` VALUES ('1244', '落马', null);
INSERT INTO `sensitive_word` VALUES ('1245', '我朝', null);
INSERT INTO `sensitive_word` VALUES ('1246', '监管', null);
INSERT INTO `sensitive_word` VALUES ('1247', '残害', null);
INSERT INTO `sensitive_word` VALUES ('1248', '支那', null);
INSERT INTO `sensitive_word` VALUES ('1249', '林彪', null);
INSERT INTO `sensitive_word` VALUES ('1250', '押送', null);
INSERT INTO `sensitive_word` VALUES ('1251', '特务', null);
INSERT INTO `sensitive_word` VALUES ('1252', 'GCD', null);
INSERT INTO `sensitive_word` VALUES ('1253', '揭露', null);
INSERT INTO `sensitive_word` VALUES ('1254', '揭穿', null);
INSERT INTO `sensitive_word` VALUES ('1255', '穆罕默德', null);
INSERT INTO `sensitive_word` VALUES ('1256', '吹箫', null);
INSERT INTO `sensitive_word` VALUES ('1257', '慎入', null);
INSERT INTO `sensitive_word` VALUES ('1258', '勿进', null);
INSERT INTO `sensitive_word` VALUES ('1259', '肉欲', null);
INSERT INTO `sensitive_word` VALUES ('1260', '自慰', null);
INSERT INTO `sensitive_word` VALUES ('1261', '罢课', null);
INSERT INTO `sensitive_word` VALUES ('1262', '罢教', null);
INSERT INTO `sensitive_word` VALUES ('1263', '燃烧弹', null);
INSERT INTO `sensitive_word` VALUES ('1264', '雷管', null);
INSERT INTO `sensitive_word` VALUES ('1265', '回民', null);
INSERT INTO `sensitive_word` VALUES ('1266', '自治', null);
INSERT INTO `sensitive_word` VALUES ('1267', '海洛因', null);
INSERT INTO `sensitive_word` VALUES ('1268', '白粉', null);
INSERT INTO `sensitive_word` VALUES ('1269', '发生关系', null);
INSERT INTO `sensitive_word` VALUES ('1270', '发情', null);
INSERT INTO `sensitive_word` VALUES ('1271', '发春', null);
INSERT INTO `sensitive_word` VALUES ('1272', '红满堂', null);
INSERT INTO `sensitive_word` VALUES ('1273', '三硝基甲苯', null);
INSERT INTO `sensitive_word` VALUES ('1274', '调教', null);
INSERT INTO `sensitive_word` VALUES ('1275', '人兽', null);
INSERT INTO `sensitive_word` VALUES ('1276', '煞笔', null);
INSERT INTO `sensitive_word` VALUES ('1277', '解码器', null);
INSERT INTO `sensitive_word` VALUES ('1278', '考中', null);
INSERT INTO `sensitive_word` VALUES ('1279', '绝食', null);
INSERT INTO `sensitive_word` VALUES ('1280', '受害者', null);
INSERT INTO `sensitive_word` VALUES ('1281', '受害人', null);
INSERT INTO `sensitive_word` VALUES ('1282', '下注', null);
INSERT INTO `sensitive_word` VALUES ('1283', '援藏', null);
INSERT INTO `sensitive_word` VALUES ('1284', '欲火', null);
INSERT INTO `sensitive_word` VALUES ('1285', '真主', null);
INSERT INTO `sensitive_word` VALUES ('1286', '藏民', null);
INSERT INTO `sensitive_word` VALUES ('1287', '行贿', null);
INSERT INTO `sensitive_word` VALUES ('1288', '受贿', null);
INSERT INTO `sensitive_word` VALUES ('1289', '贿赂', null);
INSERT INTO `sensitive_word` VALUES ('1290', '原子弹', null);
INSERT INTO `sensitive_word` VALUES ('1291', '第一夫人', null);
INSERT INTO `sensitive_word` VALUES ('1292', '英灵', null);
INSERT INTO `sensitive_word` VALUES ('1293', '王君', null);
INSERT INTO `sensitive_word` VALUES ('1294', '林明月', null);
INSERT INTO `sensitive_word` VALUES ('1295', '武侯祠', null);
INSERT INTO `sensitive_word` VALUES ('1296', '乱交', null);
INSERT INTO `sensitive_word` VALUES ('1297', '老共', null);
INSERT INTO `sensitive_word` VALUES ('1298', '发浪', null);
INSERT INTO `sensitive_word` VALUES ('1299', '西独', null);
INSERT INTO `sensitive_word` VALUES ('1300', '买春', null);
INSERT INTO `sensitive_word` VALUES ('1301', '卖身', null);
INSERT INTO `sensitive_word` VALUES ('1302', '温如春', null);
INSERT INTO `sensitive_word` VALUES ('1303', '阴精', null);
INSERT INTO `sensitive_word` VALUES ('1304', '藏西', null);
INSERT INTO `sensitive_word` VALUES ('1305', '里鹏', null);
INSERT INTO `sensitive_word` VALUES ('1306', '张筱雨', null);
INSERT INTO `sensitive_word` VALUES ('1307', '地塞米松', null);
INSERT INTO `sensitive_word` VALUES ('1308', 'baozha', null);
INSERT INTO `sensitive_word` VALUES ('1309', '王千源', null);
INSERT INTO `sensitive_word` VALUES ('1310', 'G片', null);
INSERT INTO `sensitive_word` VALUES ('1311', 'jieyan', null);
INSERT INTO `sensitive_word` VALUES ('1312', 'zemin', null);
INSERT INTO `sensitive_word` VALUES ('1313', 'ze民', null);
INSERT INTO `sensitive_word` VALUES ('1314', '刘维明', null);
INSERT INTO `sensitive_word` VALUES ('1315', '段义和', null);
INSERT INTO `sensitive_word` VALUES ('1316', '令计划', null);
INSERT INTO `sensitive_word` VALUES ('1317', '苏树林', null);
INSERT INTO `sensitive_word` VALUES ('1318', '罢吃', null);
INSERT INTO `sensitive_word` VALUES ('1319', '反奥', null);
INSERT INTO `sensitive_word` VALUES ('1320', '东方微点', null);
INSERT INTO `sensitive_word` VALUES ('1321', '少年阿宾', null);
INSERT INTO `sensitive_word` VALUES ('1322', '援助交际', null);
INSERT INTO `sensitive_word` VALUES ('1323', '应召', null);
INSERT INTO `sensitive_word` VALUES ('1324', '亚情', null);
INSERT INTO `sensitive_word` VALUES ('1325', '小电影', null);
INSERT INTO `sensitive_word` VALUES ('1326', '欲女', null);
INSERT INTO `sensitive_word` VALUES ('1327', '马勒', null);
INSERT INTO `sensitive_word` VALUES ('1328', '网特', null);
INSERT INTO `sensitive_word` VALUES ('1329', '网监', null);
INSERT INTO `sensitive_word` VALUES ('1330', '双飞', null);
INSERT INTO `sensitive_word` VALUES ('1331', 'jintao', null);
INSERT INTO `sensitive_word` VALUES ('1332', 'jingtao', null);
INSERT INTO `sensitive_word` VALUES ('1333', 'jiabao', null);
INSERT INTO `sensitive_word` VALUES ('1334', '拳交', null);
INSERT INTO `sensitive_word` VALUES ('1335', '脚交', null);
INSERT INTO `sensitive_word` VALUES ('1336', '夏川纯', null);
INSERT INTO `sensitive_word` VALUES ('1337', '穆罕穆德', null);
INSERT INTO `sensitive_word` VALUES ('1338', '菊鲍', null);
INSERT INTO `sensitive_word` VALUES ('1339', '胡海峰', null);
INSERT INTO `sensitive_word` VALUES ('1340', '胡海清', null);
INSERT INTO `sensitive_word` VALUES ('1341', '郭金龙', null);
INSERT INTO `sensitive_word` VALUES ('1342', '李春城', null);
INSERT INTO `sensitive_word` VALUES ('1343', '韩正', null);
INSERT INTO `sensitive_word` VALUES ('1344', '杨利民', null);
INSERT INTO `sensitive_word` VALUES ('1345', '王正伟', null);
INSERT INTO `sensitive_word` VALUES ('1346', '刘石泉', null);
INSERT INTO `sensitive_word` VALUES ('1347', '尚福林', null);
INSERT INTO `sensitive_word` VALUES ('1348', '张荣坤', null);
INSERT INTO `sensitive_word` VALUES ('1349', '赵永生', null);
INSERT INTO `sensitive_word` VALUES ('1350', '何祚庥', null);
INSERT INTO `sensitive_word` VALUES ('1351', '何厚铧', null);
INSERT INTO `sensitive_word` VALUES ('1352', '陈奎元', null);
INSERT INTO `sensitive_word` VALUES ('1353', '黄孟复', null);
INSERT INTO `sensitive_word` VALUES ('1354', '白春礼', null);
INSERT INTO `sensitive_word` VALUES ('1355', '白立忱', null);
INSERT INTO `sensitive_word` VALUES ('1356', '储波', null);
INSERT INTO `sensitive_word` VALUES ('1357', '卫留成', null);
INSERT INTO `sensitive_word` VALUES ('1358', '李成玉', null);
INSERT INTO `sensitive_word` VALUES ('1359', '李景田', null);
INSERT INTO `sensitive_word` VALUES ('1360', '李荣融', null);
INSERT INTO `sensitive_word` VALUES ('1361', '李兆焯', null);
INSERT INTO `sensitive_word` VALUES ('1362', '刘明康', null);
INSERT INTO `sensitive_word` VALUES ('1363', '孔丹', null);
INSERT INTO `sensitive_word` VALUES ('1364', '泽慧', null);
INSERT INTO `sensitive_word` VALUES ('1365', '梁保华', null);
INSERT INTO `sensitive_word` VALUES ('1366', '卢展工', null);
INSERT INTO `sensitive_word` VALUES ('1367', '罗清泉', null);
INSERT INTO `sensitive_word` VALUES ('1368', '吕祖善', null);
INSERT INTO `sensitive_word` VALUES ('1369', '马万祺', null);
INSERT INTO `sensitive_word` VALUES ('1370', '钱运录', null);
INSERT INTO `sensitive_word` VALUES ('1371', '石宗源', null);
INSERT INTO `sensitive_word` VALUES ('1372', '彭丽媛', null);
INSERT INTO `sensitive_word` VALUES ('1373', '张丹红', null);
INSERT INTO `sensitive_word` VALUES ('1374', '张惠新', null);
INSERT INTO `sensitive_word` VALUES ('1375', '张立昌', null);
INSERT INTO `sensitive_word` VALUES ('1376', '张文岳', null);
INSERT INTO `sensitive_word` VALUES ('1377', '赵乐际', null);
INSERT INTO `sensitive_word` VALUES ('1378', '杨传堂', null);
INSERT INTO `sensitive_word` VALUES ('1379', '王鸿举', null);
INSERT INTO `sensitive_word` VALUES ('1380', '王家瑞', null);
INSERT INTO `sensitive_word` VALUES ('1381', '王金山', null);
INSERT INTO `sensitive_word` VALUES ('1382', '王志珍', null);
INSERT INTO `sensitive_word` VALUES ('1383', '汤加丽', null);
INSERT INTO `sensitive_word` VALUES ('1384', '平习', null);
INSERT INTO `sensitive_word` VALUES ('1385', '铁凝', null);
INSERT INTO `sensitive_word` VALUES ('1386', '韦建桦', null);
INSERT INTO `sensitive_word` VALUES ('1387', '魏礼群', null);
INSERT INTO `sensitive_word` VALUES ('1388', '上京', null);
INSERT INTO `sensitive_word` VALUES ('1389', '魏京生', null);
INSERT INTO `sensitive_word` VALUES ('1390', '吴定富', null);
INSERT INTO `sensitive_word` VALUES ('1391', '向巴平措', null);
INSERT INTO `sensitive_word` VALUES ('1392', '徐光春', null);
INSERT INTO `sensitive_word` VALUES ('1393', '叶小文', null);
INSERT INTO `sensitive_word` VALUES ('1394', '由喜贵', null);
INSERT INTO `sensitive_word` VALUES ('1395', '陈建民', null);
INSERT INTO `sensitive_word` VALUES ('1396', '王沪宁', null);
INSERT INTO `sensitive_word` VALUES ('1397', '王自强', null);
INSERT INTO `sensitive_word` VALUES ('1398', '王维林', null);
INSERT INTO `sensitive_word` VALUES ('1399', '刘宾雁', null);
INSERT INTO `sensitive_word` VALUES ('1400', '邓力群', null);
INSERT INTO `sensitive_word` VALUES ('1401', '宋祖英', null);
INSERT INTO `sensitive_word` VALUES ('1402', '董文华', null);
INSERT INTO `sensitive_word` VALUES ('1403', '陶斯亮', null);
INSERT INTO `sensitive_word` VALUES ('1404', '严家其', null);
INSERT INTO `sensitive_word` VALUES ('1405', '郑万通', null);
INSERT INTO `sensitive_word` VALUES ('1406', '荣智健', null);
INSERT INTO `sensitive_word` VALUES ('1407', '黑鲍', null);
INSERT INTO `sensitive_word` VALUES ('1408', '安眠酮', null);
INSERT INTO `sensitive_word` VALUES ('1409', '普萘洛尔', null);
INSERT INTO `sensitive_word` VALUES ('1410', '呋塞米', null);
INSERT INTO `sensitive_word` VALUES ('1411', '西布曲明', null);
INSERT INTO `sensitive_word` VALUES ('1412', '地西泮', null);
INSERT INTO `sensitive_word` VALUES ('1413', '地奈德', null);
INSERT INTO `sensitive_word` VALUES ('1414', '尼可刹米', null);
INSERT INTO `sensitive_word` VALUES ('1415', '甲睾酮', null);
INSERT INTO `sensitive_word` VALUES ('1416', '氯噻嗪', null);
INSERT INTO `sensitive_word` VALUES ('1417', '苯巴比妥', null);
INSERT INTO `sensitive_word` VALUES ('1418', '苯丙胺', null);
INSERT INTO `sensitive_word` VALUES ('1419', '戊四氮', null);
INSERT INTO `sensitive_word` VALUES ('1420', '泼尼松', null);
INSERT INTO `sensitive_word` VALUES ('1421', '美沙酮', null);
INSERT INTO `sensitive_word` VALUES ('1422', '莫达非尼', null);
INSERT INTO `sensitive_word` VALUES ('1423', '甲基安非他明', null);
INSERT INTO `sensitive_word` VALUES ('1424', '沙比', null);
INSERT INTO `sensitive_word` VALUES ('1425', '装B', null);
INSERT INTO `sensitive_word` VALUES ('1426', '促红细胞生成素', null);
INSERT INTO `sensitive_word` VALUES ('1427', '羟基丁酸', null);
INSERT INTO `sensitive_word` VALUES ('1428', 'Party', null);
INSERT INTO `sensitive_word` VALUES ('1429', '麻醉', null);
INSERT INTO `sensitive_word` VALUES ('1430', '胰岛素样生长因子', null);
INSERT INTO `sensitive_word` VALUES ('1431', '杜世成', null);
INSERT INTO `sensitive_word` VALUES ('1432', '湾台', null);
INSERT INTO `sensitive_word` VALUES ('1433', '殡仪馆', null);
INSERT INTO `sensitive_word` VALUES ('1434', '销赃', null);
INSERT INTO `sensitive_word` VALUES ('1435', '关押', null);
INSERT INTO `sensitive_word` VALUES ('1436', '维持稳定', null);
INSERT INTO `sensitive_word` VALUES ('1437', '吴关正', null);
INSERT INTO `sensitive_word` VALUES ('1438', '曾庆红', null);
INSERT INTO `sensitive_word` VALUES ('1439', '李长春', null);
INSERT INTO `sensitive_word` VALUES ('1440', '萨达姆', null);
INSERT INTO `sensitive_word` VALUES ('1441', '拉登', null);
INSERT INTO `sensitive_word` VALUES ('1442', '李瑞环', null);
INSERT INTO `sensitive_word` VALUES ('1443', '沈跃跃', null);
INSERT INTO `sensitive_word` VALUES ('1444', '则民', null);
INSERT INTO `sensitive_word` VALUES ('1445', '则东', null);
INSERT INTO `sensitive_word` VALUES ('1446', '宋平顺', null);
INSERT INTO `sensitive_word` VALUES ('1447', '刘永治', null);
INSERT INTO `sensitive_word` VALUES ('1448', 'yangjia', null);
INSERT INTO `sensitive_word` VALUES ('1449', '反共', null);
INSERT INTO `sensitive_word` VALUES ('1450', '正府', null);
INSERT INTO `sensitive_word` VALUES ('1451', '贺卫方', null);
INSERT INTO `sensitive_word` VALUES ('1452', '冯正虎', null);
INSERT INTO `sensitive_word` VALUES ('1453', '陈光诚', null);
INSERT INTO `sensitive_word` VALUES ('1454', '吸精', null);
INSERT INTO `sensitive_word` VALUES ('1455', '阴B', null);
INSERT INTO `sensitive_word` VALUES ('1456', '阴dao', null);
INSERT INTO `sensitive_word` VALUES ('1457', '阴jin', null);
INSERT INTO `sensitive_word` VALUES ('1458', 'yindao', null);
INSERT INTO `sensitive_word` VALUES ('1459', 'yinjin', null);
INSERT INTO `sensitive_word` VALUES ('1460', 'jing坐', null);
INSERT INTO `sensitive_word` VALUES ('1461', '达赖', null);
INSERT INTO `sensitive_word` VALUES ('1462', '高丽棒子', null);
INSERT INTO `sensitive_word` VALUES ('1463', '孙子', null);
INSERT INTO `sensitive_word` VALUES ('1464', '三陪', null);
INSERT INTO `sensitive_word` VALUES ('1465', '放屁', null);
INSERT INTO `sensitive_word` VALUES ('1466', '放P', null);
INSERT INTO `sensitive_word` VALUES ('1467', '杂种', null);
INSERT INTO `sensitive_word` VALUES ('1468', '巴子', null);
INSERT INTO `sensitive_word` VALUES ('1469', '鬼子', null);
INSERT INTO `sensitive_word` VALUES ('1470', '小鬼', null);
INSERT INTO `sensitive_word` VALUES ('1471', '印泥巴', null);
INSERT INTO `sensitive_word` VALUES ('1472', '大便', null);
INSERT INTO `sensitive_word` VALUES ('1473', '老二', null);
INSERT INTO `sensitive_word` VALUES ('1474', '赵连海', null);
INSERT INTO `sensitive_word` VALUES ('1475', 'COMMUNIST', null);
INSERT INTO `sensitive_word` VALUES ('1476', 'CоMMUNIST', null);
INSERT INTO `sensitive_word` VALUES ('1477', '方滨兴', null);
INSERT INTO `sensitive_word` VALUES ('1478', '黄丝带', null);
INSERT INTO `sensitive_word` VALUES ('1479', '愤青', null);
INSERT INTO `sensitive_word` VALUES ('1480', '粪青', null);
INSERT INTO `sensitive_word` VALUES ('1481', '槽尼玛', null);
INSERT INTO `sensitive_word` VALUES ('1482', '西门子', null);
INSERT INTO `sensitive_word` VALUES ('1483', '睾丸', null);
INSERT INTO `sensitive_word` VALUES ('1484', '肉茎', null);
INSERT INTO `sensitive_word` VALUES ('1485', '泽D', null);
INSERT INTO `sensitive_word` VALUES ('1486', '泽M', null);
INSERT INTO `sensitive_word` VALUES ('1487', '杨J', null);
INSERT INTO `sensitive_word` VALUES ('1488', '张志伟', null);
INSERT INTO `sensitive_word` VALUES ('1489', '士的宁', null);
INSERT INTO `sensitive_word` VALUES ('1490', '麻痹的', null);
INSERT INTO `sensitive_word` VALUES ('1491', '阴阜', null);
INSERT INTO `sensitive_word` VALUES ('1492', '阴囊', null);
INSERT INTO `sensitive_word` VALUES ('1493', '赌球', null);
INSERT INTO `sensitive_word` VALUES ('1494', '质押贷款', null);
INSERT INTO `sensitive_word` VALUES ('1495', 'di制', null);
INSERT INTO `sensitive_word` VALUES ('1496', '赤匪', null);
INSERT INTO `sensitive_word` VALUES ('1497', '火乍', null);
INSERT INTO `sensitive_word` VALUES ('1498', '幼男', null);
INSERT INTO `sensitive_word` VALUES ('1499', '陈水B', null);
INSERT INTO `sensitive_word` VALUES ('1500', 'G匪', null);
INSERT INTO `sensitive_word` VALUES ('1501', 'Fuck', null);
INSERT INTO `sensitive_word` VALUES ('1502', '抽搐', null);
INSERT INTO `sensitive_word` VALUES ('1503', '吸允', null);
INSERT INTO `sensitive_word` VALUES ('1504', '交换夫妻', null);
INSERT INTO `sensitive_word` VALUES ('1505', '肉缝', null);
INSERT INTO `sensitive_word` VALUES ('1506', '销魂', null);
INSERT INTO `sensitive_word` VALUES ('1507', '白虎', null);
INSERT INTO `sensitive_word` VALUES ('1508', '推油', null);
INSERT INTO `sensitive_word` VALUES ('1509', '套弄', null);
INSERT INTO `sensitive_word` VALUES ('1510', '浪叫', null);
INSERT INTO `sensitive_word` VALUES ('1511', '屁眼', null);
INSERT INTO `sensitive_word` VALUES ('1512', '阴缔', null);
INSERT INTO `sensitive_word` VALUES ('1513', '阴核', null);
INSERT INTO `sensitive_word` VALUES ('1514', '小JJ', null);
INSERT INTO `sensitive_word` VALUES ('1515', '大JJ', null);
INSERT INTO `sensitive_word` VALUES ('1516', '干我', null);
INSERT INTO `sensitive_word` VALUES ('1517', '干它', null);
INSERT INTO `sensitive_word` VALUES ('1518', '含住', null);
INSERT INTO `sensitive_word` VALUES ('1519', '蓓蕾', null);
INSERT INTO `sensitive_word` VALUES ('1520', '花呸', null);
INSERT INTO `sensitive_word` VALUES ('1521', '花蓓', null);
INSERT INTO `sensitive_word` VALUES ('1522', '花芯', null);
INSERT INTO `sensitive_word` VALUES ('1523', '杜德印', null);
INSERT INTO `sensitive_word` VALUES ('1524', '刘胜玉', null);
INSERT INTO `sensitive_word` VALUES ('1525', '戴相龙', null);
INSERT INTO `sensitive_word` VALUES ('1526', '白克明', null);
INSERT INTO `sensitive_word` VALUES ('1527', '郭庚茂', null);
INSERT INTO `sensitive_word` VALUES ('1528', '赵金铎', null);
INSERT INTO `sensitive_word` VALUES ('1529', '孟学农', null);
INSERT INTO `sensitive_word` VALUES ('1530', '陈光林', null);
INSERT INTO `sensitive_word` VALUES ('1531', '郭廷标', null);
INSERT INTO `sensitive_word` VALUES ('1532', '王珉', null);
INSERT INTO `sensitive_word` VALUES ('1533', '王云坤', null);
INSERT INTO `sensitive_word` VALUES ('1534', '张左己', null);
INSERT INTO `sensitive_word` VALUES ('1535', '王巨禄', null);
INSERT INTO `sensitive_word` VALUES ('1536', '龚学平', null);
INSERT INTO `sensitive_word` VALUES ('1537', '许仲林', null);
INSERT INTO `sensitive_word` VALUES ('1538', '赵洪祝', null);
INSERT INTO `sensitive_word` VALUES ('1539', '杨多良', null);
INSERT INTO `sensitive_word` VALUES ('1540', '黄小晶', null);
INSERT INTO `sensitive_word` VALUES ('1541', '梁绮萍', null);
INSERT INTO `sensitive_word` VALUES ('1542', '吴新雄', null);
INSERT INTO `sensitive_word` VALUES ('1543', '傅克诚', null);
INSERT INTO `sensitive_word` VALUES ('1544', '姜大明', null);
INSERT INTO `sensitive_word` VALUES ('1545', '孙淑义', null);
INSERT INTO `sensitive_word` VALUES ('1546', '王全书', null);
INSERT INTO `sensitive_word` VALUES ('1547', '杨永良', null);
INSERT INTO `sensitive_word` VALUES ('1548', '王生铁', null);
INSERT INTO `sensitive_word` VALUES ('1549', '周强', null);
INSERT INTO `sensitive_word` VALUES ('1550', '陈绍基', null);
INSERT INTO `sensitive_word` VALUES ('1551', '马庆生', null);
INSERT INTO `sensitive_word` VALUES ('1552', '罗保铭', null);
INSERT INTO `sensitive_word` VALUES ('1553', '钟文', null);
INSERT INTO `sensitive_word` VALUES ('1554', '汪洋', null);
INSERT INTO `sensitive_word` VALUES ('1555', '刘志忠', null);
INSERT INTO `sensitive_word` VALUES ('1556', '林杜', null);
INSERT INTO `sensitive_word` VALUES ('1557', '秦玉琴', null);
INSERT INTO `sensitive_word` VALUES ('1558', '林树森', null);
INSERT INTO `sensitive_word` VALUES ('1559', '黄瑶', null);
INSERT INTO `sensitive_word` VALUES ('1560', '王学仁', null);
INSERT INTO `sensitive_word` VALUES ('1561', '张庆黎', null);
INSERT INTO `sensitive_word` VALUES ('1562', '帕巴拉', null);
INSERT INTO `sensitive_word` VALUES ('1563', '崔林涛', null);
INSERT INTO `sensitive_word` VALUES ('1564', '袁纯清', null);
INSERT INTO `sensitive_word` VALUES ('1565', '艾丕善', null);
INSERT INTO `sensitive_word` VALUES ('1566', '陆浩', null);
INSERT INTO `sensitive_word` VALUES ('1567', '徐守盛', null);
INSERT INTO `sensitive_word` VALUES ('1568', '仲兆隆', null);
INSERT INTO `sensitive_word` VALUES ('1569', '宋秀岩', null);
INSERT INTO `sensitive_word` VALUES ('1570', '白玛', null);
INSERT INTO `sensitive_word` VALUES ('1571', '任启兴', null);
INSERT INTO `sensitive_word` VALUES ('1572', '六月', null);
INSERT INTO `sensitive_word` VALUES ('1573', '阿不都热依木', null);
INSERT INTO `sensitive_word` VALUES ('1574', '阿米提', null);
INSERT INTO `sensitive_word` VALUES ('1575', '艾斯海提', null);
INSERT INTO `sensitive_word` VALUES ('1576', '克里木拜', null);
INSERT INTO `sensitive_word` VALUES ('1577', '徐荣凯', null);
INSERT INTO `sensitive_word` VALUES ('1578', '杨崇汇', null);
INSERT INTO `sensitive_word` VALUES ('1579', '苏荣', null);
INSERT INTO `sensitive_word` VALUES ('1580', '桑结加', null);
INSERT INTO `sensitive_word` VALUES ('1581', '马启智', null);
INSERT INTO `sensitive_word` VALUES ('1582', '于均波', null);
INSERT INTO `sensitive_word` VALUES ('1583', '程世娥', null);
INSERT INTO `sensitive_word` VALUES ('1584', '房凤友', null);
INSERT INTO `sensitive_word` VALUES ('1585', '季允石', null);
INSERT INTO `sensitive_word` VALUES ('1586', '杨晶', null);
INSERT INTO `sensitive_word` VALUES ('1587', '王占', null);
INSERT INTO `sensitive_word` VALUES ('1588', '李金明', null);
INSERT INTO `sensitive_word` VALUES ('1589', '方兆祥', null);
INSERT INTO `sensitive_word` VALUES ('1590', '陈明义', null);
INSERT INTO `sensitive_word` VALUES ('1591', '钟起煌', null);
INSERT INTO `sensitive_word` VALUES ('1592', '韩寓群', null);
INSERT INTO `sensitive_word` VALUES ('1593', '范钦臣', null);
INSERT INTO `sensitive_word` VALUES ('1594', '杨正午', null);
INSERT INTO `sensitive_word` VALUES ('1595', '曹伯纯', null);
INSERT INTO `sensitive_word` VALUES ('1596', '汪啸风', null);
INSERT INTO `sensitive_word` VALUES ('1597', '黄镇东', null);
INSERT INTO `sensitive_word` VALUES ('1598', '张学忠', null);
INSERT INTO `sensitive_word` VALUES ('1599', '张中伟', null);
INSERT INTO `sensitive_word` VALUES ('1600', '曹其真', null);
INSERT INTO `sensitive_word` VALUES ('1601', '白志健', null);
INSERT INTO `sensitive_word` VALUES ('1602', '万永祥', null);
INSERT INTO `sensitive_word` VALUES ('1603', '刘粤军', null);
INSERT INTO `sensitive_word` VALUES ('1604', '杨忠民', null);
INSERT INTO `sensitive_word` VALUES ('1605', '艾力更', null);
INSERT INTO `sensitive_word` VALUES ('1606', '依明巴海', null);
INSERT INTO `sensitive_word` VALUES ('1607', '白克力', null);
INSERT INTO `sensitive_word` VALUES ('1608', '曾钰成', null);
INSERT INTO `sensitive_word` VALUES ('1609', '崔世安', null);
INSERT INTO `sensitive_word` VALUES ('1610', '葛振峰', null);
INSERT INTO `sensitive_word` VALUES ('1611', '熊光楷', null);
INSERT INTO `sensitive_word` VALUES ('1612', '张黎', null);
INSERT INTO `sensitive_word` VALUES ('1613', '李玉', null);
INSERT INTO `sensitive_word` VALUES ('1614', '章沁生', null);
INSERT INTO `sensitive_word` VALUES ('1615', '李继耐', null);
INSERT INTO `sensitive_word` VALUES ('1616', '唐天标', null);
INSERT INTO `sensitive_word` VALUES ('1617', '孙忠同', null);
INSERT INTO `sensitive_word` VALUES ('1618', '刘振起', null);
INSERT INTO `sensitive_word` VALUES ('1619', '姜吉初', null);
INSERT INTO `sensitive_word` VALUES ('1620', '孙志强', null);
INSERT INTO `sensitive_word` VALUES ('1621', '苏书岩', null);
INSERT INTO `sensitive_word` VALUES ('1622', '王谦', null);
INSERT INTO `sensitive_word` VALUES ('1623', '孙大发', null);
INSERT INTO `sensitive_word` VALUES ('1624', '刘源', null);
INSERT INTO `sensitive_word` VALUES ('1625', '李安东', null);
INSERT INTO `sensitive_word` VALUES ('1626', '楚鸿彦', null);
INSERT INTO `sensitive_word` VALUES ('1627', '张诗明', null);
INSERT INTO `sensitive_word` VALUES ('1628', '朱发忠', null);
INSERT INTO `sensitive_word` VALUES ('1629', '张建启', null);
INSERT INTO `sensitive_word` VALUES ('1630', '迟万春', null);
INSERT INTO `sensitive_word` VALUES ('1631', '李栋恒', null);
INSERT INTO `sensitive_word` VALUES ('1632', '行房', null);
INSERT INTO `sensitive_word` VALUES ('1633', '摇头丸', null);
INSERT INTO `sensitive_word` VALUES ('1634', '酮体', null);
INSERT INTO `sensitive_word` VALUES ('1635', '胴体', null);
INSERT INTO `sensitive_word` VALUES ('1636', '截访', null);
INSERT INTO `sensitive_word` VALUES ('1637', '殴打', null);
INSERT INTO `sensitive_word` VALUES ('1638', '黑监', null);
INSERT INTO `sensitive_word` VALUES ('1639', '黑牢', null);
INSERT INTO `sensitive_word` VALUES ('1640', '狱霸', null);
INSERT INTO `sensitive_word` VALUES ('1641', '艾未未', null);
INSERT INTO `sensitive_word` VALUES ('1642', '崔卫平', null);
INSERT INTO `sensitive_word` VALUES ('1643', '梁文道', null);
INSERT INTO `sensitive_word` VALUES ('1644', '龙应台', null);
INSERT INTO `sensitive_word` VALUES ('1645', '陈子明', null);
INSERT INTO `sensitive_word` VALUES ('1646', '萧瀚', null);
INSERT INTO `sensitive_word` VALUES ('1647', '秦晖', null);
INSERT INTO `sensitive_word` VALUES ('1648', '冉云飞', null);
INSERT INTO `sensitive_word` VALUES ('1649', '希特勒', null);
INSERT INTO `sensitive_word` VALUES ('1650', '自拍', null);
INSERT INTO `sensitive_word` VALUES ('1651', '套图', null);
INSERT INTO `sensitive_word` VALUES ('1652', '低智商', null);
INSERT INTO `sensitive_word` VALUES ('1653', '低能儿', null);
INSERT INTO `sensitive_word` VALUES ('1654', '弱智', null);
INSERT INTO `sensitive_word` VALUES ('1655', '刘小波', null);
INSERT INTO `sensitive_word` VALUES ('1656', '教徒', null);
INSERT INTO `sensitive_word` VALUES ('1657', '智商低', null);
INSERT INTO `sensitive_word` VALUES ('1658', '阴谋', null);
INSERT INTO `sensitive_word` VALUES ('1659', 'H文', null);
INSERT INTO `sensitive_word` VALUES ('1660', '柳斌杰', null);
INSERT INTO `sensitive_word` VALUES ('1661', '艳照', null);
INSERT INTO `sensitive_word` VALUES ('1662', '野战', null);
INSERT INTO `sensitive_word` VALUES ('1663', '后入式', null);
INSERT INTO `sensitive_word` VALUES ('1664', '合体门', null);
INSERT INTO `sensitive_word` VALUES ('1665', '跳蚤门', null);
INSERT INTO `sensitive_word` VALUES ('1666', '秘处', null);
INSERT INTO `sensitive_word` VALUES ('1667', '摸鸟', null);
INSERT INTO `sensitive_word` VALUES ('1668', '摸JJ', null);
INSERT INTO `sensitive_word` VALUES ('1669', '一本道', null);
INSERT INTO `sensitive_word` VALUES ('1670', '包养', null);
INSERT INTO `sensitive_word` VALUES ('1671', '王刚', null);
INSERT INTO `sensitive_word` VALUES ('1672', '廖晖', null);
INSERT INTO `sensitive_word` VALUES ('1673', '格列朗杰', null);
INSERT INTO `sensitive_word` VALUES ('1674', '阿不来提', null);
INSERT INTO `sensitive_word` VALUES ('1675', '阿不都热西提', null);
INSERT INTO `sensitive_word` VALUES ('1676', '张梅颖', null);
INSERT INTO `sensitive_word` VALUES ('1677', '张榕明', null);
INSERT INTO `sensitive_word` VALUES ('1678', '罗富和', null);
INSERT INTO `sensitive_word` VALUES ('1679', '陈宗兴', null);
INSERT INTO `sensitive_word` VALUES ('1680', '孙怀山', null);
INSERT INTO `sensitive_word` VALUES ('1681', '潘贵玉', null);
INSERT INTO `sensitive_word` VALUES ('1682', '陈抗甫', null);
INSERT INTO `sensitive_word` VALUES ('1683', '卞晋平', null);
INSERT INTO `sensitive_word` VALUES ('1684', '王胜洪', null);
INSERT INTO `sensitive_word` VALUES ('1685', '仝广成', null);
INSERT INTO `sensitive_word` VALUES ('1686', '陈喜庆', null);
INSERT INTO `sensitive_word` VALUES ('1687', '修福金', null);
INSERT INTO `sensitive_word` VALUES ('1688', '张宝文', null);
INSERT INTO `sensitive_word` VALUES ('1689', '刘晓峰', null);
INSERT INTO `sensitive_word` VALUES ('1690', '王钦敏', null);
INSERT INTO `sensitive_word` VALUES ('1691', '黄志贤', null);
INSERT INTO `sensitive_word` VALUES ('1692', '宋北杉', null);
INSERT INTO `sensitive_word` VALUES ('1693', '林智敏', null);
INSERT INTO `sensitive_word` VALUES ('1694', '一诚', null);
INSERT INTO `sensitive_word` VALUES ('1695', '叨述仁', null);
INSERT INTO `sensitive_word` VALUES ('1696', '万季飞', null);
INSERT INTO `sensitive_word` VALUES ('1697', '万学远', null);
INSERT INTO `sensitive_word` VALUES ('1698', '万鄂湘', null);
INSERT INTO `sensitive_word` VALUES ('1699', '陪聊', null);
INSERT INTO `sensitive_word` VALUES ('1700', '直接干', null);
INSERT INTO `sensitive_word` VALUES ('1701', '帮教', null);
INSERT INTO `sensitive_word` VALUES ('1702', '手抢', null);
INSERT INTO `sensitive_word` VALUES ('1703', '旁见', null);
INSERT INTO `sensitive_word` VALUES ('1704', '遇难', null);
INSERT INTO `sensitive_word` VALUES ('1705', '庄闲', null);
INSERT INTO `sensitive_word` VALUES ('1706', '半裸', null);
INSERT INTO `sensitive_word` VALUES ('1707', '半骚半软', null);
INSERT INTO `sensitive_word` VALUES ('1708', '半遮半露', null);
INSERT INTO `sensitive_word` VALUES ('1709', '蚌唇', null);
INSERT INTO `sensitive_word` VALUES ('1710', '胞漏疮', null);
INSERT INTO `sensitive_word` VALUES ('1711', '包茎', null);
INSERT INTO `sensitive_word` VALUES ('1712', '爆射', null);
INSERT INTO `sensitive_word` VALUES ('1713', '逼里', null);
INSERT INTO `sensitive_word` VALUES ('1714', '闭经', null);
INSERT INTO `sensitive_word` VALUES ('1715', '壁肉', null);
INSERT INTO `sensitive_word` VALUES ('1716', '勃发', null);
INSERT INTO `sensitive_word` VALUES ('1717', '不泄', null);
INSERT INTO `sensitive_word` VALUES ('1718', '不育', null);
INSERT INTO `sensitive_word` VALUES ('1719', '不孕', null);
INSERT INTO `sensitive_word` VALUES ('1720', '擦拭', null);
INSERT INTO `sensitive_word` VALUES ('1721', '采精', null);
INSERT INTO `sensitive_word` VALUES ('1722', '采阴', null);
INSERT INTO `sensitive_word` VALUES ('1723', '补阳', null);
INSERT INTO `sensitive_word` VALUES ('1724', '操逼', null);
INSERT INTO `sensitive_word` VALUES ('1725', '操弄', null);
INSERT INTO `sensitive_word` VALUES ('1726', '操起', null);
INSERT INTO `sensitive_word` VALUES ('1727', '操死', null);
INSERT INTO `sensitive_word` VALUES ('1728', '操我', null);
INSERT INTO `sensitive_word` VALUES ('1729', '操穴', null);
INSERT INTO `sensitive_word` VALUES ('1730', '侧臀', null);
INSERT INTO `sensitive_word` VALUES ('1731', '插爆', null);
INSERT INTO `sensitive_word` VALUES ('1732', '插出', null);
INSERT INTO `sensitive_word` VALUES ('1733', '插奶', null);
INSERT INTO `sensitive_word` VALUES ('1734', '插弄', null);
INSERT INTO `sensitive_word` VALUES ('1735', '插死', null);
INSERT INTO `sensitive_word` VALUES ('1736', '插送', null);
INSERT INTO `sensitive_word` VALUES ('1737', '插她', null);
INSERT INTO `sensitive_word` VALUES ('1738', '插穴', null);
INSERT INTO `sensitive_word` VALUES ('1739', '叉开', null);
INSERT INTO `sensitive_word` VALUES ('1740', '叉我', null);
INSERT INTO `sensitive_word` VALUES ('1741', '长驱直入', null);
INSERT INTO `sensitive_word` VALUES ('1742', '撑爆', null);
INSERT INTO `sensitive_word` VALUES ('1743', '撑破', null);
INSERT INTO `sensitive_word` VALUES ('1744', '撑涨', null);
INSERT INTO `sensitive_word` VALUES ('1745', '撑胀', null);
INSERT INTO `sensitive_word` VALUES ('1746', '耻部', null);
INSERT INTO `sensitive_word` VALUES ('1747', '耻毛', null);
INSERT INTO `sensitive_word` VALUES ('1748', '耻丘', null);
INSERT INTO `sensitive_word` VALUES ('1749', '赤裸', null);
INSERT INTO `sensitive_word` VALUES ('1750', '炽热', null);
INSERT INTO `sensitive_word` VALUES ('1751', '充血', null);
INSERT INTO `sensitive_word` VALUES ('1752', '冲插', null);
INSERT INTO `sensitive_word` VALUES ('1753', '抽擦', null);
INSERT INTO `sensitive_word` VALUES ('1754', '抽插', null);
INSERT INTO `sensitive_word` VALUES ('1755', '抽出', null);
INSERT INTO `sensitive_word` VALUES ('1756', '抽捣', null);
INSERT INTO `sensitive_word` VALUES ('1757', '抽离', null);
INSERT INTO `sensitive_word` VALUES ('1758', '抽弄', null);
INSERT INTO `sensitive_word` VALUES ('1759', '抽缩', null);
INSERT INTO `sensitive_word` VALUES ('1760', '初血', null);
INSERT INTO `sensitive_word` VALUES ('1761', '出水', null);
INSERT INTO `sensitive_word` VALUES ('1762', '出血', null);
INSERT INTO `sensitive_word` VALUES ('1763', '触碰', null);
INSERT INTO `sensitive_word` VALUES ('1764', '触淫', null);
INSERT INTO `sensitive_word` VALUES ('1765', '床事', null);
INSERT INTO `sensitive_word` VALUES ('1766', '床戏', null);
INSERT INTO `sensitive_word` VALUES ('1767', '吹弹', null);
INSERT INTO `sensitive_word` VALUES ('1768', '吹萧', null);
INSERT INTO `sensitive_word` VALUES ('1769', '垂软', null);
INSERT INTO `sensitive_word` VALUES ('1770', '春洞', null);
INSERT INTO `sensitive_word` VALUES ('1771', '春情', null);
INSERT INTO `sensitive_word` VALUES ('1772', '春心', null);
INSERT INTO `sensitive_word` VALUES ('1773', '春药', null);
INSERT INTO `sensitive_word` VALUES ('1774', '下药', null);
INSERT INTO `sensitive_word` VALUES ('1775', '唇瓣', null);
INSERT INTO `sensitive_word` VALUES ('1776', '唇缝', null);
INSERT INTO `sensitive_word` VALUES ('1777', '唇间', null);
INSERT INTO `sensitive_word` VALUES ('1778', '唇片', null);
INSERT INTO `sensitive_word` VALUES ('1779', '唇肉', null);
INSERT INTO `sensitive_word` VALUES ('1780', '唇舌', null);
INSERT INTO `sensitive_word` VALUES ('1781', '戳穿', null);
INSERT INTO `sensitive_word` VALUES ('1782', '戳入', null);
INSERT INTO `sensitive_word` VALUES ('1783', '戳穴', null);
INSERT INTO `sensitive_word` VALUES ('1784', '打泡', null);
INSERT INTO `sensitive_word` VALUES ('1785', '打手枪', null);
INSERT INTO `sensitive_word` VALUES ('1786', '大奶', null);
INSERT INTO `sensitive_word` VALUES ('1787', '大乳', null);
INSERT INTO `sensitive_word` VALUES ('1788', '大泄', null);
INSERT INTO `sensitive_word` VALUES ('1789', '多睾', null);
INSERT INTO `sensitive_word` VALUES ('1790', '梅毒', null);
INSERT INTO `sensitive_word` VALUES ('1791', '发骚', null);
INSERT INTO `sensitive_word` VALUES ('1792', '翻动', null);
INSERT INTO `sensitive_word` VALUES ('1793', '翻搅', null);
INSERT INTO `sensitive_word` VALUES ('1794', '翻弄', null);
INSERT INTO `sensitive_word` VALUES ('1795', '芳香', null);
INSERT INTO `sensitive_word` VALUES ('1796', '房事', null);
INSERT INTO `sensitive_word` VALUES ('1797', '昏厥', null);
INSERT INTO `sensitive_word` VALUES ('1798', '房室', null);
INSERT INTO `sensitive_word` VALUES ('1799', '放荡', null);
INSERT INTO `sensitive_word` VALUES ('1800', '肥奶', null);
INSERT INTO `sensitive_word` VALUES ('1801', '肥乳', null);
INSERT INTO `sensitive_word` VALUES ('1802', '肥润', null);
INSERT INTO `sensitive_word` VALUES ('1803', '肥臀', null);
INSERT INTO `sensitive_word` VALUES ('1804', '肥穴', null);
INSERT INTO `sensitive_word` VALUES ('1805', '肥尻', null);
INSERT INTO `sensitive_word` VALUES ('1806', '分泌', null);
INSERT INTO `sensitive_word` VALUES ('1807', '焚身', null);
INSERT INTO `sensitive_word` VALUES ('1808', '粉颊', null);
INSERT INTO `sensitive_word` VALUES ('1809', '粉嫩', null);
INSERT INTO `sensitive_word` VALUES ('1810', '粉白', null);
INSERT INTO `sensitive_word` VALUES ('1811', '粉臂', null);
INSERT INTO `sensitive_word` VALUES ('1812', '粉额', null);
INSERT INTO `sensitive_word` VALUES ('1813', '粉汗微出', null);
INSERT INTO `sensitive_word` VALUES ('1814', '粉乳', null);
INSERT INTO `sensitive_word` VALUES ('1815', '粉腮', null);
INSERT INTO `sensitive_word` VALUES ('1816', '粉舌', null);
INSERT INTO `sensitive_word` VALUES ('1817', '粉头', null);
INSERT INTO `sensitive_word` VALUES ('1818', '粉腿', null);
INSERT INTO `sensitive_word` VALUES ('1819', '粉臀', null);
INSERT INTO `sensitive_word` VALUES ('1820', '粉腰', null);
INSERT INTO `sensitive_word` VALUES ('1821', '丰肥', null);
INSERT INTO `sensitive_word` VALUES ('1822', '丰隆', null);
INSERT INTO `sensitive_word` VALUES ('1823', '丰乳', null);
INSERT INTO `sensitive_word` VALUES ('1824', '丰硕', null);
INSERT INTO `sensitive_word` VALUES ('1825', '丰臀', null);
INSERT INTO `sensitive_word` VALUES ('1826', '风流', null);
INSERT INTO `sensitive_word` VALUES ('1827', '风骚', null);
INSERT INTO `sensitive_word` VALUES ('1828', '夫妻', null);
INSERT INTO `sensitive_word` VALUES ('1829', '伏在', null);
INSERT INTO `sensitive_word` VALUES ('1830', '服囊肉膜', null);
INSERT INTO `sensitive_word` VALUES ('1831', '腹股', null);
INSERT INTO `sensitive_word` VALUES ('1832', '附睾', null);
INSERT INTO `sensitive_word` VALUES ('1833', '妇方', null);
INSERT INTO `sensitive_word` VALUES ('1834', '干过炮', null);
INSERT INTO `sensitive_word` VALUES ('1835', '缸交', null);
INSERT INTO `sensitive_word` VALUES ('1836', '肛部', null);
INSERT INTO `sensitive_word` VALUES ('1837', '肛管', null);
INSERT INTO `sensitive_word` VALUES ('1838', '肛门', null);
INSERT INTO `sensitive_word` VALUES ('1839', '肛肉', null);
INSERT INTO `sensitive_word` VALUES ('1840', '肛柱', null);
INSERT INTO `sensitive_word` VALUES ('1841', '高亢', null);
INSERT INTO `sensitive_word` VALUES ('1842', '高耸', null);
INSERT INTO `sensitive_word` VALUES ('1843', '高挺', null);
INSERT INTO `sensitive_word` VALUES ('1844', '高凸', null);
INSERT INTO `sensitive_word` VALUES ('1845', '高胀', null);
INSERT INTO `sensitive_word` VALUES ('1846', '膏淋', null);
INSERT INTO `sensitive_word` VALUES ('1847', '根插', null);
INSERT INTO `sensitive_word` VALUES ('1848', '供精', null);
INSERT INTO `sensitive_word` VALUES ('1849', '宫口', null);
INSERT INTO `sensitive_word` VALUES ('1850', '宫内', null);
INSERT INTO `sensitive_word` VALUES ('1851', '宫腔', null);
INSERT INTO `sensitive_word` VALUES ('1852', '宫外孕', null);
INSERT INTO `sensitive_word` VALUES ('1853', '共浴', null);
INSERT INTO `sensitive_word` VALUES ('1854', '沟缝', null);
INSERT INTO `sensitive_word` VALUES ('1855', '狗交', null);
INSERT INTO `sensitive_word` VALUES ('1856', '狗爬', null);
INSERT INTO `sensitive_word` VALUES ('1857', '够骚', null);
INSERT INTO `sensitive_word` VALUES ('1858', '观淫癖', null);
INSERT INTO `sensitive_word` VALUES ('1859', '含弄', null);
INSERT INTO `sensitive_word` VALUES ('1860', '含乳', null);
INSERT INTO `sensitive_word` VALUES ('1861', '豪乳', null);
INSERT INTO `sensitive_word` VALUES ('1862', '耗精伤气', null);
INSERT INTO `sensitive_word` VALUES ('1863', '黑黑的', null);
INSERT INTO `sensitive_word` VALUES ('1864', '黑洞', null);
INSERT INTO `sensitive_word` VALUES ('1865', '黑毛', null);
INSERT INTO `sensitive_word` VALUES ('1866', '狠插', null);
INSERT INTO `sensitive_word` VALUES ('1867', '狠干', null);
INSERT INTO `sensitive_word` VALUES ('1868', '横冲直撞', null);
INSERT INTO `sensitive_word` VALUES ('1869', '红唇', null);
INSERT INTO `sensitive_word` VALUES ('1870', '红颊', null);
INSERT INTO `sensitive_word` VALUES ('1871', '红润', null);
INSERT INTO `sensitive_word` VALUES ('1872', '喉交', null);
INSERT INTO `sensitive_word` VALUES ('1873', '后入位', null);
INSERT INTO `sensitive_word` VALUES ('1874', '后庭花', null);
INSERT INTO `sensitive_word` VALUES ('1875', '花蕊', null);
INSERT INTO `sensitive_word` VALUES ('1876', '花穴', null);
INSERT INTO `sensitive_word` VALUES ('1877', '缓进速出', null);
INSERT INTO `sensitive_word` VALUES ('1878', '唤起', null);
INSERT INTO `sensitive_word` VALUES ('1879', '秽疮', null);
INSERT INTO `sensitive_word` VALUES ('1880', '秽物', null);
INSERT INTO `sensitive_word` VALUES ('1881', '会阴', null);
INSERT INTO `sensitive_word` VALUES ('1882', '魂飞魄散', null);
INSERT INTO `sensitive_word` VALUES ('1883', '溷圆', null);
INSERT INTO `sensitive_word` VALUES ('1884', '活塞', null);
INSERT INTO `sensitive_word` VALUES ('1885', '火热', null);
INSERT INTO `sensitive_word` VALUES ('1886', '火柱', null);
INSERT INTO `sensitive_word` VALUES ('1887', '击打', null);
INSERT INTO `sensitive_word` VALUES ('1888', '饥渴', null);
INSERT INTO `sensitive_word` VALUES ('1889', '激发性', null);
INSERT INTO `sensitive_word` VALUES ('1890', '激射', null);
INSERT INTO `sensitive_word` VALUES ('1891', '鸡吧', null);
INSERT INTO `sensitive_word` VALUES ('1892', '鸡巴', null);
INSERT INTO `sensitive_word` VALUES ('1893', '鸡把', null);
INSERT INTO `sensitive_word` VALUES ('1894', '鸡奸', null);
INSERT INTO `sensitive_word` VALUES ('1895', '急抽', null);
INSERT INTO `sensitive_word` VALUES ('1896', '急喘', null);
INSERT INTO `sensitive_word` VALUES ('1897', '女阴', null);
INSERT INTO `sensitive_word` VALUES ('1898', '外阴', null);
INSERT INTO `sensitive_word` VALUES ('1899', '奸插', null);
INSERT INTO `sensitive_word` VALUES ('1900', '奸弄', null);
INSERT INTO `sensitive_word` VALUES ('1901', '奸虐', null);
INSERT INTO `sensitive_word` VALUES ('1902', '奸辱', null);
INSERT INTO `sensitive_word` VALUES ('1903', '奸尸', null);
INSERT INTO `sensitive_word` VALUES ('1904', '奸我', null);
INSERT INTO `sensitive_word` VALUES ('1905', '奸淫', null);
INSERT INTO `sensitive_word` VALUES ('1906', '将嘴套至', null);
INSERT INTO `sensitive_word` VALUES ('1907', '浆汁', null);
INSERT INTO `sensitive_word` VALUES ('1908', '椒乳', null);
INSERT INTO `sensitive_word` VALUES ('1909', '交缠', null);
INSERT INTO `sensitive_word` VALUES ('1910', '交欢', null);
INSERT INTO `sensitive_word` VALUES ('1911', '交颈', null);
INSERT INTO `sensitive_word` VALUES ('1912', '交配', null);
INSERT INTO `sensitive_word` VALUES ('1913', '交媾', null);
INSERT INTO `sensitive_word` VALUES ('1914', '茎头', null);
INSERT INTO `sensitive_word` VALUES ('1915', '精巢', null);
INSERT INTO `sensitive_word` VALUES ('1916', '精虫', null);
INSERT INTO `sensitive_word` VALUES ('1917', '精阜', null);
INSERT INTO `sensitive_word` VALUES ('1918', '精关失固', null);
INSERT INTO `sensitive_word` VALUES ('1919', '精浆', null);
INSERT INTO `sensitive_word` VALUES ('1920', '精满自溢', null);
INSERT INTO `sensitive_word` VALUES ('1921', '精门', null);
INSERT INTO `sensitive_word` VALUES ('1922', '精囊', null);
INSERT INTO `sensitive_word` VALUES ('1923', '精失固摄', null);
INSERT INTO `sensitive_word` VALUES ('1924', '精水', null);
INSERT INTO `sensitive_word` VALUES ('1925', '精细胞', null);
INSERT INTO `sensitive_word` VALUES ('1926', '经期', null);
INSERT INTO `sensitive_word` VALUES ('1927', '经痛', null);
INSERT INTO `sensitive_word` VALUES ('1928', '经血', null);
INSERT INTO `sensitive_word` VALUES ('1929', '七·五', null);
INSERT INTO `sensitive_word` VALUES ('1930', '真凶', null);
INSERT INTO `sensitive_word` VALUES ('1931', '印尼', null);
INSERT INTO `sensitive_word` VALUES ('1932', 'CNN', null);
INSERT INTO `sensitive_word` VALUES ('1933', 'JJ满是伤痕', null);
INSERT INTO `sensitive_word` VALUES ('1935', 'K粉', null);
INSERT INTO `sensitive_word` VALUES ('1936', 'sex', null);
INSERT INTO `sensitive_word` VALUES ('1937', 'AV', null);
INSERT INTO `sensitive_word` VALUES ('1938', 'caoni马', null);
INSERT INTO `sensitive_word` VALUES ('1939', 'cao我', null);
INSERT INTO `sensitive_word` VALUES ('1940', 'chinackinfo', null);
INSERT INTO `sensitive_word` VALUES ('1942', 'ommunist', null);
INSERT INTO `sensitive_word` VALUES ('1943', 'оmmunist', null);
INSERT INTO `sensitive_word` VALUES ('1947', '透视', null);
INSERT INTO `sensitive_word` VALUES ('1948', '弹药', null);
INSERT INTO `sensitive_word` VALUES ('1949', '红外', null);
INSERT INTO `sensitive_word` VALUES ('1950', 'dajiyuan', null);
INSERT INTO `sensitive_word` VALUES ('1955', '一夜情', null);
INSERT INTO `sensitive_word` VALUES ('1956', 'e夜', null);
INSERT INTO `sensitive_word` VALUES ('1957', 'e畅家园', null);
INSERT INTO `sensitive_word` VALUES ('1958', 'falun', null);
INSERT INTO `sensitive_word` VALUES ('1959', 'fapiao', null);
INSERT INTO `sensitive_word` VALUES ('1960', 'fa工力', null);
INSERT INTO `sensitive_word` VALUES ('1961', 'fa车仑工', null);
INSERT INTO `sensitive_word` VALUES ('1962', 'fa轮', null);
INSERT INTO `sensitive_word` VALUES ('1963', 'fl功', null);
INSERT INTO `sensitive_word` VALUES ('1964', 'freetibet', null);
INSERT INTO `sensitive_word` VALUES ('1965', 'gamo密封圈', null);
INSERT INTO `sensitive_word` VALUES ('1966', 'gamo弹簧', null);
INSERT INTO `sensitive_word` VALUES ('1967', 'gamo皮碗', null);
INSERT INTO `sensitive_word` VALUES ('1970', 'gbh水', null);
INSERT INTO `sensitive_word` VALUES ('1971', 'ghb水', null);
INSERT INTO `sensitive_word` VALUES ('1972', 'ghb迷幻液', null);
INSERT INTO `sensitive_word` VALUES ('1975', 'gongchandang', null);
INSERT INTO `sensitive_word` VALUES ('1976', 'gongchan', null);
INSERT INTO `sensitive_word` VALUES ('1977', 'gong产dang', null);
INSERT INTO `sensitive_word` VALUES ('1978', 'gong产', null);
INSERT INTO `sensitive_word` VALUES ('1979', 'gong产当', null);
INSERT INTO `sensitive_word` VALUES ('1980', 'gong产挡', null);
INSERT INTO `sensitive_word` VALUES ('1981', 'gong产档', null);
INSERT INTO `sensitive_word` VALUES ('1982', 'gong产裆', null);
INSERT INTO `sensitive_word` VALUES ('1983', 'gong产谠', null);
INSERT INTO `sensitive_word` VALUES ('1984', 'gong惨dang', null);
INSERT INTO `sensitive_word` VALUES ('1985', 'gong惨当', null);
INSERT INTO `sensitive_word` VALUES ('1986', 'gong惨挡', null);
INSERT INTO `sensitive_word` VALUES ('1987', 'gong惨档', null);
INSERT INTO `sensitive_word` VALUES ('1988', 'gong惨裆', null);
INSERT INTO `sensitive_word` VALUES ('1989', 'gong惨谠', null);
INSERT INTO `sensitive_word` VALUES ('1990', 'gong掺dang', null);
INSERT INTO `sensitive_word` VALUES ('1991', 'gong掺当', null);
INSERT INTO `sensitive_word` VALUES ('1992', 'gong掺挡', null);
INSERT INTO `sensitive_word` VALUES ('1993', 'gong掺档', null);
INSERT INTO `sensitive_word` VALUES ('1994', 'gong掺裆', null);
INSERT INTO `sensitive_word` VALUES ('1995', 'gong掺谠', null);
INSERT INTO `sensitive_word` VALUES ('1996', 'gong残dang', null);
INSERT INTO `sensitive_word` VALUES ('1997', 'gong残当', null);
INSERT INTO `sensitive_word` VALUES ('1998', 'gong残挡', null);
INSERT INTO `sensitive_word` VALUES ('1999', 'gong残档', null);
INSERT INTO `sensitive_word` VALUES ('2000', 'gong残裆', null);
INSERT INTO `sensitive_word` VALUES ('2001', 'gong残谠', null);
INSERT INTO `sensitive_word` VALUES ('2002', 'gong産dang', null);
INSERT INTO `sensitive_word` VALUES ('2003', 'gong産当', null);
INSERT INTO `sensitive_word` VALUES ('2004', 'gong産挡', null);
INSERT INTO `sensitive_word` VALUES ('2005', 'gong産档', null);
INSERT INTO `sensitive_word` VALUES ('2006', 'gong産裆', null);
INSERT INTO `sensitive_word` VALUES ('2007', 'gong産谠', null);
INSERT INTO `sensitive_word` VALUES ('2008', 'gong铲dang', null);
INSERT INTO `sensitive_word` VALUES ('2009', 'gong铲当', null);
INSERT INTO `sensitive_word` VALUES ('2010', 'gong铲挡', null);
INSERT INTO `sensitive_word` VALUES ('2011', 'gong铲档', null);
INSERT INTO `sensitive_word` VALUES ('2012', 'gong铲裆', null);
INSERT INTO `sensitive_word` VALUES ('2013', 'gong铲谠', null);
INSERT INTO `sensitive_word` VALUES ('2015', 'G情', null);
INSERT INTO `sensitive_word` VALUES ('2016', 'G点', null);
INSERT INTO `sensitive_word` VALUES ('2017', 'G网', null);
INSERT INTO `sensitive_word` VALUES ('2018', 'homeservice', null);
INSERT INTO `sensitive_word` VALUES ('2019', 'hоmeservice', null);
INSERT INTO `sensitive_word` VALUES ('2020', 'hongzhi', null);
INSERT INTO `sensitive_word` VALUES ('2021', 'hotbody', null);
INSERT INTO `sensitive_word` VALUES ('2023', 'jiqingshaofu', null);
INSERT INTO `sensitive_word` VALUES ('2024', 'jiqingshipin', null);
INSERT INTO `sensitive_word` VALUES ('2025', 'J吧', null);
INSERT INTO `sensitive_word` VALUES ('2026', 'J巴', null);
INSERT INTO `sensitive_word` VALUES ('2027', 'J情', null);
INSERT INTO `sensitive_word` VALUES ('2028', 'KB气息', null);
INSERT INTO `sensitive_word` VALUES ('2029', 'king粉', null);
INSERT INTO `sensitive_word` VALUES ('2030', 'ktv公主', null);
INSERT INTO `sensitive_word` VALUES ('2031', '招聘', null);
INSERT INTO `sensitive_word` VALUES ('2032', 'ji吧', null);
INSERT INTO `sensitive_word` VALUES ('2033', 'ji巴', null);
INSERT INTO `sensitive_word` VALUES ('2034', '阳具', null);
INSERT INTO `sensitive_word` VALUES ('2035', '阴部', null);
INSERT INTO `sensitive_word` VALUES ('2036', '下半身', null);
INSERT INTO `sensitive_word` VALUES ('2037', '汁液', null);
INSERT INTO `sensitive_word` VALUES ('2038', '一丝不挂', null);
INSERT INTO `sensitive_word` VALUES ('2039', '阴毛', null);
INSERT INTO `sensitive_word` VALUES ('2040', '口交', null);
INSERT INTO `sensitive_word` VALUES ('2041', '插进', null);
INSERT INTO `sensitive_word` VALUES ('2042', '插入', null);
INSERT INTO `sensitive_word` VALUES ('2043', '性交', null);
INSERT INTO `sensitive_word` VALUES ('2044', '好痛', null);
INSERT INTO `sensitive_word` VALUES ('2045', '用力', null);
INSERT INTO `sensitive_word` VALUES ('2046', '阴户', null);
INSERT INTO `sensitive_word` VALUES ('2047', '湿了', null);
INSERT INTO `sensitive_word` VALUES ('2048', '湿透', null);
INSERT INTO `sensitive_word` VALUES ('2049', '多液', null);
INSERT INTO `sensitive_word` VALUES ('2050', '多汁', null);
INSERT INTO `sensitive_word` VALUES ('2051', '液体', null);
INSERT INTO `sensitive_word` VALUES ('2052', '胸部', null);
INSERT INTO `sensitive_word` VALUES ('2053', '胸罩', null);
INSERT INTO `sensitive_word` VALUES ('2054', '阴蒂', null);
INSERT INTO `sensitive_word` VALUES ('2055', '阴唇', null);
INSERT INTO `sensitive_word` VALUES ('2056', '上床', null);
INSERT INTO `sensitive_word` VALUES ('2057', '打炮', null);
INSERT INTO `sensitive_word` VALUES ('2058', '炮友', null);
INSERT INTO `sensitive_word` VALUES ('2059', '两会', null);
INSERT INTO `sensitive_word` VALUES ('2060', 'liaoliaoxing', null);
INSERT INTO `sensitive_word` VALUES ('2062', 'liu四', null);
INSERT INTO `sensitive_word` VALUES ('2063', 'liu泗', null);
INSERT INTO `sensitive_word` VALUES ('2064', 'luoliao', null);
INSERT INTO `sensitive_word` VALUES ('2065', 'luo聊', null);
INSERT INTO `sensitive_word` VALUES ('2066', 'makelove', null);
INSERT INTO `sensitive_word` VALUES ('2067', 'Мakelove', null);
INSERT INTO `sensitive_word` VALUES ('2068', 'massage', null);
INSERT INTO `sensitive_word` VALUES ('2069', 'Мassage', null);
INSERT INTO `sensitive_word` VALUES ('2070', 'maya语', null);
INSERT INTO `sensitive_word` VALUES ('2071', 'mihuen', null);
INSERT INTO `sensitive_word` VALUES ('2072', 'Мihuen', null);
INSERT INTO `sensitive_word` VALUES ('2073', 'mihun', null);
INSERT INTO `sensitive_word` VALUES ('2074', 'minghui', null);
INSERT INTO `sensitive_word` VALUES ('2075', 'mi魂', null);
INSERT INTO `sensitive_word` VALUES ('2076', 'mm上门', null);
INSERT INTO `sensitive_word` VALUES ('2077', 'yin部', null);
INSERT INTO `sensitive_word` VALUES ('2078', 'y户', null);
INSERT INTO `sensitive_word` VALUES ('2079', 'y茎', null);
INSERT INTO `sensitive_word` VALUES ('2080', 'y蒂', null);
INSERT INTO `sensitive_word` VALUES ('2081', 'zenshanren', null);
INSERT INTO `sensitive_word` VALUES ('2082', 'zhengjian', null);
INSERT INTO `sensitive_word` VALUES ('2083', 'zhеngjian', null);
INSERT INTO `sensitive_word` VALUES ('2084', 'zhong共', null);
INSERT INTO `sensitive_word` VALUES ('2085', '①肖', null);
INSERT INTO `sensitive_word` VALUES ('2086', '②肖', null);
INSERT INTO `sensitive_word` VALUES ('2087', '③肖', null);
INSERT INTO `sensitive_word` VALUES ('2088', '④肖', null);
INSERT INTO `sensitive_word` VALUES ('2089', '⑤肖', null);
INSERT INTO `sensitive_word` VALUES ('2090', '⑥肖', null);
INSERT INTO `sensitive_word` VALUES ('2091', '⑦肖', null);
INSERT INTO `sensitive_word` VALUES ('2092', '⑧肖', null);
INSERT INTO `sensitive_word` VALUES ('2093', '⑨肖', null);
INSERT INTO `sensitive_word` VALUES ('2094', '一中一台', null);
INSERT INTO `sensitive_word` VALUES ('2095', '猛犬', null);
INSERT INTO `sensitive_word` VALUES ('2096', '一肖', null);
INSERT INTO `sensitive_word` VALUES ('2097', '一蚕缠', null);
INSERT INTO `sensitive_word` VALUES ('2098', '丁丙诺啡', null);
INSERT INTO `sensitive_word` VALUES ('2099', '丁香', null);
INSERT INTO `sensitive_word` VALUES ('2101', '七五', null);
INSERT INTO `sensitive_word` VALUES ('2102', '三zuo仑', null);
INSERT INTO `sensitive_word` VALUES ('2103', '呆婊', null);
INSERT INTO `sensitive_word` VALUES ('2104', '三哆论', null);
INSERT INTO `sensitive_word` VALUES ('2105', '三唑仑', null);
INSERT INTO `sensitive_word` VALUES ('2106', '三唑侖', null);
INSERT INTO `sensitive_word` VALUES ('2107', '三唑化', null);
INSERT INTO `sensitive_word` VALUES ('2108', '三坐仑', null);
INSERT INTO `sensitive_word` VALUES ('2109', '三挫仑', null);
INSERT INTO `sensitive_word` VALUES ('2110', '拉萨', null);
INSERT INTO `sensitive_word` VALUES ('2111', '三棱刀', null);
INSERT INTO `sensitive_word` VALUES ('2112', '三棱刮刀', null);
INSERT INTO `sensitive_word` VALUES ('2113', '三棱尖刀', null);
INSERT INTO `sensitive_word` VALUES ('2114', '三民', null);
INSERT INTO `sensitive_word` VALUES ('2115', '三聚化', null);
INSERT INTO `sensitive_word` VALUES ('2116', '三聚氰胺', null);
INSERT INTO `sensitive_word` VALUES ('2117', '联帮', null);
INSERT INTO `sensitive_word` VALUES ('2119', '联邦', null);
INSERT INTO `sensitive_word` VALUES ('2120', '壮阳', null);
INSERT INTO `sensitive_word` VALUES ('2121', '叫春', null);
INSERT INTO `sensitive_word` VALUES ('2122', '叫床', null);
INSERT INTO `sensitive_word` VALUES ('2123', '上访', null);
INSERT INTO `sensitive_word` VALUES ('2124', '专治', null);
INSERT INTO `sensitive_word` VALUES ('2125', '乱了', null);
INSERT INTO `sensitive_word` VALUES ('2126', '专用弩', null);
INSERT INTO `sensitive_word` VALUES ('2127', '奴隶', null);
INSERT INTO `sensitive_word` VALUES ('2128', '宣言', null);
INSERT INTO `sensitive_word` VALUES ('2129', '群体', null);
INSERT INTO `sensitive_word` VALUES ('2130', '維吾', null);
INSERT INTO `sensitive_word` VALUES ('2131', '维吾', null);
INSERT INTO `sensitive_word` VALUES ('2133', '世维', null);
INSERT INTO `sensitive_word` VALUES ('2134', '亡魂', null);
INSERT INTO `sensitive_word` VALUES ('2135', '丙吡兰', null);
INSERT INTO `sensitive_word` VALUES ('2136', '丙哌利定', null);
INSERT INTO `sensitive_word` VALUES ('2137', '东伊运', null);
INSERT INTO `sensitive_word` VALUES ('2138', '熟女', null);
INSERT INTO `sensitive_word` VALUES ('2139', '诱惑', null);
INSERT INTO `sensitive_word` VALUES ('2140', '拔棒', null);
INSERT INTO `sensitive_word` VALUES ('2141', '东突', null);
INSERT INTO `sensitive_word` VALUES ('2142', '两岸', null);
INSERT INTO `sensitive_word` VALUES ('2143', '张开', null);
INSERT INTO `sensitive_word` VALUES ('2145', '九一评', null);
INSERT INTO `sensitive_word` VALUES ('2146', '习仲勋', null);
INSERT INTO `sensitive_word` VALUES ('2147', '近平', null);
INSERT INTO `sensitive_word` VALUES ('2148', '乱伦', null);
INSERT INTO `sensitive_word` VALUES ('2149', '乱轮', null);
INSERT INTO `sensitive_word` VALUES ('2150', '卖春', null);
INSERT INTO `sensitive_word` VALUES ('2151', '乾坤棒', null);
INSERT INTO `sensitive_word` VALUES ('2152', '二六', null);
INSERT INTO `sensitive_word` VALUES ('2153', '交合', null);
INSERT INTO `sensitive_word` VALUES ('2154', '二龙戏珠', null);
INSERT INTO `sensitive_word` VALUES ('2155', '观音坐莲', null);
INSERT INTO `sensitive_word` VALUES ('2156', '老汉推车', null);
INSERT INTO `sensitive_word` VALUES ('2157', '男上女下', null);
INSERT INTO `sensitive_word` VALUES ('2158', '女下男上', null);
INSERT INTO `sensitive_word` VALUES ('2159', '私聊', null);
INSERT INTO `sensitive_word` VALUES ('2160', '人体', null);
INSERT INTO `sensitive_word` VALUES ('2162', '勇士', null);
INSERT INTO `sensitive_word` VALUES ('2163', '内情', null);
INSERT INTO `sensitive_word` VALUES ('2164', '武器', null);
INSERT INTO `sensitive_word` VALUES ('2165', '武装', null);
INSERT INTO `sensitive_word` VALUES ('2166', '起义', null);
INSERT INTO `sensitive_word` VALUES ('2167', '起易', null);
INSERT INTO `sensitive_word` VALUES ('2168', '动态网', null);
INSERT INTO `sensitive_word` VALUES ('2169', '大法', null);
INSERT INTO `sensitive_word` VALUES ('2170', '光明', null);
INSERT INTO `sensitive_word` VALUES ('2171', '共匪', null);
INSERT INTO `sensitive_word` VALUES ('2172', '共妻', null);
INSERT INTO `sensitive_word` VALUES ('2173', '明慧', null);
INSERT INTO `sensitive_word` VALUES ('2174', '明思', null);
INSERT INTO `sensitive_word` VALUES ('2175', '明心', null);
INSERT INTO `sensitive_word` VALUES ('2176', '退队', null);
INSERT INTO `sensitive_word` VALUES ('2177', '退团', null);
INSERT INTO `sensitive_word` VALUES ('2178', '自焚', null);
INSERT INTO `sensitive_word` VALUES ('2179', '疑案', null);
INSERT INTO `sensitive_word` VALUES ('2180', '伪火', null);
INSERT INTO `sensitive_word` VALUES ('2181', '真、善、忍', null);
INSERT INTO `sensitive_word` VALUES ('2182', '催情', null);
INSERT INTO `sensitive_word` VALUES ('2183', '聊性', null);
INSERT INTO `sensitive_word` VALUES ('2184', '流淫', null);
INSERT INTO `sensitive_word` VALUES ('2185', '漏乳', null);
INSERT INTO `sensitive_word` VALUES ('2186', '露B', null);
INSERT INTO `sensitive_word` VALUES ('2187', '轮操', null);
INSERT INTO `sensitive_word` VALUES ('2188', '裸陪', null);
INSERT INTO `sensitive_word` VALUES ('2189', '美逼', null);
INSERT INTO `sensitive_word` VALUES ('2190', '美幼', null);
INSERT INTO `sensitive_word` VALUES ('2191', '迷奸', null);
INSERT INTO `sensitive_word` VALUES ('2192', '摸奶', null);
INSERT INTO `sensitive_word` VALUES ('2193', '摸胸', null);
INSERT INTO `sensitive_word` VALUES ('2194', '母奸', null);
INSERT INTO `sensitive_word` VALUES ('2195', '嫩逼', null);
INSERT INTO `sensitive_word` VALUES ('2196', '嫩女', null);
INSERT INTO `sensitive_word` VALUES ('2197', '砲友', null);
INSERT INTO `sensitive_word` VALUES ('2198', '喷精', null);
INSERT INTO `sensitive_word` VALUES ('2199', '品香堂', null);
INSERT INTO `sensitive_word` VALUES ('2200', '前凸后翘', null);
INSERT INTO `sensitive_word` VALUES ('2201', '强jian', null);
INSERT INTO `sensitive_word` VALUES ('2202', '全裸', null);
INSERT INTO `sensitive_word` VALUES ('2203', '惹火身', null);
INSERT INTO `sensitive_word` VALUES ('2204', '日逼', null);
INSERT INTO `sensitive_word` VALUES ('2205', '日烂', null);
INSERT INTO `sensitive_word` VALUES ('2206', '肉逼', null);
INSERT INTO `sensitive_word` VALUES ('2207', '揉乳', null);
INSERT INTO `sensitive_word` VALUES ('2208', '乳爆', null);
INSERT INTO `sensitive_word` VALUES ('2209', '骚比', null);
INSERT INTO `sensitive_word` VALUES ('2210', '色逼', null);
INSERT INTO `sensitive_word` VALUES ('2211', '色界', null);
INSERT INTO `sensitive_word` VALUES ('2212', '色猫', null);
INSERT INTO `sensitive_word` VALUES ('2213', '色盟', null);
INSERT INTO `sensitive_word` VALUES ('2214', '色区', null);
INSERT INTO `sensitive_word` VALUES ('2215', '色B', null);
INSERT INTO `sensitive_word` VALUES ('2216', '少修正', null);
INSERT INTO `sensitive_word` VALUES ('2217', '射爽', null);
INSERT INTO `sensitive_word` VALUES ('2218', '射颜', null);
INSERT INTO `sensitive_word` VALUES ('2219', '无修正', null);
INSERT INTO `sensitive_word` VALUES ('2220', '释欲', null);
INSERT INTO `sensitive_word` VALUES ('2221', '兽欲', null);
INSERT INTO `sensitive_word` VALUES ('2222', '熟母', null);
INSERT INTO `sensitive_word` VALUES ('2223', '死逼', null);
INSERT INTO `sensitive_word` VALUES ('2224', '体奸', null);
INSERT INTO `sensitive_word` VALUES ('2225', '舔脚', null);
INSERT INTO `sensitive_word` VALUES ('2226', '我就色', null);
INSERT INTO `sensitive_word` VALUES ('2227', '相奸', null);
INSERT INTO `sensitive_word` VALUES ('2228', '校鸡', null);
INSERT INTO `sensitive_word` VALUES ('2229', '妖娆', null);
INSERT INTO `sensitive_word` VALUES ('2230', '性虎', null);
INSERT INTO `sensitive_word` VALUES ('2231', '性技巧', null);
INSERT INTO `sensitive_word` VALUES ('2232', '穴口', null);
INSERT INTO `sensitive_word` VALUES ('2233', '穴图', null);
INSERT INTO `sensitive_word` VALUES ('2234', '夜勤病栋', null);
INSERT INTO `sensitive_word` VALUES ('2235', '一夜欢', null);
INSERT INTO `sensitive_word` VALUES ('2236', '一ye情', null);
INSERT INTO `sensitive_word` VALUES ('2237', '淫虫', null);
INSERT INTO `sensitive_word` VALUES ('2238', '淫电影', null);
INSERT INTO `sensitive_word` VALUES ('2239', '淫河', null);
INSERT INTO `sensitive_word` VALUES ('2240', '淫海', null);
INSERT INTO `sensitive_word` VALUES ('2241', '淫教师', null);
INSERT INTO `sensitive_word` VALUES ('2242', '淫魔', null);
INSERT INTO `sensitive_word` VALUES ('2243', '淫妻', null);
INSERT INTO `sensitive_word` VALUES ('2244', '淫书', null);
INSERT INTO `sensitive_word` VALUES ('2245', '淫术', null);
INSERT INTO `sensitive_word` VALUES ('2246', '淫亵', null);
INSERT INTO `sensitive_word` VALUES ('2247', '淫样', null);
INSERT INTO `sensitive_word` VALUES ('2248', '淫照', null);
INSERT INTO `sensitive_word` VALUES ('2249', '幼交', null);
INSERT INTO `sensitive_word` VALUES ('2250', '欲仙欲', null);
INSERT INTO `sensitive_word` VALUES ('2251', '招鸡', null);
INSERT INTO `sensitive_word` VALUES ('2252', '招妓', null);
INSERT INTO `sensitive_word` VALUES ('2253', '抓胸', null);
INSERT INTO `sensitive_word` VALUES ('2254', '十八禁', null);
INSERT INTO `sensitive_word` VALUES ('2255', 'adult', null);
INSERT INTO `sensitive_word` VALUES ('2256', 'hardcore', null);
INSERT INTO `sensitive_word` VALUES ('2257', 'hardcоre', null);
INSERT INTO `sensitive_word` VALUES ('2258', 'H动画', null);
INSERT INTO `sensitive_word` VALUES ('2259', 'H动漫', null);
INSERT INTO `sensitive_word` VALUES ('2262', 'porn', null);
INSERT INTO `sensitive_word` VALUES ('2263', 'pоrn', null);
INSERT INTO `sensitive_word` VALUES ('2264', 'tokyohot', null);
INSERT INTO `sensitive_word` VALUES ('2265', 'tоkyohot', null);
INSERT INTO `sensitive_word` VALUES ('2266', 'yin荡', null);
INSERT INTO `sensitive_word` VALUES ('2267', 'titor', null);
INSERT INTO `sensitive_word` VALUES ('2268', 'titоr', null);
INSERT INTO `sensitive_word` VALUES ('2269', '逢八必灾', null);
INSERT INTO `sensitive_word` VALUES ('2270', '逢九必乱', null);
INSERT INTO `sensitive_word` VALUES ('2271', '朱瑟里诺', null);
INSERT INTO `sensitive_word` VALUES ('2272', '根达亚文明', null);
INSERT INTO `sensitive_word` VALUES ('2273', '诺查丹玛斯', null);
INSERT INTO `sensitive_word` VALUES ('2274', '马雅', null);
INSERT INTO `sensitive_word` VALUES ('2275', '笨蛋', null);
INSERT INTO `sensitive_word` VALUES ('2276', '推背', null);
INSERT INTO `sensitive_word` VALUES ('2277', '推bei', null);
INSERT INTO `sensitive_word` VALUES ('2278', '济世灵文', null);
INSERT INTO `sensitive_word` VALUES ('2279', '诸世纪', null);
INSERT INTO `sensitive_word` VALUES ('2280', '盘古', null);
INSERT INTO `sensitive_word` VALUES ('2281', '志洪李', null);
INSERT INTO `sensitive_word` VALUES ('2282', '李虹滞', null);
INSERT INTO `sensitive_word` VALUES ('2283', '轮法功', null);
INSERT INTO `sensitive_word` VALUES ('2284', '氵去车仑', null);
INSERT INTO `sensitive_word` VALUES ('2285', '发论工', null);
INSERT INTO `sensitive_word` VALUES ('2286', '法x功', null);
INSERT INTO `sensitive_word` VALUES ('2287', '法o功', null);
INSERT INTO `sensitive_word` VALUES ('2288', '法一轮一功', null);
INSERT INTO `sensitive_word` VALUES ('2289', '法lun', null);
INSERT INTO `sensitive_word` VALUES ('2290', '法LG', null);
INSERT INTO `sensitive_word` VALUES ('2291', 'lungon', null);
INSERT INTO `sensitive_word` VALUES ('2292', 'lungоn', null);
INSERT INTO `sensitive_word` VALUES ('2293', '退dan', null);
INSERT INTO `sensitive_word` VALUES ('2294', '超越红墙', null);
INSERT INTO `sensitive_word` VALUES ('2295', '自fen', null);
INSERT INTO `sensitive_word` VALUES ('2296', '九pin', null);
INSERT INTO `sensitive_word` VALUES ('2297', 'jiupin', null);
INSERT INTO `sensitive_word` VALUES ('2298', 'jiǔpíng', null);
INSERT INTO `sensitive_word` VALUES ('2299', '藏字石', null);
INSERT INTO `sensitive_word` VALUES ('2300', '自sha', null);
INSERT INTO `sensitive_word` VALUES ('2301', 'zi杀', null);
INSERT INTO `sensitive_word` VALUES ('2302', 'suicide', null);
INSERT INTO `sensitive_word` VALUES ('2303', '资金周转', null);
INSERT INTO `sensitive_word` VALUES ('2304', '救市', null);
INSERT INTO `sensitive_word` VALUES ('2305', '圈钱', null);
INSERT INTO `sensitive_word` VALUES ('2306', '崩盘', null);
INSERT INTO `sensitive_word` VALUES ('2307', '证监会', null);
INSERT INTO `sensitive_word` VALUES ('2308', '贷款', null);
INSERT INTO `sensitive_word` VALUES ('2309', '胡的', null);
INSERT INTO `sensitive_word` VALUES ('2310', '温的', null);
INSERT INTO `sensitive_word` VALUES ('2311', '钦定', null);
INSERT INTO `sensitive_word` VALUES ('2312', '习近', null);
INSERT INTO `sensitive_word` VALUES ('2313', '平近习', null);
INSERT INTO `sensitive_word` VALUES ('2314', '习太子', null);
INSERT INTO `sensitive_word` VALUES ('2315', '习明泽', null);
INSERT INTO `sensitive_word` VALUES ('2316', '老习', null);
INSERT INTO `sensitive_word` VALUES ('2317', '温家', null);
INSERT INTO `sensitive_word` VALUES ('2318', '缺钱', null);
INSERT INTO `sensitive_word` VALUES ('2319', '温加宝', null);
INSERT INTO `sensitive_word` VALUES ('2320', '温x', null);
INSERT INTO `sensitive_word` VALUES ('2321', '胡X', null);
INSERT INTO `sensitive_word` VALUES ('2322', '温jia宝', null);
INSERT INTO `sensitive_word` VALUES ('2323', '温宝宝', null);
INSERT INTO `sensitive_word` VALUES ('2324', '温加饱', null);
INSERT INTO `sensitive_word` VALUES ('2325', '温加保', null);
INSERT INTO `sensitive_word` VALUES ('2326', '张培莉', null);
INSERT INTO `sensitive_word` VALUES ('2327', '温云松', null);
INSERT INTO `sensitive_word` VALUES ('2328', '温JB', null);
INSERT INTO `sensitive_word` VALUES ('2329', '胡温', null);
INSERT INTO `sensitive_word` VALUES ('2330', '胡JT', null);
INSERT INTO `sensitive_word` VALUES ('2331', '胡boss', null);
INSERT INTO `sensitive_word` VALUES ('2332', '江boss', null);
INSERT INTO `sensitive_word` VALUES ('2333', '温boss', null);
INSERT INTO `sensitive_word` VALUES ('2334', '胡总', null);
INSERT INTO `sensitive_word` VALUES ('2335', '江总', null);
INSERT INTO `sensitive_word` VALUES ('2336', '胡王八', null);
INSERT INTO `sensitive_word` VALUES ('2337', '胡派', null);
INSERT INTO `sensitive_word` VALUES ('2338', '温派', null);
INSERT INTO `sensitive_word` VALUES ('2339', '江派', null);
INSERT INTO `sensitive_word` VALUES ('2340', '刘永清', null);
INSERT INTO `sensitive_word` VALUES ('2341', '民泽江', null);
INSERT INTO `sensitive_word` VALUES ('2342', '绵康', null);
INSERT INTO `sensitive_word` VALUES ('2343', '平小邓', null);
INSERT INTO `sensitive_word` VALUES ('2344', '邓晓平', null);
INSERT INTO `sensitive_word` VALUES ('2345', '邓朴方', null);
INSERT INTO `sensitive_word` VALUES ('2346', '邓榕', null);
INSERT INTO `sensitive_word` VALUES ('2347', '邓质方', null);
INSERT INTO `sensitive_word` VALUES ('2348', 'chairmanmao', null);
INSERT INTO `sensitive_word` VALUES ('2349', 'chairmanmaо', null);
INSERT INTO `sensitive_word` VALUES ('2350', '猫贼洞', null);
INSERT INTO `sensitive_word` VALUES ('2351', '毛ZD', null);
INSERT INTO `sensitive_word` VALUES ('2352', '毛ZX', null);
INSERT INTO `sensitive_word` VALUES ('2353', 'Z东', null);
INSERT INTO `sensitive_word` VALUES ('2354', 'ze东', null);
INSERT INTO `sensitive_word` VALUES ('2355', '毛太祖', null);
INSERT INTO `sensitive_word` VALUES ('2356', '毛相', null);
INSERT INTO `sensitive_word` VALUES ('2357', '朱容基', null);
INSERT INTO `sensitive_word` VALUES ('2358', '朱镕鸡', null);
INSERT INTO `sensitive_word` VALUES ('2359', '朱容鸡', null);
INSERT INTO `sensitive_word` VALUES ('2360', '朱云来', null);
INSERT INTO `sensitive_word` VALUES ('2361', '李pen', null);
INSERT INTO `sensitive_word` VALUES ('2362', '李月月鸟', null);
INSERT INTO `sensitive_word` VALUES ('2363', '李小鹏', null);
INSERT INTO `sensitive_word` VALUES ('2364', '李小琳', null);
INSERT INTO `sensitive_word` VALUES ('2365', '华国', null);
INSERT INTO `sensitive_word` VALUES ('2366', '国锋', null);
INSERT INTO `sensitive_word` VALUES ('2367', '国峰', null);
INSERT INTO `sensitive_word` VALUES ('2368', '锋同志', null);
INSERT INTO `sensitive_word` VALUES ('2369', '蔡赴朝', null);
INSERT INTO `sensitive_word` VALUES ('2370', '建国', null);
INSERT INTO `sensitive_word` VALUES ('2371', '陈同海', null);
INSERT INTO `sensitive_word` VALUES ('2372', '傅锐', null);
INSERT INTO `sensitive_word` VALUES ('2373', '贺国强', null);
INSERT INTO `sensitive_word` VALUES ('2374', '胡春华', null);
INSERT INTO `sensitive_word` VALUES ('2375', '黄华华', null);
INSERT INTO `sensitive_word` VALUES ('2376', '黄兴国', null);
INSERT INTO `sensitive_word` VALUES ('2377', '李沛瑶', null);
INSERT INTO `sensitive_word` VALUES ('2378', '栗智', null);
INSERT INTO `sensitive_word` VALUES ('2379', '林炎志', null);
INSERT INTO `sensitive_word` VALUES ('2380', '刘志军', null);
INSERT INTO `sensitive_word` VALUES ('2381', '龙新民', null);
INSERT INTO `sensitive_word` VALUES ('2382', '罗箭', null);
INSERT INTO `sensitive_word` VALUES ('2383', '马恺', null);
INSERT INTO `sensitive_word` VALUES ('2384', '欧广源', null);
INSERT INTO `sensitive_word` VALUES ('2385', '沉跃跃', null);
INSERT INTO `sensitive_word` VALUES ('2386', '屠光绍', null);
INSERT INTO `sensitive_word` VALUES ('2387', '王洛林', null);
INSERT INTO `sensitive_word` VALUES ('2388', '王太华', null);
INSERT INTO `sensitive_word` VALUES ('2389', '王振华', null);
INSERT INTO `sensitive_word` VALUES ('2390', '无官正', null);
INSERT INTO `sensitive_word` VALUES ('2391', '奚国华', null);
INSERT INTO `sensitive_word` VALUES ('2392', '于幼军', null);
INSERT INTO `sensitive_word` VALUES ('2393', '曾宪梓', null);
INSERT INTO `sensitive_word` VALUES ('2394', '曾荫权', null);
INSERT INTO `sensitive_word` VALUES ('2395', '张定发', null);
INSERT INTO `sensitive_word` VALUES ('2396', '朱海仑', null);
INSERT INTO `sensitive_word` VALUES ('2397', '党产共', null);
INSERT INTO `sensitive_word` VALUES ('2398', '共贪党', null);
INSERT INTO `sensitive_word` VALUES ('2399', '阿共', null);
INSERT INTO `sensitive_word` VALUES ('2400', '共一产一党', null);
INSERT INTO `sensitive_word` VALUES ('2401', '产党共', null);
INSERT INTO `sensitive_word` VALUES ('2402', '公产党', null);
INSERT INTO `sensitive_word` VALUES ('2403', '工产党', null);
INSERT INTO `sensitive_word` VALUES ('2404', '共c党', null);
INSERT INTO `sensitive_word` VALUES ('2405', '共铲', null);
INSERT INTO `sensitive_word` VALUES ('2406', '共惨', null);
INSERT INTO `sensitive_word` VALUES ('2407', '供铲', null);
INSERT INTO `sensitive_word` VALUES ('2408', '共残', null);
INSERT INTO `sensitive_word` VALUES ('2409', '拱铲', null);
INSERT INTO `sensitive_word` VALUES ('2410', '中珙', null);
INSERT INTO `sensitive_word` VALUES ('2411', '中gon', null);
INSERT INTO `sensitive_word` VALUES ('2412', 'GC党', null);
INSERT INTO `sensitive_word` VALUES ('2413', '贡挡', null);
INSERT INTO `sensitive_word` VALUES ('2414', 'gong党', null);
INSERT INTO `sensitive_word` VALUES ('2415', 'G产', null);
INSERT INTO `sensitive_word` VALUES ('2416', '狗产', null);
INSERT INTO `sensitive_word` VALUES ('2417', '恶党', null);
INSERT INTO `sensitive_word` VALUES ('2418', '邪党', null);
INSERT INTO `sensitive_word` VALUES ('2419', '土G', null);
INSERT INTO `sensitive_word` VALUES ('2420', '仇共', null);
INSERT INTO `sensitive_word` VALUES ('2421', '症腐', null);
INSERT INTO `sensitive_word` VALUES ('2422', '政腐', null);
INSERT INTO `sensitive_word` VALUES ('2423', '政付', null);
INSERT INTO `sensitive_word` VALUES ('2424', '政俯', null);
INSERT INTO `sensitive_word` VALUES ('2425', '政一府', null);
INSERT INTO `sensitive_word` VALUES ('2426', '政F', null);
INSERT INTO `sensitive_word` VALUES ('2427', 'zhengfu', null);
INSERT INTO `sensitive_word` VALUES ('2428', '政zhi', null);
INSERT INTO `sensitive_word` VALUES ('2429', '国wu院', null);
INSERT INTO `sensitive_word` VALUES ('2430', '国务院', null);
INSERT INTO `sensitive_word` VALUES ('2431', 'gong和', null);
INSERT INTO `sensitive_word` VALUES ('2432', '中华', null);
INSERT INTO `sensitive_word` VALUES ('2433', '帝国', null);
INSERT INTO `sensitive_word` VALUES ('2434', '中日', null);
INSERT INTO `sensitive_word` VALUES ('2435', '后台', null);
INSERT INTO `sensitive_word` VALUES ('2436', '当官', null);
INSERT INTO `sensitive_word` VALUES ('2437', '做官', null);
INSERT INTO `sensitive_word` VALUES ('2438', '中石化', null);
INSERT INTO `sensitive_word` VALUES ('2439', '中石油', null);
INSERT INTO `sensitive_word` VALUES ('2440', '王八', null);
INSERT INTO `sensitive_word` VALUES ('2441', '性运动', null);
INSERT INTO `sensitive_word` VALUES ('2442', '国办发', null);
INSERT INTO `sensitive_word` VALUES ('2443', '中办发', null);
INSERT INTO `sensitive_word` VALUES ('2444', '亡党', null);
INSERT INTO `sensitive_word` VALUES ('2445', '特供', null);
INSERT INTO `sensitive_word` VALUES ('2446', '特贡', null);
INSERT INTO `sensitive_word` VALUES ('2447', '特共', null);
INSERT INTO `sensitive_word` VALUES ('2448', '殃视', null);
INSERT INTO `sensitive_word` VALUES ('2449', '拆除', null);
INSERT INTO `sensitive_word` VALUES ('2450', '贵族', null);
INSERT INTO `sensitive_word` VALUES ('2451', '九学', null);
INSERT INTO `sensitive_word` VALUES ('2452', '四风', null);
INSERT INTO `sensitive_word` VALUES ('2453', '双规', null);
INSERT INTO `sensitive_word` VALUES ('2454', '最淫', null);
INSERT INTO `sensitive_word` VALUES ('2455', '警匪', null);
INSERT INTO `sensitive_word` VALUES ('2456', '官匪', null);
INSERT INTO `sensitive_word` VALUES ('2457', '民贼', null);
INSERT INTO `sensitive_word` VALUES ('2458', '被拆', null);
INSERT INTO `sensitive_word` VALUES ('2459', '拆迁', null);
INSERT INTO `sensitive_word` VALUES ('2460', '毒豺', null);
INSERT INTO `sensitive_word` VALUES ('2461', '一党', null);
INSERT INTO `sensitive_word` VALUES ('2462', '执政', null);
INSERT INTO `sensitive_word` VALUES ('2463', '法院', null);
INSERT INTO `sensitive_word` VALUES ('2464', '苏晓康', null);
INSERT INTO `sensitive_word` VALUES ('2465', '法官', null);
INSERT INTO `sensitive_word` VALUES ('2466', '焦国标', null);
INSERT INTO `sensitive_word` VALUES ('2467', '万润南', null);
INSERT INTO `sensitive_word` VALUES ('2468', '高勤荣', null);
INSERT INTO `sensitive_word` VALUES ('2469', '王炳章', null);
INSERT INTO `sensitive_word` VALUES ('2470', '司马璐', null);
INSERT INTO `sensitive_word` VALUES ('2471', '林昭', null);
INSERT INTO `sensitive_word` VALUES ('2472', '别梦成灰', null);
INSERT INTO `sensitive_word` VALUES ('2473', '启蒙派', null);
INSERT INTO `sensitive_word` VALUES ('2474', '我国', null);
INSERT INTO `sensitive_word` VALUES ('2476', '民一主', null);
INSERT INTO `sensitive_word` VALUES ('2477', 'min主', null);
INSERT INTO `sensitive_word` VALUES ('2478', '民竹', null);
INSERT INTO `sensitive_word` VALUES ('2479', '民珠', null);
INSERT INTO `sensitive_word` VALUES ('2480', '民猪', null);
INSERT INTO `sensitive_word` VALUES ('2481', 'chinesedemocracy', null);
INSERT INTO `sensitive_word` VALUES ('2482', 'chinesedemоcracy', null);
INSERT INTO `sensitive_word` VALUES ('2483', 'da选', null);
INSERT INTO `sensitive_word` VALUES ('2484', '公头', null);
INSERT INTO `sensitive_word` VALUES ('2485', '宪政', null);
INSERT INTO `sensitive_word` VALUES ('2486', '零八宪', null);
INSERT INTO `sensitive_word` VALUES ('2487', '抿主', null);
INSERT INTO `sensitive_word` VALUES ('2488', '人木又', null);
INSERT INTO `sensitive_word` VALUES ('2489', '人quan', null);
INSERT INTO `sensitive_word` VALUES ('2490', 'renquan', null);
INSERT INTO `sensitive_word` VALUES ('2492', '新民党', null);
INSERT INTO `sensitive_word` VALUES ('2493', '讨说法', null);
INSERT INTO `sensitive_word` VALUES ('2494', 'shangfang', null);
INSERT INTO `sensitive_word` VALUES ('2495', '示wei', null);
INSERT INTO `sensitive_word` VALUES ('2496', 'you行', null);
INSERT INTO `sensitive_word` VALUES ('2497', '油行', null);
INSERT INTO `sensitive_word` VALUES ('2498', '亢议', null);
INSERT INTO `sensitive_word` VALUES ('2499', '低制', null);
INSERT INTO `sensitive_word` VALUES ('2500', '底制', null);
INSERT INTO `sensitive_word` VALUES ('2501', '抵zhi', null);
INSERT INTO `sensitive_word` VALUES ('2502', 'dizhi', null);
INSERT INTO `sensitive_word` VALUES ('2503', 'dǐ zhì', null);
INSERT INTO `sensitive_word` VALUES ('2504', 'boycott', null);
INSERT INTO `sensitive_word` VALUES ('2505', 'bоycott', null);
INSERT INTO `sensitive_word` VALUES ('2506', 'baoluan', null);
INSERT INTO `sensitive_word` VALUES ('2507', '流血', null);
INSERT INTO `sensitive_word` VALUES ('2508', '暴动', null);
INSERT INTO `sensitive_word` VALUES ('2509', 'baodon', null);
INSERT INTO `sensitive_word` VALUES ('2510', '灭共', null);
INSERT INTO `sensitive_word` VALUES ('2511', 'jie严', null);
INSERT INTO `sensitive_word` VALUES ('2512', '戒yan', null);
INSERT INTO `sensitive_word` VALUES ('2513', '贰拾年', null);
INSERT INTO `sensitive_word` VALUES ('2514', '六河蟹四', null);
INSERT INTO `sensitive_word` VALUES ('2515', '六百度四', null);
INSERT INTO `sensitive_word` VALUES ('2516', '六和谐四', null);
INSERT INTO `sensitive_word` VALUES ('2517', '陆四', null);
INSERT INTO `sensitive_word` VALUES ('2518', '陆肆', null);
INSERT INTO `sensitive_word` VALUES ('2519', '产案', null);
INSERT INTO `sensitive_word` VALUES ('2520', '学chao', null);
INSERT INTO `sensitive_word` VALUES ('2521', 'xuechao', null);
INSERT INTO `sensitive_word` VALUES ('2522', '学百度潮', null);
INSERT INTO `sensitive_word` VALUES ('2523', '门安天', null);
INSERT INTO `sensitive_word` VALUES ('2524', '天按门', null);
INSERT INTO `sensitive_word` VALUES ('2525', '压大学生', null);
INSERT INTO `sensitive_word` VALUES ('2526', '高自联', null);
INSERT INTO `sensitive_word` VALUES ('2527', '北高联', null);
INSERT INTO `sensitive_word` VALUES ('2528', '维多利亚公园', null);
INSERT INTO `sensitive_word` VALUES ('2529', 'bloodisonthesquare', null);
INSERT INTO `sensitive_word` VALUES ('2530', 'blоodisonthesquare', null);
INSERT INTO `sensitive_word` VALUES ('2531', '柴玲', null);
INSERT INTO `sensitive_word` VALUES ('2532', '沉彤', null);
INSERT INTO `sensitive_word` VALUES ('2533', '封从德', null);
INSERT INTO `sensitive_word` VALUES ('2534', '王超华', null);
INSERT INTO `sensitive_word` VALUES ('2535', '侯德健', null);
INSERT INTO `sensitive_word` VALUES ('2536', '阎明复', null);
INSERT INTO `sensitive_word` VALUES ('2537', '方励之', null);
INSERT INTO `sensitive_word` VALUES ('2538', '蒋捷连', null);
INSERT INTO `sensitive_word` VALUES ('2539', '陈一咨', null);
INSERT INTO `sensitive_word` VALUES ('2540', '卖国', null);
INSERT INTO `sensitive_word` VALUES ('2541', '步qian', null);
INSERT INTO `sensitive_word` VALUES ('2542', 'bao炸', null);
INSERT INTO `sensitive_word` VALUES ('2543', '爆zha', null);
INSERT INTO `sensitive_word` VALUES ('2544', 'zha药', null);
INSERT INTO `sensitive_word` VALUES ('2545', 'zha弹', null);
INSERT INTO `sensitive_word` VALUES ('2546', '炸dan', null);
INSERT INTO `sensitive_word` VALUES ('2547', '炸yao', null);
INSERT INTO `sensitive_word` VALUES ('2550', 'hmtd', null);
INSERT INTO `sensitive_word` VALUES ('2551', '六氟化铀', null);
INSERT INTO `sensitive_word` VALUES ('2552', '兵力部署', null);
INSERT INTO `sensitive_word` VALUES ('2553', '军转', null);
INSERT INTO `sensitive_word` VALUES ('2554', '军事社', null);
INSERT INTO `sensitive_word` VALUES ('2555', '军区', null);
INSERT INTO `sensitive_word` VALUES ('2556', '塔利班', null);
INSERT INTO `sensitive_word` VALUES ('2557', '屠华', null);
INSERT INTO `sensitive_word` VALUES ('2558', '蒋公', null);
INSERT INTO `sensitive_word` VALUES ('2559', '蒋介石', null);
INSERT INTO `sensitive_word` VALUES ('2560', 'mayingjiu', null);
INSERT INTO `sensitive_word` VALUES ('2561', '李天羽', null);
INSERT INTO `sensitive_word` VALUES ('2562', '苏贞昌', null);
INSERT INTO `sensitive_word` VALUES ('2563', '陈S扁', null);
INSERT INTO `sensitive_word` VALUES ('2564', '陈随便', null);
INSERT INTO `sensitive_word` VALUES ('2565', 'A扁', null);
INSERT INTO `sensitive_word` VALUES ('2566', '台完', null);
INSERT INTO `sensitive_word` VALUES ('2567', '台wan', null);
INSERT INTO `sensitive_word` VALUES ('2568', 'taiwan', null);
INSERT INTO `sensitive_word` VALUES ('2569', '台弯', null);
INSERT INTO `sensitive_word` VALUES ('2570', '台军', null);
INSERT INTO `sensitive_word` VALUES ('2571', '台毒', null);
INSERT INTO `sensitive_word` VALUES ('2572', '台du', null);
INSERT INTO `sensitive_word` VALUES ('2574', '光复', null);
INSERT INTO `sensitive_word` VALUES ('2575', '民进党', null);
INSERT INTO `sensitive_word` VALUES ('2576', 'X民党', null);
INSERT INTO `sensitive_word` VALUES ('2578', '李愚蠢', null);
INSERT INTO `sensitive_word` VALUES ('2579', '贱人', null);
INSERT INTO `sensitive_word` VALUES ('2580', '傻帽', null);
INSERT INTO `sensitive_word` VALUES ('2581', '煞逼', null);
INSERT INTO `sensitive_word` VALUES ('2582', '刹笔', null);
INSERT INTO `sensitive_word` VALUES ('2583', '傻比', null);
INSERT INTO `sensitive_word` VALUES ('2584', '婊子', null);
INSERT INTO `sensitive_word` VALUES ('2585', '我日', null);
INSERT INTO `sensitive_word` VALUES ('2586', '日你', null);
INSERT INTO `sensitive_word` VALUES ('2587', '我操', null);
INSERT INTO `sensitive_word` VALUES ('2588', '我草', null);
INSERT INTO `sensitive_word` VALUES ('2589', '卧艹', null);
INSERT INTO `sensitive_word` VALUES ('2590', '我艹', null);
INSERT INTO `sensitive_word` VALUES ('2591', '爆你菊', null);
INSERT INTO `sensitive_word` VALUES ('2592', '艹你', null);
INSERT INTO `sensitive_word` VALUES ('2593', 'cao你', null);
INSERT INTO `sensitive_word` VALUES ('2594', '他妈', null);
INSERT INTO `sensitive_word` VALUES ('2595', '别他吗', null);
INSERT INTO `sensitive_word` VALUES ('2596', '操他', null);
INSERT INTO `sensitive_word` VALUES ('2597', '操你', null);
INSERT INTO `sensitive_word` VALUES ('2598', '操她', null);
INSERT INTO `sensitive_word` VALUES ('2599', '娘西皮', null);
INSERT INTO `sensitive_word` VALUES ('2600', '狗操', null);
INSERT INTO `sensitive_word` VALUES ('2601', '狗草', null);
INSERT INTO `sensitive_word` VALUES ('2602', '狗日', null);
INSERT INTO `sensitive_word` VALUES ('2603', '狗娘', null);
INSERT INTO `sensitive_word` VALUES ('2604', '贱比', null);
INSERT INTO `sensitive_word` VALUES ('2605', '贱B', null);
INSERT INTO `sensitive_word` VALUES ('2606', '死光', null);
INSERT INTO `sensitive_word` VALUES ('2607', '不得好死', null);
INSERT INTO `sensitive_word` VALUES ('2608', '死绝', null);
INSERT INTO `sensitive_word` VALUES ('2609', '汉人', null);
INSERT INTO `sensitive_word` VALUES ('2610', '热比娅', null);
INSERT INTO `sensitive_word` VALUES ('2611', '伊力哈木', null);
INSERT INTO `sensitive_word` VALUES ('2612', '疆独', null);
INSERT INTO `sensitive_word` VALUES ('2613', '臧人', null);
INSERT INTO `sensitive_word` VALUES ('2614', 'zang人', null);
INSERT INTO `sensitive_word` VALUES ('2615', '藏M', null);
INSERT INTO `sensitive_word` VALUES ('2616', '赖达', null);
INSERT INTO `sensitive_word` VALUES ('2617', 'dalai', null);
INSERT INTO `sensitive_word` VALUES ('2618', '哒赖', null);
INSERT INTO `sensitive_word` VALUES ('2619', '刺嘛', null);
INSERT INTO `sensitive_word` VALUES ('2620', '丹增嘉措', null);
INSERT INTO `sensitive_word` VALUES ('2621', '打砸', null);
INSERT INTO `sensitive_word` VALUES ('2622', '葬独', null);
INSERT INTO `sensitive_word` VALUES ('2623', '臧独', null);
INSERT INTO `sensitive_word` VALUES ('2624', '藏毒', null);
INSERT INTO `sensitive_word` VALUES ('2625', '藏du', null);
INSERT INTO `sensitive_word` VALUES ('2626', 'zangdu', null);
INSERT INTO `sensitive_word` VALUES ('2627', '支持ZD', null);
INSERT INTO `sensitive_word` VALUES ('2628', '藏青会', null);
INSERT INTO `sensitive_word` VALUES ('2629', '啦萨', null);
INSERT INTO `sensitive_word` VALUES ('2630', '啦沙', null);
INSERT INTO `sensitive_word` VALUES ('2631', 'la萨', null);
INSERT INTO `sensitive_word` VALUES ('2632', 'X藏', null);
INSERT INTO `sensitive_word` VALUES ('2633', '西Z', null);
INSERT INTO `sensitive_word` VALUES ('2634', '希葬', null);
INSERT INTO `sensitive_word` VALUES ('2635', '希藏', null);
INSERT INTO `sensitive_word` VALUES ('2636', '硒藏', null);
INSERT INTO `sensitive_word` VALUES ('2637', '稀藏', null);
INSERT INTO `sensitive_word` VALUES ('2638', '西脏', null);
INSERT INTO `sensitive_word` VALUES ('2639', '西奘', null);
INSERT INTO `sensitive_word` VALUES ('2640', '西葬', null);
INSERT INTO `sensitive_word` VALUES ('2641', '西臧', null);
INSERT INTO `sensitive_word` VALUES ('2642', '安拉', null);
INSERT INTO `sensitive_word` VALUES ('2643', '回回', null);
INSERT INTO `sensitive_word` VALUES ('2644', '默罕默德', null);
INSERT INTO `sensitive_word` VALUES ('2645', '清zhen', null);
INSERT INTO `sensitive_word` VALUES ('2646', 'qingzhen', null);
INSERT INTO `sensitive_word` VALUES ('2647', '满洲', null);
INSERT INTO `sensitive_word` VALUES ('2648', '满狗', null);
INSERT INTO `sensitive_word` VALUES ('2649', '鞑子', null);
INSERT INTO `sensitive_word` VALUES ('2650', '贱货', null);
INSERT INTO `sensitive_word` VALUES ('2651', '溷蛋', null);
INSERT INTO `sensitive_word` VALUES ('2652', '诱奸', null);
INSERT INTO `sensitive_word` VALUES ('2653', '干死', null);
INSERT INTO `sensitive_word` VALUES ('2654', '泼妇', null);
INSERT INTO `sensitive_word` VALUES ('2655', '国进民退', null);
INSERT INTO `sensitive_word` VALUES ('2656', '我干', null);
INSERT INTO `sensitive_word` VALUES ('2657', '屌', null);
INSERT INTO `sensitive_word` VALUES ('2659', '凶杀', null);
INSERT INTO `sensitive_word` VALUES ('2660', '操蛋', null);
INSERT INTO `sensitive_word` VALUES ('2661', '庶民', null);
INSERT INTO `sensitive_word` VALUES ('2662', '郑培民', null);
INSERT INTO `sensitive_word` VALUES ('2663', '一国两制', null);
INSERT INTO `sensitive_word` VALUES ('2664', '政变', null);
INSERT INTO `sensitive_word` VALUES ('2665', '嫩B', null);
INSERT INTO `sensitive_word` VALUES ('2666', '沃尔凯西', null);
INSERT INTO `sensitive_word` VALUES ('2667', '沃尔开西', null);
INSERT INTO `sensitive_word` VALUES ('2668', '性吧', null);
INSERT INTO `sensitive_word` VALUES ('2669', 'X网', null);
INSERT INTO `sensitive_word` VALUES ('2670', '阮柔安', null);
INSERT INTO `sensitive_word` VALUES ('2671', '刘芳菲', null);
INSERT INTO `sensitive_word` VALUES ('2672', '跳蛋', null);
INSERT INTO `sensitive_word` VALUES ('2673', '李苑苑', null);
INSERT INTO `sensitive_word` VALUES ('2674', '私拍', null);
INSERT INTO `sensitive_word` VALUES ('2675', '私照', null);
INSERT INTO `sensitive_word` VALUES ('2676', '邓丽欣', null);
INSERT INTO `sensitive_word` VALUES ('2677', '草榴', null);
INSERT INTO `sensitive_word` VALUES ('2678', '防民之口', null);
INSERT INTO `sensitive_word` VALUES ('2679', '胡佳', null);
INSERT INTO `sensitive_word` VALUES ('2680', '鲍彤', null);
INSERT INTO `sensitive_word` VALUES ('2681', '工商局', null);
INSERT INTO `sensitive_word` VALUES ('2682', '税务局', null);
INSERT INTO `sensitive_word` VALUES ('2683', '黑医院', null);
INSERT INTO `sensitive_word` VALUES ('2684', '检院', null);
INSERT INTO `sensitive_word` VALUES ('2685', '检察院', null);
INSERT INTO `sensitive_word` VALUES ('2686', '教育局', null);
INSERT INTO `sensitive_word` VALUES ('2687', '卫生局', null);
INSERT INTO `sensitive_word` VALUES ('2688', '卫生部', null);
INSERT INTO `sensitive_word` VALUES ('2689', '人事局', null);
INSERT INTO `sensitive_word` VALUES ('2690', '人事部', null);
INSERT INTO `sensitive_word` VALUES ('2691', '卫生院', null);
INSERT INTO `sensitive_word` VALUES ('2692', '血屠', null);
INSERT INTO `sensitive_word` VALUES ('2693', '民警', null);
INSERT INTO `sensitive_word` VALUES ('2694', '胡政', null);
INSERT INTO `sensitive_word` VALUES ('2695', '温政', null);
INSERT INTO `sensitive_word` VALUES ('2696', '江政', null);
INSERT INTO `sensitive_word` VALUES ('2697', '胡氏', null);
INSERT INTO `sensitive_word` VALUES ('2698', '温氏', null);
INSERT INTO `sensitive_word` VALUES ('2699', '精佑', null);
INSERT INTO `sensitive_word` VALUES ('2700', '燕琼', null);
INSERT INTO `sensitive_word` VALUES ('2701', '华英', null);
INSERT INTO `sensitive_word` VALUES ('2702', '福建三网友', null);
INSERT INTO `sensitive_word` VALUES ('2703', '福建三网民', null);
INSERT INTO `sensitive_word` VALUES ('2704', '福州三网友', null);
INSERT INTO `sensitive_word` VALUES ('2705', '福州三网民', null);
INSERT INTO `sensitive_word` VALUES ('2706', '九局', null);
INSERT INTO `sensitive_word` VALUES ('2707', '长彭波', null);
INSERT INTO `sensitive_word` VALUES ('2708', '国新办', null);
INSERT INTO `sensitive_word` VALUES ('2709', '新闻局', null);
INSERT INTO `sensitive_word` VALUES ('2710', '网络局', null);
INSERT INTO `sensitive_word` VALUES ('2711', '裸照', null);
INSERT INTO `sensitive_word` VALUES ('2712', '伍皓', null);
INSERT INTO `sensitive_word` VALUES ('2713', '特价', null);
INSERT INTO `sensitive_word` VALUES ('2714', '泰兴', null);
INSERT INTO `sensitive_word` VALUES ('2715', '粉笔狐', null);
INSERT INTO `sensitive_word` VALUES ('2716', '毛左', null);
INSERT INTO `sensitive_word` VALUES ('2717', '交而不泄', null);
INSERT INTO `sensitive_word` VALUES ('2718', '先肾后心', null);
INSERT INTO `sensitive_word` VALUES ('2719', '九浅一深', null);
INSERT INTO `sensitive_word` VALUES ('2720', 'BlowJob', null);
INSERT INTO `sensitive_word` VALUES ('2721', 'BlоwJob', null);
INSERT INTO `sensitive_word` VALUES ('2722', '姦淫', null);
INSERT INTO `sensitive_word` VALUES ('2723', '屄缝', null);
INSERT INTO `sensitive_word` VALUES ('2724', '师母', null);
INSERT INTO `sensitive_word` VALUES ('2725', '慕男症', null);
INSERT INTO `sensitive_word` VALUES ('2726', '情欲结', null);
INSERT INTO `sensitive_word` VALUES ('2727', '上下其手', null);
INSERT INTO `sensitive_word` VALUES ('2728', '手淫', null);
INSERT INTO `sensitive_word` VALUES ('2733', '爱抚', null);
INSERT INTO `sensitive_word` VALUES ('2734', '爱女', null);
INSERT INTO `sensitive_word` VALUES ('2735', '爱慰', null);
INSERT INTO `sensitive_word` VALUES ('2736', '爱欲', null);
INSERT INTO `sensitive_word` VALUES ('2737', '安全期', null);
INSERT INTO `sensitive_word` VALUES ('2738', '按揉', null);
INSERT INTO `sensitive_word` VALUES ('2739', '按柔', null);
INSERT INTO `sensitive_word` VALUES ('2740', '白带', null);
INSERT INTO `sensitive_word` VALUES ('2741', '白浊', null);
INSERT INTO `sensitive_word` VALUES ('2742', '恋童', null);
INSERT INTO `sensitive_word` VALUES ('2743', '马长庆', null);
INSERT INTO `sensitive_word` VALUES ('2744', '马志伟', null);
INSERT INTO `sensitive_word` VALUES ('2745', '王亚保', null);
INSERT INTO `sensitive_word` VALUES ('2746', '王光谦', null);
INSERT INTO `sensitive_word` VALUES ('2747', '王先琼', null);
INSERT INTO `sensitive_word` VALUES ('2748', '王众孚', null);
INSERT INTO `sensitive_word` VALUES ('2749', '王宇田', null);
INSERT INTO `sensitive_word` VALUES ('2750', '王林旭', null);
INSERT INTO `sensitive_word` VALUES ('2751', '王明明', null);
INSERT INTO `sensitive_word` VALUES ('2752', '王金祥', null);
INSERT INTO `sensitive_word` VALUES ('2753', '王健林', null);
INSERT INTO `sensitive_word` VALUES ('2754', '王梅祥', null);
INSERT INTO `sensitive_word` VALUES ('2755', '王新陆', null);
INSERT INTO `sensitive_word` VALUES ('2756', '王新奎', null);
INSERT INTO `sensitive_word` VALUES ('2757', '方兆本', null);
INSERT INTO `sensitive_word` VALUES ('2758', '艾努瓦尔', null);
INSERT INTO `sensitive_word` VALUES ('2759', '左焕琛', null);
INSERT INTO `sensitive_word` VALUES ('2760', '孔小均', null);
INSERT INTO `sensitive_word` VALUES ('2761', '厉以宁', null);
INSERT INTO `sensitive_word` VALUES ('2762', '石耀霖', null);
INSERT INTO `sensitive_word` VALUES ('2763', '卢志强', null);
INSERT INTO `sensitive_word` VALUES ('2764', '卢晓钟', null);
INSERT INTO `sensitive_word` VALUES ('2765', '叶小钢', null);
INSERT INTO `sensitive_word` VALUES ('2766', '田刚', null);
INSERT INTO `sensitive_word` VALUES ('2767', '田岚', null);
INSERT INTO `sensitive_word` VALUES ('2768', '田静', null);
INSERT INTO `sensitive_word` VALUES ('2769', '田震', null);
INSERT INTO `sensitive_word` VALUES ('2770', '田中群', null);
INSERT INTO `sensitive_word` VALUES ('2771', '田聪明', null);
INSERT INTO `sensitive_word` VALUES ('2772', '包俊臣', null);
INSERT INTO `sensitive_word` VALUES ('2773', '冯巩', null);
INSERT INTO `sensitive_word` VALUES ('2774', '冯明光', null);
INSERT INTO `sensitive_word` VALUES ('2775', '冯培恩', null);
INSERT INTO `sensitive_word` VALUES ('2776', '冯骥才', null);
INSERT INTO `sensitive_word` VALUES ('2777', '宁崇瑞', null);
INSERT INTO `sensitive_word` VALUES ('2778', '朱孝清', null);
INSERT INTO `sensitive_word` VALUES ('2779', '朱作言', null);
INSERT INTO `sensitive_word` VALUES ('2780', '朱祖良', null);
INSERT INTO `sensitive_word` VALUES ('2781', '朱维群', null);
INSERT INTO `sensitive_word` VALUES ('2782', '伍淑清', null);
INSERT INTO `sensitive_word` VALUES ('2783', '全哲洙', null);
INSERT INTO `sensitive_word` VALUES ('2784', '刘凡', null);
INSERT INTO `sensitive_word` VALUES ('2785', '刘长铭', null);
INSERT INTO `sensitive_word` VALUES ('2786', '刘古昌', null);
INSERT INTO `sensitive_word` VALUES ('2787', '刘汉元', null);
INSERT INTO `sensitive_word` VALUES ('2788', '刘汉铨', null);
INSERT INTO `sensitive_word` VALUES ('2789', '刘晓庄', null);
INSERT INTO `sensitive_word` VALUES ('2790', '刘光复', null);
INSERT INTO `sensitive_word` VALUES ('2791', '刘亦铭', null);
INSERT INTO `sensitive_word` VALUES ('2792', '刘志峰', null);
INSERT INTO `sensitive_word` VALUES ('2793', '刘迎龙', null);
INSERT INTO `sensitive_word` VALUES ('2794', '刘应明', null);
INSERT INTO `sensitive_word` VALUES ('2795', '刘泽彭', null);
INSERT INTO `sensitive_word` VALUES ('2796', '刘柏年', null);
INSERT INTO `sensitive_word` VALUES ('2797', '刘峰岩', null);
INSERT INTO `sensitive_word` VALUES ('2798', '刘淑莹', null);
INSERT INTO `sensitive_word` VALUES ('2799', '刘新文', null);
INSERT INTO `sensitive_word` VALUES ('2800', '刘慕仁', null);
INSERT INTO `sensitive_word` VALUES ('2801', '齐让', null);
INSERT INTO `sensitive_word` VALUES ('2802', '许仕仁', null);
INSERT INTO `sensitive_word` VALUES ('2803', '许志功', null);
INSERT INTO `sensitive_word` VALUES ('2804', '许京君', null);
INSERT INTO `sensitive_word` VALUES ('2805', '孙淦', null);
INSERT INTO `sensitive_word` VALUES ('2806', '孙永福', null);
INSERT INTO `sensitive_word` VALUES ('2807', '孙晓郁', null);
INSERT INTO `sensitive_word` VALUES ('2808', '玉素甫', null);
INSERT INTO `sensitive_word` VALUES ('2809', '苏士澍', null);
INSERT INTO `sensitive_word` VALUES ('2810', '李冰', null);
INSERT INTO `sensitive_word` VALUES ('2811', '李宏', null);
INSERT INTO `sensitive_word` VALUES ('2812', '李明', null);
INSERT INTO `sensitive_word` VALUES ('2813', '李羚', null);
INSERT INTO `sensitive_word` VALUES ('2814', '李崴', null);
INSERT INTO `sensitive_word` VALUES ('2815', '李谠', null);
INSERT INTO `sensitive_word` VALUES ('2816', '李世济', null);
INSERT INTO `sensitive_word` VALUES ('2817', '李庆云', null);
INSERT INTO `sensitive_word` VALUES ('2818', '李君如', null);
INSERT INTO `sensitive_word` VALUES ('2819', '李卓彬', null);
INSERT INTO `sensitive_word` VALUES ('2820', '李昌鉴', null);
INSERT INTO `sensitive_word` VALUES ('2821', '李泽钜', null);
INSERT INTO `sensitive_word` VALUES ('2822', '李承淑', null);
INSERT INTO `sensitive_word` VALUES ('2823', '李铁林', null);
INSERT INTO `sensitive_word` VALUES ('2824', '李德洙', null);
INSERT INTO `sensitive_word` VALUES ('2825', '李德强', null);
INSERT INTO `sensitive_word` VALUES ('2826', '杨岐', null);
INSERT INTO `sensitive_word` VALUES ('2827', '杨健', null);
INSERT INTO `sensitive_word` VALUES ('2828', '杨孙西', null);
INSERT INTO `sensitive_word` VALUES ('2829', '杨春兴', null);
INSERT INTO `sensitive_word` VALUES ('2830', '杨俊文', null);
INSERT INTO `sensitive_word` VALUES ('2831', '杨健强', null);
INSERT INTO `sensitive_word` VALUES ('2832', '杨维刚', null);
INSERT INTO `sensitive_word` VALUES ('2833', '杨焱平', null);
INSERT INTO `sensitive_word` VALUES ('2834', '吴玉谦', null);
INSERT INTO `sensitive_word` VALUES ('2835', '吴正德', null);
INSERT INTO `sensitive_word` VALUES ('2836', '吴光正', null);
INSERT INTO `sensitive_word` VALUES ('2837', '吴祖强', null);
INSERT INTO `sensitive_word` VALUES ('2838', '吴嘉甫', null);
INSERT INTO `sensitive_word` VALUES ('2839', '吴蔚然', null);
INSERT INTO `sensitive_word` VALUES ('2840', '邱衍汉', null);
INSERT INTO `sensitive_word` VALUES ('2841', '何维', null);
INSERT INTO `sensitive_word` VALUES ('2842', '何丕洁', null);
INSERT INTO `sensitive_word` VALUES ('2843', '何光', null);
INSERT INTO `sensitive_word` VALUES ('2844', '何鸿燊', null);
INSERT INTO `sensitive_word` VALUES ('2845', '闵乃本', null);
INSERT INTO `sensitive_word` VALUES ('2846', '沈文庆', null);
INSERT INTO `sensitive_word` VALUES ('2847', '沈滨义', null);
INSERT INTO `sensitive_word` VALUES ('2848', '张平', null);
INSERT INTO `sensitive_word` VALUES ('2849', '张帆', null);
INSERT INTO `sensitive_word` VALUES ('2850', '张健', null);
INSERT INTO `sensitive_word` VALUES ('2851', '张海', null);
INSERT INTO `sensitive_word` VALUES ('2852', '张大方', null);
INSERT INTO `sensitive_word` VALUES ('2853', '张大宁', null);
INSERT INTO `sensitive_word` VALUES ('2854', '张文康', null);
INSERT INTO `sensitive_word` VALUES ('2855', '张龙之', null);
INSERT INTO `sensitive_word` VALUES ('2856', '张圣坤', null);
INSERT INTO `sensitive_word` VALUES ('2857', '张来斌', null);
INSERT INTO `sensitive_word` VALUES ('2858', '张泽熙', null);
INSERT INTO `sensitive_word` VALUES ('2859', '张承芬', null);
INSERT INTO `sensitive_word` VALUES ('2860', '张俊九', null);
INSERT INTO `sensitive_word` VALUES ('2861', '张桃林', null);
INSERT INTO `sensitive_word` VALUES ('2862', '张海迪', null);
INSERT INTO `sensitive_word` VALUES ('2863', '张道宏', null);
INSERT INTO `sensitive_word` VALUES ('2864', '张福森', null);
INSERT INTO `sensitive_word` VALUES ('2865', '阿什老轨', null);
INSERT INTO `sensitive_word` VALUES ('2866', '陈君', null);
INSERT INTO `sensitive_word` VALUES ('2867', '陈杰', null);
INSERT INTO `sensitive_word` VALUES ('2868', '陈旗', null);
INSERT INTO `sensitive_word` VALUES ('2869', '陈广元', null);
INSERT INTO `sensitive_word` VALUES ('2870', '陈云林', null);
INSERT INTO `sensitive_word` VALUES ('2871', '陈永棋', null);
INSERT INTO `sensitive_word` VALUES ('2872', '陈传阔', null);
INSERT INTO `sensitive_word` VALUES ('2873', '陈自力', null);
INSERT INTO `sensitive_word` VALUES ('2874', '陈进玉', null);
INSERT INTO `sensitive_word` VALUES ('2875', '陈佐洱', null);
INSERT INTO `sensitive_word` VALUES ('2876', '陈昊苏', null);
INSERT INTO `sensitive_word` VALUES ('2877', '陈明德', null);
INSERT INTO `sensitive_word` VALUES ('2878', '陈绍君', null);
INSERT INTO `sensitive_word` VALUES ('2879', '陈勋儒', null);
INSERT INTO `sensitive_word` VALUES ('2880', '陈凌孚', null);
INSERT INTO `sensitive_word` VALUES ('2881', '陈章良', null);
INSERT INTO `sensitive_word` VALUES ('2882', '陈清华', null);
INSERT INTO `sensitive_word` VALUES ('2883', '陈福今', null);
INSERT INTO `sensitive_word` VALUES ('2884', '邵鸿', null);
INSERT INTO `sensitive_word` VALUES ('2885', '武大伟', null);
INSERT INTO `sensitive_word` VALUES ('2886', '武四海', null);
INSERT INTO `sensitive_word` VALUES ('2887', '林而达', null);
INSERT INTO `sensitive_word` VALUES ('2888', '林兆枢', null);
INSERT INTO `sensitive_word` VALUES ('2889', '欧阳明高', null);
INSERT INTO `sensitive_word` VALUES ('2890', '欧阳淞', null);
INSERT INTO `sensitive_word` VALUES ('2891', '周文重', null);
INSERT INTO `sensitive_word` VALUES ('2892', '周汉民', null);
INSERT INTO `sensitive_word` VALUES ('2893', '周健民', null);
INSERT INTO `sensitive_word` VALUES ('2894', '周遇奇', null);
INSERT INTO `sensitive_word` VALUES ('2895', '郑小燕', null);
INSERT INTO `sensitive_word` VALUES ('2896', '郑兰荪', null);
INSERT INTO `sensitive_word` VALUES ('2897', '郑君里', null);
INSERT INTO `sensitive_word` VALUES ('2898', '郑建邦', null);
INSERT INTO `sensitive_word` VALUES ('2899', '郑祖康', null);
INSERT INTO `sensitive_word` VALUES ('2900', '郑家纯', null);
INSERT INTO `sensitive_word` VALUES ('2901', '郑惠强', null);
INSERT INTO `sensitive_word` VALUES ('2902', '郑楚平', null);
INSERT INTO `sensitive_word` VALUES ('2903', '郑楚光', null);
INSERT INTO `sensitive_word` VALUES ('2904', '学诚', null);
INSERT INTO `sensitive_word` VALUES ('2905', '赵龙', null);
INSERT INTO `sensitive_word` VALUES ('2906', '赵俊', null);
INSERT INTO `sensitive_word` VALUES ('2907', '赵化勇', null);
INSERT INTO `sensitive_word` VALUES ('2908', '赵启正', null);
INSERT INTO `sensitive_word` VALUES ('2909', '赵雨森', null);
INSERT INTO `sensitive_word` VALUES ('2910', '赵晓勇', null);
INSERT INTO `sensitive_word` VALUES ('2911', '钮小明', null);
INSERT INTO `sensitive_word` VALUES ('2912', '段成桂', null);
INSERT INTO `sensitive_word` VALUES ('2913', '俞海潮', null);
INSERT INTO `sensitive_word` VALUES ('2914', '洪祖杭', null);
INSERT INTO `sensitive_word` VALUES ('2915', '姚志彬', null);
INSERT INTO `sensitive_word` VALUES ('2916', '秦大河', null);
INSERT INTO `sensitive_word` VALUES ('2917', '土登克珠', null);
INSERT INTO `sensitive_word` VALUES ('2918', '袁汉民', null);
INSERT INTO `sensitive_word` VALUES ('2919', '袁祖亮', null);
INSERT INTO `sensitive_word` VALUES ('2920', '袁隆平', null);
INSERT INTO `sensitive_word` VALUES ('2921', '袁熙坤', null);
INSERT INTO `sensitive_word` VALUES ('2922', '夏涛', null);
INSERT INTO `sensitive_word` VALUES ('2923', '夏培度', null);
INSERT INTO `sensitive_word` VALUES ('2924', '顾秉林', null);
INSERT INTO `sensitive_word` VALUES ('2925', '柴松岳', null);
INSERT INTO `sensitive_word` VALUES ('2926', '钱克明', null);
INSERT INTO `sensitive_word` VALUES ('2927', '徐泽', null);
INSERT INTO `sensitive_word` VALUES ('2928', '徐辉', null);
INSERT INTO `sensitive_word` VALUES ('2929', '徐振寰', null);
INSERT INTO `sensitive_word` VALUES ('2930', '徐展堂', null);
INSERT INTO `sensitive_word` VALUES ('2931', '栾恩杰', null);
INSERT INTO `sensitive_word` VALUES ('2932', '高小玫', null);
INSERT INTO `sensitive_word` VALUES ('2933', '高中兴', null);
INSERT INTO `sensitive_word` VALUES ('2934', '高体健', null);
INSERT INTO `sensitive_word` VALUES ('2935', '高俊良', null);
INSERT INTO `sensitive_word` VALUES ('2936', '郭炳湘', null);
INSERT INTO `sensitive_word` VALUES ('2937', '陶建幸', null);
INSERT INTO `sensitive_word` VALUES ('2938', '多吉帕姆', null);
INSERT INTO `sensitive_word` VALUES ('2939', '德庆曲珍', null);
INSERT INTO `sensitive_word` VALUES ('2940', '黄代放', null);
INSERT INTO `sensitive_word` VALUES ('2941', '黄格胜', null);
INSERT INTO `sensitive_word` VALUES ('2942', '曹亚', null);
INSERT INTO `sensitive_word` VALUES ('2943', '曹毅', null);
INSERT INTO `sensitive_word` VALUES ('2944', '曹小红', null);
INSERT INTO `sensitive_word` VALUES ('2945', '龚世萍', null);
INSERT INTO `sensitive_word` VALUES ('2946', '龚惠兴', null);
INSERT INTO `sensitive_word` VALUES ('2947', '康耀红', null);
INSERT INTO `sensitive_word` VALUES ('2948', '章祥荪', null);
INSERT INTO `sensitive_word` VALUES ('2949', '梁金泉', null);
INSERT INTO `sensitive_word` VALUES ('2950', '梁振英', null);
INSERT INTO `sensitive_word` VALUES ('2951', '葛东升', null);
INSERT INTO `sensitive_word` VALUES ('2952', '葛剑平', null);
INSERT INTO `sensitive_word` VALUES ('2953', '葛剑雄', null);
INSERT INTO `sensitive_word` VALUES ('2954', '董恒宇', null);
INSERT INTO `sensitive_word` VALUES ('2955', '董新光', null);
INSERT INTO `sensitive_word` VALUES ('2956', '韩忠朝', null);
INSERT INTO `sensitive_word` VALUES ('2957', '韩美林', null);
INSERT INTO `sensitive_word` VALUES ('2958', '覃志刚', null);
INSERT INTO `sensitive_word` VALUES ('2959', '程世峨', null);
INSERT INTO `sensitive_word` VALUES ('2960', '程崇庆', null);
INSERT INTO `sensitive_word` VALUES ('2961', '傅先伟', null);
INSERT INTO `sensitive_word` VALUES ('2962', '傅惠民', null);
INSERT INTO `sensitive_word` VALUES ('2963', '靳尚谊', null);
INSERT INTO `sensitive_word` VALUES ('2964', '蒙进喜', null);
INSERT INTO `sensitive_word` VALUES ('2965', '赖明', null);
INSERT INTO `sensitive_word` VALUES ('2966', '雷蕾', null);
INSERT INTO `sensitive_word` VALUES ('2967', '蔡威', null);
INSERT INTO `sensitive_word` VALUES ('2968', '蔡达峰', null);
INSERT INTO `sensitive_word` VALUES ('2969', '廖泽云', null);
INSERT INTO `sensitive_word` VALUES ('2970', '黎桂康', null);
INSERT INTO `sensitive_word` VALUES ('2971', '德哇仓', null);
INSERT INTO `sensitive_word` VALUES ('2972', '滕文生', null);
INSERT INTO `sensitive_word` VALUES ('2973', '霍达', null);
INSERT INTO `sensitive_word` VALUES ('2974', '磨长英', null);
INSERT INTO `sensitive_word` VALUES ('2975', '戴德丰', null);
INSERT INTO `sensitive_word` VALUES ('2976', '干以胜', null);
INSERT INTO `sensitive_word` VALUES ('2977', '张毅', null);
INSERT INTO `sensitive_word` VALUES ('2978', '黄树', null);
INSERT INTO `sensitive_word` VALUES ('2979', '贤生赋', null);
INSERT INTO `sensitive_word` VALUES ('2980', '王伟', null);
INSERT INTO `sensitive_word` VALUES ('2981', '令狐安', null);
INSERT INTO `sensitive_word` VALUES ('2982', '杜学芳', null);
INSERT INTO `sensitive_word` VALUES ('2983', '吴玉良', null);
INSERT INTO `sensitive_word` VALUES ('2984', '吴毓萍', null);
INSERT INTO `sensitive_word` VALUES ('2985', '邱学强', null);
INSERT INTO `sensitive_word` VALUES ('2986', '何勇', null);
INSERT INTO `sensitive_word` VALUES ('2987', '张纪南', null);
INSERT INTO `sensitive_word` VALUES ('2988', '屈万祥', null);
INSERT INTO `sensitive_word` VALUES ('2989', '黄树贤', null);
INSERT INTO `sensitive_word` VALUES ('2990', '王晨', null);
INSERT INTO `sensitive_word` VALUES ('2991', '王毅', null);
INSERT INTO `sensitive_word` VALUES ('2992', '王万宾', null);
INSERT INTO `sensitive_word` VALUES ('2993', '王旭东', null);
INSERT INTO `sensitive_word` VALUES ('2994', '王喜斌', null);
INSERT INTO `sensitive_word` VALUES ('2995', '吉炳轩', null);
INSERT INTO `sensitive_word` VALUES ('2996', '朱之鑫', null);
INSERT INTO `sensitive_word` VALUES ('2997', '刘京', null);
INSERT INTO `sensitive_word` VALUES ('2998', '刘冬冬', null);
INSERT INTO `sensitive_word` VALUES ('2999', '孙春兰', null);
INSERT INTO `sensitive_word` VALUES ('3000', '孙晓群', null);
INSERT INTO `sensitive_word` VALUES ('3001', '李长才', null);
INSERT INTO `sensitive_word` VALUES ('3002', '李长江', null);
INSERT INTO `sensitive_word` VALUES ('3003', '李世明', null);
INSERT INTO `sensitive_word` VALUES ('3004', '李学勇', null);
INSERT INTO `sensitive_word` VALUES ('3005', '李海峰', null);
INSERT INTO `sensitive_word` VALUES ('3006', '杨元元', null);
INSERT INTO `sensitive_word` VALUES ('3007', '杨衍银', null);
INSERT INTO `sensitive_word` VALUES ('3008', '肖捷', null);
INSERT INTO `sensitive_word` VALUES ('3009', '吴双战', null);
INSERT INTO `sensitive_word` VALUES ('3010', '张阳', null);
INSERT INTO `sensitive_word` VALUES ('3011', '张又侠', null);
INSERT INTO `sensitive_word` VALUES ('3012', '张玉台', null);
INSERT INTO `sensitive_word` VALUES ('3013', '房峰辉', null);
INSERT INTO `sensitive_word` VALUES ('3014', '黄晴宜', null);
INSERT INTO `sensitive_word` VALUES ('3015', '黄献中', null);
INSERT INTO `sensitive_word` VALUES ('3016', '符廷贵', null);
INSERT INTO `sensitive_word` VALUES ('3017', '董贵山', null);
INSERT INTO `sensitive_word` VALUES ('3018', '喻林祥', null);
INSERT INTO `sensitive_word` VALUES ('3019', '何在', null);
INSERT INTO `sensitive_word` VALUES ('3020', '童世平', null);
INSERT INTO `sensitive_word` VALUES ('3021', '焉荣竹', null);
INSERT INTO `sensitive_word` VALUES ('3022', '王学君', null);
INSERT INTO `sensitive_word` VALUES ('3023', '王建平', null);
INSERT INTO `sensitive_word` VALUES ('3024', '杜宇新', null);
INSERT INTO `sensitive_word` VALUES ('3025', '符跃兰', null);
INSERT INTO `sensitive_word` VALUES ('3026', '马飚', null);
INSERT INTO `sensitive_word` VALUES ('3027', '旦科', null);
INSERT INTO `sensitive_word` VALUES ('3028', '朱小丹', null);
INSERT INTO `sensitive_word` VALUES ('3029', '张连珍', null);
INSERT INTO `sensitive_word` VALUES ('3030', '林左鸣', null);
INSERT INTO `sensitive_word` VALUES ('3031', '罗正富', null);
INSERT INTO `sensitive_word` VALUES ('3032', '罗志君', null);
INSERT INTO `sensitive_word` VALUES ('3033', '郑立中', null);
INSERT INTO `sensitive_word` VALUES ('3034', '袁荣祥', null);
INSERT INTO `sensitive_word` VALUES ('3035', '申维辰', null);
INSERT INTO `sensitive_word` VALUES ('3036', '任亚平', null);
INSERT INTO `sensitive_word` VALUES ('3037', '刘慧', null);
INSERT INTO `sensitive_word` VALUES ('3038', '李希', null);
INSERT INTO `sensitive_word` VALUES ('3039', '李买富', null);
INSERT INTO `sensitive_word` VALUES ('3040', '杨刚', null);
INSERT INTO `sensitive_word` VALUES ('3041', '杨松', null);
INSERT INTO `sensitive_word` VALUES ('3042', '余远辉', null);
INSERT INTO `sensitive_word` VALUES ('3043', '余欣荣', null);
INSERT INTO `sensitive_word` VALUES ('3044', '张成寅', null);
INSERT INTO `sensitive_word` VALUES ('3045', '张裔炯', null);
INSERT INTO `sensitive_word` VALUES ('3046', '陈存根', null);
INSERT INTO `sensitive_word` VALUES ('3047', '陈敏尔', null);
INSERT INTO `sensitive_word` VALUES ('3048', '骆惠宁', null);
INSERT INTO `sensitive_word` VALUES ('3049', '黄康生', null);
INSERT INTO `sensitive_word` VALUES ('3050', '魏凤和', null);
INSERT INTO `sensitive_word` VALUES ('3051', '于革胜', null);
INSERT INTO `sensitive_word` VALUES ('3052', '艾虎生', null);
INSERT INTO `sensitive_word` VALUES ('3053', '刘学普', null);
INSERT INTO `sensitive_word` VALUES ('3054', '刘振来', null);
INSERT INTO `sensitive_word` VALUES ('3055', '孙金龙', null);
INSERT INTO `sensitive_word` VALUES ('3056', '苏士亮', null);
INSERT INTO `sensitive_word` VALUES ('3057', '李长印', null);
INSERT INTO `sensitive_word` VALUES ('3058', '岳福洪', null);
INSERT INTO `sensitive_word` VALUES ('3059', '金振吉', null);
INSERT INTO `sensitive_word` VALUES ('3060', '秦银河', null);
INSERT INTO `sensitive_word` VALUES ('3061', '徐一天', null);
INSERT INTO `sensitive_word` VALUES ('3062', '薛延忠', null);
INSERT INTO `sensitive_word` VALUES ('3063', '王现魁', null);
INSERT INTO `sensitive_word` VALUES ('3064', '巴音朝鲁', null);
INSERT INTO `sensitive_word` VALUES ('3065', '叶冬松', null);
INSERT INTO `sensitive_word` VALUES ('3066', '史莲喜', null);
INSERT INTO `sensitive_word` VALUES ('3067', '刘晓凯', null);
INSERT INTO `sensitive_word` VALUES ('3068', '张耕', null);
INSERT INTO `sensitive_word` VALUES ('3069', '张基尧', null);
INSERT INTO `sensitive_word` VALUES ('3070', '陈宝生', null);
INSERT INTO `sensitive_word` VALUES ('3071', '苗圩', null);
INSERT INTO `sensitive_word` VALUES ('3072', '赵爱明', null);
INSERT INTO `sensitive_word` VALUES ('3073', '咸辉', null);
INSERT INTO `sensitive_word` VALUES ('3074', '袁家君', null);
INSERT INTO `sensitive_word` VALUES ('3075', '息中朝', null);
INSERT INTO `sensitive_word` VALUES ('3076', '徐粉林', null);
INSERT INTO `sensitive_word` VALUES ('3077', '谌贻琴', null);
INSERT INTO `sensitive_word` VALUES ('3078', '王玉普', null);
INSERT INTO `sensitive_word` VALUES ('3079', '李金城', null);
INSERT INTO `sensitive_word` VALUES ('3080', '肖钢', null);
INSERT INTO `sensitive_word` VALUES ('3081', '肖亚庆', null);
INSERT INTO `sensitive_word` VALUES ('3082', '何立峰', null);
INSERT INTO `sensitive_word` VALUES ('3083', '张仕波', null);
INSERT INTO `sensitive_word` VALUES ('3084', '张晓刚', null);
INSERT INTO `sensitive_word` VALUES ('3085', '金壮龙', null);
INSERT INTO `sensitive_word` VALUES ('3086', '刘伟', null);
INSERT INTO `sensitive_word` VALUES ('3087', '陈润儿', null);
INSERT INTO `sensitive_word` VALUES ('3088', '鹿心社', null);
INSERT INTO `sensitive_word` VALUES ('3089', '谢和平', null);
INSERT INTO `sensitive_word` VALUES ('3090', '王儒林', null);
INSERT INTO `sensitive_word` VALUES ('3091', '李崇禧', null);
INSERT INTO `sensitive_word` VALUES ('3092', '杨利伟', null);
INSERT INTO `sensitive_word` VALUES ('3093', '杨焕宁', null);
INSERT INTO `sensitive_word` VALUES ('3094', '张轩', null);
INSERT INTO `sensitive_word` VALUES ('3095', '武吉海', null);
INSERT INTO `sensitive_word` VALUES ('3096', '项俊波', null);
INSERT INTO `sensitive_word` VALUES ('3097', '舒晓琴', null);
INSERT INTO `sensitive_word` VALUES ('3098', '詹文龙', null);
INSERT INTO `sensitive_word` VALUES ('3099', '潘云鹤', null);
INSERT INTO `sensitive_word` VALUES ('3100', '叨林荫', null);
INSERT INTO `sensitive_word` VALUES ('3101', '王荣', null);
INSERT INTO `sensitive_word` VALUES ('3102', '汤涛', null);
INSERT INTO `sensitive_word` VALUES ('3103', '李纪恒', null);
INSERT INTO `sensitive_word` VALUES ('3104', '宋爱荣', null);
INSERT INTO `sensitive_word` VALUES ('3105', '张杰', null);
INSERT INTO `sensitive_word` VALUES ('3106', '陈左宁', null);
INSERT INTO `sensitive_word` VALUES ('3107', '竺延风', null);
INSERT INTO `sensitive_word` VALUES ('3108', '骆琳', null);
INSERT INTO `sensitive_word` VALUES ('3109', '褚益民', null);
INSERT INTO `sensitive_word` VALUES ('3110', '蔡英挺', null);
INSERT INTO `sensitive_word` VALUES ('3111', '邢元敏', null);
INSERT INTO `sensitive_word` VALUES ('3112', '李鸿忠', null);
INSERT INTO `sensitive_word` VALUES ('3113', '陈川平', null);
INSERT INTO `sensitive_word` VALUES ('3114', '梅克保', null);
INSERT INTO `sensitive_word` VALUES ('3115', '曹清', null);
INSERT INTO `sensitive_word` VALUES ('3116', '焦焕成', null);
INSERT INTO `sensitive_word` VALUES ('3117', '雷春美', null);
INSERT INTO `sensitive_word` VALUES ('3118', '翟虎渠', null);
INSERT INTO `sensitive_word` VALUES ('3119', '丁一平', null);
INSERT INTO `sensitive_word` VALUES ('3120', '闵维方', null);
INSERT INTO `sensitive_word` VALUES ('3121', '郭树清', null);
INSERT INTO `sensitive_word` VALUES ('3122', '王侠', null);
INSERT INTO `sensitive_word` VALUES ('3123', '陈元', null);
INSERT INTO `sensitive_word` VALUES ('3124', '姜建清', null);
INSERT INTO `sensitive_word` VALUES ('3125', '董万才', null);
INSERT INTO `sensitive_word` VALUES ('3126', '王明方', null);
INSERT INTO `sensitive_word` VALUES ('3127', '沈素琍', null);
INSERT INTO `sensitive_word` VALUES ('3128', '张岱梨', null);
INSERT INTO `sensitive_word` VALUES ('3129', '乌兰', null);
INSERT INTO `sensitive_word` VALUES ('3130', '付志方', null);
INSERT INTO `sensitive_word` VALUES ('3131', '夏宝龙', null);
INSERT INTO `sensitive_word` VALUES ('3132', '王安顺', null);
INSERT INTO `sensitive_word` VALUES ('3133', '张瑞敏', null);
INSERT INTO `sensitive_word` VALUES ('3134', '赵勇', null);
INSERT INTO `sensitive_word` VALUES ('3135', '栗战书', null);
INSERT INTO `sensitive_word` VALUES ('3136', '车俊', null);
INSERT INTO `sensitive_word` VALUES ('3137', '王晓初', null);
INSERT INTO `sensitive_word` VALUES ('3138', '刘玉浦', null);
INSERT INTO `sensitive_word` VALUES ('3139', '王三运', null);
INSERT INTO `sensitive_word` VALUES ('3140', '殷一璀（女）', null);
INSERT INTO `sensitive_word` VALUES ('3141', '楼继伟', null);
INSERT INTO `sensitive_word` VALUES ('3142', '刘振亚', null);
INSERT INTO `sensitive_word` VALUES ('3143', '贾廷安', null);
INSERT INTO `sensitive_word` VALUES ('3144', '嘿咻', null);
INSERT INTO `sensitive_word` VALUES ('3145', '冤狱', null);
INSERT INTO `sensitive_word` VALUES ('3146', '黑狱', null);
INSERT INTO `sensitive_word` VALUES ('3147', '艾滋病', null);
INSERT INTO `sensitive_word` VALUES ('3148', '安定片', null);
INSERT INTO `sensitive_word` VALUES ('3149', '羟丁酸', null);
INSERT INTO `sensitive_word` VALUES ('3150', '巴特尔', null);
INSERT INTO `sensitive_word` VALUES ('3151', '聚集', null);
INSERT INTO `sensitive_word` VALUES ('3152', '斑蝥', null);
INSERT INTO `sensitive_word` VALUES ('3153', '诺龙', null);
INSERT INTO `sensitive_word` VALUES ('3154', '乙醚', null);
INSERT INTO `sensitive_word` VALUES ('3155', '烟碱', null);
INSERT INTO `sensitive_word` VALUES ('3156', '活体', null);
INSERT INTO `sensitive_word` VALUES ('3157', '皮质类固醇', null);
INSERT INTO `sensitive_word` VALUES ('3158', '氟硝西泮', null);
INSERT INTO `sensitive_word` VALUES ('3159', '氧化汞', null);
INSERT INTO `sensitive_word` VALUES ('3160', '缩阴', null);
INSERT INTO `sensitive_word` VALUES ('3161', '硝酸甘油', null);
INSERT INTO `sensitive_word` VALUES ('3162', '硫酸', null);
INSERT INTO `sensitive_word` VALUES ('3163', '亚砷酸钾', null);
INSERT INTO `sensitive_word` VALUES ('3164', '亚硒酸', null);
INSERT INTO `sensitive_word` VALUES ('3165', '异氟烷', null);
INSERT INTO `sensitive_word` VALUES ('3166', '罂粟壳', null);
INSERT INTO `sensitive_word` VALUES ('3167', '蹂躏', null);
INSERT INTO `sensitive_word` VALUES ('3168', '女奴', null);
INSERT INTO `sensitive_word` VALUES ('3169', '男奴', null);
INSERT INTO `sensitive_word` VALUES ('3170', '核武', null);
INSERT INTO `sensitive_word` VALUES ('3171', '赌具', null);
INSERT INTO `sensitive_word` VALUES ('3172', '蒲团', null);
INSERT INTO `sensitive_word` VALUES ('3173', '情妇', null);
INSERT INTO `sensitive_word` VALUES ('3174', '艳舞', null);
INSERT INTO `sensitive_word` VALUES ('3175', '春宫', null);
INSERT INTO `sensitive_word` VALUES ('3176', '肉壁', null);
INSERT INTO `sensitive_word` VALUES ('3177', '乱性', null);
INSERT INTO `sensitive_word` VALUES ('3178', '性侵', null);
INSERT INTO `sensitive_word` VALUES ('3179', '性虐', null);
INSERT INTO `sensitive_word` VALUES ('3180', '性奴', null);
INSERT INTO `sensitive_word` VALUES ('3181', '口暴', null);
INSERT INTO `sensitive_word` VALUES ('3182', '毒龙', null);
INSERT INTO `sensitive_word` VALUES ('3183', '性爱', null);
INSERT INTO `sensitive_word` VALUES ('3184', '性饥', null);
INSERT INTO `sensitive_word` VALUES ('3185', '充气娃娃', null);
INSERT INTO `sensitive_word` VALUES ('3186', '女体', null);
INSERT INTO `sensitive_word` VALUES ('3187', '香艳', null);
INSERT INTO `sensitive_word` VALUES ('3188', '初夜', null);
INSERT INTO `sensitive_word` VALUES ('3189', '丁字裤', null);
INSERT INTO `sensitive_word` VALUES ('3190', '丧尽天良', null);
INSERT INTO `sensitive_word` VALUES ('3191', '性伙伴', null);
INSERT INTO `sensitive_word` VALUES ('3192', '性伴侣', null);
INSERT INTO `sensitive_word` VALUES ('3193', '性学', null);
INSERT INTO `sensitive_word` VALUES ('3194', '性息', null);
INSERT INTO `sensitive_word` VALUES ('3195', '性感', null);
INSERT INTO `sensitive_word` VALUES ('3196', '性教官', null);
INSERT INTO `sensitive_word` VALUES ('3197', '性福', null);
INSERT INTO `sensitive_word` VALUES ('3198', '性网', null);
INSERT INTO `sensitive_word` VALUES ('3199', '美妇', null);
INSERT INTO `sensitive_word` VALUES ('3200', '美妻', null);
INSERT INTO `sensitive_word` VALUES ('3201', '欠干', null);
INSERT INTO `sensitive_word` VALUES ('3202', '搞女人', null);
INSERT INTO `sensitive_word` VALUES ('3203', '包皮', null);
INSERT INTO `sensitive_word` VALUES ('3204', '滑精', null);
INSERT INTO `sensitive_word` VALUES ('3205', '装十三', null);
INSERT INTO `sensitive_word` VALUES ('3206', '卧了个槽', null);
INSERT INTO `sensitive_word` VALUES ('3207', '卧槽', null);
INSERT INTO `sensitive_word` VALUES ('3208', '槽我', null);
INSERT INTO `sensitive_word` VALUES ('3209', '槽你', null);
INSERT INTO `sensitive_word` VALUES ('3210', '我槽', null);
INSERT INTO `sensitive_word` VALUES ('3211', 'H图', null);
INSERT INTO `sensitive_word` VALUES ('3212', '凌辱', null);
INSERT INTO `sensitive_word` VALUES ('3213', '伟哥', null);
INSERT INTO `sensitive_word` VALUES ('3214', '敏感带', null);
INSERT INTO `sensitive_word` VALUES ('3215', '敏感处', null);
INSERT INTO `sensitive_word` VALUES ('3216', '敏感部位', null);
INSERT INTO `sensitive_word` VALUES ('3217', '色色', null);
INSERT INTO `sensitive_word` VALUES ('3218', '黄色', null);
INSERT INTO `sensitive_word` VALUES ('3219', '色眼', null);
INSERT INTO `sensitive_word` VALUES ('3220', '色咪咪', null);
INSERT INTO `sensitive_word` VALUES ('3221', '色眯眯', null);
INSERT INTO `sensitive_word` VALUES ('3222', '性趣', null);
INSERT INTO `sensitive_word` VALUES ('3223', '卖尸', null);
INSERT INTO `sensitive_word` VALUES ('3224', '性致', null);
INSERT INTO `sensitive_word` VALUES ('3225', '毒品', null);
INSERT INTO `sensitive_word` VALUES ('3226', '安非他命', null);
INSERT INTO `sensitive_word` VALUES ('3227', '迷药', null);
INSERT INTO `sensitive_word` VALUES ('3228', '空格去掉', null);
INSERT INTO `sensitive_word` VALUES ('3229', '反和谐', null);
INSERT INTO `sensitive_word` VALUES ('3230', '反河蟹', null);
INSERT INTO `sensitive_word` VALUES ('3231', '广告机', null);
INSERT INTO `sensitive_word` VALUES ('3232', '发贴机', null);
INSERT INTO `sensitive_word` VALUES ('3233', '帮忙点一下', null);
INSERT INTO `sensitive_word` VALUES ('3234', '帮忙点下', null);
INSERT INTO `sensitive_word` VALUES ('3235', '详情请进入', null);
INSERT INTO `sensitive_word` VALUES ('3236', '借腹生子', null);
INSERT INTO `sensitive_word` VALUES ('3237', '找个妈妈', null);
INSERT INTO `sensitive_word` VALUES ('3238', '找个爸爸', null);
INSERT INTO `sensitive_word` VALUES ('3239', '代生', null);
INSERT INTO `sensitive_word` VALUES ('3240', '款到发货', null);
INSERT INTO `sensitive_word` VALUES ('3241', '回复可见', null);
INSERT INTO `sensitive_word` VALUES ('3242', '婴儿汤', null);
INSERT INTO `sensitive_word` VALUES ('3243', '售肾', null);
INSERT INTO `sensitive_word` VALUES ('3244', '在线播放', null);
INSERT INTO `sensitive_word` VALUES ('3246', '爆草', null);
INSERT INTO `sensitive_word` VALUES ('3247', '暴干', null);
INSERT INTO `sensitive_word` VALUES ('3248', '暴奸', null);
INSERT INTO `sensitive_word` VALUES ('3249', '爆乳', null);
INSERT INTO `sensitive_word` VALUES ('3250', '暴淫', null);
INSERT INTO `sensitive_word` VALUES ('3253', '被操', null);
INSERT INTO `sensitive_word` VALUES ('3254', '被插', null);
INSERT INTO `sensitive_word` VALUES ('3255', '逼奸', null);
INSERT INTO `sensitive_word` VALUES ('3256', '仓井空', null);
INSERT INTO `sensitive_word` VALUES ('3257', '插暴', null);
INSERT INTO `sensitive_word` VALUES ('3258', '操黑', null);
INSERT INTO `sensitive_word` VALUES ('3259', '操烂', null);
INSERT INTO `sensitive_word` VALUES ('3260', '肏你', null);
INSERT INTO `sensitive_word` VALUES ('3261', '厕奴', null);
INSERT INTO `sensitive_word` VALUES ('3262', '插比', null);
INSERT INTO `sensitive_word` VALUES ('3263', '插B', null);
INSERT INTO `sensitive_word` VALUES ('3264', '插逼', null);
INSERT INTO `sensitive_word` VALUES ('3265', '插你', null);
INSERT INTO `sensitive_word` VALUES ('3266', '插我', null);
INSERT INTO `sensitive_word` VALUES ('3267', '插阴', null);
INSERT INTO `sensitive_word` VALUES ('3268', '潮喷', null);
INSERT INTO `sensitive_word` VALUES ('3269', '色情', null);
INSERT INTO `sensitive_word` VALUES ('3270', '艳情', null);
INSERT INTO `sensitive_word` VALUES ('3271', '扌由插', null);
INSERT INTO `sensitive_word` VALUES ('3272', '抽一插', null);
INSERT INTO `sensitive_word` VALUES ('3273', '盗撮', null);
INSERT INTO `sensitive_word` VALUES ('3274', '多人轮', null);
INSERT INTO `sensitive_word` VALUES ('3275', '群轮', null);
INSERT INTO `sensitive_word` VALUES ('3276', '放尿', null);
INSERT INTO `sensitive_word` VALUES ('3277', '肥逼', null);
INSERT INTO `sensitive_word` VALUES ('3278', '粉穴', null);
INSERT INTO `sensitive_word` VALUES ('3279', '干穴', null);
INSERT INTO `sensitive_word` VALUES ('3280', '裹本', null);
INSERT INTO `sensitive_word` VALUES ('3281', '好嫩', null);
INSERT INTO `sensitive_word` VALUES ('3282', '黑逼', null);
INSERT INTO `sensitive_word` VALUES ('3283', '几吧', null);
INSERT INTO `sensitive_word` VALUES ('3284', '寂寞男', null);
INSERT INTO `sensitive_word` VALUES ('3285', '寂寞女', null);
INSERT INTO `sensitive_word` VALUES ('3286', '妓女', null);
INSERT INTO `sensitive_word` VALUES ('3287', '集体淫', null);
INSERT INTO `sensitive_word` VALUES ('3288', '奸情', null);
INSERT INTO `sensitive_word` VALUES ('3289', '就去日', null);
INSERT INTO `sensitive_word` VALUES ('3290', '巨屌', null);
INSERT INTO `sensitive_word` VALUES ('3291', '菊门', null);
INSERT INTO `sensitive_word` VALUES ('3292', '巨奶', null);
INSERT INTO `sensitive_word` VALUES ('3293', '菊穴', null);
INSERT INTO `sensitive_word` VALUES ('3294', '口射', null);
INSERT INTO `sensitive_word` VALUES ('3295', '口淫', null);
INSERT INTO `sensitive_word` VALUES ('3296', '勐干', null);
INSERT INTO `sensitive_word` VALUES ('3297', '勐搅', null);
INSERT INTO `sensitive_word` VALUES ('3298', '勐男', null);
INSERT INTO `sensitive_word` VALUES ('3299', '勐舔', null);
INSERT INTO `sensitive_word` VALUES ('3300', '勐挺', null);
INSERT INTO `sensitive_word` VALUES ('3301', '勐撞', null);
INSERT INTO `sensitive_word` VALUES ('3302', '梦交', null);
INSERT INTO `sensitive_word` VALUES ('3303', '梦失精', null);
INSERT INTO `sensitive_word` VALUES ('3304', '梦遗', null);
INSERT INTO `sensitive_word` VALUES ('3305', '迷情', null);
INSERT INTO `sensitive_word` VALUES ('3306', '秘唇', null);
INSERT INTO `sensitive_word` VALUES ('3307', '秘洞', null);
INSERT INTO `sensitive_word` VALUES ('3308', '秘缝', null);
INSERT INTO `sensitive_word` VALUES ('3309', '秘肉', null);
INSERT INTO `sensitive_word` VALUES ('3310', '秘穴', null);
INSERT INTO `sensitive_word` VALUES ('3311', '泌乳', null);
INSERT INTO `sensitive_word` VALUES ('3312', '蜜唇', null);
INSERT INTO `sensitive_word` VALUES ('3313', '蜜洞', null);
INSERT INTO `sensitive_word` VALUES ('3314', '蜜肉', null);
INSERT INTO `sensitive_word` VALUES ('3315', '蜜桃', null);
INSERT INTO `sensitive_word` VALUES ('3316', '蜜液', null);
INSERT INTO `sensitive_word` VALUES ('3317', '蜜汁', null);
INSERT INTO `sensitive_word` VALUES ('3318', '密洞', null);
INSERT INTO `sensitive_word` VALUES ('3319', '密窥', null);
INSERT INTO `sensitive_word` VALUES ('3320', '密穴', null);
INSERT INTO `sensitive_word` VALUES ('3321', '密汁', null);
INSERT INTO `sensitive_word` VALUES ('3322', '绵软', null);
INSERT INTO `sensitive_word` VALUES ('3323', '名器', null);
INSERT INTO `sensitive_word` VALUES ('3324', '命根', null);
INSERT INTO `sensitive_word` VALUES ('3325', '摸抠', null);
INSERT INTO `sensitive_word` VALUES ('3326', '摸摸', null);
INSERT INTO `sensitive_word` VALUES ('3327', '摸捏', null);
INSERT INTO `sensitive_word` VALUES ('3328', '摸弄', null);
INSERT INTO `sensitive_word` VALUES ('3329', '摸揉', null);
INSERT INTO `sensitive_word` VALUES ('3330', '摸乳', null);
INSERT INTO `sensitive_word` VALUES ('3331', '摸玩', null);
INSERT INTO `sensitive_word` VALUES ('3332', '摸我', null);
INSERT INTO `sensitive_word` VALUES ('3333', '磨搽', null);
INSERT INTO `sensitive_word` VALUES ('3334', '磨搓', null);
INSERT INTO `sensitive_word` VALUES ('3335', '磨弄', null);
INSERT INTO `sensitive_word` VALUES ('3336', '磨穴', null);
INSERT INTO `sensitive_word` VALUES ('3337', '摩弄', null);
INSERT INTO `sensitive_word` VALUES ('3338', '奶房', null);
INSERT INTO `sensitive_word` VALUES ('3339', '奶尖', null);
INSERT INTO `sensitive_word` VALUES ('3340', '奶水', null);
INSERT INTO `sensitive_word` VALUES ('3341', '奶头', null);
INSERT INTO `sensitive_word` VALUES ('3342', '奶子', null);
INSERT INTO `sensitive_word` VALUES ('3343', '男根', null);
INSERT INTO `sensitive_word` VALUES ('3344', '男跪女后', null);
INSERT INTO `sensitive_word` VALUES ('3345', '男欢女爱', null);
INSERT INTO `sensitive_word` VALUES ('3346', '男茎', null);
INSERT INTO `sensitive_word` VALUES ('3347', '男精女血', null);
INSERT INTO `sensitive_word` VALUES ('3348', '男上式', null);
INSERT INTO `sensitive_word` VALUES ('3349', '内壁', null);
INSERT INTO `sensitive_word` VALUES ('3350', '嫩脸', null);
INSERT INTO `sensitive_word` VALUES ('3351', '嫩嫩', null);
INSERT INTO `sensitive_word` VALUES ('3352', '嫩肉', null);
INSERT INTO `sensitive_word` VALUES ('3353', '嫩乳', null);
INSERT INTO `sensitive_word` VALUES ('3354', '嫩舌', null);
INSERT INTO `sensitive_word` VALUES ('3355', '嫩爽', null);
INSERT INTO `sensitive_word` VALUES ('3356', '嫩腿', null);
INSERT INTO `sensitive_word` VALUES ('3357', '嫩臀', null);
INSERT INTO `sensitive_word` VALUES ('3358', '嫩娃', null);
INSERT INTO `sensitive_word` VALUES ('3359', '腻滑', null);
INSERT INTO `sensitive_word` VALUES ('3360', '尿道', null);
INSERT INTO `sensitive_word` VALUES ('3361', '尿水', null);
INSERT INTO `sensitive_word` VALUES ('3362', '尿痛', null);
INSERT INTO `sensitive_word` VALUES ('3363', '尿味', null);
INSERT INTO `sensitive_word` VALUES ('3364', '尿血', null);
INSERT INTO `sensitive_word` VALUES ('3365', '尿液', null);
INSERT INTO `sensitive_word` VALUES ('3366', '尿意', null);
INSERT INTO `sensitive_word` VALUES ('3367', '尿浊', null);
INSERT INTO `sensitive_word` VALUES ('3368', '脓尿', null);
INSERT INTO `sensitive_word` VALUES ('3369', '浓稠', null);
INSERT INTO `sensitive_word` VALUES ('3370', '浓热', null);
INSERT INTO `sensitive_word` VALUES ('3371', '浓浊', null);
INSERT INTO `sensitive_word` VALUES ('3372', '弄破', null);
INSERT INTO `sensitive_word` VALUES ('3373', '弄湿', null);
INSERT INTO `sensitive_word` VALUES ('3374', '弄穴', null);
INSERT INTO `sensitive_word` VALUES ('3375', '怒张', null);
INSERT INTO `sensitive_word` VALUES ('3376', '怒涨', null);
INSERT INTO `sensitive_word` VALUES ('3377', '怒胀', null);
INSERT INTO `sensitive_word` VALUES ('3378', '女畅男欢', null);
INSERT INTO `sensitive_word` VALUES ('3379', '女器', null);
INSERT INTO `sensitive_word` VALUES ('3380', '女前男后', null);
INSERT INTO `sensitive_word` VALUES ('3381', '的BB', null);
INSERT INTO `sensitive_word` VALUES ('3382', '逼逼', null);
INSERT INTO `sensitive_word` VALUES ('3383', '女上式', null);
INSERT INTO `sensitive_word` VALUES ('3384', '女上位', null);
INSERT INTO `sensitive_word` VALUES ('3385', '女童', null);
INSERT INTO `sensitive_word` VALUES ('3386', '女臀', null);
INSERT INTO `sensitive_word` VALUES ('3387', '女卧男立', null);
INSERT INTO `sensitive_word` VALUES ('3388', '女下位', null);
INSERT INTO `sensitive_word` VALUES ('3389', '女尻', null);
INSERT INTO `sensitive_word` VALUES ('3390', '虐待', null);
INSERT INTO `sensitive_word` VALUES ('3391', '排过精', null);
INSERT INTO `sensitive_word` VALUES ('3392', '排精', null);
INSERT INTO `sensitive_word` VALUES ('3393', '排卵', null);
INSERT INTO `sensitive_word` VALUES ('3394', '排射', null);
INSERT INTO `sensitive_word` VALUES ('3395', '排泄', null);
INSERT INTO `sensitive_word` VALUES ('3396', '抛浪', null);
INSERT INTO `sensitive_word` VALUES ('3397', '泡彦', null);
INSERT INTO `sensitive_word` VALUES ('3398', '泡浴', null);
INSERT INTO `sensitive_word` VALUES ('3399', '喷射', null);
INSERT INTO `sensitive_word` VALUES ('3400', '喷泄', null);
INSERT INTO `sensitive_word` VALUES ('3401', '喷涌', null);
INSERT INTO `sensitive_word` VALUES ('3402', '盆腔', null);
INSERT INTO `sensitive_word` VALUES ('3403', '澎胀', null);
INSERT INTO `sensitive_word` VALUES ('3404', '膨大', null);
INSERT INTO `sensitive_word` VALUES ('3405', '膨涨', null);
INSERT INTO `sensitive_word` VALUES ('3406', '膨胀', null);
INSERT INTO `sensitive_word` VALUES ('3407', '疲软', null);
INSERT INTO `sensitive_word` VALUES ('3408', '屁道', null);
INSERT INTO `sensitive_word` VALUES ('3409', '屁门', null);
INSERT INTO `sensitive_word` VALUES ('3410', '屁穴', null);
INSERT INTO `sensitive_word` VALUES ('3411', '破处', null);
INSERT INTO `sensitive_word` VALUES ('3412', '破瓜', null);
INSERT INTO `sensitive_word` VALUES ('3413', '破坏', null);
INSERT INTO `sensitive_word` VALUES ('3414', '破身', null);
INSERT INTO `sensitive_word` VALUES ('3415', '破贞', null);
INSERT INTO `sensitive_word` VALUES ('3416', '奇痒', null);
INSERT INTO `sensitive_word` VALUES ('3417', '奇淫', null);
INSERT INTO `sensitive_word` VALUES ('3418', '骑乘位', null);
INSERT INTO `sensitive_word` VALUES ('3419', '器具', null);
INSERT INTO `sensitive_word` VALUES ('3420', '前戏', null);
INSERT INTO `sensitive_word` VALUES ('3421', '潜欲', null);
INSERT INTO `sensitive_word` VALUES ('3422', '浅出浅入', null);
INSERT INTO `sensitive_word` VALUES ('3423', '浅入浅出', null);
INSERT INTO `sensitive_word` VALUES ('3424', '腔内', null);
INSERT INTO `sensitive_word` VALUES ('3425', '腔肉', null);
INSERT INTO `sensitive_word` VALUES ('3426', '强暴', null);
INSERT INTO `sensitive_word` VALUES ('3427', '强奸', null);
INSERT INTO `sensitive_word` VALUES ('3428', '强精', null);
INSERT INTO `sensitive_word` VALUES ('3429', '强硬', null);
INSERT INTO `sensitive_word` VALUES ('3430', '巧春', null);
INSERT INTO `sensitive_word` VALUES ('3431', '翘起', null);
INSERT INTO `sensitive_word` VALUES ('3432', '翘臀', null);
INSERT INTO `sensitive_word` VALUES ('3433', '亲匿', null);
INSERT INTO `sensitive_word` VALUES ('3434', '亲吻', null);
INSERT INTO `sensitive_word` VALUES ('3435', '青春期', null);
INSERT INTO `sensitive_word` VALUES ('3436', '轻颤', null);
INSERT INTO `sensitive_word` VALUES ('3437', '轻喘', null);
INSERT INTO `sensitive_word` VALUES ('3438', '轻搓', null);
INSERT INTO `sensitive_word` VALUES ('3439', '轻撩', null);
INSERT INTO `sensitive_word` VALUES ('3440', '轻舔', null);
INSERT INTO `sensitive_word` VALUES ('3441', '轻吻', null);
INSERT INTO `sensitive_word` VALUES ('3442', '轻握', null);
INSERT INTO `sensitive_word` VALUES ('3443', '轻咬', null);
INSERT INTO `sensitive_word` VALUES ('3444', '轻舐', null);
INSERT INTO `sensitive_word` VALUES ('3445', '情动', null);
INSERT INTO `sensitive_word` VALUES ('3446', '情色', null);
INSERT INTO `sensitive_word` VALUES ('3447', '情穴', null);
INSERT INTO `sensitive_word` VALUES ('3448', '情欲', null);
INSERT INTO `sensitive_word` VALUES ('3449', '求欢', null);
INSERT INTO `sensitive_word` VALUES ('3450', '去操', null);
INSERT INTO `sensitive_word` VALUES ('3451', '去吮', null);
INSERT INTO `sensitive_word` VALUES ('3452', '去舔', null);
INSERT INTO `sensitive_word` VALUES ('3453', '泉涌', null);
INSERT INTO `sensitive_word` VALUES ('3454', '全根', null);
INSERT INTO `sensitive_word` VALUES ('3455', '燃烧', null);
INSERT INTO `sensitive_word` VALUES ('3456', '热滚', null);
INSERT INTO `sensitive_word` VALUES ('3457', '热浆', null);
INSERT INTO `sensitive_word` VALUES ('3458', '热淋', null);
INSERT INTO `sensitive_word` VALUES ('3459', '热烫', null);
INSERT INTO `sensitive_word` VALUES ('3460', '热吻', null);
INSERT INTO `sensitive_word` VALUES ('3461', '热穴', null);
INSERT INTO `sensitive_word` VALUES ('3462', '忍精', null);
INSERT INTO `sensitive_word` VALUES ('3463', '乳头', null);
INSERT INTO `sensitive_word` VALUES ('3464', '肉体', null);
INSERT INTO `sensitive_word` VALUES ('3465', '肉芽', null);
INSERT INTO `sensitive_word` VALUES ('3466', '肉瓣', null);
INSERT INTO `sensitive_word` VALUES ('3467', '肉蚌', null);
INSERT INTO `sensitive_word` VALUES ('3468', '肉贝', null);
INSERT INTO `sensitive_word` VALUES ('3469', '肉臂', null);
INSERT INTO `sensitive_word` VALUES ('3470', '肉搏', null);
INSERT INTO `sensitive_word` VALUES ('3471', '肉帛', null);
INSERT INTO `sensitive_word` VALUES ('3472', '肉唇', null);
INSERT INTO `sensitive_word` VALUES ('3473', '肉袋', null);
INSERT INTO `sensitive_word` VALUES ('3474', '肉弹', null);
INSERT INTO `sensitive_word` VALUES ('3475', '肉道', null);
INSERT INTO `sensitive_word` VALUES ('3476', '肉豆', null);
INSERT INTO `sensitive_word` VALUES ('3477', '肉根', null);
INSERT INTO `sensitive_word` VALUES ('3478', '肉沟', null);
INSERT INTO `sensitive_word` VALUES ('3479', '肉冠', null);
INSERT INTO `sensitive_word` VALUES ('3480', '肉核', null);
INSERT INTO `sensitive_word` VALUES ('3481', '肉乎乎', null);
INSERT INTO `sensitive_word` VALUES ('3482', '肉壶', null);
INSERT INTO `sensitive_word` VALUES ('3483', '肉紧', null);
INSERT INTO `sensitive_word` VALUES ('3484', '肉具', null);
INSERT INTO `sensitive_word` VALUES ('3485', '肉孔', null);
INSERT INTO `sensitive_word` VALUES ('3486', '肉粒', null);
INSERT INTO `sensitive_word` VALUES ('3487', '肉门', null);
INSERT INTO `sensitive_word` VALUES ('3488', '肉膜', null);
INSERT INTO `sensitive_word` VALUES ('3489', '肉腔', null);
INSERT INTO `sensitive_word` VALUES ('3490', '肉丘', null);
INSERT INTO `sensitive_word` VALUES ('3491', '肉球', null);
INSERT INTO `sensitive_word` VALUES ('3492', '肉圈', null);
INSERT INTO `sensitive_word` VALUES ('3493', '肉色', null);
INSERT INTO `sensitive_word` VALUES ('3494', '肉身', null);
INSERT INTO `sensitive_word` VALUES ('3495', '肉团', null);
INSERT INTO `sensitive_word` VALUES ('3496', '肉臀', null);
INSERT INTO `sensitive_word` VALUES ('3497', '肉香', null);
INSERT INTO `sensitive_word` VALUES ('3498', '肉穴', null);
INSERT INTO `sensitive_word` VALUES ('3499', '肉眼', null);
INSERT INTO `sensitive_word` VALUES ('3500', '肉柱', null);
INSERT INTO `sensitive_word` VALUES ('3501', '肉嘟嘟', null);
INSERT INTO `sensitive_word` VALUES ('3502', '肉襞', null);
INSERT INTO `sensitive_word` VALUES ('3503', '如醉如痴', null);
INSERT INTO `sensitive_word` VALUES ('3504', '乳房', null);
INSERT INTO `sensitive_word` VALUES ('3505', '乳白色', null);
INSERT INTO `sensitive_word` VALUES ('3506', '乳波臀浪', null);
INSERT INTO `sensitive_word` VALUES ('3507', '乳部', null);
INSERT INTO `sensitive_word` VALUES ('3508', '乳蒂', null);
INSERT INTO `sensitive_word` VALUES ('3509', '乳儿', null);
INSERT INTO `sensitive_word` VALUES ('3510', '乳峰', null);
INSERT INTO `sensitive_word` VALUES ('3511', '乳沟', null);
INSERT INTO `sensitive_word` VALUES ('3512', '乳核', null);
INSERT INTO `sensitive_word` VALUES ('3513', '乳尖', null);
INSERT INTO `sensitive_word` VALUES ('3514', '乳浪', null);
INSERT INTO `sensitive_word` VALUES ('3515', '乳蕾', null);
INSERT INTO `sensitive_word` VALUES ('3516', '乳糜尿', null);
INSERT INTO `sensitive_word` VALUES ('3517', '乳母', null);
INSERT INTO `sensitive_word` VALUES ('3518', '乳球', null);
INSERT INTO `sensitive_word` VALUES ('3519', '乳肉', null);
INSERT INTO `sensitive_word` VALUES ('3520', '乳首', null);
INSERT INTO `sensitive_word` VALUES ('3521', '乳水', null);
INSERT INTO `sensitive_word` VALUES ('3522', '乳腺', null);
INSERT INTO `sensitive_word` VALUES ('3523', '乳晕', null);
INSERT INTO `sensitive_word` VALUES ('3524', '乳渍', null);
INSERT INTO `sensitive_word` VALUES ('3525', '软肉', null);
INSERT INTO `sensitive_word` VALUES ('3526', '弱入强出', null);
INSERT INTO `sensitive_word` VALUES ('3527', '搔弄', null);
INSERT INTO `sensitive_word` VALUES ('3528', '搔痒', null);
INSERT INTO `sensitive_word` VALUES ('3529', '骚B', null);
INSERT INTO `sensitive_word` VALUES ('3530', '骚逼', null);
INSERT INTO `sensitive_word` VALUES ('3531', '骚动', null);
INSERT INTO `sensitive_word` VALUES ('3532', '骚货', null);
INSERT INTO `sensitive_word` VALUES ('3533', '骚劲', null);
INSERT INTO `sensitive_word` VALUES ('3534', '骚媚', null);
INSERT INTO `sensitive_word` VALUES ('3535', '骚女', null);
INSERT INTO `sensitive_word` VALUES ('3536', '骚情', null);
INSERT INTO `sensitive_word` VALUES ('3537', '骚热', null);
INSERT INTO `sensitive_word` VALUES ('3538', '骚声', null);
INSERT INTO `sensitive_word` VALUES ('3539', '骚水', null);
INSERT INTO `sensitive_word` VALUES ('3540', '骚味', null);
INSERT INTO `sensitive_word` VALUES ('3541', '骚痒', null);
INSERT INTO `sensitive_word` VALUES ('3542', '骚淫', null);
INSERT INTO `sensitive_word` VALUES ('3543', '骚幽', null);
INSERT INTO `sensitive_word` VALUES ('3544', '骚状', null);
INSERT INTO `sensitive_word` VALUES ('3545', '色欲', null);
INSERT INTO `sensitive_word` VALUES ('3546', '杀精', null);
INSERT INTO `sensitive_word` VALUES ('3547', '伤精', null);
INSERT INTO `sensitive_word` VALUES ('3548', '上下蠕动', null);
INSERT INTO `sensitive_word` VALUES ('3549', '上压下顶', null);
INSERT INTO `sensitive_word` VALUES ('3550', '射出', null);
INSERT INTO `sensitive_word` VALUES ('3551', '射到', null);
INSERT INTO `sensitive_word` VALUES ('3552', '射了', null);
INSERT INTO `sensitive_word` VALUES ('3553', '射向', null);
INSERT INTO `sensitive_word` VALUES ('3554', '射液', null);
INSERT INTO `sensitive_word` VALUES ('3555', '身无寸缕', null);
INSERT INTO `sensitive_word` VALUES ('3556', '深插', null);
INSERT INTO `sensitive_word` VALUES ('3557', '深喉', null);
INSERT INTO `sensitive_word` VALUES ('3558', '软玉温香', null);
INSERT INTO `sensitive_word` VALUES ('3559', '深入浅出', null);
INSERT INTO `sensitive_word` VALUES ('3560', '深吻', null);
INSERT INTO `sensitive_word` VALUES ('3561', '生殖', null);
INSERT INTO `sensitive_word` VALUES ('3562', '失精', null);
INSERT INTO `sensitive_word` VALUES ('3563', '湿乎乎', null);
INSERT INTO `sensitive_word` VALUES ('3564', '湿滑', null);
INSERT INTO `sensitive_word` VALUES ('3565', '湿热下注证', null);
INSERT INTO `sensitive_word` VALUES ('3566', '湿软', null);
INSERT INTO `sensitive_word` VALUES ('3567', '湿濡', null);
INSERT INTO `sensitive_word` VALUES ('3568', '蚀骨', null);
INSERT INTO `sensitive_word` VALUES ('3569', '实臀', null);
INSERT INTO `sensitive_word` VALUES ('3570', '势如破竹', null);
INSERT INTO `sensitive_word` VALUES ('3571', '受精', null);
INSERT INTO `sensitive_word` VALUES ('3572', '受孕', null);
INSERT INTO `sensitive_word` VALUES ('3573', '兽奸', null);
INSERT INTO `sensitive_word` VALUES ('3574', '输精', null);
INSERT INTO `sensitive_word` VALUES ('3575', '舒爽', null);
INSERT INTO `sensitive_word` VALUES ('3576', '双唇', null);
INSERT INTO `sensitive_word` VALUES ('3577', '双峰', null);
INSERT INTO `sensitive_word` VALUES ('3578', '双箽下', null);
INSERT INTO `sensitive_word` VALUES ('3579', '双胯', null);
INSERT INTO `sensitive_word` VALUES ('3580', '双奶', null);
INSERT INTO `sensitive_word` VALUES ('3581', '双乳', null);
INSERT INTO `sensitive_word` VALUES ('3582', '双臀', null);
INSERT INTO `sensitive_word` VALUES ('3583', '妹爽', null);
INSERT INTO `sensitive_word` VALUES ('3584', '姐爽', null);
INSERT INTO `sensitive_word` VALUES ('3585', '哥爽', null);
INSERT INTO `sensitive_word` VALUES ('3586', '弟爽', null);
INSERT INTO `sensitive_word` VALUES ('3587', '我爽', null);
INSERT INTO `sensitive_word` VALUES ('3588', '水多', null);
INSERT INTO `sensitive_word` VALUES ('3589', '水乳交融', null);
INSERT INTO `sensitive_word` VALUES ('3590', '吮了', null);
INSERT INTO `sensitive_word` VALUES ('3591', '吮奶', null);
INSERT INTO `sensitive_word` VALUES ('3592', '吮吻', null);
INSERT INTO `sensitive_word` VALUES ('3593', '吮吸', null);
INSERT INTO `sensitive_word` VALUES ('3594', '吮咬', null);
INSERT INTO `sensitive_word` VALUES ('3595', '吮着', null);
INSERT INTO `sensitive_word` VALUES ('3596', '吮舐', null);
INSERT INTO `sensitive_word` VALUES ('3597', '硕大', null);
INSERT INTO `sensitive_word` VALUES ('3598', '硕乳', null);
INSERT INTO `sensitive_word` VALUES ('3599', '硕壮', null);
INSERT INTO `sensitive_word` VALUES ('3600', '撕开', null);
INSERT INTO `sensitive_word` VALUES ('3601', '撕裂', null);
INSERT INTO `sensitive_word` VALUES ('3602', '撕破', null);
INSERT INTO `sensitive_word` VALUES ('3603', '私部', null);
INSERT INTO `sensitive_word` VALUES ('3604', '死精', null);
INSERT INTO `sensitive_word` VALUES ('3605', '耸动', null);
INSERT INTO `sensitive_word` VALUES ('3606', '耸起', null);
INSERT INTO `sensitive_word` VALUES ('3607', '酥到', null);
INSERT INTO `sensitive_word` VALUES ('3608', '酥淋', null);
INSERT INTO `sensitive_word` VALUES ('3609', '酥熔', null);
INSERT INTO `sensitive_word` VALUES ('3610', '酥乳', null);
INSERT INTO `sensitive_word` VALUES ('3611', '酥软', null);
INSERT INTO `sensitive_word` VALUES ('3612', '酥爽', null);
INSERT INTO `sensitive_word` VALUES ('3613', '推揉', null);
INSERT INTO `sensitive_word` VALUES ('3614', '腿缝', null);
INSERT INTO `sensitive_word` VALUES ('3615', '腿根', null);
INSERT INTO `sensitive_word` VALUES ('3616', '腿间', null);
INSERT INTO `sensitive_word` VALUES ('3617', '褪下', null);
INSERT INTO `sensitive_word` VALUES ('3618', '吞食', null);
INSERT INTO `sensitive_word` VALUES ('3619', '吞精', null);
INSERT INTO `sensitive_word` VALUES ('3620', '拉屎', null);
INSERT INTO `sensitive_word` VALUES ('3621', '吃屎', null);
INSERT INTO `sensitive_word` VALUES ('3622', '妈逼', null);
INSERT INTO `sensitive_word` VALUES ('3623', '臀部', null);
INSERT INTO `sensitive_word` VALUES ('3624', '臀瓣', null);
INSERT INTO `sensitive_word` VALUES ('3625', '臀洞', null);
INSERT INTO `sensitive_word` VALUES ('3626', '臀缝', null);
INSERT INTO `sensitive_word` VALUES ('3627', '臀沟', null);
INSERT INTO `sensitive_word` VALUES ('3628', '臀股', null);
INSERT INTO `sensitive_word` VALUES ('3629', '臀尖', null);
INSERT INTO `sensitive_word` VALUES ('3630', '臀孔', null);
INSERT INTO `sensitive_word` VALUES ('3631', '臀丘', null);
INSERT INTO `sensitive_word` VALUES ('3632', '臀肉', null);
INSERT INTO `sensitive_word` VALUES ('3633', '臀腿', null);
INSERT INTO `sensitive_word` VALUES ('3634', '臀下', null);
INSERT INTO `sensitive_word` VALUES ('3635', '臀眼', null);
INSERT INTO `sensitive_word` VALUES ('3636', '臀后', null);
INSERT INTO `sensitive_word` VALUES ('3637', '脱光', null);
INSERT INTO `sensitive_word` VALUES ('3638', '脱裤', null);
INSERT INTO `sensitive_word` VALUES ('3639', '挖弄', null);
INSERT INTO `sensitive_word` VALUES ('3640', '外流', null);
INSERT INTO `sensitive_word` VALUES ('3641', '瘙痒', null);
INSERT INTO `sensitive_word` VALUES ('3642', '好痒', null);
INSERT INTO `sensitive_word` VALUES ('3643', '痒死', null);
INSERT INTO `sensitive_word` VALUES ('3644', '六九', null);
INSERT INTO `sensitive_word` VALUES ('3645', '玩摸', null);
INSERT INTO `sensitive_word` VALUES ('3646', '玩弄', null);
INSERT INTO `sensitive_word` VALUES ('3647', '完事', null);
INSERT INTO `sensitive_word` VALUES ('3648', '流产', null);
INSERT INTO `sensitive_word` VALUES ('3649', '万艾可', null);
INSERT INTO `sensitive_word` VALUES ('3650', '微隆', null);
INSERT INTO `sensitive_word` VALUES ('3651', '萎软', null);
INSERT INTO `sensitive_word` VALUES ('3652', '温存', null);
INSERT INTO `sensitive_word` VALUES ('3653', '温软', null);
INSERT INTO `sensitive_word` VALUES ('3654', '温湿', null);
INSERT INTO `sensitive_word` VALUES ('3655', '吻遍', null);
INSERT INTO `sensitive_word` VALUES ('3656', '吻摸', null);
INSERT INTO `sensitive_word` VALUES ('3657', '吻向', null);
INSERT INTO `sensitive_word` VALUES ('3658', '卧式', null);
INSERT INTO `sensitive_word` VALUES ('3659', '握缩感', null);
INSERT INTO `sensitive_word` VALUES ('3660', '月经', null);
INSERT INTO `sensitive_word` VALUES ('3661', '五征五欲', null);
INSERT INTO `sensitive_word` VALUES ('3662', '舞奴', null);
INSERT INTO `sensitive_word` VALUES ('3663', '吸功', null);
INSERT INTO `sensitive_word` VALUES ('3664', '吸吭', null);
INSERT INTO `sensitive_word` VALUES ('3665', '吸弄', null);
INSERT INTO `sensitive_word` VALUES ('3666', '吸舔', null);
INSERT INTO `sensitive_word` VALUES ('3667', '吸吻', null);
INSERT INTO `sensitive_word` VALUES ('3668', '吸咬', null);
INSERT INTO `sensitive_word` VALUES ('3669', '吸啜', null);
INSERT INTO `sensitive_word` VALUES ('3670', '吸聒', null);
INSERT INTO `sensitive_word` VALUES ('3671', '吸吮', null);
INSERT INTO `sensitive_word` VALUES ('3672', '细嫩', null);
INSERT INTO `sensitive_word` VALUES ('3673', '下贱', null);
INSERT INTO `sensitive_word` VALUES ('3674', '下阴', null);
INSERT INTO `sensitive_word` VALUES ('3675', '先摸', null);
INSERT INTO `sensitive_word` VALUES ('3676', '先射', null);
INSERT INTO `sensitive_word` VALUES ('3677', '鲜嫩', null);
INSERT INTO `sensitive_word` VALUES ('3678', '鲜润', null);
INSERT INTO `sensitive_word` VALUES ('3679', '咸咸', null);
INSERT INTO `sensitive_word` VALUES ('3680', '衔住', null);
INSERT INTO `sensitive_word` VALUES ('3681', '香唇', null);
INSERT INTO `sensitive_word` VALUES ('3682', '香滑', null);
INSERT INTO `sensitive_word` VALUES ('3683', '香肌', null);
INSERT INTO `sensitive_word` VALUES ('3684', '香肩', null);
INSERT INTO `sensitive_word` VALUES ('3685', '香津', null);
INSERT INTO `sensitive_word` VALUES ('3686', '香嫩', null);
INSERT INTO `sensitive_word` VALUES ('3687', '香软', null);
INSERT INTO `sensitive_word` VALUES ('3688', '香腮', null);
INSERT INTO `sensitive_word` VALUES ('3689', '香臀', null);
INSERT INTO `sensitive_word` VALUES ('3690', '香涎', null);
INSERT INTO `sensitive_word` VALUES ('3691', '想操', null);
INSERT INTO `sensitive_word` VALUES ('3692', '想舔', null);
INSERT INTO `sensitive_word` VALUES ('3693', '消精亘', null);
INSERT INTO `sensitive_word` VALUES ('3694', '小逼', null);
INSERT INTO `sensitive_word` VALUES ('3695', '小便', null);
INSERT INTO `sensitive_word` VALUES ('3696', '小唇', null);
INSERT INTO `sensitive_word` VALUES ('3697', '小弟第', null);
INSERT INTO `sensitive_word` VALUES ('3698', '小弟弟', null);
INSERT INTO `sensitive_word` VALUES ('3699', '小洞', null);
INSERT INTO `sensitive_word` VALUES ('3700', '小缝', null);
INSERT INTO `sensitive_word` VALUES ('3701', '小核', null);
INSERT INTO `sensitive_word` VALUES ('3702', '小鸸', null);
INSERT INTO `sensitive_word` VALUES ('3703', '小咀', null);
INSERT INTO `sensitive_word` VALUES ('3704', '小屁眼', null);
INSERT INTO `sensitive_word` VALUES ('3705', '小乳', null);
INSERT INTO `sensitive_word` VALUES ('3706', '小舌', null);
INSERT INTO `sensitive_word` VALUES ('3707', '小腿', null);
INSERT INTO `sensitive_word` VALUES ('3708', '小雄', null);
INSERT INTO `sensitive_word` VALUES ('3709', '小腰', null);
INSERT INTO `sensitive_word` VALUES ('3710', '挟紧双腿', null);
INSERT INTO `sensitive_word` VALUES ('3711', '泄出', null);
INSERT INTO `sensitive_word` VALUES ('3712', '泄洪', null);
INSERT INTO `sensitive_word` VALUES ('3713', '泄精', null);
INSERT INTO `sensitive_word` VALUES ('3714', '泄了', null);
INSERT INTO `sensitive_word` VALUES ('3715', '泄射', null);
INSERT INTO `sensitive_word` VALUES ('3716', '泄身', null);
INSERT INTO `sensitive_word` VALUES ('3717', '泄欲', null);
INSERT INTO `sensitive_word` VALUES ('3718', '泻出', null);
INSERT INTO `sensitive_word` VALUES ('3719', '泻了', null);
INSERT INTO `sensitive_word` VALUES ('3720', '新婚', null);
INSERT INTO `sensitive_word` VALUES ('3721', '心痒', null);
INSERT INTO `sensitive_word` VALUES ('3722', '阳萎', null);
INSERT INTO `sensitive_word` VALUES ('3723', '行淫', null);
INSERT INTO `sensitive_word` VALUES ('3724', '性欲', null);
INSERT INTO `sensitive_word` VALUES ('3725', '性奋', null);
INSERT INTO `sensitive_word` VALUES ('3726', '性黄金', null);
INSERT INTO `sensitive_word` VALUES ('3727', '性冷感', null);
INSERT INTO `sensitive_word` VALUES ('3728', '性冷淡', null);
INSERT INTO `sensitive_word` VALUES ('3729', '性力', null);
INSERT INTO `sensitive_word` VALUES ('3730', '性脉博', null);
INSERT INTO `sensitive_word` VALUES ('3731', '性脉搏', null);
INSERT INTO `sensitive_word` VALUES ('3732', '性器官', null);
INSERT INTO `sensitive_word` VALUES ('3733', '性侵犯', null);
INSERT INTO `sensitive_word` VALUES ('3734', '性情', null);
INSERT INTO `sensitive_word` VALUES ('3735', '性生活', null);
INSERT INTO `sensitive_word` VALUES ('3736', '性事', null);
INSERT INTO `sensitive_word` VALUES ('3737', '性妄想症', null);
INSERT INTO `sensitive_word` VALUES ('3738', '性戏', null);
INSERT INTO `sensitive_word` VALUES ('3739', '性腺', null);
INSERT INTO `sensitive_word` VALUES ('3740', '性心理障碍', null);
INSERT INTO `sensitive_word` VALUES ('3741', '性信号', null);
INSERT INTO `sensitive_word` VALUES ('3742', '性行为', null);
INSERT INTO `sensitive_word` VALUES ('3743', '性招式', null);
INSERT INTO `sensitive_word` VALUES ('3744', '凶勐', null);
INSERT INTO `sensitive_word` VALUES ('3745', '胸脯', null);
INSERT INTO `sensitive_word` VALUES ('3746', '胸推', null);
INSERT INTO `sensitive_word` VALUES ('3747', '胸型', null);
INSERT INTO `sensitive_word` VALUES ('3748', '羞态', null);
INSERT INTO `sensitive_word` VALUES ('3749', '秀媚', null);
INSERT INTO `sensitive_word` VALUES ('3750', '秀挺', null);
INSERT INTO `sensitive_word` VALUES ('3751', '蓄精', null);
INSERT INTO `sensitive_word` VALUES ('3752', '宣淫', null);
INSERT INTO `sensitive_word` VALUES ('3753', '穴壁', null);
INSERT INTO `sensitive_word` VALUES ('3754', '穴唇', null);
INSERT INTO `sensitive_word` VALUES ('3755', '穴道', null);
INSERT INTO `sensitive_word` VALUES ('3756', '穴洞', null);
INSERT INTO `sensitive_word` VALUES ('3757', '穴缝', null);
INSERT INTO `sensitive_word` VALUES ('3758', '穴门', null);
INSERT INTO `sensitive_word` VALUES ('3759', '穴肉', null);
INSERT INTO `sensitive_word` VALUES ('3760', '穴水', null);
INSERT INTO `sensitive_word` VALUES ('3761', '穴心', null);
INSERT INTO `sensitive_word` VALUES ('3762', '穴裡', null);
INSERT INTO `sensitive_word` VALUES ('3763', '穴穴', null);
INSERT INTO `sensitive_word` VALUES ('3764', '穴眼', null);
INSERT INTO `sensitive_word` VALUES ('3765', '穴痒', null);
INSERT INTO `sensitive_word` VALUES ('3766', '雪颈', null);
INSERT INTO `sensitive_word` VALUES ('3767', '雪臀', null);
INSERT INTO `sensitive_word` VALUES ('3768', '血精', null);
INSERT INTO `sensitive_word` VALUES ('3769', '艳妇', null);
INSERT INTO `sensitive_word` VALUES ('3770', '艳肉', null);
INSERT INTO `sensitive_word` VALUES ('3771', '艳臀', null);
INSERT INTO `sensitive_word` VALUES ('3772', '羊水', null);
INSERT INTO `sensitive_word` VALUES ('3773', '阳峰', null);
INSERT INTO `sensitive_word` VALUES ('3774', '阳根', null);
INSERT INTO `sensitive_word` VALUES ('3775', '阳茎', null);
INSERT INTO `sensitive_word` VALUES ('3776', '阳精', null);
INSERT INTO `sensitive_word` VALUES ('3777', '阳事渐衰', null);
INSERT INTO `sensitive_word` VALUES ('3778', '阳水', null);
INSERT INTO `sensitive_word` VALUES ('3779', '阳物', null);
INSERT INTO `sensitive_word` VALUES ('3780', '养精', null);
INSERT INTO `sensitive_word` VALUES ('3781', '腰际', null);
INSERT INTO `sensitive_word` VALUES ('3782', '腰臀', null);
INSERT INTO `sensitive_word` VALUES ('3783', '腰枝', null);
INSERT INTO `sensitive_word` VALUES ('3784', '妖媚', null);
INSERT INTO `sensitive_word` VALUES ('3785', '妖艳', null);
INSERT INTO `sensitive_word` VALUES ('3786', '妖淫', null);
INSERT INTO `sensitive_word` VALUES ('3787', '咬扯', null);
INSERT INTO `sensitive_word` VALUES ('3788', '野合', null);
INSERT INTO `sensitive_word` VALUES ('3789', '冶荡', null);
INSERT INTO `sensitive_word` VALUES ('3790', '腋尾', null);
INSERT INTO `sensitive_word` VALUES ('3791', '夜御数女', null);
INSERT INTO `sensitive_word` VALUES ('3792', '一泻千里', null);
INSERT INTO `sensitive_word` VALUES ('3793', '遗精', null);
INSERT INTO `sensitive_word` VALUES ('3794', '意淫', null);
INSERT INTO `sensitive_word` VALUES ('3795', '益精', null);
INSERT INTO `sensitive_word` VALUES ('3796', '溢精', null);
INSERT INTO `sensitive_word` VALUES ('3797', '溢乳', null);
INSERT INTO `sensitive_word` VALUES ('3798', '荫茎', null);
INSERT INTO `sensitive_word` VALUES ('3799', '殷红', null);
INSERT INTO `sensitive_word` VALUES ('3800', '阴□', null);
INSERT INTO `sensitive_word` VALUES ('3801', '阴壁', null);
INSERT INTO `sensitive_word` VALUES ('3802', '阴埠', null);
INSERT INTO `sensitive_word` VALUES ('3803', '阴洞', null);
INSERT INTO `sensitive_word` VALUES ('3804', '阴缝', null);
INSERT INTO `sensitive_word` VALUES ('3805', '阴沟', null);
INSERT INTO `sensitive_word` VALUES ('3806', '阴垢', null);
INSERT INTO `sensitive_word` VALUES ('3807', '阴径', null);
INSERT INTO `sensitive_word` VALUES ('3808', '阴门', null);
INSERT INTO `sensitive_word` VALUES ('3809', '阴肉', null);
INSERT INTO `sensitive_word` VALUES ('3810', '阴水', null);
INSERT INTO `sensitive_word` VALUES ('3811', '阴庭', null);
INSERT INTO `sensitive_word` VALUES ('3812', '阴虚火', null);
INSERT INTO `sensitive_word` VALUES ('3813', '阴穴', null);
INSERT INTO `sensitive_word` VALUES ('3814', '阴液', null);
INSERT INTO `sensitive_word` VALUES ('3815', '淫荡', null);
INSERT INTO `sensitive_word` VALUES ('3816', '淫靡', null);
INSERT INTO `sensitive_word` VALUES ('3817', '淫液', null);
INSERT INTO `sensitive_word` VALUES ('3818', '淫棒', null);
INSERT INTO `sensitive_word` VALUES ('3819', '淫唇', null);
INSERT INTO `sensitive_word` VALUES ('3820', '淫洞', null);
INSERT INTO `sensitive_word` VALUES ('3821', '淫妇', null);
INSERT INTO `sensitive_word` VALUES ('3822', '淫哥', null);
INSERT INTO `sensitive_word` VALUES ('3823', '淫根', null);
INSERT INTO `sensitive_word` VALUES ('3824', '淫棍', null);
INSERT INTO `sensitive_word` VALUES ('3825', '淫果', null);
INSERT INTO `sensitive_word` VALUES ('3826', '淫合', null);
INSERT INTO `sensitive_word` VALUES ('3827', '淫花', null);
INSERT INTO `sensitive_word` VALUES ('3828', '淫秽', null);
INSERT INTO `sensitive_word` VALUES ('3829', '淫火', null);
INSERT INTO `sensitive_word` VALUES ('3830', '淫贱', null);
INSERT INTO `sensitive_word` VALUES ('3831', '淫溅', null);
INSERT INTO `sensitive_word` VALUES ('3832', '淫叫', null);
INSERT INTO `sensitive_word` VALUES ('3833', '淫津', null);
INSERT INTO `sensitive_word` VALUES ('3834', '淫精', null);
INSERT INTO `sensitive_word` VALUES ('3835', '淫具', null);
INSERT INTO `sensitive_word` VALUES ('3836', '淫浪', null);
INSERT INTO `sensitive_word` VALUES ('3837', '淫乱', null);
INSERT INTO `sensitive_word` VALUES ('3838', '淫毛', null);
INSERT INTO `sensitive_word` VALUES ('3839', '淫媚', null);
INSERT INTO `sensitive_word` VALUES ('3840', '淫糜', null);
INSERT INTO `sensitive_word` VALUES ('3841', '淫母', null);
INSERT INTO `sensitive_word` VALUES ('3842', '淫念', null);
INSERT INTO `sensitive_word` VALUES ('3843', '淫女', null);
INSERT INTO `sensitive_word` VALUES ('3844', '淫虐', null);
INSERT INTO `sensitive_word` VALUES ('3845', '淫腔', null);
INSERT INTO `sensitive_word` VALUES ('3846', '淫情', null);
INSERT INTO `sensitive_word` VALUES ('3847', '淫人', null);
INSERT INTO `sensitive_word` VALUES ('3848', '淫乳', null);
INSERT INTO `sensitive_word` VALUES ('3849', '淫骚', null);
INSERT INTO `sensitive_word` VALUES ('3850', '淫色', null);
INSERT INTO `sensitive_word` VALUES ('3851', '淫舌', null);
INSERT INTO `sensitive_word` VALUES ('3852', '淫神', null);
INSERT INTO `sensitive_word` VALUES ('3853', '淫声', null);
INSERT INTO `sensitive_word` VALUES ('3854', '淫事', null);
INSERT INTO `sensitive_word` VALUES ('3855', '淫态', null);
INSERT INTO `sensitive_word` VALUES ('3856', '淫汤', null);
INSERT INTO `sensitive_word` VALUES ('3857', '淫臀', null);
INSERT INTO `sensitive_word` VALUES ('3858', '淫娃', null);
INSERT INTO `sensitive_word` VALUES ('3859', '淫物', null);
INSERT INTO `sensitive_word` VALUES ('3860', '淫香', null);
INSERT INTO `sensitive_word` VALUES ('3861', '淫笑', null);
INSERT INTO `sensitive_word` VALUES ('3862', '淫邪', null);
INSERT INTO `sensitive_word` VALUES ('3863', '淫心', null);
INSERT INTO `sensitive_word` VALUES ('3864', '淫兴', null);
INSERT INTO `sensitive_word` VALUES ('3865', '淫性', null);
INSERT INTO `sensitive_word` VALUES ('3866', '淫嗅味', null);
INSERT INTO `sensitive_word` VALUES ('3867', '淫血', null);
INSERT INTO `sensitive_word` VALUES ('3868', '淫言', null);
INSERT INTO `sensitive_word` VALUES ('3869', '淫艳', null);
INSERT INTO `sensitive_word` VALUES ('3870', '淫宴', null);
INSERT INTO `sensitive_word` VALUES ('3871', '淫痒', null);
INSERT INTO `sensitive_word` VALUES ('3872', '淫逸', null);
INSERT INTO `sensitive_word` VALUES ('3873', '淫友', null);
INSERT INTO `sensitive_word` VALUES ('3874', '淫语', null);
INSERT INTO `sensitive_word` VALUES ('3875', '淫欲', null);
INSERT INTO `sensitive_word` VALUES ('3876', '淫汁', null);
INSERT INTO `sensitive_word` VALUES ('3877', '淫挚', null);
INSERT INTO `sensitive_word` VALUES ('3878', '淫纵', null);
INSERT INTO `sensitive_word` VALUES ('3879', '淫嘴', null);
INSERT INTO `sensitive_word` VALUES ('3880', '淫狎', null);
INSERT INTO `sensitive_word` VALUES ('3881', '淫猥', null);
INSERT INTO `sensitive_word` VALUES ('3882', '引逗', null);
INSERT INTO `sensitive_word` VALUES ('3883', '引诱', null);
INSERT INTO `sensitive_word` VALUES ('3884', '樱唇', null);
INSERT INTO `sensitive_word` VALUES ('3885', '樱口', null);
INSERT INTO `sensitive_word` VALUES ('3886', '硬邦邦', null);
INSERT INTO `sensitive_word` VALUES ('3887', '硬梆梆', null);
INSERT INTO `sensitive_word` VALUES ('3888', '硬绑绑', null);
INSERT INTO `sensitive_word` VALUES ('3889', '硬茎', null);
INSERT INTO `sensitive_word` VALUES ('3890', '硬立', null);
INSERT INTO `sensitive_word` VALUES ('3891', '硬热', null);
INSERT INTO `sensitive_word` VALUES ('3892', '硬挺', null);
INSERT INTO `sensitive_word` VALUES ('3893', '硬物', null);
INSERT INTO `sensitive_word` VALUES ('3894', '硬下疳', null);
INSERT INTO `sensitive_word` VALUES ('3895', '硬涨', null);
INSERT INTO `sensitive_word` VALUES ('3896', '硬胀', null);
INSERT INTO `sensitive_word` VALUES ('3897', '勇勐', null);
INSERT INTO `sensitive_word` VALUES ('3898', '用力一顶', null);
INSERT INTO `sensitive_word` VALUES ('3899', '幽洞', null);
INSERT INTO `sensitive_word` VALUES ('3900', '幽户', null);
INSERT INTO `sensitive_word` VALUES ('3901', '有舒有缓', null);
INSERT INTO `sensitive_word` VALUES ('3902', '右乳', null);
INSERT INTO `sensitive_word` VALUES ('3903', '右臀', null);
INSERT INTO `sensitive_word` VALUES ('3904', '左乳', null);
INSERT INTO `sensitive_word` VALUES ('3905', '左臀', null);
INSERT INTO `sensitive_word` VALUES ('3906', '又稠又粘', null);
INSERT INTO `sensitive_word` VALUES ('3907', '又粗又短', null);
INSERT INTO `sensitive_word` VALUES ('3908', '又肥又厚', null);
INSERT INTO `sensitive_word` VALUES ('3909', '又美又嫩', null);
INSERT INTO `sensitive_word` VALUES ('3910', '又细又嫩', null);
INSERT INTO `sensitive_word` VALUES ('3911', '又咬又舔又吸', null);
INSERT INTO `sensitive_word` VALUES ('3912', '又肿又大', null);
INSERT INTO `sensitive_word` VALUES ('3913', '玉腿', null);
INSERT INTO `sensitive_word` VALUES ('3914', '玉棒', null);
INSERT INTO `sensitive_word` VALUES ('3915', '玉背', null);
INSERT INTO `sensitive_word` VALUES ('3916', '玉臂', null);
INSERT INTO `sensitive_word` VALUES ('3917', '玉齿', null);
INSERT INTO `sensitive_word` VALUES ('3918', '玉洞', null);
INSERT INTO `sensitive_word` VALUES ('3919', '玉房', null);
INSERT INTO `sensitive_word` VALUES ('3920', '玉峰', null);
INSERT INTO `sensitive_word` VALUES ('3921', '玉缝', null);
INSERT INTO `sensitive_word` VALUES ('3922', '玉肤', null);
INSERT INTO `sensitive_word` VALUES ('3923', '玉棍', null);
INSERT INTO `sensitive_word` VALUES ('3924', '玉户', null);
INSERT INTO `sensitive_word` VALUES ('3925', '玉肌', null);
INSERT INTO `sensitive_word` VALUES ('3926', '玉浆', null);
INSERT INTO `sensitive_word` VALUES ('3927', '玉脚', null);
INSERT INTO `sensitive_word` VALUES ('3928', '玉茎', null);
INSERT INTO `sensitive_word` VALUES ('3929', '玉颈', null);
INSERT INTO `sensitive_word` VALUES ('3930', '玉乳', null);
INSERT INTO `sensitive_word` VALUES ('3931', '玉蕊', null);
INSERT INTO `sensitive_word` VALUES ('3932', '玉体', null);
INSERT INTO `sensitive_word` VALUES ('3933', '玉臀', null);
INSERT INTO `sensitive_word` VALUES ('3934', '玉穴', null);
INSERT INTO `sensitive_word` VALUES ('3935', '玉液', null);
INSERT INTO `sensitive_word` VALUES ('3936', '玉液般', null);
INSERT INTO `sensitive_word` VALUES ('3937', '玉指', null);
INSERT INTO `sensitive_word` VALUES ('3938', '玉柱', null);
INSERT INTO `sensitive_word` VALUES ('3939', '玉麈', null);
INSERT INTO `sensitive_word` VALUES ('3940', '愈插愈快', null);
INSERT INTO `sensitive_word` VALUES ('3941', '欲感', null);
INSERT INTO `sensitive_word` VALUES ('3942', '欲焰', null);
INSERT INTO `sensitive_word` VALUES ('3943', '圆粗', null);
INSERT INTO `sensitive_word` VALUES ('3944', '圆鼓鼓', null);
INSERT INTO `sensitive_word` VALUES ('3945', '圆滚', null);
INSERT INTO `sensitive_word` VALUES ('3946', '圆翘', null);
INSERT INTO `sensitive_word` VALUES ('3947', '圆臀', null);
INSERT INTO `sensitive_word` VALUES ('3948', '允吸', null);
INSERT INTO `sensitive_word` VALUES ('3949', '早泄', null);
INSERT INTO `sensitive_word` VALUES ('3950', '造爱', null);
INSERT INTO `sensitive_word` VALUES ('3951', '增粗', null);
INSERT INTO `sensitive_word` VALUES ('3952', '粘稠', null);
INSERT INTO `sensitive_word` VALUES ('3953', '粘乎乎', null);
INSERT INTO `sensitive_word` VALUES ('3954', '粘滑', null);
INSERT INTO `sensitive_word` VALUES ('3955', '粘膜', null);
INSERT INTO `sensitive_word` VALUES ('3956', '站立式', null);
INSERT INTO `sensitive_word` VALUES ('3957', '胀大', null);
INSERT INTO `sensitive_word` VALUES ('3958', '胀得', null);
INSERT INTO `sensitive_word` VALUES ('3959', '胀红', null);
INSERT INTO `sensitive_word` VALUES ('3960', '胀破', null);
INSERT INTO `sensitive_word` VALUES ('3961', '胀疼', null);
INSERT INTO `sensitive_word` VALUES ('3962', '胀硬', null);
INSERT INTO `sensitive_word` VALUES ('3963', '胀胀', null);
INSERT INTO `sensitive_word` VALUES ('3964', '整根', null);
INSERT INTO `sensitive_word` VALUES ('3965', '直插', null);
INSERT INTO `sensitive_word` VALUES ('3966', '直肠', null);
INSERT INTO `sensitive_word` VALUES ('3967', '直挺挺', null);
INSERT INTO `sensitive_word` VALUES ('3968', '治荡', null);
INSERT INTO `sensitive_word` VALUES ('3969', '肿涨', null);
INSERT INTO `sensitive_word` VALUES ('3970', '肿胀', null);
INSERT INTO `sensitive_word` VALUES ('3971', '朱唇', null);
INSERT INTO `sensitive_word` VALUES ('3972', '抓捏', null);
INSERT INTO `sensitive_word` VALUES ('3973', '抓弄', null);
INSERT INTO `sensitive_word` VALUES ('3974', '抓揉', null);
INSERT INTO `sensitive_word` VALUES ('3975', '专奸', null);
INSERT INTO `sensitive_word` VALUES ('3976', '壮神', null);
INSERT INTO `sensitive_word` VALUES ('3977', '神鞭', null);
INSERT INTO `sensitive_word` VALUES ('3978', '壮盛', null);
INSERT INTO `sensitive_word` VALUES ('3979', '自淫', null);
INSERT INTO `sensitive_word` VALUES ('3980', '自渎', null);
INSERT INTO `sensitive_word` VALUES ('3981', '纵欲', null);
INSERT INTO `sensitive_word` VALUES ('3982', '坐式', null);
INSERT INTO `sensitive_word` VALUES ('3983', '厮缠', null);
INSERT INTO `sensitive_word` VALUES ('3984', '厮磨', null);
INSERT INTO `sensitive_word` VALUES ('3985', '撸着', null);
INSERT INTO `sensitive_word` VALUES ('3986', '攥住', null);
INSERT INTO `sensitive_word` VALUES ('3987', '啜吸', null);
INSERT INTO `sensitive_word` VALUES ('3988', '啜着', null);
INSERT INTO `sensitive_word` VALUES ('3989', '噙住', null);
INSERT INTO `sensitive_word` VALUES ('3990', '后穴', null);
INSERT INTO `sensitive_word` VALUES ('3991', '后洞', null);
INSERT INTO `sensitive_word` VALUES ('3992', '后进', null);
INSERT INTO `sensitive_word` VALUES ('3993', '狎弄', null);
INSERT INTO `sensitive_word` VALUES ('3994', '狎玩', null);
INSERT INTO `sensitive_word` VALUES ('3995', '猬亵', null);
INSERT INTO `sensitive_word` VALUES ('3996', '汩汩', null);
INSERT INTO `sensitive_word` VALUES ('3997', '涓涓', null);
INSERT INTO `sensitive_word` VALUES ('3998', '涔涔', null);
INSERT INTO `sensitive_word` VALUES ('3999', '渲泄', null);
INSERT INTO `sensitive_word` VALUES ('4000', '溽湿', null);
INSERT INTO `sensitive_word` VALUES ('4001', '潺潺', null);
INSERT INTO `sensitive_word` VALUES ('4002', '濡湿', null);
INSERT INTO `sensitive_word` VALUES ('4003', '尻臀', null);
INSERT INTO `sensitive_word` VALUES ('4004', '膣壁', null);
INSERT INTO `sensitive_word` VALUES ('4005', '膣口', null);
INSERT INTO `sensitive_word` VALUES ('4006', '膣肉', null);
INSERT INTO `sensitive_word` VALUES ('4007', '膣穴', null);
INSERT INTO `sensitive_word` VALUES ('4008', '黏煳', null);
INSERT INTO `sensitive_word` VALUES ('4009', '黏滑', null);
INSERT INTO `sensitive_word` VALUES ('4010', '黏膜', null);
INSERT INTO `sensitive_word` VALUES ('4011', '黏腻', null);
INSERT INTO `sensitive_word` VALUES ('4012', '黏热', null);
INSERT INTO `sensitive_word` VALUES ('4013', '黏湿', null);
INSERT INTO `sensitive_word` VALUES ('4014', '裆部', null);
INSERT INTO `sensitive_word` VALUES ('4015', '舐弄', null);
INSERT INTO `sensitive_word` VALUES ('4016', '舐去', null);
INSERT INTO `sensitive_word` VALUES ('4017', '舐吮', null);
INSERT INTO `sensitive_word` VALUES ('4018', '舐吻', null);
INSERT INTO `sensitive_word` VALUES ('4019', '稣胸', null);
INSERT INTO `sensitive_word` VALUES ('4020', '屠城', null);
INSERT INTO `sensitive_word` VALUES ('4021', '屠杀', null);
INSERT INTO `sensitive_word` VALUES ('4022', '虐杀', null);
INSERT INTO `sensitive_word` VALUES ('4023', '当政', null);
INSERT INTO `sensitive_word` VALUES ('4024', '党的', null);
INSERT INTO `sensitive_word` VALUES ('4025', '党籍', null);
INSERT INTO `sensitive_word` VALUES ('4026', '党纪', null);
INSERT INTO `sensitive_word` VALUES ('4027', '国法', null);
INSERT INTO `sensitive_word` VALUES ('4028', '党内', null);
INSERT INTO `sensitive_word` VALUES ('4029', '党委', null);
INSERT INTO `sensitive_word` VALUES ('4030', '党员', null);
INSERT INTO `sensitive_word` VALUES ('4031', '党章', null);
INSERT INTO `sensitive_word` VALUES ('4032', '党政', null);
INSERT INTO `sensitive_word` VALUES ('4033', '邓小平', null);
INSERT INTO `sensitive_word` VALUES ('4034', '毒瘾', null);
INSERT INTO `sensitive_word` VALUES ('4035', '断子绝孙', null);
INSERT INTO `sensitive_word` VALUES ('4036', '疯狗', null);
INSERT INTO `sensitive_word` VALUES ('4037', '政权', null);
INSERT INTO `sensitive_word` VALUES ('4038', '共党', null);
INSERT INTO `sensitive_word` VALUES ('4039', '狗命', null);
INSERT INTO `sensitive_word` VALUES ('4040', '荒淫', null);
INSERT INTO `sensitive_word` VALUES ('4041', '奸污', null);
INSERT INTO `sensitive_word` VALUES ('4042', '宪法', null);
INSERT INTO `sensitive_word` VALUES ('4044', '尿', null);
INSERT INTO `sensitive_word` VALUES ('4045', 'niào', null);
INSERT INTO `sensitive_word` VALUES ('4047', '肛', null);
INSERT INTO `sensitive_word` VALUES ('4048', '婊', null);
INSERT INTO `sensitive_word` VALUES ('4049', '乱舔', null);
INSERT INTO `sensitive_word` VALUES ('4050', '轮暴', null);
INSERT INTO `sensitive_word` VALUES ('4051', '轮奸', null);
INSERT INTO `sensitive_word` VALUES ('4052', '锁精术', null);
INSERT INTO `sensitive_word` VALUES ('4053', '她的波', null);
INSERT INTO `sensitive_word` VALUES ('4054', '她的奶', null);
INSERT INTO `sensitive_word` VALUES ('4055', '她的下面', null);
INSERT INTO `sensitive_word` VALUES ('4056', '贪淫', null);
INSERT INTO `sensitive_word` VALUES ('4057', '烫热', null);
INSERT INTO `sensitive_word` VALUES ('4058', '套动', null);
INSERT INTO `sensitive_word` VALUES ('4059', '套紧', null);
INSERT INTO `sensitive_word` VALUES ('4060', '套上', null);
INSERT INTO `sensitive_word` VALUES ('4061', '提枪', null);
INSERT INTO `sensitive_word` VALUES ('4062', '提睾', null);
INSERT INTO `sensitive_word` VALUES ('4063', '骚', null);
INSERT INTO `sensitive_word` VALUES ('4064', '奸', null);
INSERT INTO `sensitive_word` VALUES ('4065', '淫', null);
INSERT INTO `sensitive_word` VALUES ('4066', '菊孔', null);
INSERT INTO `sensitive_word` VALUES ('4067', '酥胸', null);
INSERT INTO `sensitive_word` VALUES ('4069', 'SΜ', null);
INSERT INTO `sensitive_word` VALUES ('4070', '三个代表', null);
INSERT INTO `sensitive_word` VALUES ('4072', '情趣', null);
INSERT INTO `sensitive_word` VALUES ('4073', '韩国', null);
INSERT INTO `sensitive_word` VALUES ('4074', '麻痹', null);
INSERT INTO `sensitive_word` VALUES ('4075', '魔性', null);
INSERT INTO `sensitive_word` VALUES ('4076', '下九流', null);
INSERT INTO `sensitive_word` VALUES ('4077', '下三烂', null);
INSERT INTO `sensitive_word` VALUES ('4078', '穴位', null);
INSERT INTO `sensitive_word` VALUES ('4079', '央视', null);
INSERT INTO `sensitive_word` VALUES ('4081', '阴阳', null);
INSERT INTO `sensitive_word` VALUES ('4082', '淫威', null);
INSERT INTO `sensitive_word` VALUES ('4083', '硬逼', null);
INSERT INTO `sensitive_word` VALUES ('4084', '诱骗', null);
INSERT INTO `sensitive_word` VALUES ('4085', '诱迫', null);
INSERT INTO `sensitive_word` VALUES ('4086', '大使', null);
INSERT INTO `sensitive_word` VALUES ('4088', '暴行', null);
INSERT INTO `sensitive_word` VALUES ('4089', '坟墓', null);
INSERT INTO `sensitive_word` VALUES ('4090', '壮举', null);
INSERT INTO `sensitive_word` VALUES ('4091', '追查', null);
INSERT INTO `sensitive_word` VALUES ('4092', '走狗', null);
INSERT INTO `sensitive_word` VALUES ('4093', '走漏', null);
INSERT INTO `sensitive_word` VALUES ('4094', '作证', null);
INSERT INTO `sensitive_word` VALUES ('4096', '江贼', null);
INSERT INTO `sensitive_word` VALUES ('4097', '江川县', null);
INSERT INTO `sensitive_word` VALUES ('4098', '江的', null);
INSERT INTO `sensitive_word` VALUES ('4099', '江集团', null);
INSERT INTO `sensitive_word` VALUES ('4100', '江家帮', null);
INSERT INTO `sensitive_word` VALUES ('4101', '江锦恒', null);
INSERT INTO `sensitive_word` VALUES ('4102', '江静', null);
INSERT INTO `sensitive_word` VALUES ('4103', '江李朱', null);
INSERT INTO `sensitive_word` VALUES ('4104', '江罗', null);
INSERT INTO `sensitive_word` VALUES ('4105', '江死穴', null);
INSERT INTO `sensitive_word` VALUES ('4106', '江拥军', null);
INSERT INTO `sensitive_word` VALUES ('4107', '江责民', null);
INSERT INTO `sensitive_word` VALUES ('4108', '江折民', null);
INSERT INTO `sensitive_word` VALUES ('4109', '蒋垂平', null);
INSERT INTO `sensitive_word` VALUES ('4110', '蒋德军', null);
INSERT INTO `sensitive_word` VALUES ('4111', '蒋红', null);
INSERT INTO `sensitive_word` VALUES ('4112', '焦点谎谈', null);
INSERT INTO `sensitive_word` VALUES ('4113', '教规', null);
INSERT INTO `sensitive_word` VALUES ('4114', '教化', null);
INSERT INTO `sensitive_word` VALUES ('4115', '教皇', null);
INSERT INTO `sensitive_word` VALUES ('4116', '教会', null);
INSERT INTO `sensitive_word` VALUES ('4117', '教诲', null);
INSERT INTO `sensitive_word` VALUES ('4118', '教派', null);
INSERT INTO `sensitive_word` VALUES ('4119', '教区', null);
INSERT INTO `sensitive_word` VALUES ('4120', '教唆', null);
INSERT INTO `sensitive_word` VALUES ('4121', '教堂', null);
INSERT INTO `sensitive_word` VALUES ('4122', '教友', null);
INSERT INTO `sensitive_word` VALUES ('4123', '教育转化', null);
INSERT INTO `sensitive_word` VALUES ('4124', '强拆', null);
INSERT INTO `sensitive_word` VALUES ('4125', '拆房', null);
INSERT INTO `sensitive_word` VALUES ('4126', '揭发', null);
INSERT INTO `sensitive_word` VALUES ('4127', '揭密', null);
INSERT INTO `sensitive_word` VALUES ('4128', '揭批', null);
INSERT INTO `sensitive_word` VALUES ('4129', '揭示', null);
INSERT INTO `sensitive_word` VALUES ('4130', '阶下囚', null);
INSERT INTO `sensitive_word` VALUES ('4131', '看守所', null);
INSERT INTO `sensitive_word` VALUES ('4132', '劫夺', null);
INSERT INTO `sensitive_word` VALUES ('4133', '劫难', null);
INSERT INTO `sensitive_word` VALUES ('4134', '劫数', null);
INSERT INTO `sensitive_word` VALUES ('4135', '结社', null);
INSERT INTO `sensitive_word` VALUES ('4136', '解教', null);
INSERT INTO `sensitive_word` VALUES ('4137', '戒毒', null);
INSERT INTO `sensitive_word` VALUES ('4138', '戒毒所', null);
INSERT INTO `sensitive_word` VALUES ('4139', '戒律', null);
INSERT INTO `sensitive_word` VALUES ('4140', '江湖骗', null);
INSERT INTO `sensitive_word` VALUES ('4141', '江湖大骗', null);
INSERT INTO `sensitive_word` VALUES ('4142', '金有明', null);
INSERT INTO `sensitive_word` VALUES ('4143', '江胡', null);
INSERT INTO `sensitive_word` VALUES ('4144', '进修', null);
INSERT INTO `sensitive_word` VALUES ('4145', '禁闭', null);
INSERT INTO `sensitive_word` VALUES ('4146', '禁令', null);
INSERT INTO `sensitive_word` VALUES ('4147', '禁锢', null);
INSERT INTO `sensitive_word` VALUES ('4148', '尽人皆知', null);
INSERT INTO `sensitive_word` VALUES ('4149', '京城血桉', null);
INSERT INTO `sensitive_word` VALUES ('4150', '惊骇', null);
INSERT INTO `sensitive_word` VALUES ('4151', '精神病', null);
INSERT INTO `sensitive_word` VALUES ('4152', '精神分裂症', null);
INSERT INTO `sensitive_word` VALUES ('4153', '警笛', null);
INSERT INTO `sensitive_word` VALUES ('4154', '警服', null);
INSERT INTO `sensitive_word` VALUES ('4155', '警官', null);
INSERT INTO `sensitive_word` VALUES ('4156', '警棍', null);
INSERT INTO `sensitive_word` VALUES ('4157', '警号', null);
INSERT INTO `sensitive_word` VALUES ('4158', '警界', null);
INSERT INTO `sensitive_word` VALUES ('4159', '警局', null);
INSERT INTO `sensitive_word` VALUES ('4160', '警绳', null);
INSERT INTO `sensitive_word` VALUES ('4161', '拘捕', null);
INSERT INTO `sensitive_word` VALUES ('4162', '拘禁', null);
INSERT INTO `sensitive_word` VALUES ('4163', '拘留所', null);
INSERT INTO `sensitive_word` VALUES ('4164', '拘押', null);
INSERT INTO `sensitive_word` VALUES ('4165', '拘役', null);
INSERT INTO `sensitive_word` VALUES ('4166', '居留', null);
INSERT INTO `sensitive_word` VALUES ('4167', '举发', null);
INSERT INTO `sensitive_word` VALUES ('4168', '举国上下', null);
INSERT INTO `sensitive_word` VALUES ('4169', '觉悟', null);
INSERT INTO `sensitive_word` VALUES ('4170', '决心书', null);
INSERT INTO `sensitive_word` VALUES ('4171', '绝裂书', null);
INSERT INTO `sensitive_word` VALUES ('4172', '军警', null);
INSERT INTO `sensitive_word` VALUES ('4173', '军权', null);
INSERT INTO `sensitive_word` VALUES ('4174', '开枪', null);
INSERT INTO `sensitive_word` VALUES ('4175', '看管', null);
INSERT INTO `sensitive_word` VALUES ('4176', '看护', null);
INSERT INTO `sensitive_word` VALUES ('4177', '看守', null);
INSERT INTO `sensitive_word` VALUES ('4178', '看押', null);
INSERT INTO `sensitive_word` VALUES ('4179', '拷打', null);
INSERT INTO `sensitive_word` VALUES ('4180', '拷问', null);
INSERT INTO `sensitive_word` VALUES ('4181', '苛政', null);
INSERT INTO `sensitive_word` VALUES ('4182', '坑害', null);
INSERT INTO `sensitive_word` VALUES ('4183', '坑蒙', null);
INSERT INTO `sensitive_word` VALUES ('4184', '恐怖组织', null);
INSERT INTO `sensitive_word` VALUES ('4185', '恐吓', null);
INSERT INTO `sensitive_word` VALUES ('4186', '苦不堪言', null);
INSERT INTO `sensitive_word` VALUES ('4187', '苦渡', null);
INSERT INTO `sensitive_word` VALUES ('4188', '苦炼', null);
INSERT INTO `sensitive_word` VALUES ('4189', '苦役', null);
INSERT INTO `sensitive_word` VALUES ('4190', '酷吏', null);
INSERT INTO `sensitive_word` VALUES ('4191', '酷虐', null);
INSERT INTO `sensitive_word` VALUES ('4192', '酷刑折磨', null);
INSERT INTO `sensitive_word` VALUES ('4193', '劳动改造', null);
INSERT INTO `sensitive_word` VALUES ('4194', '劳动教养', null);
INSERT INTO `sensitive_word` VALUES ('4195', '劳改犯', null);
INSERT INTO `sensitive_word` VALUES ('4196', '劳教所', null);
INSERT INTO `sensitive_word` VALUES ('4197', '劳役', null);
INSERT INTO `sensitive_word` VALUES ('4198', '牢房', null);
INSERT INTO `sensitive_word` VALUES ('4199', '牢笼', null);
INSERT INTO `sensitive_word` VALUES ('4201', '老虎凳', null);
INSERT INTO `sensitive_word` VALUES ('4202', '离心离德', null);
INSERT INTO `sensitive_word` VALUES ('4203', '炼不炼', null);
INSERT INTO `sensitive_word` VALUES ('4204', '炼法', null);
INSERT INTO `sensitive_word` VALUES ('4205', '炼功', null);
INSERT INTO `sensitive_word` VALUES ('4206', '炼好', null);
INSERT INTO `sensitive_word` VALUES ('4207', '炼习', null);
INSERT INTO `sensitive_word` VALUES ('4208', '炼狱', null);
INSERT INTO `sensitive_word` VALUES ('4209', '练法堂', null);
INSERT INTO `sensitive_word` VALUES ('4210', '练功', null);
INSERT INTO `sensitive_word` VALUES ('4211', '凌驾', null);
INSERT INTO `sensitive_word` VALUES ('4212', '凌虐', null);
INSERT INTO `sensitive_word` VALUES ('4213', '灵魂离体', null);
INSERT INTO `sensitive_word` VALUES ('4214', '灵体', null);
INSERT INTO `sensitive_word` VALUES ('4215', '令人发指', null);
INSERT INTO `sensitive_word` VALUES ('4216', '流氓无产者', null);
INSERT INTO `sensitive_word` VALUES ('4217', '流亡', null);
INSERT INTO `sensitive_word` VALUES ('4218', '流泯', null);
INSERT INTO `sensitive_word` VALUES ('4219', '柳连义', null);
INSERT INTO `sensitive_word` VALUES ('4220', '六禁止', null);
INSERT INTO `sensitive_word` VALUES ('4221', '六一○', null);
INSERT INTO `sensitive_word` VALUES ('4222', '六一零', null);
INSERT INTO `sensitive_word` VALUES ('4223', '卢冬梅', null);
INSERT INTO `sensitive_word` VALUES ('4224', '卢海英', null);
INSERT INTO `sensitive_word` VALUES ('4225', '乱法', null);
INSERT INTO `sensitive_word` VALUES ('4226', '乱民', null);
INSERT INTO `sensitive_word` VALUES ('4227', '冤缘皆得善解', null);
INSERT INTO `sensitive_word` VALUES ('4228', '轮转', null);
INSERT INTO `sensitive_word` VALUES ('4229', '马军', null);
INSERT INTO `sensitive_word` VALUES ('4230', '马列', null);
INSERT INTO `sensitive_word` VALUES ('4231', '根本之邪', null);
INSERT INTO `sensitive_word` VALUES ('4232', '马列主义', null);
INSERT INTO `sensitive_word` VALUES ('4233', '邪皮', null);
INSERT INTO `sensitive_word` VALUES ('4234', '马三家', null);
INSERT INTO `sensitive_word` VALUES ('4235', '教养院', null);
INSERT INTO `sensitive_word` VALUES ('4236', '毛凤英', null);
INSERT INTO `sensitive_word` VALUES ('4237', '毛骨悚然', null);
INSERT INTO `sensitive_word` VALUES ('4238', '毛慧芷', null);
INSERT INTO `sensitive_word` VALUES ('4239', '毛家山', null);
INSERT INTO `sensitive_word` VALUES ('4240', '毛杰权', null);
INSERT INTO `sensitive_word` VALUES ('4241', '冒天下之大不', null);
INSERT INTO `sensitive_word` VALUES ('4242', '昧良心', null);
INSERT INTO `sensitive_word` VALUES ('4243', '昧心', null);
INSERT INTO `sensitive_word` VALUES ('4244', '门徒', null);
INSERT INTO `sensitive_word` VALUES ('4245', '迷惑信徒', null);
INSERT INTO `sensitive_word` VALUES ('4246', '迷係说', null);
INSERT INTO `sensitive_word` VALUES ('4247', '弥勒', null);
INSERT INTO `sensitive_word` VALUES ('4248', '弥天大谎', null);
INSERT INTO `sensitive_word` VALUES ('4249', '弥天大罪', null);
INSERT INTO `sensitive_word` VALUES ('4250', '密件', null);
INSERT INTO `sensitive_word` VALUES ('4251', '密令', null);
INSERT INTO `sensitive_word` VALUES ('4252', '灭顶之灾', null);
INSERT INTO `sensitive_word` VALUES ('4253', '灭绝人性', null);
INSERT INTO `sensitive_word` VALUES ('4254', '灭口', null);
INSERT INTO `sensitive_word` VALUES ('4255', '民不聊生', null);
INSERT INTO `sensitive_word` VALUES ('4256', '民愤', null);
INSERT INTO `sensitive_word` VALUES ('4257', '民权', null);
INSERT INTO `sensitive_word` VALUES ('4258', '民心', null);
INSERT INTO `sensitive_word` VALUES ('4259', '民脂民膏', null);
INSERT INTO `sensitive_word` VALUES ('4260', '明辨是非', null);
INSERT INTO `sensitive_word` VALUES ('4261', '明鉴', null);
INSERT INTO `sensitive_word` VALUES ('4262', '明星功派', null);
INSERT INTO `sensitive_word` VALUES ('4263', '明哲保身', null);
INSERT INTO `sensitive_word` VALUES ('4264', '明州', null);
INSERT INTO `sensitive_word` VALUES ('4265', '闹灾', null);
INSERT INTO `sensitive_word` VALUES ('4266', '内奸', null);
INSERT INTO `sensitive_word` VALUES ('4267', '内蒙古', null);
INSERT INTO `sensitive_word` VALUES ('4268', '逆行', null);
INSERT INTO `sensitive_word` VALUES ('4269', '聂春玲', null);
INSERT INTO `sensitive_word` VALUES ('4270', '宁死不屈', null);
INSERT INTO `sensitive_word` VALUES ('4271', '牛玉辉', null);
INSERT INTO `sensitive_word` VALUES ('4272', '弄权', null);
INSERT INTO `sensitive_word` VALUES ('4273', '奴役', null);
INSERT INTO `sensitive_word` VALUES ('4274', '女号', null);
INSERT INTO `sensitive_word` VALUES ('4275', '女色', null);
INSERT INTO `sensitive_word` VALUES ('4276', '欧共体', null);
INSERT INTO `sensitive_word` VALUES ('4277', '派出所', null);
INSERT INTO `sensitive_word` VALUES ('4278', '判罪', null);
INSERT INTO `sensitive_word` VALUES ('4279', '叛变', null);
INSERT INTO `sensitive_word` VALUES ('4280', '叛国', null);
INSERT INTO `sensitive_word` VALUES ('4281', '叛徒', null);
INSERT INTO `sensitive_word` VALUES ('4282', '陪教', null);
INSERT INTO `sensitive_word` VALUES ('4283', '陪葬', null);
INSERT INTO `sensitive_word` VALUES ('4284', '批判稿', null);
INSERT INTO `sensitive_word` VALUES ('4285', '批透', null);
INSERT INTO `sensitive_word` VALUES ('4286', '噼头盖脸', null);
INSERT INTO `sensitive_word` VALUES ('4287', '片警', null);
INSERT INTO `sensitive_word` VALUES ('4288', '骗局', null);
INSERT INTO `sensitive_word` VALUES ('4289', '评论员', null);
INSERT INTO `sensitive_word` VALUES ('4290', '破绽百出', null);
INSERT INTO `sensitive_word` VALUES ('4291', '剖腹', null);
INSERT INTO `sensitive_word` VALUES ('4292', '普天同庆', null);
INSERT INTO `sensitive_word` VALUES ('4293', '欺上瞒下', null);
INSERT INTO `sensitive_word` VALUES ('4294', '欺世盗名', null);
INSERT INTO `sensitive_word` VALUES ('4295', '欺侮', null);
INSERT INTO `sensitive_word` VALUES ('4296', '欺压', null);
INSERT INTO `sensitive_word` VALUES ('4297', '妻离子散', null);
INSERT INTO `sensitive_word` VALUES ('4298', '奇耻大辱', null);
INSERT INTO `sensitive_word` VALUES ('4299', '齐发正念', null);
INSERT INTO `sensitive_word` VALUES ('4300', '齐金胜', null);
INSERT INTO `sensitive_word` VALUES ('4301', '起诉书', null);
INSERT INTO `sensitive_word` VALUES ('4302', '乞灵', null);
INSERT INTO `sensitive_word` VALUES ('4303', '启明网', null);
INSERT INTO `sensitive_word` VALUES ('4304', '启悟', null);
INSERT INTO `sensitive_word` VALUES ('4305', '气功', null);
INSERT INTO `sensitive_word` VALUES ('4306', '气焰嚣张', null);
INSERT INTO `sensitive_word` VALUES ('4307', '黔驴技穷', null);
INSERT INTO `sensitive_word` VALUES ('4308', '遣返', null);
INSERT INTO `sensitive_word` VALUES ('4309', '遣送', null);
INSERT INTO `sensitive_word` VALUES ('4310', '强改班', null);
INSERT INTO `sensitive_word` VALUES ('4311', '强奸民意', null);
INSERT INTO `sensitive_word` VALUES ('4312', '强权', null);
INSERT INTO `sensitive_word` VALUES ('4313', '强行灌食', null);
INSERT INTO `sensitive_word` VALUES ('4314', '强行火化', null);
INSERT INTO `sensitive_word` VALUES ('4315', '强行送往', null);
INSERT INTO `sensitive_word` VALUES ('4316', '强压', null);
INSERT INTO `sensitive_word` VALUES ('4317', '强硬灌食', null);
INSERT INTO `sensitive_word` VALUES ('4318', '强制改变不了人心', null);
INSERT INTO `sensitive_word` VALUES ('4319', '强制洗脑', null);
INSERT INTO `sensitive_word` VALUES ('4320', '强制洗脑班', null);
INSERT INTO `sensitive_word` VALUES ('4321', '强制转化', null);
INSERT INTO `sensitive_word` VALUES ('4322', '强制转化班', null);
INSERT INTO `sensitive_word` VALUES ('4323', '敲诈勒索', null);
INSERT INTO `sensitive_word` VALUES ('4324', '乔石', null);
INSERT INTO `sensitive_word` VALUES ('4325', '侨民', null);
INSERT INTO `sensitive_word` VALUES ('4326', '窃国', null);
INSERT INTO `sensitive_word` VALUES ('4327', '亲共', null);
INSERT INTO `sensitive_word` VALUES ('4328', '亲善大使', null);
INSERT INTO `sensitive_word` VALUES ('4329', '清官', null);
INSERT INTO `sensitive_word` VALUES ('4330', '请功', null);
INSERT INTO `sensitive_word` VALUES ('4331', '请命', null);
INSERT INTO `sensitive_word` VALUES ('4332', '请愿书', null);
INSERT INTO `sensitive_word` VALUES ('4333', '请愿遭警暴虐', null);
INSERT INTO `sensitive_word` VALUES ('4334', '请罪', null);
INSERT INTO `sensitive_word` VALUES ('4335', '洪传十', null);
INSERT INTO `sensitive_word` VALUES ('4336', '囚车', null);
INSERT INTO `sensitive_word` VALUES ('4337', '囚禁', null);
INSERT INTO `sensitive_word` VALUES ('4338', '囚室', null);
INSERT INTO `sensitive_word` VALUES ('4339', '趋炎附势', null);
INSERT INTO `sensitive_word` VALUES ('4340', '屈打成招', null);
INSERT INTO `sensitive_word` VALUES ('4341', '权柄', null);
INSERT INTO `sensitive_word` VALUES ('4342', '权贵', null);
INSERT INTO `sensitive_word` VALUES ('4343', '权利', null);
INSERT INTO `sensitive_word` VALUES ('4344', '权势', null);
INSERT INTO `sensitive_word` VALUES ('4345', '权术', null);
INSERT INTO `sensitive_word` VALUES ('4346', '全盘否定', null);
INSERT INTO `sensitive_word` VALUES ('4347', '拳打脚踢', null);
INSERT INTO `sensitive_word` VALUES ('4348', '拳脚', null);
INSERT INTO `sensitive_word` VALUES ('4349', '劝善歌', null);
INSERT INTO `sensitive_word` VALUES ('4350', '劝世歌', null);
INSERT INTO `sensitive_word` VALUES ('4351', '群氓', null);
INSERT INTO `sensitive_word` VALUES ('4352', '群魔', null);
INSERT INTO `sensitive_word` VALUES ('4353', '群众斗群众', null);
INSERT INTO `sensitive_word` VALUES ('4354', '群众运动', null);
INSERT INTO `sensitive_word` VALUES ('4355', '人不治天治', null);
INSERT INTO `sensitive_word` VALUES ('4356', '人多势众', null);
INSERT INTO `sensitive_word` VALUES ('4357', '人祸', null);
INSERT INTO `sensitive_word` VALUES ('4358', '人间地狱', null);
INSERT INTO `sensitive_word` VALUES ('4359', '人伦', null);
INSERT INTO `sensitive_word` VALUES ('4360', '人面兽心', null);
INSERT INTO `sensitive_word` VALUES ('4361', '人权恶棍', null);
INSERT INTO `sensitive_word` VALUES ('4362', '人权观察', null);
INSERT INTO `sensitive_word` VALUES ('4363', '人权流氓', null);
INSERT INTO `sensitive_word` VALUES ('4364', '人权日', null);
INSERT INTO `sensitive_word` VALUES ('4365', '人权周', null);
INSERT INTO `sensitive_word` VALUES ('4366', '人身自由', null);
INSERT INTO `sensitive_word` VALUES ('4367', '人世间', null);
INSERT INTO `sensitive_word` VALUES ('4368', '人欲横流', null);
INSERT INTO `sensitive_word` VALUES ('4369', '人云亦云', null);
INSERT INTO `sensitive_word` VALUES ('4370', '人治', null);
INSERT INTO `sensitive_word` VALUES ('4371', '认识书', null);
INSERT INTO `sensitive_word` VALUES ('4372', '认罪', null);
INSERT INTO `sensitive_word` VALUES ('4373', '熔炼', null);
INSERT INTO `sensitive_word` VALUES ('4374', '溶于法中', null);
INSERT INTO `sensitive_word` VALUES ('4375', '如饥似渴', null);
INSERT INTO `sensitive_word` VALUES ('4376', '如狼似虎', null);
INSERT INTO `sensitive_word` VALUES ('4377', '如梦初醒', null);
INSERT INTO `sensitive_word` VALUES ('4378', '辱骂', null);
INSERT INTO `sensitive_word` VALUES ('4379', '入党', null);
INSERT INTO `sensitive_word` VALUES ('4380', '入监', null);
INSERT INTO `sensitive_word` VALUES ('4381', '入狱', null);
INSERT INTO `sensitive_word` VALUES ('4382', '软禁', null);
INSERT INTO `sensitive_word` VALUES ('4383', '软硬兼施', null);
INSERT INTO `sensitive_word` VALUES ('4384', '三保', null);
INSERT INTO `sensitive_word` VALUES ('4385', '色鬼黄菊', null);
INSERT INTO `sensitive_word` VALUES ('4386', '善恶必报', null);
INSERT INTO `sensitive_word` VALUES ('4387', '善恶有报', null);
INSERT INTO `sensitive_word` VALUES ('4388', '善恶终有报', null);
INSERT INTO `sensitive_word` VALUES ('4389', '善念', null);
INSERT INTO `sensitive_word` VALUES ('4390', '善有善报', null);
INSERT INTO `sensitive_word` VALUES ('4391', '善缘', null);
INSERT INTO `sensitive_word` VALUES ('4392', '伤天害理', null);
INSERT INTO `sensitive_word` VALUES ('4393', '上刑', null);
INSERT INTO `sensitive_word` VALUES ('4394', '上议院', null);
INSERT INTO `sensitive_word` VALUES ('4395', '烧人', null);
INSERT INTO `sensitive_word` VALUES ('4396', '社稷', null);
INSERT INTO `sensitive_word` VALUES ('4397', '深圳命桉', null);
INSERT INTO `sensitive_word` VALUES ('4398', '神化自我', null);
INSERT INTO `sensitive_word` VALUES ('4399', '神圣不可侵犯', null);
INSERT INTO `sensitive_word` VALUES ('4400', '神效', null);
INSERT INTO `sensitive_word` VALUES ('4401', '神户', null);
INSERT INTO `sensitive_word` VALUES ('4402', '神学', null);
INSERT INTO `sensitive_word` VALUES ('4403', '神智', null);
INSERT INTO `sensitive_word` VALUES ('4404', '沉剑利', null);
INSERT INTO `sensitive_word` VALUES ('4405', '生命需要真善忍', null);
INSERT INTO `sensitive_word` VALUES ('4406', '升官', null);
INSERT INTO `sensitive_word` VALUES ('4407', '升天圆满', null);
INSERT INTO `sensitive_word` VALUES ('4408', '妖言', null);
INSERT INTO `sensitive_word` VALUES ('4409', '圣彼得堡', null);
INSERT INTO `sensitive_word` VALUES ('4410', '圣地亚哥', null);
INSERT INTO `sensitive_word` VALUES ('4411', '圣荷西市', null);
INSERT INTO `sensitive_word` VALUES ('4412', '圣灵', null);
INSERT INTO `sensitive_word` VALUES ('4413', '圣明', null);
INSERT INTO `sensitive_word` VALUES ('4414', '圣人', null);
INSERT INTO `sensitive_word` VALUES ('4415', '圣水', null);
INSERT INTO `sensitive_word` VALUES ('4416', '圣徒', null);
INSERT INTO `sensitive_word` VALUES ('4417', '圣王', null);
INSERT INTO `sensitive_word` VALUES ('4418', '圣缘', null);
INSERT INTO `sensitive_word` VALUES ('4419', '圣约翰', null);
INSERT INTO `sensitive_word` VALUES ('4420', '师恩', null);
INSERT INTO `sensitive_word` VALUES ('4421', '师法', null);
INSERT INTO `sensitive_word` VALUES ('4422', '师父新经文', null);
INSERT INTO `sensitive_word` VALUES ('4423', '失望工程', null);
INSERT INTO `sensitive_word` VALUES ('4424', '施暴', null);
INSERT INTO `sensitive_word` VALUES ('4425', '十堰', null);
INSERT INTO `sensitive_word` VALUES ('4426', '十字架', null);
INSERT INTO `sensitive_word` VALUES ('4427', '石春莲', null);
INSERT INTO `sensitive_word` VALUES ('4428', '石丽春', null);
INSERT INTO `sensitive_word` VALUES ('4429', '石人', null);
INSERT INTO `sensitive_word` VALUES ('4430', '石伟', null);
INSERT INTO `sensitive_word` VALUES ('4431', '实修', null);
INSERT INTO `sensitive_word` VALUES ('4432', '史金玲', null);
INSERT INTO `sensitive_word` VALUES ('4433', '史文博', null);
INSERT INTO `sensitive_word` VALUES ('4434', '示警', null);
INSERT INTO `sensitive_word` VALUES ('4435', '示众', null);
INSERT INTO `sensitive_word` VALUES ('4436', '世风日下', null);
INSERT INTO `sensitive_word` VALUES ('4437', '世界末日', null);
INSERT INTO `sensitive_word` VALUES ('4438', '誓愿', null);
INSERT INTO `sensitive_word` VALUES ('4439', '誓约', null);
INSERT INTO `sensitive_word` VALUES ('4440', '市府', null);
INSERT INTO `sensitive_word` VALUES ('4441', '收监', null);
INSERT INTO `sensitive_word` VALUES ('4442', '收买', null);
INSERT INTO `sensitive_word` VALUES ('4443', '收容', null);
INSERT INTO `sensitive_word` VALUES ('4444', '收审', null);
INSERT INTO `sensitive_word` VALUES ('4445', '收尸', null);
INSERT INTO `sensitive_word` VALUES ('4446', '收押', null);
INSERT INTO `sensitive_word` VALUES ('4447', '手无寸铁', null);
INSERT INTO `sensitive_word` VALUES ('4448', '首恶', null);
INSERT INTO `sensitive_word` VALUES ('4449', '受虐', null);
INSERT INTO `sensitive_word` VALUES ('4450', '受屈', null);
INSERT INTO `sensitive_word` VALUES ('4451', '受辱', null);
INSERT INTO `sensitive_word` VALUES ('4452', '受刑', null);
INSERT INTO `sensitive_word` VALUES ('4453', '兽行', null);
INSERT INTO `sensitive_word` VALUES ('4454', '兽性', null);
INSERT INTO `sensitive_word` VALUES ('4455', '双盘', null);
INSERT INTO `sensitive_word` VALUES ('4456', '双修', null);
INSERT INTO `sensitive_word` VALUES ('4457', '谁揭谁遭报', null);
INSERT INTO `sensitive_word` VALUES ('4458', '水深火热', null);
INSERT INTO `sensitive_word` VALUES ('4459', '思想汇报', null);
INSERT INTO `sensitive_word` VALUES ('4460', '思想迫害', null);
INSERT INTO `sensitive_word` VALUES ('4461', '思想认识', null);
INSERT INTO `sensitive_word` VALUES ('4462', '思想转化', null);
INSERT INTO `sensitive_word` VALUES ('4463', '私愤', null);
INSERT INTO `sensitive_word` VALUES ('4464', '私囊', null);
INSERT INTO `sensitive_word` VALUES ('4465', '私念', null);
INSERT INTO `sensitive_word` VALUES ('4466', '私设', null);
INSERT INTO `sensitive_word` VALUES ('4467', '私刑', null);
INSERT INTO `sensitive_word` VALUES ('4468', '司法局', null);
INSERT INTO `sensitive_word` VALUES ('4469', '司法厅', null);
INSERT INTO `sensitive_word` VALUES ('4470', '司美娥', null);
INSERT INTO `sensitive_word` VALUES ('4471', '死于非命', null);
INSERT INTO `sensitive_word` VALUES ('4472', '寺庙', null);
INSERT INTO `sensitive_word` VALUES ('4473', '寺院', null);
INSERT INTO `sensitive_word` VALUES ('4475', '四二五', null);
INSERT INTO `sensitive_word` VALUES ('4476', '四防', null);
INSERT INTO `sensitive_word` VALUES ('4477', '四书', null);
INSERT INTO `sensitive_word` VALUES ('4478', '怂恿', null);
INSERT INTO `sensitive_word` VALUES ('4479', '颂师恩', null);
INSERT INTO `sensitive_word` VALUES ('4480', '搜捕', null);
INSERT INTO `sensitive_word` VALUES ('4481', '搜查', null);
INSERT INTO `sensitive_word` VALUES ('4482', '搜身', null);
INSERT INTO `sensitive_word` VALUES ('4483', '随师', null);
INSERT INTO `sensitive_word` VALUES ('4484', '随心而化', null);
INSERT INTO `sensitive_word` VALUES ('4485', '太平盛世', null);
INSERT INTO `sensitive_word` VALUES ('4486', '太上皇', null);
INSERT INTO `sensitive_word` VALUES ('4487', '太阳报', null);
INSERT INTO `sensitive_word` VALUES ('4488', '摊派', null);
INSERT INTO `sensitive_word` VALUES ('4489', '贪财', null);
INSERT INTO `sensitive_word` VALUES ('4490', '贪官', null);
INSERT INTO `sensitive_word` VALUES ('4491', '贪赃', null);
INSERT INTO `sensitive_word` VALUES ('4492', '唐山', null);
INSERT INTO `sensitive_word` VALUES ('4493', '讨伐', null);
INSERT INTO `sensitive_word` VALUES ('4494', '讨论会', null);
INSERT INTO `sensitive_word` VALUES ('4495', '特赦', null);
INSERT INTO `sensitive_word` VALUES ('4496', '提审', null);
INSERT INTO `sensitive_word` VALUES ('4497', '体罚', null);
INSERT INTO `sensitive_word` VALUES ('4498', '体无完肤', null);
INSERT INTO `sensitive_word` VALUES ('4499', '替罪羊', null);
INSERT INTO `sensitive_word` VALUES ('4500', '天an', null);
INSERT INTO `sensitive_word` VALUES ('4501', '惨桉', null);
INSERT INTO `sensitive_word` VALUES ('4502', '焚人', null);
INSERT INTO `sensitive_word` VALUES ('4503', '枪杀', null);
INSERT INTO `sensitive_word` VALUES ('4504', '天道', null);
INSERT INTO `sensitive_word` VALUES ('4505', '天年', null);
INSERT INTO `sensitive_word` VALUES ('4506', '天怒人怨', null);
INSERT INTO `sensitive_word` VALUES ('4507', '天清体透乾坤正', null);
INSERT INTO `sensitive_word` VALUES ('4508', '天书', null);
INSERT INTO `sensitive_word` VALUES ('4509', '天体', null);
INSERT INTO `sensitive_word` VALUES ('4510', '天下大乱', null);
INSERT INTO `sensitive_word` VALUES ('4511', '天宇', null);
INSERT INTO `sensitive_word` VALUES ('4512', '天灾人祸', null);
INSERT INTO `sensitive_word` VALUES ('4513', '天诛地灭', null);
INSERT INTO `sensitive_word` VALUES ('4514', '天主教', null);
INSERT INTO `sensitive_word` VALUES ('4515', '条幅', null);
INSERT INTO `sensitive_word` VALUES ('4516', '传单', null);
INSERT INTO `sensitive_word` VALUES ('4517', '铁丝网', null);
INSERT INTO `sensitive_word` VALUES ('4518', '听法', null);
INSERT INTO `sensitive_word` VALUES ('4519', '停炼', null);
INSERT INTO `sensitive_word` VALUES ('4520', '通天', null);
INSERT INTO `sensitive_word` VALUES ('4521', '同号', null);
INSERT INTO `sensitive_word` VALUES ('4522', '同僚', null);
INSERT INTO `sensitive_word` VALUES ('4523', '同门', null);
INSERT INTO `sensitive_word` VALUES ('4524', '同乡会', null);
INSERT INTO `sensitive_word` VALUES ('4525', '统治阶级', null);
INSERT INTO `sensitive_word` VALUES ('4526', '头前抱轮', null);
INSERT INTO `sensitive_word` VALUES ('4527', '屠刀', null);
INSERT INTO `sensitive_word` VALUES ('4528', '土崩瓦解', null);
INSERT INTO `sensitive_word` VALUES ('4529', '土匪', null);
INSERT INTO `sensitive_word` VALUES ('4530', '倡议书', null);
INSERT INTO `sensitive_word` VALUES ('4531', '脱胎换骨', null);
INSERT INTO `sensitive_word` VALUES ('4532', '歪风邪气', null);
INSERT INTO `sensitive_word` VALUES ('4533', '歪理', null);
INSERT INTO `sensitive_word` VALUES ('4534', '歪门邪道', null);
INSERT INTO `sensitive_word` VALUES ('4535', '外交官', null);
INSERT INTO `sensitive_word` VALUES ('4536', '外强中干', null);
INSERT INTO `sensitive_word` VALUES ('4537', '顽固不化', null);
INSERT INTO `sensitive_word` VALUES ('4538', '万恶', null);
INSERT INTO `sensitive_word` VALUES ('4539', '万劫不复', null);
INSERT INTO `sensitive_word` VALUES ('4540', '万世', null);
INSERT INTO `sensitive_word` VALUES ('4541', '威权', null);
INSERT INTO `sensitive_word` VALUES ('4542', '威胁利诱', null);
INSERT INTO `sensitive_word` VALUES ('4543', '危言耸听', null);
INSERT INTO `sensitive_word` VALUES ('4544', '问讯', null);
INSERT INTO `sensitive_word` VALUES ('4545', '我党', null);
INSERT INTO `sensitive_word` VALUES ('4553', '嫖', null);
INSERT INTO `sensitive_word` VALUES ('4565', '肏', null);
INSERT INTO `sensitive_word` VALUES ('4568', '屎', null);
INSERT INTO `sensitive_word` VALUES ('4572', '册刂', null);
INSERT INTO `sensitive_word` VALUES ('4573', '姦', null);
INSERT INTO `sensitive_word` VALUES ('4575', '尻', null);
INSERT INTO `sensitive_word` VALUES ('4602', '六四事件', null);
INSERT INTO `sensitive_word` VALUES ('4603', '买卖枪支', null);
INSERT INTO `sensitive_word` VALUES ('4604', '退党', null);
INSERT INTO `sensitive_word` VALUES ('4605', '麻醉药', null);
INSERT INTO `sensitive_word` VALUES ('4606', '麻醉乙醚', null);
INSERT INTO `sensitive_word` VALUES ('4607', '色情服务', null);
INSERT INTO `sensitive_word` VALUES ('4608', '出售枪支', null);
INSERT INTO `sensitive_word` VALUES ('4609', 'PK黑社会', null);
INSERT INTO `sensitive_word` VALUES ('4610', '恶搞晚会', null);
INSERT INTO `sensitive_word` VALUES ('4611', '投毒杀人', null);
INSERT INTO `sensitive_word` VALUES ('4612', '出售假币', null);
INSERT INTO `sensitive_word` VALUES ('4613', '昏药', null);
INSERT INTO `sensitive_word` VALUES ('4614', '佳静安定片', null);
INSERT INTO `sensitive_word` VALUES ('4615', '麻醉钢枪', null);
INSERT INTO `sensitive_word` VALUES ('4616', '蒙汗药粉', null);
INSERT INTO `sensitive_word` VALUES ('4617', '古方迷香', null);
INSERT INTO `sensitive_word` VALUES ('4618', '反华', null);
INSERT INTO `sensitive_word` VALUES ('4619', '强效失意药', null);
INSERT INTO `sensitive_word` VALUES ('4620', '官商勾结', null);
INSERT INTO `sensitive_word` VALUES ('4621', '远程偷拍', null);
INSERT INTO `sensitive_word` VALUES ('4622', '升达毕业证', null);
INSERT INTO `sensitive_word` VALUES ('4623', '自制手枪', null);
INSERT INTO `sensitive_word` VALUES ('4624', '激情小电影', null);
INSERT INTO `sensitive_word` VALUES ('4625', '黄色小电影', null);
INSERT INTO `sensitive_word` VALUES ('4626', '色情小电影', null);
INSERT INTO `sensitive_word` VALUES ('4627', '高校群体事件', null);
INSERT INTO `sensitive_word` VALUES ('4628', '大学骚乱', null);
INSERT INTO `sensitive_word` VALUES ('4629', '高校骚乱', null);
INSERT INTO `sensitive_word` VALUES ('4630', '自杀手册', null);
INSERT INTO `sensitive_word` VALUES ('4631', '藏独', null);
INSERT INTO `sensitive_word` VALUES ('4632', '张小平', null);
INSERT INTO `sensitive_word` VALUES ('4633', '枪支弹药', null);
INSERT INTO `sensitive_word` VALUES ('4634', '血腥图片', null);
INSERT INTO `sensitive_word` VALUES ('4635', '反政府', null);
INSERT INTO `sensitive_word` VALUES ('4636', '禁书', null);
INSERT INTO `sensitive_word` VALUES ('4637', '窃听器材', null);
INSERT INTO `sensitive_word` VALUES ('4638', '成人电影', null);
INSERT INTO `sensitive_word` VALUES ('4639', '无码片', null);
INSERT INTO `sensitive_word` VALUES ('4640', '身份证生成器', null);
INSERT INTO `sensitive_word` VALUES ('4641', '办理证件', null);
INSERT INTO `sensitive_word` VALUES ('4642', '出售手枪', null);
INSERT INTO `sensitive_word` VALUES ('4644', '人性本色', null);
INSERT INTO `sensitive_word` VALUES ('4645', 'av大片', null);
INSERT INTO `sensitive_word` VALUES ('4646', '情色小电影', null);
INSERT INTO `sensitive_word` VALUES ('4647', '民运', null);
INSERT INTO `sensitive_word` VALUES ('4648', '九评', null);
INSERT INTO `sensitive_word` VALUES ('4649', '九评共产党', null);
INSERT INTO `sensitive_word` VALUES ('4650', '天安门事件', null);
INSERT INTO `sensitive_word` VALUES ('4651', '色情网站', null);
INSERT INTO `sensitive_word` VALUES ('4652', '活体器官移植', null);
INSERT INTO `sensitive_word` VALUES ('4653', '性免费电影', null);
INSERT INTO `sensitive_word` VALUES ('4654', '黄色电影', null);
INSERT INTO `sensitive_word` VALUES ('4655', '阴茎', null);
INSERT INTO `sensitive_word` VALUES ('4656', '性虐待', null);
INSERT INTO `sensitive_word` VALUES ('4657', '黄色网站', null);
INSERT INTO `sensitive_word` VALUES ('4658', '成人网站', null);
INSERT INTO `sensitive_word` VALUES ('4659', '成人小说', null);
INSERT INTO `sensitive_word` VALUES ('4660', '成人文学', null);
INSERT INTO `sensitive_word` VALUES ('4661', '成人影视', null);
INSERT INTO `sensitive_word` VALUES ('4662', '黄色影视', null);
INSERT INTO `sensitive_word` VALUES ('4663', '黄色小说', null);
INSERT INTO `sensitive_word` VALUES ('4664', '黄色文学', null);
INSERT INTO `sensitive_word` VALUES ('4665', '成人图片', null);
INSERT INTO `sensitive_word` VALUES ('4666', '黄色图片', null);
INSERT INTO `sensitive_word` VALUES ('4667', '黄色漫画', null);
INSERT INTO `sensitive_word` VALUES ('4668', '成人漫画', null);
INSERT INTO `sensitive_word` VALUES ('4669', '成人论坛', null);
INSERT INTO `sensitive_word` VALUES ('4670', '激情电影', null);
INSERT INTO `sensitive_word` VALUES ('4671', '应招', null);
INSERT INTO `sensitive_word` VALUES ('4672', '江泽民', null);
INSERT INTO `sensitive_word` VALUES ('4673', '腐败', null);
INSERT INTO `sensitive_word` VALUES ('4674', '文化大革命', null);
INSERT INTO `sensitive_word` VALUES ('4675', '文革', null);
INSERT INTO `sensitive_word` VALUES ('4676', '独裁', null);
INSERT INTO `sensitive_word` VALUES ('4677', '专政', null);
INSERT INTO `sensitive_word` VALUES ('4678', '群体灭绝', null);
INSERT INTO `sensitive_word` VALUES ('4679', '劳改', null);
INSERT INTO `sensitive_word` VALUES ('4680', '西藏流亡政府', null);
INSERT INTO `sensitive_word` VALUES ('4681', '达赖喇嘛', null);
INSERT INTO `sensitive_word` VALUES ('4682', '确吉尼玛', null);
INSERT INTO `sensitive_word` VALUES ('4683', '活人器官', null);
INSERT INTO `sensitive_word` VALUES ('4684', '身份证号码生成器', null);
INSERT INTO `sensitive_word` VALUES ('4685', '成人区', null);
INSERT INTO `sensitive_word` VALUES ('4686', '颠覆国家政权', null);
INSERT INTO `sensitive_word` VALUES ('4687', 'bitch', null);
INSERT INTO `sensitive_word` VALUES ('4688', 'shit', null);
INSERT INTO `sensitive_word` VALUES ('4692', '女优', null);
INSERT INTO `sensitive_word` VALUES ('4693', '强歼', null);
INSERT INTO `sensitive_word` VALUES ('4694', '色友', null);
INSERT INTO `sensitive_word` VALUES ('4695', '女女', null);
INSERT INTO `sensitive_word` VALUES ('4696', '三级', null);
INSERT INTO `sensitive_word` VALUES ('4697', '插插', null);
INSERT INTO `sensitive_word` VALUES ('4698', '坐交', null);
INSERT INTO `sensitive_word` VALUES ('4699', '慰安妇', null);
INSERT INTO `sensitive_word` VALUES ('4700', '无毛', null);
INSERT INTO `sensitive_word` VALUES ('4701', '猛插', null);
INSERT INTO `sensitive_word` VALUES ('4702', 'A片', null);
INSERT INTO `sensitive_word` VALUES ('4703', '偷窥', null);
INSERT INTO `sensitive_word` VALUES ('4704', '被虐', null);
INSERT INTO `sensitive_word` VALUES ('4705', '口技', null);
INSERT INTO `sensitive_word` VALUES ('4706', '精液', null);
INSERT INTO `sensitive_word` VALUES ('4707', '露毛', null);
INSERT INTO `sensitive_word` VALUES ('4708', '少儿不宜', null);
INSERT INTO `sensitive_word` VALUES ('4709', '成人', null);
INSERT INTO `sensitive_word` VALUES ('4710', '偷情', null);
INSERT INTO `sensitive_word` VALUES ('4711', '自摸', null);
INSERT INTO `sensitive_word` VALUES ('4712', '捆绑', null);
INSERT INTO `sensitive_word` VALUES ('4713', '潮吹', null);
INSERT INTO `sensitive_word` VALUES ('4714', '群射', null);
INSERT INTO `sensitive_word` VALUES ('4715', '臭作', null);
INSERT INTO `sensitive_word` VALUES ('4716', '薄格', null);
INSERT INTO `sensitive_word` VALUES ('4717', '连发', null);
INSERT INTO `sensitive_word` VALUES ('4718', '母子', null);
INSERT INTO `sensitive_word` VALUES ('4719', '偷拍', null);
INSERT INTO `sensitive_word` VALUES ('4720', '色狼', null);
INSERT INTO `sensitive_word` VALUES ('4721', '私处', null);
INSERT INTO `sensitive_word` VALUES ('4722', '爽死', null);
INSERT INTO `sensitive_word` VALUES ('4723', '变态', null);
INSERT INTO `sensitive_word` VALUES ('4724', '妹疼', null);
INSERT INTO `sensitive_word` VALUES ('4725', '妹痛', null);
INSERT INTO `sensitive_word` VALUES ('4726', '弟疼', null);
INSERT INTO `sensitive_word` VALUES ('4727', '弟痛', null);
INSERT INTO `sensitive_word` VALUES ('4728', '姐疼', null);
INSERT INTO `sensitive_word` VALUES ('4729', '姐痛', null);
INSERT INTO `sensitive_word` VALUES ('4730', '哥疼', null);
INSERT INTO `sensitive_word` VALUES ('4731', '哥痛', null);
INSERT INTO `sensitive_word` VALUES ('4732', '同房', null);
INSERT INTO `sensitive_word` VALUES ('4733', '作爱', null);
INSERT INTO `sensitive_word` VALUES ('4734', '做爱', null);
INSERT INTO `sensitive_word` VALUES ('4735', '阴道', null);
INSERT INTO `sensitive_word` VALUES ('4736', '肉棒', null);
INSERT INTO `sensitive_word` VALUES ('4737', '荡妇', null);
INSERT INTO `sensitive_word` VALUES ('4738', '捅你', null);
INSERT INTO `sensitive_word` VALUES ('4739', '捅我', null);
INSERT INTO `sensitive_word` VALUES ('4740', '插他', null);
INSERT INTO `sensitive_word` VALUES ('4741', '射精', null);
INSERT INTO `sensitive_word` VALUES ('4742', '下体', null);
INSERT INTO `sensitive_word` VALUES ('4743', '龟头', null);
INSERT INTO `sensitive_word` VALUES ('4744', '你妈逼', null);
INSERT INTO `sensitive_word` VALUES ('4745', '高潮', null);
INSERT INTO `sensitive_word` VALUES ('4746', '暴乱', null);
INSERT INTO `sensitive_word` VALUES ('4747', '暴政', null);
INSERT INTO `sensitive_word` VALUES ('4748', '枪支', null);
INSERT INTO `sensitive_word` VALUES ('4749', '军火', null);
INSERT INTO `sensitive_word` VALUES ('4750', 'mm公寓', null);
INSERT INTO `sensitive_word` VALUES ('4751', '裸女', null);
INSERT INTO `sensitive_word` VALUES ('4752', '裸躯', null);
INSERT INTO `sensitive_word` VALUES ('4753', '裸身', null);
INSERT INTO `sensitive_word` VALUES ('4754', '裸睡', null);
INSERT INTO `sensitive_word` VALUES ('4755', '裸体', null);
INSERT INTO `sensitive_word` VALUES ('4756', '裸臀', null);
INSERT INTO `sensitive_word` VALUES ('4757', '裸胸', null);
INSERT INTO `sensitive_word` VALUES ('4758', '裸着', null);
INSERT INTO `sensitive_word` VALUES ('4759', '肏干', null);
INSERT INTO `sensitive_word` VALUES ('4760', '肏人', null);
INSERT INTO `sensitive_word` VALUES ('4761', '肏死', null);
INSERT INTO `sensitive_word` VALUES ('4762', '肏我', null);
INSERT INTO `sensitive_word` VALUES ('4763', '毛茸茸', null);
INSERT INTO `sensitive_word` VALUES ('4764', '美唇', null);
INSERT INTO `sensitive_word` VALUES ('4765', '美感', null);
INSERT INTO `sensitive_word` VALUES ('4766', '美脚', null);
INSERT INTO `sensitive_word` VALUES ('4767', '美伶', null);
INSERT INTO `sensitive_word` VALUES ('4768', '美满', null);
INSERT INTO `sensitive_word` VALUES ('4769', '美目', null);
INSERT INTO `sensitive_word` VALUES ('4770', '美乳', null);
INSERT INTO `sensitive_word` VALUES ('4771', '美体', null);
INSERT INTO `sensitive_word` VALUES ('4772', '美腿', null);
INSERT INTO `sensitive_word` VALUES ('4773', '美臀', null);
INSERT INTO `sensitive_word` VALUES ('4774', '美香', null);
INSERT INTO `sensitive_word` VALUES ('4775', '美穴', null);
INSERT INTO `sensitive_word` VALUES ('4776', '媚肉', null);
INSERT INTO `sensitive_word` VALUES ('4777', '媚术', null);
INSERT INTO `sensitive_word` VALUES ('4778', '媚态', null);
INSERT INTO `sensitive_word` VALUES ('4779', '媚笑', null);
INSERT INTO `sensitive_word` VALUES ('4780', '媚艳', null);
INSERT INTO `sensitive_word` VALUES ('4781', '媚液', null);
INSERT INTO `sensitive_word` VALUES ('4782', '勐操', null);
INSERT INTO `sensitive_word` VALUES ('4783', '勐插', null);
INSERT INTO `sensitive_word` VALUES ('4784', '勐颤', null);
INSERT INTO `sensitive_word` VALUES ('4785', '勐冲', null);
INSERT INTO `sensitive_word` VALUES ('4786', '勐抽', null);
INSERT INTO `sensitive_word` VALUES ('4787', '勐喘', null);
INSERT INTO `sensitive_word` VALUES ('4788', '勐刺', null);
INSERT INTO `sensitive_word` VALUES ('4789', '停经', null);
INSERT INTO `sensitive_word` VALUES ('4790', '性器', null);
INSERT INTO `sensitive_word` VALUES ('4791', '童男', null);
INSERT INTO `sensitive_word` VALUES ('4792', '捅进', null);
INSERT INTO `sensitive_word` VALUES ('4793', '捅了', null);
INSERT INTO `sensitive_word` VALUES ('4794', '捅入', null);
INSERT INTO `sensitive_word` VALUES ('4795', '痴男', null);
INSERT INTO `sensitive_word` VALUES ('4796', '痴女', null);
INSERT INTO `sensitive_word` VALUES ('4797', '草泥马', null);
INSERT INTO `sensitive_word` VALUES ('4798', '你妈', null);
INSERT INTO `sensitive_word` VALUES ('4799', '你娘', null);
INSERT INTO `sensitive_word` VALUES ('4800', '你爷', null);
INSERT INTO `sensitive_word` VALUES ('4801', '你大爷', null);
INSERT INTO `sensitive_word` VALUES ('4802', '草你', null);
INSERT INTO `sensitive_word` VALUES ('4803', '草我', null);
INSERT INTO `sensitive_word` VALUES ('4804', '偷汉', null);
INSERT INTO `sensitive_word` VALUES ('4805', '偷香', null);
INSERT INTO `sensitive_word` VALUES ('4806', '透明', null);
INSERT INTO `sensitive_word` VALUES ('4807', '突刺', null);
INSERT INTO `sensitive_word` VALUES ('4808', '天强', null);
INSERT INTO `sensitive_word` VALUES ('4809', '甜蜜', null);
INSERT INTO `sensitive_word` VALUES ('4810', '舔遍', null);
INSERT INTO `sensitive_word` VALUES ('4811', '舔触', null);
INSERT INTO `sensitive_word` VALUES ('4812', '舔到', null);
INSERT INTO `sensitive_word` VALUES ('4813', '舔动', null);
INSERT INTO `sensitive_word` VALUES ('4814', '舔及轻击', null);
INSERT INTO `sensitive_word` VALUES ('4815', '舔净', null);
INSERT INTO `sensitive_word` VALUES ('4816', '舔了', null);
INSERT INTO `sensitive_word` VALUES ('4817', '舔掠', null);
INSERT INTO `sensitive_word` VALUES ('4818', '舔摸', null);
INSERT INTO `sensitive_word` VALUES ('4819', '舔奶', null);
INSERT INTO `sensitive_word` VALUES ('4820', '舔弄', null);
INSERT INTO `sensitive_word` VALUES ('4821', '舔起', null);
INSERT INTO `sensitive_word` VALUES ('4822', '舔乾', null);
INSERT INTO `sensitive_word` VALUES ('4823', '舔去', null);
INSERT INTO `sensitive_word` VALUES ('4824', '舔拭', null);
INSERT INTO `sensitive_word` VALUES ('4825', '舔吮', null);
INSERT INTO `sensitive_word` VALUES ('4826', '舔他', null);
INSERT INTO `sensitive_word` VALUES ('4827', '舔吻', null);
INSERT INTO `sensitive_word` VALUES ('4828', '舔我', null);
INSERT INTO `sensitive_word` VALUES ('4829', '舔吸', null);
INSERT INTO `sensitive_word` VALUES ('4830', '舔穴', null);
INSERT INTO `sensitive_word` VALUES ('4831', '舔咬', null);
INSERT INTO `sensitive_word` VALUES ('4832', '舔阴', null);
INSERT INTO `sensitive_word` VALUES ('4833', '舔着', null);
INSERT INTO `sensitive_word` VALUES ('4834', '舔舐', null);
INSERT INTO `sensitive_word` VALUES ('4835', '挑拨', null);
INSERT INTO `sensitive_word` VALUES ('4836', '挑动', null);
INSERT INTO `sensitive_word` VALUES ('4837', '挑逗', null);
INSERT INTO `sensitive_word` VALUES ('4838', '挑弄', null);
INSERT INTO `sensitive_word` VALUES ('4839', '咀唇', null);
INSERT INTO `sensitive_word` VALUES ('4840', '淋病', null);
INSERT INTO `sensitive_word` VALUES ('4841', '凌乱', null);
INSERT INTO `sensitive_word` VALUES ('4842', '灵肉', null);
INSERT INTO `sensitive_word` VALUES ('4843', '春心荡漾', null);
INSERT INTO `sensitive_word` VALUES ('4844', '流到', null);
INSERT INTO `sensitive_word` VALUES ('4845', '流溢', null);
INSERT INTO `sensitive_word` VALUES ('4846', '龙根', null);
INSERT INTO `sensitive_word` VALUES ('4847', '隆起', null);
INSERT INTO `sensitive_word` VALUES ('4848', '搂抱', null);
INSERT INTO `sensitive_word` VALUES ('4849', '露出', null);
INSERT INTO `sensitive_word` VALUES ('4850', '露阴', null);
INSERT INTO `sensitive_word` VALUES ('4851', '窥阴', null);
INSERT INTO `sensitive_word` VALUES ('4852', '令女人', null);
INSERT INTO `sensitive_word` VALUES ('4853', '卵巢', null);
INSERT INTO `sensitive_word` VALUES ('4854', '卵子', null);
INSERT INTO `sensitive_word` VALUES ('4855', '卵泡', null);
INSERT INTO `sensitive_word` VALUES ('4856', '乱抽', null);
INSERT INTO `sensitive_word` VALUES ('4857', '乱蹬', null);
INSERT INTO `sensitive_word` VALUES ('4858', '乱顶', null);
INSERT INTO `sensitive_word` VALUES ('4859', '乱摸', null);
INSERT INTO `sensitive_word` VALUES ('4860', '乱揉', null);
INSERT INTO `sensitive_word` VALUES ('4861', '乱淌', null);
INSERT INTO `sensitive_word` VALUES ('4862', '巨棒', null);
INSERT INTO `sensitive_word` VALUES ('4863', '巨根', null);
INSERT INTO `sensitive_word` VALUES ('4864', '巨棍', null);
INSERT INTO `sensitive_word` VALUES ('4865', '巨炮', null);
INSERT INTO `sensitive_word` VALUES ('4866', '巨枪', null);
INSERT INTO `sensitive_word` VALUES ('4867', '巨物', null);
INSERT INTO `sensitive_word` VALUES ('4868', '噘起', null);
INSERT INTO `sensitive_word` VALUES ('4869', '噘着', null);
INSERT INTO `sensitive_word` VALUES ('4870', '绝经', null);
INSERT INTO `sensitive_word` VALUES ('4871', '俊逸', null);
INSERT INTO `sensitive_word` VALUES ('4872', '揩擦', null);
INSERT INTO `sensitive_word` VALUES ('4873', '亢进', null);
INSERT INTO `sensitive_word` VALUES ('4874', '啃咬', null);
INSERT INTO `sensitive_word` VALUES ('4875', '抠摸', null);
INSERT INTO `sensitive_word` VALUES ('4876', '抠弄', null);
INSERT INTO `sensitive_word` VALUES ('4877', '抠挖', null);
INSERT INTO `sensitive_word` VALUES ('4878', '口爆', null);
INSERT INTO `sensitive_word` VALUES ('4879', '口唇', null);
INSERT INTO `sensitive_word` VALUES ('4880', '口含', null);
INSERT INTO `sensitive_word` VALUES ('4881', '口中', null);
INSERT INTO `sensitive_word` VALUES ('4882', '扣弄', null);
INSERT INTO `sensitive_word` VALUES ('4883', '跨跪', null);
INSERT INTO `sensitive_word` VALUES ('4884', '跨骑', null);
INSERT INTO `sensitive_word` VALUES ('4885', '跨坐', null);
INSERT INTO `sensitive_word` VALUES ('4886', '胯股', null);
INSERT INTO `sensitive_word` VALUES ('4887', '胯下', null);
INSERT INTO `sensitive_word` VALUES ('4888', '狂暴', null);
INSERT INTO `sensitive_word` VALUES ('4889', '狂操', null);
INSERT INTO `sensitive_word` VALUES ('4890', '狂插', null);
INSERT INTO `sensitive_word` VALUES ('4891', '狂抽', null);
INSERT INTO `sensitive_word` VALUES ('4892', '狂捣', null);
INSERT INTO `sensitive_word` VALUES ('4893', '狂热', null);
INSERT INTO `sensitive_word` VALUES ('4894', '狂吻', null);
INSERT INTO `sensitive_word` VALUES ('4895', '狂泄', null);
INSERT INTO `sensitive_word` VALUES ('4896', '狂舐', null);
INSERT INTO `sensitive_word` VALUES ('4897', '窥探', null);
INSERT INTO `sensitive_word` VALUES ('4898', '来潮', null);
INSERT INTO `sensitive_word` VALUES ('4899', '来经', null);
INSERT INTO `sensitive_word` VALUES ('4900', '来搔抚', null);
INSERT INTO `sensitive_word` VALUES ('4901', '浪逼', null);
INSERT INTO `sensitive_word` VALUES ('4902', '浪喘', null);
INSERT INTO `sensitive_word` VALUES ('4903', '浪妇', null);
INSERT INTO `sensitive_word` VALUES ('4904', '浪哼', null);
INSERT INTO `sensitive_word` VALUES ('4905', '浪货', null);
INSERT INTO `sensitive_word` VALUES ('4906', '浪劲', null);
INSERT INTO `sensitive_word` VALUES ('4907', '浪媚', null);
INSERT INTO `sensitive_word` VALUES ('4908', '浪女', null);
INSERT INTO `sensitive_word` VALUES ('4909', '浪态', null);
INSERT INTO `sensitive_word` VALUES ('4910', '浪样', null);
INSERT INTO `sensitive_word` VALUES ('4911', '浪吟', null);
INSERT INTO `sensitive_word` VALUES ('4912', '浪语', null);
INSERT INTO `sensitive_word` VALUES ('4913', '蕾苞', null);
INSERT INTO `sensitive_word` VALUES ('4914', '连干几炮', null);
INSERT INTO `sensitive_word` VALUES ('4915', '乌纱帽', null);
INSERT INTO `sensitive_word` VALUES ('4916', '污秽', null);
INSERT INTO `sensitive_word` VALUES ('4917', '污蔑', null);
INSERT INTO `sensitive_word` VALUES ('4918', '污辱', null);
INSERT INTO `sensitive_word` VALUES ('4919', '污言秽语', null);
INSERT INTO `sensitive_word` VALUES ('4920', '诬告', null);
INSERT INTO `sensitive_word` VALUES ('4921', '无神论', null);
INSERT INTO `sensitive_word` VALUES ('4922', '无产阶级', null);
INSERT INTO `sensitive_word` VALUES ('4923', '吴邦国', null);
INSERT INTO `sensitive_word` VALUES ('4924', '毛泽东', null);
INSERT INTO `sensitive_word` VALUES ('4925', '周恩来', null);
INSERT INTO `sensitive_word` VALUES ('4926', '朱德', null);
INSERT INTO `sensitive_word` VALUES ('4927', '彭德怀', null);
INSERT INTO `sensitive_word` VALUES ('4928', '刘伯承', null);
INSERT INTO `sensitive_word` VALUES ('4929', '陈毅', null);
INSERT INTO `sensitive_word` VALUES ('4930', '贺龙', null);
INSERT INTO `sensitive_word` VALUES ('4931', '聂荣臻', null);
INSERT INTO `sensitive_word` VALUES ('4932', '徐向前', null);
INSERT INTO `sensitive_word` VALUES ('4933', '罗荣桓', null);
INSERT INTO `sensitive_word` VALUES ('4934', '李大钊', null);
INSERT INTO `sensitive_word` VALUES ('4935', '陈独秀', null);
INSERT INTO `sensitive_word` VALUES ('4936', '孙中山', null);
INSERT INTO `sensitive_word` VALUES ('4937', '孙文', null);
INSERT INTO `sensitive_word` VALUES ('4938', '孙逸仙', null);
INSERT INTO `sensitive_word` VALUES ('4939', '陈云', null);
INSERT INTO `sensitive_word` VALUES ('4940', '尉健行', null);
INSERT INTO `sensitive_word` VALUES ('4941', '胡锦涛', null);
INSERT INTO `sensitive_word` VALUES ('4942', '温家宝', null);
INSERT INTO `sensitive_word` VALUES ('4943', '吴官正', null);
INSERT INTO `sensitive_word` VALUES ('4944', '唐家璇', null);
INSERT INTO `sensitive_word` VALUES ('4945', '王兆国', null);
INSERT INTO `sensitive_word` VALUES ('4946', '李登辉', null);
INSERT INTO `sensitive_word` VALUES ('4947', '连战', null);
INSERT INTO `sensitive_word` VALUES ('4948', '陈水扁', null);
INSERT INTO `sensitive_word` VALUES ('4949', '宋楚瑜', null);
INSERT INTO `sensitive_word` VALUES ('4950', '吕秀莲', null);
INSERT INTO `sensitive_word` VALUES ('4951', '郁慕明', null);
INSERT INTO `sensitive_word` VALUES ('4952', '蒋中正', null);
INSERT INTO `sensitive_word` VALUES ('4953', '蒋经国', null);
INSERT INTO `sensitive_word` VALUES ('4954', '马英九', null);
INSERT INTO `sensitive_word` VALUES ('4955', '布什', null);
INSERT INTO `sensitive_word` VALUES ('4956', '布莱尔', null);
INSERT INTO `sensitive_word` VALUES ('4957', '小泉', null);
INSERT INTO `sensitive_word` VALUES ('4958', '纯一郎', null);
INSERT INTO `sensitive_word` VALUES ('4959', '萨马兰奇', null);
INSERT INTO `sensitive_word` VALUES ('4960', '安南', null);
INSERT INTO `sensitive_word` VALUES ('4961', '阿拉法特', null);
INSERT INTO `sensitive_word` VALUES ('4962', '普京', null);
INSERT INTO `sensitive_word` VALUES ('4963', '默克尔', null);
INSERT INTO `sensitive_word` VALUES ('4964', '克林顿', null);
INSERT INTO `sensitive_word` VALUES ('4965', '里根', null);
INSERT INTO `sensitive_word` VALUES ('4966', '尼克松', null);
INSERT INTO `sensitive_word` VALUES ('4967', '林肯', null);
INSERT INTO `sensitive_word` VALUES ('4968', '杜鲁门', null);
INSERT INTO `sensitive_word` VALUES ('4969', '赫鲁晓夫', null);
INSERT INTO `sensitive_word` VALUES ('4970', '列宁', null);
INSERT INTO `sensitive_word` VALUES ('4971', '斯大林', null);
INSERT INTO `sensitive_word` VALUES ('4972', '马克思', null);
INSERT INTO `sensitive_word` VALUES ('4973', '恩格斯', null);
INSERT INTO `sensitive_word` VALUES ('4974', '金正日', null);
INSERT INTO `sensitive_word` VALUES ('4975', '金日成', null);
INSERT INTO `sensitive_word` VALUES ('4976', '胡志明', null);
INSERT INTO `sensitive_word` VALUES ('4977', '西哈努克', null);
INSERT INTO `sensitive_word` VALUES ('4978', '希拉克', null);
INSERT INTO `sensitive_word` VALUES ('4979', '撒切尔', null);
INSERT INTO `sensitive_word` VALUES ('4980', '阿罗约', null);
INSERT INTO `sensitive_word` VALUES ('4982', '卡斯特罗', null);
INSERT INTO `sensitive_word` VALUES ('4983', '富兰克林', null);
INSERT INTO `sensitive_word` VALUES ('4984', '华盛顿', null);
INSERT INTO `sensitive_word` VALUES ('4985', '艾森豪威尔', null);
INSERT INTO `sensitive_word` VALUES ('4986', '拿破仑', null);
INSERT INTO `sensitive_word` VALUES ('4987', '亚历山大', null);
INSERT INTO `sensitive_word` VALUES ('4988', '路易', null);
INSERT INTO `sensitive_word` VALUES ('4989', '拉姆斯菲尔德', null);
INSERT INTO `sensitive_word` VALUES ('4990', '劳拉', null);
INSERT INTO `sensitive_word` VALUES ('4991', '鲍威尔', null);
INSERT INTO `sensitive_word` VALUES ('4992', '奥巴马', null);
INSERT INTO `sensitive_word` VALUES ('4993', '本拉登', null);
INSERT INTO `sensitive_word` VALUES ('4994', '奥马尔', null);
INSERT INTO `sensitive_word` VALUES ('4995', '江青', null);
INSERT INTO `sensitive_word` VALUES ('4996', '姚文元', null);
INSERT INTO `sensitive_word` VALUES ('4997', '王洪文', null);
INSERT INTO `sensitive_word` VALUES ('4998', '东条英机', null);
INSERT INTO `sensitive_word` VALUES ('4999', '墨索里尼', null);
INSERT INTO `sensitive_word` VALUES ('5000', '冈村秀树', null);
INSERT INTO `sensitive_word` VALUES ('5001', '冈村宁次', null);
INSERT INTO `sensitive_word` VALUES ('5002', '高丽朴', null);
INSERT INTO `sensitive_word` VALUES ('5003', '王丹', null);
INSERT INTO `sensitive_word` VALUES ('5004', '李大师', null);
INSERT INTO `sensitive_word` VALUES ('5005', '赖昌星', null);
INSERT INTO `sensitive_word` VALUES ('5006', '马加爵', null);
INSERT INTO `sensitive_word` VALUES ('5007', '班禅', null);
INSERT INTO `sensitive_word` VALUES ('5008', '额尔德尼', null);
INSERT INTO `sensitive_word` VALUES ('5009', '山本五十六', null);
INSERT INTO `sensitive_word` VALUES ('5010', '阿扁', null);
INSERT INTO `sensitive_word` VALUES ('5011', '阿扁万岁', null);
INSERT INTO `sensitive_word` VALUES ('5012', '热那亚', null);
INSERT INTO `sensitive_word` VALUES ('5013', '吴帮国', null);
INSERT INTO `sensitive_word` VALUES ('5014', '无帮国', null);
INSERT INTO `sensitive_word` VALUES ('5015', '无邦国', null);
INSERT INTO `sensitive_word` VALUES ('5016', '无帮过', null);
INSERT INTO `sensitive_word` VALUES ('5017', '瘟家宝', null);
INSERT INTO `sensitive_word` VALUES ('5018', '假庆林', null);
INSERT INTO `sensitive_word` VALUES ('5019', '甲庆林', null);
INSERT INTO `sensitive_word` VALUES ('5020', '假青林', null);
INSERT INTO `sensitive_word` VALUES ('5021', '离长春', null);
INSERT INTO `sensitive_word` VALUES ('5022', '习远平', null);
INSERT INTO `sensitive_word` VALUES ('5023', '袭近平', null);
INSERT INTO `sensitive_word` VALUES ('5024', '李磕墙', null);
INSERT INTO `sensitive_word` VALUES ('5025', '贺过墙', null);
INSERT INTO `sensitive_word` VALUES ('5026', '和锅枪', null);
INSERT INTO `sensitive_word` VALUES ('5027', '粥永康', null);
INSERT INTO `sensitive_word` VALUES ('5028', '轴永康', null);
INSERT INTO `sensitive_word` VALUES ('5029', '肘永康', null);
INSERT INTO `sensitive_word` VALUES ('5030', '周健康', null);
INSERT INTO `sensitive_word` VALUES ('5031', '粥健康', null);
INSERT INTO `sensitive_word` VALUES ('5032', '周小康', null);
INSERT INTO `sensitive_word` VALUES ('5033', '六四运动', null);
INSERT INTO `sensitive_word` VALUES ('5034', '美国之音', null);
INSERT INTO `sensitive_word` VALUES ('5035', '密宗', null);
INSERT INTO `sensitive_word` VALUES ('5036', '民国', null);
INSERT INTO `sensitive_word` VALUES ('5038', '民主潮', null);
INSERT INTO `sensitive_word` VALUES ('5039', '摩门教', null);
INSERT INTO `sensitive_word` VALUES ('5040', '纳粹', null);
INSERT INTO `sensitive_word` VALUES ('5041', '南华早报', null);
INSERT INTO `sensitive_word` VALUES ('5042', '南蛮', null);
INSERT INTO `sensitive_word` VALUES ('5043', '亲民党', null);
INSERT INTO `sensitive_word` VALUES ('5044', '瘸腿帮', null);
INSERT INTO `sensitive_word` VALUES ('5045', '人民报', null);
INSERT INTO `sensitive_word` VALUES ('5046', '打倒共产党', null);
INSERT INTO `sensitive_word` VALUES ('5047', '台独万岁', null);
INSERT INTO `sensitive_word` VALUES ('5048', '圣战', null);
INSERT INTO `sensitive_word` VALUES ('5049', '示威', null);
INSERT INTO `sensitive_word` VALUES ('5050', '台独', null);
INSERT INTO `sensitive_word` VALUES ('5051', '台独分子', null);
INSERT INTO `sensitive_word` VALUES ('5052', '台联', null);
INSERT INTO `sensitive_word` VALUES ('5053', '台湾民国', null);
INSERT INTO `sensitive_word` VALUES ('5054', '台湾岛国', null);
INSERT INTO `sensitive_word` VALUES ('5055', '台湾国', null);
INSERT INTO `sensitive_word` VALUES ('5056', '台湾独立', null);
INSERT INTO `sensitive_word` VALUES ('5057', '太子党', null);
INSERT INTO `sensitive_word` VALUES ('5058', '新党', null);
INSERT INTO `sensitive_word` VALUES ('5059', '新疆独立', null);
INSERT INTO `sensitive_word` VALUES ('5060', '新疆分裂', null);
INSERT INTO `sensitive_word` VALUES ('5061', '新疆国', null);
INSERT INTO `sensitive_word` VALUES ('5062', '西藏独立', null);
INSERT INTO `sensitive_word` VALUES ('5063', '西藏分裂', null);
INSERT INTO `sensitive_word` VALUES ('5064', '西藏国', null);
INSERT INTO `sensitive_word` VALUES ('5065', '藏妇会', null);
INSERT INTO `sensitive_word` VALUES ('5066', '学潮', null);
INSERT INTO `sensitive_word` VALUES ('5067', '学运', null);
INSERT INTO `sensitive_word` VALUES ('5068', '一党专政', null);
INSERT INTO `sensitive_word` VALUES ('5069', '一贯道', null);
INSERT INTO `sensitive_word` VALUES ('5070', '游行', null);
INSERT INTO `sensitive_word` VALUES ('5071', '圆满', null);
INSERT INTO `sensitive_word` VALUES ('5072', '造反', null);
INSERT INTO `sensitive_word` VALUES ('5073', '镇压', null);
INSERT INTO `sensitive_word` VALUES ('5075', '政治反对派', null);
INSERT INTO `sensitive_word` VALUES ('5076', '政治犯', null);
INSERT INTO `sensitive_word` VALUES ('5077', '中共', null);
INSERT INTO `sensitive_word` VALUES ('5078', '反党', null);
INSERT INTO `sensitive_word` VALUES ('5081', '转法轮', null);
INSERT INTO `sensitive_word` VALUES ('5082', '苏家屯', null);
INSERT INTO `sensitive_word` VALUES ('5083', '基地组织', null);
INSERT INTO `sensitive_word` VALUES ('5084', '东亚病夫', null);
INSERT INTO `sensitive_word` VALUES ('5085', '高治联', null);
INSERT INTO `sensitive_word` VALUES ('5086', '专制', null);
INSERT INTO `sensitive_word` VALUES ('5087', '核工业基地', null);
INSERT INTO `sensitive_word` VALUES ('5088', '核武器', null);
INSERT INTO `sensitive_word` VALUES ('5089', '氢弹', null);
INSERT INTO `sensitive_word` VALUES ('5090', '导弹', null);
INSERT INTO `sensitive_word` VALUES ('5091', '核潜艇', null);
INSERT INTO `sensitive_word` VALUES ('5092', '大参考', null);
INSERT INTO `sensitive_word` VALUES ('5093', '小参考', null);
INSERT INTO `sensitive_word` VALUES ('5094', '国内动态清样', null);
INSERT INTO `sensitive_word` VALUES ('5095', '道教', null);
INSERT INTO `sensitive_word` VALUES ('5096', '多维', null);
INSERT INTO `sensitive_word` VALUES ('5097', '佛教', null);
INSERT INTO `sensitive_word` VALUES ('5098', '佛祖', null);
INSERT INTO `sensitive_word` VALUES ('5099', '释迦牟尼', null);
INSERT INTO `sensitive_word` VALUES ('5100', '如来', null);
INSERT INTO `sensitive_word` VALUES ('5101', '阿弥陀佛', null);
INSERT INTO `sensitive_word` VALUES ('5102', '观世音', null);
INSERT INTO `sensitive_word` VALUES ('5103', '普贤', null);
INSERT INTO `sensitive_word` VALUES ('5104', '文殊', null);
INSERT INTO `sensitive_word` VALUES ('5105', '地藏', null);
INSERT INTO `sensitive_word` VALUES ('5106', '河殇', null);
INSERT INTO `sensitive_word` VALUES ('5107', '回教', null);
INSERT INTO `sensitive_word` VALUES ('5108', '升天', null);
INSERT INTO `sensitive_word` VALUES ('5109', '圣母', null);
INSERT INTO `sensitive_word` VALUES ('5110', '耶和华', null);
INSERT INTO `sensitive_word` VALUES ('5111', '耶稣', null);
INSERT INTO `sensitive_word` VALUES ('5112', '真主安拉', null);
INSERT INTO `sensitive_word` VALUES ('5113', '白莲教', null);
INSERT INTO `sensitive_word` VALUES ('5114', '基督教', null);
INSERT INTO `sensitive_word` VALUES ('5115', '东正教', null);
INSERT INTO `sensitive_word` VALUES ('5116', '法轮', null);
INSERT INTO `sensitive_word` VALUES ('5117', '真理教', null);
INSERT INTO `sensitive_word` VALUES ('5118', '走向圆满', null);
INSERT INTO `sensitive_word` VALUES ('5119', '黄大仙', null);
INSERT INTO `sensitive_word` VALUES ('5120', '风水', null);
INSERT INTO `sensitive_word` VALUES ('5121', '跳大神', null);
INSERT INTO `sensitive_word` VALUES ('5122', '神汉', null);
INSERT INTO `sensitive_word` VALUES ('5123', '神婆', null);
INSERT INTO `sensitive_word` VALUES ('5124', '大卫教', null);
INSERT INTO `sensitive_word` VALUES ('5125', '阎王', null);
INSERT INTO `sensitive_word` VALUES ('5126', '黑白无常', null);
INSERT INTO `sensitive_word` VALUES ('5127', '牛头马面', null);
INSERT INTO `sensitive_word` VALUES ('5128', '蒙古鞑子', null);
INSERT INTO `sensitive_word` VALUES ('5129', '老毛子', null);
INSERT INTO `sensitive_word` VALUES ('5130', '回民吃猪肉', null);
INSERT INTO `sensitive_word` VALUES ('5131', '谋杀', null);
INSERT INTO `sensitive_word` VALUES ('5132', '杀人', null);
INSERT INTO `sensitive_word` VALUES ('5133', '吸毒', null);
INSERT INTO `sensitive_word` VALUES ('5134', '贩毒', null);
INSERT INTO `sensitive_word` VALUES ('5135', '赌博', null);
INSERT INTO `sensitive_word` VALUES ('5136', '拐卖', null);
INSERT INTO `sensitive_word` VALUES ('5137', '走私', null);
INSERT INTO `sensitive_word` VALUES ('5138', '卖淫', null);
INSERT INTO `sensitive_word` VALUES ('5139', '监狱', null);
INSERT INTO `sensitive_word` VALUES ('5140', '先奸后杀', null);
INSERT INTO `sensitive_word` VALUES ('5141', '押大', null);
INSERT INTO `sensitive_word` VALUES ('5142', '押小', null);
INSERT INTO `sensitive_word` VALUES ('5143', '抽头', null);
INSERT INTO `sensitive_word` VALUES ('5144', '坐庄', null);
INSERT INTO `sensitive_word` VALUES ('5145', '赌马', null);
INSERT INTO `sensitive_word` VALUES ('5146', '筹码', null);
INSERT INTO `sensitive_word` VALUES ('5147', '轮盘赌', null);
INSERT INTO `sensitive_word` VALUES ('5148', '可卡因', null);
INSERT INTO `sensitive_word` VALUES ('5149', '杜冷丁', null);
INSERT INTO `sensitive_word` VALUES ('5150', '鸦片', null);
INSERT INTO `sensitive_word` VALUES ('5151', '罂粟', null);
INSERT INTO `sensitive_word` VALUES ('5152', '嗑药', null);
INSERT INTO `sensitive_word` VALUES ('5153', 'AIDS', null);
INSERT INTO `sensitive_word` VALUES ('5154', 'DICK', null);
INSERT INTO `sensitive_word` VALUES ('5155', 'penis', null);
INSERT INTO `sensitive_word` VALUES ('5156', '爱滋', null);
INSERT INTO `sensitive_word` VALUES ('5157', '爱液', null);
INSERT INTO `sensitive_word` VALUES ('5158', '臭机八', null);
INSERT INTO `sensitive_word` VALUES ('5159', '臭鸡巴', null);
INSERT INTO `sensitive_word` VALUES ('5160', '吹喇叭', null);
INSERT INTO `sensitive_word` VALUES ('5161', '机八', null);
INSERT INTO `sensitive_word` VALUES ('5162', '机巴', null);
INSERT INTO `sensitive_word` VALUES ('5163', '鸡八', null);
INSERT INTO `sensitive_word` VALUES ('5164', '机掰', null);
INSERT INTO `sensitive_word` VALUES ('5165', '鸡叭', null);
INSERT INTO `sensitive_word` VALUES ('5166', '鸡鸡', null);
INSERT INTO `sensitive_word` VALUES ('5167', '鸡掰', null);
INSERT INTO `sensitive_word` VALUES ('5168', '精子', null);
INSERT INTO `sensitive_word` VALUES ('5169', '滥交', null);
INSERT INTO `sensitive_word` VALUES ('5170', '嫖娼', null);
INSERT INTO `sensitive_word` VALUES ('5171', '强奸犯', null);
INSERT INTO `sensitive_word` VALUES ('5172', '威而钢', null);
INSERT INTO `sensitive_word` VALUES ('5173', '威而柔', null);
INSERT INTO `sensitive_word` VALUES ('5174', '性高潮', null);
INSERT INTO `sensitive_word` VALUES ('5175', '援交妹', null);
INSERT INTO `sensitive_word` VALUES ('5176', '阳痿', null);
INSERT INTO `sensitive_word` VALUES ('5178', 'NMD', null);
INSERT INTO `sensitive_word` VALUES ('5179', 'NND', null);
INSERT INTO `sensitive_word` VALUES ('5181', 'SUCK', null);
INSERT INTO `sensitive_word` VALUES ('5182', 'tnnd', null);
INSERT INTO `sensitive_word` VALUES ('5183', 'K他命', null);
INSERT INTO `sensitive_word` VALUES ('5184', '白痴', null);
INSERT INTO `sensitive_word` VALUES ('5185', '操她妈', null);
INSERT INTO `sensitive_word` VALUES ('5186', '操妳妈', null);
INSERT INTO `sensitive_word` VALUES ('5187', '操你妈', null);
INSERT INTO `sensitive_word` VALUES ('5188', '操他妈', null);
INSERT INTO `sensitive_word` VALUES ('5189', '册那', null);
INSERT INTO `sensitive_word` VALUES ('5190', '侧那', null);
INSERT INTO `sensitive_word` VALUES ('5191', '测拿', null);
INSERT INTO `sensitive_word` VALUES ('5192', '蠢猪', null);
INSERT INTO `sensitive_word` VALUES ('5193', '废物', null);
INSERT INTO `sensitive_word` VALUES ('5194', '干她妈', null);
INSERT INTO `sensitive_word` VALUES ('5195', '干妳', null);
INSERT INTO `sensitive_word` VALUES ('5196', '干妳娘', null);
INSERT INTO `sensitive_word` VALUES ('5197', '干你妈', null);
INSERT INTO `sensitive_word` VALUES ('5198', '干你妈B', null);
INSERT INTO `sensitive_word` VALUES ('5199', '干你妈逼', null);
INSERT INTO `sensitive_word` VALUES ('5200', '干你娘', null);
INSERT INTO `sensitive_word` VALUES ('5201', '干他妈', null);
INSERT INTO `sensitive_word` VALUES ('5202', '狗娘养的', null);
INSERT INTO `sensitive_word` VALUES ('5203', '烂人', null);
INSERT INTO `sensitive_word` VALUES ('5204', '老母', null);
INSERT INTO `sensitive_word` VALUES ('5205', '老土', null);
INSERT INTO `sensitive_word` VALUES ('5206', '妈比', null);
INSERT INTO `sensitive_word` VALUES ('5207', '妈的', null);
INSERT INTO `sensitive_word` VALUES ('5208', '马的', null);
INSERT INTO `sensitive_word` VALUES ('5209', '妳老母的', null);
INSERT INTO `sensitive_word` VALUES ('5210', '妳娘的', null);
INSERT INTO `sensitive_word` VALUES ('5211', '破鞋', null);
INSERT INTO `sensitive_word` VALUES ('5212', '仆街', null);
INSERT INTO `sensitive_word` VALUES ('5213', '去她妈', null);
INSERT INTO `sensitive_word` VALUES ('5214', '去妳的', null);
INSERT INTO `sensitive_word` VALUES ('5215', '去妳妈', null);
INSERT INTO `sensitive_word` VALUES ('5216', '去你的', null);
INSERT INTO `sensitive_word` VALUES ('5217', '去你妈', null);
INSERT INTO `sensitive_word` VALUES ('5218', '去死', null);
INSERT INTO `sensitive_word` VALUES ('5219', '去他妈', null);
INSERT INTO `sensitive_word` VALUES ('5220', '赛她娘', null);
INSERT INTO `sensitive_word` VALUES ('5221', '赛妳娘', null);
INSERT INTO `sensitive_word` VALUES ('5222', '赛你娘', null);
INSERT INTO `sensitive_word` VALUES ('5223', '赛他娘', null);
INSERT INTO `sensitive_word` VALUES ('5224', '傻B', null);
INSERT INTO `sensitive_word` VALUES ('5225', '傻子', null);
INSERT INTO `sensitive_word` VALUES ('5226', '上妳', null);
INSERT INTO `sensitive_word` VALUES ('5227', '上你', null);
INSERT INTO `sensitive_word` VALUES ('5228', '神经病', null);
INSERT INTO `sensitive_word` VALUES ('5229', '屎妳娘', null);
INSERT INTO `sensitive_word` VALUES ('5230', '屎你娘', null);
INSERT INTO `sensitive_word` VALUES ('5231', '他妈的', null);
INSERT INTO `sensitive_word` VALUES ('5232', '王八蛋', null);
INSERT INTO `sensitive_word` VALUES ('5233', '乡巴佬', null);
INSERT INTO `sensitive_word` VALUES ('5234', '猪猡', null);
INSERT INTO `sensitive_word` VALUES ('5235', '骑你', null);
INSERT INTO `sensitive_word` VALUES ('5236', '骑他', null);
INSERT INTO `sensitive_word` VALUES ('5237', '骑她', null);
INSERT INTO `sensitive_word` VALUES ('5238', '欠骑', null);
INSERT INTO `sensitive_word` VALUES ('5239', '欠人骑', null);
INSERT INTO `sensitive_word` VALUES ('5240', '来爽我', null);
INSERT INTO `sensitive_word` VALUES ('5241', '来插我', null);
INSERT INTO `sensitive_word` VALUES ('5242', '干爆', null);
INSERT INTO `sensitive_word` VALUES ('5243', '干机', null);
INSERT INTO `sensitive_word` VALUES ('5244', '机叭', null);
INSERT INTO `sensitive_word` VALUES ('5245', '臭鸡', null);
INSERT INTO `sensitive_word` VALUES ('5246', '臭机', null);
INSERT INTO `sensitive_word` VALUES ('5247', '烂鸟', null);
INSERT INTO `sensitive_word` VALUES ('5248', '览叫', null);
INSERT INTO `sensitive_word` VALUES ('5249', '摸咪咪', null);
INSERT INTO `sensitive_word` VALUES ('5250', 'KISS', null);
INSERT INTO `sensitive_word` VALUES ('5253', '干鸡', null);
INSERT INTO `sensitive_word` VALUES ('5254', '干入', null);
INSERT INTO `sensitive_word` VALUES ('5255', '爽你', null);
INSERT INTO `sensitive_word` VALUES ('5256', '干干', null);
INSERT INTO `sensitive_word` VALUES ('5257', '干X', null);
INSERT INTO `sensitive_word` VALUES ('5258', '他干', null);
INSERT INTO `sensitive_word` VALUES ('5259', '干牠', null);
INSERT INTO `sensitive_word` VALUES ('5260', '干您', null);
INSERT INTO `sensitive_word` VALUES ('5261', '干汝', null);
INSERT INTO `sensitive_word` VALUES ('5262', '干林', null);
INSERT INTO `sensitive_word` VALUES ('5263', '操林', null);
INSERT INTO `sensitive_word` VALUES ('5264', '干尼', null);
INSERT INTO `sensitive_word` VALUES ('5265', '操尼', null);
INSERT INTO `sensitive_word` VALUES ('5266', '我咧干', null);
INSERT INTO `sensitive_word` VALUES ('5267', '干勒', null);
INSERT INTO `sensitive_word` VALUES ('5268', '干到', null);
INSERT INTO `sensitive_word` VALUES ('5269', '干啦', null);
INSERT INTO `sensitive_word` VALUES ('5270', '干爽', null);
INSERT INTO `sensitive_word` VALUES ('5271', '狗干', null);
INSERT INTO `sensitive_word` VALUES ('5272', '来干', null);
INSERT INTO `sensitive_word` VALUES ('5273', '轮干', null);
INSERT INTO `sensitive_word` VALUES ('5274', '轮流干', null);
INSERT INTO `sensitive_word` VALUES ('5275', '干一干', null);
INSERT INTO `sensitive_word` VALUES ('5276', '奸暴', null);
INSERT INTO `sensitive_word` VALUES ('5277', '再奸', null);
INSERT INTO `sensitive_word` VALUES ('5278', '我奸', null);
INSERT INTO `sensitive_word` VALUES ('5279', '奸你', null);
INSERT INTO `sensitive_word` VALUES ('5280', '奸他', null);
INSERT INTO `sensitive_word` VALUES ('5281', '奸她', null);
INSERT INTO `sensitive_word` VALUES ('5282', '奸一奸', null);
INSERT INTO `sensitive_word` VALUES ('5283', '淫湿', null);
INSERT INTO `sensitive_word` VALUES ('5284', '鸡歪', null);
INSERT INTO `sensitive_word` VALUES ('5285', '臭西', null);
INSERT INTO `sensitive_word` VALUES ('5286', '烂逼', null);
INSERT INTO `sensitive_word` VALUES ('5287', '大血比', null);
INSERT INTO `sensitive_word` VALUES ('5288', '叼你妈', null);
INSERT INTO `sensitive_word` VALUES ('5289', '靠你妈', null);
INSERT INTO `sensitive_word` VALUES ('5290', '戳你', null);
INSERT INTO `sensitive_word` VALUES ('5291', '逼你老母', null);
INSERT INTO `sensitive_word` VALUES ('5292', '挨球', null);
INSERT INTO `sensitive_word` VALUES ('5293', '我日你', null);
INSERT INTO `sensitive_word` VALUES ('5294', '草拟妈', null);
INSERT INTO `sensitive_word` VALUES ('5295', '卖逼', null);
INSERT INTO `sensitive_word` VALUES ('5296', '狗操卖逼', null);
INSERT INTO `sensitive_word` VALUES ('5297', '日死', null);
INSERT INTO `sensitive_word` VALUES ('5298', '奶娘', null);
INSERT INTO `sensitive_word` VALUES ('5299', '他娘', null);
INSERT INTO `sensitive_word` VALUES ('5300', '她娘', null);
INSERT INTO `sensitive_word` VALUES ('5301', '你妈了妹', null);
INSERT INTO `sensitive_word` VALUES ('5302', '逼毛', null);
INSERT INTO `sensitive_word` VALUES ('5303', '插你妈', null);
INSERT INTO `sensitive_word` VALUES ('5304', '叼你', null);
INSERT INTO `sensitive_word` VALUES ('5305', '渣波波', null);
INSERT INTO `sensitive_word` VALUES ('5306', 'weelaa', null);
INSERT INTO `sensitive_word` VALUES ('5307', '缔顺', null);
INSERT INTO `sensitive_word` VALUES ('5308', '帝顺', null);
INSERT INTO `sensitive_word` VALUES ('5309', '蒂顺', null);
INSERT INTO `sensitive_word` VALUES ('5310', '午夜', null);
INSERT INTO `sensitive_word` VALUES ('5311', '看下', null);
INSERT INTO `sensitive_word` VALUES ('5312', '法克鱿', null);
INSERT INTO `sensitive_word` VALUES ('5313', '雅蠛蝶', null);
INSERT INTO `sensitive_word` VALUES ('5314', '潜烈蟹', null);
INSERT INTO `sensitive_word` VALUES ('5315', '菊花蚕', null);
INSERT INTO `sensitive_word` VALUES ('5316', '尾申鲸', null);
INSERT INTO `sensitive_word` VALUES ('5317', '吉跋猫', null);
INSERT INTO `sensitive_word` VALUES ('5318', '搞栗棒', null);
INSERT INTO `sensitive_word` VALUES ('5319', '吟稻雁', null);
INSERT INTO `sensitive_word` VALUES ('5320', '达菲鸡', null);
INSERT INTO `sensitive_word` VALUES ('5321', '马勒戈壁', null);
INSERT INTO `sensitive_word` VALUES ('5322', '世界', null);
INSERT INTO `sensitive_word` VALUES ('5323', '仙门', null);
INSERT INTO `sensitive_word` VALUES ('5324', '门派', null);
INSERT INTO `sensitive_word` VALUES ('5325', '队伍', null);
INSERT INTO `sensitive_word` VALUES ('5326', '游戏中四大角色名', null);
INSERT INTO `sensitive_word` VALUES ('5327', '天元修士', null);
INSERT INTO `sensitive_word` VALUES ('5328', '龙神后裔', null);
INSERT INTO `sensitive_word` VALUES ('5329', '贪狼星君', null);
INSERT INTO `sensitive_word` VALUES ('5330', '狐中仙子', null);
INSERT INTO `sensitive_word` VALUES ('5331', '骆驼互动', null);
INSERT INTO `sensitive_word` VALUES ('5332', '玄天录', null);
INSERT INTO `sensitive_word` VALUES ('5337', '管理', null);
INSERT INTO `sensitive_word` VALUES ('5338', '管里', null);
INSERT INTO `sensitive_word` VALUES ('5339', '管理员', null);
INSERT INTO `sensitive_word` VALUES ('5340', '服务管理', null);
INSERT INTO `sensitive_word` VALUES ('5341', '服务器', null);
INSERT INTO `sensitive_word` VALUES ('5342', '活动管理员', null);
INSERT INTO `sensitive_word` VALUES ('5343', '官方', null);
INSERT INTO `sensitive_word` VALUES ('5344', '维护', null);
INSERT INTO `sensitive_word` VALUES ('5345', '审查', null);
INSERT INTO `sensitive_word` VALUES ('5346', '巡查', null);
INSERT INTO `sensitive_word` VALUES ('5347', '监督', null);
INSERT INTO `sensitive_word` VALUES ('5351', '游戏管理员', null);
INSERT INTO `sensitive_word` VALUES ('5355', '助理', null);
INSERT INTO `sensitive_word` VALUES ('5356', '客户服务', null);
INSERT INTO `sensitive_word` VALUES ('5357', '客服', null);
INSERT INTO `sensitive_word` VALUES ('5358', '服务天使', null);
INSERT INTO `sensitive_word` VALUES ('5360', '辅助程序', null);
INSERT INTO `sensitive_word` VALUES ('5361', '运营', null);
INSERT INTO `sensitive_word` VALUES ('5362', '运营者', null);
INSERT INTO `sensitive_word` VALUES ('5363', '运营组', null);
INSERT INTO `sensitive_word` VALUES ('5364', '运营商', null);
INSERT INTO `sensitive_word` VALUES ('5365', '运营长', null);
INSERT INTO `sensitive_word` VALUES ('5366', '运营官', null);
INSERT INTO `sensitive_word` VALUES ('5367', '运营人', null);
INSERT INTO `sensitive_word` VALUES ('5368', '私服', null);
INSERT INTO `sensitive_word` VALUES ('5369', '私人服务器', null);
INSERT INTO `sensitive_word` VALUES ('5370', '外挂', null);
INSERT INTO `sensitive_word` VALUES ('5371', '开房', null);
INSERT INTO `sensitive_word` VALUES ('5372', '髑屙民', null);
INSERT INTO `sensitive_word` VALUES ('5373', '阝月', null);
INSERT INTO `sensitive_word` VALUES ('5374', '毂 ', null);
INSERT INTO `sensitive_word` VALUES ('5375', '翮 ', null);
INSERT INTO `sensitive_word` VALUES ('5377', '劐 ', null);
INSERT INTO `sensitive_word` VALUES ('5378', '圮綦', null);
INSERT INTO `sensitive_word` VALUES ('5379', '庆红', null);
INSERT INTO `sensitive_word` VALUES ('5380', '蛩鼽', null);
INSERT INTO `sensitive_word` VALUES ('5381', '蠼毵', null);
INSERT INTO `sensitive_word` VALUES ('5382', 'dishun  ', null);
INSERT INTO `sensitive_word` VALUES ('5384', 'ai滋  ', null);
INSERT INTO `sensitive_word` VALUES ('5385', 'Arqus会议场  ', null);
INSERT INTO `sensitive_word` VALUES ('5386', 'asshole  ', null);
INSERT INTO `sensitive_word` VALUES ('5388', 'Baichi  ', null);
INSERT INTO `sensitive_word` VALUES ('5389', 'Baopi  ', null);
INSERT INTO `sensitive_word` VALUES ('5390', 'Bao皮  ', null);
INSERT INTO `sensitive_word` VALUES ('5391', 'bastard  ', null);
INSERT INTO `sensitive_word` VALUES ('5392', 'Bi样  ', null);
INSERT INTO `sensitive_word` VALUES ('5393', 'boxun  ', null);
INSERT INTO `sensitive_word` VALUES ('5394', 'B样  ', null);
INSERT INTO `sensitive_word` VALUES ('5396', 'caobi  ', null);
INSERT INTO `sensitive_word` VALUES ('5397', 'cao你妈   ', null);
INSERT INTO `sensitive_word` VALUES ('5398', 'cao你大爷  ', null);
INSERT INTO `sensitive_word` VALUES ('5399', 'cha你  ', null);
INSERT INTO `sensitive_word` VALUES ('5400', 'chinaliberal  ', null);
INSERT INTO `sensitive_word` VALUES ('5401', 'chinamz  ', null);
INSERT INTO `sensitive_word` VALUES ('5402', 'chinesenewsnet  ', null);
INSERT INTO `sensitive_word` VALUES ('5403', 'Clockgemstone  ', null);
INSERT INTO `sensitive_word` VALUES ('5405', 'creaders  ', null);
INSERT INTO `sensitive_word` VALUES ('5406', 'Crestbone  ', null);
INSERT INTO `sensitive_word` VALUES ('5407', 'dafa  ', null);
INSERT INTO `sensitive_word` VALUES ('5408', 'damn  ', null);
INSERT INTO `sensitive_word` VALUES ('5409', 'dfdz  ', null);
INSERT INTO `sensitive_word` VALUES ('5412', 'falu  ', null);
INSERT INTO `sensitive_word` VALUES ('5413', 'falundafa  ', null);
INSERT INTO `sensitive_word` VALUES ('5414', 'Feelmistone  ', null);
INSERT INTO `sensitive_word` VALUES ('5417', 'freechina  ', null);
INSERT INTO `sensitive_word` VALUES ('5418', 'freedom  ', null);
INSERT INTO `sensitive_word` VALUES ('5419', 'freenet  ', null);
INSERT INTO `sensitive_word` VALUES ('5420', 'gan你  ', null);
INSERT INTO `sensitive_word` VALUES ('5422', 'Gruepin  ', null);
INSERT INTO `sensitive_word` VALUES ('5423', 'HACKING  ', null);
INSERT INTO `sensitive_word` VALUES ('5430', 'jiangdongriji  ', null);
INSERT INTO `sensitive_word` VALUES ('5431', 'jian你  ', null);
INSERT INTO `sensitive_word` VALUES ('5432', 'jiaochuang  ', null);
INSERT INTO `sensitive_word` VALUES ('5433', 'jiaochun  ', null);
INSERT INTO `sensitive_word` VALUES ('5434', 'jinv  ', null);
INSERT INTO `sensitive_word` VALUES ('5435', 'Ji女  ', null);
INSERT INTO `sensitive_word` VALUES ('5436', 'KISSMYASS  ', null);
INSERT INTO `sensitive_word` VALUES ('5437', 'lihongzhi  ', null);
INSERT INTO `sensitive_word` VALUES ('5438', 'Mai骚  ', null);
INSERT INTO `sensitive_word` VALUES ('5439', 'making  ', null);
INSERT INTO `sensitive_word` VALUES ('5440', 'minghuinews  ', null);
INSERT INTO `sensitive_word` VALUES ('5441', 'naive  ', null);
INSERT INTO `sensitive_word` VALUES ('5442', 'Neckromancer  ', null);
INSERT INTO `sensitive_word` VALUES ('5443', 'nmis  ', null);
INSERT INTO `sensitive_word` VALUES ('5444', 'peacehall  ', null);
INSERT INTO `sensitive_word` VALUES ('5445', 'pussy  ', null);
INSERT INTO `sensitive_word` VALUES ('5446', 'qiangjian  ', null);
INSERT INTO `sensitive_word` VALUES ('5447', 'Rape  ', null);
INSERT INTO `sensitive_word` VALUES ('5448', 'renminbao  ', null);
INSERT INTO `sensitive_word` VALUES ('5449', 'renmingbao  ', null);
INSERT INTO `sensitive_word` VALUES ('5451', 'safeweb  ', null);
INSERT INTO `sensitive_word` VALUES ('5452', 'saobi  ', null);
INSERT INTO `sensitive_word` VALUES ('5454', 'simple  ', null);
INSERT INTO `sensitive_word` VALUES ('5455', 'sucker  ', null);
INSERT INTO `sensitive_word` VALUES ('5458', 'tibetalk  ', null);
INSERT INTO `sensitive_word` VALUES ('5459', 'triangle  ', null);
INSERT INTO `sensitive_word` VALUES ('5460', 'triangleboy  ', null);
INSERT INTO `sensitive_word` VALUES ('5461', 'Tringel  ', null);
INSERT INTO `sensitive_word` VALUES ('5463', 'unixbox  ', null);
INSERT INTO `sensitive_word` VALUES ('5464', 'ustibet  ', null);
INSERT INTO `sensitive_word` VALUES ('5468', 'WEBZEN  ', null);
INSERT INTO `sensitive_word` VALUES ('5470', 'wstaiji  ', null);
INSERT INTO `sensitive_word` VALUES ('5472', 'uming  ', null);
INSERT INTO `sensitive_word` VALUES ('5473', 'zhengjianwang  ', null);
INSERT INTO `sensitive_word` VALUES ('5474', 'zhenshanren  ', null);
INSERT INTO `sensitive_word` VALUES ('5475', 'zhuanfalunADMIN', null);
INSERT INTO `sensitive_word` VALUES ('5476', 'BIAOZI', null);
INSERT INTO `sensitive_word` VALUES ('5477', 'BIAO子', null);
INSERT INTO `sensitive_word` VALUES ('5478', 'BIGNEWS', null);
INSERT INTO `sensitive_word` VALUES ('5481', 'JIBA', null);
INSERT INTO `sensitive_word` VALUES ('5489', 'YUMING', null);
INSERT INTO `sensitive_word` VALUES ('5490', 'ZHUANFALUN', null);
INSERT INTO `sensitive_word` VALUES ('5491', '周恩來', null);
INSERT INTO `sensitive_word` VALUES ('5492', '碡 ', null);
INSERT INTO `sensitive_word` VALUES ('5493', '朱駿 ', null);
INSERT INTO `sensitive_word` VALUES ('5494', '朱狨基', null);
INSERT INTO `sensitive_word` VALUES ('5495', '朱溶剂', null);
INSERT INTO `sensitive_word` VALUES ('5496', '朱熔基', null);
INSERT INTO `sensitive_word` VALUES ('5497', '猪操', null);
INSERT INTO `sensitive_word` VALUES ('5498', '猪聋畸', null);
INSERT INTO `sensitive_word` VALUES ('5499', '猪毛', null);
INSERT INTO `sensitive_word` VALUES ('5500', '專政', null);
INSERT INTO `sensitive_word` VALUES ('5501', '卓伯源', null);
INSERT INTO `sensitive_word` VALUES ('5502', '自民党', null);
INSERT INTO `sensitive_word` VALUES ('5503', '自已的故事', null);
INSERT INTO `sensitive_word` VALUES ('5504', '自由民主论坛', null);
INSERT INTO `sensitive_word` VALUES ('5505', '总理', null);
INSERT INTO `sensitive_word` VALUES ('5506', '作秀', null);
INSERT INTO `sensitive_word` VALUES ('5507', '阿扁萬歲', null);
INSERT INTO `sensitive_word` VALUES ('5508', '阿萊娜', null);
INSERT INTO `sensitive_word` VALUES ('5509', '啊無卵', null);
INSERT INTO `sensitive_word` VALUES ('5510', '埃裏克蘇特勤', null);
INSERT INTO `sensitive_word` VALUES ('5511', '埃斯萬', null);
INSERT INTO `sensitive_word` VALUES ('5512', '艾麗絲', null);
INSERT INTO `sensitive_word` VALUES ('5513', '愛滋', null);
INSERT INTO `sensitive_word` VALUES ('5514', '愛滋病', null);
INSERT INTO `sensitive_word` VALUES ('5515', '暗黑法師', null);
INSERT INTO `sensitive_word` VALUES ('5516', '奧克拉', null);
INSERT INTO `sensitive_word` VALUES ('5517', '奧拉德', null);
INSERT INTO `sensitive_word` VALUES ('5518', '奧利弗', null);
INSERT INTO `sensitive_word` VALUES ('5519', '奧魯奇', null);
INSERT INTO `sensitive_word` VALUES ('5520', '奧倫', null);
INSERT INTO `sensitive_word` VALUES ('5521', '奧特蘭', null);
INSERT INTO `sensitive_word` VALUES ('5522', '巴倫侍從', null);
INSERT INTO `sensitive_word` VALUES ('5523', '巴倫坦', null);
INSERT INTO `sensitive_word` VALUES ('5524', '白立樸', null);
INSERT INTO `sensitive_word` VALUES ('5525', '白夢', null);
INSERT INTO `sensitive_word` VALUES ('5526', '白皮書', null);
INSERT INTO `sensitive_word` VALUES ('5527', '班禪', null);
INSERT INTO `sensitive_word` VALUES ('5528', '寶石商人', null);
INSERT INTO `sensitive_word` VALUES ('5529', '保釣', null);
INSERT INTO `sensitive_word` VALUES ('5530', '鮑戈', null);
INSERT INTO `sensitive_word` VALUES ('5531', '鮑彤', null);
INSERT INTO `sensitive_word` VALUES ('5532', '鮑伊', null);
INSERT INTO `sensitive_word` VALUES ('5533', '暴風亡靈', null);
INSERT INTO `sensitive_word` VALUES ('5534', '暴亂', null);
INSERT INTO `sensitive_word` VALUES ('5535', '暴熱的戰士', null);
INSERT INTO `sensitive_word` VALUES ('5536', '暴躁的城塔野獸', null);
INSERT INTO `sensitive_word` VALUES ('5537', '暴躁的警衛兵靈魂', null);
INSERT INTO `sensitive_word` VALUES ('5538', '暴躁的馬杜克', null);
INSERT INTO `sensitive_word` VALUES ('5539', '北大三角地論壇', null);
INSERT INTO `sensitive_word` VALUES ('5540', '北韓', null);
INSERT INTO `sensitive_word` VALUES ('5541', '北京當局', null);
INSERT INTO `sensitive_word` VALUES ('5542', '北美自由論壇', null);
INSERT INTO `sensitive_word` VALUES ('5543', '貝尤爾', null);
INSERT INTO `sensitive_word` VALUES ('5544', '逼樣', null);
INSERT INTO `sensitive_word` VALUES ('5545', '比樣', null);
INSERT INTO `sensitive_word` VALUES ('5546', '婊子養的 ', null);
INSERT INTO `sensitive_word` VALUES ('5547', '賓周', null);
INSERT INTO `sensitive_word` VALUES ('5548', '冰後', null);
INSERT INTO `sensitive_word` VALUES ('5549', '博訊', null);
INSERT INTO `sensitive_word` VALUES ('5550', '不滅帝王 ', null);
INSERT INTO `sensitive_word` VALUES ('5551', '不爽不要錢', null);
INSERT INTO `sensitive_word` VALUES ('5552', '布萊爾', null);
INSERT INTO `sensitive_word` VALUES ('5553', '布雷爾', null);
INSERT INTO `sensitive_word` VALUES ('5554', '蔡崇國', null);
INSERT INTO `sensitive_word` VALUES ('5555', '蔡啓芳', null);
INSERT INTO `sensitive_word` VALUES ('5556', '操鶏', null);
INSERT INTO `sensitive_word` VALUES ('5557', '操那嗎B', null);
INSERT INTO `sensitive_word` VALUES ('5558', '操那嗎逼', null);
INSERT INTO `sensitive_word` VALUES ('5559', '操那嗎比', null);
INSERT INTO `sensitive_word` VALUES ('5560', '操你媽', null);
INSERT INTO `sensitive_word` VALUES ('5561', '操你爺爺', null);
INSERT INTO `sensitive_word` VALUES ('5562', '曹長青', null);
INSERT INTO `sensitive_word` VALUES ('5563', '曹剛川', null);
INSERT INTO `sensitive_word` VALUES ('5564', '草你媽', null);
INSERT INTO `sensitive_word` VALUES ('5565', '草擬媽', null);
INSERT INTO `sensitive_word` VALUES ('5566', '册那娘餓比', null);
INSERT INTO `sensitive_word` VALUES ('5567', '插那嗎B', null);
INSERT INTO `sensitive_word` VALUES ('5568', '插那嗎逼', null);
INSERT INTO `sensitive_word` VALUES ('5569', '插那嗎比', null);
INSERT INTO `sensitive_word` VALUES ('5570', '插你媽', null);
INSERT INTO `sensitive_word` VALUES ('5571', '插你爺爺', null);
INSERT INTO `sensitive_word` VALUES ('5572', '長官沙塔特', null);
INSERT INTO `sensitive_word` VALUES ('5573', '常勁', null);
INSERT INTO `sensitive_word` VALUES ('5574', '朝鮮', null);
INSERT INTO `sensitive_word` VALUES ('5575', '車侖', null);
INSERT INTO `sensitive_word` VALUES ('5576', '車侖女幹', null);
INSERT INTO `sensitive_word` VALUES ('5577', '沉睡圖騰', null);
INSERT INTO `sensitive_word` VALUES ('5578', '陳水扁', null);
INSERT INTO `sensitive_word` VALUES ('5579', '陳總統', null);
INSERT INTO `sensitive_word` VALUES ('5580', '程凱', null);
INSERT INTO `sensitive_word` VALUES ('5581', '程鐵軍', null);
INSERT INTO `sensitive_word` VALUES ('5582', '痴鳩', null);
INSERT INTO `sensitive_word` VALUES ('5583', '痴拈', null);
INSERT INTO `sensitive_word` VALUES ('5584', '遲鈍的圖騰', null);
INSERT INTO `sensitive_word` VALUES ('5585', '持不同政見 ', null);
INSERT INTO `sensitive_word` VALUES ('5586', '赤色騎士', null);
INSERT INTO `sensitive_word` VALUES ('5587', '赤色戰士', null);
INSERT INTO `sensitive_word` VALUES ('5588', '處女膜', null);
INSERT INTO `sensitive_word` VALUES ('5589', '傳染性病', null);
INSERT INTO `sensitive_word` VALUES ('5590', '吹簫', null);
INSERT INTO `sensitive_word` VALUES ('5591', '春夏自由論壇', null);
INSERT INTO `sensitive_word` VALUES ('5592', '戳那嗎B', null);
INSERT INTO `sensitive_word` VALUES ('5593', '戳那嗎逼', null);
INSERT INTO `sensitive_word` VALUES ('5594', '戳那嗎比', null);
INSERT INTO `sensitive_word` VALUES ('5595', '錯B', null);
INSERT INTO `sensitive_word` VALUES ('5596', '錯逼', null);
INSERT INTO `sensitive_word` VALUES ('5597', '錯比', null);
INSERT INTO `sensitive_word` VALUES ('5598', '錯那嗎B', null);
INSERT INTO `sensitive_word` VALUES ('5599', '錯那嗎逼', null);
INSERT INTO `sensitive_word` VALUES ('5600', '錯那嗎比', null);
INSERT INTO `sensitive_word` VALUES ('5601', '達夫警衛兵', null);
INSERT INTO `sensitive_word` VALUES ('5602', '達夫侍從', null);
INSERT INTO `sensitive_word` VALUES ('5603', '達癩', null);
INSERT INTO `sensitive_word` VALUES ('5604', '打飛機', null);
INSERT INTO `sensitive_word` VALUES ('5605', '大參考', null);
INSERT INTO `sensitive_word` VALUES ('5606', '大東亞', null);
INSERT INTO `sensitive_word` VALUES ('5607', '大東亞共榮', null);
INSERT INTO `sensitive_word` VALUES ('5608', '大鶏巴', null);
INSERT INTO `sensitive_word` VALUES ('5609', '大紀元', null);
INSERT INTO `sensitive_word` VALUES ('5610', '大紀元新聞網', null);
INSERT INTO `sensitive_word` VALUES ('5611', '大紀園', null);
INSERT INTO `sensitive_word` VALUES ('5612', '大家論壇', null);
INSERT INTO `sensitive_word` VALUES ('5613', '大奶媽', null);
INSERT INTO `sensitive_word` VALUES ('5614', '大史記', null);
INSERT INTO `sensitive_word` VALUES ('5615', '大史紀', null);
INSERT INTO `sensitive_word` VALUES ('5616', '大衛教', null);
INSERT INTO `sensitive_word` VALUES ('5617', '大中國論壇', null);
INSERT INTO `sensitive_word` VALUES ('5618', '大中華論壇', null);
INSERT INTO `sensitive_word` VALUES ('5619', '大衆真人真事', null);
INSERT INTO `sensitive_word` VALUES ('5620', '戴維教', null);
INSERT INTO `sensitive_word` VALUES ('5621', '戴相龍', null);
INSERT INTO `sensitive_word` VALUES ('5622', '彈劾', null);
INSERT INTO `sensitive_word` VALUES ('5623', '蕩婦', null);
INSERT INTO `sensitive_word` VALUES ('5624', '導師', null);
INSERT INTO `sensitive_word` VALUES ('5625', '盜竊犯', null);
INSERT INTO `sensitive_word` VALUES ('5626', '德維爾', null);
INSERT INTO `sensitive_word` VALUES ('5627', '登輝', null);
INSERT INTO `sensitive_word` VALUES ('5628', '鄧笑貧', null);
INSERT INTO `sensitive_word` VALUES ('5629', '迪裏夏提', null);
INSERT INTO `sensitive_word` VALUES ('5630', '地下教會', null);
INSERT INTO `sensitive_word` VALUES ('5631', '帝國主義', null);
INSERT INTO `sensitive_word` VALUES ('5632', '電視流氓', null);
INSERT INTO `sensitive_word` VALUES ('5633', '叼你媽', null);
INSERT INTO `sensitive_word` VALUES ('5634', '釣魚島', null);
INSERT INTO `sensitive_word` VALUES ('5635', '丁關根', null);
INSERT INTO `sensitive_word` VALUES ('5636', '東北獨立', null);
INSERT INTO `sensitive_word` VALUES ('5637', '東部地下水路', null);
INSERT INTO `sensitive_word` VALUES ('5638', '東方紅時空', null);
INSERT INTO `sensitive_word` VALUES ('5639', '東方時空', null);
INSERT INTO `sensitive_word` VALUES ('5640', '東南西北論談', null);
INSERT INTO `sensitive_word` VALUES ('5641', '東社', null);
INSERT INTO `sensitive_word` VALUES ('5642', '東升', null);
INSERT INTO `sensitive_word` VALUES ('5643', '東條', null);
INSERT INTO `sensitive_word` VALUES ('5644', '東條英機', null);
INSERT INTO `sensitive_word` VALUES ('5645', '東突暴動', null);
INSERT INTO `sensitive_word` VALUES ('5646', '東突獨立', null);
INSERT INTO `sensitive_word` VALUES ('5647', '東土耳其斯坦', null);
INSERT INTO `sensitive_word` VALUES ('5648', '東西南北論壇', null);
INSERT INTO `sensitive_word` VALUES ('5649', '東亞', null);
INSERT INTO `sensitive_word` VALUES ('5650', '東院看守', null);
INSERT INTO `sensitive_word` VALUES ('5651', '動亂', null);
INSERT INTO `sensitive_word` VALUES ('5652', '鬥士哈夫拉蘇', null);
INSERT INTO `sensitive_word` VALUES ('5653', '鬥士霍克', null);
INSERT INTO `sensitive_word` VALUES ('5654', '獨裁', null);
INSERT INTO `sensitive_word` VALUES ('5655', '獨裁政治', null);
INSERT INTO `sensitive_word` VALUES ('5656', '獨夫', null);
INSERT INTO `sensitive_word` VALUES ('5657', '獨立臺灣會', null);
INSERT INTO `sensitive_word` VALUES ('5658', '發楞', null);
INSERT INTO `sensitive_word` VALUES ('5659', '發掄', null);
INSERT INTO `sensitive_word` VALUES ('5660', '發掄功', null);
INSERT INTO `sensitive_word` VALUES ('5661', '發倫', null);
INSERT INTO `sensitive_word` VALUES ('5662', '發倫功', null);
INSERT INTO `sensitive_word` VALUES ('5663', '發輪', null);
INSERT INTO `sensitive_word` VALUES ('5664', '發論', null);
INSERT INTO `sensitive_word` VALUES ('5665', '發論公', null);
INSERT INTO `sensitive_word` VALUES ('5666', '發論功', null);
INSERT INTO `sensitive_word` VALUES ('5667', '發騷', null);
INSERT INTO `sensitive_word` VALUES ('5668', '發正念', null);
INSERT INTO `sensitive_word` VALUES ('5669', '法爾卡', null);
INSERT INTO `sensitive_word` VALUES ('5670', '法掄', null);
INSERT INTO `sensitive_word` VALUES ('5671', '法掄功', null);
INSERT INTO `sensitive_word` VALUES ('5672', '法侖', null);
INSERT INTO `sensitive_word` VALUES ('5673', '法淪', null);
INSERT INTO `sensitive_word` VALUES ('5674', '法綸', null);
INSERT INTO `sensitive_word` VALUES ('5675', '法輪大法', null);
INSERT INTO `sensitive_word` VALUES ('5676', '法輪功', null);
INSERT INTO `sensitive_word` VALUES ('5677', '法十輪十功', null);
INSERT INTO `sensitive_word` VALUES ('5678', '法謫', null);
INSERT INTO `sensitive_word` VALUES ('5679', '法謫功', null);
INSERT INTO `sensitive_word` VALUES ('5680', '反封鎖', null);
INSERT INTO `sensitive_word` VALUES ('5681', '反封鎖技術', null);
INSERT INTO `sensitive_word` VALUES ('5682', '反腐敗論壇', null);
INSERT INTO `sensitive_word` VALUES ('5683', '反人類', null);
INSERT INTO `sensitive_word` VALUES ('5684', '反社會', null);
INSERT INTO `sensitive_word` VALUES ('5685', '方勵之', null);
INSERT INTO `sensitive_word` VALUES ('5686', '防衛指揮官', null);
INSERT INTO `sensitive_word` VALUES ('5687', '放蕩', null);
INSERT INTO `sensitive_word` VALUES ('5688', '飛揚論壇', null);
INSERT INTO `sensitive_word` VALUES ('5689', '廢墟守護者', null);
INSERT INTO `sensitive_word` VALUES ('5690', '費鴻泰', null);
INSERT INTO `sensitive_word` VALUES ('5691', '費良勇', null);
INSERT INTO `sensitive_word` VALUES ('5692', '分隊長施蒂文', null);
INSERT INTO `sensitive_word` VALUES ('5693', '粉飾太平', null);
INSERT INTO `sensitive_word` VALUES ('5694', '糞便', null);
INSERT INTO `sensitive_word` VALUES ('5695', '豐饒的果實', null);
INSERT INTO `sensitive_word` VALUES ('5696', '風雨神州', null);
INSERT INTO `sensitive_word` VALUES ('5697', '風雨神州論壇', null);
INSERT INTO `sensitive_word` VALUES ('5698', '封從德', null);
INSERT INTO `sensitive_word` VALUES ('5699', '封殺', null);
INSERT INTO `sensitive_word` VALUES ('5700', '封印的靈魂騎士', null);
INSERT INTO `sensitive_word` VALUES ('5701', '馮東海', null);
INSERT INTO `sensitive_word` VALUES ('5702', '馮素英', null);
INSERT INTO `sensitive_word` VALUES ('5703', '傅作義', null);
INSERT INTO `sensitive_word` VALUES ('5704', '幹bi', null);
INSERT INTO `sensitive_word` VALUES ('5705', '幹逼', null);
INSERT INTO `sensitive_word` VALUES ('5706', '幹比', null);
INSERT INTO `sensitive_word` VALUES ('5707', '幹的你', null);
INSERT INTO `sensitive_word` VALUES ('5708', '幹幹幹', null);
INSERT INTO `sensitive_word` VALUES ('5709', '幹她', null);
INSERT INTO `sensitive_word` VALUES ('5710', '幹你', null);
INSERT INTO `sensitive_word` VALUES ('5711', '幹你老比', null);
INSERT INTO `sensitive_word` VALUES ('5712', '幹你老母', null);
INSERT INTO `sensitive_word` VALUES ('5713', '幹你娘', null);
INSERT INTO `sensitive_word` VALUES ('5714', '幹全家', null);
INSERT INTO `sensitive_word` VALUES ('5715', '幹死', null);
INSERT INTO `sensitive_word` VALUES ('5716', '幹死你', null);
INSERT INTO `sensitive_word` VALUES ('5717', '幹他', null);
INSERT INTO `sensitive_word` VALUES ('5718', '幹一家', null);
INSERT INTO `sensitive_word` VALUES ('5719', '趕你娘', null);
INSERT INTO `sensitive_word` VALUES ('5720', '岡巒', null);
INSERT INTO `sensitive_word` VALUES ('5721', '剛比', null);
INSERT INTO `sensitive_word` VALUES ('5722', '剛比樣子', null);
INSERT INTO `sensitive_word` VALUES ('5723', '崗哨士兵', null);
INSERT INTO `sensitive_word` VALUES ('5724', '肛門', null);
INSERT INTO `sensitive_word` VALUES ('5725', '高麗棒子', null);
INSERT INTO `sensitive_word` VALUES ('5726', '高文謙', null);
INSERT INTO `sensitive_word` VALUES ('5727', '高薪養廉', null);
INSERT INTO `sensitive_word` VALUES ('5728', '高自聯', null);
INSERT INTO `sensitive_word` VALUES ('5729', '膏藥旗', null);
INSERT INTO `sensitive_word` VALUES ('5730', '戈瑞爾德', null);
INSERT INTO `sensitive_word` VALUES ('5731', '戈揚', null);
INSERT INTO `sensitive_word` VALUES ('5732', '鴿派', null);
INSERT INTO `sensitive_word` VALUES ('5733', '歌功頌德', null);
INSERT INTO `sensitive_word` VALUES ('5734', '工自聯', null);
INSERT INTO `sensitive_word` VALUES ('5735', '弓雖', null);
INSERT INTO `sensitive_word` VALUES ('5736', '共産', null);
INSERT INTO `sensitive_word` VALUES ('5737', '共産黨', null);
INSERT INTO `sensitive_word` VALUES ('5738', '共産主義', null);
INSERT INTO `sensitive_word` VALUES ('5739', '共黨', null);
INSERT INTO `sensitive_word` VALUES ('5740', '共軍', null);
INSERT INTO `sensitive_word` VALUES ('5741', '共榮圈', null);
INSERT INTO `sensitive_word` VALUES ('5742', '狗誠', null);
INSERT INTO `sensitive_word` VALUES ('5743', '狗狼養的', null);
INSERT INTO `sensitive_word` VALUES ('5744', '狗娘養的', null);
INSERT INTO `sensitive_word` VALUES ('5745', '狗養', null);
INSERT INTO `sensitive_word` VALUES ('5746', '狗雜種', null);
INSERT INTO `sensitive_word` VALUES ('5747', '古龍祭壇', null);
INSERT INTO `sensitive_word` VALUES ('5748', '骨獅', null);
INSERT INTO `sensitive_word` VALUES ('5749', '關卓中', null);
INSERT INTO `sensitive_word` VALUES ('5750', '貫通兩極法', null);
INSERT INTO `sensitive_word` VALUES ('5751', '廣聞', null);
INSERT INTO `sensitive_word` VALUES ('5752', '龜兒子', null);
INSERT INTO `sensitive_word` VALUES ('5753', '龜公', null);
INSERT INTO `sensitive_word` VALUES ('5754', '龜孫子', null);
INSERT INTO `sensitive_word` VALUES ('5755', '龜頭', null);
INSERT INTO `sensitive_word` VALUES ('5756', '龜投', null);
INSERT INTO `sensitive_word` VALUES ('5757', '滾那嗎', null);
INSERT INTO `sensitive_word` VALUES ('5758', '滾那嗎B', null);
INSERT INTO `sensitive_word` VALUES ('5759', '滾那嗎錯比', null);
INSERT INTO `sensitive_word` VALUES ('5760', '滾那嗎老比', null);
INSERT INTO `sensitive_word` VALUES ('5761', '滾那嗎瘟比', null);
INSERT INTO `sensitive_word` VALUES ('5762', '郭俊銘', null);
INSERT INTO `sensitive_word` VALUES ('5763', '郭羅基', null);
INSERT INTO `sensitive_word` VALUES ('5764', '郭岩華', null);
INSERT INTO `sensitive_word` VALUES ('5765', '國家安全', null);
INSERT INTO `sensitive_word` VALUES ('5766', '國家機密', null);
INSERT INTO `sensitive_word` VALUES ('5767', '國軍', null);
INSERT INTO `sensitive_word` VALUES ('5768', '國賊', null);
INSERT INTO `sensitive_word` VALUES ('5769', '哈爾羅尼', null);
INSERT INTO `sensitive_word` VALUES ('5770', '韓東方', null);
INSERT INTO `sensitive_word` VALUES ('5771', '韓聯潮', null);
INSERT INTO `sensitive_word` VALUES ('5772', '韓正', null);
INSERT INTO `sensitive_word` VALUES ('5773', '漢奸', null);
INSERT INTO `sensitive_word` VALUES ('5774', '河殤', null);
INSERT INTO `sensitive_word` VALUES ('5775', '賀國强', null);
INSERT INTO `sensitive_word` VALUES ('5776', '賀龍', null);
INSERT INTO `sensitive_word` VALUES ('5777', '黑社會', null);
INSERT INTO `sensitive_word` VALUES ('5778', '黑手黨', null);
INSERT INTO `sensitive_word` VALUES ('5779', '紅燈區', null);
INSERT INTO `sensitive_word` VALUES ('5780', '紅色恐怖', null);
INSERT INTO `sensitive_word` VALUES ('5781', '紅炎猛獸', null);
INSERT INTO `sensitive_word` VALUES ('5782', '洪傳', null);
INSERT INTO `sensitive_word` VALUES ('5783', '洪興', null);
INSERT INTO `sensitive_word` VALUES ('5784', '洪哲勝', null);
INSERT INTO `sensitive_word` VALUES ('5785', '胡緊掏', null);
INSERT INTO `sensitive_word` VALUES ('5786', '胡錦滔', null);
INSERT INTO `sensitive_word` VALUES ('5787', '胡錦淘', null);
INSERT INTO `sensitive_word` VALUES ('5788', '胡景濤', null);
INSERT INTO `sensitive_word` VALUES ('5789', '胡喬木', null);
INSERT INTO `sensitive_word` VALUES ('5790', '胡總書記', null);
INSERT INTO `sensitive_word` VALUES ('5791', '湖岸護衛兵', null);
INSERT INTO `sensitive_word` VALUES ('5792', '湖岸警衛兵', null);
INSERT INTO `sensitive_word` VALUES ('5793', '湖岸哨兵隊長', null);
INSERT INTO `sensitive_word` VALUES ('5794', '護法', null);
INSERT INTO `sensitive_word` VALUES ('5795', '華建敏', null);
INSERT INTO `sensitive_word` VALUES ('5796', '華通時事論壇', null);
INSERT INTO `sensitive_word` VALUES ('5797', '華夏文摘', null);
INSERT INTO `sensitive_word` VALUES ('5798', '華語世界論壇', null);
INSERT INTO `sensitive_word` VALUES ('5799', '華岳時事論壇', null);
INSERT INTO `sensitive_word` VALUES ('5800', '懷特', null);
INSERT INTO `sensitive_word` VALUES ('5801', '皇軍', null);
INSERT INTO `sensitive_word` VALUES ('5802', '黃伯源', null);
INSERT INTO `sensitive_word` VALUES ('5803', '黃慈萍', null);
INSERT INTO `sensitive_word` VALUES ('5804', '黃禍', null);
INSERT INTO `sensitive_word` VALUES ('5805', '黃劍輝', null);
INSERT INTO `sensitive_word` VALUES ('5806', '黃金幼龍', null);
INSERT INTO `sensitive_word` VALUES ('5807', '黃菊', null);
INSERT INTO `sensitive_word` VALUES ('5808', '黃片', null);
INSERT INTO `sensitive_word` VALUES ('5809', '黃翔', null);
INSERT INTO `sensitive_word` VALUES ('5810', '黃義交', null);
INSERT INTO `sensitive_word` VALUES ('5811', '黃仲生', null);
INSERT INTO `sensitive_word` VALUES ('5812', '回民暴動', null);
INSERT INTO `sensitive_word` VALUES ('5813', '毀滅步兵', null);
INSERT INTO `sensitive_word` VALUES ('5814', '毀滅騎士', null);
INSERT INTO `sensitive_word` VALUES ('5815', '毀滅射手', null);
INSERT INTO `sensitive_word` VALUES ('5816', '昏迷圖騰', null);
INSERT INTO `sensitive_word` VALUES ('5817', '混亂的圖騰', null);
INSERT INTO `sensitive_word` VALUES ('5818', '活動 ', null);
INSERT INTO `sensitive_word` VALUES ('5819', '擊倒圖騰', null);
INSERT INTO `sensitive_word` VALUES ('5820', '擊傷的圖騰', null);
INSERT INTO `sensitive_word` VALUES ('5821', '鶏八', null);
INSERT INTO `sensitive_word` VALUES ('5822', '鶏巴', null);
INSERT INTO `sensitive_word` VALUES ('5823', '鶏吧', null);
INSERT INTO `sensitive_word` VALUES ('5824', '鶏鶏', null);
INSERT INTO `sensitive_word` VALUES ('5825', '鶏奸', null);
INSERT INTO `sensitive_word` VALUES ('5826', '鶏毛信文匯', null);
INSERT INTO `sensitive_word` VALUES ('5827', '鶏女', null);
INSERT INTO `sensitive_word` VALUES ('5828', '鶏院', null);
INSERT INTO `sensitive_word` VALUES ('5829', '姬勝德', null);
INSERT INTO `sensitive_word` VALUES ('5830', '積克館', null);
INSERT INTO `sensitive_word` VALUES ('5831', '賈廷安', null);
INSERT INTO `sensitive_word` VALUES ('5832', '賈育台', null);
INSERT INTO `sensitive_word` VALUES ('5833', '監視塔', null);
INSERT INTO `sensitive_word` VALUES ('5834', '監視塔哨兵', null);
INSERT INTO `sensitive_word` VALUES ('5835', '監視塔哨兵隊長', null);
INSERT INTO `sensitive_word` VALUES ('5836', '簡肇棟', null);
INSERT INTO `sensitive_word` VALUES ('5837', '建國黨', null);
INSERT INTO `sensitive_word` VALUES ('5838', '賤B', null);
INSERT INTO `sensitive_word` VALUES ('5839', '賤bi', null);
INSERT INTO `sensitive_word` VALUES ('5840', '賤逼', null);
INSERT INTO `sensitive_word` VALUES ('5841', '賤比', null);
INSERT INTO `sensitive_word` VALUES ('5842', '賤貨', null);
INSERT INTO `sensitive_word` VALUES ('5843', '賤人', null);
INSERT INTO `sensitive_word` VALUES ('5844', '賤種', null);
INSERT INTO `sensitive_word` VALUES ('5845', '江八點', null);
INSERT INTO `sensitive_word` VALUES ('5846', '江羅', null);
INSERT INTO `sensitive_word` VALUES ('5847', '江綿恒', null);
INSERT INTO `sensitive_word` VALUES ('5848', '江戲子', null);
INSERT INTO `sensitive_word` VALUES ('5849', '江則民', null);
INSERT INTO `sensitive_word` VALUES ('5850', '江澤慧', null);
INSERT INTO `sensitive_word` VALUES ('5851', '江賊', null);
INSERT INTO `sensitive_word` VALUES ('5852', '江賊民', null);
INSERT INTO `sensitive_word` VALUES ('5853', '薑春雲', null);
INSERT INTO `sensitive_word` VALUES ('5854', '將則民', null);
INSERT INTO `sensitive_word` VALUES ('5855', '僵賊', null);
INSERT INTO `sensitive_word` VALUES ('5856', '僵賊民', null);
INSERT INTO `sensitive_word` VALUES ('5857', '講法', null);
INSERT INTO `sensitive_word` VALUES ('5858', '蔣介石', null);
INSERT INTO `sensitive_word` VALUES ('5859', '蔣中正', null);
INSERT INTO `sensitive_word` VALUES ('5860', '降低命中的圖騰', null);
INSERT INTO `sensitive_word` VALUES ('5861', '醬猪媳', null);
INSERT INTO `sensitive_word` VALUES ('5862', '狡猾的達夫', null);
INSERT INTO `sensitive_word` VALUES ('5863', '矯健的馬努爾', null);
INSERT INTO `sensitive_word` VALUES ('5864', '教養院', null);
INSERT INTO `sensitive_word` VALUES ('5865', '揭批書', null);
INSERT INTO `sensitive_word` VALUES ('5866', '她媽', null);
INSERT INTO `sensitive_word` VALUES ('5867', '届中央政治局委員', null);
INSERT INTO `sensitive_word` VALUES ('5868', '金槍不倒 ', null);
INSERT INTO `sensitive_word` VALUES ('5869', '金堯如', null);
INSERT INTO `sensitive_word` VALUES ('5870', '金澤辰', null);
INSERT INTO `sensitive_word` VALUES ('5871', '錦濤', null);
INSERT INTO `sensitive_word` VALUES ('5872', '經文', null);
INSERT INTO `sensitive_word` VALUES ('5873', '經血', null);
INSERT INTO `sensitive_word` VALUES ('5874', '莖候佳陰', null);
INSERT INTO `sensitive_word` VALUES ('5875', '荊棘護衛兵 ', null);
INSERT INTO `sensitive_word` VALUES ('5876', '靖國神社', null);
INSERT INTO `sensitive_word` VALUES ('5877', '舊斗篷哨兵', null);
INSERT INTO `sensitive_word` VALUES ('5878', '巨槌騎兵', null);
INSERT INTO `sensitive_word` VALUES ('5879', '巨鐵角哈克', null);
INSERT INTO `sensitive_word` VALUES ('5880', '鋸齒通道被遺弃的骷髏', null);
INSERT INTO `sensitive_word` VALUES ('5881', '鋸齒通道骷髏', null);
INSERT INTO `sensitive_word` VALUES ('5882', '絕望之地', null);
INSERT INTO `sensitive_word` VALUES ('5883', '軍妓', null);
INSERT INTO `sensitive_word` VALUES ('5884', '開苞', null);
INSERT INTO `sensitive_word` VALUES ('5885', '開放雜志', null);
INSERT INTO `sensitive_word` VALUES ('5886', '凱奧勒尼什', null);
INSERT INTO `sensitive_word` VALUES ('5887', '凱爾本', null);
INSERT INTO `sensitive_word` VALUES ('5888', '凱爾雷斯', null);
INSERT INTO `sensitive_word` VALUES ('5889', '凱特切爾', null);
INSERT INTO `sensitive_word` VALUES ('5890', '砍翻一條街', null);
INSERT INTO `sensitive_word` VALUES ('5891', '看中國', null);
INSERT INTO `sensitive_word` VALUES ('5892', '靠你媽', null);
INSERT INTO `sensitive_word` VALUES ('5893', '柯賜海', null);
INSERT INTO `sensitive_word` VALUES ('5894', '柯建銘', null);
INSERT INTO `sensitive_word` VALUES ('5895', '科萊爾', null);
INSERT INTO `sensitive_word` VALUES ('5896', '克萊恩', null);
INSERT INTO `sensitive_word` VALUES ('5897', '克萊特', null);
INSERT INTO `sensitive_word` VALUES ('5898', '克勞森', null);
INSERT INTO `sensitive_word` VALUES ('5899', '客戶服務', null);
INSERT INTO `sensitive_word` VALUES ('5900', '空氣精靈', null);
INSERT INTO `sensitive_word` VALUES ('5901', '空虛的伊坤', null);
INSERT INTO `sensitive_word` VALUES ('5902', '空虛之地', null);
INSERT INTO `sensitive_word` VALUES ('5903', '恐怖主義', null);
INSERT INTO `sensitive_word` VALUES ('5904', '鄺錦文', null);
INSERT INTO `sensitive_word` VALUES ('5905', '蘭迪', null);
INSERT INTO `sensitive_word` VALUES ('5906', '爛B', null);
INSERT INTO `sensitive_word` VALUES ('5907', '爛逼', null);
INSERT INTO `sensitive_word` VALUES ('5908', '爛比', null);
INSERT INTO `sensitive_word` VALUES ('5909', '爛袋', null);
INSERT INTO `sensitive_word` VALUES ('5910', '爛貨', null);
INSERT INTO `sensitive_word` VALUES ('5911', '濫B', null);
INSERT INTO `sensitive_word` VALUES ('5912', '濫逼', null);
INSERT INTO `sensitive_word` VALUES ('5913', '濫比', null);
INSERT INTO `sensitive_word` VALUES ('5914', '濫貨', null);
INSERT INTO `sensitive_word` VALUES ('5915', '濫交', null);
INSERT INTO `sensitive_word` VALUES ('5916', '勞動教養所', null);
INSERT INTO `sensitive_word` VALUES ('5917', '勞改', null);
INSERT INTO `sensitive_word` VALUES ('5918', '勞教', null);
INSERT INTO `sensitive_word` VALUES ('5919', '雷尼亞', null);
INSERT INTO `sensitive_word` VALUES ('5920', '李紅痔', null);
INSERT INTO `sensitive_word` VALUES ('5921', '李老師', null);
INSERT INTO `sensitive_word` VALUES ('5922', '李小鵬', null);
INSERT INTO `sensitive_word` VALUES ('5923', '李月月鳥', null);
INSERT INTO `sensitive_word` VALUES ('5924', '李志綏', null);
INSERT INTO `sensitive_word` VALUES ('5925', '李總理', null);
INSERT INTO `sensitive_word` VALUES ('5926', '李總統', null);
INSERT INTO `sensitive_word` VALUES ('5927', '連戰', null);
INSERT INTO `sensitive_word` VALUES ('5928', '聯總', null);
INSERT INTO `sensitive_word` VALUES ('5929', '廉政大論壇', null);
INSERT INTO `sensitive_word` VALUES ('5930', '煉功', null);
INSERT INTO `sensitive_word` VALUES ('5931', '兩岸關係', null);
INSERT INTO `sensitive_word` VALUES ('5932', '兩岸三地論壇', null);
INSERT INTO `sensitive_word` VALUES ('5933', '兩個中國', null);
INSERT INTO `sensitive_word` VALUES ('5934', '兩會', null);
INSERT INTO `sensitive_word` VALUES ('5935', '兩會報道', null);
INSERT INTO `sensitive_word` VALUES ('5936', '兩會新聞', null);
INSERT INTO `sensitive_word` VALUES ('5937', '呂秀蓮', null);
INSERT INTO `sensitive_word` VALUES ('5938', '亂交', null);
INSERT INTO `sensitive_word` VALUES ('5939', '亂輪', null);
INSERT INTO `sensitive_word` VALUES ('5940', '掄功', null);
INSERT INTO `sensitive_word` VALUES ('5941', '倫功', null);
INSERT INTO `sensitive_word` VALUES ('5942', '輪大', null);
INSERT INTO `sensitive_word` VALUES ('5943', '輪功', null);
INSERT INTO `sensitive_word` VALUES ('5944', '輪奸', null);
INSERT INTO `sensitive_word` VALUES ('5945', '論壇管理員', null);
INSERT INTO `sensitive_word` VALUES ('5946', '媽B', null);
INSERT INTO `sensitive_word` VALUES ('5947', '媽比', null);
INSERT INTO `sensitive_word` VALUES ('5948', '媽的', null);
INSERT INTO `sensitive_word` VALUES ('5949', '媽批', null);
INSERT INTO `sensitive_word` VALUES ('5950', '馬大維', null);
INSERT INTO `sensitive_word` VALUES ('5951', '馬克思', null);
INSERT INTO `sensitive_word` VALUES ('5952', '馬良駿', null);
INSERT INTO `sensitive_word` VALUES ('5953', '馬三家', null);
INSERT INTO `sensitive_word` VALUES ('5954', '馬時敏', null);
INSERT INTO `sensitive_word` VALUES ('5955', '馬特斯', null);
INSERT INTO `sensitive_word` VALUES ('5956', '馬英九', null);
INSERT INTO `sensitive_word` VALUES ('5957', '馬永成', null);
INSERT INTO `sensitive_word` VALUES ('5958', '瑪麗亞', null);
INSERT INTO `sensitive_word` VALUES ('5959', '瑪雅', null);
INSERT INTO `sensitive_word` VALUES ('5960', '嗎的', null);
INSERT INTO `sensitive_word` VALUES ('5961', '嗎啡', null);
INSERT INTO `sensitive_word` VALUES ('5962', '賣逼', null);
INSERT INTO `sensitive_word` VALUES ('5963', '賣比', null);
INSERT INTO `sensitive_word` VALUES ('5964', '賣國', null);
INSERT INTO `sensitive_word` VALUES ('5965', '賣騷', null);
INSERT INTO `sensitive_word` VALUES ('5966', '賣淫', null);
INSERT INTO `sensitive_word` VALUES ('5967', '瞞報', null);
INSERT INTO `sensitive_word` VALUES ('5968', '毛厠洞', null);
INSERT INTO `sensitive_word` VALUES ('5969', '毛賊', null);
INSERT INTO `sensitive_word` VALUES ('5970', '毛賊東', null);
INSERT INTO `sensitive_word` VALUES ('5971', '美國', null);
INSERT INTO `sensitive_word` VALUES ('5972', '美國參考', null);
INSERT INTO `sensitive_word` VALUES ('5973', '美國佬', null);
INSERT INTO `sensitive_word` VALUES ('5974', '美國之音', null);
INSERT INTO `sensitive_word` VALUES ('5975', '蒙獨', null);
INSERT INTO `sensitive_word` VALUES ('5976', '蒙古達子', null);
INSERT INTO `sensitive_word` VALUES ('5977', '蒙古獨', null);
INSERT INTO `sensitive_word` VALUES ('5978', '蒙古獨立', null);
INSERT INTO `sensitive_word` VALUES ('5979', '綿恒', null);
INSERT INTO `sensitive_word` VALUES ('5980', '民國', null);
INSERT INTO `sensitive_word` VALUES ('5981', '民進黨', null);
INSERT INTO `sensitive_word` VALUES ('5982', '民聯', null);
INSERT INTO `sensitive_word` VALUES ('5983', '民意論壇', null);
INSERT INTO `sensitive_word` VALUES ('5984', '民陣', null);
INSERT INTO `sensitive_word` VALUES ('5985', '民主墻', null);
INSERT INTO `sensitive_word` VALUES ('5986', '摸你鶏巴 ', null);
INSERT INTO `sensitive_word` VALUES ('5987', '莫偉强', null);
INSERT INTO `sensitive_word` VALUES ('5988', '木子論壇', null);
INSERT INTO `sensitive_word` VALUES ('5989', '內褲', null);
INSERT INTO `sensitive_word` VALUES ('5990', '內衣', null);
INSERT INTO `sensitive_word` VALUES ('5991', '那嗎B', null);
INSERT INTO `sensitive_word` VALUES ('5992', '那嗎逼', null);
INSERT INTO `sensitive_word` VALUES ('5993', '那嗎錯比', null);
INSERT INTO `sensitive_word` VALUES ('5994', '那嗎老比', null);
INSERT INTO `sensitive_word` VALUES ('5995', '那嗎瘟比', null);
INSERT INTO `sensitive_word` VALUES ('5996', '那娘錯比', null);
INSERT INTO `sensitive_word` VALUES ('5997', '納粹', null);
INSERT INTO `sensitive_word` VALUES ('5998', '奶頭', null);
INSERT INTO `sensitive_word` VALUES ('5999', '南大自由論壇', null);
INSERT INTO `sensitive_word` VALUES ('6000', '南蠻子', null);
INSERT INTO `sensitive_word` VALUES ('6001', '鬧事', null);
INSERT INTO `sensitive_word` VALUES ('6002', '能樣', null);
INSERT INTO `sensitive_word` VALUES ('6003', '尼奧夫', null);
INSERT INTO `sensitive_word` VALUES ('6004', '倪育賢', null);
INSERT INTO `sensitive_word` VALUES ('6005', '你媽', null);
INSERT INTO `sensitive_word` VALUES ('6006', '你媽逼', null);
INSERT INTO `sensitive_word` VALUES ('6007', '你媽比', null);
INSERT INTO `sensitive_word` VALUES ('6008', '你媽的', null);
INSERT INTO `sensitive_word` VALUES ('6009', '你媽了妹', null);
INSERT INTO `sensitive_word` VALUES ('6010', '你說我說論壇', null);
INSERT INTO `sensitive_word` VALUES ('6011', '你爺 ', null);
INSERT INTO `sensitive_word` VALUES ('6012', '娘餓比', null);
INSERT INTO `sensitive_word` VALUES ('6013', '捏你鶏巴', null);
INSERT INTO `sensitive_word` VALUES ('6014', '儂著岡巒', null);
INSERT INTO `sensitive_word` VALUES ('6015', '儂著卵拋', null);
INSERT INTO `sensitive_word` VALUES ('6016', '奴隸魔族士兵', null);
INSERT INTO `sensitive_word` VALUES ('6017', '女幹', null);
INSERT INTO `sensitive_word` VALUES ('6018', '女主人羅姬馬莉', null);
INSERT INTO `sensitive_word` VALUES ('6019', '諾姆', null);
INSERT INTO `sensitive_word` VALUES ('6020', '潘國平', null);
INSERT INTO `sensitive_word` VALUES ('6022', '龐建國', null);
INSERT INTO `sensitive_word` VALUES ('6023', '泡沫經濟', null);
INSERT INTO `sensitive_word` VALUES ('6024', '噴你', null);
INSERT INTO `sensitive_word` VALUES ('6025', '皮條客', null);
INSERT INTO `sensitive_word` VALUES ('6026', '潑婦 ', null);
INSERT INTO `sensitive_word` VALUES ('6027', '齊墨', null);
INSERT INTO `sensitive_word` VALUES ('6028', '齊諾', null);
INSERT INTO `sensitive_word` VALUES ('6029', '騎你', null);
INSERT INTO `sensitive_word` VALUES ('6030', '親美', null);
INSERT INTO `sensitive_word` VALUES ('6031', '親民黨', null);
INSERT INTO `sensitive_word` VALUES ('6032', '親日', null);
INSERT INTO `sensitive_word` VALUES ('6033', '欽本立', null);
INSERT INTO `sensitive_word` VALUES ('6034', '禽獸', null);
INSERT INTO `sensitive_word` VALUES ('6035', '輕舟快訊', null);
INSERT INTO `sensitive_word` VALUES ('6036', '情婦', null);
INSERT INTO `sensitive_word` VALUES ('6037', '情獸', null);
INSERT INTO `sensitive_word` VALUES ('6038', '去你媽的', null);
INSERT INTO `sensitive_word` VALUES ('6039', '全國兩會', null);
INSERT INTO `sensitive_word` VALUES ('6040', '全國人大', null);
INSERT INTO `sensitive_word` VALUES ('6041', '瘸腿幫', null);
INSERT INTO `sensitive_word` VALUES ('6042', '讓你操', null);
INSERT INTO `sensitive_word` VALUES ('6043', '熱比婭', null);
INSERT INTO `sensitive_word` VALUES ('6044', '熱站政論網', null);
INSERT INTO `sensitive_word` VALUES ('6045', '人民報', null);
INSERT INTO `sensitive_word` VALUES ('6046', '人民大會堂', null);
INSERT INTO `sensitive_word` VALUES ('6047', '人民內情真相', null);
INSERT INTO `sensitive_word` VALUES ('6048', '人民真實', null);
INSERT INTO `sensitive_word` VALUES ('6049', '人民之聲論壇', null);
INSERT INTO `sensitive_word` VALUES ('6050', '人權', null);
INSERT INTO `sensitive_word` VALUES ('6051', '日本帝國', null);
INSERT INTO `sensitive_word` VALUES ('6052', '日軍', null);
INSERT INTO `sensitive_word` VALUES ('6053', '日內瓦金融', null);
INSERT INTO `sensitive_word` VALUES ('6054', '日你媽', null);
INSERT INTO `sensitive_word` VALUES ('6055', '日你爺爺', null);
INSERT INTO `sensitive_word` VALUES ('6056', '日朱駿', null);
INSERT INTO `sensitive_word` VALUES ('6057', '乳頭', null);
INSERT INTO `sensitive_word` VALUES ('6058', '乳暈', null);
INSERT INTO `sensitive_word` VALUES ('6059', '瑞士金融大學', null);
INSERT INTO `sensitive_word` VALUES ('6060', '薩達姆', null);
INSERT INTO `sensitive_word` VALUES ('6061', '三K黨', null);
INSERT INTO `sensitive_word` VALUES ('6062', '三個代表', null);
INSERT INTO `sensitive_word` VALUES ('6063', '三級片', null);
INSERT INTO `sensitive_word` VALUES ('6064', '三去車侖工力', null);
INSERT INTO `sensitive_word` VALUES ('6065', '騷B', null);
INSERT INTO `sensitive_word` VALUES ('6066', '騷棒', null);
INSERT INTO `sensitive_word` VALUES ('6067', '騷包', null);
INSERT INTO `sensitive_word` VALUES ('6068', '騷逼', null);
INSERT INTO `sensitive_word` VALUES ('6069', '騷棍', null);
INSERT INTO `sensitive_word` VALUES ('6070', '騷貨', null);
INSERT INTO `sensitive_word` VALUES ('6071', '騷鶏', null);
INSERT INTO `sensitive_word` VALUES ('6072', '騷卵 ', null);
INSERT INTO `sensitive_word` VALUES ('6073', '殺你全家', null);
INSERT INTO `sensitive_word` VALUES ('6074', '殺你一家', null);
INSERT INTO `sensitive_word` VALUES ('6075', '殺人犯', null);
INSERT INTO `sensitive_word` VALUES ('6076', '傻鳥', null);
INSERT INTO `sensitive_word` VALUES ('6077', '煞筆', null);
INSERT INTO `sensitive_word` VALUES ('6078', '山口組', null);
INSERT INTO `sensitive_word` VALUES ('6079', '善惡有報', null);
INSERT INTO `sensitive_word` VALUES ('6080', '上訪', null);
INSERT INTO `sensitive_word` VALUES ('6081', '上海幫', null);
INSERT INTO `sensitive_word` VALUES ('6082', '上海孤兒院', null);
INSERT INTO `sensitive_word` VALUES ('6083', '社會主義', null);
INSERT INTO `sensitive_word` VALUES ('6084', '射了還說要', null);
INSERT INTO `sensitive_word` VALUES ('6085', '神經病', null);
INSERT INTO `sensitive_word` VALUES ('6086', '生孩子沒屁眼', null);
INSERT INTO `sensitive_word` VALUES ('6087', '生命分流的圖騰', null);
INSERT INTO `sensitive_word` VALUES ('6088', '聖射手', null);
INSERT INTO `sensitive_word` VALUES ('6089', '聖戰', null);
INSERT INTO `sensitive_word` VALUES ('6090', '盛華仁', null);
INSERT INTO `sensitive_word` VALUES ('6091', '濕了還說不要', null);
INSERT INTO `sensitive_word` VALUES ('6092', '濕了還說要', null);
INSERT INTO `sensitive_word` VALUES ('6093', '石化圖騰', null);
INSERT INTO `sensitive_word` VALUES ('6094', '石拳戰鬥兵', null);
INSERT INTO `sensitive_word` VALUES ('6095', '時代論壇', null);
INSERT INTO `sensitive_word` VALUES ('6096', '時事論壇', null);
INSERT INTO `sensitive_word` VALUES ('6097', '史萊姆', null);
INSERT INTO `sensitive_word` VALUES ('6098', '史萊姆王', null);
INSERT INTO `sensitive_word` VALUES ('6099', '士兵管理員瓦爾臣', null);
INSERT INTO `sensitive_word` VALUES ('6100', '世界經濟導報', null);
INSERT INTO `sensitive_word` VALUES ('6101', '事實獨立', null);
INSERT INTO `sensitive_word` VALUES ('6102', '侍從貝赫爾特', null);
INSERT INTO `sensitive_word` VALUES ('6103', '侍從倫斯韋', null);
INSERT INTO `sensitive_word` VALUES ('6104', '數據中國', null);
INSERT INTO `sensitive_word` VALUES ('6105', '雙十節', null);
INSERT INTO `sensitive_word` VALUES ('6106', '氵去車侖工力', null);
INSERT INTO `sensitive_word` VALUES ('6107', '稅力', null);
INSERT INTO `sensitive_word` VALUES ('6108', '司馬晋', null);
INSERT INTO `sensitive_word` VALUES ('6109', '司馬璐', null);
INSERT INTO `sensitive_word` VALUES ('6110', '司徒華', null);
INSERT INTO `sensitive_word` VALUES ('6111', '私處', null);
INSERT INTO `sensitive_word` VALUES ('6112', '思科羅', null);
INSERT INTO `sensitive_word` VALUES ('6113', '斯諾', null);
INSERT INTO `sensitive_word` VALUES ('6114', '斯皮爾德', null);
INSERT INTO `sensitive_word` VALUES ('6115', '四川獨', null);
INSERT INTO `sensitive_word` VALUES ('6116', '四川獨立', null);
INSERT INTO `sensitive_word` VALUES ('6117', '四人幫', null);
INSERT INTO `sensitive_word` VALUES ('6118', '宋書元', null);
INSERT INTO `sensitive_word` VALUES ('6119', '孫大千', null);
INSERT INTO `sensitive_word` VALUES ('6120', '孫中山', null);
INSERT INTO `sensitive_word` VALUES ('6121', '他媽', null);
INSERT INTO `sensitive_word` VALUES ('6122', '他媽的', null);
INSERT INTO `sensitive_word` VALUES ('6123', '他嗎的', null);
INSERT INTO `sensitive_word` VALUES ('6124', '他母親', null);
INSERT INTO `sensitive_word` VALUES ('6125', '塔內', null);
INSERT INTO `sensitive_word` VALUES ('6126', '塔烏', null);
INSERT INTO `sensitive_word` VALUES ('6127', '臺盟', null);
INSERT INTO `sensitive_word` VALUES ('6128', '臺灣帝國', null);
INSERT INTO `sensitive_word` VALUES ('6129', '臺灣獨立', null);
INSERT INTO `sensitive_word` VALUES ('6130', '臺灣獨', null);
INSERT INTO `sensitive_word` VALUES ('6131', '臺灣共産黨', null);
INSERT INTO `sensitive_word` VALUES ('6132', '臺灣狗', null);
INSERT INTO `sensitive_word` VALUES ('6133', '臺灣建國運動組織', null);
INSERT INTO `sensitive_word` VALUES ('6134', '臺灣民國', null);
INSERT INTO `sensitive_word` VALUES ('6135', '臺灣青年獨立聯盟', null);
INSERT INTO `sensitive_word` VALUES ('6136', '臺灣政論區', null);
INSERT INTO `sensitive_word` VALUES ('6137', '臺灣自由聯盟', null);
INSERT INTO `sensitive_word` VALUES ('6138', '太監', null);
INSERT INTO `sensitive_word` VALUES ('6139', '天安門', null);
INSERT INTO `sensitive_word` VALUES ('6140', '天安門錄影帶', null);
INSERT INTO `sensitive_word` VALUES ('6141', '天安門事件', null);
INSERT INTO `sensitive_word` VALUES ('6142', '天安門屠殺', null);
INSERT INTO `sensitive_word` VALUES ('6143', '天安門一代', null);
INSERT INTO `sensitive_word` VALUES ('6144', '庭院警衛兵', null);
INSERT INTO `sensitive_word` VALUES ('6145', '統獨', null);
INSERT INTO `sensitive_word` VALUES ('6146', '統獨論壇', null);
INSERT INTO `sensitive_word` VALUES ('6147', '統戰', null);
INSERT INTO `sensitive_word` VALUES ('6148', '頭領奧馬', null);
INSERT INTO `sensitive_word` VALUES ('6149', '頭領墳墓管理員', null);
INSERT INTO `sensitive_word` VALUES ('6150', '圖書管理員卡特', null);
INSERT INTO `sensitive_word` VALUES ('6151', '屠殺', null);
INSERT INTO `sensitive_word` VALUES ('6152', '團長戈登', null);
INSERT INTO `sensitive_word` VALUES ('6153', '團員馬爾汀', null);
INSERT INTO `sensitive_word` VALUES ('6154', '外交論壇', null);
INSERT INTO `sensitive_word` VALUES ('6155', '外交與方略', null);
INSERT INTO `sensitive_word` VALUES ('6156', '晚年周恩來', null);
INSERT INTO `sensitive_word` VALUES ('6157', '綰萬里', null);
INSERT INTO `sensitive_word` VALUES ('6158', '萬潤南', null);
INSERT INTO `sensitive_word` VALUES ('6159', '萬維讀者論壇', null);
INSERT INTO `sensitive_word` VALUES ('6160', '網禪', null);
INSERT INTO `sensitive_word` VALUES ('6161', '網特', null);
INSERT INTO `sensitive_word` VALUES ('6162', '猥褻', null);
INSERT INTO `sensitive_word` VALUES ('6163', '鮪溫B', null);
INSERT INTO `sensitive_word` VALUES ('6164', '溫逼', null);
INSERT INTO `sensitive_word` VALUES ('6165', '溫比', null);
INSERT INTO `sensitive_word` VALUES ('6166', '溫元凱', null);
INSERT INTO `sensitive_word` VALUES ('6167', '西藏獨', null);
INSERT INTO `sensitive_word` VALUES ('6168', '吸收的圖騰', null);
INSERT INTO `sensitive_word` VALUES ('6169', '吸血獸', null);
INSERT INTO `sensitive_word` VALUES ('6170', '洗腦', null);
INSERT INTO `sensitive_word` VALUES ('6171', '系統', null);
INSERT INTO `sensitive_word` VALUES ('6172', '系統公告', null);
INSERT INTO `sensitive_word` VALUES ('6173', '下賤', null);
INSERT INTO `sensitive_word` VALUES ('6174', '下體', null);
INSERT INTO `sensitive_word` VALUES ('6175', '鮮族', null);
INSERT INTO `sensitive_word` VALUES ('6176', '現金', null);
INSERT INTO `sensitive_word` VALUES ('6177', '現金交易', null);
INSERT INTO `sensitive_word` VALUES ('6178', '獻祭的圖騰', null);
INSERT INTO `sensitive_word` VALUES ('6179', '項懷誠', null);
INSERT INTO `sensitive_word` VALUES ('6180', '項小吉', null);
INSERT INTO `sensitive_word` VALUES ('6181', '小B樣', null);
INSERT INTO `sensitive_word` VALUES ('6182', '小比樣', null);
INSERT INTO `sensitive_word` VALUES ('6183', '小參考', null);
INSERT INTO `sensitive_word` VALUES ('6184', '小鶏鶏', null);
INSERT INTO `sensitive_word` VALUES ('6185', '小靈通', null);
INSERT INTO `sensitive_word` VALUES ('6186', '小泉純一郎', null);
INSERT INTO `sensitive_word` VALUES ('6187', '新觀察論壇', null);
INSERT INTO `sensitive_word` VALUES ('6188', '新華舉報', null);
INSERT INTO `sensitive_word` VALUES ('6189', '新華內情', null);
INSERT INTO `sensitive_word` VALUES ('6190', '新華通論壇', null);
INSERT INTO `sensitive_word` VALUES ('6191', '新疆獨', null);
INSERT INTO `sensitive_word` VALUES ('6192', '新生網', null);
INSERT INTO `sensitive_word` VALUES ('6193', '新手訓練營', null);
INSERT INTO `sensitive_word` VALUES ('6194', '新聞出版總署', null);
INSERT INTO `sensitive_word` VALUES ('6195', '新聞封鎖', null);
INSERT INTO `sensitive_word` VALUES ('6196', '新義安', null);
INSERT INTO `sensitive_word` VALUES ('6197', '新語絲', null);
INSERT INTO `sensitive_word` VALUES ('6198', '信用危機', null);
INSERT INTO `sensitive_word` VALUES ('6199', '邢錚', null);
INSERT INTO `sensitive_word` VALUES ('6200', '性愛', null);
INSERT INTO `sensitive_word` VALUES ('6201', '性無能', null);
INSERT INTO `sensitive_word` VALUES ('6202', '修煉', null);
INSERT INTO `sensitive_word` VALUES ('6203', '虛弱圖騰', null);
INSERT INTO `sensitive_word` VALUES ('6204', '虛無的飽食者', null);
INSERT INTO `sensitive_word` VALUES ('6205', '徐國舅', null);
INSERT INTO `sensitive_word` VALUES ('6206', '學潮', null);
INSERT INTO `sensitive_word` VALUES ('6207', '學聯', null);
INSERT INTO `sensitive_word` VALUES ('6208', '學運', null);
INSERT INTO `sensitive_word` VALUES ('6209', '學自聯', null);
INSERT INTO `sensitive_word` VALUES ('6210', '閹狗', null);
INSERT INTO `sensitive_word` VALUES ('6211', '顔射', null);
INSERT INTO `sensitive_word` VALUES ('6212', '央視內部晚會', null);
INSERT INTO `sensitive_word` VALUES ('6213', '陽具', null);
INSERT INTO `sensitive_word` VALUES ('6214', '陽痿', null);
INSERT INTO `sensitive_word` VALUES ('6215', '陽物', null);
INSERT INTO `sensitive_word` VALUES ('6216', '楊懷安', null);
INSERT INTO `sensitive_word` VALUES ('6217', '搖頭丸', null);
INSERT INTO `sensitive_word` VALUES ('6218', '藥水', null);
INSERT INTO `sensitive_word` VALUES ('6219', '耶穌', null);
INSERT INTO `sensitive_word` VALUES ('6220', '野鶏', null);
INSERT INTO `sensitive_word` VALUES ('6221', '遺精', null);
INSERT INTO `sensitive_word` VALUES ('6222', '异見人士', null);
INSERT INTO `sensitive_word` VALUES ('6223', '异型叛軍', null);
INSERT INTO `sensitive_word` VALUES ('6224', '异議人士', null);
INSERT INTO `sensitive_word` VALUES ('6225', '易丹軒', null);
INSERT INTO `sensitive_word` VALUES ('6226', '陰部', null);
INSERT INTO `sensitive_word` VALUES ('6227', '陰蒂', null);
INSERT INTO `sensitive_word` VALUES ('6228', '陰莖', null);
INSERT INTO `sensitive_word` VALUES ('6229', '陰精', null);
INSERT INTO `sensitive_word` VALUES ('6230', '陰毛', null);
INSERT INTO `sensitive_word` VALUES ('6231', '陰門', null);
INSERT INTO `sensitive_word` VALUES ('6232', '陰囊', null);
INSERT INTO `sensitive_word` VALUES ('6233', '陰水', null);
INSERT INTO `sensitive_word` VALUES ('6234', '淫蕩', null);
INSERT INTO `sensitive_word` VALUES ('6235', '淫穢', null);
INSERT INTO `sensitive_word` VALUES ('6236', '淫貨', null);
INSERT INTO `sensitive_word` VALUES ('6237', '淫賤', null);
INSERT INTO `sensitive_word` VALUES ('6238', '尹慶民', null);
INSERT INTO `sensitive_word` VALUES ('6239', '引導', null);
INSERT INTO `sensitive_word` VALUES ('6240', '幼齒', null);
INSERT INTO `sensitive_word` VALUES ('6241', '幼龍', null);
INSERT INTO `sensitive_word` VALUES ('6242', '于幼軍', null);
INSERT INTO `sensitive_word` VALUES ('6243', '余英時', null);
INSERT INTO `sensitive_word` VALUES ('6244', '輿論', null);
INSERT INTO `sensitive_word` VALUES ('6245', '輿論反制', null);
INSERT INTO `sensitive_word` VALUES ('6246', '宇明網', null);
INSERT INTO `sensitive_word` VALUES ('6247', '元老蘭提(沃德）', null);
INSERT INTO `sensitive_word` VALUES ('6248', '圓滿', null);
INSERT INTO `sensitive_word` VALUES ('6249', '緣圈圈', null);
INSERT INTO `sensitive_word` VALUES ('6250', '遠志明', null);
INSERT INTO `sensitive_word` VALUES ('6251', '月經', null);
INSERT INTO `sensitive_word` VALUES ('6252', '造愛', null);
INSERT INTO `sensitive_word` VALUES ('6253', '則民', null);
INSERT INTO `sensitive_word` VALUES ('6254', '擇民', null);
INSERT INTO `sensitive_word` VALUES ('6255', '澤夫', null);
INSERT INTO `sensitive_word` VALUES ('6256', '澤民', null);
INSERT INTO `sensitive_word` VALUES ('6257', '賊民', null);
INSERT INTO `sensitive_word` VALUES ('6258', '扎卡維是英雄', null);
INSERT INTO `sensitive_word` VALUES ('6259', '帳號', null);
INSERT INTO `sensitive_word` VALUES ('6260', '賬號', null);
INSERT INTO `sensitive_word` VALUES ('6261', '招鶏', null);
INSERT INTO `sensitive_word` VALUES ('6262', '貞操', null);
INSERT INTO `sensitive_word` VALUES ('6263', '鎮壓', null);
INSERT INTO `sensitive_word` VALUES ('6264', '政權', null);
INSERT INTO `sensitive_word` VALUES ('6265', '政治反對派', null);
INSERT INTO `sensitive_word` VALUES ('6266', '指點江山論壇', null);
INSERT INTO `sensitive_word` VALUES ('6267', '中俄邊界', null);
INSERT INTO `sensitive_word` VALUES ('6268', '中國復興論壇', null);
INSERT INTO `sensitive_word` VALUES ('6269', '中國共産黨', null);
INSERT INTO `sensitive_word` VALUES ('6270', '中國孤兒院', null);
INSERT INTO `sensitive_word` VALUES ('6271', '中國和平', null);
INSERT INTO `sensitive_word` VALUES ('6272', '中國論壇', null);
INSERT INTO `sensitive_word` VALUES ('6273', '中國社會進步黨', null);
INSERT INTO `sensitive_word` VALUES ('6274', '中國社會論壇', null);
INSERT INTO `sensitive_word` VALUES ('6275', '中國威脅論', null);
INSERT INTO `sensitive_word` VALUES ('6276', '中國問題論壇', null);
INSERT INTO `sensitive_word` VALUES ('6277', '中國移動通信', null);
INSERT INTO `sensitive_word` VALUES ('6278', '中國真實內容', null);
INSERT INTO `sensitive_word` VALUES ('6279', '中國之春', null);
INSERT INTO `sensitive_word` VALUES ('6280', '中國猪', null);
INSERT INTO `sensitive_word` VALUES ('6281', '中華大地', null);
INSERT INTO `sensitive_word` VALUES ('6282', '中華大衆', null);
INSERT INTO `sensitive_word` VALUES ('6283', '中華講清', null);
INSERT INTO `sensitive_word` VALUES ('6284', '中華民國', null);
INSERT INTO `sensitive_word` VALUES ('6285', '中華人民實話實說', null);
INSERT INTO `sensitive_word` VALUES ('6286', '中華人民正邪', null);
INSERT INTO `sensitive_word` VALUES ('6287', '中華時事', null);
INSERT INTO `sensitive_word` VALUES ('6288', '中華養生益智功', null);
INSERT INTO `sensitive_word` VALUES ('6289', '中華真實報道', null);
INSERT INTO `sensitive_word` VALUES ('6290', '中央電視臺', null);
INSERT INTO `sensitive_word` VALUES ('6291', '鐘山風雨論壇', null);
INSERT INTO `sensitive_word` VALUES ('6292', '朱溶劑', null);
INSERT INTO `sensitive_word` VALUES ('6293', '猪聾畸', null);
INSERT INTO `sensitive_word` VALUES ('6294', '主攻指揮官', null);
INSERT INTO `sensitive_word` VALUES ('6295', '主義', null);
INSERT INTO `sensitive_word` VALUES ('6296', '專制', null);
INSERT INTO `sensitive_word` VALUES ('6297', '轉化', null);
INSERT INTO `sensitive_word` VALUES ('6298', '資本主義', null);
INSERT INTO `sensitive_word` VALUES ('6299', '子宮', null);
INSERT INTO `sensitive_word` VALUES ('6300', '自民黨', null);
INSERT INTO `sensitive_word` VALUES ('6301', '自由民主論壇', null);
INSERT INTO `sensitive_word` VALUES ('6302', '總理', null);
INSERT INTO `sensitive_word` VALUES ('6304', '作愛', null);
INSERT INTO `sensitive_word` VALUES ('6305', '做愛', null);

-- ----------------------------
-- Table structure for system_interface
-- ----------------------------
DROP TABLE IF EXISTS `system_interface`;
CREATE TABLE `system_interface` (
  `INTERFACE_ID` int(9) NOT NULL,
  `INTERFACE_CODE` varchar(20) DEFAULT NULL,
  `INTERFACE_NAME` varchar(50) DEFAULT NULL,
  `INTERFACE_TYPE` varchar(3) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`INTERFACE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_interface
-- ----------------------------
INSERT INTO `system_interface` VALUES ('1', 'pay', '支付接口', '1', '/market/pay/send.jsp', '00A');

-- ----------------------------
-- Table structure for sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `sys_sequence`;
CREATE TABLE `sys_sequence` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL,
  `current_value` int(11) NOT NULL,
  `increment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_seq_table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_sequence
-- ----------------------------
INSERT INTO `sys_sequence` VALUES ('2', 'test', '182950', '1');
INSERT INTO `sys_sequence` VALUES ('3', 'DM_MERCHANT_ACTIVITY', '3', '1');
INSERT INTO `sys_sequence` VALUES ('4', 'DM_EXECUTE_LIST', '5', '1');
INSERT INTO `sys_sequence` VALUES ('5', 'DM_GOODS_INST', '1', '1');
INSERT INTO `sys_sequence` VALUES ('6', 'DM_TRADE_LOG', '1', '1');

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `currval`(`tab_name` varchar(50)) RETURNS int(11)
BEGIN
	DECLARE VALUE INTEGER;
	SET VALUE=0;
	SELECT current_value INTO VALUE
		FROM sys_sequence 
		WHERE table_name=UPPER(tab_name);
	RETURN VALUE;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for func_cata_name
-- ----------------------------
DROP FUNCTION IF EXISTS `func_cata_name`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `func_cata_name`(in_catalog_id int) RETURNS varchar(1000) CHARSET utf8
begin 
           declare sTemp varchar(1000) default ''; 
           declare sTempChd varchar(1000); 
           declare temp_up_catalog_id int;
           declare temp_name varchar(50); 

           select catalog_name, up_catalog_id into sTemp, temp_up_catalog_id from dm_goods_catalog where catalog_id = in_catalog_id;
    
           while ((select count(*) from dm_goods_catalog where catalog_id = temp_up_catalog_id) > 0) do 
             select catalog_name, up_catalog_id into temp_name, temp_up_catalog_id from dm_goods_catalog where catalog_id = temp_up_catalog_id;
             set sTemp = concat(temp_name,'>',sTemp); 
          end while;
          
          return sTemp;
        end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `nextval`(`tab_name` varchar(50)) RETURNS int(11)
BEGIN
	DECLARE cnt INTEGER;
	SET cnt=0;
	SELECT count(*) INTO cnt FROM sys_sequence WHERE table_name=tab_name;
	/*IF cnt = 0 THEN
		INSERT INTO sys_sequence(table_name,current_value,increment)
		VALUES(upper(tab_name),0,1);
		
	ELSE*/
		UPDATE sys_sequence
			SET current_value = current_value + increment
		WHERE table_name=tab_name;
	/*END IF;*/
	RETURN currval(tab_name);
END
;;
DELIMITER ;
