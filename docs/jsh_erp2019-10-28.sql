/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : jsh_erp

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2019-10-29 21:18:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jsh_account
-- ----------------------------
DROP TABLE IF EXISTS `jsh_account`;
CREATE TABLE `jsh_account` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `SerialNo` varchar(50) DEFAULT NULL COMMENT '编号',
  `InitialAmount` decimal(24,6) DEFAULT NULL COMMENT '期初金额',
  `CurrentAmount` decimal(24,6) DEFAULT NULL COMMENT '当前余额',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `IsDefault` bit(1) DEFAULT NULL COMMENT '是否默认',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='账户信息';

-- ----------------------------
-- Records of jsh_account
-- ----------------------------
INSERT INTO `jsh_account` VALUES ('4', '南通建行', '652346523465234623', '1200.000000', '215.000000', '建行账户', '\0', null, '0');
INSERT INTO `jsh_account` VALUES ('9', '流动总账', '65234624523452364', '2000.000000', '393.000000', '现在账户', '', null, '0');
INSERT INTO `jsh_account` VALUES ('10', '支付宝', '123456789@qq.com', '10000.000000', null, '', '\0', null, '0');
INSERT INTO `jsh_account` VALUES ('11', '微信', '13000000000', '10000.000000', null, '', '\0', null, '0');
INSERT INTO `jsh_account` VALUES ('12', '上海农行', '65324345234523211', '10000.000000', '0.000000', '', '\0', null, '0');
INSERT INTO `jsh_account` VALUES ('13', '账户1', 'abcd123', '0.000000', null, '', '', '1', '0');
INSERT INTO `jsh_account` VALUES ('14', '账户1', 'zhanghu1', '0.000000', null, '', '', '117', '0');
INSERT INTO `jsh_account` VALUES ('15', '账户2222', 'zh2222', '0.000000', null, '', '\0', '117', '0');
INSERT INTO `jsh_account` VALUES ('16', '账户1', '1231241244', '0.000000', null, '', '', '115', '0');
INSERT INTO `jsh_account` VALUES ('17', '账户1', 'zzz111', '0.000000', null, '', '', '63', '0');
INSERT INTO `jsh_account` VALUES ('18', '账户2', '1234131324', '0.000000', null, '', '\0', '63', '0');

-- ----------------------------
-- Table structure for jsh_accounthead
-- ----------------------------
DROP TABLE IF EXISTS `jsh_accounthead`;
CREATE TABLE `jsh_accounthead` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` varchar(50) DEFAULT NULL COMMENT '类型(支出/收入/收款/付款/转账)',
  `OrganId` bigint(20) DEFAULT NULL COMMENT '单位Id(收款/付款单位)',
  `HandsPersonId` bigint(20) DEFAULT NULL COMMENT '经手人Id',
  `ChangeAmount` decimal(24,6) DEFAULT NULL COMMENT '变动金额(优惠/收款/付款/实付)',
  `TotalPrice` decimal(24,6) DEFAULT NULL COMMENT '合计金额',
  `AccountId` bigint(20) DEFAULT NULL COMMENT '账户(收款/付款)',
  `BillNo` varchar(50) DEFAULT NULL COMMENT '单据编号',
  `BillTime` datetime DEFAULT NULL COMMENT '单据日期',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`),
  KEY `FK9F4C0D8DB610FC06` (`OrganId`),
  KEY `FK9F4C0D8DAAE50527` (`AccountId`),
  KEY `FK9F4C0D8DC4170B37` (`HandsPersonId`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='财务主表';

-- ----------------------------
-- Records of jsh_accounthead
-- ----------------------------
INSERT INTO `jsh_accounthead` VALUES ('57', '收预付款', '8', '3', null, '1000.000000', null, '2342134', '2017-06-27 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('61', '收预付款', '9', '3', null, '33.000000', null, 'SYF2017062901721', '2017-06-29 00:00:00', 'aaaaaa', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('67', '收预付款', '10', '4', null, '2100.000000', null, 'SYF2017070222414', '2017-07-02 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('70', '支出', '4', '3', '-60.000000', '-60.000000', '4', 'ZC20170703233735', '2017-07-03 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('74', '转账', null, '3', '-100.000000', '-100.000000', '4', 'ZZ2017070323489', '2017-07-03 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('77', '收入', '2', '3', '40.000000', '40.000000', '4', 'SR20170704222634', '2017-07-04 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('78', '收预付款', '9', '3', null, '200.000000', null, 'SYF201707050257', '2017-07-05 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('79', '收预付款', '9', '3', null, '100.000000', null, 'SYF20170705076', '2017-07-05 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('82', '收款', '2', '3', '0.000000', '2.600000', null, 'SK20171008191440', '2017-10-09 00:08:11', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('83', '付款', '1', '4', '0.000000', '-20.000000', null, 'FK20171008232825', '2017-10-08 00:00:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('84', '收入', '2', '4', '0.000000', '21.000000', '10', 'SR20171009000300', '2017-10-09 00:03:00', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('85', '收入', '2', '3', '22.000000', '22.000000', '11', 'SR20171009000637', '2017-10-09 00:06:37', '备注123 备注123 备注123', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('86', '转账', null, '4', '-22.000000', '-22.000000', '10', 'ZZ20171009000719', '2017-10-09 00:07:19', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('87', '付款', '4', '4', '10.000000', '-33.000000', null, 'FK20171009000747', '2017-10-09 00:07:47', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('88', '收款', '2', '4', '0.000000', '2.800000', null, 'SK20171024220754', '2017-10-24 22:07:54', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('89', '收款', '2', '4', '0.000000', '11.000000', null, 'SK20171030232535', '2017-10-30 23:25:35', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('90', '收款', '2', '4', '0.000000', '10.000000', null, 'SK20171119231440', '2017-11-19 23:14:40', '', null, '0');
INSERT INTO `jsh_accounthead` VALUES ('91', '收入', '48', '9', '66.000000', '6.000000', '13', 'SR20190319221438', '2019-03-19 22:14:38', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('92', '支出', '50', '9', '-33.000000', '-33.000000', '13', 'ZC20190319221454', '2019-03-19 22:14:54', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('93', '收款', '48', '9', null, '44.000000', null, 'SK20190319221513', '2019-03-19 22:15:13', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('94', '付款', '50', '9', null, '-66.000000', null, 'FK20190319221525', '2019-03-19 22:15:25', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('95', '收预付款', '49', '9', null, '6.000000', null, 'SYF20190319221556', '2019-03-19 22:15:56', '', '1', '0');
INSERT INTO `jsh_accounthead` VALUES ('96', '收入', '5', '4', '22.000000', '22.000000', '12', 'SR20190321235925', '2019-03-21 23:59:25', '', null, '0');

-- ----------------------------
-- Table structure for jsh_accountitem
-- ----------------------------
DROP TABLE IF EXISTS `jsh_accountitem`;
CREATE TABLE `jsh_accountitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `HeaderId` bigint(20) NOT NULL COMMENT '表头Id',
  `AccountId` bigint(20) DEFAULT NULL COMMENT '账户Id',
  `InOutItemId` bigint(20) DEFAULT NULL COMMENT '收支项目Id',
  `EachAmount` decimal(24,6) DEFAULT NULL COMMENT '单项金额',
  `Remark` varchar(100) DEFAULT NULL COMMENT '单据备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`),
  KEY `FK9F4CBAC0AAE50527` (`AccountId`),
  KEY `FK9F4CBAC0C5FE6007` (`HeaderId`),
  KEY `FK9F4CBAC0D203EDC5` (`InOutItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='财务子表';

-- ----------------------------
-- Records of jsh_accountitem
-- ----------------------------
INSERT INTO `jsh_accountitem` VALUES ('58', '57', '9', null, '1000.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('62', '61', '4', null, '33.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('68', '67', '4', null, '2100.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('71', '70', null, '11', '60.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('75', '74', '9', null, '100.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('78', '77', null, '14', '40.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('79', '78', '9', null, '200.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('80', '79', '9', null, '100.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('83', '82', '10', null, '2.600000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('84', '83', '10', null, '-20.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('85', '84', null, '13', '21.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('86', '85', null, '12', '22.000000', '44', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('87', '86', '11', null, '22.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('88', '87', '10', null, '-33.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('89', '88', '10', null, '2.800000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('90', '89', '11', null, '11.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('91', '90', '12', null, '10.000000', '', null, '0');
INSERT INTO `jsh_accountitem` VALUES ('92', '91', null, '16', '66.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('93', '92', null, '17', '33.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('94', '93', '13', null, '44.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('95', '94', '13', null, '-66.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('96', '95', '13', null, '6.000000', '', '1', '0');
INSERT INTO `jsh_accountitem` VALUES ('97', '96', null, '14', '22.000000', '', null, '0');

-- ----------------------------
-- Table structure for jsh_depot
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depot`;
CREATE TABLE `jsh_depot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) DEFAULT NULL COMMENT '仓库名称',
  `address` varchar(50) DEFAULT NULL COMMENT '仓库地址',
  `warehousing` decimal(24,6) DEFAULT NULL COMMENT '仓储费',
  `truckage` decimal(24,6) DEFAULT NULL COMMENT '搬运费',
  `type` int(10) DEFAULT NULL COMMENT '类型',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  `remark` varchar(100) DEFAULT NULL COMMENT '描述',
  `principal` bigint(20) DEFAULT NULL COMMENT '负责人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `is_default` bit(1) DEFAULT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='仓库表';

-- ----------------------------
-- Records of jsh_depot
-- ----------------------------
INSERT INTO `jsh_depot` VALUES ('1', '叠石桥店', '地址222', '33.000000', '22.000000', '0', '2', '上海33', '95', null, '0', '\0');
INSERT INTO `jsh_depot` VALUES ('2', '公司总部', '地址12355', '44.000000', '22.220000', '0', '1', '总部', '64', null, '0', '');
INSERT INTO `jsh_depot` VALUES ('3', '金沙店', '地址666', '31.000000', '4.000000', '0', '3', '苏州', '64', null, '0', '\0');
INSERT INTO `jsh_depot` VALUES ('4', '1268200294', '', null, null, '1', '1', '', null, null, '0', null);
INSERT INTO `jsh_depot` VALUES ('5', '1268787965', null, null, null, '1', '3', '', null, null, '0', null);
INSERT INTO `jsh_depot` VALUES ('6', '1269520625', null, null, null, '1', '2', '', null, null, '0', null);
INSERT INTO `jsh_depot` VALUES ('7', '仓库1', '', null, null, '0', '', '', null, '1', '1', null);
INSERT INTO `jsh_depot` VALUES ('8', '仓库1111', '', null, null, '0', '', '', '117', '117', '1', null);
INSERT INTO `jsh_depot` VALUES ('9', '仓库567', '', null, null, '0', '', '', '117', '117', '1', null);
INSERT INTO `jsh_depot` VALUES ('10', '仓库321342', '', null, null, '0', '', '', null, '117', '1', null);
INSERT INTO `jsh_depot` VALUES ('11', '仓库321321', '', null, null, '0', '', '', null, '117', '1', null);
INSERT INTO `jsh_depot` VALUES ('12', '仓库111222', '', null, null, '0', '', '', null, '117', '1', null);
INSERT INTO `jsh_depot` VALUES ('13', '仓库1', '', null, null, '0', '', '', null, '115', '1', null);
INSERT INTO `jsh_depot` VALUES ('14', '仓库1', '', null, null, '0', '', '', null, '63', '1', '');
INSERT INTO `jsh_depot` VALUES ('15', '仓库2', '', null, null, '0', '', '', null, '63', '1', '\0');
INSERT INTO `jsh_depot` VALUES ('16', '总库', '', null, null, '0', '', '', null, '63', '0', '');
INSERT INTO `jsh_depot` VALUES ('17', '分库', '', null, null, '0', '', '', null, '63', '0', '\0');
INSERT INTO `jsh_depot` VALUES ('18', '分库', '', null, null, '0', '', '', null, '63', '1', null);

-- ----------------------------
-- Table structure for jsh_depothead
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depothead`;
CREATE TABLE `jsh_depothead` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` varchar(50) DEFAULT NULL COMMENT '类型(出库/入库)',
  `SubType` varchar(50) DEFAULT NULL COMMENT '出入库分类',
  `ProjectId` bigint(20) DEFAULT NULL COMMENT '项目Id',
  `DefaultNumber` varchar(50) DEFAULT NULL COMMENT '初始票据号',
  `Number` varchar(50) DEFAULT NULL COMMENT '票据号',
  `OperPersonName` varchar(50) DEFAULT NULL COMMENT '操作员名字',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `OperTime` datetime DEFAULT NULL COMMENT '出入库时间',
  `OrganId` bigint(20) DEFAULT NULL COMMENT '供应商Id',
  `HandsPersonId` bigint(20) DEFAULT NULL COMMENT '采购/领料-经手人Id',
  `AccountId` bigint(20) DEFAULT NULL COMMENT '账户Id',
  `ChangeAmount` decimal(24,6) DEFAULT NULL COMMENT '变动金额(收款/付款)',
  `AllocationProjectId` bigint(20) DEFAULT NULL COMMENT '调拨时，对方项目Id',
  `TotalPrice` decimal(24,6) DEFAULT NULL COMMENT '合计金额',
  `PayType` varchar(50) DEFAULT NULL COMMENT '付款类型(现金、记账等)',
  `Remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `Salesman` varchar(50) DEFAULT NULL COMMENT '业务员（可以多个）',
  `AccountIdList` varchar(50) DEFAULT NULL COMMENT '多账户ID列表',
  `AccountMoneyList` varchar(200) DEFAULT '' COMMENT '多账户金额列表',
  `Discount` decimal(24,6) DEFAULT NULL COMMENT '优惠率',
  `DiscountMoney` decimal(24,6) DEFAULT NULL COMMENT '优惠金额',
  `DiscountLastMoney` decimal(24,6) DEFAULT NULL COMMENT '优惠后金额',
  `OtherMoney` decimal(24,6) DEFAULT NULL COMMENT '销售或采购费用合计',
  `OtherMoneyList` varchar(200) DEFAULT NULL COMMENT '销售或采购费用涉及项目Id数组（包括快递、招待等）',
  `OtherMoneyItem` varchar(200) DEFAULT NULL COMMENT '销售或采购费用涉及项目（包括快递、招待等）',
  `AccountDay` int(10) DEFAULT NULL COMMENT '结算天数',
  `Status` varchar(1) DEFAULT '0' COMMENT '状态，0未审核、1已审核、2已转采购|销售',
  `LinkNumber` varchar(50) DEFAULT NULL COMMENT '关联订单号',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`),
  KEY `FK2A80F214CA633ABA` (`AllocationProjectId`),
  KEY `FK2A80F214C4170B37` (`HandsPersonId`),
  KEY `FK2A80F214B610FC06` (`OrganId`),
  KEY `FK2A80F2142888F9A` (`ProjectId`),
  KEY `FK2A80F214AAE50527` (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8 COMMENT='单据主表';

-- ----------------------------
-- Records of jsh_depothead
-- ----------------------------
INSERT INTO `jsh_depothead` VALUES ('7', '入库', '采购', null, 'GHDD201708120002', 'GHDD201708120002', '邹良玉', '2017-08-12 12:04:07', '2017-08-12 12:03:23', '1', null, '12', '-30.000000', null, '-36.000000', '现付', 'abcdefg', '', null, null, '10.000000', '3.600000', '32.400000', '30.000000', '[\"10\",\"9\"]', '[\"10\",\"20\"]', '45', '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('8', '出库', '销售', null, 'XHDD201708120001', 'XHDD201708120001', '邹良玉', '2017-08-12 18:10:14', '2017-08-12 18:09:45', '2', null, '11', '17.000000', null, '24.000000', '现付', '', '<7>,<6>', null, null, '22.000000', '5.280000', '18.720000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('9', '入库', '采购', null, 'GHDD201708120003', 'GHDD201708120003', '邹良玉', '2017-08-12 21:01:09', '2017-08-12 21:00:36', '1', null, '11', '-100.000000', null, '-120.000000', '现付', '', '', null, null, '10.000000', '12.000000', '108.000000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('10', '入库', '采购', null, 'GHDD201708120004', 'GHDD201708120004', '邹良玉', '2017-08-12 21:10:42', '2017-08-12 21:10:16', '1', null, '4', '-10.000000', null, '-12.000000', '现付', '', '', null, null, '10.000000', '1.200000', '10.800000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('11', '入库', '采购', null, 'GHDD201708120005', 'jshenghua001', '邹良玉', '2017-08-12 22:07:44', '2017-08-12 22:06:37', '1', null, '12', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('12', '入库', '采购', null, 'GHDD201708120006', 'GHDD201708120006', '邹良玉', '2017-08-12 22:17:11', '2017-08-12 22:16:35', '1', null, '11', '-10.000000', null, '-12.000000', '现付', '', '', null, null, '10.000000', '1.200000', '10.800000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('13', '入库', '采购', null, 'GHDD201708120007', 'jishenghua3', '邹良玉', '2017-08-12 22:17:52', '2017-08-12 22:17:14', '1', null, '4', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('14', '入库', '采购', null, 'GHDD201708120008', 'jishenghua004', '邹良玉', '2017-08-12 22:19:37', '2017-08-12 22:19:07', '1', null, '11', '-30.000000', null, '-36.000000', '现付', '', '', null, null, '10.000000', '3.600000', '32.400000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('16', '入库', '采购', null, 'GHDD201708120009', 'jishenghua005', '邹良玉', '2017-08-12 22:26:23', '2017-08-12 22:25:14', '1', null, '10', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('17', '入库', '采购', null, 'GHDD201708120010', 'GHDD201708120010', '邹良玉', '2017-08-12 22:28:20', '2017-08-12 22:28:02', '1', null, '9', '-30.000000', null, '-36.000000', '现付', '', '', null, null, '10.000000', '3.600000', '32.400000', null, '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('18', '入库', '采购', null, 'GHDD201708120011', 'GHDD201708120011', '邹良玉', '2017-08-12 22:30:08', '2017-08-12 22:29:48', '1', null, '4', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('19', '入库', '采购', null, 'GHDD201708120012', 'GHDD201708120012', '邹良玉', '2017-08-12 22:30:57', '2017-08-12 22:29:32', '1', null, null, '-10.000000', null, '-26.400000', '现付', '', '', '[\"4\"]', '[\"-10\"]', '10.000000', '2.640000', '23.760000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('20', '入库', '采购', null, 'GHDD201708120013', 'GHDD201708120013', '邹良玉', '2017-08-12 22:46:43', '2017-08-12 22:45:55', '1', null, '10', '-23.000000', null, '-36.000000', '现付', '', '', null, null, '20.000000', '7.200000', '28.800000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('21', '入库', '采购', null, 'GHDD201708120014', 'GHDD201708120014', '邹良玉', '2017-08-12 22:46:52', '2017-08-12 22:45:59', '1', null, '11', '-20.000000', null, '-26.400000', '现付', '', '', null, null, '10.000000', '2.640000', '23.760000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('22', '入库', '采购', null, 'GHDD201708120015', 'GHDD201708120015', '邹良玉', '2017-08-12 23:49:32', '2017-08-12 23:48:24', '1', null, '11', '-20.000000', null, '-24.000000', '现付', '', '', null, null, '10.000000', '2.400000', '21.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('23', '入库', '采购', null, 'GHDD201708140001', 'GHDD201708140001', '邹良玉', '2017-08-14 20:41:54', '2017-08-14 20:40:49', '1', null, '4', '-300.000000', null, '-360.000000', '现付', '', '', null, null, '10.000000', '36.000000', '324.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('24', '入库', '采购', null, 'GHDD201708150001', 'GHDD201708150001', '邹良玉', '2017-08-15 21:36:25', '2017-08-15 21:35:38', '1', null, '11', '-675.000000', null, '-750.000000', '现付', '', '', null, null, '10.000000', '75.000000', '675.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('25', '入库', '采购', null, 'GHDD201708150002', 'GHDD201708150002', '邹良玉', '2017-08-15 22:31:46', '2017-08-15 22:29:47', '1', null, null, '-33.000000', null, '-75.000000', '现付', 'ababab', '', '[\"9\",\"10\"]', '[\"-22\",\"-11\"]', '10.000000', '7.500000', '67.500000', '22.000000', '[\"10\",\"8\"]', '[\"11\",\"11\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('26', '入库', '采购', null, 'GHDD201708160001', 'GHDD201708160001', '邹良玉', '2017-08-16 23:50:35', '2017-08-16 23:47:42', '4', null, '9', '-162.000000', null, '-150.000000', '现付', '', '', null, null, '10.000000', '18.000000', '162.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('27', '入库', '采购', null, 'GHDD201708180001', 'GHDD201708180001', '邹良玉', '2017-08-18 00:25:58', '2017-08-18 00:25:43', '1', null, '11', '-74.250000', null, '-75.000000', '现付', '', '', null, null, '10.000000', '8.250000', '74.250000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('28', '入库', '采购', null, 'GHDD201708270001', 'GHDD201708270001', '邹良玉', '2017-08-27 23:10:44', '2017-08-27 23:06:05', '46', null, '10', '-64.800000', null, '-72.000000', '现付', '', '', null, null, '10.000000', '7.200000', '64.800000', '10.000000', '[\"10\"]', '[\"10\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('29', '出库', '销售', null, 'XSCK201708280001', 'XSCK201708280001', '邹良玉', '2017-08-28 23:06:40', '2017-08-28 23:05:11', '2', null, '11', '120.850000', null, '130.000000', '现付', '', '<7>', null, null, '10.000000', '13.650000', '122.850000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('30', '入库', '销售退货', null, 'XSTH201708280001', 'XSTH201708280001', '邹良玉', '2017-08-28 23:13:08', '2017-08-28 23:12:48', '2', null, '10', '-48.000000', null, '-48.000000', '现付', '', '<5>,<6>', null, null, '0.000000', '0.000000', '48.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('31', '出库', '采购退货', null, 'CGTH201708280001', 'CGTH201708280001', '邹良玉', '2017-08-28 23:15:45', '2017-08-28 23:15:21', '1', null, '10', '28.600000', null, '26.000000', '现付', '', '', null, null, '0.000000', '0.000000', '28.600000', '12.000000', '[\"10\"]', '[\"12\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('32', '入库', '其它', null, 'QTRK201708280001', 'QTRK201708280001', '邹良玉', '2017-08-28 23:17:55', '2017-08-28 23:17:33', '1', null, null, null, null, '12.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('33', '出库', '其它', null, 'QTCK201708280001', 'QTCK201708280001', '邹良玉', '2017-08-28 23:21:14', '2017-08-28 23:20:36', '2', null, null, null, null, '65.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('37', '出库', '调拨', null, 'DBCK201708280002', 'DBCK201708280002', '邹良玉', '2017-08-28 23:56:34', '2017-08-28 23:56:10', null, null, null, null, null, '1.300000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('38', '出库', '调拨', null, 'DBCK201708290001', 'DBCK201708290001', '邹良玉', '2017-08-29 00:20:11', '2017-08-29 00:19:58', null, null, null, null, null, '2.600000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('41', '出库', '零售', null, 'LSCK201708290002', 'LSCK201708290002', '邹良玉', '2017-08-29 23:29:39', '2017-08-29 23:29:06', '7', null, '10', '42.000000', null, '42.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('42', '出库', '零售', null, 'LSCK201708290003', 'LSCK201708290003', '邹良玉', '2017-08-29 23:35:12', '2017-08-29 23:33:21', '7', null, '11', '11.000000', null, '11.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('43', '出库', '零售', null, 'LSCK201708290004', 'LSCK201708290004', '邹良玉', '2017-08-29 23:39:44', '2017-08-29 23:39:28', '7', null, '9', '12.100000', null, '12.100000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('44', '入库', '零售退货', null, 'LSTH201708290001', 'LSTH201708290001', '邹良玉', '2017-08-29 23:48:43', '2017-08-29 23:46:35', '7', null, '10', '-2.200000', null, '-2.200000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('45', '入库', '零售退货', null, 'LSTH201708290002', 'LSTH201708290002', '邹良玉', '2017-08-29 23:51:55', '2017-08-29 23:51:31', '7', null, '12', '-3.300000', null, '-3.300000', '现付', '', '', null, null, null, null, null, null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('48', '出库', '零售', null, 'LSCK201708310001', 'LSCK201708310001', '邹良玉', '2017-08-31 00:30:31', '2017-08-31 00:29:10', '7', null, null, '12.000000', null, '12.000000', '现付', '', '', '[\"10\",\"11\"]', '[\"15\",\"20\"]', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('49', '出库', '零售', null, 'LSCK201708310002', 'LSCK201708310002', '邹良玉', '2017-08-31 00:57:40', '2017-08-31 00:57:08', '7', null, null, '12.000000', null, '12.000000', '现付', '', '', '[\"9\",\"11\"]', '[\"22\",\"11\"]', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('50', '出库', '零售', null, 'LSCK201709030001', 'LSCK201709030001', '邹良玉', '2017-09-03 12:51:50', '2017-09-03 12:51:21', '10', null, '10', '22.000000', null, '22.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('52', '出库', '零售', null, 'LSCK201709040001', 'LSCK201709040001', '邹良玉', '2017-09-04 21:32:49', '2017-09-04 21:31:24', '7', null, '11', '24.200000', null, '24.200000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('53', '出库', '零售', null, 'LSCK201709040002', 'LSCK201709040002', '邹良玉', '2017-09-04 21:34:02', '2017-09-04 21:33:30', '7', null, '9', '36.300000', null, '36.300000', '现付', '', '', null, null, null, null, null, null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('54', '入库', '采购', null, 'CGRK201709040001', 'CGRK201709040001', '邹良玉', '2017-09-04 22:20:12', '2017-09-04 22:13:00', '1', null, '10', '-10.800000', null, '-12.000000', '现付', '', '', null, null, '10.000000', '1.200000', '10.800000', '12.000000', '[\"9\"]', '[\"12\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('57', '入库', '采购', null, 'CGRK201709050001', 'CGRK201709050001', '邹良玉', '2017-09-05 22:37:54', '2017-09-05 22:37:31', '1', null, '11', '-182.520000', null, '-182.400000', '现付', '', '', null, null, '0.000000', '0.000000', '182.520000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('63', '入库', '采购', null, 'CGRK201709170001', 'CGRK201709170001', '邹良玉', '2017-09-17 21:45:14', '2017-09-17 21:44:50', '1', null, '10', '-13.200000', null, '-12.000000', '现付', '', '', null, null, '0.000000', '0.000000', '13.200000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('65', '入库', '采购', null, 'CGRK201709170002', 'CGRK201709170002', '邹良玉', '2017-09-17 21:47:07', '2017-09-17 20:45:55', '1', null, null, '-42.000000', null, '-39.000000', '现付', '', '', '[\"12\",\"9\"]', '[\"-20\",\"-22\"]', '0.000000', '0.000000', '42.900000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('68', '其它', '组装单', null, 'ZZD2017092000001', 'ZZD2017092000001', '邹良玉', '2017-09-20 23:29:28', '2017-09-20 23:29:13', null, null, null, null, null, '7.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('69', '其它', '拆卸单', null, 'CXD2017092000001', 'CXD2017092000001', '邹良玉', '2017-09-20 23:40:55', '2017-09-20 23:40:41', null, null, null, null, null, '0.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('70', '入库', '采购', null, 'CGRK201709210001', 'CGRK201709210001', '邹良玉', '2017-09-21 22:37:20', '2017-09-21 22:36:37', '1', null, null, '-50.000000', null, '-50.000000', '现付', '', '', '[\"4\",\"9\"]', '[\"-10\",\"-40\"]', '0.000000', '0.000000', '50.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('71', '入库', '销售退货', null, 'XSTH201709210001', 'XSTH201709210001', '邹良玉', '2017-09-21 22:39:00', '2017-09-21 22:38:37', '2', null, '11', '-48.000000', null, '-48.000000', '现付', '', '<6>,<7>', null, null, '0.000000', '0.000000', '48.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('72', '入库', '其它', null, 'QTRK201709210001', 'QTRK201709210001', '邹良玉', '2017-09-21 22:39:26', '2017-09-21 22:39:14', '4', null, null, null, null, '24.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('73', '出库', '销售', null, 'XSCK201709210001', 'XSCK201709210001', '邹良玉', '2017-09-21 22:40:01', '2017-09-21 22:39:44', '2', null, '11', '10.000000', null, '10.000000', '现付', '', '<6>', null, null, '0.000000', '0.000000', '10.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('74', '出库', '采购退货', null, 'CGTH201709210001', 'CGTH201709210001', '邹良玉', '2017-09-21 22:40:57', '2017-09-21 22:40:38', '4', null, '4', '5.000000', null, '5.000000', '现付', '', '', null, null, '0.000000', '0.000000', '5.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('75', '出库', '其它', null, 'QTCK201709210001', 'QTCK201709210001', '邹良玉', '2017-09-21 22:41:15', '2017-09-21 22:41:02', '2', null, null, null, null, '13.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('76', '出库', '调拨', null, 'DBCK201709210001', 'DBCK201709210001', '邹良玉', '2017-09-21 22:41:36', '2017-09-21 22:41:19', null, null, null, null, null, '10.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('77', '出库', '零售', null, 'LSCK201709210001', 'LSCK201709210001', '邹良玉', '2017-09-21 22:42:44', '2017-09-21 22:42:21', '7', null, '4', '2.200000', null, '2.200000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('78', '入库', '零售退货', null, 'LSTH201709210001', 'LSTH201709210001', '邹良玉', '2017-09-21 22:46:07', '2017-09-21 22:45:49', '7', null, '4', '-2.200000', null, '-2.200000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('79', '入库', '采购', null, 'CGRK201709210002', 'CGRK201709210002', '邹良玉', '2017-09-21 23:16:37', '2017-09-21 23:16:21', '1', null, '11', '-23.760000', null, '-21.600000', '现付', '', '', null, null, '0.000000', '0.000000', '23.760000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('80', '其它', '组装单', null, 'ZZD2017092100001', 'ZZD2017092100001', '邹良玉', '2017-09-21 23:17:16', '2017-09-21 23:16:59', null, null, null, null, null, '5.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('82', '入库', '采购', null, 'CGRK201709220001', 'CGRK201709220001', '邹良玉', '2017-09-22 23:06:01', '2017-09-22 23:05:39', '1', null, null, '-50.000000', null, '-52.000000', '现付', '', '', '[\"11\",\"9\"]', '[\"-20\",\"-30\"]', '10.000000', '5.720000', '51.480000', '5.000000', '[\"11\",\"10\"]', '[\"2\",\"3\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('84', '入库', '采购', null, 'CGRK201709220002', 'CGRK201709220002', '邹良玉', '2017-09-22 23:22:02', '2017-09-22 23:21:48', '1', null, '10', '-26.400000', null, '-24.000000', '现付', '', '', null, null, '0.000000', '0.000000', '26.400000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('85', '入库', '采购', null, 'CGRK201709240001', 'CGRK201709240001', '邹良玉', '2017-09-24 22:46:00', '2017-09-24 22:44:35', '4', null, null, '-85.000000', null, '-75.000000', '现付', '', '', '[\"10\",\"9\"]', '[\"-20\",\"-65\"]', '0.000000', '0.000000', '87.750000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('87', '出库', '销售', null, 'XSCK201709250001', 'XSCK201709250001', '邹良玉', '2017-09-25 22:24:08', '2017-09-25 22:23:47', '2', null, '10', '4.000000', null, '4.000000', '现付', '', '<6>', null, null, '0.000000', '0.000000', '4.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('88', '出库', '销售', null, 'XSCK201709250002', 'XSCK201709250002', '邹良玉', '2017-09-25 22:36:51', '2017-09-25 22:35:09', '2', null, '10', '39.600000', null, '40.000000', '现付', '', '<7>', null, null, '10.000000', '4.400000', '39.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('89', '入库', '零售退货', null, 'LSTH201709260001', 'LSTH201709260001', '邹良玉', '2017-09-26 00:26:52', '2017-09-26 00:26:19', '7', null, '9', '-18.000000', null, '-18.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('90', '出库', '零售', null, 'LSCK201709260001', 'LSCK201709260001', '邹良玉', '2017-09-26 22:31:24', '2017-09-26 22:29:50', '7', null, null, '100.000000', null, '100.000000', '现付', '', '', '[\"10\",\"11\"]', '[\"60\",\"40\"]', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('93', '出库', '销售', null, 'XSCK201710080001', 'XSCK201710080001', '邹良玉', '2017-10-08 19:12:23', '2017-10-08 19:11:44', '2', null, '10', '0.000000', null, '2.600000', '现付', '', '<7>', null, null, '0.000000', '0.000000', '2.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('94', '出库', '销售', null, 'XSCK201710080002', 'XSCK201710080002', '邹良玉', '2017-10-08 19:58:55', '2017-10-08 19:58:27', '5', null, '9', '0.000000', null, '8.000000', '现付', '', '<6>', null, null, '0.000000', '0.000000', '8.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('95', '入库', '采购', null, 'CGRK201710180001', 'CGRK201710180001', '邹良玉', '2017-10-18 23:21:24', '2017-10-18 23:21:12', '1', null, '11', '-2.860000', null, '-2.600000', '现付', '', '', null, null, '0.000000', '0.000000', '2.860000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('96', '出库', '销售', null, 'XSCK201710240001', 'XSCK201710240001', '邹良玉', '2017-10-24 22:04:06', '2017-10-24 22:03:08', '2', null, '9', '0.000000', null, '2.800000', '现付', '', '<7>', null, null, '10.000000', '0.280000', '2.520000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('97', '入库', '采购', null, 'CGRK201710290001', 'CGRK201710290001', '邹良玉', '2017-10-29 23:30:47', '2017-10-29 23:30:08', '4', null, '10', '0.000000', null, '-200.000000', '现付', '', '', null, null, '0.000000', '0.000000', '234.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('98', '入库', '采购', null, 'CGRK201710290002', 'CGRK201710290002', '邹良玉', '2017-10-29 23:32:07', '2017-10-29 23:30:52', '4', null, '10', '0.000000', null, '-300.000000', '现付', '', '', null, null, '0.000000', '0.000000', '351.000000', null, null, null, null, '1', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('99', '入库', '采购', null, 'CGRK201710290003', 'CGRK201710290003', '邹良玉', '2017-10-29 23:33:45', '2017-10-29 23:32:11', '4', null, '11', '-10.000000', null, '-720.000000', '现付', '', '', null, null, '0.000000', '0.000000', '842.400000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('101', '出库', '调拨', null, 'DBCK201711020001', 'DBCK201711020001', '邹良玉', '2017-11-02 22:51:17', '2017-11-02 22:48:58', null, null, null, '0.000000', null, '50.000000', '现付', '', '', null, null, null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('102', '出库', '零售', null, 'LSCK201711060001', 'LSCK201711060001', '邹良玉', '2017-11-06 20:38:46', '2017-11-06 20:38:01', '7', null, null, '12.000000', null, '12.000000', '现付', '', '', '[\"9\",\"12\"]', '[\"10\",\"2\"]', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('103', '入库', '采购', null, 'CGRK201711070001', 'CGRK201711070001', '邹良玉', '2017-11-07 21:07:05', '2017-11-07 21:06:53', '1', null, '10', '-26.400000', null, '-24.000000', '现付', '', '', null, '', '0.000000', '0.000000', '26.400000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('104', '入库', '采购', null, 'CGRK201711070002', 'CGRK201711070002', '邹良玉', '2017-11-07 21:07:40', '2017-11-07 21:07:08', '4', null, null, '-11.000000', null, '-10.000000', '现付', '', '', '[\"9\",\"11\"]', '[\"-10\",\"-1\"]', '0.000000', '0.000000', '11.700000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('105', '出库', '销售', null, 'XSCK201711070001', 'XSCK201711070001', '邹良玉', '2017-11-07 21:08:48', '2017-11-07 21:08:34', '2', null, '10', '13.000000', null, '13.000000', '现付', '', '<6>', null, '', '0.000000', '0.000000', '13.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('106', '出库', '销售', null, 'XSCK201711070002', 'XSCK201711070002', '邹良玉', '2017-11-07 21:09:20', '2017-11-07 21:08:51', '2', null, null, '13.000000', null, '13.000000', '现付', '', '<5>', '[\"9\",\"10\"]', '[\"5\",\"8\"]', '0.000000', '0.000000', '13.000000', '54.000000', '[\"11\",\"10\"]', '[\"21\",\"33\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('107', '入库', '采购', null, 'CGRK201712030001', 'CGRK201712030001', '邹良玉', '2017-12-03 22:38:36', '2017-12-03 22:37:26', '4', null, '9', '-1.000000', null, '-1.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('108', '入库', '采购', null, 'CGRK201712030002', 'sdfasdfa', '邹良玉', '2017-12-03 22:40:57', '2017-12-03 22:40:38', '4', null, '4', '-42.120000', null, '-36.000000', '现付', '', '', null, '', '0.000000', '0.000000', '42.120000', null, '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('109', '入库', '采购', null, 'CGRK201712030003', 'CGRK201712030003', '邹良玉', '2017-12-03 22:41:38', '2017-12-03 22:41:01', '4', null, '11', '-1.400000', null, '-1.200000', '现付', '', '', null, '', '0.000000', '0.000000', '1.400000', null, '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('110', '入库', '采购', null, 'CGRK201712050001', 'CGRK201712050001', '邹良玉', '2017-12-05 23:05:48', '2017-12-05 23:05:34', '1', null, '10', '-11.000000', null, '-10.000000', '现付', '', '', null, '', '0.000000', '0.000000', '11.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('111', '入库', '采购', null, 'CGRK201712050002', 'CGRK201712050002', '邹良玉', '2017-12-05 23:12:53', '2017-12-05 23:12:40', '1', null, '10', '0.000000', null, '-20.000000', '现付', '', '', null, '', '0.000000', '0.000000', '22.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('112', '出库', '销售', null, 'XSCK201712100001', 'XSCK201712100001', '邹良玉', '2017-12-10 21:07:45', '2017-12-10 21:07:25', '2', null, '11', '2.600000', null, '2.600000', '现付', '', '<>', null, '', '0.000000', '0.000000', '2.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('114', '其它', '采购订单', null, 'CGDD00000000001', 'CGDD00000000001', '邹良玉', '2019-03-09 15:49:57', '2019-03-09 15:49:50', '4', null, null, '0.000000', null, '-2.400000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('115', '入库', '采购', null, 'CGRK00000000002', 'CGRK00000000002', '邹良玉', '2019-03-09 15:52:05', '2019-03-09 15:51:45', '4', null, '9', '-257.400000', null, '-220.000000', '现付', '', '', null, '', '0.000000', '0.000000', '257.400000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('116', '入库', '采购', null, 'CGRK00000000003', 'CGRK00000000003', '邹良玉', '2019-03-09 15:52:21', '2019-03-09 15:52:09', '4', null, '9', '-1029.600000', null, '-880.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1029.600000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('117', '出库', '销售', null, 'XSCK00000000004', 'XSCK00000000004', '邹良玉', '2019-03-09 15:53:07', '2019-03-09 15:52:28', '5', null, '9', '110.000000', null, '110.000000', '现付', '', '<7>', null, '', '0.000000', '0.000000', '110.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('118', '出库', '销售', null, 'XSCK00000000005', 'XSCK00000000005', '邹良玉', '2019-03-09 15:57:26', '2019-03-09 15:53:10', '2', null, '9', '11.000000', null, '11.000000', '现付', '', '<7>', null, '', '0.000000', '0.000000', '11.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('119', '入库', '采购', null, 'CGRK00000000009', 'CGRK00000000009', '邹良玉', '2019-03-09 16:02:30', '2019-03-09 16:01:22', '1', null, '9', '-88.000000', null, '-80.000000', '现付', '', '', null, '', '0.000000', '0.000000', '88.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('120', '其它', '销售订单', null, 'XSDD00000000012', 'XSDD00000000012', '邹良玉', '2019-03-09 16:27:38', '2019-03-09 22:12:14', '5', null, null, '0.000000', null, '3.900000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('121', '入库', '采购', null, 'CGRK00000000013', 'CGRK00000000013', '邹良玉', '2019-03-09 16:35:53', '2019-03-09 16:35:32', '4', null, '9', '-42.120000', null, '-36.000000', '现付', '', '', null, '', '0.000000', '0.000000', '42.120000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('122', '入库', '采购', null, 'CGRK00000000015', 'CGRK00000000015', '邹良玉', '2019-03-09 16:37:34', '2019-03-09 16:37:01', '4', null, '9', '0.000000', null, '-100.000000', '现付', '', '', null, '', '0.000000', '0.000000', '117.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('123', '出库', '销售', null, 'XSCK00000000016', 'XSCK00000000016', '邹良玉', '2019-03-09 16:38:03', '2019-03-09 16:37:40', '5', null, '9', '0.000000', null, '26.000000', '现付', '', '<7>', null, '', '0.000000', '0.000000', '26.000000', null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('124', '入库', '其它', null, 'QTRK00000000074', 'QTRK00000000074', '邹良玉', '2019-03-09 22:35:21', '2019-03-09 22:34:56', '4', null, null, '0.000000', null, '800.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', null, null, '0');
INSERT INTO `jsh_depothead` VALUES ('137', '入库', '采购', null, 'CGRK00000000125', 'CGRK00000000125', '邹良玉', '2019-03-10 16:46:13', '2019-03-10 16:44:32', '4', null, '9', '-2.400000', null, '-2.400000', '现付', '', '', null, '', '0.000000', '0.000000', '2.400000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'CGDD00000000001', null, '0');
INSERT INTO `jsh_depothead` VALUES ('139', '其它', '采购订单', null, 'CGDD00000000127', 'CGDD00000000127', '邹良玉', '2019-03-10 17:00:24', '2019-03-10 18:52:21', '4', null, null, '0.000000', null, '-50.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('141', '出库', '销售', null, 'XSCK00000000134', 'XSCK00000000134', '邹良玉', '2019-03-10 17:40:13', '2019-03-10 17:39:41', '5', null, '9', '3.900000', null, '3.900000', '现付', '', '', null, '', '0.000000', '0.000000', '3.900000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'XSDD00000000012', null, '0');
INSERT INTO `jsh_depothead` VALUES ('142', '其它', '销售订单', null, 'XSDD00000000135', 'XSDD00000000135', '邹良玉', '2019-03-10 17:42:11', '2019-03-10 17:44:07', '2', null, null, '0.000000', null, '7.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('144', '出库', '销售', null, 'XSCK00000000137', 'XSCK00000000137', '邹良玉', '2019-03-10 17:44:49', '2019-03-10 17:44:14', '2', null, '9', '7.000000', null, '7.000000', '现付', '', '', null, '', '0.000000', '0.000000', '7.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'XSDD00000000135', null, '0');
INSERT INTO `jsh_depothead` VALUES ('147', '其它', '采购订单', null, 'CGDD00000000140', 'CGDD00000000140', '邹良玉', '2019-03-10 17:49:51', '2019-03-10 17:49:38', '4', null, null, '0.000000', null, '-240.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('148', '入库', '采购', null, 'CGRK00000000141', 'CGRK00000000141', '邹良玉', '2019-03-10 17:50:19', '2019-03-10 17:50:06', '4', null, '9', '-240.000000', null, '-240.000000', '现付', '', '', null, '', '0.000000', '0.000000', '240.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'CGDD00000000140', null, '0');
INSERT INTO `jsh_depothead` VALUES ('155', '入库', '采购', null, 'CGRK00000000173', 'CGRK00000000173', '邹良玉', '2019-03-10 19:21:56', '2019-03-10 19:20:30', '4', null, '4', '-54.080000', null, '-46.220000', '现付', '', '', null, '', '0.000000', '0.000000', '54.080000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', 'CGDD00000000127', null, '0');
INSERT INTO `jsh_depothead` VALUES ('158', '出库', '销售', null, 'XSCK00000000177', 'XSCK00000000177', '邹良玉', '2019-03-10 20:02:32', '2019-03-10 20:02:21', '5', null, '9', '10.000000', null, '10.000000', '现付', '', '', null, '', '0.000000', '0.000000', '10.000000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('159', '入库', '采购', null, 'CGRK00000000178', 'CGRK00000000178', '邹良玉', '2019-03-15 23:05:40', '2019-03-15 23:05:28', '46', null, '9', '-19.500000', null, '-19.500000', '现付', '', '', null, '', '0.000000', '0.000000', '19.500000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('160', '入库', '采购', null, 'CGRK00000000179', 'CGRK00000000179', '邹良玉', '2019-03-15 23:06:22', '2019-03-15 23:06:03', '46', null, '9', '-1111.000000', null, '-1111.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1111.000000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('161', '出库', '销售', null, 'XSCK00000000180', 'XSCK00000000180', '邹良玉', '2019-03-15 23:06:52', '2019-03-15 23:06:38', '2', null, '9', '111.000000', null, '111.000000', '现付', '', '', null, '', '0.000000', '0.000000', '111.000000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('162', '入库', '其它', null, 'QTRK00000000181', 'QTRK00000000181', '邹良玉', '2019-03-15 23:08:18', '2019-03-15 23:08:11', '4', null, null, '0.000000', null, '144.300000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('163', '出库', '调拨', null, 'DBCK00000000182', 'DBCK00000000182', '邹良玉', '2019-03-15 23:08:32', '2019-03-15 23:08:22', null, null, null, '0.000000', null, '111.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('164', '出库', '零售', null, 'LSCK00000000184', 'LSCK00000000184', '邹良玉', '2019-03-15 23:15:30', '2019-03-15 23:15:22', '8', null, '9', '1.200000', null, '1.200000', '预付款', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('165', '入库', '采购', null, 'CGRK00000000190', 'CGRK00000000190', 'lili', '2019-03-19 22:10:17', '2019-03-19 22:09:49', '47', null, '13', '-220.000000', null, '-220.000000', '现付', '', '', null, '', '0.000000', '0.000000', '220.000000', null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('166', '其它', '采购订单', null, 'CGDD00000000191', 'CGDD00000000191', 'lili', '2019-03-19 22:10:35', '2019-03-19 22:10:22', '50', null, null, '0.000000', null, '-2442.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '1', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('167', '出库', '采购退货', null, 'CGTH00000000193', 'CGTH00000000193', 'lili', '2019-03-19 22:11:39', '2019-03-19 22:11:12', '47', null, '13', '110.000000', null, '110.000000', '现付', '', '', null, '', '0.000000', '0.000000', '110.000000', null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('168', '其它', '销售订单', null, 'XSDD00000000194', 'XSDD00000000194', 'lili', '2019-03-19 22:12:04', '2019-03-19 22:11:55', '48', null, null, '0.000000', null, '22.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('169', '出库', '销售', null, 'XSCK00000000195', 'XSCK00000000195', 'lili', '2019-03-19 22:12:18', '2019-03-19 22:12:09', '48', null, '13', '22.000000', null, '22.000000', '现付', '', '', null, '', '0.000000', '0.000000', '22.000000', null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('170', '入库', '销售退货', null, 'XSTH00000000196', 'XSTH00000000196', 'lili', '2019-03-19 22:12:29', '2019-03-19 22:12:21', '48', null, '13', '-22.000000', null, '-22.000000', '现付', '', '', null, '', '0.000000', '0.000000', '22.000000', null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('171', '出库', '零售', null, 'LSCK00000000197', 'LSCK00000000197', 'lili', '2019-03-19 22:12:43', '2019-03-19 22:12:35', '49', null, '13', '22.000000', null, '22.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('172', '入库', '零售退货', null, 'LSTH00000000198', 'LSTH00000000198', 'lili', '2019-03-19 22:12:53', '2019-03-19 22:12:46', '49', null, '13', '-22.000000', null, '-22.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('173', '入库', '其它', null, 'QTRK00000000199', 'QTRK00000000199', 'lili', '2019-03-19 22:13:20', '2019-03-19 22:13:09', '50', null, null, '0.000000', null, '2200.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('174', '出库', '其它', null, 'QTCK00000000200', 'QTCK00000000200', 'lili', '2019-03-19 22:13:34', '2019-03-19 22:13:23', '48', null, null, '0.000000', null, '176.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '1', '0');
INSERT INTO `jsh_depothead` VALUES ('175', '其它', '采购订单', null, 'CGDD00000000203', 'CGDD00000000203', '邹良玉', '2019-03-19 22:48:07', '2019-03-19 22:47:55', '46', null, null, '0.000000', null, '-10.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('176', '入库', '采购', null, 'CGRK00000000204', 'CGRK00000000204', '邹良玉', '2019-03-19 22:48:22', '2019-03-19 22:48:10', '4', null, '13', '-28.080000', null, '-24.000000', '现付', '', '', null, '', '0.000000', '0.000000', '28.080000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('177', '出库', '销售', null, 'XSCK00000000205', 'XSCK00000000205', '邹良玉', '2019-03-19 22:48:40', '2019-03-19 22:48:26', '5', null, '13', '10.000000', null, '10.000000', '现付', '', '', null, '', '0.000000', '0.000000', '10.000000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('178', '入库', '采购', null, 'CGRK00000000213', 'CGRK00000000213', '邹良玉', '2019-03-21 23:58:56', '2019-03-21 23:58:44', '4', null, '13', '-14.400000', null, '-14.400000', '现付', '', '', null, '', '0.000000', '0.000000', '14.400000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('179', '出库', '销售', null, 'XSCK00000000214', 'XSCK00000000214', '邹良玉', '2019-03-21 23:59:18', '2019-03-21 23:59:05', '5', null, '10', '317.200000', null, '317.200000', '现付', '', '', null, '', '0.000000', '0.000000', '317.200000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('180', '入库', '采购', null, 'CGRK00000000242', 'CGRK00000000242', 'laoba123', '2019-04-02 22:30:01', '2019-04-02 22:29:52', '55', null, '16', '-1221.000000', null, '-1221.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1221.000000', null, null, null, null, '0', '', '115', '0');
INSERT INTO `jsh_depothead` VALUES ('181', '入库', '采购', null, 'CGRK00000000243', 'CGRK00000000243', 'laoba123', '2019-04-02 22:30:20', '2019-04-02 22:30:03', '55', null, '16', '-1342.000000', null, '-1342.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1342.000000', null, null, null, null, '0', '', '115', '0');
INSERT INTO `jsh_depothead` VALUES ('182', '入库', '采购', null, 'CGRK00000000245', 'CGRK00000000245', '邹良玉', '2019-04-02 22:32:00', '2019-04-02 22:31:48', '46', null, '16', '-14.400000', null, '-14.400000', '现付', '', '', null, '', '0.000000', '0.000000', '14.400000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('183', '入库', '采购', null, 'CGRK00000000247', 'CGRK00000000247', '邹良玉', '2019-04-04 23:06:58', '2019-04-04 23:06:41', '46', null, '16', '-159.600000', null, '-159.600000', '现付', '', '', null, '', '0.000000', '0.000000', '159.600000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('184', '入库', '采购', null, 'CGRK00000000248', 'CGRK00000000248', '邹良玉', '2019-04-07 20:23:23', '2019-04-07 20:22:40', '4', null, '4', '-35.100000', null, '-30.000000', '现付', '', '', null, '', '0.000000', '0.000000', '35.100000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('185', '入库', '采购', null, 'CGRK00000000249', 'CGRK00000000249', '邹良玉', '2019-04-07 20:25:30', '2019-04-07 20:25:00', '4', null, '16', '-35.100000', null, '-30.000000', '现付', '', '', null, '', '0.000000', '0.000000', '35.100000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('186', '入库', '采购', null, 'CGRK00000000250', 'CGRK00000000250', '邹良玉', '2019-04-07 20:35:00', '2019-04-07 20:34:29', '4', null, '16', '-11.700000', null, '-10.000000', '现付', '', '', null, '', '0.000000', '0.000000', '11.700000', null, null, null, null, '0', '', null, '1');
INSERT INTO `jsh_depothead` VALUES ('187', '入库', '采购', null, 'CGRK00000000252', 'CGRK00000000252', '邹良玉', '2019-04-07 20:44:09', '2019-04-07 20:43:49', '4', null, '4', '-421.200000', null, '-360.000000', '现付', '', '', null, '', '0.000000', '0.000000', '421.200000', null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('188', '其它', '组装单', null, 'ZZD00000000254', 'ZZD00000000254', '邹良玉', '2019-04-07 20:51:51', '2019-04-07 22:39:59', null, null, null, '0.000000', null, '0.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', null, '0');
INSERT INTO `jsh_depothead` VALUES ('189', '入库', '采购', null, 'CGRK00000000261', 'CGRK00000000261', '邹良玉', '2019-04-10 22:25:49', '2019-04-10 22:26:00', '57', null, '17', '-24.000000', null, '-24.000000', '现付', '', '', null, '', '0.000000', '0.000000', '24.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('190', '入库', '采购', null, 'CGRK00000000263', 'CGRK00000000263', '邹良玉', '2019-04-13 19:57:43', '2019-04-13 19:57:32', '57', null, '17', '-24.000000', null, '-24.000000', '现付', '', '', null, '', '0.000000', '0.000000', '24.000000', null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('191', '入库', '采购', null, 'CGRK00000000264', 'CGRK00000000264', '邹良玉', '2019-04-13 19:57:58', '2019-04-13 19:57:48', '57', null, '17', '-2.000000', null, '-2.000000', '现付', '', '', null, '', '0.000000', '0.000000', '2.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('192', '入库', '采购', null, 'CGRK00000000265', 'CGRK00000000265', '邹良玉', '2019-04-20 00:36:24', '2019-04-20 00:35:57', '57', null, '17', '-44.000000', null, '-44.000000', '现付', '', '', null, '', '0.000000', '0.000000', '44.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('193', '出库', '销售', null, 'XSCK00000000268', 'XSCK00000000268', '邹良玉', '2019-04-29 23:41:02', '2019-04-29 23:40:49', '58', null, '17', '0.000000', null, '100.000000', '现付', '', '', null, '', '0.000000', '0.000000', '100.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('194', '入库', '采购', null, 'CGRK00000000272', 'CGRK00000000272', '邹良玉', '2019-04-30 22:33:24', '2019-04-30 22:33:09', '57', null, '17', '-500.000000', null, '-500.000000', '现付', '', '', null, '', '0.000000', '0.000000', '500.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('195', '入库', '采购', null, 'CGRK00000000273', 'CGRK00000000273', '邹良玉', '2019-04-30 22:34:45', '2019-04-30 22:34:32', '57', null, '17', '-610.000000', null, '-610.000000', '现付', '', '', null, '', '0.000000', '0.000000', '610.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('196', '入库', '采购', null, 'CGRK00000000274', 'CGRK00000000274', '邹良玉', '2019-04-30 22:35:53', '2019-05-03 11:57:49', '57', null, '18', '-670.000000', null, '-670.000000', '现付', '', '', null, '', '0.000000', '0.000000', '670.000000', '0.000000', '[\"undefined\"]', '[\"undefined\"]', null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('197', '出库', '销售', null, 'XSCK00000000290', 'XSCK00000000290', '邹良玉', '2019-04-30 23:15:27', '2019-04-30 23:15:09', '58', null, '17', '90.000000', null, '90.000000', '现付', '', '', null, '', '0.000000', '0.000000', '90.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('198', '入库', '采购', null, 'CGRK00000000292', 'CGRK00000000292', '邹良玉', '2019-05-03 14:20:56', '2019-05-03 14:19:38', '57', null, '17', '-1.120000', null, '-1.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1.120000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('202', '其它', '采购订单', null, 'CGDD00000000308', 'CGDD00000000308', '邹良玉', '2019-10-24 15:27:23', '2019-10-24 15:25:50', '68', '63', null, '0.000000', null, '-50.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('203', '其它', '采购订单', null, 'CGDD00000000310', 'CGDD00000000310', '邹良玉', '2019-10-24 15:28:08', '2019-10-24 15:27:43', '57', '63', null, '0.000000', null, '-50.000000', '现付', '1', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('204', '其它', '采购订单', null, 'CGDD00000000312', 'CGDD00000000312', '邹良玉', '2019-10-24 15:30:40', '2019-10-24 15:30:23', '68', '63', null, '0.000000', null, '-2684.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('205', '入库', '采购', null, 'CGRK00000000327', 'CGRK00000000327', '邹良玉', '2019-10-24 16:49:40', '2019-10-24 16:48:55', '81', '63', '17', '-10000.000000', null, '-10000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '10000.000000', null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('206', '入库', '采购', null, 'CGRK00000000328', 'CGRK00000000328', '邹良玉', '2019-10-24 16:50:28', '2019-10-24 16:50:14', '68', '63', '17', '-244000.000000', null, '-200000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '244000.000000', null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('207', '入库', '采购', null, 'CGRK00000000329', 'CGRK00000000329', '邹良玉', '2019-10-24 17:53:59', '2019-10-24 17:53:36', '81', '63', '17', '-500.000000', null, '-500.000000', '现付', '', '', null, '', '0.000000', '0.000000', '500.000000', null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('208', '入库', '采购', null, 'CGRK00000000330', 'CGRK00000000330', '邹良玉', '2019-10-24 17:56:46', '2019-10-24 18:05:43', '81', '63', '17', '-500.000000', null, '-1089.000000', '现付', '333', '', null, '', '0.000000', '0.000000', '1089.000000', null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('209', '入库', '采购', null, 'CGRK00000000332', 'CGRK00000000332', '邹良玉', '2019-10-24 18:02:58', '2019-10-24 18:02:20', '81', '63', '17', '-3025.000000', null, '-3025.000000', '现付', '', '', null, '', '0.000000', '0.000000', '3025.000000', null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('210', '其它', '销售订单', null, 'XSDD00000000341', 'XSDD00000000341', '邹良玉', '2019-10-25 14:23:58', '2019-10-25 15:19:18', '88', '63', null, '0.000000', null, '1720.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('211', '其它', '销售订单', null, 'XSDD00000000343', 'XSDD00000000343', '邹良玉', '2019-10-25 15:45:42', '2019-10-25 15:43:36', '89', '63', null, '0.000000', null, '415.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('212', '其它', '销售订单', null, 'XSDD00000000344', 'XSDD00000000344', '邹良玉', '2019-10-25 16:47:16', '2019-10-25 16:41:07', '90', '63', null, '0.000000', null, '855.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('213', '其它', '销售订单', null, 'XSDD00000000346', 'XSDD00000000346', '邹良玉', '2019-10-25 18:06:18', '2019-10-25 18:31:08', '91', '63', null, '0.000000', null, '45.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('214', '其它', '销售订单', null, 'XSDD00000000349', 'XSDD00000000349', '邹良玉', '2019-10-26 14:30:28', '2019-10-26 15:19:09', '93', '63', null, '0.000000', null, '505.000000', '现付', '已经付款', '', null, '', null, null, null, null, null, null, null, '1', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('215', '入库', '其它', null, 'QTRK00000000359', 'QTRK00000000359', '邹良玉', '2019-10-26 16:34:00', '2019-10-26 16:32:17', '96', '63', null, '0.000000', null, '6576.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('216', '入库', '采购', null, 'CGRK00000000360', 'CGRK00000000360', '邹良玉', '2019-10-26 16:35:36', '2019-10-26 17:00:14', '96', '63', '17', '-6576.000000', null, '-6576.000000', '现付', '', '', null, '', '0.000000', '0.000000', '6576.000000', null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('217', '其它', '采购订单', null, 'CGDD00000000363', 'CGDD00000000363', '邹良玉', '2019-10-26 16:41:52', '2019-10-26 16:53:22', '96', '63', null, '0.000000', null, '-6576.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('218', '其它', '销售订单', null, 'XSDD00000000371', 'XSDD00000000371', '邹良玉', '2019-10-26 18:53:38', '2019-10-27 18:00:25', '97', '63', null, '0.000000', null, '1333.600000', '现付', '未付款', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('219', '其它', '采购订单', null, 'CGDD00000000373', 'CGDD00000000373', '邹良玉', '2019-10-27 10:42:58', '2019-10-27 10:40:17', '95', '63', null, '0.000000', null, '-88403.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('220', '入库', '采购', null, 'CGRK00000000374', 'CGRK00000000374', '邹良玉', '2019-10-27 10:43:45', '2019-10-27 10:42:59', '95', '63', '18', '-88403.000000', null, '-88403.000000', '现付', '', '', null, '', '0.000000', '0.000000', '88403.000000', null, null, null, null, '0', 'CGDD00000000373', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('221', '其它', '采购订单', null, 'CGDD00000000379', 'CGDD00000000379', '邹良玉', '2019-10-27 11:21:38', '2019-10-27 11:15:45', '99', '63', null, '0.000000', null, '-5560.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('222', '其它', '采购订单', null, 'CGDD00000000381', 'CGDD00000000381', '邹良玉', '2019-10-27 11:26:57', '2019-10-27 11:26:08', '100', '63', null, '0.000000', null, '-1794.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('223', '入库', '采购', null, 'CGRK00000000385', 'CGRK00000000385', '邹良玉', '2019-10-27 12:25:52', '2019-10-27 12:19:58', '101', '63', '17', '-18642.000000', null, '-18642.000000', '现付', '', '', null, '', '0.000000', '0.000000', '18642.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('225', '入库', '采购', null, 'CGRK00000000388', 'CGRK00000000388', '邹良玉', '2019-10-27 12:54:11', '2019-10-27 12:53:44', '102', '63', '17', '-440.000000', null, '-440.000000', '现付', '', '', null, '', '0.000000', '0.000000', '440.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('229', '入库', '采购', null, 'CGRK00000000390', 'CGRK00000000390', '邹良玉', '2019-10-27 13:06:53', '2019-10-27 13:06:27', '102', '63', '17', '0.000000', null, '0.000000', '现付', '', '', null, '', '0.000000', '0.000000', '0.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('230', '入库', '采购', null, 'CGRK00000000391', 'CGRK00000000391', '邹良玉', '2019-10-27 13:09:44', '2019-10-27 13:07:05', '102', '63', '17', '-7300.000000', null, '-7300.000000', '现付', '', '', null, '', '0.000000', '0.000000', '7300.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('232', '入库', '采购', null, 'CGRK00000000394', 'CGRK00000000394', '邹良玉', '2019-10-27 13:13:30', '2019-10-27 13:13:08', '103', '63', '17', '-1650.000000', null, '-1650.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1650.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('233', '出库', '销售', null, 'XSCK00000000392', 'XSCK00000000392', '邹良玉', '2019-10-27 13:13:39', '2019-10-27 13:09:47', '86', '63', '17', '592.000000', null, '592.000000', '现付', '', '', null, '', '0.000000', '0.000000', '592.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('234', '出库', '调拨', null, 'DBCK00000000400', 'DBCK00000000400', '邹良玉', '2019-10-27 14:20:17', '2019-10-27 14:18:55', null, '63', null, '0.000000', null, '8135.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('235', '其它', '销售订单', null, 'XSDD00000000402', 'XSDD00000000402', '邹良玉', '2019-10-27 14:33:21', '2019-10-27 14:59:24', '106', '63', null, '0.000000', null, '802.800000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('239', '其它', '采购订单', null, 'CGDD00000000405', 'CGDD00000000405', '邹良玉', '2019-10-27 14:56:24', '2019-10-27 14:54:44', '107', '63', null, '0.000000', null, '-11475.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('242', '出库', '调拨', null, 'DBCK00000000407', 'DBCK00000000407', '邹良玉', '2019-10-27 15:04:07', '2019-10-27 15:03:35', null, '63', null, '0.000000', null, '595.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('246', '入库', '其它', null, 'QTRK00000000415', 'QTRK00000000415', '邹良玉', '2019-10-27 15:39:46', '2019-10-27 18:33:55', '108', '63', null, '0.000000', null, '0.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('247', '出库', '销售', null, 'XSCK00000000416', 'XSCK00000000416', '邹良玉', '2019-10-27 15:45:50', '2019-10-27 15:45:31', '106', '63', '17', '0.000000', null, '802.800000', '现付', '', '', null, '', '0.000000', '0.000000', '802.800000', null, null, null, null, '0', 'XSDD00000000402', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('251', '出库', '销售', null, 'XSCK00000000419', 'XSCK00000000419', '邹良玉', '2019-10-27 18:38:52', '2019-10-27 18:38:34', '97', '63', '17', '0.000000', null, '1333.600000', '现付', '未付款', '', null, '', '0.000000', '0.000000', '1333.600000', null, null, null, null, '0', 'XSDD00000000371', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('252', '入库', '采购', null, 'CGRK00000000421', 'CGRK00000000421', '邹良玉', '2019-10-28 12:40:53', '2019-10-28 12:40:24', '109', '63', '17', '-200000.000000', null, '-200000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '200000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('253', '其它', '销售订单', null, 'XSDD00000000422', 'XSDD00000000422', '邹良玉', '2019-10-28 13:03:55', '2019-10-28 13:03:09', '110', '63', null, '0.000000', null, '560.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('254', '出库', '销售', null, 'XSCK00000000424', 'XSCK00000000424', '邹良玉', '2019-10-28 13:05:39', '2019-10-28 13:04:17', '110', '63', '17', '560.000000', null, '560.000000', '现付', '', '', null, '', '0.000000', '0.000000', '560.000000', null, null, null, null, '0', 'XSDD00000000422', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('255', '出库', '销售', null, 'XSCK00000000426', 'XSCK00000000426', '邹良玉', '2019-10-28 13:07:03', '2019-10-28 13:06:40', '110', '63', '17', '560.000000', null, '560.000000', '现付', '', '', null, '', '0.000000', '0.000000', '560.000000', null, null, null, null, '0', 'XSDD00000000422', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('256', '入库', '采购', null, 'CGRK00000000427', 'CGRK00000000427', '邹良玉', '2019-10-28 13:37:57', '2019-10-28 13:38:32', '102', '63', '17', '-60000.000000', null, '-60000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '60000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('257', '其它', '销售订单', null, 'XSDD00000000429', 'XSDD00000000429', '邹良玉', '2019-10-28 13:51:08', '2019-10-28 13:46:11', '114', '63', null, '0.000000', null, '1107.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('259', '其它', '销售订单', null, 'XSDD00000000431', 'XSDD00000000431', '邹良玉', '2019-10-28 13:59:00', '2019-10-28 13:58:10', '111', '63', null, '0.000000', null, '50.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('261', '入库', '采购', null, 'CGRK00000000433', 'CGRK00000000433', '邹良玉', '2019-10-28 13:59:50', '2019-10-28 13:59:29', '115', '63', '17', '-60000.000000', null, '-60000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '60000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('262', '出库', '销售', null, 'XSCK00000000434', 'XSCK00000000434', '邹良玉', '2019-10-28 14:00:48', '2019-10-28 13:59:55', '111', '63', '17', '0.000000', null, '50.000000', '现付', '送荣昌', '', null, '', '0.000000', '0.000000', '50.000000', null, null, null, null, '0', 'XSDD00000000431', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('263', '入库', '采购', null, 'CGRK00000000436', 'CGRK00000000436', '邹良玉', '2019-10-28 14:04:01', '2019-10-28 15:19:02', '115', '63', '17', '0.000000', null, '0.000000', '现付', '', '', null, '', '0.000000', '0.000000', '0.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('264', '入库', '采购', null, 'CGRK00000000437', 'CGRK00000000437', '邹良玉', '2019-10-28 14:04:13', '2019-10-28 14:03:57', '109', '63', '17', '0.000000', null, '0.000000', '现付', '', '', null, '', '0.000000', '0.000000', '0.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('265', '其它', '销售订单', null, 'XSDD00000000435', 'XSDD00000000435', '邹良玉', '2019-10-28 14:05:01', '2019-10-28 14:01:31', '113', '63', null, '0.000000', null, '1650.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('267', '入库', '其它', null, 'QTRK00000000440', 'QTRK00000000440', '邹良玉', '2019-10-28 14:53:43', '2019-10-28 14:53:13', '115', '63', null, '0.000000', null, '170000.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('268', '入库', '其它', null, 'QTRK00000000441', 'QTRK00000000441', '邹良玉', '2019-10-28 14:55:51', '2019-10-28 14:55:29', '109', '63', null, '0.000000', null, '170000.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('269', '其它', '销售订单', null, 'XSDD00000000442', 'XSDD00000000442', '邹良玉', '2019-10-28 14:56:17', '2019-10-28 14:55:51', '116', '63', null, '0.000000', null, '220.000000', '现付', '送冠军', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('270', '出库', '销售', null, 'XSCK00000000443', 'XSCK00000000443', '邹良玉', '2019-10-28 14:56:35', '2019-10-28 14:56:25', '116', '63', '17', '0.000000', null, '220.000000', '现付', '送冠军', '', null, '', '0.000000', '0.000000', '220.000000', null, null, null, null, '0', 'XSDD00000000442', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('271', '其它', '销售订单', null, 'XSDD00000000444', 'XSDD00000000444', '邹良玉', '2019-10-28 15:08:35', '2019-10-28 15:05:30', '87', '63', null, '0.000000', null, '837.500000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('272', '入库', '采购', null, 'CGRK00000000445', 'CGRK00000000445', '邹良玉', '2019-10-28 15:09:46', '2019-10-28 15:08:48', '103', '63', '17', '-750000.000000', null, '-750000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '750000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('275', '入库', '采购', null, 'CGRK00000000447', 'CGRK00000000447', '邹良玉', '2019-10-28 15:13:08', '2019-10-28 15:10:14', '102', '63', '17', '-40000.000000', null, '-40000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '40000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('276', '出库', '销售', null, 'XSCK00000000448', 'XSCK00000000448', '邹良玉', '2019-10-28 15:13:59', '2019-10-28 15:13:44', '87', '63', '17', '0.000000', null, '837.500000', '现付', '', '', null, '', '0.000000', '0.000000', '837.500000', null, null, null, null, '0', 'XSDD00000000444', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('277', '出库', '销售', null, 'XSCK00000000449', 'XSCK00000000449', '邹良玉', '2019-10-28 15:15:07', '2019-10-28 15:14:10', '113', '63', '17', '0.000000', null, '1650.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1650.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('280', '入库', '采购', null, 'CGRK00000000451', 'CGRK00000000451', '邹良玉', '2019-10-28 15:17:01', '2019-10-28 15:15:59', '115', '63', '17', '-46000.000000', null, '-46000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '46000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('282', '出库', '销售', null, 'XSCK00000000453', 'XSCK00000000453', '邹良玉', '2019-10-28 15:19:17', '2019-10-28 15:19:07', '113', '63', '17', '0.000000', null, '1650.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1650.000000', null, null, null, null, '0', 'XSDD00000000435', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('284', '入库', '采购', null, 'CGRK00000000455', 'CGRK00000000455', '邹良玉', '2019-10-28 15:23:23', '2019-10-28 15:22:43', '109', '63', '17', '-3200000.000000', null, '-3200000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '3200000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('285', '入库', '采购', null, 'CGRK00000000456', 'CGRK00000000456', '邹良玉', '2019-10-28 15:24:48', '2019-10-28 15:23:21', '109', '63', '17', '-720000.000000', null, '-720000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '720000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('287', '入库', '采购', null, 'CGRK00000000458', 'CGRK00000000458', '邹良玉', '2019-10-28 15:31:32', '2019-10-28 15:27:51', '107', '63', '17', '-19645000.000000', null, '-19645000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '19645000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('288', '其它', '销售订单', null, 'XSDD00000000460', 'XSDD00000000460', '邹良玉', '2019-10-28 15:33:12', '2019-10-28 15:32:44', '117', '63', null, '0.000000', null, '220.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('289', '出库', '销售', null, 'XSCK00000000461', 'XSCK00000000461', '邹良玉', '2019-10-28 15:33:21', '2019-10-28 15:33:13', '117', '63', '17', '220.000000', null, '220.000000', '现付', '', '', null, '', '0.000000', '0.000000', '220.000000', null, null, null, null, '0', 'XSDD00000000460', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('290', '入库', '采购', null, 'CGRK00000000462', 'CGRK00000000462', '邹良玉', '2019-10-28 15:57:06', '2019-10-28 15:56:36', '103', '63', '17', '-1550000.000000', null, '-1550000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '1550000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('291', '其它', '销售订单', null, 'XSDD00000000463', 'XSDD00000000463', '邹良玉', '2019-10-28 15:57:46', '2019-10-28 15:57:08', '118', '63', null, '0.000000', null, '12816.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '2', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('292', '出库', '销售', null, 'XSCK00000000464', 'XSCK00000000464', '邹良玉', '2019-10-28 15:57:55', '2019-10-28 15:57:44', '118', '63', '17', '0.000000', null, '12816.000000', '现付', '', '', null, '', '0.000000', '0.000000', '12816.000000', null, null, null, null, '0', 'XSDD00000000463', '63', '1');
INSERT INTO `jsh_depothead` VALUES ('293', '出库', '销售', null, 'XSCK00000000465', 'XSCK00000000465', '邹良玉', '2019-10-28 16:03:29', '2019-10-28 16:03:18', '118', '63', '17', '0.000000', null, '12816.000000', '现付', '', '', null, '', '0.000000', '0.000000', '12816.000000', null, null, null, null, '0', 'XSDD00000000463', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('295', '入库', '采购', null, 'CGRK00000000467', 'CGRK00000000467', '邹良玉', '2019-10-29 11:12:23', '2019-10-29 11:11:24', '108', '63', '17', '-80000.000000', null, '-80000.000000', '现付', '', '', null, '', '0.000000', '0.000000', '80000.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('299', '入库', '采购', null, 'CGRK00000000472', 'CGRK00000000472', '邹良玉', '2019-10-29 11:18:55', '2019-10-29 11:18:40', '108', '63', '17', '0.000000', null, '0.000000', '现付', '', '', null, '', '0.000000', '0.000000', '0.000000', null, null, null, null, '0', '', '63', '0');
INSERT INTO `jsh_depothead` VALUES ('303', '出库', '零售', null, 'LSCK00000000474', 'LSCK00000000474', '邹良玉', '2019-10-29 11:20:13', '2019-10-29 11:20:03', null, '63', '17', '275.000000', null, '275.000000', '现付', '', '', null, '', null, null, null, null, null, null, null, '0', '', '63', '0');

-- ----------------------------
-- Table structure for jsh_depotitem
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depotitem`;
CREATE TABLE `jsh_depotitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `HeaderId` bigint(20) NOT NULL COMMENT '表头Id',
  `MaterialId` bigint(20) NOT NULL COMMENT '材料Id',
  `MUnit` varchar(20) DEFAULT NULL COMMENT '商品计量单位',
  `OperNumber` decimal(24,6) DEFAULT NULL COMMENT '数量',
  `BasicNumber` decimal(24,6) DEFAULT NULL COMMENT '基础数量，如kg、瓶',
  `UnitPrice` decimal(24,6) DEFAULT NULL COMMENT '单价',
  `TaxUnitPrice` decimal(24,6) DEFAULT NULL COMMENT '含税单价',
  `AllPrice` decimal(24,6) DEFAULT NULL COMMENT '金额',
  `Remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `Img` varchar(50) DEFAULT NULL COMMENT '图片',
  `Incidentals` decimal(24,6) DEFAULT NULL COMMENT '运杂费',
  `DepotId` bigint(20) DEFAULT NULL COMMENT '仓库ID（库存是统计出来的）',
  `AnotherDepotId` bigint(20) DEFAULT NULL COMMENT '调拨时，对方仓库Id',
  `TaxRate` decimal(24,6) DEFAULT NULL COMMENT '税率',
  `TaxMoney` decimal(24,6) DEFAULT NULL COMMENT '税额',
  `TaxLastMoney` decimal(24,6) DEFAULT NULL COMMENT '价税合计',
  `OtherField1` varchar(50) DEFAULT NULL COMMENT '自定义字段1-品名',
  `OtherField2` varchar(50) DEFAULT NULL COMMENT '自定义字段2-型号',
  `OtherField3` varchar(50) DEFAULT NULL COMMENT '自定义字段3-制造商',
  `OtherField4` varchar(50) DEFAULT NULL COMMENT '自定义字段4',
  `OtherField5` varchar(50) DEFAULT NULL COMMENT '自定义字段5',
  `MType` varchar(20) DEFAULT NULL COMMENT '商品类型',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`),
  KEY `FK2A819F475D61CCF7` (`MaterialId`),
  KEY `FK2A819F474BB6190E` (`HeaderId`),
  KEY `FK2A819F479485B3F5` (`DepotId`),
  KEY `FK2A819F47729F5392` (`AnotherDepotId`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8 COMMENT='单据子表';

-- ----------------------------
-- Records of jsh_depotitem
-- ----------------------------
INSERT INTO `jsh_depotitem` VALUES ('7', '7', '500', '码', '30.000000', '30.000000', '1.200000', '1.320000', '36.000000', 'remark', null, null, '3', null, '10.000000', '3.600000', '39.600000', 'a', 'b', 'c', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('8', '8', '500', '码', '20.000000', '20.000000', '1.200000', '1.200000', '24.000000', '', null, null, '3', null, null, '0.000000', '24.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('9', '9', '500', '码', '100.000000', '100.000000', '1.200000', '1.320000', '120.000000', '', null, null, '3', null, '10.000000', '12.000000', '132.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('10', '10', '500', '码', '10.000000', '10.000000', '1.200000', '1.320000', '12.000000', '', null, null, '3', null, '10.000000', '1.200000', '13.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('11', '11', '500', '码', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('12', '12', '500', '码', '10.000000', '10.000000', '1.200000', '1.320000', '12.000000', '', null, null, '3', null, '10.000000', '1.200000', '13.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('13', '13', '500', '码', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('14', '14', '500', '码', '30.000000', '30.000000', '1.200000', '1.320000', '36.000000', '', null, null, '3', null, '10.000000', '3.600000', '39.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('16', '16', '500', '码', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('17', '17', '500', '码', '30.000000', '30.000000', '1.200000', '1.320000', '36.000000', '', null, null, '3', null, '10.000000', '3.600000', '39.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('18', '18', '500', '码', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('19', '19', '500', '码', '22.000000', '22.000000', '1.200000', '1.320000', '26.400000', '', null, null, '3', null, '10.000000', '2.640000', '29.040000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('20', '20', '500', '码', '30.000000', '30.000000', '1.200000', '1.320000', '36.000000', '', null, null, '3', null, '10.000000', '3.600000', '39.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('21', '21', '500', '码', '22.000000', '22.000000', '1.200000', '1.320000', '26.400000', '', null, null, '3', null, '10.000000', '2.640000', '29.040000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('22', '22', '500', '码', '20.000000', '20.000000', '1.200000', '1.320000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('23', '23', '517', '箱', '10.000000', '120.000000', '36.000000', '36.000000', '360.000000', '', null, null, '3', null, '0.000000', '0.000000', '360.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('24', '24', '518', '包', '10.000000', '250.000000', '75.000000', '75.000000', '750.000000', '', null, null, '3', null, '0.000000', '0.000000', '750.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('25', '25', '518', '包', '1.000000', '25.000000', '75.000000', '75.000000', '75.000000', '', null, null, '3', null, '0.000000', '0.000000', '75.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('26', '26', '518', '包', '2.000000', '50.000000', '75.000000', '90.000000', '150.000000', '', null, null, '3', null, '20.000000', '30.000000', '180.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('27', '27', '518', '包', '1.000000', '25.000000', '75.000000', '82.500000', '75.000000', '', null, null, '3', null, '10.000000', '7.500000', '82.500000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('28', '28', '517', '箱', '2.000000', '24.000000', '36.000000', '36.000000', '72.000000', '', null, null, '3', null, '0.000000', '0.000000', '72.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('29', '29', '500', '码', '100.000000', '100.000000', '1.300000', '1.370000', '130.000000', '', null, null, '3', null, '5.000000', '6.500000', '136.500000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('30', '30', '500', '码', '40.000000', '40.000000', '1.200000', '1.200000', '48.000000', '', null, null, '3', null, '0.000000', '0.000000', '48.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('31', '31', '500', '码', '20.000000', '20.000000', '1.300000', '1.430000', '26.000000', '', null, null, '3', null, '10.000000', '2.600000', '28.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('32', '32', '500', '码', '10.000000', '10.000000', '1.200000', '1.320000', '12.000000', '', null, null, '3', null, '10.000000', '1.200000', '13.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('33', '33', '500', '码', '50.000000', '50.000000', '1.300000', '1.430000', '65.000000', '', null, null, '3', null, '10.000000', '6.500000', '71.500000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('37', '37', '500', '码', '1.000000', '1.000000', '1.300000', '1.300000', '1.300000', '', null, null, '3', '1', '0.000000', '0.000000', '1.300000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('38', '38', '500', '码', '2.000000', '2.000000', '1.300000', '1.300000', '2.600000', '', null, null, '3', '1', '0.000000', '0.000000', '2.600000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('41', '41', '500', '码', '20.000000', '20.000000', '2.100000', '2.310000', '42.000000', '', null, null, '3', null, '10.000000', '4.200000', '46.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('42', '42', '500', '码', '10.000000', '10.000000', '1.100000', '1.100000', '11.000000', '', null, null, '3', null, '0.000000', '0.000000', '11.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('43', '43', '500', '码', '11.000000', '11.000000', '1.100000', '1.100000', '12.100000', '', null, null, '3', null, '0.000000', '0.000000', '12.100000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('44', '44', '499', '码', '1.000000', '1.000000', '2.200000', '2.200000', '2.200000', '', null, null, '3', null, '0.000000', '0.000000', '2.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('45', '45', '500', '码', '3.000000', '3.000000', '1.100000', '1.100000', '3.300000', '', null, null, '3', null, '0.000000', '0.000000', '3.300000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('48', '48', '498', '码', '10.000000', '10.000000', '1.200000', '1.200000', '12.000000', '', null, null, '3', null, '0.000000', '0.000000', '12.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('49', '49', '498', '码', '10.000000', '10.000000', '1.200000', '1.200000', '12.000000', '', null, null, '3', null, '0.000000', '0.000000', '12.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('50', '50', '500', '码', '20.000000', '20.000000', '1.100000', '1.100000', '22.000000', '', null, null, '3', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('52', '52', '500', '码', '22.000000', '22.000000', '1.100000', '1.100000', '24.200000', '', null, null, '3', null, '0.000000', '0.000000', '24.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('53', '53', '500', '码', '33.000000', '33.000000', '1.100000', '1.100000', '36.300000', '', null, null, '3', null, '0.000000', '0.000000', '36.300000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('54', '54', '500', '码', '10.000000', '10.000000', '1.200000', '1.200000', '12.000000', '', null, null, '1', null, '10.000000', '0.000000', '12.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('57', '57', '500', '码', '2.000000', '2.000000', '1.200000', '1.260000', '2.400000', '', null, null, '3', null, '0.000000', '0.120000', '2.520000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('63', '57', '517', '箱', '5.000000', '60.000000', '36.000000', '36.000000', '180.000000', '', null, null, '3', null, '0.000000', '0.000000', '180.000000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('64', '63', '500', '码', '10.000000', '10.000000', '1.200000', '1.320000', '12.000000', '', null, null, '3', null, '10.000000', '1.200000', '13.200000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('66', '65', '498', '码', '30.000000', '30.000000', '1.300000', '1.430000', '39.000000', '', null, null, '3', null, '10.000000', '3.900000', '42.900000', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_depotitem` VALUES ('71', '68', '498', '码', '1.000000', '1.000000', '3.000000', '3.000000', '3.000000', '', null, null, '3', null, '0.000000', '0.000000', '3.000000', '', '', '', '', '', '组合件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('72', '68', '499', '码', '1.000000', '1.000000', '4.000000', '4.000000', '4.000000', '', null, null, '3', null, '0.000000', '0.000000', '4.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('73', '69', '498', '码', '1.000000', '1.000000', '0.000000', '0.000000', '0.000000', '', null, null, '1', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '组合件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('74', '69', '499', '码', '1.000000', '1.000000', '0.000000', '0.000000', '0.000000', '', null, null, '1', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('75', '70', '487', '码', '50.000000', '50.000000', '1.000000', '1.000000', '50.000000', '', null, null, '1', null, '10.000000', '0.000000', '50.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('76', '71', '499', '码', '20.000000', '20.000000', '2.400000', '2.400000', '48.000000', '', null, null, '3', null, '0.000000', '0.000000', '48.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('77', '72', '499', '码', '10.000000', '10.000000', '2.400000', '2.810000', '24.000000', '', null, null, '3', null, '17.000000', '4.080000', '28.080000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('78', '73', '487', '码', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '1', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('79', '74', '487', '码', '5.000000', '5.000000', '1.000000', '1.000000', '5.000000', '', null, null, '3', null, '0.000000', '0.000000', '5.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('80', '75', '500', '码', '10.000000', '10.000000', '1.300000', '1.300000', '13.000000', '', null, null, '3', null, '0.000000', '0.000000', '13.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('81', '76', '487', '码', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '3', '1', '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('82', '77', '499', '码', '1.000000', '1.000000', '2.200000', '2.200000', '2.200000', '', null, null, '3', null, '0.000000', '0.000000', '2.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('83', '78', '499', '码', '1.000000', '1.000000', '2.200000', '2.200000', '2.200000', '', null, null, '3', null, '0.000000', '0.000000', '2.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('84', '79', '499', '码', '9.000000', '9.000000', '2.400000', '2.640000', '21.600000', '', null, null, '3', null, '10.000000', '2.160000', '23.760000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('85', '80', '500', '码', '1.000000', '1.000000', '2.000000', '2.000000', '2.000000', '', null, null, '3', null, '0.000000', '0.000000', '2.000000', '', '', '', '', '', '组合件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('86', '80', '498', '码', '1.000000', '1.000000', '3.000000', '3.000000', '3.000000', '', null, null, '3', null, '0.000000', '0.000000', '3.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('88', '82', '498', '码', '40.000000', '40.000000', '1.300000', '1.430000', '52.000000', '', null, null, '3', null, '10.000000', '5.200000', '57.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('90', '84', '499', '码', '10.000000', '10.000000', '2.400000', '2.640000', '24.000000', '', null, null, '1', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('91', '85', '518', '包', '1.000000', '25.000000', '75.000000', '87.750000', '75.000000', '', null, null, '3', null, '17.000000', '12.750000', '87.750000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('93', '87', '518', 'kg', '1.000000', '1.000000', '4.000000', '4.000000', '4.000000', '', null, null, '3', null, '0.000000', '0.000000', '4.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('94', '88', '517', '瓶', '10.000000', '10.000000', '4.000000', '4.400000', '40.000000', '', null, null, '3', null, '10.000000', '4.000000', '44.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('95', '89', '517', '箱', '1.000000', '12.000000', '18.000000', '18.000000', '18.000000', '', null, null, '3', null, '0.000000', '0.000000', '18.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('96', '90', '518', '包', '2.000000', '50.000000', '50.000000', '50.000000', '100.000000', '', null, null, '3', null, '0.000000', '0.000000', '100.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('101', '94', '517', '瓶', '2.000000', '2.000000', '4.000000', '4.000000', '8.000000', '', null, null, '3', null, '0.000000', '0.000000', '8.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('102', '95', '498', '码', '2.000000', '2.000000', '1.300000', '1.430000', '2.600000', '', null, null, '3', null, '10.000000', '0.260000', '2.860000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('103', '96', '498', '码', '2.000000', '2.000000', '1.400000', '1.400000', '2.800000', '', null, null, '3', null, '0.000000', '0.000000', '2.800000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('104', '97', '485', '码', '200.000000', '200.000000', '1.000000', '1.170000', '200.000000', '', null, null, '3', null, '17.000000', '34.000000', '234.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('105', '98', '487', '码', '300.000000', '300.000000', '1.000000', '1.170000', '300.000000', '', null, null, '3', null, '17.000000', '51.000000', '351.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('106', '99', '517', '箱', '20.000000', '240.000000', '36.000000', '42.120000', '720.000000', '', null, null, '3', null, '17.000000', '122.400000', '842.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('107', '100', '487', '码', '1.000000', '1.000000', '1.000000', '1.000000', '1.000000', '', null, null, '4', null, '0.000000', '0.000000', '1.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('108', '101', '485', '码', '50.000000', '50.000000', '1.000000', '1.000000', '50.000000', '', null, null, '3', '1', '0.000000', '0.000000', '50.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('109', '102', '498', '码', '10.000000', '10.000000', '1.200000', '1.200000', '12.000000', '', null, null, '3', null, '0.000000', '0.000000', '12.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('110', '103', '499', '码', '10.000000', '10.000000', '2.400000', '2.640000', '24.000000', '', null, null, '3', null, '10.000000', '2.400000', '26.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('111', '104', '487', '码', '10.000000', '10.000000', '1.000000', '1.170000', '10.000000', '', null, null, '3', null, '17.000000', '1.700000', '11.700000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('112', '105', '499', '码', '5.000000', '5.000000', '2.600000', '2.600000', '13.000000', '', null, null, '3', null, '0.000000', '0.000000', '13.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('113', '106', '499', '码', '5.000000', '5.000000', '2.600000', '2.600000', '13.000000', '', null, null, '3', null, '0.000000', '0.000000', '13.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('114', '107', '487', '码', '1.000000', '1.000000', '1.000000', '1.000000', '1.000000', '', null, null, '1', null, '0.000000', '0.000000', '1.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('116', '108', '517', '箱', '1.000000', '12.000000', '36.000000', '42.120000', '36.000000', '', null, null, '3', null, '17.000000', '6.120000', '42.120000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('117', '109', '500', '码', '1.000000', '1.000000', '1.200000', '1.400000', '1.200000', '', null, null, '3', null, '17.000000', '0.200000', '1.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('118', '110', '487', '码', '10.000000', '10.000000', '1.000000', '1.100000', '10.000000', '', null, null, '3', null, '10.000000', '1.000000', '11.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('119', '111', '487', '码', '20.000000', '20.000000', '1.000000', '1.100000', '20.000000', '', null, null, '1', null, '10.000000', '2.000000', '22.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('120', '112', '499', '码', '1.000000', '1.000000', '2.600000', '2.600000', '2.600000', '', null, null, '3', null, '0.000000', '0.000000', '2.600000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('123', '114', '499', '码', '1.000000', '1.000000', '2.400000', '2.400000', '2.400000', '', null, null, '3', null, '0.000000', '0.000000', '2.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('124', '115', '563', '张', '20.000000', '20.000000', '11.000000', '12.870000', '220.000000', '', null, null, '1', null, '17.000000', '37.400000', '257.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('125', '116', '563', '张', '80.000000', '80.000000', '11.000000', '12.870000', '880.000000', '', null, null, '3', null, '17.000000', '149.600000', '1029.600000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('126', '117', '563', '张', '10.000000', '10.000000', '11.000000', '11.000000', '110.000000', '', null, null, '3', null, '0.000000', '0.000000', '110.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('127', '118', '563', '张', '1.000000', '1.000000', '11.000000', '11.000000', '11.000000', '', null, null, '1', null, '0.000000', '0.000000', '11.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('128', '119', '562', '个', '10.000000', '10.000000', '8.000000', '8.800000', '80.000000', '', null, null, '3', null, '10.000000', '8.000000', '88.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('129', '120', '500', '码', '3.000000', '3.000000', '1.300000', '1.300000', '3.900000', '', null, null, '3', null, '0.000000', '0.000000', '3.900000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('130', '121', '517', '箱', '1.000000', '12.000000', '36.000000', '42.120000', '36.000000', '', null, null, '3', null, '17.000000', '6.120000', '42.120000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('131', '122', '487', '码', '100.000000', '100.000000', '1.000000', '1.170000', '100.000000', '', null, null, '3', null, '17.000000', '17.000000', '117.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('132', '123', '499', '码', '10.000000', '10.000000', '2.600000', '2.600000', '26.000000', '', null, null, '3', null, '0.000000', '0.000000', '26.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('133', '124', '562', '个', '100.000000', '100.000000', '8.000000', '9.360000', '800.000000', '', null, null, '1', null, '17.000000', '136.000000', '936.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('144', '137', '499', '码', '1.000000', '1.000000', '2.400000', '2.400000', '2.400000', '', null, null, '3', null, '0.000000', '0.000000', '2.400000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('146', '139', '499', '码', '10.000000', '10.000000', '2.400000', '2.810000', '24.000000', '', null, null, '3', null, '17.000000', '4.080000', '28.080000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('148', '141', '500', '码', '3.000000', '3.000000', '1.300000', '1.300000', '3.900000', '', null, null, '3', null, '0.000000', '0.000000', '3.900000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('149', '142', '498', '码', '5.000000', '5.000000', '1.400000', '1.400000', '7.000000', '', null, null, '3', null, '0.000000', '0.000000', '7.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('151', '144', '498', '码', '5.000000', '5.000000', '1.400000', '1.400000', '7.000000', '', null, null, '3', null, '0.000000', '0.000000', '7.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('154', '147', '499', '码', '100.000000', '100.000000', '2.400000', '2.400000', '240.000000', '', null, null, '3', null, '0.000000', '0.000000', '240.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('155', '148', '499', '码', '100.000000', '100.000000', '2.400000', '2.400000', '240.000000', '', null, null, '3', null, '0.000000', '0.000000', '240.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('158', '139', '498', '码', '20.000000', '20.000000', '1.110000', '1.300000', '22.220000', '', null, null, '3', null, '17.000000', '3.780000', '26.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('161', '155', '499', '码', '10.000000', '10.000000', '2.400000', '2.810000', '24.000000', '', null, null, '3', null, '17.000000', '4.080000', '28.080000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('162', '155', '498', '码', '20.000000', '20.000000', '1.110000', '1.300000', '22.220000', '', null, null, '3', null, '17.000000', '3.780000', '26.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('165', '158', '487', '码', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '3', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('166', '159', '498', '码', '15.000000', '15.000000', '1.300000', '1.300000', '19.500000', '', null, null, '3', null, '0.000000', '0.000000', '19.500000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('167', '160', '487', '码', '1111.000000', '1111.000000', '1.000000', '1.000000', '1111.000000', '', null, null, '1', null, '0.000000', '0.000000', '1111.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('168', '161', '487', '码', '111.000000', '111.000000', '1.000000', '1.000000', '111.000000', '', null, null, '1', null, '0.000000', '0.000000', '111.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('169', '162', '498', '码', '111.000000', '111.000000', '1.300000', '1.520000', '144.300000', '', null, null, '3', null, '17.000000', '24.530000', '168.830000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('170', '163', '487', '码', '111.000000', '111.000000', '1.000000', '1.000000', '111.000000', '', null, null, '1', '3', '0.000000', '0.000000', '111.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('171', '164', '498', '码', '1.000000', '1.000000', '1.200000', '1.200000', '1.200000', '', null, null, '3', null, '0.000000', '0.000000', '1.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('172', '165', '564', '个', '10.000000', '10.000000', '22.000000', '22.000000', '220.000000', '', null, null, '7', null, '0.000000', '0.000000', '220.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('173', '166', '564', '个', '111.000000', '111.000000', '22.000000', '22.000000', '2442.000000', '', null, null, '7', null, '0.000000', '0.000000', '2442.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('174', '167', '564', '个', '5.000000', '5.000000', '22.000000', '22.000000', '110.000000', '', null, null, '7', null, '0.000000', '0.000000', '110.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('175', '168', '564', '个', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('176', '169', '564', '个', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('177', '170', '564', '个', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('178', '171', '564', '个', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('179', '172', '564', '个', '1.000000', '1.000000', '22.000000', '22.000000', '22.000000', '', null, null, '7', null, '0.000000', '0.000000', '22.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('180', '173', '564', '个', '100.000000', '100.000000', '22.000000', '22.000000', '2200.000000', '', null, null, '7', null, '0.000000', '0.000000', '2200.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('181', '174', '564', '个', '8.000000', '8.000000', '22.000000', '22.000000', '176.000000', '', null, null, '7', null, '0.000000', '0.000000', '176.000000', '', '', '', '', '', '', '1', '0');
INSERT INTO `jsh_depotitem` VALUES ('182', '175', '487', '码', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '1', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('183', '176', '499', '码', '10.000000', '10.000000', '2.400000', '2.810000', '24.000000', '', null, null, '1', null, '17.000000', '4.080000', '28.080000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('184', '177', '487', '码', '10.000000', '10.000000', '1.000000', '1.000000', '10.000000', '', null, null, '1', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('185', '178', '500', '码', '12.000000', '12.000000', '1.200000', '1.200000', '14.400000', '', null, null, '3', null, '0.000000', '0.000000', '14.400000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('186', '179', '499', '码', '122.000000', '122.000000', '2.600000', '2.600000', '317.200000', '', null, null, '3', null, '0.000000', '0.000000', '317.200000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('187', '180', '567', '个', '111.000000', null, '11.000000', '11.000000', '1221.000000', '', null, null, '13', null, '0.000000', '0.000000', '1221.000000', '', '', '', '', '', '', '115', '0');
INSERT INTO `jsh_depotitem` VALUES ('188', '181', '567', '个', '122.000000', null, '11.000000', '11.000000', '1342.000000', '', null, null, '13', null, '0.000000', '0.000000', '1342.000000', '', '', '', '', '', '', '115', '0');
INSERT INTO `jsh_depotitem` VALUES ('189', '182', '500', '码', '12.000000', null, '1.200000', '1.200000', '14.400000', '', null, null, '1', null, '0.000000', '0.000000', '14.400000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('190', '183', '500', '码', '133.000000', null, '1.200000', '1.200000', '159.600000', '', null, null, '1', null, '0.000000', '0.000000', '159.600000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('191', '184', '517', '瓶', '10.000000', null, '3.000000', '3.510000', '30.000000', '', null, null, '3', null, '17.000000', '5.100000', '35.100000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('192', '185', '517', '瓶', '10.000000', null, '3.000000', '3.510000', '30.000000', '', null, null, '3', null, '17.000000', '5.100000', '35.100000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('193', '186', '487', '码', '10.000000', null, '1.000000', '1.170000', '10.000000', '', null, null, '3', null, '17.000000', '1.700000', '11.700000', '', '', '', '', '', '', null, '1');
INSERT INTO `jsh_depotitem` VALUES ('194', '187', '517', '箱', '10.000000', '120.000000', '36.000000', '42.120000', '360.000000', '', null, null, '3', null, '17.000000', '61.200000', '421.200000', '', '', '', '', '', '', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('195', '188', '485', '码', '8.000000', '8.000000', '0.000000', '0.000000', '0.000000', '', null, null, '3', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '组合件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('196', '188', '487', '码', '8.000000', '8.000000', '0.000000', '0.000000', '0.000000', '', null, null, '3', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('197', '188', '498', '码', '8.000000', '8.000000', '0.000000', '0.000000', '0.000000', '', null, null, '3', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '普通子件', null, '0');
INSERT INTO `jsh_depotitem` VALUES ('198', '189', '569', '只', '12.000000', '12.000000', '2.000000', '2.000000', '24.000000', '', null, null, '14', null, '0.000000', '0.000000', '24.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('199', '190', '569', '只', '12.000000', '12.000000', '2.000000', '2.000000', '24.000000', '', null, null, '14', null, '0.000000', '0.000000', '24.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('200', '191', '569', '只', '1.000000', '1.000000', '2.000000', '2.000000', '2.000000', '', null, null, '14', null, '0.000000', '0.000000', '2.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('201', '192', '569', '只', '22.000000', '22.000000', '2.000000', '2.000000', '44.000000', '', null, null, '14', null, '0.000000', '0.000000', '44.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('202', '193', '569', '只', '20.000000', '20.000000', '5.000000', '5.000000', '100.000000', '', null, null, '14', null, '0.000000', '0.000000', '100.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('203', '194', '569', '只', '100.000000', '100.000000', '5.000000', '5.000000', '500.000000', '', null, null, '15', null, '0.000000', '0.000000', '500.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('204', '195', '569', '只', '122.000000', '122.000000', '5.000000', '5.000000', '610.000000', '', null, null, '15', null, '0.000000', '0.000000', '610.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('205', '196', '569', '只', '122.000000', '122.000000', '5.000000', '5.000000', '610.000000', '', null, null, '15', null, '0.000000', '0.000000', '610.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('206', '197', '569', '只', '18.000000', '18.000000', '5.000000', '5.000000', '90.000000', '', null, null, '14', null, '0.000000', '0.000000', '90.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('207', '196', '569', '只', '2.000000', '2.000000', '5.000000', '5.000000', '10.000000', '', null, null, '15', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('208', '196', '569', '只', '2.000000', '2.000000', '5.000000', '5.000000', '10.000000', '', null, null, '15', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('209', '196', '568', '个', '2.000000', '2.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('210', '196', '568', '个', '2.000000', '2.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('211', '196', '568', '个', '3.000000', '3.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('212', '196', '568', '个', '4.000000', '4.000000', '0.000000', '0.000000', '0.000000', '', null, null, '14', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('213', '196', '568', '个', '5.000000', '5.000000', '2.000000', '2.000000', '10.000000', '', null, null, '14', null, '0.000000', '0.000000', '10.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('214', '196', '569', '只', '6.000000', '6.000000', '5.000000', '5.000000', '30.000000', '', null, null, '14', null, '0.000000', '0.000000', '30.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('215', '198', '578', '箱', '1.000000', '12.000000', '1.000000', '1.120000', '1.000000', '', null, null, '14', null, '12.000000', '0.120000', '1.120000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('216', '202', '585', '', '10.000000', '10.000000', '5.000000', '6.100000', '50.000000', '0', null, null, '1', null, '22.000000', '11.000000', '61.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('217', '203', '585', '', '10.000000', '10.000000', '5.000000', '6.100000', '50.000000', '1', null, null, '1', null, '22.000000', '11.000000', '61.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('218', '204', '585', '', '122.000000', '122.000000', '22.000000', '26.840000', '2684.000000', '', null, null, '1', null, '22.000000', '590.480000', '3274.480000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('219', '205', '579', '', '1000.000000', '1000.000000', '10.000000', '10.000000', '10000.000000', '', null, null, '16', null, '0.000000', '0.000000', '10000.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('220', '206', '577', '', '100.000000', '100.000000', '2000.000000', '2440.000000', '200000.000000', '', null, null, '16', null, '22.000000', '44000.000000', '244000.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('221', '207', '577', '', '100.000000', null, '5.000000', '5.000000', '500.000000', '', null, null, '16', null, '0.000000', '0.000000', '500.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('222', '208', '579', '个', '33.000000', '33.000000', '33.000000', '33.000000', '1089.000000', '333', null, null, '16', null, '0.000000', '0.000000', '1089.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('223', '209', '577', '个', '55.000000', '55.000000', '55.000000', '55.000000', '3025.000000', '', null, null, '16', null, '0.000000', '0.000000', '3025.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('224', '210', '610', '盒', '20.000000', '20.000000', '6.000000', '6.000000', '120.000000', '', null, null, '16', null, '0.000000', '0.000000', '120.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('225', '210', '611', '盒', '20.000000', '20.000000', '8.000000', '8.000000', '160.000000', '', null, null, '16', null, '0.000000', '0.000000', '160.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('226', '210', '612', '盒', '20.000000', '20.000000', '10.000000', '10.000000', '200.000000', '', null, null, '16', null, '0.000000', '0.000000', '200.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('227', '210', '613', '盒', '20.000000', '20.000000', '12.000000', '12.000000', '240.000000', '', null, null, '16', null, '0.000000', '0.000000', '240.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('228', '210', '614', '盒', '10.000000', '10.000000', '18.000000', '18.000000', '180.000000', '', null, null, '16', null, '0.000000', '0.000000', '180.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('229', '210', '615', '盒', '10.000000', '10.000000', '22.000000', '22.000000', '220.000000', '', null, null, '16', null, '0.000000', '0.000000', '220.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('230', '210', '609', '包', '280.000000', '280.000000', '1.500000', '1.500000', '420.000000', '', null, null, '16', null, '0.000000', '0.000000', '420.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('231', '210', '617', '本', '20.000000', '20.000000', '9.000000', '9.000000', '180.000000', '', null, null, '16', null, '0.000000', '0.000000', '180.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('232', '211', '620', '刀', '3.000000', '3.000000', '60.000000', '60.000000', '180.000000', '', null, null, '16', null, '0.000000', '0.000000', '180.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('233', '211', '621', '个', '10.000000', '10.000000', '4.500000', '4.500000', '45.000000', '', null, null, '16', null, '0.000000', '0.000000', '45.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('234', '211', '622', '刀', '10.000000', '10.000000', '4.500000', '4.500000', '45.000000', '', null, null, '16', null, '0.000000', '0.000000', '45.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('235', '211', '625', '包', '10.000000', '10.000000', '6.000000', '6.000000', '60.000000', '', null, null, '16', null, '0.000000', '0.000000', '60.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('236', '211', '631', '套', '10.000000', '10.000000', '8.500000', '8.500000', '85.000000', '', null, null, '16', null, '0.000000', '0.000000', '85.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('237', '212', '639', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('238', '212', '660', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('239', '212', '654', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('240', '212', '643', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('241', '212', '633', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('242', '212', '632', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('243', '212', '640', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('244', '212', '656', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('245', '212', '657', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('246', '212', '662', '瓶', '2.000000', '2.000000', '9.500000', '9.500000', '19.000000', '', null, null, '16', null, '0.000000', '0.000000', '19.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('247', '212', '646', '支', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('248', '212', '655', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('249', '212', '653', '瓶', '4.000000', '4.000000', '9.500000', '9.500000', '38.000000', '', null, null, '16', null, '0.000000', '0.000000', '38.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('250', '212', '652', '瓶', '3.000000', '3.000000', '9.500000', '9.500000', '28.500000', '', null, null, '16', null, '0.000000', '0.000000', '28.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('251', '212', '647', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('252', '212', '635', '瓶', '2.000000', '2.000000', '9.500000', '9.500000', '19.000000', '', null, null, '16', null, '0.000000', '0.000000', '19.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('253', '212', '637', '瓶', '2.000000', '2.000000', '9.500000', '9.500000', '19.000000', '', null, null, '16', null, '0.000000', '0.000000', '19.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('254', '212', '638', '瓶', '2.000000', '2.000000', '9.500000', '9.500000', '19.000000', '', null, null, '16', null, '0.000000', '0.000000', '19.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('255', '212', '648', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('256', '212', '650', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('257', '212', '649', '瓶', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '16', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('258', '213', '712', '瓶', '10.000000', '10.000000', '4.500000', '4.500000', '45.000000', '未付', null, null, '16', null, '0.000000', '0.000000', '45.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('259', '214', '742', '盒', '20.000000', '20.000000', '12.500000', '12.500000', '250.000000', '', null, null, '16', null, '0.000000', '0.000000', '250.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('260', '214', '744', '个', '20.000000', '20.000000', '2.500000', '2.500000', '50.000000', '', null, null, '16', null, '0.000000', '0.000000', '50.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('261', '214', '743', '个', '20.000000', '20.000000', '2.500000', '2.500000', '50.000000', '', null, null, '16', null, '0.000000', '0.000000', '50.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('262', '214', '745', '包', '5.000000', '5.000000', '13.000000', '13.000000', '65.000000', '', null, null, '16', null, '0.000000', '0.000000', '65.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('263', '214', '746', '包', '5.000000', '5.000000', '18.000000', '18.000000', '90.000000', '', null, null, '16', null, '0.000000', '0.000000', '90.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('264', '215', '761', '块', '480.000000', '480.000000', '9.200000', '9.200000', '4416.000000', '', null, null, '16', null, '0.000000', '0.000000', '4416.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('265', '215', '762', '块', '120.000000', '120.000000', '18.000000', '18.000000', '2160.000000', '', null, null, '16', null, '0.000000', '0.000000', '2160.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('266', '216', '762', '块', '120.000000', '120.000000', '18.000000', '18.000000', '2160.000000', '', null, null, '16', null, '0.000000', '0.000000', '2160.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('267', '216', '761', '块', '480.000000', '480.000000', '9.200000', '9.200000', '4416.000000', '', null, null, '16', null, '0.000000', '0.000000', '4416.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('268', '217', '762', '块', '120.000000', '120.000000', '18.000000', '18.000000', '2160.000000', '', null, null, '16', null, '0.000000', '0.000000', '2160.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('269', '217', '761', '块', '480.000000', '480.000000', '9.200000', '9.200000', '4416.000000', '', null, null, '16', null, '0.000000', '0.000000', '4416.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('270', '218', '764', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('271', '218', '765', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('272', '218', '766', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('273', '218', '767', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('274', '218', '769', '盒', '12.000000', '12.000000', '5.500000', '5.500000', '66.000000', '', null, null, '17', null, '0.000000', '0.000000', '66.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('275', '218', '770', '盒', '12.000000', '12.000000', '5.800000', '5.800000', '69.600000', '', null, null, '17', null, '0.000000', '0.000000', '69.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('276', '218', '771', '盒', '12.000000', '12.000000', '5.800000', '5.800000', '69.600000', '', null, null, '17', null, '0.000000', '0.000000', '69.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('277', '218', '772', '盒', '10.000000', '10.000000', '9.500000', '9.500000', '95.000000', '', null, null, '17', null, '0.000000', '0.000000', '95.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('278', '218', '773', '盒', '12.000000', '12.000000', '9.500000', '9.500000', '114.000000', '', null, null, '17', null, '0.000000', '0.000000', '114.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('279', '218', '774', '盒', '12.000000', '12.000000', '9.500000', '9.500000', '114.000000', '', null, null, '17', null, '0.000000', '0.000000', '114.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('280', '218', '775', '盒', '12.000000', '12.000000', '9.500000', '9.500000', '114.000000', '', null, null, '17', null, '0.000000', '0.000000', '114.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('281', '218', '776', '盒', '12.000000', '12.000000', '9.500000', '9.500000', '114.000000', '', null, null, '17', null, '0.000000', '0.000000', '114.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('282', '218', '777', '盒', '12.000000', '12.000000', '10.500000', '10.500000', '126.000000', '', null, null, '17', null, '0.000000', '0.000000', '126.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('283', '218', '778', '盒', '12.000000', '12.000000', '10.500000', '10.500000', '126.000000', '', null, null, '17', null, '0.000000', '0.000000', '126.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('284', '218', '781', '盒', '10.000000', '10.000000', '9.500000', '9.500000', '95.000000', '', null, null, '17', null, '0.000000', '0.000000', '95.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('285', '219', '755', '包', '9120.000000', '9120.000000', '2.500000', '2.500000', '22800.000000', '', null, null, '16', null, '0.000000', '0.000000', '22800.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('286', '219', '756', '包', '8910.000000', '8910.000000', '4.300000', '4.300000', '38313.000000', '', null, null, '16', null, '0.000000', '0.000000', '38313.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('287', '219', '759', '包', '2600.000000', '2600.000000', '2.500000', '2.500000', '6500.000000', '', null, null, '16', null, '0.000000', '0.000000', '6500.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('288', '219', '757', '包', '1560.000000', '1560.000000', '10.000000', '10.000000', '15600.000000', '', null, null, '16', null, '0.000000', '0.000000', '15600.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('289', '219', '758', '包', '300.000000', '300.000000', '14.000000', '14.000000', '4200.000000', '', null, null, '16', null, '0.000000', '0.000000', '4200.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('290', '219', '760', '包', '180.000000', '180.000000', '5.500000', '5.500000', '990.000000', '', null, null, '16', null, '0.000000', '0.000000', '990.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('291', '220', '755', '包', '9120.000000', '9120.000000', '2.500000', '2.500000', '22800.000000', '来自订单', null, null, '16', null, '0.000000', '0.000000', '22800.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('292', '220', '756', '包', '8910.000000', '8910.000000', '4.300000', '4.300000', '38313.000000', '来自订单', null, null, '16', null, '0.000000', '0.000000', '38313.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('293', '220', '759', '包', '2600.000000', '2600.000000', '2.500000', '2.500000', '6500.000000', '来自订单', null, null, '16', null, '0.000000', '0.000000', '6500.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('294', '220', '757', '包', '1560.000000', '1560.000000', '10.000000', '10.000000', '15600.000000', '来自订单', null, null, '16', null, '0.000000', '0.000000', '15600.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('295', '220', '758', '包', '300.000000', '300.000000', '14.000000', '14.000000', '4200.000000', '来自订单', null, null, '16', null, '0.000000', '0.000000', '4200.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('296', '220', '760', '包', '180.000000', '180.000000', '5.500000', '5.500000', '990.000000', '来自订单', null, null, '16', null, '0.000000', '0.000000', '990.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('297', '221', '785', '本', '640.000000', '640.000000', '1.200000', '1.200000', '768.000000', '', null, null, '16', null, '0.000000', '0.000000', '768.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('298', '221', '784', '袋', '400.000000', '400.000000', '1.900000', '1.900000', '760.000000', '', null, null, '16', null, '0.000000', '0.000000', '760.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('299', '221', '783', '袋', '1080.000000', '1080.000000', '1.900000', '1.900000', '2052.000000', '', null, null, '16', null, '0.000000', '0.000000', '2052.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('300', '221', '782', '袋', '1200.000000', '1200.000000', '1.650000', '1.650000', '1980.000000', '', null, null, '16', null, '0.000000', '0.000000', '1980.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('301', '222', '786', '个', '276.000000', '276.000000', '6.500000', '6.500000', '1794.000000', '', null, null, '16', null, '0.000000', '0.000000', '1794.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('302', '223', '796', '个', '520.000000', '520.000000', '4.300000', '4.300000', '2236.000000', '', null, null, '16', null, '0.000000', '0.000000', '2236.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('303', '223', '795', '包', '520.000000', '520.000000', '4.300000', '4.300000', '2236.000000', '', null, null, '16', null, '0.000000', '0.000000', '2236.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('304', '223', '794', '个', '260.000000', '260.000000', '4.300000', '4.300000', '1118.000000', '', null, null, '16', null, '0.000000', '0.000000', '1118.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('305', '223', '793', '个', '520.000000', '520.000000', '4.300000', '4.300000', '2236.000000', '', null, null, '16', null, '0.000000', '0.000000', '2236.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('306', '223', '792', '包', '240.000000', '240.000000', '4.400000', '4.400000', '1056.000000', '', null, null, '16', null, '0.000000', '0.000000', '1056.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('307', '223', '791', '包', '240.000000', '240.000000', '4.400000', '4.400000', '1056.000000', '', null, null, '16', null, '0.000000', '0.000000', '1056.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('308', '223', '790', '包', '255.000000', '255.000000', '5.400000', '5.400000', '1377.000000', '', null, null, '16', null, '0.000000', '0.000000', '1377.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('309', '223', '789', '包', '255.000000', '255.000000', '5.400000', '5.400000', '1377.000000', '', null, null, '16', null, '0.000000', '0.000000', '1377.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('310', '223', '788', '包', '250.000000', '250.000000', '7.900000', '7.900000', '1975.000000', '', null, null, '16', null, '0.000000', '0.000000', '1975.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('311', '223', '787', '包', '150.000000', '150.000000', '8.500000', '8.500000', '1275.000000', '', null, null, '16', null, '0.000000', '0.000000', '1275.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('312', '223', '797', '包', '225.000000', '225.000000', '12.000000', '12.000000', '2700.000000', '', null, null, '16', null, '0.000000', '0.000000', '2700.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('313', '225', '805', '个', '200.000000', '200.000000', '2.200000', '2.200000', '440.000000', '', null, null, '16', null, '0.000000', '0.000000', '440.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('317', '229', '802', '个', '5000.000000', '5000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '16', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('318', '230', '804', '包', '300.000000', '300.000000', '1.000000', '1.000000', '300.000000', '', null, null, '16', null, '0.000000', '0.000000', '300.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('319', '230', '803', '包', '300.000000', '300.000000', '2.000000', '2.000000', '600.000000', '', null, null, '16', null, '0.000000', '0.000000', '600.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('320', '230', '798', '包', '200.000000', '200.000000', '0.000000', '0.000000', '0.000000', '', null, null, '16', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('321', '230', '799', '包', '200.000000', '200.000000', '0.000000', '0.000000', '0.000000', '', null, null, '16', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('322', '230', '800', '包', '800.000000', '800.000000', '8.000000', '8.000000', '6400.000000', '', null, null, '16', null, '0.000000', '0.000000', '6400.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('323', '230', '801', '包', '200.000000', '200.000000', '0.000000', '0.000000', '0.000000', '', null, null, '16', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('330', '232', '631', '套', '300.000000', '300.000000', '5.500000', '5.500000', '1650.000000', '', null, null, '16', null, '0.000000', '0.000000', '1650.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('331', '233', '805', '个', '30.000000', '30.000000', '3.500000', '3.500000', '105.000000', '', null, null, '16', null, '0.000000', '0.000000', '105.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('332', '233', '804', '包', '30.000000', '30.000000', '1.500000', '1.500000', '45.000000', '', null, null, '16', null, '0.000000', '0.000000', '45.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('333', '233', '803', '包', '20.000000', '20.000000', '2.800000', '2.800000', '56.000000', '', null, null, '16', null, '0.000000', '0.000000', '56.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('334', '233', '802', '个', '36.000000', '36.000000', '1.000000', '1.000000', '36.000000', '', null, null, '16', null, '0.000000', '0.000000', '36.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('335', '233', '800', '包', '5.000000', '5.000000', '15.000000', '15.000000', '75.000000', '', null, null, '16', null, '0.000000', '0.000000', '75.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('336', '233', '801', '包', '10.000000', '10.000000', '8.500000', '8.500000', '85.000000', '', null, null, '16', null, '0.000000', '0.000000', '85.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('337', '233', '631', '套', '10.000000', '10.000000', '10.000000', '10.000000', '100.000000', '', null, null, '16', null, '0.000000', '0.000000', '100.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('338', '233', '798', '包', '20.000000', '20.000000', '3.000000', '3.000000', '60.000000', '', null, null, '16', null, '0.000000', '0.000000', '60.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('339', '233', '799', '包', '20.000000', '20.000000', '1.500000', '1.500000', '30.000000', '', null, null, '16', null, '0.000000', '0.000000', '30.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('340', '234', '758', '包', '30.000000', '30.000000', '20.000000', '20.000000', '600.000000', '', null, null, '16', null, '0.000000', '0.000000', '600.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('341', '234', '757', '包', '50.000000', '50.000000', '15.000000', '15.000000', '750.000000', '', null, null, '16', null, '0.000000', '0.000000', '750.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('342', '234', '756', '包', '330.000000', '330.000000', '7.500000', '7.500000', '2475.000000', '', null, null, '16', null, '0.000000', '0.000000', '2475.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('343', '234', '755', '包', '480.000000', '480.000000', '4.500000', '4.500000', '2160.000000', '', null, null, '16', null, '0.000000', '0.000000', '2160.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('344', '234', '759', '包', '440.000000', '440.000000', '4.500000', '4.500000', '1980.000000', '', null, null, '16', null, '0.000000', '0.000000', '1980.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('345', '234', '760', '包', '20.000000', '20.000000', '8.500000', '8.500000', '170.000000', '', null, null, '16', null, '0.000000', '0.000000', '170.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('346', '235', '765', '盒', '24.000000', '24.000000', '4.800000', '4.800000', '115.200000', '', null, null, '17', null, '0.000000', '0.000000', '115.200000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('347', '235', '780', '盒', '24.000000', '24.000000', '4.000000', '4.000000', '96.000000', '', null, null, '17', null, '0.000000', '0.000000', '96.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('348', '235', '767', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('349', '235', '768', '盒', '12.000000', '12.000000', '5.500000', '5.500000', '66.000000', '', null, null, '17', null, '0.000000', '0.000000', '66.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('350', '235', '776', '盒', '36.000000', '36.000000', '9.500000', '9.500000', '342.000000', '', null, null, '17', null, '0.000000', '0.000000', '342.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('351', '235', '777', '盒', '12.000000', '12.000000', '10.500000', '10.500000', '126.000000', '', null, null, '17', null, '0.000000', '0.000000', '126.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('352', '239', '623', '刀', '1500.000000', '1500.000000', '3.300000', '3.300000', '4950.000000', '', null, null, '16', null, '0.000000', '0.000000', '4950.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('353', '239', '622', '刀', '2250.000000', '2250.000000', '2.900000', '2.900000', '6525.000000', '', null, null, '16', null, '0.000000', '0.000000', '6525.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('354', '242', '805', '个', '170.000000', '170.000000', '3.500000', '3.500000', '595.000000', '', null, null, '16', null, '0.000000', '0.000000', '595.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('355', '246', '765', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('356', '246', '780', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('357', '246', '766', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('358', '246', '767', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('359', '246', '768', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('360', '246', '769', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('361', '246', '770', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('362', '246', '771', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('363', '246', '772', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('364', '246', '773', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('365', '246', '774', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('366', '246', '775', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('367', '246', '777', '盒', '11000.000000', '11000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('368', '246', '776', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('369', '246', '778', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('370', '246', '779', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('371', '247', '765', '盒', '24.000000', '24.000000', '4.800000', '4.800000', '115.200000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '115.200000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('372', '247', '780', '盒', '24.000000', '24.000000', '4.000000', '4.000000', '96.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '96.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('373', '247', '767', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('374', '247', '768', '盒', '12.000000', '12.000000', '5.500000', '5.500000', '66.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '66.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('375', '247', '776', '盒', '36.000000', '36.000000', '9.500000', '9.500000', '342.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '342.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('376', '247', '777', '盒', '12.000000', '12.000000', '10.500000', '10.500000', '126.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '126.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('377', '246', '781', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('378', '246', '764', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('379', '251', '764', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('380', '251', '765', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('381', '251', '766', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('382', '251', '767', '盒', '12.000000', '12.000000', '4.800000', '4.800000', '57.600000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '57.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('383', '251', '769', '盒', '12.000000', '12.000000', '5.500000', '5.500000', '66.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '66.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('384', '251', '770', '盒', '12.000000', '12.000000', '5.800000', '5.800000', '69.600000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '69.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('385', '251', '771', '盒', '12.000000', '12.000000', '5.800000', '5.800000', '69.600000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '69.600000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('386', '251', '772', '盒', '10.000000', '10.000000', '9.500000', '9.500000', '95.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '95.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('387', '251', '773', '盒', '12.000000', '12.000000', '9.500000', '9.500000', '114.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '114.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('388', '251', '774', '盒', '12.000000', '12.000000', '9.500000', '9.500000', '114.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '114.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('389', '251', '775', '盒', '12.000000', '12.000000', '9.500000', '9.500000', '114.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '114.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('390', '251', '776', '盒', '12.000000', '12.000000', '9.500000', '9.500000', '114.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '114.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('391', '251', '777', '盒', '12.000000', '12.000000', '10.500000', '10.500000', '126.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '126.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('392', '251', '778', '盒', '12.000000', '12.000000', '10.500000', '10.500000', '126.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '126.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('393', '251', '781', '盒', '10.000000', '10.000000', '9.500000', '9.500000', '95.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '95.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('394', '252', '803', '包', '100000.000000', '100000.000000', '2.000000', '2.000000', '200000.000000', '', null, null, '17', null, '0.000000', '0.000000', '200000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('395', '253', '803', '包', '200.000000', '200.000000', '2.800000', '2.800000', '560.000000', '', null, null, '16', null, '0.000000', '0.000000', '560.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('396', '254', '803', '包', '200.000000', '200.000000', '2.800000', '2.800000', '560.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '560.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('397', '255', '803', '包', '200.000000', '200.000000', '2.800000', '2.800000', '560.000000', '来自订单', null, null, '16', null, '0.000000', '0.000000', '560.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('398', '256', '806', '个', '100000.000000', '100000.000000', '0.600000', '0.600000', '60000.000000', '', null, null, '17', null, '0.000000', '0.000000', '60000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('399', '257', '673', '支', '50.000000', '50.000000', '4.500000', '4.500000', '225.000000', '', null, null, '17', null, '0.000000', '0.000000', '225.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('400', '257', '807', '盒', '36.000000', '36.000000', '8.500000', '8.500000', '306.000000', '', null, null, '17', null, '0.000000', '0.000000', '306.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('401', '257', '808', '瓶', '20.000000', '20.000000', '2.000000', '2.000000', '40.000000', '', null, null, '17', null, '0.000000', '0.000000', '40.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('402', '257', '712', '瓶', '20.000000', '20.000000', '4.500000', '4.500000', '90.000000', '', null, null, '17', null, '0.000000', '0.000000', '90.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('403', '257', '798', '包', '50.000000', '50.000000', '3.000000', '3.000000', '150.000000', '', null, null, '17', null, '0.000000', '0.000000', '150.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('404', '257', '809', '张', '50.000000', '50.000000', '1.500000', '1.500000', '75.000000', '', null, null, '17', null, '0.000000', '0.000000', '75.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('405', '257', '611', '盒', '5.000000', '5.000000', '8.000000', '8.000000', '40.000000', '', null, null, '17', null, '0.000000', '0.000000', '40.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('406', '257', '612', '盒', '5.000000', '5.000000', '9.500000', '9.500000', '47.500000', '', null, null, '17', null, '0.000000', '0.000000', '47.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('407', '257', '613', '盒', '5.000000', '5.000000', '11.500000', '11.500000', '57.500000', '', null, null, '17', null, '0.000000', '0.000000', '57.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('408', '257', '614', '盒', '2.000000', '2.000000', '16.000000', '16.000000', '32.000000', '', null, null, '17', null, '0.000000', '0.000000', '32.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('409', '257', '615', '盒', '2.000000', '2.000000', '22.000000', '22.000000', '44.000000', '', null, null, '17', null, '0.000000', '0.000000', '44.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('410', '259', '806', '个', '50.000000', '50.000000', '1.000000', '1.000000', '50.000000', '', null, null, '16', null, '0.000000', '0.000000', '50.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('411', '261', '806', '个', '100000.000000', '100000.000000', '0.600000', '0.600000', '60000.000000', '', null, null, '16', null, '0.000000', '0.000000', '60000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('412', '262', '806', '个', '50.000000', '50.000000', '1.000000', '1.000000', '50.000000', '来自订单', null, null, '16', null, '0.000000', '0.000000', '50.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('413', '263', '714', '瓶', '100000.000000', '100000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('414', '264', '811', '瓶', '100000.000000', '100000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '16', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('415', '265', '712', '瓶', '100.000000', '100.000000', '4.500000', '4.500000', '450.000000', '', null, null, '17', null, '0.000000', '0.000000', '450.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('416', '265', '714', '瓶', '60.000000', '60.000000', '11.500000', '11.500000', '690.000000', '', null, null, '17', null, '0.000000', '0.000000', '690.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('417', '265', '811', '瓶', '60.000000', '60.000000', '8.500000', '8.500000', '510.000000', '', null, null, '17', null, '0.000000', '0.000000', '510.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('418', '267', '813', '套', '10000.000000', '10000.000000', '17.000000', '17.000000', '170000.000000', '', null, null, '16', null, '0.000000', '0.000000', '170000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('419', '268', '813', '套', '10000.000000', '10000.000000', '17.000000', '17.000000', '170000.000000', '', null, null, '16', null, '0.000000', '0.000000', '170000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('420', '269', '813', '套', '10.000000', '10.000000', '22.000000', '22.000000', '220.000000', '', null, null, '16', null, '0.000000', '0.000000', '220.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('421', '270', '813', '套', '10.000000', '10.000000', '22.000000', '22.000000', '220.000000', '来自订单', null, null, '16', null, '0.000000', '0.000000', '220.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('422', '271', '814', '盒', '6.000000', '6.000000', '39.000000', '39.000000', '234.000000', '', null, null, '17', null, '0.000000', '0.000000', '234.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('423', '271', '818', '盒', '12.000000', '12.000000', '12.500000', '12.500000', '150.000000', '', null, null, '17', null, '0.000000', '0.000000', '150.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('424', '271', '820', '盒', '6.000000', '6.000000', '28.500000', '28.500000', '171.000000', '', null, null, '17', null, '0.000000', '0.000000', '171.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('425', '271', '618', '本', '20.000000', '20.000000', '7.000000', '7.000000', '140.000000', '', null, null, '17', null, '0.000000', '0.000000', '140.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('426', '271', '637', '瓶', '15.000000', '15.000000', '9.500000', '9.500000', '142.500000', '', null, null, '17', null, '0.000000', '0.000000', '142.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('427', '272', '637', '瓶', '100000.000000', '100000.000000', '7.500000', '7.500000', '750000.000000', '', null, null, '17', null, '0.000000', '0.000000', '750000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('430', '275', '820', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('431', '275', '819', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('432', '275', '818', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('433', '275', '817', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('434', '275', '816', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('435', '275', '815', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('436', '275', '814', '盒', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('437', '275', '618', '本', '10000.000000', '10000.000000', '4.000000', '4.000000', '40000.000000', '', null, null, '17', null, '0.000000', '0.000000', '40000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('438', '276', '814', '盒', '6.000000', '6.000000', '39.000000', '39.000000', '234.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '234.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('439', '276', '818', '盒', '12.000000', '12.000000', '12.500000', '12.500000', '150.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '150.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('440', '276', '820', '盒', '6.000000', '6.000000', '28.500000', '28.500000', '171.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '171.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('441', '276', '618', '本', '20.000000', '20.000000', '7.000000', '7.000000', '140.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '140.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('442', '276', '637', '瓶', '15.000000', '15.000000', '9.500000', '9.500000', '142.500000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '142.500000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('443', '280', '811', '瓶', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('444', '280', '812', '瓶', '10000.000000', '10000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('445', '280', '712', '瓶', '10000.000000', '10000.000000', '4.600000', '4.600000', '46000.000000', '', null, null, '17', null, '0.000000', '0.000000', '46000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('447', '282', '712', '瓶', '100.000000', '100.000000', '4.500000', '4.500000', '450.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '450.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('448', '282', '714', '瓶', '60.000000', '60.000000', '11.500000', '11.500000', '690.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '690.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('449', '282', '811', '瓶', '60.000000', '60.000000', '8.500000', '8.500000', '510.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '510.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('450', '284', '673', '支', '1000000.000000', '1000000.000000', '3.200000', '3.200000', '3200000.000000', '', null, null, '17', null, '0.000000', '0.000000', '3200000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('451', '285', '621', '个', '100000.000000', '100000.000000', '2.700000', '2.700000', '270000.000000', '', null, null, '17', null, '0.000000', '0.000000', '270000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('452', '285', '698', '支', '100000.000000', '100000.000000', '1.500000', '1.500000', '150000.000000', '', null, null, '17', null, '0.000000', '0.000000', '150000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('453', '285', '697', '支', '100000.000000', '100000.000000', '1.500000', '1.500000', '150000.000000', '', null, null, '17', null, '0.000000', '0.000000', '150000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('454', '285', '696', '支', '100000.000000', '100000.000000', '1.500000', '1.500000', '150000.000000', '', null, null, '17', null, '0.000000', '0.000000', '150000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('456', '287', '630', '刀', '10000.000000', '10000.000000', '22.000000', '22.000000', '220000.000000', '', null, null, '17', null, '0.000000', '0.000000', '220000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('457', '287', '629', '刀', '10000.000000', '10000.000000', '10.000000', '10.000000', '100000.000000', '', null, null, '17', null, '0.000000', '0.000000', '100000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('458', '287', '628', '包', '100000.000000', '100000.000000', '1.250000', '1.250000', '125000.000000', '', null, null, '17', null, '0.000000', '0.000000', '125000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('459', '287', '627', '包', '1000000.000000', '1000000.000000', '5.000000', '5.000000', '5000000.000000', '', null, null, '17', null, '0.000000', '0.000000', '5000000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('460', '287', '626', '包', '1000000.000000', '1000000.000000', '6.000000', '6.000000', '6000000.000000', '', null, null, '17', null, '0.000000', '0.000000', '6000000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('461', '287', '625', '包', '100000.000000', '100000.000000', '3.800000', '3.800000', '380000.000000', '', null, null, '17', null, '0.000000', '0.000000', '380000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('462', '287', '624', '包', '100000.000000', '100000.000000', '3.800000', '3.800000', '380000.000000', '', null, null, '17', null, '0.000000', '0.000000', '380000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('463', '287', '622', '刀', '1000000.000000', '1000000.000000', '3.600000', '3.600000', '3600000.000000', '', null, null, '17', null, '0.000000', '0.000000', '3600000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('464', '287', '623', '刀', '1000000.000000', '1000000.000000', '3.600000', '3.600000', '3600000.000000', '', null, null, '17', null, '0.000000', '0.000000', '3600000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('465', '287', '616', '包', '100000.000000', '100000.000000', '1.200000', '1.200000', '120000.000000', '', null, null, '17', null, '0.000000', '0.000000', '120000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('466', '287', '609', '包', '100000.000000', '100000.000000', '1.200000', '1.200000', '120000.000000', '', null, null, '17', null, '0.000000', '0.000000', '120000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('467', '288', '624', '包', '40.000000', '40.000000', '5.500000', '5.500000', '220.000000', '', null, null, '17', null, '0.000000', '0.000000', '220.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('468', '289', '624', '包', '40.000000', '40.000000', '5.500000', '5.500000', '220.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '220.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('469', '290', '822', '瓶', '100000.000000', '100000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '17', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('470', '290', '821', '瓶', '100000.000000', '100000.000000', '15.500000', '15.500000', '1550000.000000', '', null, null, '17', null, '0.000000', '0.000000', '1550000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('471', '291', '822', '瓶', '360.000000', '360.000000', '10.000000', '10.000000', '3600.000000', '', null, null, '17', null, '0.000000', '0.000000', '3600.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('472', '291', '821', '瓶', '576.000000', '576.000000', '16.000000', '16.000000', '9216.000000', '', null, null, '17', null, '0.000000', '0.000000', '9216.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('473', '292', '822', '瓶', '360.000000', '360.000000', '10.000000', '10.000000', '3600.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '3600.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('474', '292', '821', '瓶', '576.000000', '576.000000', '16.000000', '16.000000', '9216.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '9216.000000', '', '', '', '', '', '', '63', '1');
INSERT INTO `jsh_depotitem` VALUES ('475', '293', '822', '瓶', '360.000000', '360.000000', '10.000000', '10.000000', '3600.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '3600.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('476', '293', '821', '瓶', '576.000000', '576.000000', '16.000000', '16.000000', '9216.000000', '来自订单', null, null, '17', null, '0.000000', '0.000000', '9216.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('478', '295', '807', '盒', '10000.000000', '10000.000000', '8.000000', '8.000000', '80000.000000', '', null, null, '17', null, '0.000000', '0.000000', '80000.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('483', '299', '823', '包', '100000.000000', '100000.000000', '0.000000', '0.000000', '0.000000', '', null, null, '16', null, '0.000000', '0.000000', '0.000000', '', '', '', '', '', '', '63', '0');
INSERT INTO `jsh_depotitem` VALUES ('484', '303', '823', '包', '55.000000', '55.000000', '5.000000', '5.000000', '275.000000', '', null, null, '16', null, '0.000000', '0.000000', '275.000000', '', '', '', '', '', '', '63', '0');

-- ----------------------------
-- Table structure for jsh_functions
-- ----------------------------
DROP TABLE IF EXISTS `jsh_functions`;
CREATE TABLE `jsh_functions` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Number` varchar(50) DEFAULT NULL COMMENT '编号',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `PNumber` varchar(50) DEFAULT NULL COMMENT '上级编号',
  `URL` varchar(100) DEFAULT NULL COMMENT '链接',
  `State` bit(1) DEFAULT NULL COMMENT '收缩',
  `Sort` varchar(50) DEFAULT NULL COMMENT '排序',
  `Enabled` bit(1) DEFAULT NULL COMMENT '启用',
  `Type` varchar(50) DEFAULT NULL COMMENT '类型',
  `PushBtn` varchar(50) DEFAULT NULL COMMENT '功能按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Records of jsh_functions
-- ----------------------------
INSERT INTO `jsh_functions` VALUES ('1', '0001', '系统管理', '0', '', '', '0910', '', '电脑版', '', 'icon-settings', '0');
INSERT INTO `jsh_functions` VALUES ('13', '000102', '角色管理', '0001', '/pages/manage/role.html', '\0', '0130', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('14', '000103', '用户管理', '0001', '/pages/manage/user.html', '\0', '0140', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('15', '000104', '日志管理', '0001', '/pages/manage/log.html', '\0', '0160', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('16', '000105', '功能管理', '0001', '/pages/manage/functions.html', '\0', '0135', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('21', '0101', '商品管理', '0', '', '\0', '0620', '', '电脑版', null, 'icon-social-dropbox', '0');
INSERT INTO `jsh_functions` VALUES ('22', '010101', '商品类别', '0101', '/pages/materials/materialcategory.html', '\0', '0230', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('23', '010102', '商品信息', '0101', '/pages/materials/material.html', '\0', '0240', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('24', '0102', '基本资料', '0', '', '\0', '0750', '', '电脑版', null, 'icon-grid', '0');
INSERT INTO `jsh_functions` VALUES ('25', '01020101', '供应商信息', '0102', '/pages/manage/vendor.html', '\0', '0260', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('26', '010202', '仓库信息', '0102', '/pages/manage/depot.html', '\0', '0270', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('31', '010206', '经手人管理', '0102', '/pages/materials/person.html', '\0', '0284', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('32', '0502', '采购管理', '0', '', '\0', '0330', '', '电脑版', '', 'icon-loop', '0');
INSERT INTO `jsh_functions` VALUES ('33', '050201', '采购入库', '0502', '/pages/materials/purchase_in_list.html', '\0', '0340', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('38', '0603', '销售管理', '0', '', '\0', '0390', '', '电脑版', '', 'icon-briefcase', '0');
INSERT INTO `jsh_functions` VALUES ('40', '080107', '调拨出库', '0801', '/pages/materials/allocation_out_list.html', '\0', '0807', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('41', '060303', '销售出库', '0603', '/pages/materials/sale_out_list.html', '\0', '0394', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('44', '0704', '财务管理', '0', '', '\0', '0450', '', '电脑版', '', 'icon-map', '0');
INSERT INTO `jsh_functions` VALUES ('59', '030101', '库存状况', '0301', '/pages/reports/in_out_stock_report.html', '\0', '0600', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('194', '010204', '收支项目', '0102', '/pages/manage/inOutItem.html', '\0', '0282', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('195', '010205', '结算账户', '0102', '/pages/manage/account.html', '\0', '0283', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('197', '070402', '收入单', '0704', '/pages/financial/item_in.html', '\0', '0465', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('198', '0301', '报表查询', '0', '', '\0', '0570', '', '电脑版', null, 'icon-pie-chart', '0');
INSERT INTO `jsh_functions` VALUES ('199', '050204', '采购退货', '0502', '/pages/materials/purchase_back_list.html', '\0', '0345', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('200', '060305', '销售退货', '0603', '/pages/materials/sale_back_list.html', '\0', '0396', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('201', '080103', '其它入库', '0801', '/pages/materials/other_in_list.html', '\0', '0803', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('202', '080105', '其它出库', '0801', '/pages/materials/other_out_list.html', '\0', '0805', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('203', '070403', '支出单', '0704', '/pages/financial/item_out.html', '\0', '0470', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('204', '070404', '收款单', '0704', '/pages/financial/money_in.html', '\0', '0475', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('205', '070405', '付款单', '0704', '/pages/financial/money_out.html', '\0', '0480', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('206', '070406', '转账单', '0704', '/pages/financial/giro.html', '\0', '0490', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('207', '030102', '结算账户', '0301', '/pages/reports/account_report.html', '\0', '0610', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('208', '030103', '进货统计', '0301', '/pages/reports/buy_in_report.html', '\0', '0620', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('209', '030104', '销售统计', '0301', '/pages/reports/sale_out_report.html', '\0', '0630', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('210', '040102', '零售出库', '0401', '/pages/materials/retail_out_list.html', '\0', '0405', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('211', '040104', '零售退货', '0401', '/pages/materials/retail_back_list.html', '\0', '0407', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('212', '070407', '收预付款', '0704', '/pages/financial/advance_in.html', '\0', '0495', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('217', '01020102', '客户信息', '0102', '/pages/manage/customer.html', '\0', '0262', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('218', '01020103', '会员信息', '0102', '/pages/manage/member.html', '\0', '0263', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('219', '000107', '资产管理', '0001', '/pages/asset/asset.html', '\0', '0170', '\0', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('220', '010103', '计量单位', '0101', '/pages/manage/unit.html', '\0', '0245', '', '电脑版', null, 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('225', '0401', '零售管理', '0', '', '\0', '0101', '', '电脑版', '', 'icon-present', '0');
INSERT INTO `jsh_functions` VALUES ('226', '030106', '入库明细', '0301', '/pages/reports/in_detail.html', '\0', '0640', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('227', '030107', '出库明细', '0301', '/pages/reports/out_detail.html', '\0', '0645', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('228', '030108', '入库汇总', '0301', '/pages/reports/in_material_count.html', '\0', '0650', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('229', '030109', '出库汇总', '0301', '/pages/reports/out_material_count.html', '\0', '0655', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('232', '080109', '组装单', '0801', '/pages/materials/assemble_list.html', '\0', '0809', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('233', '080111', '拆卸单', '0801', '/pages/materials/disassemble_list.html', '\0', '0811', '', '电脑版', '3,4,5', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('234', '000105', '系统配置', '0001', '/pages/manage/systemConfig.html', '\0', '0165', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('235', '030110', '客户对账', '0301', '/pages/reports/customer_account.html', '\0', '0660', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('236', '000106', '商品属性', '0001', '/pages/materials/materialProperty.html', '\0', '0168', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('237', '030111', '供应商对账', '0301', '/pages/reports/vendor_account.html', '\0', '0665', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('239', '0801', '仓库管理', '0', '', '\0', '0420', '', '电脑版', '', 'icon-layers', '0');
INSERT INTO `jsh_functions` VALUES ('240', '010104', '序列号', '0101', '/pages/manage/serialNumber.html', '\0', '0246', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('241', '050202', '采购订单', '0502', '/pages/materials/purchase_orders_list.html', '\0', '0335', '', '电脑版', '3', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('242', '060301', '销售订单', '0603', '/pages/materials/sale_orders_list.html', '\0', '0392', '', '电脑版', '3', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('243', '000108', '机构管理', '0001', '/pages/manage/organization.html', '', '0139', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_functions` VALUES ('244', '030112', '库存预警', '0301', '/pages/reports/stock_warning_report.html', '\0', '0670', '', '电脑版', '', 'icon-notebook', '0');

-- ----------------------------
-- Table structure for jsh_inoutitem
-- ----------------------------
DROP TABLE IF EXISTS `jsh_inoutitem`;
CREATE TABLE `jsh_inoutitem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `Type` varchar(20) DEFAULT NULL COMMENT '类型',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='收支项目';

-- ----------------------------
-- Records of jsh_inoutitem
-- ----------------------------
INSERT INTO `jsh_inoutitem` VALUES ('1', '办公耗材', '支出', '办公耗材', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('5', '房租收入', '收入', '房租收入', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('7', '利息收入', '收入', '利息收入', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('8', '水电费', '支出', '水电费水电费', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('9', '快递费', '支出', '快递费', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('10', '交通报销费', '支出', '交通报销费', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('11', '差旅费', '支出', '差旅费', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('12', '全车贴膜-普通', '收入', '', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('13', '全车贴膜-高档', '收入', '', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('14', '洗车', '收入', '', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('15', '保养汽车', '收入', '', null, '1');
INSERT INTO `jsh_inoutitem` VALUES ('16', '收入项目1', '收入', '', '1', '0');
INSERT INTO `jsh_inoutitem` VALUES ('17', '支出项目1', '支出', '', '1', '0');
INSERT INTO `jsh_inoutitem` VALUES ('18', '收入1', '收入', '', '117', '1');
INSERT INTO `jsh_inoutitem` VALUES ('19', '支出1', '支出', '', '117', '1');
INSERT INTO `jsh_inoutitem` VALUES ('20', '支出2', '支出', '', '117', '1');

-- ----------------------------
-- Table structure for jsh_log
-- ----------------------------
DROP TABLE IF EXISTS `jsh_log`;
CREATE TABLE `jsh_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userID` bigint(20) NOT NULL COMMENT '操作用户ID',
  `operation` varchar(500) DEFAULT NULL COMMENT '操作模块名称',
  `clientIP` varchar(50) DEFAULT NULL COMMENT '客户端IP',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '操作状态 0==成功，1==失败',
  `contentdetails` varchar(1000) DEFAULT NULL COMMENT '操作详情',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`),
  KEY `FKF2696AA13E226853` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=7551 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of jsh_log
-- ----------------------------
INSERT INTO `jsh_log` VALUES ('1722', '63', '登录系统', '192.168.1.104', '2016-11-27 13:17:17', '0', '管理用户：jsh 登录系统', 'jsh 登录系统', null);
INSERT INTO `jsh_log` VALUES ('1723', '63', '登录系统', '192.168.1.104', '2016-11-27 13:17:30', '0', '管理用户：jsh 登录系统', 'jsh 登录系统', null);
INSERT INTO `jsh_log` VALUES ('1724', '63', '退出系统', '192.168.1.104', '2016-11-27 13:17:48', '0', '管理用户：jsh 退出系统', 'jsh 退出系统', null);
INSERT INTO `jsh_log` VALUES ('1725', '65', '登录系统', '192.168.1.104', '2016-11-27 13:17:52', '0', '管理用户：ls 登录系统', 'ls 登录系统', null);
INSERT INTO `jsh_log` VALUES ('1726', '65', '退出系统', '192.168.1.104', '2016-11-27 13:18:18', '0', '管理用户：ls 退出系统', 'ls 退出系统', null);
INSERT INTO `jsh_log` VALUES ('1727', '63', '登录系统', '192.168.1.104', '2016-11-27 13:18:22', '0', '管理用户：jsh 登录系统', 'jsh 登录系统', null);
INSERT INTO `jsh_log` VALUES ('1728', '63', '更新UserBusiness', '192.168.1.104', '2016-11-27 13:18:44', '0', '更新UserBusiness的ID为  6 成功！', '更新UserBusiness成功', null);
INSERT INTO `jsh_log` VALUES ('1729', '63', '退出系统', '192.168.1.104', '2016-11-27 13:18:48', '0', '管理用户：jsh 退出系统', 'jsh 退出系统', null);
INSERT INTO `jsh_log` VALUES ('1730', '65', '登录系统', '192.168.1.104', '2016-11-27 13:18:53', '0', '管理用户：ls 登录系统', 'ls 登录系统', null);
INSERT INTO `jsh_log` VALUES ('1731', '63', '登录系统', '192.168.1.104', '2016-12-04 10:38:50', '0', '管理用户：jsh 登录系统', 'jsh 登录系统', null);
INSERT INTO `jsh_log` VALUES ('1732', '63', '增加物料', '192.168.1.104', '2016-12-04 10:40:52', '0', '增加物料名称为  11 成功！', '增加物料成功', null);
INSERT INTO `jsh_log` VALUES ('1733', '63', '更新物料', '192.168.1.104', '2016-12-04 10:59:57', '0', '更新物料ID为  499 成功！', '更新物料成功', null);
INSERT INTO `jsh_log` VALUES ('1734', '63', '更新物料', '192.168.1.104', '2016-12-04 11:00:13', '0', '更新物料ID为  499 成功！', '更新物料成功', null);
INSERT INTO `jsh_log` VALUES ('1735', '63', '删除物料', '192.168.1.104', '2016-12-04 11:00:38', '0', '删除物料ID为  499 成功！', '删除物料成功', null);
INSERT INTO `jsh_log` VALUES ('1736', '63', '增加物料', '192.168.1.104', '2016-12-04 11:02:35', '0', '增加物料名称为  11 成功！', '增加物料成功', null);
INSERT INTO `jsh_log` VALUES ('1737', '63', '批量删除物料', '192.168.1.104', '2016-12-04 11:02:41', '0', '批量删除物料ID为  500 成功！', '批量删除物料成功', null);
INSERT INTO `jsh_log` VALUES ('1738', '63', '更新功能', '192.168.1.104', '2016-12-04 11:04:43', '0', '更新功能ID为  26 成功！', '更新功能成功', null);
INSERT INTO `jsh_log` VALUES ('1739', '63', '增加供应商', '192.168.1.104', '2016-12-04 11:38:13', '0', '增加供应商名称为  aa 成功！', '增加供应商成功', null);
INSERT INTO `jsh_log` VALUES ('1740', '63', '增加供应商', '192.168.1.104', '2016-12-04 11:48:36', '0', '增加供应商名称为  aaaa 成功！', '增加供应商成功', null);
INSERT INTO `jsh_log` VALUES ('1741', '63', '删除供应商', '192.168.1.104', '2016-12-04 11:48:53', '0', '删除供应商ID为  3,名称为  aa成功！', '删除供应商成功', null);
INSERT INTO `jsh_log` VALUES ('1742', '63', '更新供应商', '192.168.1.104', '2016-12-04 11:48:59', '0', '更新供应商ID为  4 成功！', '更新供应商成功', null);
INSERT INTO `jsh_log` VALUES ('5852', '63', '单据', '127.0.0.1', '2019-03-09 15:49:57', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5853', '63', '商品', '127.0.0.1', '2019-03-09 15:50:31', '0', '新增商品', '新增商品', null);
INSERT INTO `jsh_log` VALUES ('5854', '63', '商品', '127.0.0.1', '2019-03-09 15:50:49', '0', '更新,id:563商品', '更新,id:563商品', null);
INSERT INTO `jsh_log` VALUES ('5855', '63', '单据', '127.0.0.1', '2019-03-09 15:52:06', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5856', '63', '单据', '127.0.0.1', '2019-03-09 15:52:21', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5857', '63', '单据', '127.0.0.1', '2019-03-09 15:53:07', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5858', '63', '单据', '127.0.0.1', '2019-03-09 15:57:26', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5859', '63', '商品', '127.0.0.1', '2019-03-09 16:00:18', '0', '更新,id:562商品', '更新,id:562商品', null);
INSERT INTO `jsh_log` VALUES ('5860', '63', '商品', '127.0.0.1', '2019-03-09 16:01:17', '0', '更新,id:562商品', '更新,id:562商品', null);
INSERT INTO `jsh_log` VALUES ('5861', '63', '单据', '127.0.0.1', '2019-03-09 16:02:30', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5862', '63', '功能', '127.0.0.1', '2019-03-09 16:10:29', '0', '更新,id:241功能', '更新,id:241功能', null);
INSERT INTO `jsh_log` VALUES ('5863', '63', '单据', '127.0.0.1', '2019-03-09 16:27:38', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5864', '63', '单据', '127.0.0.1', '2019-03-09 16:35:53', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5865', '63', '单据', '127.0.0.1', '2019-03-09 16:37:34', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5866', '63', '单据', '127.0.0.1', '2019-03-09 16:38:03', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5867', '63', '商品', '127.0.0.1', '2019-03-09 16:54:36', '0', '更新,id:563商品', '更新,id:563商品', null);
INSERT INTO `jsh_log` VALUES ('5868', '63', '单据', '127.0.0.1', '2019-03-09 22:35:21', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5869', '63', '单据', '127.0.0.1', '2019-03-09 23:13:40', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5870', '63', '单据', '127.0.0.1', '2019-03-09 23:19:15', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5871', '63', '单据', '127.0.0.1', '2019-03-09 23:27:52', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5872', '63', '单据', '127.0.0.1', '2019-03-09 23:28:43', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5873', '63', '单据', '127.0.0.1', '2019-03-09 23:32:57', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5874', '63', '单据', '127.0.0.1', '2019-03-09 23:35:07', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5875', '63', '单据', '127.0.0.1', '2019-03-09 23:38:10', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5876', '63', '单据', '127.0.0.1', '2019-03-09 23:39:46', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5877', '63', '单据', '127.0.0.1', '2019-03-10 15:48:42', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5878', '63', '单据', '127.0.0.1', '2019-03-10 15:54:30', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5879', '63', '单据', '127.0.0.1', '2019-03-10 15:56:23', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5880', '63', '单据', '127.0.0.1', '2019-03-10 16:05:10', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5881', '63', '单据', '127.0.0.1', '2019-03-10 16:46:13', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5882', '63', '单据', '127.0.0.1', '2019-03-10 16:47:04', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5883', '63', '单据', '127.0.0.1', '2019-03-10 17:00:25', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5884', '63', '单据', '127.0.0.1', '2019-03-10 17:40:13', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5885', '63', '单据', '127.0.0.1', '2019-03-10 17:42:11', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5886', '63', '单据', '127.0.0.1', '2019-03-10 17:44:49', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5887', '63', '单据', '127.0.0.1', '2019-03-10 17:47:23', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5888', '63', '单据', '127.0.0.1', '2019-03-10 17:48:28', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5889', '63', '单据', '127.0.0.1', '2019-03-10 17:49:51', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5890', '63', '单据', '127.0.0.1', '2019-03-10 17:50:19', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5891', '63', '单据', '127.0.0.1', '2019-03-10 18:13:00', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5892', '63', '单据', '127.0.0.1', '2019-03-10 18:16:25', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5893', '63', '单据', '127.0.0.1', '2019-03-10 18:24:54', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5894', '63', '单据', '127.0.0.1', '2019-03-10 18:30:56', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5895', '63', '单据', '127.0.0.1', '2019-03-10 18:43:23', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5896', '63', '单据', '127.0.0.1', '2019-03-10 19:19:45', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5897', '63', '单据', '127.0.0.1', '2019-03-10 19:21:56', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5898', '63', '单据', '127.0.0.1', '2019-03-10 20:00:11', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5899', '63', '单据', '127.0.0.1', '2019-03-10 20:02:01', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5900', '63', '单据', '127.0.0.1', '2019-03-10 20:02:33', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5901', '63', '仓库', '127.0.0.1', '2019-03-15 23:02:54', '0', '更新,id:2仓库', '更新,id:2仓库', null);
INSERT INTO `jsh_log` VALUES ('5902', '63', '仓库', '127.0.0.1', '2019-03-15 23:03:55', '0', '更新,id:2仓库', '更新,id:2仓库', null);
INSERT INTO `jsh_log` VALUES ('5903', '63', '仓库', '127.0.0.1', '2019-03-15 23:04:10', '0', '更新,id:1仓库', '更新,id:1仓库', null);
INSERT INTO `jsh_log` VALUES ('5904', '63', '仓库', '127.0.0.1', '2019-03-15 23:04:15', '0', '更新,id:3仓库', '更新,id:3仓库', null);
INSERT INTO `jsh_log` VALUES ('5905', '63', '单据', '127.0.0.1', '2019-03-15 23:05:40', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5906', '63', '单据', '127.0.0.1', '2019-03-15 23:06:22', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5907', '63', '单据', '127.0.0.1', '2019-03-15 23:06:52', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5908', '63', '单据', '127.0.0.1', '2019-03-15 23:08:18', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5909', '63', '单据', '127.0.0.1', '2019-03-15 23:08:33', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5910', '63', '计量单位', '127.0.0.1', '2019-03-15 23:12:39', '0', '新增计量单位', '新增计量单位', null);
INSERT INTO `jsh_log` VALUES ('5911', '63', '单据', '127.0.0.1', '2019-03-15 23:15:30', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5912', '63', '角色', '0:0:0:0:0:0:0:1', '2019-03-17 21:37:05', '0', '新增角色', '新增角色', null);
INSERT INTO `jsh_log` VALUES ('5913', '63', '角色', '0:0:0:0:0:0:0:1', '2019-03-17 23:26:30', '0', '新增角色', '新增角色', null);
INSERT INTO `jsh_log` VALUES ('5914', '63', '商家', '127.0.0.1', '2019-03-18 22:38:21', '0', '新增商家', '新增商家', '1');
INSERT INTO `jsh_log` VALUES ('5915', '63', '商家', '127.0.0.1', '2019-03-18 22:38:33', '0', '新增商家', '新增商家', '1');
INSERT INTO `jsh_log` VALUES ('5916', '63', '仓库', '127.0.0.1', '2019-03-18 22:38:39', '0', '新增仓库', '新增仓库', '1');
INSERT INTO `jsh_log` VALUES ('5917', '63', '账户', '127.0.0.1', '2019-03-18 22:38:58', '0', '新增账户', '新增账户', '1');
INSERT INTO `jsh_log` VALUES ('5918', '63', '经手人', '127.0.0.1', '2019-03-18 22:45:08', '0', '新增经手人', '新增经手人', '1');
INSERT INTO `jsh_log` VALUES ('5919', '63', '商品', '127.0.0.1', '2019-03-18 23:07:31', '0', '新增商品', '新增商品', '1');
INSERT INTO `jsh_log` VALUES ('5920', '63', '商家', '127.0.0.1', '2019-03-18 23:38:47', '0', '新增商家', '新增商家', '1');
INSERT INTO `jsh_log` VALUES ('5921', '63', '收支项目', '127.0.0.1', '2019-03-18 23:39:09', '0', '新增收支项目', '新增收支项目', '1');
INSERT INTO `jsh_log` VALUES ('5922', '63', '计量单位', '127.0.0.1', '2019-03-18 23:49:08', '0', '新增计量单位', '新增计量单位', '1');
INSERT INTO `jsh_log` VALUES ('5923', '63', '关联关系', '127.0.0.1', '2019-03-18 23:49:31', '0', '新增关联关系', '新增关联关系', '1');
INSERT INTO `jsh_log` VALUES ('5924', '63', '商家', '127.0.0.1', '2019-03-19 21:57:45', '0', '新增商家', '新增商家', '1');
INSERT INTO `jsh_log` VALUES ('5925', '63', '关联关系', '127.0.0.1', '2019-03-19 22:00:49', '0', '更新,id:3关联关系', '更新,id:3关联关系', '1');
INSERT INTO `jsh_log` VALUES ('5926', '63', '关联关系', '127.0.0.1', '2019-03-19 22:01:14', '0', '更新,id:7关联关系', '更新,id:7关联关系', '1');
INSERT INTO `jsh_log` VALUES ('5927', '63', '关联关系', '127.0.0.1', '2019-03-19 22:01:21', '0', '更新,id:7关联关系', '更新,id:7关联关系', '1');
INSERT INTO `jsh_log` VALUES ('5928', '63', '关联关系', '127.0.0.1', '2019-03-19 22:05:11', '0', '新增关联关系', '新增关联关系', '1');
INSERT INTO `jsh_log` VALUES ('5933', '96', '商品', '127.0.0.1', '2019-03-19 22:08:46', '0', '更新,id:564商品', '更新,id:564商品', '1');
INSERT INTO `jsh_log` VALUES ('5934', '96', '单据', '127.0.0.1', '2019-03-19 22:10:17', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5935', '96', '单据', '127.0.0.1', '2019-03-19 22:10:35', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5936', '96', '单据', '127.0.0.1', '2019-03-19 22:11:39', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5937', '96', '单据', '127.0.0.1', '2019-03-19 22:12:04', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5938', '96', '单据', '127.0.0.1', '2019-03-19 22:12:18', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5939', '96', '单据', '127.0.0.1', '2019-03-19 22:12:29', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5940', '96', '单据', '127.0.0.1', '2019-03-19 22:12:43', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5941', '96', '单据', '127.0.0.1', '2019-03-19 22:12:53', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5942', '96', '单据', '127.0.0.1', '2019-03-19 22:13:20', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5943', '96', '单据', '127.0.0.1', '2019-03-19 22:13:34', '0', '新增单据', '新增单据', '1');
INSERT INTO `jsh_log` VALUES ('5944', '96', '收支项目', '127.0.0.1', '2019-03-19 22:14:18', '0', '新增收支项目', '新增收支项目', '1');
INSERT INTO `jsh_log` VALUES ('5945', '96', '经手人', '127.0.0.1', '2019-03-19 22:14:33', '0', '新增经手人', '新增经手人', '1');
INSERT INTO `jsh_log` VALUES ('5946', '96', '财务', '127.0.0.1', '2019-03-19 22:14:50', '0', '新增财务', '新增财务', '1');
INSERT INTO `jsh_log` VALUES ('5947', '96', '财务', '127.0.0.1', '2019-03-19 22:15:09', '0', '新增财务', '新增财务', '1');
INSERT INTO `jsh_log` VALUES ('5948', '96', '财务', '127.0.0.1', '2019-03-19 22:15:22', '0', '新增财务', '新增财务', '1');
INSERT INTO `jsh_log` VALUES ('5949', '96', '财务', '127.0.0.1', '2019-03-19 22:15:36', '0', '新增财务', '新增财务', '1');
INSERT INTO `jsh_log` VALUES ('5950', '96', '财务', '127.0.0.1', '2019-03-19 22:16:04', '0', '新增财务', '新增财务', '1');
INSERT INTO `jsh_log` VALUES ('5951', '96', '商品', '127.0.0.1', '2019-03-19 22:35:56', '0', '新增商品', '新增商品', '1');
INSERT INTO `jsh_log` VALUES ('5952', '96', '商品', '127.0.0.1', '2019-03-19 22:36:03', '0', '更新,id:565商品', '更新,id:565商品', '1');
INSERT INTO `jsh_log` VALUES ('5953', '96', '商品', '127.0.0.1', '2019-03-19 22:36:11', '0', '更新,id:565商品', '更新,id:565商品', '1');
INSERT INTO `jsh_log` VALUES ('5954', '96', '商品', '127.0.0.1', '2019-03-19 22:36:24', '0', '更新,id:565商品', '更新,id:565商品', '1');
INSERT INTO `jsh_log` VALUES ('5955', '96', '商品', '127.0.0.1', '2019-03-19 22:37:17', '0', '更新,id:565商品', '更新,id:565商品', '1');
INSERT INTO `jsh_log` VALUES ('5956', '96', '商品', '127.0.0.1', '2019-03-19 22:44:12', '0', '更新,id:565商品', '更新,id:565商品', '1');
INSERT INTO `jsh_log` VALUES ('5957', '96', '商品', '127.0.0.1', '2019-03-19 22:44:18', '0', '更新,id:565商品', '更新,id:565商品', '1');
INSERT INTO `jsh_log` VALUES ('5958', '96', '商品', '127.0.0.1', '2019-03-19 22:44:23', '0', '更新,id:565商品', '更新,id:565商品', '1');
INSERT INTO `jsh_log` VALUES ('5959', '63', '单据', '127.0.0.1', '2019-03-19 22:48:07', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5960', '63', '单据', '127.0.0.1', '2019-03-19 22:48:22', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5961', '63', '单据', '127.0.0.1', '2019-03-19 22:48:40', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5962', '63', '商家', '127.0.0.1', '2019-03-21 23:50:49', '0', '新增商家', '新增商家', null);
INSERT INTO `jsh_log` VALUES ('5963', '63', '商家', '127.0.0.1', '2019-03-21 23:51:05', '0', '批量删除,id集:51商家', '批量删除,id集:51商家', null);
INSERT INTO `jsh_log` VALUES ('5964', '63', null, '127.0.0.1', '2019-03-21 23:57:46', '0', '删除,id:101null', '删除,id:101null', null);
INSERT INTO `jsh_log` VALUES ('5965', '63', '单据', '127.0.0.1', '2019-03-21 23:58:56', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5966', '63', '单据', '127.0.0.1', '2019-03-21 23:59:18', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('5967', '63', '财务', '127.0.0.1', '2019-03-21 23:59:38', '0', '新增财务', '新增财务', null);
INSERT INTO `jsh_log` VALUES ('5968', '63', '角色', '127.0.0.1', '2019-03-24 23:51:47', '0', '新增角色', '新增角色', null);
INSERT INTO `jsh_log` VALUES ('5969', '63', '角色', '127.0.0.1', '2019-03-29 00:07:16', '0', '新增角色', '新增角色', null);
INSERT INTO `jsh_log` VALUES ('5970', '63', '关联关系', '127.0.0.1', '2019-03-29 00:07:21', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('5971', '63', '关联关系', '127.0.0.1', '2019-03-29 00:07:52', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('5972', '63', '关联关系', '127.0.0.1', '2019-03-29 00:08:07', '0', '修改,id:32关联关系', '修改,id:32关联关系', null);
INSERT INTO `jsh_log` VALUES ('5973', '63', '角色', '127.0.0.1', '2019-03-29 00:08:21', '0', '批量删除,id集:9角色', '批量删除,id集:9角色', null);
INSERT INTO `jsh_log` VALUES ('5974', '63', '角色', '127.0.0.1', '2019-03-29 00:08:24', '0', '删除,id:8角色', '删除,id:8角色', null);
INSERT INTO `jsh_log` VALUES ('5975', '63', '角色', '127.0.0.1', '2019-03-29 00:08:26', '0', '删除,id:7角色', '删除,id:7角色', null);
INSERT INTO `jsh_log` VALUES ('5976', '63', '角色', '127.0.0.1', '2019-03-29 00:08:27', '0', '删除,id:6角色', '删除,id:6角色', null);
INSERT INTO `jsh_log` VALUES ('5977', '63', '关联关系', '127.0.0.1', '2019-03-29 00:08:35', '0', '修改,id:32关联关系', '修改,id:32关联关系', null);
INSERT INTO `jsh_log` VALUES ('5978', '113', '角色', '127.0.0.1', '2019-03-29 00:10:02', '0', '新增角色', '新增角色', '10');
INSERT INTO `jsh_log` VALUES ('5979', '113', '角色', '127.0.0.1', '2019-03-29 00:11:34', '0', '新增角色', '新增角色', '113');
INSERT INTO `jsh_log` VALUES ('5980', '113', '角色', '127.0.0.1', '2019-03-29 00:11:39', '0', '删除,id:12角色', '删除,id:12角色', '113');
INSERT INTO `jsh_log` VALUES ('5981', '115', '用户', '127.0.0.1', '2019-03-31 21:18:29', '0', '新增用户', '新增用户', '115');
INSERT INTO `jsh_log` VALUES ('5983', '63', '用户', '127.0.0.1', '2019-03-31 21:49:38', '0', '新增用户', '新增用户', null);
INSERT INTO `jsh_log` VALUES ('5984', '63', '用户', '127.0.0.1', '2019-03-31 21:49:49', '0', '删除,id:118用户', '删除,id:118用户', null);
INSERT INTO `jsh_log` VALUES ('6026', '63', '用户', '127.0.0.1', '2019-03-31 22:18:21', '0', '修改,id:63用户', '修改,id:63用户', null);
INSERT INTO `jsh_log` VALUES ('6046', '120', '关联关系', '127.0.0.1', '2019-03-31 23:17:23', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6047', '120', '关联关系', '127.0.0.1', '2019-03-31 23:18:10', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6048', '63', '角色', '127.0.0.1', '2019-04-01 22:36:16', '0', '新增角色', '新增角色', null);
INSERT INTO `jsh_log` VALUES ('6049', '63', '关联关系', '127.0.0.1', '2019-04-01 22:36:27', '0', '修改,id:17关联关系', '修改,id:17关联关系', null);
INSERT INTO `jsh_log` VALUES ('6050', '63', '关联关系', '127.0.0.1', '2019-04-01 22:36:50', '0', '修改,id:17关联关系', '修改,id:17关联关系', null);
INSERT INTO `jsh_log` VALUES ('6051', '63', '关联关系', '127.0.0.1', '2019-04-01 22:37:14', '0', '修改,id:17关联关系', '修改,id:17关联关系', null);
INSERT INTO `jsh_log` VALUES ('6052', '63', '关联关系', '127.0.0.1', '2019-04-01 22:39:07', '0', '修改,id:17关联关系', '修改,id:17关联关系', null);
INSERT INTO `jsh_log` VALUES ('6053', '63', '关联关系', '127.0.0.1', '2019-04-01 22:39:14', '0', '修改,id:17关联关系', '修改,id:17关联关系', null);
INSERT INTO `jsh_log` VALUES ('6054', '63', '关联关系', '127.0.0.1', '2019-04-01 22:39:52', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6055', '63', '关联关系', '127.0.0.1', '2019-04-01 22:41:39', '0', '修改,id:17关联关系', '修改,id:17关联关系', null);
INSERT INTO `jsh_log` VALUES ('6056', '63', '关联关系', '127.0.0.1', '2019-04-01 22:49:09', '0', '修改,id:17关联关系', '修改,id:17关联关系', null);
INSERT INTO `jsh_log` VALUES ('6057', '63', '关联关系', '127.0.0.1', '2019-04-01 22:49:41', '0', '修改,id:17关联关系', '修改,id:17关联关系', null);
INSERT INTO `jsh_log` VALUES ('6058', '63', '关联关系', '127.0.0.1', '2019-04-01 23:16:20', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6059', '63', '关联关系', '127.0.0.1', '2019-04-01 23:20:23', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6060', '63', '关联关系', '127.0.0.1', '2019-04-01 23:22:00', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6061', '63', '关联关系', '127.0.0.1', '2019-04-01 23:23:26', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6062', '63', '关联关系', '127.0.0.1', '2019-04-01 23:25:33', '0', '修改,id:45关联关系', '修改,id:45关联关系', null);
INSERT INTO `jsh_log` VALUES ('6063', '63', '关联关系', '127.0.0.1', '2019-04-01 23:34:27', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6064', '63', '关联关系', '127.0.0.1', '2019-04-01 23:39:52', '0', '修改,id:46关联关系', '修改,id:46关联关系', null);
INSERT INTO `jsh_log` VALUES ('6065', '63', '关联关系', '127.0.0.1', '2019-04-01 23:43:21', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6066', '63', '关联关系', '127.0.0.1', '2019-04-01 23:43:43', '0', '修改,id:48关联关系', '修改,id:48关联关系', null);
INSERT INTO `jsh_log` VALUES ('6067', '63', '关联关系', '127.0.0.1', '2019-04-01 23:43:58', '0', '修改,id:48关联关系', '修改,id:48关联关系', null);
INSERT INTO `jsh_log` VALUES ('6069', '63', '关联关系', '127.0.0.1', '2019-04-01 23:46:01', '0', '修改,id:48关联关系', '修改,id:48关联关系', null);
INSERT INTO `jsh_log` VALUES ('6070', '63', '关联关系', '127.0.0.1', '2019-04-01 23:46:26', '0', '修改,id:21关联关系', '修改,id:21关联关系', null);
INSERT INTO `jsh_log` VALUES ('6071', '63', '关联关系', '127.0.0.1', '2019-04-01 23:48:17', '0', '修改,id:48关联关系', '修改,id:48关联关系', null);
INSERT INTO `jsh_log` VALUES ('6072', '63', '关联关系', '127.0.0.1', '2019-04-01 23:49:09', '0', '修改,id:48关联关系', '修改,id:48关联关系', null);
INSERT INTO `jsh_log` VALUES ('6073', '115', '用户', '127.0.0.1', '2019-04-02 22:21:51', '0', '删除,id:116用户', '删除,id:116用户', '115');
INSERT INTO `jsh_log` VALUES ('6074', '115', '用户', '127.0.0.1', '2019-04-02 22:21:58', '0', '新增用户', '新增用户', '115');
INSERT INTO `jsh_log` VALUES ('6075', '120', '关联关系', '127.0.0.1', '2019-04-02 22:23:53', '0', '修改,id:16关联关系', '修改,id:16关联关系', null);
INSERT INTO `jsh_log` VALUES ('6076', '120', '关联关系', '127.0.0.1', '2019-04-02 22:24:16', '0', '新增关联关系', '新增关联关系', null);
INSERT INTO `jsh_log` VALUES ('6077', '115', '商品类型', '127.0.0.1', '2019-04-02 22:28:07', '0', '新增商品类型', '新增商品类型', '115');
INSERT INTO `jsh_log` VALUES ('6078', '115', '商品', '127.0.0.1', '2019-04-02 22:28:28', '0', '新增商品', '新增商品', '115');
INSERT INTO `jsh_log` VALUES ('6079', '115', '商家', '127.0.0.1', '2019-04-02 22:28:37', '0', '新增商家', '新增商家', '115');
INSERT INTO `jsh_log` VALUES ('6080', '115', '仓库', '127.0.0.1', '2019-04-02 22:28:45', '0', '新增仓库', '新增仓库', '115');
INSERT INTO `jsh_log` VALUES ('6081', '115', '账户', '127.0.0.1', '2019-04-02 22:28:56', '0', '新增账户', '新增账户', '115');
INSERT INTO `jsh_log` VALUES ('6082', '115', '账户', '127.0.0.1', '2019-04-02 22:28:57', '0', '修改,id:16账户', '修改,id:16账户', '115');
INSERT INTO `jsh_log` VALUES ('6083', '115', '经手人', '127.0.0.1', '2019-04-02 22:29:11', '0', '新增经手人', '新增经手人', '115');
INSERT INTO `jsh_log` VALUES ('6084', '115', '关联关系', '127.0.0.1', '2019-04-02 22:29:28', '0', '新增关联关系', '新增关联关系', '115');
INSERT INTO `jsh_log` VALUES ('6085', '115', '关联关系', '127.0.0.1', '2019-04-02 22:29:46', '0', '新增关联关系', '新增关联关系', '115');
INSERT INTO `jsh_log` VALUES ('6086', '115', '单据', '127.0.0.1', '2019-04-02 22:30:01', '0', '新增单据', '新增单据', '115');
INSERT INTO `jsh_log` VALUES ('6087', '115', '单据明细', '127.0.0.1', '2019-04-02 22:30:01', '0', '新增单据明细', '新增单据明细', '115');
INSERT INTO `jsh_log` VALUES ('6088', '115', '单据明细', '127.0.0.1', '2019-04-02 22:30:01', '0', '删除,id:单据明细', '删除,id:单据明细', '115');
INSERT INTO `jsh_log` VALUES ('6089', '115', '单据', '127.0.0.1', '2019-04-02 22:30:20', '0', '新增单据', '新增单据', '115');
INSERT INTO `jsh_log` VALUES ('6090', '115', '单据明细', '127.0.0.1', '2019-04-02 22:30:20', '0', '新增单据明细', '新增单据明细', '115');
INSERT INTO `jsh_log` VALUES ('6091', '115', '单据明细', '127.0.0.1', '2019-04-02 22:30:20', '0', '删除,id:单据明细', '删除,id:单据明细', '115');
INSERT INTO `jsh_log` VALUES ('6092', '63', '单据', '127.0.0.1', '2019-04-02 22:32:00', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('6093', '63', '单据明细', '127.0.0.1', '2019-04-02 22:32:00', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6094', '63', '单据明细', '127.0.0.1', '2019-04-02 22:32:00', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6095', '63', '单据', '127.0.0.1', '2019-04-02 22:39:44', '0', '删除,id:178单据', '删除,id:178单据', null);
INSERT INTO `jsh_log` VALUES ('6096', '63', '单据', '127.0.0.1', '2019-04-02 22:39:45', '0', '删除,id:178单据', '删除,id:178单据', null);
INSERT INTO `jsh_log` VALUES ('6097', '63', '角色', '127.0.0.1', '2019-04-02 22:39:55', '0', '新增角色', '新增角色', null);
INSERT INTO `jsh_log` VALUES ('6098', '63', '序列号', '127.0.0.1', '2019-04-02 22:39:57', '0', '删除,id:14序列号', '删除,id:14序列号', null);
INSERT INTO `jsh_log` VALUES ('6099', '63', '单据', '127.0.0.1', '2019-04-04 23:06:58', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('6100', '63', '单据明细', '127.0.0.1', '2019-04-04 23:06:58', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6101', '63', '单据明细', '127.0.0.1', '2019-04-04 23:06:58', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6102', '115', '关联关系', '127.0.0.1', '2019-04-05 17:13:49', '0', '修改,id:54关联关系', '修改,id:54关联关系', '115');
INSERT INTO `jsh_log` VALUES ('6103', '115', '角色', '127.0.0.1', '2019-04-05 17:14:12', '0', '新增角色', '新增角色', '115');
INSERT INTO `jsh_log` VALUES ('6104', '115', '商家', '127.0.0.1', '2019-04-05 17:14:26', '0', '新增商家', '新增商家', '115');
INSERT INTO `jsh_log` VALUES ('6105', '115', '关联关系', '127.0.0.1', '2019-04-05 17:14:39', '0', '新增关联关系', '新增关联关系', '115');
INSERT INTO `jsh_log` VALUES ('6106', '115', '关联关系', '127.0.0.1', '2019-04-05 17:14:52', '0', '修改,id:54关联关系', '修改,id:54关联关系', '115');
INSERT INTO `jsh_log` VALUES ('6107', '115', '关联关系', '127.0.0.1', '2019-04-05 17:15:20', '0', '新增关联关系', '新增关联关系', '115');
INSERT INTO `jsh_log` VALUES ('6108', '115', '关联关系', '127.0.0.1', '2019-04-05 17:15:32', '0', '新增关联关系', '新增关联关系', '115');
INSERT INTO `jsh_log` VALUES ('6109', '115', '用户', '127.0.0.1', '2019-04-05 17:19:53', '0', '修改,id:115用户', '修改,id:115用户', '115');
INSERT INTO `jsh_log` VALUES ('6110', '115', '用户', '127.0.0.1', '2019-04-05 17:20:05', '0', '修改,id:115用户', '修改,id:115用户', '115');
INSERT INTO `jsh_log` VALUES ('6111', '115', '关联关系', '127.0.0.1', '2019-04-05 17:20:56', '0', '修改,id:56关联关系', '修改,id:56关联关系', '115');
INSERT INTO `jsh_log` VALUES ('6112', '115', '关联关系', '127.0.0.1', '2019-04-05 17:21:31', '0', '修改,id:56关联关系', '修改,id:56关联关系', '115');
INSERT INTO `jsh_log` VALUES ('6113', '63', '单据', '127.0.0.1', '2019-04-07 20:23:23', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('6114', '63', '单据明细', '127.0.0.1', '2019-04-07 20:23:23', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6115', '63', '单据明细', '127.0.0.1', '2019-04-07 20:23:23', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6116', '63', '单据', '127.0.0.1', '2019-04-07 20:25:30', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('6117', '63', '单据明细', '127.0.0.1', '2019-04-07 20:25:30', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6118', '63', '单据明细', '127.0.0.1', '2019-04-07 20:25:30', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6119', '63', '单据', '127.0.0.1', '2019-04-07 20:35:00', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('6120', '63', '单据明细', '127.0.0.1', '2019-04-07 20:35:01', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6121', '63', '单据明细', '127.0.0.1', '2019-04-07 20:35:01', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6122', '63', '单据', '127.0.0.1', '2019-04-07 20:44:09', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('6123', '63', '单据明细', '127.0.0.1', '2019-04-07 20:44:09', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6124', '63', '单据明细', '127.0.0.1', '2019-04-07 20:44:09', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6125', '63', '单据', '127.0.0.1', '2019-04-07 20:44:25', '0', '删除,id:184单据', '删除,id:184单据', null);
INSERT INTO `jsh_log` VALUES ('6126', '63', '单据', '127.0.0.1', '2019-04-07 20:44:25', '0', '删除,id:184单据', '删除,id:184单据', null);
INSERT INTO `jsh_log` VALUES ('6127', '63', '单据', '127.0.0.1', '2019-04-07 20:44:29', '0', '删除,id:185单据', '删除,id:185单据', null);
INSERT INTO `jsh_log` VALUES ('6128', '63', '单据', '127.0.0.1', '2019-04-07 20:44:29', '0', '删除,id:185单据', '删除,id:185单据', null);
INSERT INTO `jsh_log` VALUES ('6129', '63', '单据', '127.0.0.1', '2019-04-07 20:44:32', '0', '删除,id:186单据', '删除,id:186单据', null);
INSERT INTO `jsh_log` VALUES ('6130', '63', '单据', '127.0.0.1', '2019-04-07 20:44:32', '0', '删除,id:186单据', '删除,id:186单据', null);
INSERT INTO `jsh_log` VALUES ('6131', '63', '单据', '127.0.0.1', '2019-04-07 20:44:58', '0', '删除,id:183,182单据', '删除,id:183,182单据', null);
INSERT INTO `jsh_log` VALUES ('6132', '63', '单据', '127.0.0.1', '2019-04-07 20:44:58', '0', '删除,id:183单据', '删除,id:183单据', null);
INSERT INTO `jsh_log` VALUES ('6133', '63', '单据', '127.0.0.1', '2019-04-07 20:44:58', '0', '删除,id:183单据', '删除,id:183单据', null);
INSERT INTO `jsh_log` VALUES ('6134', '63', '单据', '127.0.0.1', '2019-04-07 20:44:58', '0', '删除,id:182单据', '删除,id:182单据', null);
INSERT INTO `jsh_log` VALUES ('6135', '63', '单据', '127.0.0.1', '2019-04-07 20:44:58', '0', '删除,id:182单据', '删除,id:182单据', null);
INSERT INTO `jsh_log` VALUES ('6136', '63', '单据', '127.0.0.1', '2019-04-07 20:45:09', '0', '删除,id:179单据', '删除,id:179单据', null);
INSERT INTO `jsh_log` VALUES ('6137', '63', '单据', '127.0.0.1', '2019-04-07 20:45:09', '0', '删除,id:179单据', '删除,id:179单据', null);
INSERT INTO `jsh_log` VALUES ('6138', '63', '单据', '127.0.0.1', '2019-04-07 20:51:51', '0', '新增单据', '新增单据', null);
INSERT INTO `jsh_log` VALUES ('6139', '63', '单据明细', '127.0.0.1', '2019-04-07 20:51:51', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6140', '63', '单据明细', '127.0.0.1', '2019-04-07 20:51:51', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6141', '63', '单据', '127.0.0.1', '2019-04-07 22:36:48', '0', '修改,id:188单据', '修改,id:188单据', null);
INSERT INTO `jsh_log` VALUES ('6142', '63', '单据明细', '127.0.0.1', '2019-04-07 22:36:48', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6143', '63', '单据明细', '127.0.0.1', '2019-04-07 22:36:48', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6144', '63', '单据', '127.0.0.1', '2019-04-07 22:38:23', '0', '修改,id:188单据', '修改,id:188单据', null);
INSERT INTO `jsh_log` VALUES ('6145', '63', '单据明细', '127.0.0.1', '2019-04-07 22:38:24', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6146', '63', '单据明细', '127.0.0.1', '2019-04-07 22:38:24', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6147', '63', '单据', '127.0.0.1', '2019-04-07 22:39:59', '0', '修改,id:188单据', '修改,id:188单据', null);
INSERT INTO `jsh_log` VALUES ('6148', '63', '单据明细', '127.0.0.1', '2019-04-07 22:39:59', '0', '新增单据明细', '新增单据明细', null);
INSERT INTO `jsh_log` VALUES ('6149', '63', '单据明细', '127.0.0.1', '2019-04-07 22:39:59', '0', '删除,id:单据明细', '删除,id:单据明细', null);
INSERT INTO `jsh_log` VALUES ('6150', '63', '商品类型', '127.0.0.1', '2019-04-10 22:18:12', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6151', '63', '商品', '127.0.0.1', '2019-04-10 22:18:23', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6152', '63', '商家', '127.0.0.1', '2019-04-10 22:18:33', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6153', '63', '商家', '127.0.0.1', '2019-04-10 22:18:41', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6154', '63', '账户', '127.0.0.1', '2019-04-10 22:18:54', '0', '新增账户', '新增账户', '63');
INSERT INTO `jsh_log` VALUES ('6155', '63', '账户', '127.0.0.1', '2019-04-10 22:19:19', '0', '修改,id:17账户', '修改,id:17账户', '63');
INSERT INTO `jsh_log` VALUES ('6156', '63', '仓库', '127.0.0.1', '2019-04-10 22:20:07', '0', '新增仓库', '新增仓库', '63');
INSERT INTO `jsh_log` VALUES ('6157', '63', '关联关系', '127.0.0.1', '2019-04-10 22:20:19', '0', '修改,id:18关联关系', '修改,id:18关联关系', '63');
INSERT INTO `jsh_log` VALUES ('6170', '63', '商品', '127.0.0.1', '2019-04-10 22:24:35', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6179', '63', '商品', '127.0.0.1', '2019-04-10 22:25:23', '0', '修改,id:568商品', '修改,id:568商品', '63');
INSERT INTO `jsh_log` VALUES ('6180', '63', '商品', '127.0.0.1', '2019-04-10 22:25:32', '0', '修改,id:569商品', '修改,id:569商品', '63');
INSERT INTO `jsh_log` VALUES ('6181', '63', '单据', '127.0.0.1', '2019-04-10 22:25:49', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6182', '63', '单据明细', '127.0.0.1', '2019-04-10 22:25:49', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6183', '63', '单据明细', '127.0.0.1', '2019-04-10 22:25:49', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6184', '63', '单据', '127.0.0.1', '2019-04-10 22:26:00', '0', '修改,id:189单据', '修改,id:189单据', '63');
INSERT INTO `jsh_log` VALUES ('6185', '63', '单据明细', '127.0.0.1', '2019-04-10 22:26:00', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6186', '63', '单据明细', '127.0.0.1', '2019-04-10 22:26:00', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6187', '63', '用户', '127.0.0.1', '2019-04-13 19:38:11', '0', '新增用户', '新增用户', '63');
INSERT INTO `jsh_log` VALUES ('6188', '63', '用户', '127.0.0.1', '2019-04-13 19:38:22', '0', '删除,id:122用户', '删除,id:122用户', '63');
INSERT INTO `jsh_log` VALUES ('6189', '63', '单据', '127.0.0.1', '2019-04-13 19:57:43', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6190', '63', '单据明细', '127.0.0.1', '2019-04-13 19:57:43', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6191', '63', '单据明细', '127.0.0.1', '2019-04-13 19:57:43', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6192', '63', '单据', '127.0.0.1', '2019-04-13 19:57:58', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6193', '63', '单据明细', '127.0.0.1', '2019-04-13 19:57:58', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6194', '63', '单据明细', '127.0.0.1', '2019-04-13 19:57:58', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6195', '63', '单据', '127.0.0.1', '2019-04-13 19:58:02', '0', '删除,id:190单据', '删除,id:190单据', '63');
INSERT INTO `jsh_log` VALUES ('6196', '63', '单据', '127.0.0.1', '2019-04-13 19:58:02', '0', '删除,id:190单据', '删除,id:190单据', '63');
INSERT INTO `jsh_log` VALUES ('6197', '63', '商品', '127.0.0.1', '2019-04-13 19:58:23', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6198', '63', '单据', '127.0.0.1', '2019-04-20 00:36:23', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6199', '63', '单据明细', '127.0.0.1', '2019-04-20 00:36:24', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6200', '63', '单据明细', '127.0.0.1', '2019-04-20 00:36:24', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6201', '63', '商家', '127.0.0.1', '2019-04-29 23:39:40', '0', '修改,id:58商家', '修改,id:58商家', '63');
INSERT INTO `jsh_log` VALUES ('6202', '63', '关联关系', '127.0.0.1', '2019-04-29 23:40:06', '0', '修改,id:27关联关系', '修改,id:27关联关系', '63');
INSERT INTO `jsh_log` VALUES ('6203', '63', '商品', '127.0.0.1', '2019-04-29 23:40:44', '0', '修改,id:569商品', '修改,id:569商品', '63');
INSERT INTO `jsh_log` VALUES ('6204', '63', '单据', '127.0.0.1', '2019-04-29 23:41:02', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6205', '63', '单据明细', '127.0.0.1', '2019-04-29 23:41:02', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6206', '63', '单据明细', '127.0.0.1', '2019-04-29 23:41:02', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6207', '63', '商家', '127.0.0.1', '2019-04-29 23:41:29', '0', '修改,id:58商家', '修改,id:58商家', '63');
INSERT INTO `jsh_log` VALUES ('6208', '63', '商家', '127.0.0.1', '2019-04-29 23:41:35', '0', '修改,id:58商家', '修改,id:58商家', '63');
INSERT INTO `jsh_log` VALUES ('6209', '63', '商家', '127.0.0.1', '2019-04-29 23:41:39', '0', '修改,id:58商家', '修改,id:58商家', '63');
INSERT INTO `jsh_log` VALUES ('6210', '63', '仓库', '127.0.0.1', '2019-04-30 22:31:32', '0', '修改,id:14仓库', '修改,id:14仓库', '63');
INSERT INTO `jsh_log` VALUES ('6211', '63', '关联关系', '127.0.0.1', '2019-04-30 22:32:09', '0', '修改,id:18关联关系', '修改,id:18关联关系', '63');
INSERT INTO `jsh_log` VALUES ('6212', '63', '仓库', '127.0.0.1', '2019-04-30 22:32:36', '0', '新增仓库', '新增仓库', '63');
INSERT INTO `jsh_log` VALUES ('6213', '63', '关联关系', '127.0.0.1', '2019-04-30 22:32:49', '0', '修改,id:18关联关系', '修改,id:18关联关系', '63');
INSERT INTO `jsh_log` VALUES ('6214', '63', '仓库', '127.0.0.1', '2019-04-30 22:33:04', '0', '修改,id:15仓库', '修改,id:15仓库', '63');
INSERT INTO `jsh_log` VALUES ('6215', '63', '仓库', '127.0.0.1', '2019-04-30 22:33:04', '0', '修改,id:14仓库', '修改,id:14仓库', '63');
INSERT INTO `jsh_log` VALUES ('6216', '63', '单据', '127.0.0.1', '2019-04-30 22:33:23', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6217', '63', '单据明细', '127.0.0.1', '2019-04-30 22:33:24', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6218', '63', '单据明细', '127.0.0.1', '2019-04-30 22:33:24', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6219', '63', '账户', '127.0.0.1', '2019-04-30 22:34:23', '0', '新增账户', '新增账户', '63');
INSERT INTO `jsh_log` VALUES ('6220', '63', '单据', '127.0.0.1', '2019-04-30 22:34:45', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6221', '63', '单据明细', '127.0.0.1', '2019-04-30 22:34:45', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6222', '63', '单据明细', '127.0.0.1', '2019-04-30 22:34:45', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6223', '63', '单据', '127.0.0.1', '2019-04-30 22:35:53', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6224', '63', '单据明细', '127.0.0.1', '2019-04-30 22:35:53', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6225', '63', '单据明细', '127.0.0.1', '2019-04-30 22:35:53', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6226', '120', '功能', '127.0.0.1', '2019-04-30 22:43:37', '0', '新增功能', '新增功能', null);
INSERT INTO `jsh_log` VALUES ('6227', '120', '关联关系', '127.0.0.1', '2019-04-30 22:43:52', '0', '修改,id:5关联关系', '修改,id:5关联关系', null);
INSERT INTO `jsh_log` VALUES ('6228', '120', '功能', '127.0.0.1', '2019-04-30 22:44:46', '0', '修改,id:244功能', '修改,id:244功能', null);
INSERT INTO `jsh_log` VALUES ('6229', '120', '关联关系', '127.0.0.1', '2019-04-30 22:46:03', '0', '修改,id:32关联关系', '修改,id:32关联关系', null);
INSERT INTO `jsh_log` VALUES ('6230', '63', '商品', '127.0.0.1', '2019-04-30 22:47:10', '0', '修改,id:568商品', '修改,id:568商品', '63');
INSERT INTO `jsh_log` VALUES ('6231', '63', '商品', '127.0.0.1', '2019-04-30 22:47:17', '0', '修改,id:569商品', '修改,id:569商品', '63');
INSERT INTO `jsh_log` VALUES ('6232', '63', '商品', '127.0.0.1', '2019-04-30 22:47:30', '0', '修改,id:570商品', '修改,id:570商品', '63');
INSERT INTO `jsh_log` VALUES ('6233', '63', '商家', '127.0.0.1', '2019-04-30 22:48:41', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6234', '63', '商家', '127.0.0.1', '2019-04-30 22:50:03', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6235', '63', '商家', '127.0.0.1', '2019-04-30 22:50:15', '0', '修改,id:60商家', '修改,id:60商家', '63');
INSERT INTO `jsh_log` VALUES ('6236', '63', '商家', '127.0.0.1', '2019-04-30 22:50:17', '0', '修改,id:60商家', '修改,id:60商家', '63');
INSERT INTO `jsh_log` VALUES ('6237', '63', '仓库', '127.0.0.1', '2019-04-30 23:04:32', '0', '修改,id:14仓库', '修改,id:14仓库', '63');
INSERT INTO `jsh_log` VALUES ('6238', '63', '仓库', '127.0.0.1', '2019-04-30 23:04:32', '0', '修改,id:15仓库', '修改,id:15仓库', '63');
INSERT INTO `jsh_log` VALUES ('6239', '63', '仓库', '127.0.0.1', '2019-04-30 23:04:36', '0', '修改,id:15仓库', '修改,id:15仓库', '63');
INSERT INTO `jsh_log` VALUES ('6240', '63', '仓库', '127.0.0.1', '2019-04-30 23:04:36', '0', '修改,id:14仓库', '修改,id:14仓库', '63');
INSERT INTO `jsh_log` VALUES ('6241', '63', '仓库', '127.0.0.1', '2019-04-30 23:09:07', '0', '修改,id:14仓库', '修改,id:14仓库', '63');
INSERT INTO `jsh_log` VALUES ('6242', '63', '仓库', '127.0.0.1', '2019-04-30 23:09:07', '0', '修改,id:15仓库', '修改,id:15仓库', '63');
INSERT INTO `jsh_log` VALUES ('6243', '63', '单据', '127.0.0.1', '2019-04-30 23:15:27', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6244', '63', '单据明细', '127.0.0.1', '2019-04-30 23:15:27', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6245', '63', '单据明细', '127.0.0.1', '2019-04-30 23:15:27', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6246', '63', '单据', '127.0.0.1', '2019-05-03 11:50:21', '0', '修改,id:196单据', '修改,id:196单据', '63');
INSERT INTO `jsh_log` VALUES ('6247', '63', '单据明细', '127.0.0.1', '2019-05-03 11:50:21', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6248', '63', '单据明细', '127.0.0.1', '2019-05-03 11:50:21', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6249', '63', '单据', '127.0.0.1', '2019-05-03 11:51:52', '0', '修改,id:196单据', '修改,id:196单据', '63');
INSERT INTO `jsh_log` VALUES ('6250', '63', '单据明细', '127.0.0.1', '2019-05-03 11:51:52', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6251', '63', '单据明细', '127.0.0.1', '2019-05-03 11:51:52', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6252', '63', '单据', '127.0.0.1', '2019-05-03 11:57:49', '0', '修改,id:196单据', '修改,id:196单据', '63');
INSERT INTO `jsh_log` VALUES ('6253', '63', '单据明细', '127.0.0.1', '2019-05-03 11:57:49', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6254', '63', '单据明细', '127.0.0.1', '2019-05-03 11:57:49', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6255', '63', '商家', '127.0.0.1', '2019-05-03 13:05:32', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6256', '63', '商家', '127.0.0.1', '2019-05-03 13:20:45', '0', '删除,id:61商家', '删除,id:61商家', '63');
INSERT INTO `jsh_log` VALUES ('6257', '63', '商家', '127.0.0.1', '2019-05-03 13:25:50', '0', '修改,id:57商家', '修改,id:57商家', '63');
INSERT INTO `jsh_log` VALUES ('6258', '63', '商家', '127.0.0.1', '2019-05-03 13:25:58', '0', '修改,id:57商家', '修改,id:57商家', '63');
INSERT INTO `jsh_log` VALUES ('6259', '63', '商家', '127.0.0.1', '2019-05-03 13:27:23', '0', '修改,id:57商家', '修改,id:57商家', '63');
INSERT INTO `jsh_log` VALUES ('6260', '63', '商家', '127.0.0.1', '2019-05-03 13:27:32', '0', '修改,id:57商家', '修改,id:57商家', '63');
INSERT INTO `jsh_log` VALUES ('6261', '63', '商家', '127.0.0.1', '2019-05-03 13:28:45', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6262', '63', '商家', '127.0.0.1', '2019-05-03 13:43:28', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6263', '63', '商家', '127.0.0.1', '2019-05-03 13:43:31', '0', '删除,id:63商家', '删除,id:63商家', '63');
INSERT INTO `jsh_log` VALUES ('6264', '63', '商家', '127.0.0.1', '2019-05-03 13:43:35', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6265', '63', '商家', '127.0.0.1', '2019-05-03 13:43:44', '0', '修改,id:64商家', '修改,id:64商家', '63');
INSERT INTO `jsh_log` VALUES ('6266', '63', '商家', '127.0.0.1', '2019-05-03 13:45:52', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6267', '63', '商家', '127.0.0.1', '2019-05-03 13:46:17', '0', '修改,id:65商家', '修改,id:65商家', '63');
INSERT INTO `jsh_log` VALUES ('6268', '63', '商家', '127.0.0.1', '2019-05-03 13:46:23', '0', '删除,id:62,64,65商家', '删除,id:62,64,65商家', '63');
INSERT INTO `jsh_log` VALUES ('6269', '63', '商家', '127.0.0.1', '2019-05-03 13:46:28', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6270', '63', '商家', '127.0.0.1', '2019-05-03 13:46:34', '0', '删除,id:66商家', '删除,id:66商家', '63');
INSERT INTO `jsh_log` VALUES ('6271', '63', '商家', '127.0.0.1', '2019-05-03 13:46:58', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6272', '63', '商家', '127.0.0.1', '2019-05-03 13:47:07', '0', '修改,id:67商家', '修改,id:67商家', '63');
INSERT INTO `jsh_log` VALUES ('6273', '63', '商家', '127.0.0.1', '2019-05-03 13:47:17', '0', '修改,id:67商家', '修改,id:67商家', '63');
INSERT INTO `jsh_log` VALUES ('6274', '63', '商家', '127.0.0.1', '2019-05-03 13:54:20', '0', '删除,id:67商家', '删除,id:67商家', '63');
INSERT INTO `jsh_log` VALUES ('6275', '63', '商家', '127.0.0.1', '2019-05-03 13:54:32', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6276', '63', '商家', '127.0.0.1', '2019-05-03 13:55:00', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6277', '63', '商家', '127.0.0.1', '2019-05-03 13:55:33', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6278', '63', '商家', '127.0.0.1', '2019-05-03 13:56:22', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6279', '63', '商家', '127.0.0.1', '2019-05-03 13:56:42', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6280', '63', '商家', '127.0.0.1', '2019-05-03 13:57:06', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6281', '63', '商家', '127.0.0.1', '2019-05-03 13:57:24', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6282', '63', '商家', '127.0.0.1', '2019-05-03 13:57:42', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6283', '63', '商家', '127.0.0.1', '2019-05-03 13:57:50', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6284', '63', '商家', '127.0.0.1', '2019-05-03 13:58:33', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6285', '63', '商家', '127.0.0.1', '2019-05-03 13:58:43', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6286', '63', '计量单位', '127.0.0.1', '2019-05-03 14:00:00', '0', '新增计量单位', '新增计量单位', '63');
INSERT INTO `jsh_log` VALUES ('6287', '63', '商品', '127.0.0.1', '2019-05-03 14:00:56', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6288', '63', '商品', '127.0.0.1', '2019-05-03 14:06:56', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6289', '63', '商品', '127.0.0.1', '2019-05-03 14:07:09', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6290', '63', '商品', '127.0.0.1', '2019-05-03 14:07:19', '0', '删除,id:572,573商品', '删除,id:572,573商品', '63');
INSERT INTO `jsh_log` VALUES ('6291', '63', '商品', '127.0.0.1', '2019-05-03 14:14:43', '0', '删除,id:571商品', '删除,id:571商品', '63');
INSERT INTO `jsh_log` VALUES ('6292', '63', '商品', '127.0.0.1', '2019-05-03 14:15:13', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6295', '63', '商品', '127.0.0.1', '2019-05-03 14:16:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6296', '63', '商品', '127.0.0.1', '2019-05-03 14:16:15', '0', '删除,id:574,575商品', '删除,id:574,575商品', '63');
INSERT INTO `jsh_log` VALUES ('6297', '63', '商品', '127.0.0.1', '2019-05-03 14:17:08', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6298', '63', '商品', '127.0.0.1', '2019-05-03 14:17:12', '0', '删除,id:576商品', '删除,id:576商品', '63');
INSERT INTO `jsh_log` VALUES ('6299', '63', '商品', '127.0.0.1', '2019-05-03 14:17:39', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6300', '63', '商品', '127.0.0.1', '2019-05-03 14:18:59', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6301', '63', '商品', '127.0.0.1', '2019-05-03 14:19:17', '0', '修改,id:578商品', '修改,id:578商品', '63');
INSERT INTO `jsh_log` VALUES ('6302', '63', '商品', '127.0.0.1', '2019-05-03 14:19:27', '0', '修改,id:578商品', '修改,id:578商品', '63');
INSERT INTO `jsh_log` VALUES ('6303', '63', '商品', '127.0.0.1', '2019-05-03 14:19:34', '0', '修改,id:578商品', '修改,id:578商品', '63');
INSERT INTO `jsh_log` VALUES ('6304', '63', '单据', '127.0.0.1', '2019-05-03 14:20:56', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6305', '63', '单据明细', '127.0.0.1', '2019-05-03 14:20:56', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6306', '63', '单据明细', '127.0.0.1', '2019-05-03 14:20:56', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6307', '63', '商品', '127.0.0.1', '2019-05-03 14:21:11', '0', '删除,id:578商品', '删除,id:578商品', '63');
INSERT INTO `jsh_log` VALUES ('6312', '63', '商品', '127.0.0.1', '2019-05-03 14:35:11', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6314', '63', '商品', '127.0.0.1', '2019-05-03 14:36:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6315', '63', '商品', '127.0.0.1', '2019-05-03 14:36:18', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6316', '63', '商品', '127.0.0.1', '2019-05-03 14:40:05', '0', '修改,id:581商品', '修改,id:581商品', '63');
INSERT INTO `jsh_log` VALUES ('6317', '63', '商品', '127.0.0.1', '2019-05-03 14:40:07', '0', '修改,id:581商品', '修改,id:581商品', '63');
INSERT INTO `jsh_log` VALUES ('6318', '63', '商品', '127.0.0.1', '2019-05-03 14:40:10', '0', '删除,id:581商品', '删除,id:581商品', '63');
INSERT INTO `jsh_log` VALUES ('6319', '63', '商品', '127.0.0.1', '2019-05-03 14:40:12', '0', '删除,id:580商品', '删除,id:580商品', '63');
INSERT INTO `jsh_log` VALUES ('6320', '63', '商品', '127.0.0.1', '2019-05-03 14:40:24', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6321', '63', '商品', '127.0.0.1', '2019-05-03 14:40:46', '0', '修改,id:582商品', '修改,id:582商品', '63');
INSERT INTO `jsh_log` VALUES ('6322', '63', '商品', '127.0.0.1', '2019-05-03 14:43:25', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6323', '63', '商品', '127.0.0.1', '2019-05-03 14:43:28', '0', '删除,id:583商品', '删除,id:583商品', '63');
INSERT INTO `jsh_log` VALUES ('6324', '63', '商品', '127.0.0.1', '2019-05-03 14:45:57', '0', '删除,id:582商品', '删除,id:582商品', '63');
INSERT INTO `jsh_log` VALUES ('6325', '63', '商品', '127.0.0.1', '2019-05-03 14:46:18', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6326', '63', '商品', '127.0.0.1', '2019-05-03 14:46:38', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6327', '63', '商品', '127.0.0.1', '2019-05-03 14:46:43', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6328', '63', '商品', '127.0.0.1', '2019-05-03 14:46:51', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6329', '63', '商品', '127.0.0.1', '2019-05-03 14:47:13', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6330', '63', '商品', '127.0.0.1', '2019-05-03 14:47:18', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6331', '63', '商品', '127.0.0.1', '2019-05-03 14:47:21', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6332', '63', '商品', '127.0.0.1', '2019-05-03 14:47:29', '0', '修改,id:584商品', '修改,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6333', '63', '商品', '127.0.0.1', '2019-05-03 14:48:53', '0', '删除,id:584商品', '删除,id:584商品', '63');
INSERT INTO `jsh_log` VALUES ('6334', '63', '商品', '127.0.0.1', '2019-05-03 14:49:11', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6335', '63', '商家', '127.0.0.1', '2019-05-03 14:55:10', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6336', '63', '商家', '127.0.0.1', '2019-05-03 14:55:26', '0', '删除,id:69商家', '删除,id:69商家', '63');
INSERT INTO `jsh_log` VALUES ('6337', '63', '商家', '127.0.0.1', '2019-05-03 14:56:46', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6338', '63', '商家', '127.0.0.1', '2019-05-03 14:57:13', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6339', '63', '商家', '127.0.0.1', '2019-05-03 14:58:47', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6340', '63', '商家', '127.0.0.1', '2019-05-03 14:58:52', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6341', '63', '商家', '127.0.0.1', '2019-05-03 14:59:03', '0', '删除,id:70,72,73商家', '删除,id:70,72,73商家', '63');
INSERT INTO `jsh_log` VALUES ('6342', '120', '关联关系', '127.0.0.1', '2019-05-03 16:37:15', '0', '修改,id:32关联关系', '修改,id:32关联关系', null);
INSERT INTO `jsh_log` VALUES ('6343', '120', '功能', '127.0.0.1', '2019-05-03 16:55:52', '0', '新增功能', '新增功能', null);
INSERT INTO `jsh_log` VALUES ('6344', '120', '关联关系', '127.0.0.1', '2019-05-03 16:56:20', '0', '修改,id:32关联关系', '修改,id:32关联关系', null);
INSERT INTO `jsh_log` VALUES ('6345', '120', '关联关系', '127.0.0.1', '2019-05-03 16:57:24', '0', '修改,id:5关联关系', '修改,id:5关联关系', null);
INSERT INTO `jsh_log` VALUES ('6346', '120', '功能', '127.0.0.1', '2019-05-03 16:58:04', '0', '修改,id:245功能', '修改,id:245功能', null);
INSERT INTO `jsh_log` VALUES ('6347', '63', '角色', '127.0.0.1', '2019-05-03 17:06:47', '0', '新增角色', '新增角色', '63');
INSERT INTO `jsh_log` VALUES ('6348', '120', '用户', '0:0:0:0:0:0:0:1', '2019-10-23 20:51:57', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6349', '120', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 08:53:18', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6350', '120', '用户', '192.168.10.1', '2019-10-24 09:00:28', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6351', '120', '用户', '192.168.10.1', '2019-10-24 09:08:22', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6352', '120', '用户', '192.168.10.1', '2019-10-24 09:12:38', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6353', '120', '用户', '192.168.10.1', '2019-10-24 09:14:05', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6354', '120', '用户', '61.244.165.130', '2019-10-24 09:17:43', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6355', '120', '用户', '61.244.165.130', '2019-10-24 14:20:18', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6356', '120', '商品类型', '61.244.165.130', '2019-10-24 14:21:47', '0', '修改,id:13商品类型', '修改,id:13商品类型', null);
INSERT INTO `jsh_log` VALUES ('6357', '120', '商品', '61.244.165.130', '2019-10-24 14:23:35', '0', '新增商品', '新增商品', null);
INSERT INTO `jsh_log` VALUES ('6358', '120', '商品', '61.244.165.130', '2019-10-24 14:25:40', '0', '新增商品', '新增商品', null);
INSERT INTO `jsh_log` VALUES ('6359', '120', '商品', '61.244.165.130', '2019-10-24 14:49:44', '0', '新增商品', '新增商品', null);
INSERT INTO `jsh_log` VALUES ('6360', '120', '商品', '61.244.165.130', '2019-10-24 14:50:14', '0', '修改,id:569商品', '修改,id:569商品', null);
INSERT INTO `jsh_log` VALUES ('6361', '120', '商品', '61.244.165.130', '2019-10-24 14:50:25', '0', '修改,id:569商品', '修改,id:569商品', null);
INSERT INTO `jsh_log` VALUES ('6362', '120', '商品', '61.244.165.130', '2019-10-24 14:50:57', '0', '新增商品', '新增商品', null);
INSERT INTO `jsh_log` VALUES ('6363', '120', '计量单位', '61.244.165.130', '2019-10-24 14:51:33', '0', '新增计量单位', '新增计量单位', null);
INSERT INTO `jsh_log` VALUES ('6364', '120', '计量单位', '61.244.165.130', '2019-10-24 14:54:12', '0', '新增计量单位', '新增计量单位', null);
INSERT INTO `jsh_log` VALUES ('6365', '120', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 14:55:52', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6366', '120', '商家', '61.244.165.130', '2019-10-24 14:56:11', '0', '新增商家', '新增商家', null);
INSERT INTO `jsh_log` VALUES ('6367', '120', '商家', '61.244.165.130', '2019-10-24 14:56:34', '0', '新增商家', '新增商家', null);
INSERT INTO `jsh_log` VALUES ('6368', '120', '商家', '61.244.165.130', '2019-10-24 14:57:32', '0', '新增商家', '新增商家', null);
INSERT INTO `jsh_log` VALUES ('6369', '120', '商品', '0:0:0:0:0:0:0:1', '2019-10-24 14:59:27', '0', '新增商品', '新增商品', null);
INSERT INTO `jsh_log` VALUES ('6370', '120', '商家', '0:0:0:0:0:0:0:1', '2019-10-24 15:01:20', '0', '新增商家', '新增商家', null);
INSERT INTO `jsh_log` VALUES ('6371', '120', '商家', '61.244.165.130', '2019-10-24 15:04:27', '0', '新增商家', '新增商家', null);
INSERT INTO `jsh_log` VALUES ('6372', '120', '商品', '61.244.165.130', '2019-10-24 15:05:09', '0', '删除,id:588,587,586商品', '删除,id:588,587,586商品', null);
INSERT INTO `jsh_log` VALUES ('6373', '120', '商家', '61.244.165.130', '2019-10-24 15:06:29', '0', '删除,id:76,74商家', '删除,id:76,74商家', null);
INSERT INTO `jsh_log` VALUES ('6374', '120', '单据', '61.244.165.130', '2019-10-24 15:14:44', '0', '修改,id:166单据', '修改,id:166单据', null);
INSERT INTO `jsh_log` VALUES ('6375', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:20', '0', '删除,id:15,14,13,12,11,10,9,7仓库', '删除,id:15,14,13,12,11,10,9,7仓库', null);
INSERT INTO `jsh_log` VALUES ('6376', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:32', '0', '删除,id:8仓库', '删除,id:8仓库', null);
INSERT INTO `jsh_log` VALUES ('6377', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:38', '0', '修改,id:2仓库', '修改,id:2仓库', null);
INSERT INTO `jsh_log` VALUES ('6378', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:38', '0', '修改,id:1仓库', '修改,id:1仓库', null);
INSERT INTO `jsh_log` VALUES ('6379', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:39', '0', '修改,id:3仓库', '修改,id:3仓库', null);
INSERT INTO `jsh_log` VALUES ('6380', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:44', '0', '修改,id:2仓库', '修改,id:2仓库', null);
INSERT INTO `jsh_log` VALUES ('6381', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:44', '0', '修改,id:1仓库', '修改,id:1仓库', null);
INSERT INTO `jsh_log` VALUES ('6382', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:44', '0', '修改,id:3仓库', '修改,id:3仓库', null);
INSERT INTO `jsh_log` VALUES ('6383', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:48', '0', '修改,id:2仓库', '修改,id:2仓库', null);
INSERT INTO `jsh_log` VALUES ('6384', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:48', '0', '修改,id:1仓库', '修改,id:1仓库', null);
INSERT INTO `jsh_log` VALUES ('6385', '120', '仓库', '61.244.165.130', '2019-10-24 15:18:48', '0', '修改,id:3仓库', '修改,id:3仓库', null);
INSERT INTO `jsh_log` VALUES ('6386', '120', '收支项目', '61.244.165.130', '2019-10-24 15:19:30', '0', '删除,id:1,5,7,8,9,10,11,12,13,14,15收支项目', '删除,id:1,5,7,8,9,10,11,12,13,14,15收支项目', null);
INSERT INTO `jsh_log` VALUES ('6387', '120', '收支项目', '61.244.165.130', '2019-10-24 15:19:42', '0', '删除,id:18,19,20收支项目', '删除,id:18,19,20收支项目', null);
INSERT INTO `jsh_log` VALUES ('6388', '120', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 15:23:33', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6389', '120', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 15:25:29', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6390', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 15:25:43', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6400', '63', '单据', '0:0:0:0:0:0:0:1', '2019-10-24 15:27:23', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6401', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 15:27:24', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6402', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 15:27:24', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6403', '63', '单据', '0:0:0:0:0:0:0:1', '2019-10-24 15:28:08', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6404', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 15:28:08', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6405', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 15:28:08', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6406', '63', '单据', '0:0:0:0:0:0:0:1', '2019-10-24 15:30:40', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6407', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 15:30:40', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6408', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 15:30:40', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6409', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 15:36:58', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6410', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 15:46:03', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6411', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 15:49:54', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6412', '63', '用户', '61.244.165.130', '2019-10-24 15:49:59', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6413', '63', '商家', '61.244.165.130', '2019-10-24 15:50:53', '0', '删除,id:71,59,58,56,52,48,6,5,2商家', '删除,id:71,59,58,56,52,48,6,5,2商家', '63');
INSERT INTO `jsh_log` VALUES ('6414', '63', '商家', '61.244.165.130', '2019-10-24 15:51:27', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6415', '63', '商家', '61.244.165.130', '2019-10-24 15:51:44', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6416', '63', '商家', '61.244.165.130', '2019-10-24 15:52:04', '0', '删除,id:57,55,54,51,50,47,46,4,1商家', '删除,id:57,55,54,51,50,47,46,4,1商家', '63');
INSERT INTO `jsh_log` VALUES ('6417', '63', '商家', '61.244.165.130', '2019-10-24 15:52:36', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6418', '63', '商家', '61.244.165.130', '2019-10-24 15:52:57', '0', '修改,id:68商家', '修改,id:68商家', '63');
INSERT INTO `jsh_log` VALUES ('6419', '63', '仓库', '61.244.165.130', '2019-10-24 15:53:19', '0', '删除,id:3仓库', '删除,id:3仓库', '63');
INSERT INTO `jsh_log` VALUES ('6420', '63', '仓库', '61.244.165.130', '2019-10-24 15:53:40', '0', '新增仓库', '新增仓库', '63');
INSERT INTO `jsh_log` VALUES ('6421', '63', '仓库', '61.244.165.130', '2019-10-24 15:53:48', '0', '新增仓库', '新增仓库', '63');
INSERT INTO `jsh_log` VALUES ('6422', '63', '仓库', '61.244.165.130', '2019-10-24 15:53:49', '0', '新增仓库', '新增仓库', '63');
INSERT INTO `jsh_log` VALUES ('6423', '63', '仓库', '61.244.165.130', '2019-10-24 15:54:00', '0', '删除,id:18仓库', '删除,id:18仓库', '63');
INSERT INTO `jsh_log` VALUES ('6424', '63', '仓库', '61.244.165.130', '2019-10-24 15:54:09', '0', '修改,id:16仓库', '修改,id:16仓库', '63');
INSERT INTO `jsh_log` VALUES ('6425', '63', '仓库', '61.244.165.130', '2019-10-24 15:54:10', '0', '修改,id:17仓库', '修改,id:17仓库', '63');
INSERT INTO `jsh_log` VALUES ('6426', '63', '账户', '61.244.165.130', '2019-10-24 15:54:28', '0', '删除,id:15账户', '删除,id:15账户', '63');
INSERT INTO `jsh_log` VALUES ('6427', '63', '用户', '61.244.165.130', '2019-10-24 15:58:14', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6428', '63', '计量单位', '61.244.165.130', '2019-10-24 16:00:22', '0', '新增计量单位', '新增计量单位', '63');
INSERT INTO `jsh_log` VALUES ('6429', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 16:09:04', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6430', '120', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 16:10:33', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6431', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 16:18:35', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6432', '120', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 16:19:02', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6433', '63', '用户', '61.244.165.130', '2019-10-24 16:19:45', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6434', '120', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 16:27:24', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6435', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 16:29:32', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6436', '63', '用户', '61.244.165.130', '2019-10-24 16:31:43', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6437', '120', '用户', '61.244.165.130', '2019-10-24 16:33:39', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6438', '63', '用户', '61.244.165.130', '2019-10-24 16:34:26', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6439', '63', '用户', '61.244.165.130', '2019-10-24 16:36:36', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6440', '63', '用户', '61.244.165.130', '2019-10-24 16:39:35', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6441', '63', '用户', '61.244.165.130', '2019-10-24 16:43:30', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6442', '63', '单据', '61.244.165.130', '2019-10-24 16:49:40', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6443', '63', '单据明细', '61.244.165.130', '2019-10-24 16:49:40', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6444', '63', '单据明细', '61.244.165.130', '2019-10-24 16:49:40', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6445', '63', '单据', '61.244.165.130', '2019-10-24 16:50:28', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6446', '63', '单据明细', '61.244.165.130', '2019-10-24 16:50:28', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6447', '63', '单据明细', '61.244.165.130', '2019-10-24 16:50:28', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6448', '120', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 17:09:38', '0', '登录,id:120用户', '登录,id:120用户', null);
INSERT INTO `jsh_log` VALUES ('6449', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 17:11:02', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6450', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 17:21:55', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6451', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 17:26:09', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6452', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 17:29:01', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6453', '63', '用户', '0:0:0:0:0:0:0:1', '2019-10-24 17:31:03', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6454', '63', '用户', '61.244.165.130', '2019-10-24 17:51:46', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6455', '63', '单据', '61.244.165.130', '2019-10-24 17:53:59', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6456', '63', '单据明细', '61.244.165.130', '2019-10-24 17:53:59', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6457', '63', '单据明细', '61.244.165.130', '2019-10-24 17:53:59', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6458', '63', '单据', '0:0:0:0:0:0:0:1', '2019-10-24 17:56:46', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6459', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 17:56:46', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6460', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 17:56:46', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6461', '63', '单据', '0:0:0:0:0:0:0:1', '2019-10-24 17:57:35', '0', '修改,id:208单据', '修改,id:208单据', '63');
INSERT INTO `jsh_log` VALUES ('6462', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 17:57:35', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6463', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 17:57:35', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6464', '63', '单据', '0:0:0:0:0:0:0:1', '2019-10-24 17:59:41', '0', '修改,id:208单据', '修改,id:208单据', '63');
INSERT INTO `jsh_log` VALUES ('6465', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 17:59:41', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6466', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 17:59:41', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6467', '63', '单据', '0:0:0:0:0:0:0:1', '2019-10-24 18:02:58', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6468', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 18:02:58', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6469', '63', '单据明细', '0:0:0:0:0:0:0:1', '2019-10-24 18:02:58', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6470', '63', '单据', '61.244.165.130', '2019-10-24 18:05:43', '0', '修改,id:208单据', '修改,id:208单据', '63');
INSERT INTO `jsh_log` VALUES ('6471', '63', '单据明细', '61.244.165.130', '2019-10-24 18:05:43', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6472', '63', '单据明细', '61.244.165.130', '2019-10-24 18:05:43', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6473', '63', '用户', '112.97.56.51/112.97.56.51', '2019-10-24 19:04:02', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6474', '63', '用户', '112.97.56.51/112.97.56.51', '2019-10-24 19:26:38', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6475', '63', '用户', '112.97.56.51/112.97.56.51', '2019-10-24 19:44:33', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6476', '63', '用户', '112.97.56.51/112.97.56.51', '2019-10-24 19:53:16', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6477', '63', '用户', '112.97.56.51/112.97.56.51', '2019-10-24 19:53:16', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6478', '63', '用户', '112.97.56.51/112.97.56.51', '2019-10-24 19:53:16', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6479', '63', '用户', '112.97.56.51/112.97.56.51', '2019-10-24 19:53:16', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6480', '63', '用户', '112.97.56.51/112.97.56.51', '2019-10-24 19:53:16', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6481', '63', '用户', '124.117.117.86', '2019-10-24 22:32:24', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6482', '63', '用户', '124.117.117.86', '2019-10-24 23:06:29', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6483', '63', '用户', '117.136.79.109', '2019-10-24 23:27:09', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6484', '63', '用户', '124.117.113.63', '2019-10-25 11:20:19', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6485', '63', '商品', '124.117.113.63', '2019-10-25 11:21:07', '0', '删除,id:585,579,577,570,569,568商品', '删除,id:585,579,577,570,569,568商品', '63');
INSERT INTO `jsh_log` VALUES ('6486', '63', '商品类型', '124.117.113.63', '2019-10-25 11:23:22', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6487', '63', '商品类型', '124.117.113.63', '2019-10-25 11:23:48', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6488', '63', '商品类型', '124.117.113.63', '2019-10-25 11:24:03', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6489', '63', '商品类型', '124.117.113.63', '2019-10-25 11:24:31', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6490', '63', '商品类型', '124.117.113.63', '2019-10-25 11:24:42', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6491', '63', '商品类型', '124.117.113.63', '2019-10-25 11:25:17', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6492', '63', '商品类型', '124.117.113.63', '2019-10-25 11:25:29', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6493', '63', '商品类型', '124.117.113.63', '2019-10-25 11:26:01', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6494', '63', '商品', '124.117.113.63', '2019-10-25 11:28:52', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6495', '63', '商品', '124.117.113.63', '2019-10-25 11:30:29', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6496', '63', '用户', '124.117.113.63', '2019-10-25 12:27:05', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6497', '63', '商品', '124.117.113.63', '2019-10-25 12:29:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6498', '63', '用户', '124.117.113.63', '2019-10-25 12:39:40', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6504', '63', '用户', '124.117.113.63', '2019-10-25 12:54:27', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6505', '63', '商家', '124.117.113.63', '2019-10-25 12:58:11', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6506', '63', '商家', '124.117.113.63', '2019-10-25 12:59:39', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6507', '63', '商家', '124.117.113.63', '2019-10-25 13:02:05', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6508', '63', '商家', '124.117.113.63', '2019-10-25 13:03:05', '0', '删除,id:83,82商家', '删除,id:83,82商家', '63');
INSERT INTO `jsh_log` VALUES ('6509', '63', '商家', '124.117.113.63', '2019-10-25 13:03:34', '0', '删除,id:84,80,79商家', '删除,id:84,80,79商家', '63');
INSERT INTO `jsh_log` VALUES ('6510', '63', '商家', '124.117.113.63', '2019-10-25 13:03:56', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6511', '63', '商家', '124.117.113.63', '2019-10-25 13:05:31', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6512', '63', '商家', '124.117.113.63', '2019-10-25 13:07:09', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6513', '63', '商品', '124.117.113.63', '2019-10-25 13:14:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6514', '63', '商品', '124.117.113.63', '2019-10-25 13:15:27', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6515', '63', '商品', '124.117.113.63', '2019-10-25 13:16:12', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6516', '63', '商品', '124.117.113.63', '2019-10-25 13:18:04', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6517', '63', '商品', '124.117.113.63', '2019-10-25 13:18:59', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6518', '63', '商品', '124.117.113.63', '2019-10-25 13:19:42', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6519', '63', '商品', '124.117.113.63', '2019-10-25 13:20:47', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6520', '63', '商品', '124.117.113.63', '2019-10-25 13:21:32', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6521', '63', '商品', '124.117.113.63', '2019-10-25 13:22:59', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6522', '63', '商品', '124.117.113.63', '2019-10-25 13:25:03', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6523', '63', '商品', '124.117.113.63', '2019-10-25 13:25:37', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6524', '63', '商品', '124.117.113.63', '2019-10-25 13:26:08', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6525', '63', '商品', '124.117.113.63', '2019-10-25 13:27:17', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6526', '63', '商品', '124.117.113.63', '2019-10-25 13:28:05', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6527', '63', '商品', '124.117.113.63', '2019-10-25 13:28:50', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6528', '63', '用户', '124.117.113.63', '2019-10-25 14:07:00', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6529', '63', '商家', '124.117.113.63', '2019-10-25 14:08:36', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6530', '63', '商品', '124.117.113.63', '2019-10-25 14:09:58', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6531', '63', '商品类型', '124.117.113.63', '2019-10-25 14:11:04', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6532', '63', '商品', '124.117.113.63', '2019-10-25 14:12:40', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6533', '63', '商品', '124.117.113.63', '2019-10-25 14:13:32', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6558', '63', '商品', '124.117.113.63', '2019-10-25 14:18:17', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6559', '63', '商品', '124.117.113.63', '2019-10-25 14:18:58', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6561', '63', '商品', '124.117.113.63', '2019-10-25 14:20:43', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6562', '63', '商品', '124.117.113.63', '2019-10-25 14:21:58', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6563', '63', '单据', '124.117.113.63', '2019-10-25 14:23:58', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6564', '63', '单据明细', '124.117.113.63', '2019-10-25 14:23:58', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6565', '63', '单据明细', '124.117.113.63', '2019-10-25 14:23:58', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6566', '63', '商品', '124.117.113.63', '2019-10-25 14:25:43', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6567', '63', '商品', '124.117.113.63', '2019-10-25 14:25:56', '0', '修改,id:615商品', '修改,id:615商品', '63');
INSERT INTO `jsh_log` VALUES ('6568', '63', '商品', '124.117.113.63', '2019-10-25 14:27:50', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6569', '63', '商品类型', '124.117.113.63', '2019-10-25 14:28:04', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6570', '63', '商品', '124.117.113.63', '2019-10-25 14:28:13', '0', '修改,id:617商品', '修改,id:617商品', '63');
INSERT INTO `jsh_log` VALUES ('6571', '63', '商品', '124.117.113.63', '2019-10-25 14:29:16', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6572', '63', '商品', '124.117.113.63', '2019-10-25 14:30:08', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6573', '63', '单据', '124.117.113.63', '2019-10-25 14:30:48', '0', '修改,id:210单据', '修改,id:210单据', '63');
INSERT INTO `jsh_log` VALUES ('6574', '63', '单据明细', '124.117.113.63', '2019-10-25 14:30:48', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6575', '63', '单据明细', '124.117.113.63', '2019-10-25 14:30:48', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6576', '63', '单据', '124.117.113.63', '2019-10-25 14:32:25', '0', '修改,id:210单据', '修改,id:210单据', '63');
INSERT INTO `jsh_log` VALUES ('6577', '63', '单据明细', '124.117.113.63', '2019-10-25 14:32:25', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6578', '63', '单据明细', '124.117.113.63', '2019-10-25 14:32:25', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6579', '63', '单据', '124.117.113.63', '2019-10-25 14:32:38', '0', '修改,id:210单据', '修改,id:210单据', '63');
INSERT INTO `jsh_log` VALUES ('6580', '63', '单据明细', '124.117.113.63', '2019-10-25 14:32:38', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6581', '63', '单据明细', '124.117.113.63', '2019-10-25 14:32:38', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6582', '63', '单据', '124.117.113.63', '2019-10-25 15:19:18', '0', '修改,id:210单据', '修改,id:210单据', '63');
INSERT INTO `jsh_log` VALUES ('6583', '63', '单据明细', '124.117.113.63', '2019-10-25 15:19:18', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6584', '63', '单据明细', '124.117.113.63', '2019-10-25 15:19:19', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6585', '63', '商家', '124.117.113.63', '2019-10-25 15:21:24', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6586', '63', '商品', '124.117.113.63', '2019-10-25 15:22:42', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6587', '63', '商品', '124.117.113.63', '2019-10-25 15:24:00', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6588', '63', '商品类型', '124.117.113.63', '2019-10-25 15:24:32', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6589', '63', '商品', '124.117.113.63', '2019-10-25 15:24:43', '0', '修改,id:621商品', '修改,id:621商品', '63');
INSERT INTO `jsh_log` VALUES ('6590', '63', '商品', '124.117.113.63', '2019-10-25 15:24:57', '0', '修改,id:613商品', '修改,id:613商品', '63');
INSERT INTO `jsh_log` VALUES ('6591', '63', '商品', '124.117.113.63', '2019-10-25 15:26:14', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6592', '63', '商品', '124.117.113.63', '2019-10-25 15:27:14', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6593', '63', '商品', '124.117.113.63', '2019-10-25 15:29:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6594', '63', '商品', '124.117.113.63', '2019-10-25 15:30:40', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6600', '63', '商品', '124.117.113.63', '2019-10-25 15:37:32', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6601', '63', '商品', '124.117.113.63', '2019-10-25 15:38:14', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6602', '63', '商品', '124.117.113.63', '2019-10-25 15:39:05', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6603', '63', '商品', '124.117.113.63', '2019-10-25 15:40:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6604', '63', '商品', '124.117.113.63', '2019-10-25 15:40:57', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6605', '63', '商品类型', '124.117.113.63', '2019-10-25 15:41:19', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6606', '63', '商品', '124.117.113.63', '2019-10-25 15:42:28', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6607', '63', '用户', '124.117.113.63', '2019-10-25 15:43:36', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6608', '63', '单据', '124.117.113.63', '2019-10-25 15:45:42', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6609', '63', '单据明细', '124.117.113.63', '2019-10-25 15:45:42', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6610', '63', '单据明细', '124.117.113.63', '2019-10-25 15:45:42', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6611', '63', '商品', '124.117.113.63', '2019-10-25 15:46:06', '0', '修改,id:631商品', '修改,id:631商品', '63');
INSERT INTO `jsh_log` VALUES ('6612', '63', '商家', '124.117.113.63', '2019-10-25 15:48:28', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6613', '63', '商家', '124.117.113.63', '2019-10-25 15:48:42', '0', '修改,id:89商家', '修改,id:89商家', '63');
INSERT INTO `jsh_log` VALUES ('6614', '63', '商品', '124.117.113.63', '2019-10-25 15:50:01', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6615', '63', '商品', '124.117.113.63', '2019-10-25 15:51:02', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6616', '63', '商品', '124.117.113.63', '2019-10-25 15:52:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6617', '63', '商品', '124.117.113.63', '2019-10-25 15:56:54', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6618', '63', '商品', '124.117.113.63', '2019-10-25 15:57:04', '0', '修改,id:633商品', '修改,id:633商品', '63');
INSERT INTO `jsh_log` VALUES ('6619', '63', '商品', '124.117.113.63', '2019-10-25 16:02:46', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6620', '63', '商品', '124.117.113.63', '2019-10-25 16:03:33', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6621', '63', '商品', '124.117.113.63', '2019-10-25 16:04:28', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6622', '63', '商品', '124.117.113.63', '2019-10-25 16:05:09', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6623', '63', '商品', '124.117.113.63', '2019-10-25 16:05:18', '0', '修改,id:639商品', '修改,id:639商品', '63');
INSERT INTO `jsh_log` VALUES ('6624', '63', '商品', '124.117.113.63', '2019-10-25 16:06:00', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6625', '63', '商品', '124.117.113.63', '2019-10-25 16:06:31', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6626', '63', '商品', '124.117.113.63', '2019-10-25 16:06:47', '0', '修改,id:641商品', '修改,id:641商品', '63');
INSERT INTO `jsh_log` VALUES ('6627', '63', '商品', '124.117.113.63', '2019-10-25 16:07:59', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6628', '63', '商品', '124.117.113.63', '2019-10-25 16:08:23', '0', '修改,id:641商品', '修改,id:641商品', '63');
INSERT INTO `jsh_log` VALUES ('6629', '63', '商品', '124.117.113.63', '2019-10-25 16:09:11', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6630', '63', '商品', '124.117.113.63', '2019-10-25 16:10:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6631', '63', '商品', '124.117.113.63', '2019-10-25 16:10:57', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6632', '63', '商品', '124.117.113.63', '2019-10-25 16:11:55', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6633', '63', '商品', '124.117.113.63', '2019-10-25 16:12:43', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6634', '63', '商品', '124.117.113.63', '2019-10-25 16:14:21', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6635', '63', '用户', '124.117.113.63', '2019-10-25 16:20:06', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6636', '63', '商品', '124.117.113.63', '2019-10-25 16:21:03', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6637', '63', '商品', '124.117.113.63', '2019-10-25 16:21:38', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6638', '63', '商品', '124.117.113.63', '2019-10-25 16:22:18', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6639', '63', '商品', '124.117.113.63', '2019-10-25 16:23:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6640', '63', '商品', '124.117.113.63', '2019-10-25 16:24:36', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6641', '63', '商品', '124.117.113.63', '2019-10-25 16:25:40', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6642', '63', '商品', '124.117.113.63', '2019-10-25 16:26:24', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6643', '63', '商品', '124.117.113.63', '2019-10-25 16:26:56', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6644', '63', '商品', '124.117.113.63', '2019-10-25 16:27:06', '0', '修改,id:656商品', '修改,id:656商品', '63');
INSERT INTO `jsh_log` VALUES ('6645', '63', '商品', '124.117.113.63', '2019-10-25 16:27:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6646', '63', '商品', '124.117.113.63', '2019-10-25 16:28:20', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6647', '63', '商品', '124.117.113.63', '2019-10-25 16:28:55', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6648', '63', '商品', '124.117.113.63', '2019-10-25 16:29:37', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6649', '63', '商品', '124.117.113.63', '2019-10-25 16:30:11', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6650', '63', '商品', '124.117.113.63', '2019-10-25 16:30:47', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6651', '63', '商品', '124.117.113.63', '2019-10-25 16:31:25', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6652', '63', '商品', '124.117.113.63', '2019-10-25 16:35:26', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6653', '63', '商品', '124.117.113.63', '2019-10-25 16:37:40', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6654', '63', '商品', '124.117.113.63', '2019-10-25 16:39:26', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6655', '63', '商品', '124.117.113.63', '2019-10-25 16:40:18', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6656', '63', '商品', '124.117.113.63', '2019-10-25 16:41:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6657', '63', '单据', '124.117.113.63', '2019-10-25 16:47:16', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6658', '63', '单据明细', '124.117.113.63', '2019-10-25 16:47:16', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6659', '63', '单据明细', '124.117.113.63', '2019-10-25 16:47:16', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6660', '63', '商品', '124.117.113.63', '2019-10-25 16:49:22', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6661', '63', '商品', '124.117.113.63', '2019-10-25 16:51:08', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6662', '63', '商品', '124.117.113.63', '2019-10-25 16:52:29', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6663', '63', '商品', '124.117.113.63', '2019-10-25 16:53:36', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6664', '63', '商品', '124.117.113.63', '2019-10-25 16:54:26', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6665', '63', '商品', '124.117.113.63', '2019-10-25 16:55:07', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6666', '63', '商品', '124.117.113.63', '2019-10-25 16:55:49', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6667', '63', '商品', '124.117.113.63', '2019-10-25 16:56:28', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6668', '63', '商品', '124.117.113.63', '2019-10-25 16:56:43', '0', '修改,id:675商品', '修改,id:675商品', '63');
INSERT INTO `jsh_log` VALUES ('6669', '63', '商品', '124.117.113.63', '2019-10-25 16:57:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6670', '63', '商品', '124.117.113.63', '2019-10-25 16:57:55', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6671', '63', '商品', '124.117.113.63', '2019-10-25 16:58:30', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6672', '63', '商品', '124.117.113.63', '2019-10-25 16:59:04', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6673', '63', '商品', '124.117.113.63', '2019-10-25 17:00:35', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6674', '63', '商品', '124.117.113.63', '2019-10-25 17:01:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6675', '63', '商品', '124.117.113.63', '2019-10-25 17:01:43', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6676', '63', '商品', '124.117.113.63', '2019-10-25 17:02:43', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6677', '63', '商品', '124.117.113.63', '2019-10-25 17:15:07', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6678', '63', '商品', '124.117.113.63', '2019-10-25 17:15:52', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6679', '63', '商品', '124.117.113.63', '2019-10-25 17:16:47', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6680', '63', '商品', '124.117.113.63', '2019-10-25 17:17:24', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6681', '63', '商品', '124.117.113.63', '2019-10-25 17:18:16', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6682', '63', '商品', '124.117.113.63', '2019-10-25 17:18:26', '0', '修改,id:689商品', '修改,id:689商品', '63');
INSERT INTO `jsh_log` VALUES ('6683', '63', '商品', '124.117.113.63', '2019-10-25 17:18:56', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6684', '63', '商品', '124.117.113.63', '2019-10-25 17:19:30', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6685', '63', '商品', '124.117.113.63', '2019-10-25 17:19:53', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6686', '63', '商品', '124.117.113.63', '2019-10-25 17:22:40', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6687', '63', '商品', '124.117.113.63', '2019-10-25 17:23:29', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6688', '63', '商品', '124.117.113.63', '2019-10-25 17:24:01', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6689', '63', '商品', '124.117.113.63', '2019-10-25 17:25:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6690', '63', '商品', '124.117.113.63', '2019-10-25 17:25:46', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6691', '63', '商品', '124.117.113.63', '2019-10-25 17:26:30', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6692', '63', '商品', '124.117.113.63', '2019-10-25 17:27:45', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6693', '63', '商品', '124.117.113.63', '2019-10-25 17:28:22', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6694', '63', '商品', '124.117.113.63', '2019-10-25 17:29:14', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6695', '63', '商品', '124.117.113.63', '2019-10-25 17:29:21', '0', '修改,id:701商品', '修改,id:701商品', '63');
INSERT INTO `jsh_log` VALUES ('6696', '63', '商品', '124.117.113.63', '2019-10-25 17:30:16', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6697', '63', '商品', '124.117.113.63', '2019-10-25 17:30:57', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6698', '63', '商品', '124.117.113.63', '2019-10-25 17:31:39', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6699', '63', '商品', '124.117.113.63', '2019-10-25 17:33:23', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6700', '63', '商品', '124.117.113.63', '2019-10-25 17:34:14', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6701', '63', '商品', '124.117.113.63', '2019-10-25 17:34:56', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6702', '63', '商品', '124.117.113.63', '2019-10-25 17:36:09', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6703', '63', '商品', '124.117.113.63', '2019-10-25 17:36:47', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6704', '63', '商品', '124.117.113.63', '2019-10-25 17:37:27', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6705', '63', '商品', '124.117.113.63', '2019-10-25 17:59:43', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6706', '63', '商品', '124.117.113.63', '2019-10-25 18:04:05', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6707', '63', '商家', '124.117.113.63', '2019-10-25 18:04:58', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6708', '63', '用户', '124.117.113.63', '2019-10-25 18:05:44', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6709', '63', '单据', '124.117.113.63', '2019-10-25 18:06:18', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6710', '63', '单据明细', '124.117.113.63', '2019-10-25 18:06:18', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6711', '63', '单据明细', '124.117.113.63', '2019-10-25 18:06:18', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6712', '63', '商品', '124.117.113.63', '2019-10-25 18:07:27', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6713', '63', '商品', '124.117.113.63', '2019-10-25 18:08:18', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6714', '63', '商品', '124.117.113.63', '2019-10-25 18:09:33', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6715', '63', '商品', '124.117.113.63', '2019-10-25 18:10:19', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6716', '63', '商品', '124.117.113.63', '2019-10-25 18:10:59', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6717', '63', '商品', '124.117.113.63', '2019-10-25 18:12:02', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6718', '63', '商品', '124.117.113.63', '2019-10-25 18:13:29', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6719', '63', '商品', '124.117.113.63', '2019-10-25 18:14:27', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6720', '63', '商品', '124.117.113.63', '2019-10-25 18:14:43', '0', '修改,id:719商品', '修改,id:719商品', '63');
INSERT INTO `jsh_log` VALUES ('6721', '63', '商品', '124.117.113.63', '2019-10-25 18:16:26', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6722', '63', '商品', '124.117.113.63', '2019-10-25 18:17:05', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6723', '63', '商品', '124.117.113.63', '2019-10-25 18:18:09', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6724', '63', '商品', '124.117.113.63', '2019-10-25 18:20:14', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6725', '63', '商品', '124.117.113.63', '2019-10-25 18:21:14', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6726', '63', '商品', '124.117.113.63', '2019-10-25 18:21:55', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6727', '63', '商品', '124.117.113.63', '2019-10-25 18:22:21', '0', '修改,id:726商品', '修改,id:726商品', '63');
INSERT INTO `jsh_log` VALUES ('6728', '63', '商品', '124.117.113.63', '2019-10-25 18:23:08', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6729', '63', '商品', '124.117.113.63', '2019-10-25 18:23:32', '0', '修改,id:725商品', '修改,id:725商品', '63');
INSERT INTO `jsh_log` VALUES ('6730', '63', '商品', '124.117.113.63', '2019-10-25 18:24:09', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6731', '63', '商品', '124.117.113.63', '2019-10-25 18:24:16', '0', '修改,id:727商品', '修改,id:727商品', '63');
INSERT INTO `jsh_log` VALUES ('6732', '63', '商品', '124.117.113.63', '2019-10-25 18:25:05', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6733', '63', '商品', '124.117.113.63', '2019-10-25 18:25:54', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6734', '63', '商品', '124.117.113.63', '2019-10-25 18:26:34', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6735', '63', '商品', '124.117.113.63', '2019-10-25 18:27:39', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6736', '63', '商品', '124.117.113.63', '2019-10-25 18:28:21', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6737', '63', '商品', '124.117.113.63', '2019-10-25 18:29:01', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6738', '63', '商品', '124.117.113.63', '2019-10-25 18:29:48', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6739', '63', '单据', '124.117.113.63', '2019-10-25 18:31:08', '0', '修改,id:213单据', '修改,id:213单据', '63');
INSERT INTO `jsh_log` VALUES ('6740', '63', '单据明细', '124.117.113.63', '2019-10-25 18:31:08', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6741', '63', '单据明细', '124.117.113.63', '2019-10-25 18:31:08', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6742', '63', '商品', '124.117.113.63', '2019-10-25 18:32:32', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6743', '63', '商品', '124.117.113.63', '2019-10-25 18:34:40', '0', '修改,id:736商品', '修改,id:736商品', '63');
INSERT INTO `jsh_log` VALUES ('6744', '63', '商品', '124.117.113.63', '2019-10-25 18:35:57', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6745', '63', '商家', '124.117.113.63', '2019-10-25 18:37:44', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6746', '63', '商品类型', '124.117.113.63', '2019-10-25 18:38:56', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6747', '63', '商品', '124.117.113.63', '2019-10-25 18:41:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6748', '63', '商品', '124.117.113.63', '2019-10-25 18:42:07', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6749', '63', '商品', '124.117.113.63', '2019-10-25 18:43:32', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6750', '63', '商品', '124.117.113.63', '2019-10-25 18:44:08', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6751', '63', '商品类型', '124.117.113.63', '2019-10-25 18:48:00', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6752', '63', '商品类型', '124.117.113.63', '2019-10-25 18:49:35', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6753', '63', '商品类型', '124.117.113.63', '2019-10-25 18:50:22', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6754', '63', '用户', '124.117.113.63', '2019-10-25 18:52:22', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6755', '63', '用户', '124.117.113.63', '2019-10-26 11:56:30', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6756', '63', '用户', '124.117.113.63', '2019-10-26 13:15:29', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6757', '63', '商品类型', '124.117.113.63', '2019-10-26 13:19:17', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6758', '63', '商品类型', '124.117.113.63', '2019-10-26 13:19:56', '0', '删除,id:33,30,29,27,26,25,24,23,22,21,19,18商品类型', '删除,id:33,30,29,27,26,25,24,23,22,21,19,18商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6759', '63', '商品类型', '124.117.113.63', '2019-10-26 13:20:09', '0', '删除,id:20商品类型', '删除,id:20商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6760', '63', '商品类型', '124.117.113.63', '2019-10-26 13:20:36', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6761', '63', '商品类型', '124.117.113.63', '2019-10-26 13:20:45', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6762', '63', '商品类型', '124.117.113.63', '2019-10-26 13:20:54', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6763', '63', '商品类型', '124.117.113.63', '2019-10-26 13:21:13', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6764', '63', '商品类型', '124.117.113.63', '2019-10-26 13:22:00', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6765', '63', '商品', '124.117.113.63', '2019-10-26 13:22:25', '0', '修改,id:741商品', '修改,id:741商品', '63');
INSERT INTO `jsh_log` VALUES ('6766', '63', '商品', '124.117.113.63', '2019-10-26 13:22:32', '0', '修改,id:740商品', '修改,id:740商品', '63');
INSERT INTO `jsh_log` VALUES ('6767', '63', '商品', '124.117.113.63', '2019-10-26 13:22:40', '0', '修改,id:739商品', '修改,id:739商品', '63');
INSERT INTO `jsh_log` VALUES ('6768', '63', '商品', '124.117.113.63', '2019-10-26 13:22:48', '0', '修改,id:738商品', '修改,id:738商品', '63');
INSERT INTO `jsh_log` VALUES ('6769', '63', '商品类型', '124.117.113.63', '2019-10-26 13:23:06', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6770', '63', '商品', '124.117.113.63', '2019-10-26 13:23:20', '0', '修改,id:737商品', '修改,id:737商品', '63');
INSERT INTO `jsh_log` VALUES ('6771', '63', '商品', '124.117.113.63', '2019-10-26 13:23:28', '0', '修改,id:736商品', '修改,id:736商品', '63');
INSERT INTO `jsh_log` VALUES ('6772', '63', '商品', '124.117.113.63', '2019-10-26 13:23:36', '0', '修改,id:735商品', '修改,id:735商品', '63');
INSERT INTO `jsh_log` VALUES ('6773', '63', '商品', '124.117.113.63', '2019-10-26 13:23:44', '0', '修改,id:734商品', '修改,id:734商品', '63');
INSERT INTO `jsh_log` VALUES ('6774', '63', '商品', '124.117.113.63', '2019-10-26 13:23:51', '0', '修改,id:733商品', '修改,id:733商品', '63');
INSERT INTO `jsh_log` VALUES ('6775', '63', '商品', '124.117.113.63', '2019-10-26 13:23:58', '0', '修改,id:732商品', '修改,id:732商品', '63');
INSERT INTO `jsh_log` VALUES ('6776', '63', '商品', '124.117.113.63', '2019-10-26 13:24:06', '0', '修改,id:731商品', '修改,id:731商品', '63');
INSERT INTO `jsh_log` VALUES ('6777', '63', '商品', '124.117.113.63', '2019-10-26 13:24:18', '0', '修改,id:730商品', '修改,id:730商品', '63');
INSERT INTO `jsh_log` VALUES ('6778', '63', '商品', '124.117.113.63', '2019-10-26 13:24:27', '0', '修改,id:729商品', '修改,id:729商品', '63');
INSERT INTO `jsh_log` VALUES ('6779', '63', '商品', '124.117.113.63', '2019-10-26 13:24:33', '0', '修改,id:728商品', '修改,id:728商品', '63');
INSERT INTO `jsh_log` VALUES ('6780', '63', '商品', '124.117.113.63', '2019-10-26 13:24:40', '0', '修改,id:727商品', '修改,id:727商品', '63');
INSERT INTO `jsh_log` VALUES ('6781', '63', '商品', '124.117.113.63', '2019-10-26 13:24:47', '0', '修改,id:726商品', '修改,id:726商品', '63');
INSERT INTO `jsh_log` VALUES ('6782', '63', '商品', '124.117.113.63', '2019-10-26 13:24:54', '0', '修改,id:725商品', '修改,id:725商品', '63');
INSERT INTO `jsh_log` VALUES ('6783', '63', '商品', '124.117.113.63', '2019-10-26 13:25:08', '0', '修改,id:724商品', '修改,id:724商品', '63');
INSERT INTO `jsh_log` VALUES ('6784', '63', '商品', '124.117.113.63', '2019-10-26 13:25:47', '0', '修改,id:723商品', '修改,id:723商品', '63');
INSERT INTO `jsh_log` VALUES ('6785', '63', '商品', '124.117.113.63', '2019-10-26 13:25:52', '0', '修改,id:722商品', '修改,id:722商品', '63');
INSERT INTO `jsh_log` VALUES ('6786', '63', '商品', '124.117.113.63', '2019-10-26 13:26:00', '0', '修改,id:721商品', '修改,id:721商品', '63');
INSERT INTO `jsh_log` VALUES ('6787', '63', '商品', '124.117.113.63', '2019-10-26 13:26:37', '0', '修改,id:720商品', '修改,id:720商品', '63');
INSERT INTO `jsh_log` VALUES ('6788', '63', '商品', '124.117.113.63', '2019-10-26 13:26:42', '0', '修改,id:719商品', '修改,id:719商品', '63');
INSERT INTO `jsh_log` VALUES ('6789', '63', '商品', '124.117.113.63', '2019-10-26 13:26:51', '0', '修改,id:718商品', '修改,id:718商品', '63');
INSERT INTO `jsh_log` VALUES ('6790', '63', '商品', '124.117.113.63', '2019-10-26 13:26:58', '0', '修改,id:717商品', '修改,id:717商品', '63');
INSERT INTO `jsh_log` VALUES ('6791', '63', '商品', '124.117.113.63', '2019-10-26 13:27:06', '0', '修改,id:716商品', '修改,id:716商品', '63');
INSERT INTO `jsh_log` VALUES ('6792', '63', '商品', '124.117.113.63', '2019-10-26 13:27:12', '0', '修改,id:715商品', '修改,id:715商品', '63');
INSERT INTO `jsh_log` VALUES ('6793', '63', '商品', '124.117.113.63', '2019-10-26 13:27:18', '0', '修改,id:714商品', '修改,id:714商品', '63');
INSERT INTO `jsh_log` VALUES ('6794', '63', '商品', '124.117.113.63', '2019-10-26 13:27:25', '0', '修改,id:713商品', '修改,id:713商品', '63');
INSERT INTO `jsh_log` VALUES ('6795', '63', '商品', '124.117.113.63', '2019-10-26 13:27:31', '0', '修改,id:712商品', '修改,id:712商品', '63');
INSERT INTO `jsh_log` VALUES ('6796', '63', '商品', '124.117.113.63', '2019-10-26 13:27:44', '0', '修改,id:711商品', '修改,id:711商品', '63');
INSERT INTO `jsh_log` VALUES ('6797', '63', '商品', '124.117.113.63', '2019-10-26 13:27:51', '0', '修改,id:710商品', '修改,id:710商品', '63');
INSERT INTO `jsh_log` VALUES ('6798', '63', '商品', '124.117.113.63', '2019-10-26 13:28:01', '0', '修改,id:709商品', '修改,id:709商品', '63');
INSERT INTO `jsh_log` VALUES ('6799', '63', '商品', '124.117.113.63', '2019-10-26 13:28:33', '0', '修改,id:708商品', '修改,id:708商品', '63');
INSERT INTO `jsh_log` VALUES ('6800', '63', '商品', '124.117.113.63', '2019-10-26 13:28:41', '0', '修改,id:707商品', '修改,id:707商品', '63');
INSERT INTO `jsh_log` VALUES ('6801', '63', '商品', '124.117.113.63', '2019-10-26 13:28:47', '0', '修改,id:706商品', '修改,id:706商品', '63');
INSERT INTO `jsh_log` VALUES ('6802', '63', '商品', '124.117.113.63', '2019-10-26 13:28:54', '0', '修改,id:705商品', '修改,id:705商品', '63');
INSERT INTO `jsh_log` VALUES ('6803', '63', '商品', '124.117.113.63', '2019-10-26 13:29:01', '0', '修改,id:704商品', '修改,id:704商品', '63');
INSERT INTO `jsh_log` VALUES ('6804', '63', '商品', '124.117.113.63', '2019-10-26 13:29:09', '0', '修改,id:703商品', '修改,id:703商品', '63');
INSERT INTO `jsh_log` VALUES ('6805', '63', '商品', '124.117.113.63', '2019-10-26 13:29:15', '0', '修改,id:702商品', '修改,id:702商品', '63');
INSERT INTO `jsh_log` VALUES ('6806', '63', '商品', '124.117.113.63', '2019-10-26 13:29:21', '0', '修改,id:701商品', '修改,id:701商品', '63');
INSERT INTO `jsh_log` VALUES ('6807', '63', '商品', '124.117.113.63', '2019-10-26 13:29:28', '0', '修改,id:700商品', '修改,id:700商品', '63');
INSERT INTO `jsh_log` VALUES ('6808', '63', '商品', '124.117.113.63', '2019-10-26 13:29:34', '0', '修改,id:699商品', '修改,id:699商品', '63');
INSERT INTO `jsh_log` VALUES ('6809', '63', '商品', '124.117.113.63', '2019-10-26 13:29:44', '0', '修改,id:698商品', '修改,id:698商品', '63');
INSERT INTO `jsh_log` VALUES ('6810', '63', '商品', '124.117.113.63', '2019-10-26 13:29:51', '0', '修改,id:697商品', '修改,id:697商品', '63');
INSERT INTO `jsh_log` VALUES ('6811', '63', '商品', '124.117.113.63', '2019-10-26 13:29:57', '0', '修改,id:696商品', '修改,id:696商品', '63');
INSERT INTO `jsh_log` VALUES ('6812', '63', '商品', '124.117.113.63', '2019-10-26 13:30:03', '0', '修改,id:695商品', '修改,id:695商品', '63');
INSERT INTO `jsh_log` VALUES ('6813', '63', '商品', '124.117.113.63', '2019-10-26 13:30:11', '0', '修改,id:694商品', '修改,id:694商品', '63');
INSERT INTO `jsh_log` VALUES ('6814', '63', '商品', '124.117.113.63', '2019-10-26 13:30:26', '0', '修改,id:693商品', '修改,id:693商品', '63');
INSERT INTO `jsh_log` VALUES ('6815', '63', '商品', '124.117.113.63', '2019-10-26 13:30:35', '0', '修改,id:692商品', '修改,id:692商品', '63');
INSERT INTO `jsh_log` VALUES ('6816', '63', '商品', '124.117.113.63', '2019-10-26 13:30:50', '0', '修改,id:662商品', '修改,id:662商品', '63');
INSERT INTO `jsh_log` VALUES ('6817', '63', '商品', '124.117.113.63', '2019-10-26 13:30:59', '0', '修改,id:661商品', '修改,id:661商品', '63');
INSERT INTO `jsh_log` VALUES ('6818', '63', '商品', '124.117.113.63', '2019-10-26 13:31:07', '0', '修改,id:660商品', '修改,id:660商品', '63');
INSERT INTO `jsh_log` VALUES ('6819', '63', '商品', '124.117.113.63', '2019-10-26 13:31:14', '0', '修改,id:659商品', '修改,id:659商品', '63');
INSERT INTO `jsh_log` VALUES ('6820', '63', '商品', '124.117.113.63', '2019-10-26 13:31:21', '0', '修改,id:658商品', '修改,id:658商品', '63');
INSERT INTO `jsh_log` VALUES ('6821', '63', '商品', '124.117.113.63', '2019-10-26 13:31:28', '0', '修改,id:657商品', '修改,id:657商品', '63');
INSERT INTO `jsh_log` VALUES ('6822', '63', '商品', '124.117.113.63', '2019-10-26 13:31:44', '0', '修改,id:656商品', '修改,id:656商品', '63');
INSERT INTO `jsh_log` VALUES ('6823', '63', '商品', '124.117.113.63', '2019-10-26 13:32:03', '0', '修改,id:655商品', '修改,id:655商品', '63');
INSERT INTO `jsh_log` VALUES ('6824', '63', '商品', '124.117.113.63', '2019-10-26 13:32:14', '0', '修改,id:654商品', '修改,id:654商品', '63');
INSERT INTO `jsh_log` VALUES ('6825', '63', '商品', '124.117.113.63', '2019-10-26 13:32:32', '0', '修改,id:653商品', '修改,id:653商品', '63');
INSERT INTO `jsh_log` VALUES ('6826', '63', '商品', '124.117.113.63', '2019-10-26 13:32:39', '0', '修改,id:652商品', '修改,id:652商品', '63');
INSERT INTO `jsh_log` VALUES ('6827', '63', '商品', '124.117.113.63', '2019-10-26 13:32:50', '0', '修改,id:651商品', '修改,id:651商品', '63');
INSERT INTO `jsh_log` VALUES ('6828', '63', '商品', '124.117.113.63', '2019-10-26 13:33:10', '0', '修改,id:650商品', '修改,id:650商品', '63');
INSERT INTO `jsh_log` VALUES ('6829', '63', '商品', '124.117.113.63', '2019-10-26 13:34:47', '0', '修改,id:649商品', '修改,id:649商品', '63');
INSERT INTO `jsh_log` VALUES ('6830', '63', '商品', '124.117.113.63', '2019-10-26 13:34:54', '0', '修改,id:648商品', '修改,id:648商品', '63');
INSERT INTO `jsh_log` VALUES ('6831', '63', '商品', '124.117.113.63', '2019-10-26 13:35:14', '0', '修改,id:647商品', '修改,id:647商品', '63');
INSERT INTO `jsh_log` VALUES ('6832', '63', '商品', '124.117.113.63', '2019-10-26 13:35:20', '0', '修改,id:646商品', '修改,id:646商品', '63');
INSERT INTO `jsh_log` VALUES ('6833', '63', '商品', '124.117.113.63', '2019-10-26 13:35:32', '0', '修改,id:645商品', '修改,id:645商品', '63');
INSERT INTO `jsh_log` VALUES ('6834', '63', '商品', '124.117.113.63', '2019-10-26 13:35:49', '0', '修改,id:644商品', '修改,id:644商品', '63');
INSERT INTO `jsh_log` VALUES ('6835', '63', '商品', '124.117.113.63', '2019-10-26 13:35:58', '0', '修改,id:643商品', '修改,id:643商品', '63');
INSERT INTO `jsh_log` VALUES ('6836', '63', '商品', '124.117.113.63', '2019-10-26 13:36:04', '0', '修改,id:642商品', '修改,id:642商品', '63');
INSERT INTO `jsh_log` VALUES ('6837', '63', '商品', '124.117.113.63', '2019-10-26 13:36:18', '0', '修改,id:691商品', '修改,id:691商品', '63');
INSERT INTO `jsh_log` VALUES ('6838', '63', '商品', '124.117.113.63', '2019-10-26 13:36:27', '0', '修改,id:690商品', '修改,id:690商品', '63');
INSERT INTO `jsh_log` VALUES ('6839', '63', '商品', '124.117.113.63', '2019-10-26 13:36:38', '0', '修改,id:689商品', '修改,id:689商品', '63');
INSERT INTO `jsh_log` VALUES ('6840', '63', '商品', '124.117.113.63', '2019-10-26 13:36:44', '0', '修改,id:688商品', '修改,id:688商品', '63');
INSERT INTO `jsh_log` VALUES ('6841', '63', '商品', '124.117.113.63', '2019-10-26 13:37:14', '0', '修改,id:687商品', '修改,id:687商品', '63');
INSERT INTO `jsh_log` VALUES ('6842', '63', '商品', '124.117.113.63', '2019-10-26 13:37:22', '0', '修改,id:686商品', '修改,id:686商品', '63');
INSERT INTO `jsh_log` VALUES ('6843', '63', '商品', '124.117.113.63', '2019-10-26 13:37:32', '0', '修改,id:685商品', '修改,id:685商品', '63');
INSERT INTO `jsh_log` VALUES ('6844', '63', '商品', '124.117.113.63', '2019-10-26 13:37:54', '0', '修改,id:684商品', '修改,id:684商品', '63');
INSERT INTO `jsh_log` VALUES ('6845', '63', '商品', '124.117.113.63', '2019-10-26 13:38:02', '0', '修改,id:683商品', '修改,id:683商品', '63');
INSERT INTO `jsh_log` VALUES ('6846', '63', '商品', '124.117.113.63', '2019-10-26 13:38:10', '0', '修改,id:682商品', '修改,id:682商品', '63');
INSERT INTO `jsh_log` VALUES ('6847', '63', '商品', '124.117.113.63', '2019-10-26 13:38:19', '0', '修改,id:681商品', '修改,id:681商品', '63');
INSERT INTO `jsh_log` VALUES ('6848', '63', '商品', '124.117.113.63', '2019-10-26 13:38:26', '0', '修改,id:680商品', '修改,id:680商品', '63');
INSERT INTO `jsh_log` VALUES ('6849', '63', '商品', '124.117.113.63', '2019-10-26 13:38:33', '0', '修改,id:679商品', '修改,id:679商品', '63');
INSERT INTO `jsh_log` VALUES ('6850', '63', '商品', '124.117.113.63', '2019-10-26 13:38:39', '0', '修改,id:678商品', '修改,id:678商品', '63');
INSERT INTO `jsh_log` VALUES ('6851', '63', '商品', '124.117.113.63', '2019-10-26 13:38:46', '0', '修改,id:677商品', '修改,id:677商品', '63');
INSERT INTO `jsh_log` VALUES ('6852', '63', '商品', '124.117.113.63', '2019-10-26 13:38:53', '0', '修改,id:676商品', '修改,id:676商品', '63');
INSERT INTO `jsh_log` VALUES ('6853', '63', '商品', '124.117.113.63', '2019-10-26 13:39:00', '0', '修改,id:675商品', '修改,id:675商品', '63');
INSERT INTO `jsh_log` VALUES ('6854', '63', '商品', '124.117.113.63', '2019-10-26 13:39:06', '0', '修改,id:674商品', '修改,id:674商品', '63');
INSERT INTO `jsh_log` VALUES ('6855', '63', '商品', '124.117.113.63', '2019-10-26 13:39:16', '0', '修改,id:673商品', '修改,id:673商品', '63');
INSERT INTO `jsh_log` VALUES ('6856', '63', '商品', '124.117.113.63', '2019-10-26 13:39:21', '0', '修改,id:672商品', '修改,id:672商品', '63');
INSERT INTO `jsh_log` VALUES ('6857', '63', '商品', '124.117.113.63', '2019-10-26 13:39:27', '0', '修改,id:671商品', '修改,id:671商品', '63');
INSERT INTO `jsh_log` VALUES ('6858', '63', '商品', '124.117.113.63', '2019-10-26 13:39:36', '0', '修改,id:670商品', '修改,id:670商品', '63');
INSERT INTO `jsh_log` VALUES ('6859', '63', '商品', '124.117.113.63', '2019-10-26 13:39:42', '0', '修改,id:669商品', '修改,id:669商品', '63');
INSERT INTO `jsh_log` VALUES ('6860', '63', '商品', '124.117.113.63', '2019-10-26 13:39:51', '0', '修改,id:668商品', '修改,id:668商品', '63');
INSERT INTO `jsh_log` VALUES ('6861', '63', '商品', '124.117.113.63', '2019-10-26 13:39:57', '0', '修改,id:667商品', '修改,id:667商品', '63');
INSERT INTO `jsh_log` VALUES ('6862', '63', '商品', '124.117.113.63', '2019-10-26 13:40:02', '0', '修改,id:666商品', '修改,id:666商品', '63');
INSERT INTO `jsh_log` VALUES ('6863', '63', '商品', '124.117.113.63', '2019-10-26 13:40:07', '0', '修改,id:665商品', '修改,id:665商品', '63');
INSERT INTO `jsh_log` VALUES ('6864', '63', '商品', '124.117.113.63', '2019-10-26 13:40:13', '0', '修改,id:664商品', '修改,id:664商品', '63');
INSERT INTO `jsh_log` VALUES ('6865', '63', '商品', '124.117.113.63', '2019-10-26 13:40:19', '0', '修改,id:663商品', '修改,id:663商品', '63');
INSERT INTO `jsh_log` VALUES ('6866', '63', '商品', '124.117.113.63', '2019-10-26 13:40:38', '0', '修改,id:641商品', '修改,id:641商品', '63');
INSERT INTO `jsh_log` VALUES ('6867', '63', '商品', '124.117.113.63', '2019-10-26 13:40:44', '0', '修改,id:640商品', '修改,id:640商品', '63');
INSERT INTO `jsh_log` VALUES ('6868', '63', '商品', '124.117.113.63', '2019-10-26 13:40:51', '0', '修改,id:639商品', '修改,id:639商品', '63');
INSERT INTO `jsh_log` VALUES ('6869', '63', '商品', '124.117.113.63', '2019-10-26 13:40:59', '0', '修改,id:638商品', '修改,id:638商品', '63');
INSERT INTO `jsh_log` VALUES ('6870', '63', '商品', '124.117.113.63', '2019-10-26 13:41:06', '0', '修改,id:637商品', '修改,id:637商品', '63');
INSERT INTO `jsh_log` VALUES ('6871', '63', '商品', '124.117.113.63', '2019-10-26 13:41:12', '0', '修改,id:636商品', '修改,id:636商品', '63');
INSERT INTO `jsh_log` VALUES ('6872', '63', '商品', '124.117.113.63', '2019-10-26 13:41:18', '0', '修改,id:635商品', '修改,id:635商品', '63');
INSERT INTO `jsh_log` VALUES ('6873', '63', '商品', '124.117.113.63', '2019-10-26 13:41:24', '0', '修改,id:634商品', '修改,id:634商品', '63');
INSERT INTO `jsh_log` VALUES ('6874', '63', '商品', '124.117.113.63', '2019-10-26 13:41:30', '0', '修改,id:633商品', '修改,id:633商品', '63');
INSERT INTO `jsh_log` VALUES ('6875', '63', '商品', '124.117.113.63', '2019-10-26 13:41:35', '0', '修改,id:632商品', '修改,id:632商品', '63');
INSERT INTO `jsh_log` VALUES ('6876', '63', '商品', '124.117.113.63', '2019-10-26 13:41:41', '0', '修改,id:631商品', '修改,id:631商品', '63');
INSERT INTO `jsh_log` VALUES ('6877', '63', '商品类型', '124.117.113.63', '2019-10-26 13:41:58', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6878', '63', '商品类型', '124.117.113.63', '2019-10-26 13:42:11', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6879', '63', '商品', '124.117.113.63', '2019-10-26 13:42:21', '0', '修改,id:630商品', '修改,id:630商品', '63');
INSERT INTO `jsh_log` VALUES ('6880', '63', '商品', '124.117.113.63', '2019-10-26 13:42:28', '0', '修改,id:629商品', '修改,id:629商品', '63');
INSERT INTO `jsh_log` VALUES ('6881', '63', '商品', '124.117.113.63', '2019-10-26 13:43:56', '0', '修改,id:628商品', '修改,id:628商品', '63');
INSERT INTO `jsh_log` VALUES ('6882', '63', '商品', '124.117.113.63', '2019-10-26 13:44:20', '0', '修改,id:627商品', '修改,id:627商品', '63');
INSERT INTO `jsh_log` VALUES ('6883', '63', '商品', '124.117.113.63', '2019-10-26 13:44:32', '0', '修改,id:626商品', '修改,id:626商品', '63');
INSERT INTO `jsh_log` VALUES ('6884', '63', '商品', '124.117.113.63', '2019-10-26 13:44:41', '0', '修改,id:625商品', '修改,id:625商品', '63');
INSERT INTO `jsh_log` VALUES ('6885', '63', '商品', '124.117.113.63', '2019-10-26 13:44:54', '0', '修改,id:624商品', '修改,id:624商品', '63');
INSERT INTO `jsh_log` VALUES ('6886', '63', '商品', '124.117.113.63', '2019-10-26 13:45:12', '0', '修改,id:620商品', '修改,id:620商品', '63');
INSERT INTO `jsh_log` VALUES ('6887', '63', '商品类型', '124.117.113.63', '2019-10-26 13:46:02', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6888', '63', '商品类型', '124.117.113.63', '2019-10-26 13:46:26', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6889', '63', '商品类型', '124.117.113.63', '2019-10-26 13:46:48', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6890', '63', '商品', '124.117.113.63', '2019-10-26 13:47:02', '0', '修改,id:619商品', '修改,id:619商品', '63');
INSERT INTO `jsh_log` VALUES ('6891', '63', '商品', '124.117.113.63', '2019-10-26 13:47:08', '0', '修改,id:618商品', '修改,id:618商品', '63');
INSERT INTO `jsh_log` VALUES ('6892', '63', '商品', '124.117.113.63', '2019-10-26 13:47:33', '0', '修改,id:617商品', '修改,id:617商品', '63');
INSERT INTO `jsh_log` VALUES ('6893', '63', '商品', '124.117.113.63', '2019-10-26 13:47:58', '0', '修改,id:616商品', '修改,id:616商品', '63');
INSERT INTO `jsh_log` VALUES ('6894', '63', '商品', '124.117.113.63', '2019-10-26 13:48:11', '0', '修改,id:615商品', '修改,id:615商品', '63');
INSERT INTO `jsh_log` VALUES ('6895', '63', '商品', '124.117.113.63', '2019-10-26 13:48:21', '0', '修改,id:614商品', '修改,id:614商品', '63');
INSERT INTO `jsh_log` VALUES ('6896', '63', '商品', '124.117.113.63', '2019-10-26 13:48:28', '0', '修改,id:613商品', '修改,id:613商品', '63');
INSERT INTO `jsh_log` VALUES ('6897', '63', '商品', '124.117.113.63', '2019-10-26 13:48:44', '0', '修改,id:612商品', '修改,id:612商品', '63');
INSERT INTO `jsh_log` VALUES ('6898', '63', '商品', '124.117.113.63', '2019-10-26 13:48:53', '0', '修改,id:611商品', '修改,id:611商品', '63');
INSERT INTO `jsh_log` VALUES ('6899', '63', '商品', '124.117.113.63', '2019-10-26 13:49:02', '0', '修改,id:610商品', '修改,id:610商品', '63');
INSERT INTO `jsh_log` VALUES ('6900', '63', '商品', '124.117.113.63', '2019-10-26 13:49:09', '0', '修改,id:609商品', '修改,id:609商品', '63');
INSERT INTO `jsh_log` VALUES ('6901', '63', '商品', '124.117.113.63', '2019-10-26 13:49:21', '0', '修改,id:608商品', '修改,id:608商品', '63');
INSERT INTO `jsh_log` VALUES ('6902', '63', '商品', '124.117.113.63', '2019-10-26 13:49:32', '0', '修改,id:607商品', '修改,id:607商品', '63');
INSERT INTO `jsh_log` VALUES ('6903', '63', '商品', '124.117.113.63', '2019-10-26 13:49:56', '0', '修改,id:606商品', '修改,id:606商品', '63');
INSERT INTO `jsh_log` VALUES ('6904', '63', '商品', '124.117.113.63', '2019-10-26 13:50:09', '0', '修改,id:605商品', '修改,id:605商品', '63');
INSERT INTO `jsh_log` VALUES ('6905', '63', '商品', '124.117.113.63', '2019-10-26 13:50:28', '0', '修改,id:604商品', '修改,id:604商品', '63');
INSERT INTO `jsh_log` VALUES ('6906', '63', '商品', '124.117.113.63', '2019-10-26 13:50:34', '0', '修改,id:603商品', '修改,id:603商品', '63');
INSERT INTO `jsh_log` VALUES ('6907', '63', '商品', '124.117.113.63', '2019-10-26 13:50:40', '0', '修改,id:602商品', '修改,id:602商品', '63');
INSERT INTO `jsh_log` VALUES ('6908', '63', '商品', '124.117.113.63', '2019-10-26 13:50:48', '0', '修改,id:601商品', '修改,id:601商品', '63');
INSERT INTO `jsh_log` VALUES ('6909', '63', '商品', '124.117.113.63', '2019-10-26 13:50:54', '0', '修改,id:600商品', '修改,id:600商品', '63');
INSERT INTO `jsh_log` VALUES ('6910', '63', '商品', '124.117.113.63', '2019-10-26 13:51:01', '0', '修改,id:599商品', '修改,id:599商品', '63');
INSERT INTO `jsh_log` VALUES ('6911', '63', '商品', '124.117.113.63', '2019-10-26 13:51:07', '0', '修改,id:598商品', '修改,id:598商品', '63');
INSERT INTO `jsh_log` VALUES ('6912', '63', '商品', '124.117.113.63', '2019-10-26 13:51:15', '0', '修改,id:597商品', '修改,id:597商品', '63');
INSERT INTO `jsh_log` VALUES ('6913', '63', '商品', '124.117.113.63', '2019-10-26 13:51:29', '0', '修改,id:596商品', '修改,id:596商品', '63');
INSERT INTO `jsh_log` VALUES ('6914', '63', '商品', '124.117.113.63', '2019-10-26 13:51:38', '0', '修改,id:595商品', '修改,id:595商品', '63');
INSERT INTO `jsh_log` VALUES ('6915', '63', '商品', '124.117.113.63', '2019-10-26 13:51:44', '0', '修改,id:594商品', '修改,id:594商品', '63');
INSERT INTO `jsh_log` VALUES ('6916', '63', '商品', '124.117.113.63', '2019-10-26 13:51:50', '0', '修改,id:593商品', '修改,id:593商品', '63');
INSERT INTO `jsh_log` VALUES ('6917', '63', '商品', '124.117.113.63', '2019-10-26 13:51:57', '0', '修改,id:592商品', '修改,id:592商品', '63');
INSERT INTO `jsh_log` VALUES ('6918', '63', '商品', '124.117.113.63', '2019-10-26 13:52:08', '0', '修改,id:591商品', '修改,id:591商品', '63');
INSERT INTO `jsh_log` VALUES ('6919', '63', '商品', '124.117.113.63', '2019-10-26 13:54:34', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6920', '63', '商品类型', '124.117.113.63', '2019-10-26 13:57:50', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6921', '63', '商品类型', '124.117.113.63', '2019-10-26 13:57:50', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6922', '63', '商品', '124.117.113.63', '2019-10-26 14:02:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6923', '63', '商品', '124.117.113.63', '2019-10-26 14:02:50', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6924', '63', '商品', '124.117.113.63', '2019-10-26 14:19:04', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6925', '63', '商品', '124.117.113.63', '2019-10-26 14:27:17', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6926', '63', '商家', '124.117.113.63', '2019-10-26 14:28:34', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6927', '63', '单据', '124.117.113.63', '2019-10-26 14:30:28', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6928', '63', '单据明细', '124.117.113.63', '2019-10-26 14:30:28', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6929', '63', '单据明细', '124.117.113.63', '2019-10-26 14:30:28', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6930', '63', '单据', '124.117.113.63', '2019-10-26 14:31:01', '0', '修改,id:214单据', '修改,id:214单据', '63');
INSERT INTO `jsh_log` VALUES ('6931', '63', '单据明细', '124.117.113.63', '2019-10-26 14:31:01', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6932', '63', '单据明细', '124.117.113.63', '2019-10-26 14:31:01', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6933', '63', '单据', '124.117.113.63', '2019-10-26 14:31:23', '0', '修改,id:214单据', '修改,id:214单据', '63');
INSERT INTO `jsh_log` VALUES ('6934', '63', '单据明细', '124.117.113.63', '2019-10-26 14:31:23', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6935', '63', '单据明细', '124.117.113.63', '2019-10-26 14:31:23', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6936', '63', '商家', '124.117.113.63', '2019-10-26 14:32:09', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6937', '63', '商品', '124.117.113.63', '2019-10-26 14:34:47', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6938', '63', '商品类型', '124.117.113.63', '2019-10-26 14:35:21', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6939', '63', '商品', '124.117.113.63', '2019-10-26 14:37:30', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6940', '63', '商品类型', '124.117.113.63', '2019-10-26 14:37:52', '0', '删除,id:47商品类型', '删除,id:47商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6941', '63', '商品', '124.117.113.63', '2019-10-26 14:40:07', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6942', '63', '商品类型', '124.117.113.63', '2019-10-26 14:40:35', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6943', '63', '商品', '124.117.113.63', '2019-10-26 14:41:53', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6944', '63', '商品', '124.117.113.63', '2019-10-26 14:43:01', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6945', '63', '商品类型', '124.117.113.63', '2019-10-26 14:43:22', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6946', '63', '商品', '124.117.113.63', '2019-10-26 14:44:19', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6947', '63', '商品', '124.117.113.63', '2019-10-26 14:45:36', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6948', '63', '用户', '124.117.113.63', '2019-10-26 14:48:50', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6949', '63', '用户', '121.13.79.86', '2019-10-26 14:54:05', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6950', '63', '商品类型', '124.117.113.63', '2019-10-26 15:09:04', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6951', '63', '商品', '124.117.113.63', '2019-10-26 15:13:17', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6952', '63', '商品', '124.117.113.63', '2019-10-26 15:13:26', '0', '修改,id:754商品', '修改,id:754商品', '63');
INSERT INTO `jsh_log` VALUES ('6953', '63', '商品', '124.117.113.63', '2019-10-26 15:13:38', '0', '修改,id:753商品', '修改,id:753商品', '63');
INSERT INTO `jsh_log` VALUES ('6954', '63', '单据', '121.13.79.86', '2019-10-26 15:19:09', '0', '修改,id:214单据', '修改,id:214单据', '63');
INSERT INTO `jsh_log` VALUES ('6955', '63', '单据明细', '121.13.79.86', '2019-10-26 15:19:09', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6956', '63', '单据明细', '121.13.79.86', '2019-10-26 15:19:09', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6957', '63', '单据', '121.13.79.86', '2019-10-26 15:19:55', '0', '修改,id:214单据', '修改,id:214单据', '63');
INSERT INTO `jsh_log` VALUES ('6958', '63', '商家', '124.117.113.63', '2019-10-26 15:31:09', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6959', '63', '商品', '124.117.113.63', '2019-10-26 15:34:36', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6960', '63', '商品', '124.117.113.63', '2019-10-26 15:36:52', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6961', '63', '商品', '124.117.113.63', '2019-10-26 15:37:07', '0', '修改,id:755商品', '修改,id:755商品', '63');
INSERT INTO `jsh_log` VALUES ('6962', '63', '商品', '124.117.113.63', '2019-10-26 15:38:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6963', '63', '商品', '124.117.113.63', '2019-10-26 15:39:43', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6964', '63', '商品', '124.117.113.63', '2019-10-26 15:40:41', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6965', '63', '商品', '124.117.113.63', '2019-10-26 15:41:25', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6966', '63', '用户', '124.117.113.63', '2019-10-26 16:25:21', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6967', '63', '商品类型', '124.117.113.63', '2019-10-26 16:27:27', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('6968', '63', '商品', '124.117.113.63', '2019-10-26 16:28:12', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6969', '63', '商品', '124.117.113.63', '2019-10-26 16:29:14', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6970', '63', '商品', '124.117.113.63', '2019-10-26 16:30:31', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('6971', '63', '商家', '124.117.113.63', '2019-10-26 16:32:02', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('6972', '63', '单据', '124.117.113.63', '2019-10-26 16:34:00', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6973', '63', '单据明细', '124.117.113.63', '2019-10-26 16:34:00', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6974', '63', '单据明细', '124.117.113.63', '2019-10-26 16:34:00', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6975', '63', '单据', '124.117.113.63', '2019-10-26 16:35:36', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6976', '63', '单据明细', '124.117.113.63', '2019-10-26 16:35:36', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6977', '63', '单据明细', '124.117.113.63', '2019-10-26 16:35:36', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6978', '63', '单据', '124.117.113.63', '2019-10-26 16:37:07', '0', '删除,id:215单据', '删除,id:215单据', '63');
INSERT INTO `jsh_log` VALUES ('6979', '63', '单据', '124.117.113.63', '2019-10-26 16:37:07', '0', '删除,id:215单据', '删除,id:215单据', '63');
INSERT INTO `jsh_log` VALUES ('6980', '63', '单据', '124.117.113.63', '2019-10-26 16:37:08', '0', '删除,id:215单据', '删除,id:215单据', '63');
INSERT INTO `jsh_log` VALUES ('6981', '63', '单据', '124.117.113.63', '2019-10-26 16:41:52', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('6982', '63', '单据明细', '124.117.113.63', '2019-10-26 16:41:52', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6983', '63', '单据明细', '124.117.113.63', '2019-10-26 16:41:52', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6984', '63', '用户', '121.13.79.86', '2019-10-26 16:42:00', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('6985', '63', '单据', '124.117.113.63', '2019-10-26 16:42:17', '0', '修改,id:217单据', '修改,id:217单据', '63');
INSERT INTO `jsh_log` VALUES ('6986', '63', '单据', '124.117.113.63', '2019-10-26 16:43:42', '0', '修改,id:217单据', '修改,id:217单据', '63');
INSERT INTO `jsh_log` VALUES ('6987', '63', '单据', '124.117.113.63', '2019-10-26 16:53:22', '0', '修改,id:217单据', '修改,id:217单据', '63');
INSERT INTO `jsh_log` VALUES ('6988', '63', '单据明细', '124.117.113.63', '2019-10-26 16:53:22', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6989', '63', '单据明细', '124.117.113.63', '2019-10-26 16:53:22', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6990', '63', '单据', '124.117.113.63', '2019-10-26 16:59:13', '0', '修改,id:216单据', '修改,id:216单据', '63');
INSERT INTO `jsh_log` VALUES ('6991', '63', '单据明细', '124.117.113.63', '2019-10-26 16:59:13', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6992', '63', '单据明细', '124.117.113.63', '2019-10-26 16:59:13', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6993', '63', '单据', '124.117.113.63', '2019-10-26 17:00:14', '0', '修改,id:216单据', '修改,id:216单据', '63');
INSERT INTO `jsh_log` VALUES ('6994', '63', '单据明细', '124.117.113.63', '2019-10-26 17:00:14', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6995', '63', '单据明细', '124.117.113.63', '2019-10-26 17:00:14', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('6996', '63', '单据', '124.117.113.63', '2019-10-26 17:00:42', '0', '删除,id:216单据', '删除,id:216单据', '63');
INSERT INTO `jsh_log` VALUES ('6997', '63', '单据', '124.117.113.63', '2019-10-26 17:00:42', '0', '删除,id:216单据', '删除,id:216单据', '63');
INSERT INTO `jsh_log` VALUES ('6998', '63', '单据', '124.117.113.63', '2019-10-26 17:00:42', '0', '删除,id:216单据', '删除,id:216单据', '63');
INSERT INTO `jsh_log` VALUES ('6999', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:209,208,207,206,205单据', '删除,id:209,208,207,206,205单据', '63');
INSERT INTO `jsh_log` VALUES ('7000', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:209单据', '删除,id:209单据', '63');
INSERT INTO `jsh_log` VALUES ('7001', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:209单据', '删除,id:209单据', '63');
INSERT INTO `jsh_log` VALUES ('7002', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:208单据', '删除,id:208单据', '63');
INSERT INTO `jsh_log` VALUES ('7003', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:208单据', '删除,id:208单据', '63');
INSERT INTO `jsh_log` VALUES ('7004', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:207单据', '删除,id:207单据', '63');
INSERT INTO `jsh_log` VALUES ('7005', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:207单据', '删除,id:207单据', '63');
INSERT INTO `jsh_log` VALUES ('7006', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:206单据', '删除,id:206单据', '63');
INSERT INTO `jsh_log` VALUES ('7007', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:206单据', '删除,id:206单据', '63');
INSERT INTO `jsh_log` VALUES ('7008', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:205单据', '删除,id:205单据', '63');
INSERT INTO `jsh_log` VALUES ('7009', '63', '单据', '121.13.79.86', '2019-10-26 17:09:19', '0', '删除,id:205单据', '删除,id:205单据', '63');
INSERT INTO `jsh_log` VALUES ('7010', '63', '用户', '124.117.117.86', '2019-10-26 17:37:29', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7011', '63', '用户', '124.117.117.86', '2019-10-26 17:44:53', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7012', '63', '商家', '124.117.113.63', '2019-10-26 18:20:29', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7013', '63', '商品', '124.117.113.63', '2019-10-26 18:21:37', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7014', '63', '商品', '124.117.113.63', '2019-10-26 18:22:05', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7015', '63', '商品', '124.117.113.63', '2019-10-26 18:22:25', '0', '修改,id:765商品', '修改,id:765商品', '63');
INSERT INTO `jsh_log` VALUES ('7016', '63', '商品', '124.117.113.63', '2019-10-26 18:22:54', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7017', '63', '商品', '124.117.113.63', '2019-10-26 18:23:38', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7018', '63', '商品', '124.117.113.63', '2019-10-26 18:24:18', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7019', '63', '商品', '124.117.113.63', '2019-10-26 18:24:26', '0', '修改,id:767商品', '修改,id:767商品', '63');
INSERT INTO `jsh_log` VALUES ('7020', '63', '商品', '124.117.113.63', '2019-10-26 18:24:36', '0', '修改,id:766商品', '修改,id:766商品', '63');
INSERT INTO `jsh_log` VALUES ('7021', '63', '商品', '124.117.113.63', '2019-10-26 18:24:45', '0', '修改,id:765商品', '修改,id:765商品', '63');
INSERT INTO `jsh_log` VALUES ('7022', '63', '商品', '124.117.113.63', '2019-10-26 18:24:52', '0', '修改,id:764商品', '修改,id:764商品', '63');
INSERT INTO `jsh_log` VALUES ('7023', '63', '商品', '124.117.113.63', '2019-10-26 18:27:04', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7024', '63', '商品', '124.117.113.63', '2019-10-26 18:27:31', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7025', '63', '商品', '124.117.113.63', '2019-10-26 18:28:28', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7026', '63', '商品', '124.117.113.63', '2019-10-26 18:30:26', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7027', '63', '商品', '124.117.113.63', '2019-10-26 18:31:02', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7028', '63', '商品', '124.117.113.63', '2019-10-26 18:31:53', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7029', '63', '商品', '124.117.113.63', '2019-10-26 18:35:19', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7030', '63', '商品', '124.117.113.63', '2019-10-26 18:36:19', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7031', '63', '商品', '124.117.113.63', '2019-10-26 18:36:58', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7032', '63', '商品', '124.117.113.63', '2019-10-26 18:37:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7033', '63', '商品', '124.117.113.63', '2019-10-26 18:38:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7034', '63', '商品', '124.117.113.63', '2019-10-26 18:39:20', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7035', '63', '商家', '124.117.113.63', '2019-10-26 18:48:03', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7036', '63', '商品', '124.117.113.63', '2019-10-26 18:53:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7037', '63', '单据', '124.117.113.63', '2019-10-26 18:53:38', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7038', '63', '单据明细', '124.117.113.63', '2019-10-26 18:53:38', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7039', '63', '单据明细', '124.117.113.63', '2019-10-26 18:53:38', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7040', '63', '单据', '124.117.113.63', '2019-10-26 18:53:45', '0', '修改,id:218单据', '修改,id:218单据', '63');
INSERT INTO `jsh_log` VALUES ('7041', '63', '单据', '124.117.113.63', '2019-10-26 18:54:13', '0', '修改,id:218单据', '修改,id:218单据', '63');
INSERT INTO `jsh_log` VALUES ('7042', '63', '单据', '124.117.113.63', '2019-10-26 18:54:30', '0', '修改,id:218单据', '修改,id:218单据', '63');
INSERT INTO `jsh_log` VALUES ('7043', '63', '单据明细', '124.117.113.63', '2019-10-26 18:54:30', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7044', '63', '单据明细', '124.117.113.63', '2019-10-26 18:54:30', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7045', '63', '单据', '124.117.113.63', '2019-10-26 18:54:39', '0', '修改,id:218单据', '修改,id:218单据', '63');
INSERT INTO `jsh_log` VALUES ('7046', '63', '商家', '124.117.113.63', '2019-10-26 18:57:37', '0', '修改,id:97商家', '修改,id:97商家', '63');
INSERT INTO `jsh_log` VALUES ('7047', '63', '商家', '124.117.113.63', '2019-10-26 18:57:44', '0', '删除,id:98商家', '删除,id:98商家', '63');
INSERT INTO `jsh_log` VALUES ('7048', '63', '用户', '121.13.79.86', '2019-10-26 19:30:07', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7049', '63', '用户', '121.13.79.86', '2019-10-26 19:30:10', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7050', '63', '用户', '121.13.79.86', '2019-10-26 19:30:16', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7051', '63', '用户', '121.13.79.86', '2019-10-26 19:39:38', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7052', '63', '商品类型', '121.13.79.86', '2019-10-26 19:45:02', '0', '修改,id:34商品类型', '修改,id:34商品类型', '63');
INSERT INTO `jsh_log` VALUES ('7053', '63', '用户', '124.117.113.63', '2019-10-27 10:40:01', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7054', '63', '单据', '124.117.113.63', '2019-10-27 10:42:58', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7055', '63', '单据明细', '124.117.113.63', '2019-10-27 10:42:58', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7056', '63', '单据明细', '124.117.113.63', '2019-10-27 10:42:59', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7057', '63', '单据', '124.117.113.63', '2019-10-27 10:43:11', '0', '修改,id:219单据', '修改,id:219单据', '63');
INSERT INTO `jsh_log` VALUES ('7058', '63', '单据', '124.117.113.63', '2019-10-27 10:43:45', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7059', '63', '单据明细', '124.117.113.63', '2019-10-27 10:43:45', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7060', '63', '单据明细', '124.117.113.63', '2019-10-27 10:43:45', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7061', '63', '商家', '124.117.113.63', '2019-10-27 10:48:07', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7062', '63', '商品', '124.117.113.63', '2019-10-27 10:55:25', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7063', '63', '商品', '124.117.113.63', '2019-10-27 10:58:27', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7064', '63', '商品', '124.117.113.63', '2019-10-27 10:58:40', '0', '修改,id:782商品', '修改,id:782商品', '63');
INSERT INTO `jsh_log` VALUES ('7065', '63', '商品', '124.117.113.63', '2019-10-27 11:00:56', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7066', '63', '商品', '124.117.113.63', '2019-10-27 11:02:48', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7067', '63', '单据', '124.117.113.63', '2019-10-27 11:21:38', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7068', '63', '单据明细', '124.117.113.63', '2019-10-27 11:21:38', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7069', '63', '单据明细', '124.117.113.63', '2019-10-27 11:21:38', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7070', '63', '商品', '124.117.113.63', '2019-10-27 11:23:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7071', '63', '商家', '124.117.113.63', '2019-10-27 11:26:07', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7072', '63', '单据', '124.117.113.63', '2019-10-27 11:26:57', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7073', '63', '单据明细', '124.117.113.63', '2019-10-27 11:26:57', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7074', '63', '单据明细', '124.117.113.63', '2019-10-27 11:26:57', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7075', '63', '用户', '124.117.113.63', '2019-10-27 11:50:17', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7076', '63', '商品类型', '124.117.113.63', '2019-10-27 11:59:45', '0', '新增商品类型', '新增商品类型', '63');
INSERT INTO `jsh_log` VALUES ('7077', '63', '商品', '124.117.113.63', '2019-10-27 12:01:59', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7078', '63', '商品', '124.117.113.63', '2019-10-27 12:03:25', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7079', '63', '商品', '124.117.113.63', '2019-10-27 12:04:41', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7080', '63', '商品', '124.117.113.63', '2019-10-27 12:05:26', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7081', '63', '商品', '124.117.113.63', '2019-10-27 12:06:50', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7082', '63', '商品', '124.117.113.63', '2019-10-27 12:07:55', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7083', '63', '商品', '124.117.113.63', '2019-10-27 12:13:22', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7084', '63', '商品', '124.117.113.63', '2019-10-27 12:14:16', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7085', '63', '商品', '124.117.113.63', '2019-10-27 12:15:03', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7086', '63', '商品', '124.117.113.63', '2019-10-27 12:15:55', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7087', '63', '商家', '124.117.113.63', '2019-10-27 12:18:00', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7088', '63', '商品', '124.117.113.63', '2019-10-27 12:24:59', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7089', '63', '单据', '124.117.113.63', '2019-10-27 12:25:52', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7090', '63', '单据明细', '124.117.113.63', '2019-10-27 12:25:53', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7091', '63', '单据明细', '124.117.113.63', '2019-10-27 12:25:53', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7092', '63', '商品', '124.117.113.63', '2019-10-27 12:36:37', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7093', '63', '商品', '124.117.113.63', '2019-10-27 12:38:33', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7094', '63', '商品', '124.117.113.63', '2019-10-27 12:44:23', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7095', '63', '商品', '124.117.113.63', '2019-10-27 12:45:18', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7096', '63', '商品', '124.117.113.63', '2019-10-27 12:45:51', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7097', '63', '商品', '124.117.113.63', '2019-10-27 12:46:38', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7098', '63', '商品', '124.117.113.63', '2019-10-27 12:47:09', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7099', '63', '商品', '124.117.113.63', '2019-10-27 12:47:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7103', '63', '商家', '124.117.113.63', '2019-10-27 12:53:21', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7104', '63', '单据', '124.117.113.63', '2019-10-27 12:54:11', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7105', '63', '单据明细', '124.117.113.63', '2019-10-27 12:54:11', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7106', '63', '单据明细', '124.117.113.63', '2019-10-27 12:54:11', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7116', '63', '用户', '124.117.113.63', '2019-10-27 13:06:22', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7117', '63', '单据', '124.117.113.63', '2019-10-27 13:06:53', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7118', '63', '单据明细', '124.117.113.63', '2019-10-27 13:06:53', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7119', '63', '单据明细', '124.117.113.63', '2019-10-27 13:06:53', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7120', '63', '单据', '124.117.113.63', '2019-10-27 13:09:44', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7121', '63', '单据明细', '124.117.113.63', '2019-10-27 13:09:44', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7122', '63', '单据明细', '124.117.113.63', '2019-10-27 13:09:44', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7126', '63', '商家', '124.117.113.63', '2019-10-27 13:12:54', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7127', '63', '单据', '124.117.113.63', '2019-10-27 13:13:30', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7128', '63', '单据明细', '124.117.113.63', '2019-10-27 13:13:30', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7129', '63', '单据明细', '124.117.113.63', '2019-10-27 13:13:31', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7130', '63', '单据', '124.117.113.63', '2019-10-27 13:13:39', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7131', '63', '单据明细', '124.117.113.63', '2019-10-27 13:13:39', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7132', '63', '单据明细', '124.117.113.63', '2019-10-27 13:13:39', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7133', '63', '商家', '124.117.113.63', '2019-10-27 13:53:27', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7134', '63', '商家', '124.117.113.63', '2019-10-27 13:54:12', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7135', '63', '用户', '124.117.113.63', '2019-10-27 14:08:35', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7136', '63', '单据', '124.117.113.63', '2019-10-27 14:20:17', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7137', '63', '单据明细', '124.117.113.63', '2019-10-27 14:20:17', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7138', '63', '单据明细', '124.117.113.63', '2019-10-27 14:20:17', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7139', '63', '商品', '124.117.113.63', '2019-10-27 14:22:47', '0', '修改,id:781商品', '修改,id:781商品', '63');
INSERT INTO `jsh_log` VALUES ('7140', '63', '商品', '124.117.113.63', '2019-10-27 14:23:17', '0', '修改,id:761商品', '修改,id:761商品', '63');
INSERT INTO `jsh_log` VALUES ('7141', '63', '商品', '124.117.113.63', '2019-10-27 14:23:21', '0', '修改,id:762商品', '修改,id:762商品', '63');
INSERT INTO `jsh_log` VALUES ('7142', '63', '商品', '124.117.113.63', '2019-10-27 14:23:25', '0', '修改,id:763商品', '修改,id:763商品', '63');
INSERT INTO `jsh_log` VALUES ('7143', '63', '商品', '124.117.113.63', '2019-10-27 14:23:34', '0', '修改,id:764商品', '修改,id:764商品', '63');
INSERT INTO `jsh_log` VALUES ('7144', '63', '商品', '124.117.113.63', '2019-10-27 14:23:40', '0', '修改,id:765商品', '修改,id:765商品', '63');
INSERT INTO `jsh_log` VALUES ('7145', '63', '商品', '124.117.113.63', '2019-10-27 14:23:45', '0', '修改,id:766商品', '修改,id:766商品', '63');
INSERT INTO `jsh_log` VALUES ('7146', '63', '商品', '124.117.113.63', '2019-10-27 14:23:53', '0', '修改,id:766商品', '修改,id:766商品', '63');
INSERT INTO `jsh_log` VALUES ('7147', '63', '商品', '124.117.113.63', '2019-10-27 14:24:12', '0', '修改,id:767商品', '修改,id:767商品', '63');
INSERT INTO `jsh_log` VALUES ('7148', '63', '商品', '124.117.113.63', '2019-10-27 14:24:16', '0', '修改,id:768商品', '修改,id:768商品', '63');
INSERT INTO `jsh_log` VALUES ('7149', '63', '商品', '124.117.113.63', '2019-10-27 14:24:24', '0', '修改,id:769商品', '修改,id:769商品', '63');
INSERT INTO `jsh_log` VALUES ('7150', '63', '商品', '124.117.113.63', '2019-10-27 14:24:28', '0', '修改,id:770商品', '修改,id:770商品', '63');
INSERT INTO `jsh_log` VALUES ('7151', '63', '商品', '124.117.113.63', '2019-10-27 14:24:33', '0', '修改,id:771商品', '修改,id:771商品', '63');
INSERT INTO `jsh_log` VALUES ('7152', '63', '商品', '124.117.113.63', '2019-10-27 14:24:38', '0', '修改,id:772商品', '修改,id:772商品', '63');
INSERT INTO `jsh_log` VALUES ('7153', '63', '商品', '124.117.113.63', '2019-10-27 14:24:43', '0', '修改,id:773商品', '修改,id:773商品', '63');
INSERT INTO `jsh_log` VALUES ('7154', '63', '商品', '124.117.113.63', '2019-10-27 14:24:48', '0', '修改,id:774商品', '修改,id:774商品', '63');
INSERT INTO `jsh_log` VALUES ('7155', '63', '商品', '124.117.113.63', '2019-10-27 14:24:55', '0', '修改,id:775商品', '修改,id:775商品', '63');
INSERT INTO `jsh_log` VALUES ('7156', '63', '商品', '124.117.113.63', '2019-10-27 14:25:00', '0', '修改,id:776商品', '修改,id:776商品', '63');
INSERT INTO `jsh_log` VALUES ('7157', '63', '商品', '124.117.113.63', '2019-10-27 14:25:05', '0', '修改,id:777商品', '修改,id:777商品', '63');
INSERT INTO `jsh_log` VALUES ('7158', '63', '商品', '124.117.113.63', '2019-10-27 14:25:09', '0', '修改,id:778商品', '修改,id:778商品', '63');
INSERT INTO `jsh_log` VALUES ('7159', '63', '商品', '124.117.113.63', '2019-10-27 14:25:14', '0', '修改,id:779商品', '修改,id:779商品', '63');
INSERT INTO `jsh_log` VALUES ('7160', '63', '商品', '124.117.113.63', '2019-10-27 14:25:18', '0', '修改,id:780商品', '修改,id:780商品', '63');
INSERT INTO `jsh_log` VALUES ('7161', '63', '商家', '124.117.113.63', '2019-10-27 14:27:48', '0', '删除,id:85商家', '删除,id:85商家', '63');
INSERT INTO `jsh_log` VALUES ('7162', '63', '商家', '124.117.113.63', '2019-10-27 14:29:36', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7163', '63', '商家', '124.117.113.63', '2019-10-27 14:30:08', '0', '修改,id:106商家', '修改,id:106商家', '63');
INSERT INTO `jsh_log` VALUES ('7164', '63', '商家', '124.117.113.63', '2019-10-27 14:30:24', '0', '修改,id:105商家', '修改,id:105商家', '63');
INSERT INTO `jsh_log` VALUES ('7165', '63', '商家', '124.117.113.63', '2019-10-27 14:30:59', '0', '修改,id:105商家', '修改,id:105商家', '63');
INSERT INTO `jsh_log` VALUES ('7166', '63', '商家', '124.117.113.63', '2019-10-27 14:31:03', '0', '删除,id:104商家', '删除,id:104商家', '63');
INSERT INTO `jsh_log` VALUES ('7167', '63', '商家', '124.117.113.63', '2019-10-27 14:31:16', '0', '修改,id:97商家', '修改,id:97商家', '63');
INSERT INTO `jsh_log` VALUES ('7168', '63', '单据', '124.117.113.63', '2019-10-27 14:33:21', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7169', '63', '单据明细', '124.117.113.63', '2019-10-27 14:33:21', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7170', '63', '单据明细', '124.117.113.63', '2019-10-27 14:33:21', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7180', '63', '用户', '124.117.113.63', '2019-10-27 14:49:05', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7181', '63', '商家', '124.117.113.63', '2019-10-27 14:54:23', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7182', '63', '商家', '124.117.113.63', '2019-10-27 14:54:37', '0', '修改,id:107商家', '修改,id:107商家', '63');
INSERT INTO `jsh_log` VALUES ('7183', '63', '单据', '124.117.113.63', '2019-10-27 14:56:24', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7184', '63', '单据明细', '124.117.113.63', '2019-10-27 14:56:24', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7185', '63', '单据明细', '124.117.113.63', '2019-10-27 14:56:24', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7186', '63', '单据', '124.117.113.63', '2019-10-27 14:59:24', '0', '修改,id:235单据', '修改,id:235单据', '63');
INSERT INTO `jsh_log` VALUES ('7187', '63', '单据明细', '124.117.113.63', '2019-10-27 14:59:24', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7188', '63', '单据明细', '124.117.113.63', '2019-10-27 14:59:24', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7195', '63', '单据', '124.117.113.63', '2019-10-27 15:04:07', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7196', '63', '单据明细', '124.117.113.63', '2019-10-27 15:04:07', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7197', '63', '单据明细', '124.117.113.63', '2019-10-27 15:04:07', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7198', '63', '用户', '124.117.113.63', '2019-10-27 15:26:13', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7202', '63', '单据', '124.117.113.63', '2019-10-27 15:28:08', '0', '删除,id:242单据', '删除,id:242单据', '63');
INSERT INTO `jsh_log` VALUES ('7203', '63', '单据', '124.117.113.63', '2019-10-27 15:28:08', '0', '删除,id:242单据', '删除,id:242单据', '63');
INSERT INTO `jsh_log` VALUES ('7211', '63', '商家', '124.117.113.63', '2019-10-27 15:39:08', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7212', '63', '单据', '124.117.113.63', '2019-10-27 15:39:46', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7213', '63', '单据明细', '124.117.113.63', '2019-10-27 15:39:46', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7214', '63', '单据明细', '124.117.113.63', '2019-10-27 15:39:46', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7215', '63', '单据', '124.117.113.63', '2019-10-27 15:40:01', '0', '修改,id:246单据', '修改,id:246单据', '63');
INSERT INTO `jsh_log` VALUES ('7216', '63', '单据明细', '124.117.113.63', '2019-10-27 15:40:01', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7217', '63', '单据明细', '124.117.113.63', '2019-10-27 15:40:01', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7218', '63', '单据', '124.117.113.63', '2019-10-27 15:45:12', '0', '修改,id:246单据', '修改,id:246单据', '63');
INSERT INTO `jsh_log` VALUES ('7219', '63', '单据明细', '124.117.113.63', '2019-10-27 15:45:12', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7220', '63', '单据明细', '124.117.113.63', '2019-10-27 15:45:12', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7221', '63', '单据', '124.117.113.63', '2019-10-27 15:45:50', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7222', '63', '单据明细', '124.117.113.63', '2019-10-27 15:45:50', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7223', '63', '单据明细', '124.117.113.63', '2019-10-27 15:45:50', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7224', '63', '用户', '124.117.113.63', '2019-10-27 17:56:13', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7228', '63', '商品', '124.117.113.63', '2019-10-27 17:59:03', '0', '修改,id:781商品', '修改,id:781商品', '63');
INSERT INTO `jsh_log` VALUES ('7229', '63', '单据', '124.117.113.63', '2019-10-27 17:59:16', '0', '修改,id:246单据', '修改,id:246单据', '63');
INSERT INTO `jsh_log` VALUES ('7230', '63', '单据明细', '124.117.113.63', '2019-10-27 17:59:16', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7231', '63', '单据明细', '124.117.113.63', '2019-10-27 17:59:16', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7232', '63', '单据', '124.117.113.63', '2019-10-27 18:00:05', '0', '修改,id:218单据', '修改,id:218单据', '63');
INSERT INTO `jsh_log` VALUES ('7233', '63', '单据', '124.117.113.63', '2019-10-27 18:00:25', '0', '修改,id:218单据', '修改,id:218单据', '63');
INSERT INTO `jsh_log` VALUES ('7234', '63', '单据明细', '124.117.113.63', '2019-10-27 18:00:25', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7235', '63', '单据明细', '124.117.113.63', '2019-10-27 18:00:25', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7239', '63', '单据', '124.117.113.63', '2019-10-27 18:01:20', '0', '修改,id:246单据', '修改,id:246单据', '63');
INSERT INTO `jsh_log` VALUES ('7240', '63', '单据明细', '124.117.113.63', '2019-10-27 18:01:20', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7241', '63', '单据明细', '124.117.113.63', '2019-10-27 18:01:20', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7245', '63', '单据', '124.117.113.63', '2019-10-27 18:04:17', '0', '修改,id:246单据', '修改,id:246单据', '63');
INSERT INTO `jsh_log` VALUES ('7246', '63', '单据明细', '124.117.113.63', '2019-10-27 18:04:17', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7247', '63', '单据明细', '124.117.113.63', '2019-10-27 18:04:17', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7248', '63', '单据', '124.117.113.63', '2019-10-27 18:33:55', '0', '修改,id:246单据', '修改,id:246单据', '63');
INSERT INTO `jsh_log` VALUES ('7249', '63', '单据明细', '124.117.113.63', '2019-10-27 18:33:55', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7250', '63', '单据明细', '124.117.113.63', '2019-10-27 18:33:55', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7251', '63', '单据', '124.117.113.63', '2019-10-27 18:38:52', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7252', '63', '单据明细', '124.117.113.63', '2019-10-27 18:38:52', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7253', '63', '单据明细', '124.117.113.63', '2019-10-27 18:38:52', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7254', '63', '用户', '192.168.10.1', '2019-10-28 09:15:22', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7255', '63', '用户', '192.168.10.1', '2019-10-28 09:26:28', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7256', '63', '用户', '192.168.10.1', '2019-10-28 09:26:53', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7257', '63', '用户', '192.168.10.1', '2019-10-28 09:29:58', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7258', '63', '用户', '192.168.10.1', '2019-10-28 09:30:26', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7259', '63', '用户', '124.117.121.220', '2019-10-28 11:51:03', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7260', '63', '用户', '124.117.121.220', '2019-10-28 12:23:37', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7261', '63', '商家', '124.117.121.220', '2019-10-28 12:39:33', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7262', '63', '单据', '124.117.121.220', '2019-10-28 12:40:53', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7263', '63', '单据明细', '124.117.121.220', '2019-10-28 12:40:53', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7264', '63', '单据明细', '124.117.121.220', '2019-10-28 12:40:53', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7265', '63', '商家', '124.117.121.220', '2019-10-28 12:41:34', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7266', '63', '商家', '124.117.121.220', '2019-10-28 12:41:52', '0', '修改,id:110商家', '修改,id:110商家', '63');
INSERT INTO `jsh_log` VALUES ('7267', '63', '单据', '124.117.121.220', '2019-10-28 13:03:55', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7268', '63', '单据明细', '124.117.121.220', '2019-10-28 13:03:55', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7269', '63', '单据明细', '124.117.121.220', '2019-10-28 13:03:55', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7270', '63', '单据', '124.117.121.220', '2019-10-28 13:05:39', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7271', '63', '单据明细', '124.117.121.220', '2019-10-28 13:05:39', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7272', '63', '单据明细', '124.117.121.220', '2019-10-28 13:05:39', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7273', '63', '单据', '124.117.121.220', '2019-10-28 13:06:13', '0', '修改,id:253单据', '修改,id:253单据', '63');
INSERT INTO `jsh_log` VALUES ('7274', '63', '单据', '124.117.121.220', '2019-10-28 13:06:40', '0', '修改,id:253单据', '修改,id:253单据', '63');
INSERT INTO `jsh_log` VALUES ('7275', '63', '单据', '124.117.121.220', '2019-10-28 13:07:03', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7276', '63', '单据明细', '124.117.121.220', '2019-10-28 13:07:03', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7277', '63', '单据明细', '124.117.121.220', '2019-10-28 13:07:03', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7278', '63', '单据', '124.117.121.220', '2019-10-28 13:07:16', '0', '删除,id:254单据', '删除,id:254单据', '63');
INSERT INTO `jsh_log` VALUES ('7279', '63', '单据', '124.117.121.220', '2019-10-28 13:07:16', '0', '删除,id:254单据', '删除,id:254单据', '63');
INSERT INTO `jsh_log` VALUES ('7280', '63', '单据', '124.117.121.220', '2019-10-28 13:07:16', '0', '删除,id:254单据', '删除,id:254单据', '63');
INSERT INTO `jsh_log` VALUES ('7281', '63', '商品', '124.117.121.220', '2019-10-28 13:36:56', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7282', '63', '单据', '124.117.121.220', '2019-10-28 13:37:57', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7283', '63', '单据明细', '124.117.121.220', '2019-10-28 13:37:57', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7284', '63', '单据明细', '124.117.121.220', '2019-10-28 13:37:57', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7285', '63', '单据', '124.117.121.220', '2019-10-28 13:38:32', '0', '修改,id:256单据', '修改,id:256单据', '63');
INSERT INTO `jsh_log` VALUES ('7286', '63', '单据明细', '124.117.121.220', '2019-10-28 13:38:32', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7287', '63', '单据明细', '124.117.121.220', '2019-10-28 13:38:32', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7288', '63', '商家', '124.117.121.220', '2019-10-28 13:39:22', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7289', '63', '商家', '124.117.121.220', '2019-10-28 13:40:05', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7290', '63', '商家', '124.117.121.220', '2019-10-28 13:40:49', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7291', '63', '商家', '124.117.121.220', '2019-10-28 13:41:19', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7292', '63', '商品', '124.117.121.220', '2019-10-28 13:42:17', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7293', '63', '商品', '124.117.121.220', '2019-10-28 13:43:00', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7294', '63', '商家', '124.117.121.220', '2019-10-28 13:44:09', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7295', '63', '商品', '124.117.121.220', '2019-10-28 13:44:51', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7296', '63', '商品', '124.117.121.220', '2019-10-28 13:45:37', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7297', '63', '单据', '124.117.121.220', '2019-10-28 13:51:08', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7298', '63', '单据明细', '124.117.121.220', '2019-10-28 13:51:08', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7299', '63', '单据明细', '124.117.121.220', '2019-10-28 13:51:08', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7303', '63', '单据', '124.117.121.220', '2019-10-28 13:59:00', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7304', '63', '单据明细', '124.117.121.220', '2019-10-28 13:59:00', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7305', '63', '单据明细', '124.117.121.220', '2019-10-28 13:59:00', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7309', '63', '单据', '124.117.121.220', '2019-10-28 13:59:50', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7310', '63', '单据明细', '124.117.121.220', '2019-10-28 13:59:50', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7311', '63', '单据明细', '124.117.121.220', '2019-10-28 13:59:50', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7312', '63', '单据', '124.117.121.220', '2019-10-28 14:00:48', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7313', '63', '单据明细', '124.117.121.220', '2019-10-28 14:00:48', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7314', '63', '单据明细', '124.117.121.220', '2019-10-28 14:00:48', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7315', '63', '商品', '124.117.121.220', '2019-10-28 14:03:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7316', '63', '商品', '124.117.121.220', '2019-10-28 14:03:37', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7317', '63', '单据', '124.117.121.220', '2019-10-28 14:04:01', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7318', '63', '单据明细', '124.117.121.220', '2019-10-28 14:04:01', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7319', '63', '单据明细', '124.117.121.220', '2019-10-28 14:04:01', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7320', '63', '单据', '124.117.121.220', '2019-10-28 14:04:13', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7321', '63', '单据明细', '124.117.121.220', '2019-10-28 14:04:13', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7322', '63', '单据明细', '124.117.121.220', '2019-10-28 14:04:13', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7323', '63', '单据', '124.117.121.220', '2019-10-28 14:05:01', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7324', '63', '单据明细', '124.117.121.220', '2019-10-28 14:05:01', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7325', '63', '单据明细', '124.117.121.220', '2019-10-28 14:05:01', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7329', '63', '用户', '61.244.165.130', '2019-10-28 14:15:07', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7330', '63', '用户', '192.168.10.1', '2019-10-28 14:34:57', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7331', '63', '用户', '192.168.10.1', '2019-10-28 14:37:11', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7332', '63', '用户', '61.244.165.130', '2019-10-28 14:38:45', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7333', '63', '用户', '124.117.121.220', '2019-10-28 14:52:16', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7334', '63', '商品', '124.117.121.220', '2019-10-28 14:53:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7335', '63', '单据', '124.117.121.220', '2019-10-28 14:53:43', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7336', '63', '单据明细', '124.117.121.220', '2019-10-28 14:53:43', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7337', '63', '单据明细', '124.117.121.220', '2019-10-28 14:53:43', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7338', '63', '商家', '124.117.121.220', '2019-10-28 14:54:25', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7339', '63', '单据', '124.117.121.220', '2019-10-28 14:55:51', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7340', '63', '单据明细', '124.117.121.220', '2019-10-28 14:55:51', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7341', '63', '单据明细', '124.117.121.220', '2019-10-28 14:55:51', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7342', '63', '单据', '124.117.121.220', '2019-10-28 14:56:17', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7343', '63', '单据明细', '124.117.121.220', '2019-10-28 14:56:17', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7344', '63', '单据明细', '124.117.121.220', '2019-10-28 14:56:17', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7345', '63', '单据', '124.117.121.220', '2019-10-28 14:56:35', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7346', '63', '单据明细', '124.117.121.220', '2019-10-28 14:56:35', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7347', '63', '单据明细', '124.117.121.220', '2019-10-28 14:56:35', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7348', '63', '商品', '124.117.121.220', '2019-10-28 14:57:35', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7349', '63', '商品', '124.117.121.220', '2019-10-28 14:58:17', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7350', '63', '商品', '124.117.121.220', '2019-10-28 14:59:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7351', '63', '商品', '124.117.121.220', '2019-10-28 15:03:13', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7352', '63', '商品', '124.117.121.220', '2019-10-28 15:03:51', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7353', '63', '商品', '124.117.121.220', '2019-10-28 15:04:25', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7354', '63', '商品', '124.117.121.220', '2019-10-28 15:04:52', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7355', '63', '商品', '124.117.121.220', '2019-10-28 15:04:59', '0', '修改,id:819商品', '修改,id:819商品', '63');
INSERT INTO `jsh_log` VALUES ('7356', '63', '单据', '124.117.121.220', '2019-10-28 15:08:35', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7357', '63', '单据明细', '124.117.121.220', '2019-10-28 15:08:35', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7358', '63', '单据明细', '124.117.121.220', '2019-10-28 15:08:35', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7359', '63', '单据', '124.117.121.220', '2019-10-28 15:09:46', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7360', '63', '单据明细', '124.117.121.220', '2019-10-28 15:09:46', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7361', '63', '单据明细', '124.117.121.220', '2019-10-28 15:09:46', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7368', '63', '单据', '124.117.121.220', '2019-10-28 15:13:08', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7369', '63', '单据明细', '124.117.121.220', '2019-10-28 15:13:08', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7370', '63', '单据明细', '124.117.121.220', '2019-10-28 15:13:08', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7371', '63', '单据', '124.117.121.220', '2019-10-28 15:13:59', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7372', '63', '单据明细', '124.117.121.220', '2019-10-28 15:13:59', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7373', '63', '单据明细', '124.117.121.220', '2019-10-28 15:13:59', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7374', '63', '单据', '124.117.121.220', '2019-10-28 15:15:07', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7375', '63', '单据明细', '124.117.121.220', '2019-10-28 15:15:07', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7376', '63', '单据明细', '124.117.121.220', '2019-10-28 15:15:07', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7383', '63', '单据', '124.117.121.220', '2019-10-28 15:17:01', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7384', '63', '单据明细', '124.117.121.220', '2019-10-28 15:17:01', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7385', '63', '单据明细', '124.117.121.220', '2019-10-28 15:17:01', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7389', '63', '单据', '124.117.121.220', '2019-10-28 15:19:02', '0', '修改,id:263单据', '修改,id:263单据', '63');
INSERT INTO `jsh_log` VALUES ('7390', '63', '单据明细', '124.117.121.220', '2019-10-28 15:19:02', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7391', '63', '单据明细', '124.117.121.220', '2019-10-28 15:19:02', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7392', '63', '单据', '124.117.121.220', '2019-10-28 15:19:17', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7393', '63', '单据明细', '124.117.121.220', '2019-10-28 15:19:17', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7394', '63', '单据明细', '124.117.121.220', '2019-10-28 15:19:17', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7398', '63', '单据', '124.117.121.220', '2019-10-28 15:23:23', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7399', '63', '单据明细', '124.117.121.220', '2019-10-28 15:23:23', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7400', '63', '单据明细', '124.117.121.220', '2019-10-28 15:23:23', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7401', '63', '单据', '124.117.121.220', '2019-10-28 15:24:48', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7402', '63', '单据明细', '124.117.121.220', '2019-10-28 15:24:48', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7403', '63', '单据明细', '124.117.121.220', '2019-10-28 15:24:48', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7407', '63', '商家', '124.117.121.220', '2019-10-28 15:27:52', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7408', '63', '单据', '124.117.121.220', '2019-10-28 15:31:32', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7409', '63', '单据明细', '124.117.121.220', '2019-10-28 15:31:32', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7410', '63', '单据明细', '124.117.121.220', '2019-10-28 15:31:32', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7411', '63', '单据', '124.117.121.220', '2019-10-28 15:33:12', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7412', '63', '单据明细', '124.117.121.220', '2019-10-28 15:33:12', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7413', '63', '单据明细', '124.117.121.220', '2019-10-28 15:33:12', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7414', '63', '单据', '124.117.121.220', '2019-10-28 15:33:21', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7415', '63', '单据明细', '124.117.121.220', '2019-10-28 15:33:21', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7416', '63', '单据明细', '124.117.121.220', '2019-10-28 15:33:21', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7417', '63', '用户', '124.117.121.220', '2019-10-28 15:52:28', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7418', '63', '商家', '124.117.121.220', '2019-10-28 15:53:03', '0', '新增商家', '新增商家', '63');
INSERT INTO `jsh_log` VALUES ('7419', '63', '商品', '124.117.121.220', '2019-10-28 15:54:03', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7420', '63', '商品', '124.117.121.220', '2019-10-28 15:56:12', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7421', '63', '商品', '124.117.121.220', '2019-10-28 15:56:32', '0', '修改,id:821商品', '修改,id:821商品', '63');
INSERT INTO `jsh_log` VALUES ('7422', '63', '单据', '124.117.121.220', '2019-10-28 15:57:06', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7423', '63', '单据明细', '124.117.121.220', '2019-10-28 15:57:06', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7424', '63', '单据明细', '124.117.121.220', '2019-10-28 15:57:06', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7425', '63', '单据', '124.117.121.220', '2019-10-28 15:57:46', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7426', '63', '单据明细', '124.117.121.220', '2019-10-28 15:57:46', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7427', '63', '单据明细', '124.117.121.220', '2019-10-28 15:57:46', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7428', '63', '单据', '124.117.121.220', '2019-10-28 15:57:55', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7429', '63', '单据明细', '124.117.121.220', '2019-10-28 15:57:55', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7430', '63', '单据明细', '124.117.121.220', '2019-10-28 15:57:55', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7431', '63', '单据', '124.117.121.220', '2019-10-28 16:03:29', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7432', '63', '单据明细', '124.117.121.220', '2019-10-28 16:03:29', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7433', '63', '单据明细', '124.117.121.220', '2019-10-28 16:03:29', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7434', '63', '单据', '124.117.121.220', '2019-10-28 16:04:09', '0', '删除,id:292单据', '删除,id:292单据', '63');
INSERT INTO `jsh_log` VALUES ('7435', '63', '单据', '124.117.121.220', '2019-10-28 16:04:09', '0', '删除,id:292单据', '删除,id:292单据', '63');
INSERT INTO `jsh_log` VALUES ('7436', '63', '用户', '192.168.10.1', '2019-10-28 17:32:18', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7437', '63', '用户', '124.117.121.220', '2019-10-28 17:38:34', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7438', '63', '用户', '192.168.10.1', '2019-10-28 17:43:43', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7439', '63', '用户', '192.168.10.1', '2019-10-28 18:24:12', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7440', '63', '用户', '192.168.10.1', '2019-10-29 08:21:54', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7441', '63', '用户', '192.168.10.1', '2019-10-29 08:39:23', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7442', '63', '用户', '192.168.10.1', '2019-10-29 08:40:36', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7443', '63', '用户', '192.168.10.1', '2019-10-29 08:41:55', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7444', '63', '用户', '192.168.10.1', '2019-10-29 08:50:42', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7445', '63', '用户', '124.117.113.89', '2019-10-29 10:56:56', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7446', '63', '用户', '124.117.113.89', '2019-10-29 11:09:00', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7450', '63', '单据', '124.117.113.89', '2019-10-29 11:12:23', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7451', '63', '单据明细', '124.117.113.89', '2019-10-29 11:12:23', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7452', '63', '单据明细', '124.117.113.89', '2019-10-29 11:12:23', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7459', '63', '商品', '124.117.113.89', '2019-10-29 11:17:48', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7463', '63', '单据', '124.117.113.89', '2019-10-29 11:18:55', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7464', '63', '单据明细', '124.117.113.89', '2019-10-29 11:18:55', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7465', '63', '单据明细', '124.117.113.89', '2019-10-29 11:18:55', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7475', '63', '单据', '124.117.113.89', '2019-10-29 11:20:13', '0', '新增单据', '新增单据', '63');
INSERT INTO `jsh_log` VALUES ('7476', '63', '单据明细', '124.117.113.89', '2019-10-29 11:20:13', '0', '新增单据明细', '新增单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7477', '63', '单据明细', '124.117.113.89', '2019-10-29 11:20:13', '0', '删除,id:单据明细', '删除,id:单据明细', '63');
INSERT INTO `jsh_log` VALUES ('7478', '63', '商品', '124.117.113.89', '2019-10-29 11:23:24', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7479', '63', '商品', '124.117.113.89', '2019-10-29 11:24:28', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7480', '63', '商品', '124.117.113.89', '2019-10-29 11:25:06', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7481', '63', '商品', '124.117.113.89', '2019-10-29 11:25:43', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7482', '63', '商品', '124.117.113.89', '2019-10-29 11:26:13', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7483', '63', '商品', '124.117.113.89', '2019-10-29 11:26:48', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7484', '63', '商品', '124.117.113.89', '2019-10-29 11:27:46', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7485', '63', '商品', '124.117.113.89', '2019-10-29 11:27:55', '0', '修改,id:829商品', '修改,id:829商品', '63');
INSERT INTO `jsh_log` VALUES ('7486', '63', '商品', '124.117.113.89', '2019-10-29 11:28:22', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7487', '63', '商品', '124.117.113.89', '2019-10-29 11:29:07', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7488', '63', '商品', '124.117.113.89', '2019-10-29 11:29:59', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7489', '63', '商品', '124.117.113.89', '2019-10-29 11:30:48', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7490', '63', '商品', '124.117.113.89', '2019-10-29 11:31:12', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7491', '63', '商品', '124.117.113.89', '2019-10-29 11:31:41', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7492', '63', '商品', '124.117.113.89', '2019-10-29 11:32:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7493', '63', '商品', '124.117.113.89', '2019-10-29 11:33:05', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7494', '63', '商品', '124.117.113.89', '2019-10-29 11:33:29', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7495', '63', '商品', '124.117.113.89', '2019-10-29 11:34:30', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7496', '63', '商品', '124.117.113.89', '2019-10-29 11:35:00', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7497', '63', '商品', '124.117.113.89', '2019-10-29 11:35:28', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7498', '63', '商品', '124.117.113.89', '2019-10-29 11:36:04', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7499', '63', '商品', '124.117.113.89', '2019-10-29 11:36:28', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7500', '63', '商品', '124.117.113.89', '2019-10-29 11:36:51', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7501', '63', '商品', '124.117.113.89', '2019-10-29 11:37:31', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7502', '63', '商品', '124.117.113.89', '2019-10-29 11:37:52', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7503', '63', '商品', '124.117.113.89', '2019-10-29 11:38:11', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7504', '63', '商品', '124.117.113.89', '2019-10-29 11:38:44', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7505', '63', '商品', '124.117.113.89', '2019-10-29 11:39:12', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7506', '63', '商品', '124.117.113.89', '2019-10-29 11:39:41', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7507', '63', '商品', '124.117.113.89', '2019-10-29 11:40:16', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7508', '63', '商品', '124.117.113.89', '2019-10-29 11:40:39', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7509', '63', '商品', '124.117.113.89', '2019-10-29 11:41:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7510', '63', '商品', '124.117.113.89', '2019-10-29 11:41:41', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7511', '63', '商品', '124.117.113.89', '2019-10-29 11:42:13', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7512', '63', '商品', '124.117.113.89', '2019-10-29 11:42:37', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7513', '63', '商品', '124.117.113.89', '2019-10-29 11:43:12', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7514', '63', '商品', '124.117.113.89', '2019-10-29 11:43:49', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7515', '63', '商品', '124.117.113.89', '2019-10-29 11:44:22', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7516', '63', '商品', '124.117.113.89', '2019-10-29 11:45:24', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7517', '63', '商品', '124.117.113.89', '2019-10-29 11:45:50', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7518', '63', '商品', '124.117.113.89', '2019-10-29 11:46:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7519', '63', '商品', '124.117.113.89', '2019-10-29 11:47:10', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7520', '63', '商品', '124.117.113.89', '2019-10-29 11:47:38', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7521', '63', '商品', '124.117.113.89', '2019-10-29 11:48:17', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7522', '63', '商品', '124.117.113.89', '2019-10-29 11:49:48', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7523', '63', '商品', '124.117.113.89', '2019-10-29 11:50:25', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7524', '63', '商品', '124.117.113.89', '2019-10-29 11:51:22', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7525', '63', '商品', '124.117.113.89', '2019-10-29 11:51:30', '0', '修改,id:867商品', '修改,id:867商品', '63');
INSERT INTO `jsh_log` VALUES ('7526', '63', '用户', '192.168.10.79', '2019-10-29 15:24:36', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7527', '63', '用户', '192.168.10.79', '2019-10-29 15:26:27', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7528', '63', '用户', '124.117.113.89', '2019-10-29 15:43:24', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7529', '63', '商品', '124.117.113.89', '2019-10-29 15:47:54', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7530', '63', '商品', '124.117.113.89', '2019-10-29 15:48:43', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7531', '63', '商品', '124.117.113.89', '2019-10-29 15:49:26', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7532', '63', '商品', '124.117.113.89', '2019-10-29 15:50:37', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7533', '63', '商品', '124.117.113.89', '2019-10-29 15:51:21', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7534', '63', '商品', '124.117.113.89', '2019-10-29 15:52:46', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7535', '63', '商品', '124.117.113.89', '2019-10-29 15:57:24', '0', '修改,id:674商品', '修改,id:674商品', '63');
INSERT INTO `jsh_log` VALUES ('7536', '63', '商品', '124.117.113.89', '2019-10-29 15:57:38', '0', '修改,id:673商品', '修改,id:673商品', '63');
INSERT INTO `jsh_log` VALUES ('7537', '63', '商品', '124.117.113.89', '2019-10-29 15:58:02', '0', '修改,id:672商品', '修改,id:672商品', '63');
INSERT INTO `jsh_log` VALUES ('7538', '63', '商品', '124.117.113.89', '2019-10-29 15:59:10', '0', '修改,id:698商品', '修改,id:698商品', '63');
INSERT INTO `jsh_log` VALUES ('7539', '63', '商品', '124.117.113.89', '2019-10-29 15:59:45', '0', '修改,id:682商品', '修改,id:682商品', '63');
INSERT INTO `jsh_log` VALUES ('7540', '63', '商品', '124.117.113.89', '2019-10-29 16:00:06', '0', '修改,id:676商品', '修改,id:676商品', '63');
INSERT INTO `jsh_log` VALUES ('7541', '63', '商品', '124.117.113.89', '2019-10-29 16:00:38', '0', '修改,id:691商品', '修改,id:691商品', '63');
INSERT INTO `jsh_log` VALUES ('7542', '63', '商品', '124.117.113.89', '2019-10-29 16:01:07', '0', '修改,id:679商品', '修改,id:679商品', '63');
INSERT INTO `jsh_log` VALUES ('7543', '63', '商品', '124.117.113.89', '2019-10-29 16:01:16', '0', '修改,id:680商品', '修改,id:680商品', '63');
INSERT INTO `jsh_log` VALUES ('7544', '63', '商品', '124.117.113.89', '2019-10-29 16:01:28', '0', '修改,id:689商品', '修改,id:689商品', '63');
INSERT INTO `jsh_log` VALUES ('7545', '63', '商品', '124.117.113.89', '2019-10-29 16:08:27', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7546', '63', '商品', '124.117.113.89', '2019-10-29 16:08:55', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7547', '63', '商品', '124.117.113.89', '2019-10-29 16:09:22', '0', '新增商品', '新增商品', '63');
INSERT INTO `jsh_log` VALUES ('7548', '63', '商品', '124.117.113.89', '2019-10-29 16:10:57', '0', '修改,id:877商品', '修改,id:877商品', '63');
INSERT INTO `jsh_log` VALUES ('7549', '63', '用户', '192.168.10.79', '2019-10-29 16:32:52', '0', '登录,id:63用户', '登录,id:63用户', '63');
INSERT INTO `jsh_log` VALUES ('7550', '63', '用户', '192.168.10.79', '2019-10-29 17:37:01', '0', '登录,id:63用户', '登录,id:63用户', '63');

-- ----------------------------
-- Table structure for jsh_material
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material`;
CREATE TABLE `jsh_material` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CategoryId` bigint(20) DEFAULT NULL COMMENT '产品类型',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `Mfrs` varchar(50) DEFAULT NULL COMMENT '制造商',
  `Packing` decimal(24,6) DEFAULT NULL COMMENT '包装（KG/包）',
  `SafetyStock` decimal(24,6) DEFAULT NULL COMMENT '安全存量（KG）',
  `Model` varchar(50) DEFAULT NULL COMMENT '型号',
  `Standard` varchar(50) DEFAULT NULL COMMENT '规格',
  `Color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `Unit` varchar(50) DEFAULT NULL COMMENT '单位-单个',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `RetailPrice` decimal(24,6) DEFAULT NULL COMMENT '零售价',
  `LowPrice` decimal(24,6) DEFAULT NULL COMMENT '最低售价',
  `PresetPriceOne` decimal(24,6) DEFAULT NULL COMMENT '预设售价一',
  `PresetPriceTwo` decimal(24,6) DEFAULT NULL COMMENT '预设售价二',
  `UnitId` bigint(20) DEFAULT NULL COMMENT '计量单位Id',
  `FirstOutUnit` varchar(50) DEFAULT NULL COMMENT '首选出库单位',
  `FirstInUnit` varchar(50) DEFAULT NULL COMMENT '首选入库单位',
  `PriceStrategy` varchar(500) DEFAULT NULL COMMENT '价格策略',
  `Enabled` bit(1) DEFAULT NULL COMMENT '启用 0-禁用  1-启用',
  `OtherField1` varchar(50) DEFAULT NULL COMMENT '自定义1',
  `OtherField2` varchar(50) DEFAULT NULL COMMENT '自定义2',
  `OtherField3` varchar(50) DEFAULT NULL COMMENT '自定义3',
  `enableSerialNumber` varchar(1) DEFAULT '0' COMMENT '是否开启序列号，0否，1是',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`),
  KEY `FK675951272AB6672C` (`CategoryId`),
  KEY `UnitId` (`UnitId`)
) ENGINE=InnoDB AUTO_INCREMENT=879 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of jsh_material
-- ----------------------------
INSERT INTO `jsh_material` VALUES ('485', '2', '棉线', 'a1', null, '100.000000', 'A21-4321', '5g', '白色', '码', '', '1.000000', '1.000000', '1.000000', '1.000000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', 'b2', 'c3', 'd4', '0', null, '0');
INSERT INTO `jsh_material` VALUES ('487', '1', '网布', '制造商b', null, '100.000000', '12343', '10g', '', '码', '', '1.000000', '1.000000', '1.000000', '1.000000', null, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('498', '1', '蕾丝', '制造商c', null, null, 'B123a', '6g', '', '码', '', '1.200000', '1.000000', '1.300000', '1.400000', null, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('499', '1', '棉线', '制造商d', null, null, 'A21-1234', '7g', '', '码', '', '2.200000', '2.000000', '2.400000', '2.600000', null, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('500', '1', '纯棉线', '制造商e', null, null, 'AAA666', '11g', '', '码', '', '1.100000', '1.000000', '1.200000', '1.300000', null, '', '', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('517', '1', '奶酪', '制造商', null, null, 'AAAA', '12ml', '', '', '', null, null, null, null, '8', '瓶', '箱', '[{\"basic\":{\"Unit\":\"瓶\",\"RetailPrice\":\"1.5\",\"LowPrice\":\"2\",\"PresetPriceOne\":\"3\",\"PresetPriceTwo\":\"4\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"18\",\"LowPrice\":\"24\",\"PresetPriceOne\":\"36\",\"PresetPriceTwo\":\"48\"}}]', '', null, null, null, '0', null, '0');
INSERT INTO `jsh_material` VALUES ('518', '1', '安慕希', '伊利', null, null, 'abcd', '350ml', '银白色', '', '', null, null, null, null, '2', 'kg', '包', '[{\"basic\":{\"Unit\":\"kg\",\"RetailPrice\":\"2\",\"LowPrice\":\"1\",\"PresetPriceOne\":\"3\",\"PresetPriceTwo\":\"4\"}},{\"other\":{\"Unit\":\"包\",\"RetailPrice\":\"50\",\"LowPrice\":\"25\",\"PresetPriceOne\":\"75\",\"PresetPriceTwo\":\"100\"}}]', '', '', '', '', '0', null, '0');
INSERT INTO `jsh_material` VALUES ('562', '1', '红苹果（蛇果）', '', null, null, '60#', '大铁筐', '', '个', '', '12.000000', '10.000000', '8.000000', '11.000000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"enableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', null, '0');
INSERT INTO `jsh_material` VALUES ('563', '8', '139电话卡', '', null, null, '139', '规格1', '绿色', '张', '', '11.000000', '11.000000', '11.000000', '11.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"enableSerialNumber\":\"1\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '1', null, '0');
INSERT INTO `jsh_material` VALUES ('564', '14', '商品1', '', null, null, 'sp1', '', '', '个', '', '22.000000', '22.000000', '22.000000', '22.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"enableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '1', '0');
INSERT INTO `jsh_material` VALUES ('565', '14', '商品2', '', null, null, 'sp2', '', '', '个', '', '44.000000', '44.000000', '44.000000', '44.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"1\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '1', '1', '0');
INSERT INTO `jsh_material` VALUES ('566', '15', '商品666', '', null, null, 'sp666', '', '', '个', '', '5.000000', '4.000000', '3.000000', '2.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '117', '0');
INSERT INTO `jsh_material` VALUES ('567', null, '商品1', '', null, null, 'dsp1', '', '', '个', '', '11.000000', '11.000000', '11.000000', '11.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '115', '0');
INSERT INTO `jsh_material` VALUES ('568', '17', '商品1', '', null, '100.000000', 'sp1', '', '', '个', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('569', '17', '商品2', '', null, '200.000000', 'sp2', '', '', '只', '', '5.000000', '5.000000', '5.000000', '5.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('570', '17', '商品3', '', null, '300.000000', 'sp3', '', '', '个个', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('571', null, '商品4', '', null, null, 'sp4', '', '', '', '', null, null, null, null, '15', '个', '箱', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"3\",\"LowPrice\":\"2\",\"PresetPriceOne\":\"2\",\"PresetPriceTwo\":\"2\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"36\",\"LowPrice\":\"24\",\"PresetPriceOne\":\"24\",\"PresetPriceTwo\":\"24\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('572', null, '234234', '', null, null, '234234', '', '', '', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('573', null, '12312', '', null, null, '12', '', '', '', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('574', null, '商品5', '', null, null, '213qw', '', '', '个', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('575', null, '商品6', '', null, null, 'sp6', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('576', null, '商品7', '', null, null, 'sp7', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('577', null, '商品8', '', null, null, 'sp8', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('578', '17', '商品9', '', null, null, 'sp9', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('579', null, '商品17', '', null, null, 'sp17', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('580', null, '15', '', null, null, '15', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('581', null, '16', '', null, null, '16', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('582', null, '商品20', '', null, null, 'sp2', '', '', '个', '', null, null, null, null, null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('583', null, 'wer', '', null, null, 'rqwe', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('584', null, 'sfds', '', null, null, 'a2233', '12', '2', 'ge', '', '1.000000', '2.000000', '3.000000', '4.000000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('585', null, 'asdf', '', null, null, 'adsfasdf', '', '', '', '', null, null, null, null, '15', '', '', '[{\"basic\":{\"Unit\":\"个\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"箱\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('586', '13', '白云', '', null, null, '小', '', '', '支', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"1\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '1', null, '1');
INSERT INTO `jsh_material` VALUES ('587', '13', '白云', '', null, null, '小', '', '', '支', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', null, '1');
INSERT INTO `jsh_material` VALUES ('588', '13', '白云', '', null, null, '小', '', '', '支', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', null, '1');
INSERT INTO `jsh_material` VALUES ('589', '13', '白云', '', null, '1000.000000', '小', '', '', '支', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', null, '0');
INSERT INTO `jsh_material` VALUES ('590', '12', '小玉', '', null, '1.000000', '小玉', '', '', '1', '小玉', '1.000000', '1.000000', '1.000000', '1.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', null, '0');
INSERT INTO `jsh_material` VALUES ('591', '34', '中华狼毫', '', null, '200.000000', '大', '', '', '支', '', '5.000000', '3.500000', '2.400000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('592', '34', '中华狼毫', '', null, '200.000000', '中', '', '', '支', '中华狼毫', '5.000000', '3.500000', '2.400000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('593', '34', '中华狼毫', '', null, '200.000000', '小', '', '', '支', '', '5.000000', '3.500000', '2.400000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('594', '34', '德才兼备', '', null, '200.000000', '大', '', '', '支', '', '15.000000', '12.000000', '5.800000', '12.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('595', '34', '德才兼备', '', null, '200.000000', '中', '', '', '支', '', '15.000000', '12.000000', '5.800000', '12.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('596', '34', '德才兼备', '', null, '200.000000', '小', '', '', '支', '', '15.000000', '12.000000', '5.800000', '12.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('597', '34', '義之圣手', '', null, '50.000000', '大', '', '', '支', '', '55.000000', '45.000000', '25.000000', '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('598', '34', '義之圣手', '', null, '50.000000', '中', '', '', '支', '', '55.000000', '45.000000', '25.000000', '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('599', '34', '義之圣手', '', null, '50.000000', '小', '', '', '支', '', '55.000000', '45.000000', '25.000000', '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('600', '34', '贡品纯狼毫', '', null, '50.000000', '大', '', '', '支', '', '25.000000', '25.000000', '12.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('601', '34', '贡品纯狼毫', '', null, '50.000000', '中', '', '', '支', '', '25.000000', '25.000000', '12.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('602', '34', '贡品纯狼毫', '', null, '100.000000', '小', '', '', '支', '', '25.000000', '25.000000', '12.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('603', '34', '银鷺', '', null, '100.000000', '大', '', '', '支', '', '25.000000', '25.000000', '12.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('604', '34', '银鷺', '', null, '50.000000', '中', '', '', '支', '', '25.000000', '25.000000', '12.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('605', '34', '银鷺', '', null, '50.000000', '小', '', '', '支', '', '25.000000', '25.000000', '12.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('606', '34', '刚柔相济', '', null, '50.000000', '大', '', '', '支', '', '85.000000', '75.000000', '55.000000', '75.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('607', '34', '刚柔相济', '', null, '50.000000', '中', '', '', '支', '', '85.000000', '75.000000', '55.000000', '75.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('608', '34', '刚柔相济', '', null, '50.000000', '小', '', '', '支', '', '85.000000', '75.000000', '55.000000', '75.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('609', '43', '8k黄色毛边纸', '', null, '1500.000000', '15格', '', '', '包', '', '2.000000', '1.500000', '1.200000', '1.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('610', '37', '啄木鸟木刻刀', '', null, '100.000000', '123', '', '', '盒', '', '8.000000', '6.000000', '5.600000', '6.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('611', '37', '啄木鸟木刻刀', '', null, '100.000000', '124', '', '', '盒', '', '8.000000', '8.000000', '6.500000', '8.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('612', '37', '啄木鸟木刻刀', '', null, '100.000000', '125', '', '', '盒', '', '10.000000', '10.000000', '8.200000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('613', '37', '啄木鸟木刻刀', '', null, '100.000000', '126', '', '', '盒', '', '12.000000', '12.000000', '10.000000', '12.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('614', '37', '啄木鸟木刻刀', '', null, '30.000000', '128', '', '', '盒', '', '20.000000', '16.500000', '13.300000', '18.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('615', '37', '啄木鸟木刻刀', '', null, '30.000000', '130', '', '', '盒', '', '25.000000', '22.000000', '17.000000', '22.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('616', '43', '8k黄色毛边纸', '', null, '1500.000000', '24格', '', '', '包', '', '2.000000', '1.500000', '1.200000', '1.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('617', '45', '8k素描本', '', null, '250.000000', '8683', '', '', '本', '', '10.000000', '9.000000', '6.000000', null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('618', '45', 'A4素描本', '', null, '150.000000', '8643', '', '', '本', '', '8.000000', '7.000000', '4.000000', '7.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('619', '45', '16k素描本', '', null, '500.000000', '8663', '', '', '本', '', '5.000000', '4.500000', '3.200000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('620', '41', '艺星生宣', '', null, '30.000000', '四尺', '', '', '刀', '', '60.000000', '60.000000', '36.000000', '60.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('621', '28', '毛笔笔帘', '', null, '200.000000', '二包边', '', '', '个', '', '8.000000', '4.500000', '2.700000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('622', '22', '带格毛边纸', '', null, '800.000000', '米格', '', '', '刀', '', '5.000000', '4.500000', '3.600000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('623', '22', '毛边纸', '', null, '800.000000', '无格', '', '', '刀', '', '5.000000', '4.500000', '3.600000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('624', '41', '毛边纸', '', null, '150.000000', '描红欧体', '', '', '包', '', '8.000000', '6.000000', '3.800000', '6.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('625', '41', '毛边纸', '', null, '150.000000', '颜体描红', '', '', '包', '', '8.000000', '5.500000', '3.800000', '6.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('626', '41', '毛边纸', '', null, '100.000000', '无格好', '', '', '包', '', '10.000000', '9.000000', '6.000000', '9.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('627', '41', '毛边纸', '', null, '100.000000', '米格好', '', '', '包', '', '10.000000', '8.500000', '5.000000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('628', '41', '毛边纸', '', null, '100.000000', '8k好', '', '', '包', '', '3.000000', '2.500000', '1.250000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('629', '42', '手工毛边纸', '', null, '100.000000', '半手工', '', '', '刀', '', '15.000000', '15.000000', '10.000000', '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('630', '42', '手工毛边纸', '', null, '100.000000', '纯手工', '', '', '刀', '', '25.000000', '25.000000', '22.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('631', '32', '凤凰排笔', '', null, '120.000000', '6027', '', '', '套', '', '10.000000', '8.500000', '5.500000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('632', '32', '凤凰丙烯', '', null, '150.000000', '300ml白', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('633', '32', '凤凰丙烯', '', null, '150.000000', '300ml黑', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('634', '32', '凤凰丙烯', '', null, '50.000000', '300ml灰', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('635', '32', '凤凰丙烯', '', null, '100.000000', '300ml熟褐', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('636', '32', '凤凰丙烯', '', null, '100.000000', '300ml赭石', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('637', '32', '凤凰丙烯', '', null, '100.000000', '300ml紫色', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('638', '32', '凤凰丙烯', '', null, '100.000000', '300ml淡紫', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('639', '32', '凤凰丙烯', '', null, '100.000000', '300ml群青', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('640', '32', '凤凰丙烯', '', null, '100.000000', '300ml青莲', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('641', '32', '凤凰丙烯', '', null, '100.000000', '300ml金色', '', '', '瓶', '', '15.000000', '13.500000', '7.500000', '13.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('642', '32', '凤凰丙烯', '', null, '100.000000', '300ml银色', '', '', '瓶', '', '15.000000', '13.500000', '11.000000', '13.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('643', '32', '凤凰丙烯', '', null, '150.000000', '300ml大红', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('644', '32', '凤凰丙烯', '', null, '100.000000', '300ml朱红', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('645', '32', '凤凰丙烯', '', null, '100.000000', '300ml深红', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('646', '32', '凤凰丙烯', '', null, '100.000000', '300ml玫瑰红', '', '', '支', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('647', '32', '凤凰丙烯', '', null, '100.000000', '300ml桃红', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('648', '32', '凤凰丙烯', '', null, '100.000000', '300ml柠檬黄', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('649', '32', '凤凰丙烯', '', null, '100.000000', '300ml中黄', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('650', '32', '凤凰丙烯', '', null, '100.000000', '300ml淡黄', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('651', '32', '凤凰丙烯', '', null, '100.000000', '300ml土黄', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('652', '32', '凤凰丙烯', '', null, '100.000000', '300ml橘黄', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('653', '32', '凤凰丙烯', '', null, '100.000000', '300ml橘红', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('654', '32', '凤凰丙烯', '', null, '100.000000', '300ml草绿', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('655', '32', '凤凰丙烯', '', null, '100.000000', '300ml中绿', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('656', '32', '凤凰丙烯', '', null, '100.000000', '300ml淡绿', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('657', '32', '凤凰丙烯', '', null, '100.000000', '300ml翠绿', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('658', '32', '凤凰丙烯', '', null, '100.000000', '300ml黄绿', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('659', '32', '凤凰丙烯', '', null, '100.000000', '300ml酞青绿', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('660', '32', '凤凰丙烯', '', null, '100.000000', '300ml天蓝', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('661', '32', '凤凰丙烯', '', null, '100.000000', '300ml湖蓝', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('662', '32', '凤凰丙烯', '', null, '100.000000', '300ml钴蓝', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('663', '32', '凤凰丙烯', '', null, '100.000000', '300ml酞青蓝', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('664', '32', '凤凰丙烯', '', null, '100.000000', '300ml肉色', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('665', '32', '凤凰丙烯', '', null, '100.000000', '300ml橄榄绿', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('666', '32', '凤凰丙烯', '', null, '100.000000', '300ml普兰', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('667', '32', '凤凰丙烯', '', null, '100.000000', '300ml土红', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('668', '32', '凤凰丙烯', '', null, '100.000000', '300ml粉绿', '', '', '瓶', '', '10.000000', '9.500000', '7.500000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('669', '34', '兰亭妙笔', '', null, '100.000000', '大', '', '', '支', '', '15.000000', '10.000000', '5.500000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('670', '34', '兰亭妙笔', '', null, '100.000000', '中', '', '', '支', '', '15.000000', '10.000000', '5.500000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('671', '34', '兰亭妙笔', '', null, '100.000000', '小', '', '', '支', '', '15.000000', '10.000000', '5.500000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('672', '34', '学生狼毫', '', null, '100.000000', '大', '', '', '支', '', '8.000000', '4.500000', '2.300000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('673', '34', '学生狼毫', '', null, '200.000000', '中', '', '', '支', '', '8.000000', '4.500000', '2.000000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('674', '34', '学生狼毫', '', null, '200.000000', '小', '', '', '支', '', '8.000000', '4.500000', '1.700000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('675', '34', '好学生', '', null, '200.000000', '大楷', '', '', '支', '', '5.000000', '3.500000', '2.400000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('676', '34', '好学生', '', null, null, '中楷', '', '', '支', '', '5.000000', '3.500000', '2.100000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('677', '34', '好学生', '', null, '200.000000', '小楷', '', '', '支', '', null, '3.500000', '2.400000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('678', '34', '精品白云', '', null, '200.000000', '大', '', '', '支', '', '5.000000', '3.500000', '2.400000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('679', '34', '精品白云', '', null, '200.000000', '中', '', '', '支', '', '5.000000', '3.500000', '2.100000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('680', '34', '精品白云', '', null, '200.000000', '小', '', '', '支', '', '5.000000', '3.500000', '1.900000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('681', '34', '学生兼毫', '', null, '200.000000', '大', '', '', '支', '', '10.000000', '6.000000', '3.200000', null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('682', '34', '学生兼毫', '', null, '200.000000', '中', '', '', '支', '', '10.000000', '6.000000', '2.900000', '6.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('683', '34', '学生兼毫', '', null, '200.000000', '小', '', '', '支', '', '10.000000', '6.000000', '3.200000', '6.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('684', '34', '银白云', '', null, '200.000000', '大', '', '', '支', '', '5.000000', '2.000000', '1.400000', '2.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('685', '34', '银白云', '', null, '200.000000', '中', '', '', '支', '', '5.000000', '2.000000', '1.400000', '2.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('686', '34', '银白云', '', null, '200.000000', '小', '', '', '支', '', '5.000000', '2.000000', '1.400000', '2.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('687', '34', '狼羊兼毫', '', null, '200.000000', '大', '', '', '支', '', '10.000000', '8.500000', '5.000000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('688', '34', '狼羊兼毫', '', null, '200.000000', '中', '', '', '支', '', '10.000000', '8.500000', '5.000000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('689', '34', '狼羊兼毫', '', null, '200.000000', '小', '', '', '支', '', '10.000000', '8.500000', '3.500000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('690', '34', '白云', '', null, '200.000000', '大', '', '', '支', '', '5.000000', '3.500000', '2.400000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('691', '34', '白云', '', null, '200.000000', '中', '', '', '支', '', '5.000000', '3.500000', '2.100000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('692', '34', '白云', '', null, '200.000000', '小', '', '', '支', '', '5.000000', '3.500000', '2.400000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('693', '34', '文坛圣笔', '', null, '100.000000', '大', '', '', '支', '', '25.000000', '18.000000', '12.000000', '18.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('694', '34', '文坛圣笔', '', null, '100.000000', '中', '', '', '支', '', '25.000000', '18.000000', '12.000000', '18.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('695', '34', '文坛圣笔', '', null, '100.000000', '小', '', '', '支', '', '25.000000', '18.000000', '12.000000', '18.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('696', '34', '金狼毫', '', null, '200.000000', '大', '', '', '支', '', '5.000000', '2.500000', '1.500000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('697', '34', '金狼毫', '', null, '200.000000', '中', '', '', '支', '', '5.000000', '2.500000', '1.500000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('698', '34', '金狼毫', '', null, '200.000000', '小', '', '', '支', '', '5.000000', '2.500000', '1.200000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('699', '34', '长峰兼毫', '', null, '200.000000', '大', '', '', '支', '', '5.000000', '3.500000', '2.100000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('700', '34', '长峰兼毫', '', null, '200.000000', '中', '', '', '支', '', '5.000000', '3.500000', '2.100000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('701', '34', '长峰兼毫', '', null, '200.000000', '小', '', '', '支', '', '5.000000', '3.500000', '2.100000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('702', '34', '白玉丹青', '', null, '100.000000', '大', '', '', '支', '', '10.000000', '6.500000', '4.000000', '6.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('703', '34', '白玉丹青', '', null, '100.000000', '中', '', '', '支', '', '10.000000', '6.500000', '3.600000', '6.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('704', '34', '白玉丹青', '', null, '100.000000', '小', '', '', '支', '', '10.000000', '6.500000', '3.200000', '6.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('705', '34', '江南一绝', '', null, '100.000000', '大', '', '', '支', '', '8.000000', '5.500000', '2.400000', '5.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('706', '34', '江南一绝', '', null, '100.000000', '中', '', '', '支', '', '8.000000', '5.500000', '2.250000', '5.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('707', '34', '江南一绝', '', null, '100.000000', '小', '', '', '支', '', '8.000000', '5.500000', '2.200000', '5.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('708', '34', '花枝俏', '', null, '100.000000', '大', '', '', '支', '', '2.000000', '1.200000', '0.650000', '1.200000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('709', '34', '花枝俏', '', null, '100.000000', '中', '', '', '支', '', '2.000000', '1.200000', '0.650000', '1.200000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('710', '34', '花枝俏', '', null, '100.000000', '小', '', '', '支', '', '2.000000', '1.200000', '0.650000', '1.200000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('711', '34', '山水小楷', '', null, '50.000000', '小', '', '', '支', '', '25.000000', '25.000000', '12.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('712', '40', '一得阁墨汁', '', null, '500.000000', '100g练习', '', '', '瓶', '', '5.000000', '4.500000', '4.600000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('713', '40', '一得阁墨汁', '', null, '600.000000', '250g练习', '', '', '瓶', '', '10.000000', '8.500000', null, '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('714', '40', '一得阁墨汁', '', null, '300.000000', '500g练习', '', '', '瓶', '', '15.000000', '11.500000', null, '11.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('715', '40', '云头艳墨汁', '', null, '3.000000', '1113', '', '', '瓶', '', '280.000000', '260.000000', null, '260.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('716', '40', '云头艳墨汁', '', null, '25.000000', '500g1112', '', '', '瓶', '', '55.000000', '52.000000', null, '52.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('717', '40', '云头艳墨汁', '', null, '40.000000', '250g1110', '', '', '瓶', '', '28.000000', '26.000000', null, '26.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('718', '40', '一得阁特制浓墨珍品', '', null, '10.000000', '1085', '', '', '瓶', '', '180.000000', '150.000000', null, '150.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('719', '40', '一得阁国画专用', '', null, '10.000000', '1068', '', '', '瓶', '', '120.000000', '85.000000', null, '85.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('720', '40', '一得阁书法专用墨', '', null, '10.000000', '1069', '', '', '瓶', '', '120.000000', '85.000000', null, '85.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('721', '40', '一得阁禅墨汁', '', null, '10.000000', '1115木盒', '', '', '瓶', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('722', '40', '一得阁禅墨', '', null, '10.000000', '1115铁盒', '', '', '瓶', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('723', '40', '一得阁道墨', '', null, '10.000000', '1116', '', '', '瓶', '', null, '75.000000', null, '75.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('724', '40', '一得阁高级浓墨', '', null, '20.000000', '1082', '', '', '瓶', '', null, null, null, null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('725', '40', '精制一得阁墨汁', '', null, '50.000000', '100g1065', '', '', '瓶', '', '30.000000', '9.800000', null, '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('726', '40', '精制一得阁墨汁', '', null, '80.000000', '250g1060', '', '', '瓶', '', '18.000000', '16.500000', null, '16.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('727', '40', '精制一得阁墨汁', '', null, '50.000000', '500g1109', '', '', '瓶', '', '30.000000', '28.500000', null, '28.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('728', '40', '精制一得阁墨汁', '', null, '10.000000', '1000g1070', '', '', '瓶', '', '70.000000', '65.000000', null, '65.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('729', '40', '精制一得阁墨汁', '', null, '10.000000', '2000g1071', '', '', '瓶', '', '110.000000', '102.000000', null, '102.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('730', '40', '中华墨汁', '', null, '25.000000', '500g1063', '', '', '瓶', '', '45.000000', '45.000000', null, '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('731', '40', '中华墨汁', '', null, '40.000000', '250g1064', '', '', '瓶', '', '25.000000', '25.000000', null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('732', '40', '一得阁书画墨汁', '', null, '200.000000', '100g1074', '', '', '瓶', '', null, '7.500000', null, '7.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('733', '40', '一得阁书画墨汁', '', null, null, '250g1072', '', '', '瓶', '', '15.000000', '13.000000', null, '13.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('734', '40', '一得阁书画墨汁', '', null, '50.000000', '500g1073', '', '', '瓶', '', '25.000000', '18.000000', null, '18.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('735', '40', '一得阁学生专用墨汁', '', null, '100.000000', '100g1078', '', '', '瓶', '', '10.000000', '8.500000', null, '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('736', '40', '北京墨汁', '', null, null, '250g1056', '', '', '瓶', '', null, '12.000000', null, '12.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('737', '40', '北京墨汁', '', null, '20.000000', '1000g1059', '', '', '瓶', '', null, '28.000000', null, '28.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('738', '35', '粉饼水彩', '', null, '120.000000', '12色', '', '', '盒', '', '10.000000', '9.500000', '7.680000', '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('739', '35', '粉饼水彩', '', null, '100.000000', '16色', '', '', '盒', '', '10.000000', '10.000000', '8.160000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('740', '35', '粉饼水彩', '', null, '50.000000', '28色', '', '', '盒', '', '20.000000', '19.500000', '16.800000', '19.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('741', '35', '粉饼水彩', '', null, '50.000000', '36色', '', '', '盒', '', null, '19.500000', '16.800000', '19.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('742', '32', '12色油画', '', null, '48.000000', '毕加索', '', '', '盒', '', '18.000000', '14.500000', null, '14.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('743', '46', '水写布', '', null, '1200.000000', '米格', '', '', '个', '', '5.000000', '2.200000', '1.600000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('744', '46', '水写布', '', null, '1200.000000', '笔画', '', '', '个', '', '5.000000', '2.200000', '1.600000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('745', '45', '16k竖条作品本', '', null, '40.000000', '6865-02', '', '', '包', '', '15.000000', '12.500000', '9.500000', '12.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('746', '45', '16k米字格作品本', '', null, '800.000000', '6865-10', '', '', '包', '', '18.000000', '16.500000', '12.000000', '16.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('747', '35', '685记号勾线笔', '', null, '1440.000000', '685', '', '', '支', '', '1.500000', '1.500000', '1.100000', '1.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('748', '48', '老人头橡皮', '', null, '400.000000', '1848', '', '', '块', '', '1.000000', '1.000000', '0.650000', '1.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('749', '37', '8k速写夹', '', null, '120.000000', 's-831', '', '', '个', '', '6.000000', '5.500000', '3.500000', '5.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('750', '49', '8k马丽素描纸', '', null, '800.000000', '20张', '', '', '包', '', '4.000000', '3.500000', null, '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('751', '49', '4k马利素描纸', '', null, '400.000000', '20张', '', '', '包', '', '7.000000', '6.500000', null, '6.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('752', '50', '170ml油画', '', null, '80.000000', '钛白', '', '', '支', '', '15.000000', '14.500000', null, '14.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('753', '50', '170ml温莎油画', '', null, '40.000000', '象牙黑', '', '', '支', '', '15.000000', '14.500000', null, '14.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('754', '51', '马可36色彩铅', '', null, '30.000000', '6100', '', '', '盒', '', '35.000000', '25.000000', '20.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('755', '39', '对联纸', '', null, null, '四开万年红17*138', '', '', '包', '', '5.000000', '4.500000', '2.500000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('756', '39', '对联纸', '', null, null, '三开万年红23*138', '', '', '包', '', '8.000000', '7.500000', '4.300000', '7.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('757', '39', '对联纸', '', null, null, '六尺三开32*180', '', '', '包', '', '18.000000', '15.000000', '10.000000', '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('758', '39', '对联纸', '', null, null, '35*240 11言', '', '', '包', '', '25.000000', '20.000000', '14.000000', '20.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('759', '39', '34*34斗方', '', null, null, '小', '', '', '包', '', '5.000000', '4.500000', '2.500000', '4.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('760', '39', '45*45斗方', '', null, null, '大', '', '', '包', '', '10.000000', '8.500000', '5.500000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('761', '52', '马利画板', '', null, '120.000000', '4K', '', '', '块', '', '15.000000', '13.000000', '9.200000', '13.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('762', '52', '马利画板', '', null, '60.000000', '2K', '', '', '块', '', '28.000000', '25.000000', '18.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('763', '52', '马利画板', '', null, '18.000000', '全开', '', '', '块', '', '65.000000', '65.000000', '47.000000', '65.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('764', '52', '马利铅笔', '', null, '240.000000', 'B', '', '', '盒', '', null, '4.800000', null, '4.800000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('765', '52', '马利铅笔', '', null, '240.000000', '2B', '', '', '盒', '', null, null, null, '4.800000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('766', '52', '马利铅笔', '', null, '240.000000', '3B', '', '', '盒', '', null, null, null, '4.800000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('767', '52', '马利铅笔', '', null, '240.000000', '4B', '', '', '盒', '', null, null, null, '4.800000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('768', '52', '马利铅笔', '', null, '240.000000', '5B', '', '', '盒', '', null, null, null, '5.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('769', '52', '马利铅笔', '', null, '240.000000', '6B', '', '', '盒', '', null, null, null, '5.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('770', '52', '马利铅笔', '', null, '240.000000', '7B', '', '', '盒', '', null, null, null, '5.800000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('771', '52', '马利铅笔', '', null, '240.000000', '8B', '', '', '盒', '', null, null, null, '5.800000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('772', '52', '马利铅笔', '', null, '240.000000', '10B', '', '', '盒', '', null, null, null, '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('773', '52', '马利铅笔', '', null, '240.000000', '12B', '', '', '盒', '', null, null, null, '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('774', '52', '马利铅笔', '', null, '240.000000', '14B', '', '', '盒', '', null, null, null, '9.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('775', '52', '马利铅笔', '', null, '240.000000', '碳铅', '硬碳', '', '盒', '', null, null, null, '9.500000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('776', '52', '马利铅笔', '', null, '240.000000', '碳铅', '中碳', '', '盒', '', null, null, null, '9.500000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('777', '52', '马利铅笔', '', null, '240.000000', '碳铅', '软碳', '', '盒', '', null, null, null, '10.500000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('778', '52', '马利铅笔', '', null, '240.000000', '碳铅', '特软', '', '盒', '', null, null, null, '10.500000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('779', '52', '马利铅笔', '', null, '240.000000', '2H', '', '', '盒', '', null, null, null, '4.000000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('780', '52', '马利铅笔', '', null, '240.000000', 'HB', '', '', '盒', '', null, null, null, '4.000000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('781', '51', '马可铅笔', '', null, '60.000000', '9B', '', '', '盒', '', null, null, null, '9.500000', null, '', '', '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('782', '45', '硬笔书法纸', '', null, '400.000000', '68A4', '', '', '袋', '', null, null, '1.650000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('783', '45', '硬笔书法纸', '', null, '360.000000', '68A4B', '', '', '袋', '', null, null, '1.900000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('784', '45', '硬笔书法纸', '', null, '200.000000', '诗情画意', '', '', '袋', '', null, null, '1.900000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('785', null, '硬笔书法纸', '', null, '240.000000', '6863-8', '', '', '本', '', null, null, '1.200000', '1.800000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('786', '28', '印床', '', null, '50.000000', '中', '', '', '个', '', null, null, '6.500000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('787', '53', '镜面卡纸', '', null, '100.000000', '50*50方', '', '', '包', '', '18.000000', '15.000000', '8.500000', '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('788', '53', '镜面卡纸', '', null, '100.000000', '50*50圆', '', '', '包', '', '18.000000', '15.000000', '7.900000', '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('789', '53', '镜面卡纸', '', null, '50.000000', '38*38方', '', '', '包', '', '15.000000', '12.000000', '5.400000', '12.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('790', '53', '镜面卡纸', '', null, '100.000000', '38*38圆', '', '', '包', '', '15.000000', '12.000000', '5.400000', '12.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('791', '53', '镜面卡纸', '', null, '50.000000', '33*33方', '', '', '包', '', '10.000000', '10.000000', '4.400000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('792', '53', '镜面卡纸', '', null, '100.000000', '33*33圆', '', '', '包', '', '10.000000', '10.000000', '4.400000', null, null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('793', '53', '卷轴四开挂轴', '', null, '50.000000', '32*95空白', '', '', '个', '', '10.000000', '10.000000', '4.300000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('794', '53', '卷轴四开挂轴', '', null, null, '32*95空白纯红', '', '', '个', '', '10.000000', '10.000000', '4.300000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('795', '53', '卷轴四开挂轴', '', null, '50.000000', '32*95日历', '', '', '包', '', '10.000000', '10.000000', '4.300000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('796', '53', '卷轴四开挂轴', '', null, '50.000000', '32*95日历纯红', '', '', '个', '', '10.000000', '10.000000', '4.300000', '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('797', '53', '日历卡纸', '', null, '10.000000', '33*65', '', '', '包', '', '20.000000', '18.000000', '12.000000', '18.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('798', '42', '宣纸', '', null, '200.000000', '4K', '', '', '包', '', '5.000000', '3.000000', null, '3.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('799', '42', '宣纸', '', null, '200.000000', '8k', '', '', '包', '', '2.000000', '1.500000', null, '1.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('800', null, '排笔', '', null, '100.000000', '826长杆', '', '', '包', '', null, '15.000000', '8.000000', '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('801', null, '排笔', '', null, null, '套', '', '', '包', '', '10.000000', '8.500000', null, '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('802', null, '调色盘', '', null, null, '彩色大', '', '', '个', '', '2.000000', '1.000000', null, '1.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('803', null, '红杆排笔', '', null, null, '12支', '', '', '包', '', '5.000000', '2.600000', '2.000000', '2.800000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('804', null, '红杆排笔', '', null, null, '6支', '', '', '包', '', '3.000000', '1.300000', '1.000000', '1.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('805', '37', '折叠水桶', '', null, null, '小号', '', '', '个', '', '5.000000', '3.500000', '2.200000', '3.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('806', '28', '墨盒', '', null, '800.000000', '方形', '', '', '个', '', '2.000000', '1.000000', '0.600000', '1.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('807', '52', '国画颜料', '', null, '240.000000', '1301', '', '', '盒', '', '10.000000', '8.500000', '8.000000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('808', '40', '100书画墨汁', '', null, '1000.000000', '墨兰香', '', '', '瓶', '', '3.000000', '1.800000', '1.400000', '2.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('809', '28', '毛毡', '', null, '800.000000', '50*50', '', '', '张', '', '2.000000', '1.500000', '1.100000', '1.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('810', '28', '毛毡', '', null, '500.000000', '50*70', '', '', '张', '', '3.000000', null, '1.800000', '2.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('811', '40', '一得阁墨汁', '', null, '300.000000', '练习250g', '', '', '瓶', '', null, null, null, '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('812', '40', '一得阁墨汁', '', null, '300.000000', '练习500g', '', '', '瓶', '', null, null, null, '12.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('813', '28', '国学套装', '', null, null, '小', '', '', '套', '', '25.000000', '21.000000', '17.000000', '22.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('814', '52', '36色马利水粉', '', null, '24.000000', '7336', '', '', '盒', '', null, null, null, '39.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('815', '52', '24色马利水粉', '', null, '48.000000', '7324', '', '', '盒', '', null, null, null, '37.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('816', '52', '18色马利水粉', '', null, '100.000000', '7318', '', '', '盒', '', null, null, null, '24.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('817', '52', '12色马利水粉', '', null, '100.000000', '7312', '', '', '盒', '', null, null, null, '13.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('818', '52', '12色马利丙烯', '', null, '100.000000', '812', '', '', '盒', '', null, null, null, '12.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('819', '52', '18色马利丙烯', '', null, '100.000000', '818', '', '', '盒', '', null, null, null, '19.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('820', '52', '24色丙烯', '', null, '100.000000', '824', '', '', '盒', '', null, '28.500000', null, '28.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('821', '52', '马利500ml丙烯', '', null, null, '500ml', '', '', '瓶', '', '16.000000', null, '15.500000', '16.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('822', '32', '凤凰丙烯500ml', '', null, null, '500ml', '', '', '瓶', '', null, null, null, '10.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('823', '45', 'A3硬笔作品纸', '', null, '100.000000', '68A3-A', '', '', '包', '', '8.000000', '5.500000', null, '5.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('824', '34', '顶级小狼毫', '', null, '20.000000', '小楷', '', '', '支', '', '25.000000', null, '12.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('825', '34', '火眉', '', null, '20.000000', '中', '', '', '支', '', '120.000000', '95.000000', null, '95.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('826', '34', '仿古玉兰心', '', null, '50.000000', '大', '', '', '支', '', '25.000000', null, null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('827', '34', '仿古玉兰芯', '', null, null, '中', '', '', '支', '', '25.000000', null, null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('828', '34', '仿古玉兰芯', '', null, null, '小', '', '', '支', '', '25.000000', '25.000000', null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('829', '34', '极品长峰狼毫', '', null, '50.000000', '大', '', '', '支', '', '18.000000', '15.000000', null, '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('830', '34', '极品长峰狼毫', '', null, '50.000000', '中', '', '', '支', '', '15.000000', '15.000000', null, '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('831', '34', '极品长峰狼毫', '', null, '50.000000', '小', '', '', '支', '', '15.000000', null, null, '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('832', '34', '精品花卉', '', null, '50.000000', '支', '', '', '支', '', '25.000000', '15.000000', null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('833', '34', '画龙点睛', '', null, '50.000000', '支', '', '', '支', '', '55.000000', '45.000000', null, '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('834', '34', '青辉勾线', '', null, '50.000000', '大', '', '', '支', '', '8.000000', '6.000000', null, '6.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('835', '34', '青辉勾线', '', null, '50.000000', '中', '', '', '瓶', '', '8.000000', '6.000000', null, '6.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('836', '34', '青辉勾线', '', null, '50.000000', '小', '', '', '支', '', '8.000000', '6.000000', null, '6.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('837', '34', '顶峰', '', null, '50.000000', '大', '', '', '支', '', '25.000000', '25.000000', null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('838', '34', '顶峰', '', null, '50.000000', '中', '', '', '支', '', '25.000000', '25.000000', null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('839', '34', '顶峰', '', null, '50.000000', '小', '', '', '支', '', '25.000000', '25.000000', null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('840', '34', '花描兼毫', '', null, '200.000000', '大', '', '', '支', '', '15.000000', null, null, '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('841', '34', '花描兼毫', '', null, '200.000000', '中', '', '', '支', '', '15.000000', '8.500000', null, '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('842', '34', '花描兼毫', '', null, '200.000000', '小', '', '', '支', '', '15.000000', '8.500000', null, '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('843', '34', '灰尾书画', '', null, '100.000000', '大', '', '', '支', '', '8.000000', null, null, '6.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('844', '34', '灰尾书画', '', null, '100.000000', '中', '', '', '支', '', '8.000000', null, null, '6.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('845', '34', '灰尾书画', '', null, '100.000000', '小', '', '', '支', '', '8.000000', null, null, '6.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('846', '34', '古典兼毫', '', null, '100.000000', '大', '', '', '支', '', '55.000000', null, null, '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('847', '34', '古典兼毫', '', null, '50.000000', '中', '', '', '支', '', '55.000000', null, null, '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('848', '34', '古典兼毫', '', null, '50.000000', '小', '', '', '支', '', '55.000000', null, null, '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('849', '34', '紫塞玉峰', '', null, '50.000000', '一', '', '', '支', '', '85.000000', null, null, '65.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('850', '34', '紫塞玉峰', '', null, '50.000000', '二', '', '', '支', '', '85.000000', null, null, '65.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('851', '34', '紫塞玉峰', '', null, '50.000000', '三', '', '', '支', '', '85.000000', null, null, '65.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('852', '34', '精峰玉秀', '', null, '10.000000', '大', '', '', '支', '', '85.000000', null, null, '85.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('853', '34', '精峰玉秀', '', null, '10.000000', '中', '', '', '支', '', '85.000000', null, null, '85.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('854', '34', '精峰玉秀', '', null, '10.000000', '小', '', '', '支', '', '85.000000', null, null, '85.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('855', '34', '飞云渡月', '', null, '50.000000', '大', '', '', '支', '', '25.000000', null, null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('856', '34', '飞云渡月', '', null, '50.000000', '中', '', '', '支', '', null, '25.000000', null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('857', '34', '飞云渡月', '', null, '50.000000', '小', '', '', '支', '', '25.000000', null, null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('858', '34', '珀莱雅', '', null, '50.000000', '大', '', '', '支', '', '15.000000', '15.000000', null, '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('859', '34', '珀莱雅', '', null, '50.000000', '中', '', '', '支', '', '15.000000', '15.000000', null, '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('860', '34', '珀莱雅', '', null, '50.000000', '小', '', '', '支', '', null, '15.000000', null, '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('861', '34', '百花争艳', '', null, '50.000000', '大', '', '', '支', '', '25.000000', null, null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('862', '34', '百花争艳', '', null, '50.000000', '中', '', '', '支', '', '25.000000', null, null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('863', '34', '百花争艳', '', null, '50.000000', '小', '', '', '支', '', '25.000000', null, null, '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('864', '34', '翰墨狼提', '', null, '50.000000', '大', '', '', '支', '', '60.000000', '45.000000', null, '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('865', '34', '翰墨狼提', '', null, '50.000000', '中', '', '', '支', '', '60.000000', '45.000000', null, '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('866', '34', '翰墨狼提', '', null, '50.000000', '小', '', '', '支', '', '60.000000', '45.000000', null, '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('867', '34', '笔落惊风', '', null, '20.000000', '毛笔', '', '', '支', '', '55.000000', null, null, '45.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('868', '34', '尖端', '', null, '20.000000', '毛笔', '', '', '支', '', '55.000000', null, '25.000000', '55.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('869', '34', '世外桃源', '', null, null, '毛笔', '', '', '支', '', '25.000000', null, '9.000000', '25.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('870', '34', '名扬四海', '', null, '50.000000', '大', '', '', '支', '', '20.000000', '15.000000', '6.200000', '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('871', '34', '名扬四海', '', null, '50.000000', '中', '', '', '支', '', '25.000000', '15.000000', '6.000000', '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('872', '34', '名扬四海', '', null, '50.000000', '小', '', '', '支', '', '25.000000', '15.000000', '5.300000', '15.000000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('873', '34', '经典红木狼毫', '', null, '50.000000', '大', '', '', '支', '', '15.000000', '8.500000', '4.500000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('874', '34', '经典红木狼毫', '', null, '100.000000', '中', '', '', '支', '', '15.000000', '8.500000', '3.800000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('875', '34', '经典红木狼毫', '', null, '100.000000', '小', '', '', '支', '', '15.000000', '8.500000', '3.400000', '8.500000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('876', '34', '兰竹', '', null, '200.000000', '大', '', '', '支', '', null, null, '0.800000', '1.200000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('877', '34', '兰竹', '', null, '200.000000', '中', '', '', '支', '', null, '1.200000', '0.600000', '1.200000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('878', '34', '兰竹', '', null, '200.000000', '小', '', '', '支', '', null, null, '0.500000', '1.200000', null, null, null, '[{\"basic\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\",\"EnableSerialNumber\":\"0\"}},{\"other\":{\"Unit\":\"\",\"RetailPrice\":\"\",\"LowPrice\":\"\",\"PresetPriceOne\":\"\",\"PresetPriceTwo\":\"\"}}]', '', '', '', '', '0', '63', '0');

-- ----------------------------
-- Table structure for jsh_materialcategory
-- ----------------------------
DROP TABLE IF EXISTS `jsh_materialcategory`;
CREATE TABLE `jsh_materialcategory` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `CategoryLevel` smallint(6) DEFAULT NULL COMMENT '等级',
  `ParentId` bigint(20) DEFAULT NULL COMMENT '上级ID',
  `sort` varchar(10) DEFAULT NULL COMMENT '显示顺序',
  `status` varchar(1) DEFAULT '0' COMMENT '状态，0系统默认，1启用，2删除',
  `serial_no` varchar(100) DEFAULT NULL COMMENT '编号',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`Id`),
  KEY `FK3EE7F725237A77D8` (`ParentId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='产品类型表';

-- ----------------------------
-- Records of jsh_materialcategory
-- ----------------------------
INSERT INTO `jsh_materialcategory` VALUES ('1', '根目录', '1', '-1', null, '2', '1', null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('2', '花边一级A', '1', '1', '', '2', '', '', null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('3', '花边一级B', '1', '1', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('4', '其他', '2', '3', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('5', '其他', '3', '4', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('6', '花边二级A', '2', '2', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('7', '花边三级A', '3', '6', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('8', '花边二级B', '2', '2', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('9', '花边一级C', '1', '1', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('10', '花边三级B', '3', '6', null, '2', null, null, null, null, '2019-03-15 23:09:05', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('11', 'ddddd', null, '-1', '', '1', '', '', '2019-03-15 23:09:13', '63', '2019-03-15 23:09:13', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('12', 'ffffff', null, '11', '', '1', '', '', '2019-03-15 23:09:27', '63', '2019-03-15 23:09:27', '63', null);
INSERT INTO `jsh_materialcategory` VALUES ('13', '毛笔', null, '-1', 'A', '1', '', '', '2019-03-18 22:45:39', '63', '2019-10-24 14:21:47', '120', '1');
INSERT INTO `jsh_materialcategory` VALUES ('14', '目录2', null, '13', '', '1', '234', '', '2019-03-18 23:39:39', '63', '2019-03-18 23:39:39', '63', '1');
INSERT INTO `jsh_materialcategory` VALUES ('15', '目录1', null, '-1', '', '1', '', '', '2019-03-31 21:53:53', '117', '2019-03-31 21:53:53', '117', '117');
INSERT INTO `jsh_materialcategory` VALUES ('16', 'aaaa', null, '-1', '', '1', '', '', '2019-04-02 22:28:07', '115', '2019-04-02 22:28:07', '115', '115');
INSERT INTO `jsh_materialcategory` VALUES ('17', '目录1', null, '-1', '', '1', '', '', '2019-04-10 22:18:12', '63', '2019-04-10 22:18:12', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('18', '毛笔', null, '-1', '', '2', 'mb', '', '2019-10-25 11:23:22', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('19', '颜料', null, '-1', '', '2', 'yl', '', '2019-10-25 11:23:48', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('20', '墨汁', null, '-1', '', '2', 'mz', '', '2019-10-25 11:24:03', '63', '2019-10-26 13:20:09', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('21', '砚台', null, '-1', '', '2', 'yt', '', '2019-10-25 11:24:31', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('22', '宣纸', null, '-1', '', '2', 'xz', '', '2019-10-25 11:24:43', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('23', '镇尺', null, '-1', '', '2', 'zc', '', '2019-10-25 11:25:17', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('24', '笔洗', null, '-1', '', '2', 'bx', '', '2019-10-25 11:25:29', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('25', '工具箱', null, '-1', '', '2', 'gjx', '', '2019-10-25 11:26:02', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('26', '刀具', null, '-1', '', '2', '', '', '2019-10-25 14:11:04', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('27', '纸张', null, '-1', '', '2', '', '', '2019-10-25 14:28:04', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('28', '文房四宝', null, '-1', '', '1', '', '', '2019-10-25 15:24:32', '63', '2019-10-25 15:24:32', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('29', '排笔', null, '-1', '', '2', '', '', '2019-10-25 15:41:19', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('30', '雄狮', null, '-1', '', '2', '', '', '2019-10-25 18:38:56', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('31', '手工材料', null, '-1', '', '1', '', '', '2019-10-25 18:48:00', '63', '2019-10-25 18:48:00', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('32', '凤凰画材', null, '-1', '', '1', '', '', '2019-10-25 18:49:35', '63', '2019-10-25 18:49:35', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('33', '康颂', null, '-1', '', '2', '', '', '2019-10-25 18:50:22', '63', '2019-10-26 13:19:56', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('34', '紫塞文斋', null, '-1', '', '1', '', '', '2019-10-26 13:19:17', '63', '2019-10-26 19:45:02', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('35', '雄狮画材', null, '-1', '', '1', '', '', '2019-10-26 13:20:37', '63', '2019-10-26 13:20:37', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('36', '明华画材', null, '-1', '', '1', '', '', '2019-10-26 13:20:45', '63', '2019-10-26 13:20:45', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('37', '华泰画材', null, '-1', '', '1', '', '', '2019-10-26 13:20:54', '63', '2019-10-26 13:20:54', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('38', '翟雪平', null, '-1', '', '1', '', '', '2019-10-26 13:21:13', '63', '2019-10-26 13:21:13', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('39', '明星宣纸', null, '-1', '', '1', '', '', '2019-10-26 13:22:00', '63', '2019-10-26 13:22:00', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('40', '一得阁墨汁', null, '-1', '', '1', '', '', '2019-10-26 13:23:06', '63', '2019-10-26 13:23:06', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('41', '龙啸宣纸', null, '-1', '', '1', '', '', '2019-10-26 13:41:58', '63', '2019-10-26 13:41:58', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('42', '张林宣纸', null, '-1', '', '1', '', '', '2019-10-26 13:42:11', '63', '2019-10-26 13:42:11', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('43', '万隆毛边纸', null, '-1', '', '1', '', '', '2019-10-26 13:46:02', '63', '2019-10-26 13:46:02', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('44', '徐清华笔帘', null, '-1', '', '1', '', '', '2019-10-26 13:46:26', '63', '2019-10-26 13:46:26', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('45', '塞外风素描本', null, '-1', '', '1', '', '', '2019-10-26 13:46:48', '63', '2019-10-26 13:46:48', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('46', '朱小财水写布', null, '-1', '', '1', '', '', '2019-10-26 13:57:50', '63', '2019-10-26 13:57:50', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('47', '朱小财水写布', null, '-1', '', '2', '', '', '2019-10-26 13:57:50', '63', '2019-10-26 14:37:52', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('48', '老人头橡皮', null, '-1', '', '1', '', '', '2019-10-26 14:35:21', '63', '2019-10-26 14:35:21', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('49', '奈儿纸业', null, '-1', '', '1', '', '', '2019-10-26 14:40:35', '63', '2019-10-26 14:40:35', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('50', '温莎牛顿', null, '-1', '', '1', '', '', '2019-10-26 14:43:22', '63', '2019-10-26 14:43:22', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('51', '马可系列', null, '-1', '', '1', '', '', '2019-10-26 15:09:04', '63', '2019-10-26 15:09:04', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('52', '马利画材', null, '-1', '', '1', '', '', '2019-10-26 16:27:27', '63', '2019-10-26 16:27:27', '63', '63');
INSERT INTO `jsh_materialcategory` VALUES ('53', '张云振', null, '-1', '', '1', '', '', '2019-10-27 11:59:45', '63', '2019-10-27 11:59:45', '63', '63');

-- ----------------------------
-- Table structure for jsh_materialproperty
-- ----------------------------
DROP TABLE IF EXISTS `jsh_materialproperty`;
CREATE TABLE `jsh_materialproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nativeName` varchar(50) DEFAULT NULL COMMENT '原始名称',
  `enabled` bit(1) DEFAULT NULL COMMENT '是否启用',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  `anotherName` varchar(50) DEFAULT NULL COMMENT '别名',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='产品扩展字段表';

-- ----------------------------
-- Records of jsh_materialproperty
-- ----------------------------
INSERT INTO `jsh_materialproperty` VALUES ('1', '规格', '', '02', '规格', '0');
INSERT INTO `jsh_materialproperty` VALUES ('2', '颜色', '', '01', '颜色', '0');
INSERT INTO `jsh_materialproperty` VALUES ('3', '制造商', '\0', '03', '制造商', '0');
INSERT INTO `jsh_materialproperty` VALUES ('4', '自定义1', '\0', '04', '自定义1', '0');
INSERT INTO `jsh_materialproperty` VALUES ('5', '自定义2', '\0', '05', '自定义2', '0');
INSERT INTO `jsh_materialproperty` VALUES ('6', '自定义3', '\0', '06', '自定义3', '0');

-- ----------------------------
-- Table structure for jsh_msg
-- ----------------------------
DROP TABLE IF EXISTS `jsh_msg`;
CREATE TABLE `jsh_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msg_title` varchar(100) DEFAULT NULL COMMENT '消息标题',
  `msg_content` varchar(500) DEFAULT NULL COMMENT '消息内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `type` varchar(20) DEFAULT NULL COMMENT '消息类型',
  `status` varchar(1) DEFAULT NULL COMMENT '状态，1未读 2已读',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='消息表';

-- ----------------------------
-- Records of jsh_msg
-- ----------------------------
INSERT INTO `jsh_msg` VALUES ('2', '标题1', '内容1', '2019-09-10 00:11:39', '类型1', '1', '63', '0');

-- ----------------------------
-- Table structure for jsh_organization
-- ----------------------------
DROP TABLE IF EXISTS `jsh_organization`;
CREATE TABLE `jsh_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_no` varchar(20) DEFAULT NULL COMMENT '机构编号',
  `org_full_name` varchar(500) DEFAULT NULL COMMENT '机构全称',
  `org_abr` varchar(20) DEFAULT NULL COMMENT '机构简称',
  `org_tpcd` varchar(9) DEFAULT NULL COMMENT '机构类型',
  `org_stcd` char(1) DEFAULT NULL COMMENT '机构状态,1未营业、2正常营业、3暂停营业、4终止营业、5已除名',
  `org_parent_no` varchar(20) DEFAULT NULL COMMENT '机构父节点编号',
  `sort` varchar(20) DEFAULT NULL COMMENT '机构显示顺序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `org_create_time` datetime DEFAULT NULL COMMENT '机构创建时间',
  `org_stop_time` datetime DEFAULT NULL COMMENT '机构停运时间',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of jsh_organization
-- ----------------------------
INSERT INTO `jsh_organization` VALUES ('1', '01', '根机构', '根机构', null, '5', '-1', '1', '根机构，初始化存在', null, null, '2019-03-15 23:01:21', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('2', null, '销售', '销售', null, '5', '01', '1', '机构表初始化', null, null, '2019-03-15 23:01:21', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('3', null, 'sdf444', 'sdf444', null, '5', '01', '2', '机构表初始化', null, null, '2019-03-15 23:01:19', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('4', null, '1231', '1231', null, '5', '01', '3', '机构表初始化', null, null, '2019-03-15 23:01:19', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('5', null, '23', '23', null, '5', '01', '4', '机构表初始化', null, null, '2019-03-15 23:01:19', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('6', '4444', 'abcd', 'abcd', null, '1', '-1', '', '', '2019-03-15 23:01:30', '63', '2019-03-15 23:01:47', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('7', '123', 'bbbb', 'bbbb', null, '1', 'abcd', '', '', '2019-03-15 23:01:42', '63', '2019-03-15 23:01:42', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('8', 'ddddd', 'ddddd', 'ddddd', null, '1', '4444', '', '', '2019-03-15 23:02:02', '63', '2019-03-15 23:02:02', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('9', '555', 'dddddddddd', 'dddddddddd', null, '1', 'ddddd', '', '', '2019-03-15 23:02:16', '63', '2019-03-15 23:02:16', '63', null, null, null);
INSERT INTO `jsh_organization` VALUES ('10', '23124', 'gaga', 'gaga', null, '1', '-1', '11', '', '2019-03-31 21:52:31', '117', '2019-03-31 21:52:31', '117', null, null, '117');
INSERT INTO `jsh_organization` VALUES ('11', '12312', 'fsadfasdf', 'fsadfasdf', null, '1', '23124', '12312', '', '2019-03-31 21:52:52', '117', '2019-03-31 21:52:52', '117', null, null, '117');

-- ----------------------------
-- Table structure for jsh_orga_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `jsh_orga_user_rel`;
CREATE TABLE `jsh_orga_user_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orga_id` bigint(20) NOT NULL COMMENT '机构id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_blng_orga_dspl_seq` varchar(20) DEFAULT NULL COMMENT '用户在所属机构中显示顺序',
  `delete_flag` char(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='机构用户关系表';

-- ----------------------------
-- Records of jsh_orga_user_rel
-- ----------------------------
INSERT INTO `jsh_orga_user_rel` VALUES ('1', '9', '64', '', '0', null, null, '2019-03-15 23:03:39', '63', null);
INSERT INTO `jsh_orga_user_rel` VALUES ('2', '3', '65', null, '0', null, null, null, null, null);
INSERT INTO `jsh_orga_user_rel` VALUES ('3', '3', '67', null, '0', null, null, null, null, null);
INSERT INTO `jsh_orga_user_rel` VALUES ('4', '4', '84', null, '0', null, null, null, null, null);
INSERT INTO `jsh_orga_user_rel` VALUES ('5', '5', '86', null, '0', null, null, null, null, null);
INSERT INTO `jsh_orga_user_rel` VALUES ('6', '3', '91', '', '0', '2019-03-12 21:55:28', '63', '2019-03-12 21:55:28', '63', null);
INSERT INTO `jsh_orga_user_rel` VALUES ('7', '9', '95', '', '0', '2019-03-15 23:03:22', '63', '2019-03-15 23:03:22', '63', null);
INSERT INTO `jsh_orga_user_rel` VALUES ('8', '9', '96', '', '0', '2019-03-17 23:32:08', '63', '2019-03-17 23:32:08', '63', null);
INSERT INTO `jsh_orga_user_rel` VALUES ('9', '10', '117', '', '0', '2019-03-31 21:53:03', '117', '2019-03-31 21:53:12', '117', '117');

-- ----------------------------
-- Table structure for jsh_person
-- ----------------------------
DROP TABLE IF EXISTS `jsh_person`;
CREATE TABLE `jsh_person` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` varchar(20) DEFAULT NULL COMMENT '类型',
  `Name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='经手人表';

-- ----------------------------
-- Records of jsh_person
-- ----------------------------
INSERT INTO `jsh_person` VALUES ('3', '财务员', '王五-财务', null, '0');
INSERT INTO `jsh_person` VALUES ('4', '财务员', '赵六-财务', null, '0');
INSERT INTO `jsh_person` VALUES ('5', '业务员', '小李', null, '0');
INSERT INTO `jsh_person` VALUES ('6', '业务员', '小军', null, '0');
INSERT INTO `jsh_person` VALUES ('7', '业务员', '小曹', null, '0');
INSERT INTO `jsh_person` VALUES ('8', '仓管员', '小季', '1', '0');
INSERT INTO `jsh_person` VALUES ('9', '财务员', '小月', '1', '0');
INSERT INTO `jsh_person` VALUES ('10', '仓管员', '小张', '117', '0');
INSERT INTO `jsh_person` VALUES ('11', '业务员', '晓丽', '117', '0');
INSERT INTO `jsh_person` VALUES ('12', '财务员', '小草', '117', '0');
INSERT INTO `jsh_person` VALUES ('13', '业务员', '经手人1', '115', '0');

-- ----------------------------
-- Table structure for jsh_role
-- ----------------------------
DROP TABLE IF EXISTS `jsh_role`;
CREATE TABLE `jsh_role` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of jsh_role
-- ----------------------------
INSERT INTO `jsh_role` VALUES ('4', '管理员', null, null, null, null, '0');
INSERT INTO `jsh_role` VALUES ('5', '仓管员', null, null, null, null, '0');
INSERT INTO `jsh_role` VALUES ('10', '租户', null, null, null, null, '0');
INSERT INTO `jsh_role` VALUES ('12', '角色123', null, null, null, '117', '0');
INSERT INTO `jsh_role` VALUES ('13', '角色test', null, null, null, null, '0');
INSERT INTO `jsh_role` VALUES ('14', '44444', null, null, null, null, '1');
INSERT INTO `jsh_role` VALUES ('15', 'laoba角色', null, null, null, '115', '0');
INSERT INTO `jsh_role` VALUES ('16', '测试角色123', null, null, null, '63', '0');

-- ----------------------------
-- Table structure for jsh_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `jsh_serial_number`;
CREATE TABLE `jsh_serial_number` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_Id` bigint(20) DEFAULT NULL COMMENT '产品表id',
  `serial_Number` varchar(64) DEFAULT NULL COMMENT '序列号',
  `is_Sell` varchar(1) DEFAULT '0' COMMENT '是否卖出，0未卖出，1卖出',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_Time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_Time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `depothead_Id` bigint(20) DEFAULT NULL COMMENT '单据主表id，用于跟踪序列号流向',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='序列号表';

-- ----------------------------
-- Records of jsh_serial_number
-- ----------------------------
INSERT INTO `jsh_serial_number` VALUES ('1', '563', '13915521178850971', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('2', '563', '13915521178850972', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('3', '563', '13915521178850973', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('4', '563', '13915521178850974', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('5', '563', '13915521178850975', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('6', '563', '13915521178850976', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('7', '563', '13915521178850977', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('8', '563', '13915521178850978', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('9', '563', '13915521178850979', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('10', '563', '139155211788509710', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:53:07', '63', '117', null);
INSERT INTO `jsh_serial_number` VALUES ('11', '563', '139155211788509711', '1', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:57:26', '63', '118', null);
INSERT INTO `jsh_serial_number` VALUES ('12', '563', '139155211788509712', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('13', '563', '139155211788509713', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('14', '563', '139155211788509714', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('15', '563', '139155211788509715', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('16', '563', '139155211788509716', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('17', '563', '139155211788509717', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('18', '563', '139155211788509718', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('19', '563', '139155211788509719', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('20', '563', '139155211788509720', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('21', '563', '139155211788509721', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('22', '563', '139155211788509722', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('23', '563', '139155211788509723', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('24', '563', '139155211788509724', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('25', '563', '139155211788509725', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('26', '563', '139155211788509726', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('27', '563', '139155211788509727', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('28', '563', '139155211788509728', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('29', '563', '139155211788509729', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('30', '563', '139155211788509730', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('31', '563', '139155211788509731', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('32', '563', '139155211788509732', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('33', '563', '139155211788509733', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('34', '563', '139155211788509734', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('35', '563', '139155211788509735', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('36', '563', '139155211788509736', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('37', '563', '139155211788509737', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('38', '563', '139155211788509738', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('39', '563', '139155211788509739', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('40', '563', '139155211788509740', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('41', '563', '139155211788509741', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('42', '563', '139155211788509742', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('43', '563', '139155211788509743', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('44', '563', '139155211788509744', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('45', '563', '139155211788509745', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('46', '563', '139155211788509746', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('47', '563', '139155211788509747', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('48', '563', '139155211788509748', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('49', '563', '139155211788509749', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('50', '563', '139155211788509750', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('51', '563', '139155211788509751', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('52', '563', '139155211788509752', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('53', '563', '139155211788509753', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('54', '563', '139155211788509754', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('55', '563', '139155211788509755', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('56', '563', '139155211788509756', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('57', '563', '139155211788509757', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('58', '563', '139155211788509758', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('59', '563', '139155211788509759', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('60', '563', '139155211788509760', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('61', '563', '139155211788509761', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('62', '563', '139155211788509762', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('63', '563', '139155211788509763', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('64', '563', '139155211788509764', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('65', '563', '139155211788509765', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('66', '563', '139155211788509766', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('67', '563', '139155211788509767', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('68', '563', '139155211788509768', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('69', '563', '139155211788509769', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('70', '563', '139155211788509770', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('71', '563', '139155211788509771', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('72', '563', '139155211788509772', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('73', '563', '139155211788509773', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('74', '563', '139155211788509774', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('75', '563', '139155211788509775', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('76', '563', '139155211788509776', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('77', '563', '139155211788509777', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('78', '563', '139155211788509778', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('79', '563', '139155211788509779', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('80', '563', '139155211788509780', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('81', '563', '139155211788509781', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('82', '563', '139155211788509782', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('83', '563', '139155211788509783', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('84', '563', '139155211788509784', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('85', '563', '139155211788509785', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('86', '563', '139155211788509786', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('87', '563', '139155211788509787', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('88', '563', '139155211788509788', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('89', '563', '139155211788509789', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('90', '563', '139155211788509790', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('91', '563', '139155211788509791', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('92', '563', '139155211788509792', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('93', '563', '139155211788509793', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('94', '563', '139155211788509794', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('95', '563', '139155211788509795', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('96', '563', '139155211788509796', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('97', '563', '139155211788509797', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('98', '563', '139155211788509798', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('99', '563', '139155211788509799', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('100', '563', '1391552117885097100', '0', '', '0', '2019-03-09 15:51:25', '63', '2019-03-09 15:51:25', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('102', '563', '123123123', '0', '', '0', '2019-03-21 23:57:29', '63', '2019-03-21 23:57:29', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('103', '565', '2222222', '0', '', '0', '2019-03-21 23:57:37', '63', '2019-03-21 23:57:37', '63', null, null);
INSERT INTO `jsh_serial_number` VALUES ('104', '563', '234213123', '0', '', '0', '2019-03-21 23:58:00', '63', '2019-03-21 23:58:00', '63', null, null);

-- ----------------------------
-- Table structure for jsh_supplier
-- ----------------------------
DROP TABLE IF EXISTS `jsh_supplier`;
CREATE TABLE `jsh_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier` varchar(255) NOT NULL COMMENT '供应商名称',
  `contacts` varchar(100) DEFAULT NULL COMMENT '联系人',
  `phonenum` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `isystem` tinyint(4) DEFAULT NULL COMMENT '是否系统自带 0==系统 1==非系统',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `enabled` bit(1) DEFAULT NULL COMMENT '启用',
  `AdvanceIn` decimal(24,6) DEFAULT '0.000000' COMMENT '预收款',
  `BeginNeedGet` decimal(24,6) DEFAULT NULL COMMENT '期初应收',
  `BeginNeedPay` decimal(24,6) DEFAULT NULL COMMENT '期初应付',
  `AllNeedGet` decimal(24,6) DEFAULT NULL COMMENT '累计应收',
  `AllNeedPay` decimal(24,6) DEFAULT NULL COMMENT '累计应付',
  `fax` varchar(30) DEFAULT NULL COMMENT '传真',
  `telephone` varchar(30) DEFAULT NULL COMMENT '手机',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `taxNum` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `bankName` varchar(50) DEFAULT NULL COMMENT '开户行',
  `accountNumber` varchar(50) DEFAULT NULL COMMENT '账号',
  `taxRate` decimal(24,6) DEFAULT NULL COMMENT '税率',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='供应商/客户信息表';

-- ----------------------------
-- Records of jsh_supplier
-- ----------------------------
INSERT INTO `jsh_supplier` VALUES ('1', '上海某某花边工厂', '乔治', '', '', '', '1', '供应商', '', '0.000000', null, '20.000000', null, null, '', '', '', '', '', '', '10.000000', null, '0');
INSERT INTO `jsh_supplier` VALUES ('2', '客户AAAA', '佩琪', '', '', '', '1', '客户', '', '24.000000', '10.000000', null, null, null, '', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('4', '苏州新源布料厂', '龙哥', '13000000000', '312341@qq.com', '55', '1', '供应商', '', '0.000000', null, '44.000000', null, null, '', '', '', '', '', '', '17.000000', null, '0');
INSERT INTO `jsh_supplier` VALUES ('5', '客户BBBB', '彪哥', '13000000000', '666@qq.com', '', '1', '客户', '', '36.000000', '20.000000', null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('6', '南通宝贝家纺', '姗姗', '1231', '31243@qq.com', '备注备注备注', '1', '客户', '', '0.000000', '5.000000', null, null, null, '2134', '15678903', '地址地址地址', '纳税人识别号', '开户行', '31234124312', '0.170000', null, '0');
INSERT INTO `jsh_supplier` VALUES ('7', '非会员', '宋江', '13000000000', '123456@qq.com', '', '1', '会员', '', '76.600000', null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('8', 'hy00001', '宋江', '13000000000', '', '', '1', '会员', '', '954.800000', null, null, null, null, '', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('9', 'hy00002', '吴用', '13000000000', '', '', '1', '会员', '', '344.000000', null, null, null, null, '', '', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('10', '1268787965', '李逵', '82567384', '423@qq.com', '', '1', '会员', '', '2122.000000', null, null, null, null, '', '13000000001', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('45', '666666666', '武松', '82567384', '423@qq.com', '', '1', '会员', '', '2100.000000', '0.000000', '0.000000', '0.000000', '0.000000', '', '13000000001', '', '', '', '', '0.000000', null, '0');
INSERT INTO `jsh_supplier` VALUES ('46', '南通居梦莱家纺', '曹操', '', '', '', '1', '供应商', '', '0.000000', null, null, '0.000000', '0.000000', '', '13000000000', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('47', '供应商1', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '1', '0');
INSERT INTO `jsh_supplier` VALUES ('48', '客户1', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '1', '0');
INSERT INTO `jsh_supplier` VALUES ('49', 'ddddd123', '', '', '', '', null, '会员', '', '6.000000', null, null, null, null, '', '', '', '', '', '', null, '1', '0');
INSERT INTO `jsh_supplier` VALUES ('50', '供应商2', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '1', '0');
INSERT INTO `jsh_supplier` VALUES ('51', '供应商1', '小周', '', '', '', null, '供应商', '', '0.000000', null, '2000.000000', null, null, '', '', '', '', '', '', null, '117', '0');
INSERT INTO `jsh_supplier` VALUES ('52', '客户123', '', '', '', '', null, '客户', '', '0.000000', '1000.000000', null, null, null, '', '', '', '', '', '', null, '117', '0');
INSERT INTO `jsh_supplier` VALUES ('53', '会员123123', '', '', '', '', null, '会员', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '117', '0');
INSERT INTO `jsh_supplier` VALUES ('54', '供应商2222', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '117', '0');
INSERT INTO `jsh_supplier` VALUES ('55', '供应商1', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '115', '0');
INSERT INTO `jsh_supplier` VALUES ('56', '客户666', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '115', '0');
INSERT INTO `jsh_supplier` VALUES ('57', '供应商1', '', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '', '', '', '', '', '12.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('58', '客户1', '', '', '', '', null, '客户', '', '0.000000', '200.000000', '0.000000', '-100.000000', null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('59', 'kh123', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('60', '12312666', '', '', '', '', null, '会员', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('61', '', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', '12312312.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('62', '供if', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('63', '', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('64', 'wrwer', '', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '', '', '', '', '', '233.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('65', '123123', '', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '', '', '', '', '', '44.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('66', 'rrtt', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('67', '供应商2', '', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '', '', '', '', '', '7.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('68', '供应商3', '', '', '', '', null, '供应商', '', '0.000000', '0.000000', '500.000000', null, '-15.000000', '', '13000000000', '', '', '', '', '22.000000', '63', '0');
INSERT INTO `jsh_supplier` VALUES ('69', '', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', '3123.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('70', 'rrrrr', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('71', 'fsdfasdf', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('72', 'sdfafadsf', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('73', 'sadvczXCvz', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('74', 'QUDIAN', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, null, '1');
INSERT INTO `jsh_supplier` VALUES ('75', 'QUDIAN', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '13455706321', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('76', 'QUDIAN', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, null, '1');
INSERT INTO `jsh_supplier` VALUES ('77', '小玉', '小玉', '13111111111', '123@qq.com', '1', null, '客户', '', '0.000000', '1.000000', null, null, null, '0755-5631666', '13111111111', '1', '1', '1', '1', '1.000000', null, '0');
INSERT INTO `jsh_supplier` VALUES ('78', 'LIHUAQ', '李', '', 'lhq2@qq.com', '', null, '客户', '', '0.000000', null, null, null, null, '', '1344444444', '', '', '', '', null, null, '0');
INSERT INTO `jsh_supplier` VALUES ('79', 'lhq', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '13455675653', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('80', 'zxy', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '13828286754', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('81', 'qudian', '', '', '', '', null, '供应商', '', '0.000000', null, '5000.000000', null, null, '', '146754607451', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('82', '紫塞文斋', '邹秋梅', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '13659955601', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('83', '华泰', '孙', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '0539-8023477', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('84', '徐锐', '13659955601', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('85', '徐锐', '徐锐', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '13659955601', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('86', '彭家敏', '彭家敏', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '昌吉', '13899605799', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('87', '包其良', '包其良', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '昌吉', '13999358162', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('88', '杨树水', '杨树水', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '哈密', '17399925505', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('89', '新创', '刘照', '', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '0.000000', null, '华林', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('90', '陈秀丽', '陈秀丽', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '清水河', '18999599320', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('91', '小陈', '小陈', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '华林', '18199323979', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('92', '王英', '王英', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '独山子', '18997700300', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('93', '李良玉', '李良玉', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '麦盖提', '18199515515', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('94', '吴新月', '吴新月', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '芳草湖', '14799315980', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('95', '明星宣纸', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('96', '马利画板', '张小琴', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '15106674340', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('97', '郭小康', '郭小康', '', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '0.000000', null, '吐鲁番', '13565595558', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('98', '郭小康', '郭小康', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '13565595558', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('99', '塞外风', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('100', '印床', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('101', '张云振', '张云振', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('102', '华泰', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('103', '凤凰画材', '苏鹏飞', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('104', '邹鹏', '18609081792', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '阿图什', '', '', '', '', '', null, '63', '1');
INSERT INTO `jsh_supplier` VALUES ('105', '邹鹏', '邹鹏', '', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '0.000000', null, '阿图什', '18609081792', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('106', '韩卫刚', '韩卫刚', '', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '0.000000', null, '和静', '15899011226', '和静', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('107', '天祥毛边纸', '张', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '18383377899', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('108', '徐锐', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('109', '文港的货', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('110', '罗宝18099534279', '罗宝', '', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '0.000000', null, '', '18099534279', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('111', '胡志寿', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('112', '阮凤梅18935850228奎屯', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('113', '唐影 昌吉', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('114', '郭立东 哈密18997684075', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('115', '文房四宝', '', '', '', '', null, '供应商', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('116', '张爱明 独山子13809924966', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('117', '小杨13899585316克市', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('118', '耿林8037305伊利', '', '', '', '', null, '客户', '', '0.000000', null, null, null, null, '', '', '', '', '', '', null, '63', '0');

-- ----------------------------
-- Table structure for jsh_systemconfig
-- ----------------------------
DROP TABLE IF EXISTS `jsh_systemconfig`;
CREATE TABLE `jsh_systemconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_contacts` varchar(20) DEFAULT NULL COMMENT '公司联系人',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_tel` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_fax` varchar(20) DEFAULT NULL COMMENT '公司传真',
  `company_post_code` varchar(20) DEFAULT NULL COMMENT '公司邮编',
  `depot_flag` varchar(1) DEFAULT '0' COMMENT '仓库启用标记，0未启用，1启用',
  `customer_flag` varchar(1) DEFAULT '0' COMMENT '客户启用标记，0未启用，1启用',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统参数';

-- ----------------------------
-- Records of jsh_systemconfig
-- ----------------------------
INSERT INTO `jsh_systemconfig` VALUES ('7', '南通jshERP公司', '张三', '南通市通州区某某路', '0513-10101010', '0513-18181818', '226300', '0', '0', null, '0');
INSERT INTO `jsh_systemconfig` VALUES ('8', '公司123', '', '', '', '', '', '0', '0', '117', '0');

-- ----------------------------
-- Table structure for jsh_tenant
-- ----------------------------
DROP TABLE IF EXISTS `jsh_tenant`;
CREATE TABLE `jsh_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登录名',
  `user_num_limit` int(11) DEFAULT NULL COMMENT '用户数量限制',
  `bills_num_limit` int(11) DEFAULT NULL COMMENT '单据数量限制',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='租户';

-- ----------------------------
-- Records of jsh_tenant
-- ----------------------------
INSERT INTO `jsh_tenant` VALUES ('13', '63', 'jsh', '20', '2000', null);
INSERT INTO `jsh_tenant` VALUES ('14', '113', 'abc123', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('15', '115', 'jzh', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('16', '123', 'caoyuli', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('17', '124', 'jchb', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('18', '126', '123123', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('19', '127', '2345123', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('20', '128', 'q12341243', '2', '200', null);
INSERT INTO `jsh_tenant` VALUES ('21', '130', 'jsh666', '2', '200', null);

-- ----------------------------
-- Table structure for jsh_unit
-- ----------------------------
DROP TABLE IF EXISTS `jsh_unit`;
CREATE TABLE `jsh_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UName` varchar(50) DEFAULT NULL COMMENT '名称，支持多单位',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='多单位表';

-- ----------------------------
-- Records of jsh_unit
-- ----------------------------
INSERT INTO `jsh_unit` VALUES ('2', 'kg,包(1:25)', null, '0');
INSERT INTO `jsh_unit` VALUES ('8', '瓶,箱(1:12)', null, '0');
INSERT INTO `jsh_unit` VALUES ('11', 'qwe,sed(1:33)', null, '0');
INSERT INTO `jsh_unit` VALUES ('12', '1,2(1:33)', null, '0');
INSERT INTO `jsh_unit` VALUES ('13', 'aa,vv(1:22)', '1', '0');
INSERT INTO `jsh_unit` VALUES ('14', '个,箱(1:12)', '117', '0');
INSERT INTO `jsh_unit` VALUES ('15', '个,箱(1:12)', '63', '0');
INSERT INTO `jsh_unit` VALUES ('16', '支,包(1:100)', null, '0');
INSERT INTO `jsh_unit` VALUES ('17', '支,包(1:100)', null, '0');
INSERT INTO `jsh_unit` VALUES ('18', '支,包(1:100)', '63', '0');

-- ----------------------------
-- Table structure for jsh_user
-- ----------------------------
DROP TABLE IF EXISTS `jsh_user`;
CREATE TABLE `jsh_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) NOT NULL COMMENT '用户姓名--例如张三',
  `loginame` varchar(255) DEFAULT NULL COMMENT '登录用户名--可能为空',
  `password` varchar(50) DEFAULT NULL COMMENT '登陆密码',
  `position` varchar(200) DEFAULT NULL COMMENT '职位',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `phonenum` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `ismanager` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为管理者 0==管理者 1==员工',
  `isystem` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否系统自带数据 ',
  `Status` tinyint(4) DEFAULT '0' COMMENT '状态，0：正常，1：删除，2封禁',
  `description` varchar(500) DEFAULT NULL COMMENT '用户描述信息',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jsh_user
-- ----------------------------
INSERT INTO `jsh_user` VALUES ('63', '邹良玉', 'jsh', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '1', '0', '', null, '63');
INSERT INTO `jsh_user` VALUES ('64', '张三', 'zs', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('65', '李四', 'ls', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('67', 'fas666', 'asd555', null, 'asdf333', null, '11111@qq.com', '222222', '1', '0', '0', 'sdf0000', null, null);
INSERT INTO `jsh_user` VALUES ('74', '21312sfdfsdf', '1231234', null, '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('84', '123123', 'jsh123', null, '3123', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('86', '2333', 'sdf111aaa', null, '3232', null, '', '32323', '1', '0', '0', '33232', null, null);
INSERT INTO `jsh_user` VALUES ('87', '122123132', 'sdfasd1', null, '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('90', '232343', '233', null, '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('91', 'jsh1231', 'jsh1231', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('92', '213123', 'aaaa', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, null);
INSERT INTO `jsh_user` VALUES ('93', '111', 'ffff', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, null);
INSERT INTO `jsh_user` VALUES ('94', 'sdfsdf', 'fsdfsdsd', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, null);
INSERT INTO `jsh_user` VALUES ('95', '4444444', '4444', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, null);
INSERT INTO `jsh_user` VALUES ('96', 'lili', 'lili', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, '1');
INSERT INTO `jsh_user` VALUES ('113', 'yuyu123', 'yuyu123', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '113');
INSERT INTO `jsh_user` VALUES ('115', 'laoba123', 'laoba123', 'e10adc3949ba59abbe56e057f20f883e', '33333', null, '', '', '1', '0', '0', '', null, '115');
INSERT INTO `jsh_user` VALUES ('116', 'gggg123', 'gggg123', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, '115');
INSERT INTO `jsh_user` VALUES ('120', '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, null);
INSERT INTO `jsh_user` VALUES ('121', 'hhhh', 'hhhh', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, '115');
INSERT INTO `jsh_user` VALUES ('122', 'admin1', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '1', '', null, '63');
INSERT INTO `jsh_user` VALUES ('123', 'caoyuli', 'caoyuli', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '123');
INSERT INTO `jsh_user` VALUES ('124', 'jchb', 'jchb', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '124');
INSERT INTO `jsh_user` VALUES ('126', '123123', '123123', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '126');
INSERT INTO `jsh_user` VALUES ('127', '2345123', '2345123', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '127');
INSERT INTO `jsh_user` VALUES ('128', 'q12341243', 'q12341243', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '128');
INSERT INTO `jsh_user` VALUES ('130', 'jsh666', 'jsh666', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, '130');

-- ----------------------------
-- Table structure for jsh_userbusiness
-- ----------------------------
DROP TABLE IF EXISTS `jsh_userbusiness`;
CREATE TABLE `jsh_userbusiness` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` varchar(50) DEFAULT NULL COMMENT '类别',
  `KeyId` varchar(50) DEFAULT NULL COMMENT '主ID',
  `Value` varchar(10000) DEFAULT NULL COMMENT '值',
  `BtnStr` varchar(2000) DEFAULT NULL COMMENT '按钮权限',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='用户/角色/模块关系表';

-- ----------------------------
-- Records of jsh_userbusiness
-- ----------------------------
INSERT INTO `jsh_userbusiness` VALUES ('5', 'RoleFunctions', '4', '[245][13][12][16][243][14][15][234][236][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
INSERT INTO `jsh_userbusiness` VALUES ('6', 'RoleFunctions', '5', '[22][23][25][26][194][195][31][33][200][201][41][199][202]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('7', 'RoleFunctions', '6', '[22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212]', '[{\"funId\":\"33\",\"btnStr\":\"4\"}]', '0');
INSERT INTO `jsh_userbusiness` VALUES ('9', 'RoleFunctions', '7', '[168][13][12][16][14][15][189][18][19][132]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('10', 'RoleFunctions', '8', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('11', 'RoleFunctions', '9', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187][188]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('12', 'UserRole', '1', '[5]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('13', 'UserRole', '2', '[6][7]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('14', 'UserDepot', '2', '[1][2][6][7]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('15', 'UserDepot', '1', '[1][2][5][6][7][10][12][14][15][17]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('16', 'UserRole', '63', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('18', 'UserDepot', '63', '[14][15]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('19', 'UserDepot', '5', '[6][45][46][50]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('20', 'UserRole', '5', '[5]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('21', 'UserRole', '64', '[13]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('22', 'UserDepot', '64', '[1]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('23', 'UserRole', '65', '[5]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('24', 'UserDepot', '65', '[1]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('25', 'UserCustomer', '64', '[5][2]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('26', 'UserCustomer', '65', '[6]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('27', 'UserCustomer', '63', '[58]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('28', 'UserDepot', '96', '[7]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('29', 'UserRole', '96', '[6]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('30', 'UserRole', '113', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('32', 'RoleFunctions', '10', '[245][13][243][14][15][234][22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][244][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][246]', '[{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"3\"},{\"funId\":\"242\",\"btnStr\":\"3\"}]', '0');
INSERT INTO `jsh_userbusiness` VALUES ('34', 'UserRole', '115', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('35', 'UserRole', '117', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('36', 'UserDepot', '117', '[8][9]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('37', 'UserCustomer', '117', '[52]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('38', 'UserRole', '120', '[4]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('39', 'UserDepot', '120', '[7][8][9][10][11][12][2][1][3]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('40', 'UserCustomer', '120', '[52][48][6][5][2]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('41', 'RoleFunctions', '12', '', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('48', 'RoleFunctions', '13', '[59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('51', 'UserRole', '74', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('52', 'UserDepot', '121', '[13]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('54', 'UserDepot', '115', '[13]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('56', 'UserCustomer', '115', '[56]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('57', 'UserCustomer', '121', '[56]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('58', 'UserRole', '121', '[15]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('59', 'UserRole', '123', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('60', 'UserRole', '124', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('61', 'UserRole', '125', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('62', 'UserRole', '126', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('63', 'UserRole', '127', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('64', 'UserRole', '128', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('65', 'UserRole', '129', '[10]', null, '0');
INSERT INTO `jsh_userbusiness` VALUES ('66', 'UserRole', '130', '[10]', null, '0');

-- ----------------------------
-- Table structure for tbl_sequence
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sequence`;
CREATE TABLE `tbl_sequence` (
  `seq_name` varchar(50) NOT NULL COMMENT '序列名称',
  `min_value` bigint(20) NOT NULL COMMENT '最小值',
  `max_value` bigint(20) NOT NULL COMMENT '最大值',
  `current_val` bigint(20) NOT NULL COMMENT '当前值',
  `increment_val` int(11) NOT NULL DEFAULT '1' COMMENT '增长步数',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sequence表';

-- ----------------------------
-- Records of tbl_sequence
-- ----------------------------
INSERT INTO `tbl_sequence` VALUES ('depot_number_seq', '1', '999999999999999999', '474', '1', '单据编号sequence');
