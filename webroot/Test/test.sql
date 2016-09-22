/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-06-30 18:31:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sr_action_log
-- ----------------------------
DROP TABLE IF EXISTS `sr_action_log`;
CREATE TABLE `sr_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '存储当前操作的moudle/controller/function,配置文件中通过此项定义显示的title，如：\r\n''backend/news/add''=>''添加新闻''\r\n''backend/news/edit''=>''修改新闻''',
  `table_name` varchar(20) NOT NULL DEFAULT '' COMMENT '操作表名',
  `table_ids` text COMMENT '操作记录的id,批量操作可能会有多个ID',
  `description` text COMMENT '备注',
  `ip` varchar(15) NOT NULL DEFAULT '0.0.0.0' COMMENT '操作者的IP',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `table_name` (`table_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1493 DEFAULT CHARSET=utf8 COMMENT='后台操作日志表';

-- ----------------------------
-- Records of sr_action_log
-- ----------------------------
INSERT INTO `sr_action_log` VALUES ('1', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('2', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('3', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('4', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('5', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('6', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('7', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('8', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('9', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('10', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('11', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\"},{\"id\":\"13\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\"},{\"id\":\"74\",\"title\":\"\\u5e7f\\u544a\\u7ba1\\u7406\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('12', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('13', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('14', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('15', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('16', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('17', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('18', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"1\",\"username\":\"sr_admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('19', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"1\",\"username\":\"sr_admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('20', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"2\",\"username\":\"list_tile\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('21', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"3\",\"username\":\"list_ti\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('22', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('23', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"5\",\"username\":\"liwes\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('24', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"4\",\"username\":\"liwe\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('25', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"8\",\"username\":\"1998\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('26', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"7\",\"username\":\"listy\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('27', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"10\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('28', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"10\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('29', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u624b\\u6307\\u5bfc\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('30', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"4\",\"title\":\"\\u7591\\u95ee\\u4e2d\\u5fc3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('31', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"5\",\"title\":\"\\u65b0\\u4eba\\u5fc5\\u770b\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('32', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('33', '1', 'admin', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"4\",\"title\":\"\\u624b\\u673a\\u6570\\u7801\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('34', '1', 'admin', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"4\",\"title\":\"\\u624b\\u673a\\u6570\\u7801\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('35', '1', 'admin', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"4\",\"title\":\"\\u624b\\u673a\\u6570\\u7801\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('36', '1', 'admin', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"4\",\"title\":\"\\u624b\\u673a\\u6570\\u7801\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('37', '1', 'admin', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"14\",\"title\":\"\\u624b\\u673a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('38', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"10\",\"username\":\"lityo\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('39', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"14\",\"title\":\"\\u624b\\u673a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('40', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('41', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\"},{\"id\":\"8\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\"},{\"id\":\"9\",\"title\":\"\\u5e73\\u53f0\\u7ba1\\u7406\"},{\"id\":\"29\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('42', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\"},{\"id\":\"8\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\"},{\"id\":\"9\",\"title\":\"\\u5e73\\u53f0\\u7ba1\\u7406\"},{\"id\":\"29\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('43', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"12\",\"username\":\"liwy\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('44', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"11\",\"username\":\"lsyt\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('45', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"14\",\"username\":\"1112589\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('46', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"1\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('47', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"1\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('48', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"1\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('49', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('50', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"18\",\"username\":\"aaalsr\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('51', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"18\",\"username\":\"aaalsr\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('52', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"18\",\"username\":\"aaalsr\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('53', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"17\",\"username\":\"5778\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('54', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"51\",\"title\":\"\\u5e95\\u90e8\\u5bfc\\u822a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('55', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"51\",\"title\":\"\\u5e95\\u90e8\\u5bfc\\u822a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('56', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('57', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"18\",\"username\":\"aaalsr\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('58', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"18\",\"username\":\"aaalsr\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('59', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('60', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('61', '1', 'admin', 'backend/product/attribute/disable', 'attribute', null, '[{\"id\":\"5\",\"title\":\"\\u767d\\u8272\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('62', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"5\",\"title\":\"\\u767d\\u8272\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('63', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('64', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"75\",\"title\":\"\\u53cb\\u60c5\\u94fe\\u63a5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('65', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"75\",\"title\":\"\\u53cb\\u60c5\\u94fe\\u63a5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('66', '1', 'admin', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"1\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('67', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('68', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"3\",\"title\":\"\\u7528\\u6237\\u4e8c\\u7ec4\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('69', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"3\",\"title\":\"\\u7528\\u6237\\u4e8c\\u7ec4\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('70', '1', 'admin', 'backend/member/group/del', 'role', null, '[{\"id\":\"3\",\"title\":\"\\u7528\\u6237\\u4e00\\u7ec4\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('71', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"2\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('72', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('73', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"2\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('74', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"1\",\"username\":\"sr_admin\"},{\"id\":\"6\",\"username\":\"liwe6\"},{\"id\":\"9\",\"username\":\"listyl\"},{\"id\":\"13\",\"username\":\"listu\"},{\"id\":\"17\",\"username\":\"5778\"},{\"id\":\"18\",\"username\":\"aaalsr\"},{\"id\":\"20\",\"username\":\"219889\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('75', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('76', '1', 'admin', 'backend/product/attribute/disable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u9ed1\\u8272\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('77', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u9ed1\\u8272\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('78', '1', 'admin', 'backend/product/attribute/disable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u9ed1\\u8272\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('79', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u9ed1\\u8272\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('80', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('81', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('82', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('83', '1', 'admin', 'backend/product/attribute/disable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u9ed1\\u8272\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('84', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u9ed1\\u8272\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('85', '1', 'admin', 'backend/product/custom/enable', 'custom_preset', null, '[{\"id\":\"1\",\"title\":\"Logo\"},{\"id\":\"2\",\"title\":\"\\u5f00\\u673a\\u753b\\u9762\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('86', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('87', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"10\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('88', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"10\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('89', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('90', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('91', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('92', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('93', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('94', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('95', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('96', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('97', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('98', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"115\",\"title\":\"\\u4e0d\\u901a\\u8fc7\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('99', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('100', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('101', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\"},{\"id\":\"8\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\"},{\"id\":\"9\",\"title\":\"\\u5e73\\u53f0\\u7ba1\\u7406\"},{\"id\":\"29\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('102', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('103', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('104', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('105', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('106', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('107', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('108', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"1\",\"title\":\"\\u9996\\u9875\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('109', '1', 'admin', 'backend/navigation/friendlink/enable', 'friend_link', null, '[{\"id\":\"1\",\"title\":\"\\u9996\\u9875\"},{\"id\":\"2\",\"title\":\"\\u767e\\u5ea6\"},{\"id\":\"3\",\"title\":\"\\u65b0\\u6d6a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('110', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('111', '1', 'admin', 'backend/article/news/enable', 'article', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u65b0\\u95fb\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('112', '1', 'admin', 'backend/navigation/friendlink/del', 'friend_link', null, '[{\"id\":\"1\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('113', '1', 'admin', 'backend/navigation/index/del', 'navigation', null, '[{\"id\":\"1\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('114', '1', 'admin', 'backend/navigation/friendlink/del', 'friend_link', null, '[{\"id\":\"2\",\"title\":\"\\u767e\\u5ea6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('115', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('116', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('117', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('118', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('119', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('120', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('121', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"22\",\"username\":\"\\u96f7\\u8fbe\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('122', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('123', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"23\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62371\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('124', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"24\",\"username\":\"15516822456\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('125', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"23\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62371\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('126', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('127', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"24\",\"username\":\"15516822456\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('128', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"23\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62371\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('129', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"24\",\"username\":\"15516822456\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('130', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"23\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62371\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('131', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"23\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62371\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('132', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"23\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62371\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('133', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"23\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62371\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('134', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"23\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62371\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('135', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"21\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('136', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"21\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('137', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"22\",\"username\":\"\\u96f7\\u8fbe\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('138', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"22\",\"username\":\"\\u96f7\\u8fbe\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('139', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"22\",\"username\":\"\\u96f7\\u8fbe\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('140', '1', 'admin', 'backend/member/business/del', 'member', null, '[{\"id\":\"24\",\"username\":\"15516822456\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('141', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('142', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"2\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('143', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('144', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('145', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"2\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('146', '1', 'admin', 'backend/member/group/del', 'role', null, '[{\"id\":\"2\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('147', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"4\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('148', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"26\",\"username\":\"\\u96f7\\u8fbe1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('149', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"21\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('150', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"20\",\"username\":\"219889\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('151', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"18\",\"username\":\"aaalsr\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('152', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"25\",\"username\":\"\\u5434\\u6960\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('153', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"25\",\"username\":\"\\u5434\\u6960\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('154', '1', 'admin', 'backend/member/business/del', 'member', null, '[{\"id\":\"25\",\"username\":\"\\u5434\\u6960\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('155', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"18\",\"username\":\"aaalsr\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('156', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"20\",\"username\":\"219889\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('157', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"21\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('158', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"26\",\"username\":\"\\u96f7\\u8fbe1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('159', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"26\",\"username\":\"\\u96f7\\u8fbe1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('160', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"26\",\"username\":\"\\u96f7\\u8fbe1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('161', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"26\",\"username\":\"\\u96f7\\u8fbe1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('162', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"21\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('163', '1', 'admin', 'backend/member/business/del', 'member', null, '[{\"id\":\"28\",\"username\":\"\\u5434\\u69602\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('164', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"4\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('165', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"26\",\"username\":\"\\u96f7\\u8fbe1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('166', '1', 'admin', 'backend/member/business/del', 'member', null, '[{\"id\":\"29\",\"username\":\"\\u5434\\u69603\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('167', '1', 'admin', 'backend/member/business/del', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('168', '1', 'admin', 'backend/member/business/del', 'member', null, '[{\"id\":\"23\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62371\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('169', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"26\",\"username\":\"\\u96f7\\u8fbe1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('170', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"20\",\"username\":\"\\u96f7\\u8fbe111\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('171', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"1\",\"username\":\"sr_admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('172', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"35\",\"username\":\"\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('173', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('174', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('175', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('176', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('177', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('178', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('179', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('180', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('181', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('182', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('183', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('184', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('185', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('186', '1', 'admin', 'backend/product/custom/disable', 'custom_preset', null, '[{\"id\":\"3\",\"title\":\"\\u624b\\u673a\\u5145\\u503c\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('187', '1', 'admin', 'backend/product/custom/enable', 'custom_preset', null, '[{\"id\":\"3\",\"title\":\"\\u624b\\u673a\\u5145\\u503c\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('188', '1', 'admin', 'backend/product/custom/del', 'custom_preset', null, '[{\"id\":\"4\",\"title\":\"123\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('189', '1', 'admin', 'backend/product/custom/del', 'custom_preset', null, '[{\"id\":\"1\",\"title\":\"Logo\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('190', '1', 'admin', 'backend/product/custom/del', 'custom_preset', null, '[{\"id\":\"2\",\"title\":\"\\u5f00\\u673a\\u753b\\u9762\"},{\"id\":\"3\",\"title\":\"\\u624b\\u673a\\u5145\\u503c\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('191', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('192', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('193', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('194', '1', 'admin', 'backend/product/attribute/disable', 'attribute', null, '[{\"id\":\"7\",\"title\":\"\\u96f7\\u8fbe-\\u8868\\u5355\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('195', '1', 'admin', 'backend/product/attribute/disable', 'attribute', null, '[{\"id\":\"6\",\"title\":\"\\u96f7\\u8fbe-\\u540d\\u79f0\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('196', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"6\",\"title\":\"\\u96f7\\u8fbe-\\u540d\\u79f0\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('197', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"7\",\"title\":\"\\u96f7\\u8fbe-\\u8868\\u5355\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('198', '1', 'admin', 'backend/product/attributevalue/del', 'attribute_value', null, '[{\"id\":\"31\",\"title\":\"\\u5973\\u795e\\u7c89\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('199', '1', 'admin', 'backend/product/attributevalue/del', 'attribute_value', null, '[{\"id\":\"30\",\"title\":\"\\u571f\\u8c6a\\u91d1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('200', '1', 'admin', 'backend/product/attribute/del', 'attribute', null, '[{\"id\":\"6\",\"title\":\"\\u96f7\\u8fbe-\\u540d\\u79f0\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('201', '1', 'admin', 'backend/product/attribute/del', 'attribute', null, '[{\"id\":\"7\",\"title\":\"\\u96f7\\u8fbe-\\u8868\\u5355\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('202', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('203', '1', 'admin', 'backend/product/attributevalue/disable', 'attribute_value', null, '[{\"id\":\"35\",\"title\":\"1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('204', '1', 'admin', 'backend/product/attributevalue/enable', 'attribute_value', null, '[{\"id\":\"35\",\"title\":\"1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('205', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('206', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('207', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('208', '1', 'admin', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u5434\\u6960\\u2014\\u2014\\u6570\\u7801\\u4ea7\\u54c1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('209', '1', 'admin', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u5434\\u6960\\u2014\\u6570\\u7801\\u4ea7\\u54c1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('210', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"6\",\"title\":\"\\u5434\\u6960\\u2014\\u6570\\u7801\\u4ea7\\u54c1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('211', '1', 'admin', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u5434\\u6960\\u2014\\u6570\\u7801\\u4ea7\\u54c1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('212', '1', 'admin', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u5434\\u6960\\u2014\\u6570\\u7801\\u4ea7\\u54c1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('213', '1', 'admin', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u5434\\u6960\\u2014\\u6570\\u7801\\u4ea7\\u54c1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('214', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('215', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('216', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('217', '1', 'admin', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"7\",\"title\":\"qw\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('218', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('219', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('220', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('221', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"13\",\"title\":\"asdf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('222', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"8\",\"title\":\"1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('223', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"9\",\"title\":\"asdf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('224', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"7\",\"title\":\"qw\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('225', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"14\",\"title\":\"\\u6d4b\\u8bd5\\u4e2d\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('226', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"12\",\"title\":\"11\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('227', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"11\",\"title\":\"as23\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('228', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"10\",\"title\":\"1\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('229', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('230', '1', 'admin', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"20\",\"title\":\"\\u5434\\u6960\\u2014MX\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('231', '1', 'admin', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"20\",\"title\":\"\\u5434\\u6960\\u2014MX\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('232', '1', 'admin', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"20\",\"title\":\"\\u5434\\u6960\\u2014MX\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('233', '1', 'admin', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"20\",\"title\":\"\\u5434\\u6960\\u2014MX\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('234', '1', 'admin', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"20\",\"title\":\"\\u5434\\u6960\\u2014MX\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('235', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"20\",\"title\":\"\\u5434\\u6960\\u2014MX\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('236', '1', 'admin', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"20\",\"title\":\"\\u5434\\u6960\\u2014MX\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('237', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"20\",\"title\":\"\\u5434\\u6960\\u2014MX\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('238', '1', 'admin', 'backend/product/category/del', 'product_category', null, '[{\"id\":\"20\",\"title\":\"\\u5434\\u6960\\u2014MX\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('239', '1', 'admin', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"14\",\"title\":\"\\u624b\\u673a\"},{\"id\":\"21\",\"title\":\"\\u5434\\u6960\\u2014MX\"},{\"id\":\"22\",\"title\":\"\\u5434\\u6960\\u2014Lenovo\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('240', '1', 'admin', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"14\",\"title\":\"\\u624b\\u673a\"},{\"id\":\"21\",\"title\":\"\\u5434\\u6960\\u2014MX\"},{\"id\":\"22\",\"title\":\"\\u5434\\u6960\\u2014Lenovo\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('241', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"14\",\"title\":\"\\u624b\\u673a\"},{\"id\":\"21\",\"title\":\"\\u5434\\u6960\\u2014MX\"},{\"id\":\"22\",\"title\":\"\\u5434\\u6960\\u2014Lenovo\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('242', '1', 'admin', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"14\",\"title\":\"\\u624b\\u673a\"},{\"id\":\"21\",\"title\":\"\\u5434\\u6960\\u2014MX\"},{\"id\":\"22\",\"title\":\"\\u5434\\u6960\\u2014Lenovo\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('243', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"134\",\"title\":\"\\u5e97\\u94fa\\u5217\\u8868\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('244', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"134\",\"title\":\"\\u5e97\\u94fa\\u5217\\u8868\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('245', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('246', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('247', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('248', '1', 'admin', 'backend/product/custom/del', 'custom_preset', null, '[{\"id\":\"7\",\"title\":\"MX5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('249', '1', 'admin', 'backend/product/custom/del', 'custom_preset', null, '[{\"id\":\"5\",\"title\":\"Y470\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('250', '1', 'admin', 'backend/product/custom/del', 'custom_preset', null, '[{\"id\":\"9\",\"title\":\"Y470\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('251', '1', 'admin', 'backend/product/brand/del', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u82f9\\u679c\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('252', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('253', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('254', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('255', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('256', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('257', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"10\",\"title\":\"\\u6d4b\\u8bd5\\u95ee\\u9898\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('258', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('259', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"12\",\"title\":\"\\u6d4b\\u8bd5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('260', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('261', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\"},{\"id\":\"8\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\"},{\"id\":\"9\",\"title\":\"\\u5e73\\u53f0\\u7ba1\\u7406\"},{\"id\":\"29\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('262', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('263', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('264', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('265', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('266', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"14\",\"title\":\"\\u6d4b\\u8bd5\\u5bfc\\u822a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('267', '1', 'admin', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('268', '1', 'admin', 'backend/navigation/index/del', 'navigation', null, '[{\"id\":\"17\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e3\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('269', '1', 'admin', 'backend/navigation/index/del', 'navigation', null, '[{\"id\":\"16\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e2\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('270', '1', 'admin', 'backend/navigation/index/del', 'navigation', null, '[{\"id\":\"15\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('271', '1', 'admin', 'backend/navigation/index/del', 'navigation', null, '[{\"id\":\"13\",\"title\":\"\\u6d4b\\u8bd5\\u5bfc\\u822a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('272', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('273', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('274', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('275', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('276', '1', 'admin', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('277', '1', 'admin', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('278', '1', 'admin', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u6d6a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('279', '1', 'admin', 'backend/navigation/friendlink/enable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u6d6a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('280', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('281', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('282', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"143\",\"title\":\"\\u5220\\u9664\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('283', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"143\",\"title\":\"\\u5220\\u9664\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('284', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('285', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('286', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('287', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('288', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"7\",\"title\":\"\\u4ea7\\u54c1\\u7b80\\u4ecb\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('289', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"7\",\"title\":\"\\u4ea7\\u54c1\\u7b80\\u4ecb\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('290', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('291', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('292', '1', 'admin', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('293', '1', 'admin', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('294', '1', 'admin', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('295', '1', 'admin', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u6d6a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('296', '1', 'admin', 'backend/navigation/friendlink/enable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u6d6a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('297', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"37\",\"username\":\"15516855208\"},{\"id\":\"38\",\"username\":\"15677899981\"},{\"id\":\"39\",\"username\":\"15516777890\"},{\"id\":\"40\",\"username\":\"15623973028\"},{\"id\":\"41\",\"username\":\"15516855204\"},{\"id\":\"45\",\"username\":\"15623973029\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('298', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('299', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"36\",\"username\":\"\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('300', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"36\",\"username\":\"\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('301', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"1\",\"username\":\"4\"},{\"id\":\"6\",\"username\":\"liwe6\"},{\"id\":\"9\",\"username\":\"listyl\"},{\"id\":\"13\",\"username\":\"listu\"},{\"id\":\"15\",\"username\":\"890534\"},{\"id\":\"16\",\"username\":\"5656\"},{\"id\":\"17\",\"username\":\"5778\"},{\"id\":\"18\",\"username\":\"aaalsr\"},{\"id\":\"26\",\"username\":\"\\u96f7\\u8fbe1\"},{\"id\":\"27\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62372\"},{\"id\":\"30\",\"username\":\"qwe\"},{\"id\":\"32\",\"username\":\"\\u96f7\"},{\"id\":\"33\",\"username\":\"\\u96f7\\u8fbe\"},{\"id\":\"34\",\"username\":\"\\u96f7\\u8fbe\"},{\"id\":\"36\",\"username\":\"\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('302', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"1\",\"username\":\"4\"},{\"id\":\"6\",\"username\":\"liwe6\"},{\"id\":\"9\",\"username\":\"listyl\"},{\"id\":\"13\",\"username\":\"listu\"},{\"id\":\"15\",\"username\":\"890534\"},{\"id\":\"16\",\"username\":\"5656\"},{\"id\":\"17\",\"username\":\"5778\"},{\"id\":\"18\",\"username\":\"aaalsr\"},{\"id\":\"26\",\"username\":\"\\u96f7\\u8fbe1\"},{\"id\":\"27\",\"username\":\"\\u6d4b\\u8bd5\\u7528\\u62372\"},{\"id\":\"30\",\"username\":\"qwe\"},{\"id\":\"32\",\"username\":\"\\u96f7\"},{\"id\":\"33\",\"username\":\"\\u96f7\\u8fbe\"},{\"id\":\"34\",\"username\":\"\\u96f7\\u8fbe\"},{\"id\":\"36\",\"username\":\"\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('303', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('304', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('305', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('306', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('307', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"},{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"7\",\"title\":\"\\u4ea7\\u54c1\\u7b80\\u4ecb\"},{\"id\":\"8\",\"title\":\"\\u65b0\\u54c1\\u9884\\u5b9a\"},{\"id\":\"9\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"18\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"19\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('308', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"},{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"7\",\"title\":\"\\u4ea7\\u54c1\\u7b80\\u4ecb\"},{\"id\":\"8\",\"title\":\"\\u65b0\\u54c1\\u9884\\u5b9a\"},{\"id\":\"9\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"18\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"19\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('309', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"19\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('310', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"19\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('311', '1', 'admin', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u624b\\u6307\\u5bfc\"},{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"14\",\"title\":\"\\u6d4b\\u8bd5\\u5bfc\\u822a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('312', '1', 'admin', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u624b\\u6307\\u5bfc\"},{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"14\",\"title\":\"\\u6d4b\\u8bd5\\u5bfc\\u822a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('313', '1', 'admin', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('314', '1', 'admin', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('315', '1', 'admin', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('316', '1', 'admin', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u6d6a\"},{\"id\":\"4\",\"title\":\"\\u767e\\u5ea6\"},{\"id\":\"5\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e9\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('317', '1', 'admin', 'backend/navigation/friendlink/enable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u6d6a\"},{\"id\":\"4\",\"title\":\"\\u767e\\u5ea6\"},{\"id\":\"5\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e9\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('318', '1', 'admin', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e9\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('319', '1', 'admin', 'backend/navigation/friendlink/enable', 'friend_link', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e9\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('320', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('321', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('322', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('323', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"144\",\"title\":\"\\u8d44\\u91d1\\u7ba1\\u7406\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('324', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('325', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"48\",\"username\":\"18888888888\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('326', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"48\",\"username\":\"18888888888\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('327', '1', 'admin', 'backend/member/business/disable', 'member', null, '[{\"id\":\"48\",\"username\":\"18888888888\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('328', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"48\",\"username\":\"18888888888\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('329', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('330', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('331', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"7\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('332', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"7\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('333', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"},{\"id\":\"4\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"},{\"id\":\"6\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"},{\"id\":\"7\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('334', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"},{\"id\":\"4\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"},{\"id\":\"6\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"},{\"id\":\"7\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('335', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"},{\"id\":\"4\",\"title\":\"\\u5546\\u5bb6\\u7528\\u6237\"},{\"id\":\"6\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"},{\"id\":\"7\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('336', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"54\",\"username\":\"18888888887\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('337', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"54\",\"username\":\"18888888887\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('338', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"54\",\"username\":\"18888888887\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('339', '1', 'admin', 'backend/article/group/disable', 'article_category', null, '[{\"id\":\"2\",\"title\":\"\\u6295\\u8d44\\u7406\\u8d22\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('340', '1', 'admin', 'backend/article/group/enable', 'article_category', null, '[{\"id\":\"2\",\"title\":\"\\u6295\\u8d44\\u7406\\u8d22\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('341', '1', 'admin', 'backend/article/group/disable', 'article_category', null, '[{\"id\":\"2\",\"title\":\"\\u6295\\u8d44\\u7406\\u8d22\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('342', '1', 'admin', 'backend/article/group/enable', 'article_category', null, '[{\"id\":\"2\",\"title\":\"\\u6295\\u8d44\\u7406\\u8d22\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('343', '1', 'admin', 'backend/article/group/disable', 'article_category', null, '[{\"id\":\"2\",\"title\":\"\\u6295\\u8d44\\u7406\\u8d22\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('344', '1', 'admin', 'backend/article/group/enable', 'article_category', null, '[{\"id\":\"2\",\"title\":\"\\u6295\\u8d44\\u7406\\u8d22\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('345', '1', 'admin', 'backend/article/group/disable', 'article_category', null, '[{\"id\":\"2\",\"title\":\"\\u6295\\u8d44\\u7406\\u8d22\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('346', '1', 'admin', 'backend/article/group/enable', 'article_category', null, '[{\"id\":\"2\",\"title\":\"\\u6295\\u8d44\\u7406\\u8d22\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('347', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('348', '1', 'admin', 'backend/article/group/dele', 'article_category', null, '[{\"id\":\"6\",\"title\":\"13\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('349', '1', 'admin', 'backend/article/group/dele', 'article_category', null, '[{\"id\":\"7\",\"title\":\"13\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('350', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('351', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('352', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"161\",\"title\":\"\\u901a\\u8fc7\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('353', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"162\",\"title\":\"\\u4e0d\\u901a\\u8fc7\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('354', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"2\",\"title\":\"\\u83dc\\u5355\\u7ba1\\u7406\"},{\"id\":\"29\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\"},{\"id\":\"38\",\"title\":\"\\u5934\\u90e8\\u5bfc\\u822a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('355', '1', 'admin', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\\u6570\\u7801\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('356', '1', 'admin', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\\u6570\\u7801\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('357', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('358', '1', 'admin', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"3\",\"title\":\"\\u624b\\u673a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('359', '1', 'admin', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"3\",\"title\":\"\\u624b\\u673a\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('360', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('361', '1', 'admin', 'backend/product/priattr/disable', 'priattr', null, '[{\"id\":\"3\",\"title\":\"\\u5c5e\\u6027\\u4e09\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('362', '1', 'admin', 'backend/product/priattr/enable', 'priattr', null, '[{\"id\":\"3\",\"title\":\"\\u5c5e\\u6027\\u4e09\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('363', '1', 'admin', 'backend/product/custom/enable', 'custom_preset', null, '[{\"id\":\"1\",\"title\":\"Logo\"},{\"id\":\"2\",\"title\":\"\\u5f00\\u673a\\u52a8\\u753b\"},{\"id\":\"4\",\"title\":\"\\u5b9a\\u5236 2\"},{\"id\":\"5\",\"title\":\"\\u5b9a\\u5236 3\"},{\"id\":\"6\",\"title\":\"\\u5b9a\\u5236 4\"},{\"id\":\"7\",\"title\":\"\\u5b9a\\u5236 5\"},{\"id\":\"8\",\"title\":\"\\u5b9a\\u5236 6\"},{\"id\":\"9\",\"title\":\"\\u5b9a\\u5236 7\"},{\"id\":\"10\",\"title\":\"\\u5b9a\\u5236 8\"},{\"id\":\"11\",\"title\":\"\\u5b9a\\u5236 9\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('364', '1', 'admin', 'backend/product/custom/disable', 'custom_preset', null, '[{\"id\":\"1\",\"title\":\"Logo\"},{\"id\":\"2\",\"title\":\"\\u5f00\\u673a\\u52a8\\u753b\"},{\"id\":\"4\",\"title\":\"\\u5b9a\\u5236 2\"},{\"id\":\"5\",\"title\":\"\\u5b9a\\u5236 3\"},{\"id\":\"6\",\"title\":\"\\u5b9a\\u5236 4\"},{\"id\":\"7\",\"title\":\"\\u5b9a\\u5236 5\"},{\"id\":\"8\",\"title\":\"\\u5b9a\\u5236 6\"},{\"id\":\"9\",\"title\":\"\\u5b9a\\u5236 7\"},{\"id\":\"10\",\"title\":\"\\u5b9a\\u5236 8\"},{\"id\":\"11\",\"title\":\"\\u5b9a\\u5236 9\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('365', '1', 'admin', 'backend/product/custom/enable', 'custom_preset', null, '[{\"id\":\"1\",\"title\":\"Logo\"},{\"id\":\"2\",\"title\":\"\\u5f00\\u673a\\u52a8\\u753b\"},{\"id\":\"4\",\"title\":\"\\u5b9a\\u5236 2\"},{\"id\":\"5\",\"title\":\"\\u5b9a\\u5236 3\"},{\"id\":\"6\",\"title\":\"\\u5b9a\\u5236 4\"},{\"id\":\"7\",\"title\":\"\\u5b9a\\u5236 5\"},{\"id\":\"8\",\"title\":\"\\u5b9a\\u5236 6\"},{\"id\":\"9\",\"title\":\"\\u5b9a\\u5236 7\"},{\"id\":\"10\",\"title\":\"\\u5b9a\\u5236 8\"},{\"id\":\"11\",\"title\":\"\\u5b9a\\u5236 9\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('366', '1', 'admin', 'backend/product/custom/del', 'custom_preset', null, '[{\"id\":\"3\",\"title\":\"\\u5b9a\\u5236 1\"},{\"id\":\"4\",\"title\":\"\\u5b9a\\u5236 2\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('367', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('368', '1', 'admin', 'backend/product/attribute/disable', 'attribute', null, '[{\"id\":\"2\",\"title\":\"\\u5c5e\\u60271\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('369', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"2\",\"title\":\"\\u5c5e\\u60271\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('370', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('371', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('372', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('373', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('374', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('375', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('376', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('377', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('378', '2', '雷达', 'backend/base/public/login', 'admin', null, '[{\"id\":\"2\",\"title\":\"\\u96f7\\u8fbe\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('379', '2', '雷达', 'backend/base/public/login', 'admin', null, '[{\"id\":\"2\",\"title\":\"\\u96f7\\u8fbe\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('380', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('381', '2', '雷达', 'backend/base/public/login', 'admin', null, '[{\"id\":\"2\",\"title\":\"\\u96f7\\u8fbe\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('382', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('383', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('384', '2', '雷达', 'backend/base/public/login', 'admin', null, '[{\"id\":\"2\",\"title\":\"\\u96f7\\u8fbe\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('385', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('386', '2', '雷达', 'backend/base/public/login', 'admin', null, '[{\"id\":\"2\",\"title\":\"\\u96f7\\u8fbe\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('387', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('388', '2', '雷达', 'backend/base/public/login', 'admin', null, '[{\"id\":\"2\",\"title\":\"\\u96f7\\u8fbe\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('389', '2', '雷达', 'backend/base/public/login', 'admin', null, '[{\"id\":\"2\",\"title\":\"\\u96f7\\u8fbe\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('390', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('391', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('392', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('393', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('394', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('395', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('396', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('397', '1', 'admin', 'backend/article/news/dele', 'article', null, '[{\"id\":\"27\",\"title\":\"\\u6d4b\\u8bd5\\u52a8\\u7269\\u57ce\\u6570\\u636e\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('398', '1', 'admin', 'backend/article/news/dele', 'article', null, '[{\"id\":\"5\",\"title\":\"\\u6d4b\\u8bd5\\u65b0\\u95fb\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('399', '1', 'admin', 'backend/article/news/dele', 'article', null, '[{\"id\":\"24\",\"title\":\"test 19\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('400', '1', 'admin', 'backend/article/news/dele', 'article', null, '[{\"id\":\"23\",\"title\":\"test 18\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('401', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"19\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('402', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"23\",\"title\":\"123\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('403', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"7\",\"title\":\"\\u4ea7\\u54c1\\u7b80\\u4ecb\"},{\"id\":\"8\",\"title\":\"\\u65b0\\u54c1\\u9884\\u5b9a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('404', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"8\",\"title\":\"\\u65b0\\u54c1\\u9884\\u5b9a\"},{\"id\":\"9\",\"title\":\"\\u6d4b\\u8bd5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('405', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"18\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"20\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('406', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"7\",\"title\":\"\\u4ea7\\u54c1\\u7b80\\u4ecb\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('407', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"23\",\"title\":\"123\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('408', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"21\",\"title\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('409', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"22\",\"title\":\"12\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('410', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"27\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('411', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"24\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('412', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"24\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('413', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"28\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('414', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"28\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('415', '1', 'admin', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u624b\\u6307\\u5bfc\"},{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('416', '1', 'admin', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"14\",\"title\":\"\\u6d4b\\u8bd5\\u5bfc\\u822a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('417', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('418', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"30\",\"title\":\"\\u7279\\u8272\\u670d\\u52a1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('419', '1', 'admin', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"30\",\"title\":\"\\u7279\\u8272\\u670d\\u52a1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('420', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"31\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('421', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"32\",\"title\":\"\\u652f\\u4ed8\\u65b9\\u5f0f\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('422', '1', 'admin', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"31\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('423', '1', 'admin', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"32\",\"title\":\"\\u652f\\u4ed8\\u65b9\\u5f0f\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('424', '1', 'admin', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"31\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('425', '1', 'admin', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e9\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('426', '1', 'admin', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"5\",\"title\":\"\\u6d4b\\u8bd5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('427', '1', 'admin', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"8\",\"title\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('428', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('429', '1', 'admin', 'backend/member/group/del', 'role', null, '[{\"id\":\"6\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"},{\"id\":\"7\",\"title\":\"\\u7528\\u6237\\u7ec4\\u4e00\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('430', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('431', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('432', '1', 'admin', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"31\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('433', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('434', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('435', '1', 'admin', 'backend/member/member/del', 'member', null, '[{\"id\":\"36\",\"username\":\"\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('436', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"6\",\"title\":\"test\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('437', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('438', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"29\",\"title\":\"\\u96f7\\u8fea\\u514b\\u538b\\u54e8\\u7edd\\u6740\\u6551\\u5feb\\u8239 \\u8d85\\u516d\\u53d1\\u98d925\\u5206\\u9000\\u5f00\\u62d3\\u8005\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('439', '1', 'admin', 'backend/article/news/dele', 'article', null, '[{\"id\":\"30\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('440', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('441', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"32\",\"title\":\"\\u5feb\\u8239\\u897f\\u51b3\\u6709\\u671b\\uff0c\\u4fdd\\u7f57+\\u7ed9\\u529b\\u82ac\\u8054\\u624b\\u664b\\u7ea7\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('442', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('443', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('444', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('445', '1', 'admin', 'backend/navigation/friendlink/enable', 'friend_link', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e9\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('446', '1', 'admin', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e9\"}]', '27.16.168.146', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('447', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"26\",\"title\":\"\\u52a8\\u7269\\u56ed\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('448', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('449', '1', 'admin', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"4\",\"title\":\"test 3\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('450', '1', 'admin', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u4e0a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('451', '1', 'admin', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u4e0a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('452', '1', 'admin', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u4e0a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('453', '1', 'admin', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u4e0a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('454', '1', 'admin', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u4e0a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('455', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"7\",\"title\":\"test 11\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('456', '1', 'admin', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"7\",\"title\":\"test 11\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('457', '1', 'admin', 'backend/product/category/del', 'product_category', null, '[{\"id\":\"8\",\"title\":\"test 21\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('458', '1', 'admin', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"2\",\"title\":\"\\u624b\\u673a\\u901a\\u8baf\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('459', '1', 'admin', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('460', '1', 'admin', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('461', '1', 'admin', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('462', '1', 'admin', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('463', '1', 'admin', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('464', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('465', '1', 'admin', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('466', '1', 'admin', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\"},{\"id\":\"7\",\"title\":\"test 11\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('467', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"1\",\"title\":\"\\u624b\\u673a\"},{\"id\":\"7\",\"title\":\"test 11\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('468', '1', 'admin', 'backend/product/category/del', 'product_category', null, '[{\"id\":\"10\",\"title\":\"test\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('469', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('470', '1', 'admin', 'backend/product/priattr/disable', 'priattr', null, '[{\"id\":\"13\",\"title\":\"\\u5bb9\\u91cf\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('471', '1', 'admin', 'backend/product/priattr/enable', 'priattr', null, '[{\"id\":\"13\",\"title\":\"\\u5bb9\\u91cf\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('472', '1', 'admin', 'backend/product/priattr/del', 'priattr', null, '[{\"id\":\"13\",\"title\":\"\\u5bb9\\u91cf\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('473', '1', 'admin', 'backend/product/attribute/del', 'attribute', null, '[{\"id\":\"3\",\"title\":\"\\u5b58\\u50a8\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('474', '1', 'admin', 'backend/product/attributevalue/del', 'attribute_value', null, '[{\"id\":\"5\",\"title\":\"\\u571f\\u8c6a\\u91d1\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('475', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u7406\\u8bba\\u5f85\\u673a\\u65f6\\u95f4\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('476', '1', 'admin', 'backend/product/attribute/disable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u7406\\u8bba\\u5f85\\u673a\\u65f6\\u95f4\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('477', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u7406\\u8bba\\u5f85\\u673a\\u65f6\\u95f4\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('478', '1', 'admin', 'backend/product/attribute/disable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u7406\\u8bba\\u5f85\\u673a\\u65f6\\u95f4\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('479', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u7406\\u8bba\\u5f85\\u673a\\u65f6\\u95f4\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('480', '1', 'admin', 'backend/product/attribute/enable', 'attribute', null, '[{\"id\":\"4\",\"title\":\"\\u7406\\u8bba\\u5f85\\u673a\\u65f6\\u95f4\"},{\"id\":\"5\",\"title\":\"\\u64cd\\u4f5c\\u7cfb\\u7edf\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('481', '1', 'admin', 'backend/navigation/index/del', 'navigation', null, '[{\"id\":\"7\",\"title\":\"\\u4ea7\\u54c1\\u7b80\\u4ecb\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('482', '1', 'admin', 'backend/navigation/index/del', 'navigation', null, '[{\"id\":\"22\",\"title\":\"12\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('483', '1', 'admin', 'backend/navigation/friendlink/del', 'friend_link', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e9\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('484', '1', 'admin', 'backend/product/custom/disable', 'custom_preset', null, '[{\"id\":\"2\",\"title\":\"\\u5f00\\u673a\\u52a8\\u753b\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('485', '1', 'admin', 'backend/product/custom/enable', 'custom_preset', null, '[{\"id\":\"2\",\"title\":\"\\u5f00\\u673a\\u52a8\\u753b\"}]', '27.19.154.176', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('486', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"62\",\"title\":\"\\u5c5e\\u6027\\u503c\\u5217\\u8868\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('487', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('488', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"62\",\"title\":\"\\u5c5e\\u6027\\u503c\\u5217\\u8868\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('489', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('490', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('491', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('492', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('493', '1', 'admin', 'backend/product/product/home_hide', 'product', null, '[{\"id\":\"1\",\"title\":\"MX Pro 5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('494', '1', 'admin', 'backend/product/product/home_show', 'product', null, '[{\"id\":\"1\",\"title\":\"MX Pro 5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('495', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('496', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('497', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '61.183.82.193', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('498', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('499', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('500', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '61.183.82.193', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('501', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('502', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"24\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('503', '1', 'admin', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"24\",\"title\":\"\\u9996\\u9875\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('504', '1', 'admin', 'backend/product/priattrvalue/disable', 'priattr_value', null, '[{\"id\":\"12\",\"title\":\"\\u9ed1\\u8272\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('505', '1', 'admin', 'backend/product/priattrvalue/enable', 'priattr_value', null, '[{\"id\":\"12\",\"title\":\"\\u9ed1\\u8272\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('506', '1', 'admin', 'backend/shop/index/enable', 'shop', null, '[{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('507', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('508', '1', 'admin', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"17\",\"title\":\"\\u624b\\u673a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('509', '1', 'admin', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"17\",\"title\":\"\\u624b\\u673a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('510', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('511', '1', 'admin', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"30\",\"title\":\"\\u7279\\u8272\\u670d\\u52a1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('512', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('513', '1', 'admin', 'backend/article/news/disable', 'article', null, '[{\"id\":\"6\",\"title\":\"test\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('514', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"14\",\"title\":\"test 9\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('515', '1', 'admin', 'backend/article/news/enable', 'article', null, '[{\"id\":\"6\",\"title\":\"test\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('516', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('517', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('518', '1', 'admin', 'backend/article/news/disable', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('519', '1', 'admin', 'backend/article/news/enable', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('520', '1', 'admin', 'backend/article/group/del', 'article_category', null, '[{\"id\":\"10\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('521', '1', 'admin', 'backend/article/news/no_recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('522', '1', 'admin', 'backend/article/group/del', 'article_category', null, '[{\"id\":\"1\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('523', '1', 'admin', 'backend/article/group/disable', 'article_category', null, '[{\"id\":\"5\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\\u52a8\\u7269\\u57ce\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('524', '1', 'admin', 'backend/article/group/enable', 'article_category', null, '[{\"id\":\"5\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\\u52a8\\u7269\\u57ce\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('525', '1', 'admin', 'backend/member/group/del', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('526', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('527', '1', 'admin', 'backend/article/news/no_recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('528', '1', 'admin', 'backend/article/news/no_recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('529', '1', 'admin', 'backend/article/news/no_recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('530', '1', 'admin', 'backend/article/news/disable', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('531', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('532', '1', 'admin', 'backend/article/news/no_recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('533', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('534', '1', 'admin', 'backend/article/news/no_recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('535', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('536', '1', 'admin', 'backend/article/news/enable', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('537', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('538', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '61.183.82.193', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('539', '1', 'admin', 'backend/article/news/no_recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '61.183.82.193', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('540', '1', 'admin', 'backend/article/news/recommend', 'article', null, '[{\"id\":\"31\",\"title\":\"\\u5996\\u5200\\u5ba3\\u5e03\\u4e3a\\u56fd\\u51fa\\u6218\\u91cc\\u7ea6\\u5965\\u8fd0 \\u5728\\u90a3\\u7ed3\\u675f\\u804c\\u4e1a\\u751f\\u6daf?\"}]', '61.183.82.193', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('541', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('542', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('543', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('544', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('545', '1', 'admin', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"33\",\"title\":\"\\u65b0\\u4eba\\u5165\\u95e8\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('546', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"177\",\"title\":\"\\u6536\\u4ef6\\u7bb1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('547', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('548', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('549', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '61.183.82.193', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('550', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '61.183.82.193', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('551', '1', 'admin', 'backend/base/seopage/enable', 'Seo_page', null, '[{\"id\":\"1\",\"title\":\"\\u6211\\u64e6\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('552', '1', 'admin', 'backend/base/seopage/disable', 'Seo_page', null, '[{\"id\":\"1\",\"title\":\"\\u6211\\u64e6\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('553', '1', 'admin', 'backend/base/seopage/enable', 'Seo_page', null, '[{\"id\":\"1\",\"title\":\"\\u6211\\u64e6\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('554', '1', 'admin', 'backend/base/seopage/del', 'Seo_page', null, '[{\"id\":\"4\",\"title\":\"(\\u2299o\\u2299)\\u2026\\u5730\\u65b9\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('555', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('556', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('557', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('558', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('559', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('560', '1', 'admin', 'backend/article/news/disable', 'article', null, '[{\"id\":\"6\",\"title\":\"\\u8d44\\u8baf\\u5217\\u8868\\u53d6\\u6d88\\u63a8\\u8350\\u5931\\u8d25\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('561', '1', 'admin', 'backend/article/news/enable', 'article', null, '[{\"id\":\"6\",\"title\":\"\\u8d44\\u8baf\\u5217\\u8868\\u53d6\\u6d88\\u63a8\\u8350\\u5931\\u8d25\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('562', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"207\",\"title\":\"\\u542f\\u7528\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('563', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('564', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"208\",\"title\":\"\\u7981\\u7528\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('565', '1', 'admin', 'backend/message/send/del', 'message', null, '[{\"id\":\"35\",\"title\":\"12\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('566', '1', 'admin', 'backend/message/send/del', 'message', null, '[{\"id\":\"36\",\"title\":\"12\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('567', '1', 'admin', 'backend/message/send/del', 'message', null, '[{\"id\":\"37\",\"title\":\"\\u8fd9\\u4e2a\\u90fd\\u662f\\u5047\\u7684\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('568', '1', 'admin', 'backend/message/send/del', 'message', null, '[{\"id\":\"38\",\"title\":\"\\u8fd9\\u4e2a\\u90fd\\u662f\\u5047\\u7684\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('569', '1', 'admin', 'backend/message/send/del', 'message', null, '[{\"id\":\"39\",\"title\":\"\\u5c31\\u662f\\u53d7\\u4e0d\\u4e86\\u4e86\\u8fd9\\u6837\\u7684\\u53bb\\u5e74\\u521a\"},{\"id\":\"40\",\"title\":\"\\u6211\\u662f\\u4e00\\u53ea\\u5c0f\\u5c0f\\u9e1f\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('570', '1', 'admin', 'backend/message/send/del', 'message', null, '[{\"id\":\"34\",\"title\":\"4478@qq.com\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('571', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('572', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.113.217.239', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('573', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"33\",\"title\":\"\\u5355\\u7535\\/\\u5fae\\u5355\\u76f8\\u673a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('574', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('575', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"67\",\"title\":\"SUV\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('576', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('577', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('578', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('579', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('580', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"4\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('581', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('582', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('583', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('584', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('585', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.113.217.239', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('586', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"1\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\"},{\"id\":\"8\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\"},{\"id\":\"9\",\"title\":\"\\u5e73\\u53f0\\u7ba1\\u7406\"},{\"id\":\"144\",\"title\":\"\\u8d44\\u91d1\\u7ba1\\u7406\"}]', '171.113.217.239', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('587', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('588', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"144\",\"title\":\"\\u8d44\\u91d1\\u7ba1\\u7406\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('589', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.113.217.239', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('590', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('591', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"7\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa-\\u9b45\\u65cf\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('592', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '221.235.66.75', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('593', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('594', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('595', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('596', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"7\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa-\\u9b45\\u65cf\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('597', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('598', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('599', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('600', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('601', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"9\",\"title\":\"\\u9996\\u9875\\u53f3\\u4e0a\\u89d2\\u5e7f\\u544aa\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('602', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"9\",\"title\":\"\\u9996\\u9875\\u53f3\\u4e0a\\u89d2\\u5e7f\\u544aa\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('603', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"9\",\"title\":\"\\u9996\\u9875\\u53f3\\u4e0a\\u89d2\\u5e7f\\u544aa\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('604', '1', 'admin', 'backend/banner/index/disable', 'banner', null, '[{\"id\":\"9\",\"title\":\"\\u9996\\u9875\\u53f3\\u4e0a\\u89d2\\u5e7f\\u544aa\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('605', '1', 'admin', 'backend/banner/index/disable', 'banner', null, '[{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('606', '1', 'admin', 'backend/banner/index/disable', 'banner', null, '[{\"id\":\"7\",\"title\":\"ces123455\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('607', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"9\",\"title\":\"\\u9996\\u9875\\u53f3\\u4e0a\\u89d2\\u5e7f\\u544aa\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('608', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('609', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"7\",\"title\":\"ces123455\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('610', '1', 'admin', 'backend/banner/index/disable', 'banner', null, '[{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('611', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('612', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa-\\u4e50\\u89c6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('613', '1', 'admin', 'backend/banner/index/disable', 'banner', null, '[{\"id\":\"2\",\"title\":\"ces\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('614', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"2\",\"title\":\"ces\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('615', '1', 'admin', 'backend/message/send/del', 'message', null, '[{\"id\":\"45\",\"title\":\"\\u8fd9\\u4e2a\\u53ea\\u662f\\u6d4b\\u8bd5\\u200b\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('616', '1', 'admin', 'backend/message/send/del', 'message', null, '[{\"id\":\"44\",\"title\":\"\\u8fd9\\u4e2a\\u53ea\\u662f\\u6d4b\\u8bd5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('617', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"2\",\"title\":\"ces\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd52\"},{\"id\":\"4\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"5\",\"title\":\"\\u54b1\\u4eec\\u4e00\\u8d77\\u800d\\u7334\\u5427\\uff01\"},{\"id\":\"6\",\"title\":\"cesi\"},{\"id\":\"7\",\"title\":\"ces123455\"},{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"9\",\"title\":\"\\u9996\\u9875\\u53f3\\u4e0a\\u89d2\\u5e7f\\u544aa\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('618', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('619', '1', 'admin', 'backend/banner/index/disable', 'banner', null, '[{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('620', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('621', '1', 'admin', 'backend/banner/index/disable', 'banner', null, '[{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('622', '1', 'admin', 'backend/banner/index/enable', 'banner', null, '[{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('623', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('624', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('625', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('626', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('627', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('628', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('629', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('630', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('631', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('632', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('633', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('634', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('635', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('636', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('637', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('638', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('639', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('640', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('641', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('642', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('643', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('644', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('645', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('646', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('647', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('648', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('649', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('650', '1', 'admin', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"81\",\"title\":\"\\u56fe\\u4e66\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('651', '1', 'admin', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"81\",\"title\":\"\\u56fe\\u4e66\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('652', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('653', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('654', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"218\",\"title\":\"\\u4fee\\u6539\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('655', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"214\",\"title\":\"\\u6dfb\\u52a0\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('656', '1', 'admin', 'backend/member/group/del', 'role', null, '[{\"id\":\"13\",\"title\":\"\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('657', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('658', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('659', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('660', '1', 'admin', 'backend/member/group/disable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('661', '1', 'admin', 'backend/member/group/enable', 'role', null, '[{\"id\":\"1\",\"title\":\"\\u666e\\u901a\\u7528\\u6237\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('662', '1', 'admin', 'backend/article/group/disable', 'article_category', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\\u52a8\\u7269\\u57ce\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('663', '1', 'admin', 'backend/article/group/enable', 'article_category', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\\u52a8\\u7269\\u57ce\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('664', '1', 'admin', 'backend/article/grouphelp/disable', 'article_category', null, '[{\"id\":\"4\",\"title\":\"\\u7591\\u96be\\u89e3\\u7b54\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('665', '1', 'admin', 'backend/article/grouphelp/enable', 'article_category', null, '[{\"id\":\"4\",\"title\":\"\\u7591\\u96be\\u89e3\\u7b54\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('666', '1', 'admin', 'backend/article/grouphelp/disable', 'article_category', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u4eba\\u5165\\u95e8\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('667', '1', 'admin', 'backend/article/grouphelp/enable', 'article_category', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u4eba\\u5165\\u95e8\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('668', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('669', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('670', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('671', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('672', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('673', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"207\",\"title\":\"\\u542f\\u7528\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('674', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"208\",\"title\":\"\\u7981\\u7528\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('675', '1', 'admin', 'backend/message/send/disable', 'message', null, '[{\"id\":\"59\",\"title\":\"\\u901a\\u77e5\\u516c\\u544a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('676', '1', 'admin', 'backend/message/send/enable', 'message', null, '[{\"id\":\"59\",\"title\":\"\\u901a\\u77e5\\u516c\\u544a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('677', '1', 'admin', 'backend/message/send/disable', 'message', null, '[{\"id\":\"59\",\"title\":\"\\u901a\\u77e5\\u516c\\u544a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('678', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('679', '1', 'admin', 'backend/message/send/enable', 'message', null, '[{\"id\":\"59\",\"title\":\"\\u901a\\u77e5\\u516c\\u544a\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('680', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('681', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('682', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('683', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('684', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('685', '1', 'admin', 'backend/base/seopage/del', 'Seo_page', null, '[{\"id\":\"5\",\"title\":\"\\u6c83\\u514b-\\u767b\\u5f55\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('686', '1', 'admin', 'backend/base/seopage/del', 'Seo_page', null, '[{\"id\":\"1\",\"title\":\"\\u6211\\u64e6\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('687', '1', 'admin', 'backend/base/seopage/del', 'Seo_page', null, '[{\"id\":\"2\",\"title\":\"13\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('688', '1', 'admin', 'backend/base/seopage/del', 'Seo_page', null, '[{\"id\":\"3\",\"title\":\"\\u963f\\u65af\\u8fbe\"}]', '121.60.80.46', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('689', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('690', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '122.228.19.45', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('691', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('692', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('693', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('694', '1', 'admin', 'backend/article/news/disable', 'article', null, '[{\"id\":\"22\",\"title\":\"test 17\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('695', '1', 'admin', 'backend/article/news/enable', 'article', null, '[{\"id\":\"22\",\"title\":\"test 17\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('696', '1', 'admin', 'backend/article/news/disable', 'article', null, '[{\"id\":\"22\",\"title\":\"test 17\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('697', '1', 'admin', 'backend/article/news/enable', 'article', null, '[{\"id\":\"22\",\"title\":\"test 17\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('698', '1', 'admin', 'backend/message/send/disable', 'message', null, '[{\"id\":\"96\",\"title\":\"\\u5173\\u4e8e\\u4eca\\u660e\\u4e24\\u5929\\u4e0b\\u96e8\\u901a\\u77e5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('699', '1', 'admin', 'backend/message/send/enable', 'message', null, '[{\"id\":\"96\",\"title\":\"\\u5173\\u4e8e\\u4eca\\u660e\\u4e24\\u5929\\u4e0b\\u96e8\\u901a\\u77e5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('700', '1', 'admin', 'backend/message/send/disable', 'message', null, '[{\"id\":\"96\",\"title\":\"\\u5173\\u4e8e\\u4eca\\u660e\\u4e24\\u5929\\u4e0b\\u96e8\\u901a\\u77e5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('701', '1', 'admin', 'backend/message/send/enable', 'message', null, '[{\"id\":\"96\",\"title\":\"\\u5173\\u4e8e\\u4eca\\u660e\\u4e24\\u5929\\u4e0b\\u96e8\\u901a\\u77e5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('702', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('703', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('704', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('705', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('706', '1', 'admin', 'backend/show/index/disable', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('707', '1', 'admin', 'backend/show/index/enable', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('708', '1', 'admin', 'backend/show/recommend/disable', 'Show', null, '[{\"id\":\"14\",\"title\":\"DIV\\u65cb\\u7ffc\\u98de\\u673a\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('709', '1', 'admin', 'backend/show/recommend/enable', 'Show', null, '[{\"id\":\"14\",\"title\":\"DIV\\u65cb\\u7ffc\\u98de\\u673a\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('710', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('711', '3', '吴楠', 'backend/base/public/login', 'admin', null, '[{\"id\":\"3\",\"title\":\"\\u5434\\u6960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('712', '2', '雷达', 'backend/base/public/login', 'admin', null, '[{\"id\":\"2\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('713', '3', '吴楠', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"34\",\"title\":\"\\u6d4b\\u8bd5\\u9996\\u9875\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('714', '3', '吴楠', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"34\",\"title\":\"\\u6d4b\\u8bd5\\u9996\\u9875\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('715', '3', '吴楠', 'backend/navigation/index/del', 'navigation', null, '[{\"id\":\"34\",\"title\":\"\\u6d4b\\u8bd5\\u9996\\u9875\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('716', '2', '雷达', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"14\",\"title\":\"\\u8fd0\\u52a8\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('717', '2', '雷达', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"14\",\"title\":\"\\u8fd0\\u52a8\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('718', '2', '雷达', 'backend/product/group/del', 'category_group', null, '[{\"id\":\"14\",\"title\":\"\\u8fd0\\u52a8\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('719', '2', '雷达', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"1\",\"title\":\"\\u5bb6\\u7528\\u7535\\u5668\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('720', '2', '雷达', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"1\",\"title\":\"\\u5bb6\\u7528\\u7535\\u5668\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('721', '2', '雷达', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"8\",\"title\":\"\\u8fd0\\u52a8\\u6237\\u5916\"},{\"id\":\"9\",\"title\":\"\\u6c7d\\u8f66\\u3001\\u6c7d\\u8f66\\u7528\\u54c1\"},{\"id\":\"10\",\"title\":\"\\u6bcd\\u5a74\\u3001\\u73a9\\u5177\\u4e50\\u5668\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('722', '2', '雷达', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"8\",\"title\":\"\\u8fd0\\u52a8\\u6237\\u5916\"},{\"id\":\"9\",\"title\":\"\\u6c7d\\u8f66\\u3001\\u6c7d\\u8f66\\u7528\\u54c1\"},{\"id\":\"10\",\"title\":\"\\u6bcd\\u5a74\\u3001\\u73a9\\u5177\\u4e50\\u5668\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('723', '2', '雷达', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"3\",\"title\":\"\\u7535\\u8111\\u3001\\u529e\\u516c\"},{\"id\":\"5\",\"title\":\"\\u670d\\u88c5\"},{\"id\":\"7\",\"title\":\"\\u978b\\u5305\"},{\"id\":\"8\",\"title\":\"\\u8fd0\\u52a8\\u6237\\u5916\"},{\"id\":\"10\",\"title\":\"\\u6bcd\\u5a74\\u3001\\u73a9\\u5177\\u4e50\\u5668\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('724', '2', '雷达', 'backend/product/group/disable', 'category_group', null, '[{\"id\":\"1\",\"title\":\"\\u5bb6\\u7528\\u7535\\u5668\"},{\"id\":\"2\",\"title\":\"\\u624b\\u673a\\u3001\\u6570\\u7801\"},{\"id\":\"5\",\"title\":\"\\u670d\\u88c5\"},{\"id\":\"8\",\"title\":\"\\u8fd0\\u52a8\\u6237\\u5916\"},{\"id\":\"9\",\"title\":\"\\u6c7d\\u8f66\\u3001\\u6c7d\\u8f66\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('725', '2', '雷达', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"1\",\"title\":\"\\u5bb6\\u7528\\u7535\\u5668\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('726', '2', '雷达', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"2\",\"title\":\"\\u624b\\u673a\\u3001\\u6570\\u7801\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('727', '2', '雷达', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"5\",\"title\":\"\\u670d\\u88c5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('728', '2', '雷达', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"8\",\"title\":\"\\u8fd0\\u52a8\\u6237\\u5916\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('729', '2', '雷达', 'backend/product/group/enable', 'category_group', null, '[{\"id\":\"9\",\"title\":\"\\u6c7d\\u8f66\\u3001\\u6c7d\\u8f66\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('730', '1', 'admin', 'backend/show/index/enable', 'Show', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('731', '1', 'admin', 'backend/show/index/disable', 'Show', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('732', '1', 'admin', 'backend/show/index/enable', 'Show', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('733', '1', 'admin', 'backend/show/index/disable', 'Show', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('734', '1', 'admin', 'backend/show/index/disable', 'Show', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('735', '1', 'admin', 'backend/show/recommend/disable', 'Show', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('736', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('737', '1', 'admin', 'backend/show/index/disable', 'Show', null, 'null', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('738', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('739', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('740', '1', 'admin', 'backend/show/index/disable', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('741', '1', 'admin', 'backend/show/index/enable', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('742', '1', 'admin', 'backend/show/index/disable', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('743', '1', 'admin', 'backend/show/index/enable', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('744', '1', 'admin', 'backend/show/index/enable', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('745', '1', 'admin', 'backend/show/recommend/recommend', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('746', '3', '吴楠', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"},{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"8\",\"title\":\"\\u65b0\\u54c1\\u9884\\u5b9a\"},{\"id\":\"9\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"18\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"19\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"},{\"id\":\"20\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"},{\"id\":\"21\",\"title\":\"1\"},{\"id\":\"23\",\"title\":\"123\"},{\"id\":\"24\",\"title\":\"\\u9996\\u9875\"},{\"id\":\"25\",\"title\":\"\\u670d\\u52a1\\u5546\\u5e93\"},{\"id\":\"26\",\"title\":\"\\u79c0\\u5427\"},{\"id\":\"27\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"},{\"id\":\"28\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"},{\"id\":\"35\",\"title\":\"\\u6d4b\\u8bd5\\u9996\\u9875\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('747', '3', '吴楠', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"},{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"8\",\"title\":\"\\u65b0\\u54c1\\u9884\\u5b9a\"},{\"id\":\"9\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"18\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"19\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"},{\"id\":\"20\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"},{\"id\":\"21\",\"title\":\"1\"},{\"id\":\"23\",\"title\":\"123\"},{\"id\":\"24\",\"title\":\"\\u9996\\u9875\"},{\"id\":\"25\",\"title\":\"\\u670d\\u52a1\\u5546\\u5e93\"},{\"id\":\"26\",\"title\":\"\\u79c0\\u5427\"},{\"id\":\"27\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"},{\"id\":\"28\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"},{\"id\":\"35\",\"title\":\"\\u6d4b\\u8bd5\\u9996\\u9875\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('748', '3', '吴楠', 'backend/navigation/index/enable', 'navigation', null, '[{\"id\":\"2\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"},{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"8\",\"title\":\"\\u65b0\\u54c1\\u9884\\u5b9a\"},{\"id\":\"9\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"18\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"19\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"},{\"id\":\"20\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"},{\"id\":\"21\",\"title\":\"1\"},{\"id\":\"23\",\"title\":\"123\"},{\"id\":\"24\",\"title\":\"\\u9996\\u9875\"},{\"id\":\"25\",\"title\":\"\\u670d\\u52a1\\u5546\\u5e93\"},{\"id\":\"26\",\"title\":\"\\u79c0\\u5427\"},{\"id\":\"27\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"},{\"id\":\"28\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"},{\"id\":\"35\",\"title\":\"\\u6d4b\\u8bd5\\u9996\\u9875\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('749', '1', 'admin', 'backend/show/recommend/recommend', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('750', '2', '雷达', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"78\",\"title\":\"\\u8425\\u517b\\u4fdd\\u5065\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('751', '2', '雷达', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"78\",\"title\":\"\\u8425\\u517b\\u4fdd\\u5065\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('752', '2', '雷达', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"78\",\"title\":\"\\u8425\\u517b\\u4fdd\\u5065\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('753', '2', '雷达', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"63\",\"title\":\"\\u6c7d\\u8f66\"},{\"id\":\"69\",\"title\":\"\\u6bcd\\u5a74\"},{\"id\":\"73\",\"title\":\"\\u98df\\u54c1\"},{\"id\":\"78\",\"title\":\"\\u8425\\u517b\\u4fdd\\u5065\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('754', '2', '雷达', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"58\",\"title\":\"\\u8fd0\\u52a8\\u6237\\u5916\"},{\"id\":\"63\",\"title\":\"\\u6c7d\\u8f66\"},{\"id\":\"69\",\"title\":\"\\u6bcd\\u5a74\"},{\"id\":\"73\",\"title\":\"\\u98df\\u54c1\"},{\"id\":\"78\",\"title\":\"\\u8425\\u517b\\u4fdd\\u5065\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('755', '2', '雷达', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('756', '2', '雷达', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('757', '2', '雷达', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('758', '2', '雷达', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('759', '2', '雷达', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('760', '2', '雷达', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('761', '2', '雷达', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('762', '2', '雷达', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('763', '2', '雷达', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('764', '2', '雷达', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('765', '2', '雷达', 'backend/product/category/del', 'product_category', null, '[{\"id\":\"88\",\"title\":\"\\u751f\\u6d3b\\u7528\\u54c1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('766', '1', 'admin', 'backend/show/recommend/recommend', 'Show', null, '[{\"id\":\"21\",\"title\":\"adasd\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('767', '1', 'admin', 'backend/show/index/recommend', 'Show', null, '[{\"id\":\"19\",\"title\":\"\\u5ba4\\u5185\\u7a7a\\u6c14\\u51c0\\u5316\\u5668\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('768', '1', 'admin', 'backend/show/index/recommend', 'Show', null, '[{\"id\":\"18\",\"title\":\"\\u5bb6\\u7528\\u7535\\u98ce\\u6247\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('769', '1', 'admin', 'backend/show/index/is_to_home', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('770', '1', 'admin', 'backend/show/index/is_to_home', 'Show', null, '[{\"id\":\"21\",\"title\":\"adasd\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('771', '1', 'admin', 'backend/show/index/is_to_home', 'Show', null, '[{\"id\":\"18\",\"title\":\"\\u5bb6\\u7528\\u7535\\u98ce\\u6247\"},{\"id\":\"19\",\"title\":\"\\u5ba4\\u5185\\u7a7a\\u6c14\\u51c0\\u5316\\u5668\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('772', '1', 'admin', 'backend/show/index/disable', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('773', '1', 'admin', 'backend/show/index/enable', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('774', '1', 'admin', 'backend/show/recommend/no_recommend', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('775', '1', 'admin', 'backend/show/recommend/no_recommend', 'Show', null, '[{\"id\":\"19\",\"title\":\"\\u5ba4\\u5185\\u7a7a\\u6c14\\u51c0\\u5316\\u5668\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('776', '2', '雷达', 'backend/product/category/disable', 'product_category', null, '[{\"id\":\"89\",\"title\":\"\\u624b\\u673a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('777', '2', '雷达', 'backend/product/category/enable', 'product_category', null, '[{\"id\":\"89\",\"title\":\"\\u624b\\u673a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('778', '2', '雷达', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"89\",\"title\":\"\\u624b\\u673a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('779', '2', '雷达', 'backend/product/category/home_hide', 'product_category', null, '[{\"id\":\"89\",\"title\":\"\\u624b\\u673a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('780', '2', '雷达', 'backend/product/category/home_show', 'product_category', null, '[{\"id\":\"89\",\"title\":\"\\u624b\\u673a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('781', '1', 'admin', 'backend/show/recommendtop/no_is_to_home', 'Show', null, '[{\"id\":\"12\",\"title\":\"vsdfsdaaaaaaaaaaaaabbbbbbbbbbbbbbbbb\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('782', '2', '雷达', 'backend/product/category/del', 'product_category', null, '[{\"id\":\"89\",\"title\":\"\\u624b\\u673a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('783', '1', 'admin', 'backend/show/recommendtop/no_is_to_home', 'Show', null, '[{\"id\":\"21\",\"title\":\"adasd\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('784', '1', 'admin', 'backend/show/recommendtop/no_is_to_home', 'Show', null, '[{\"id\":\"21\",\"title\":\"adasd\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('785', '1', 'admin', 'backend/show/recommendtop/no_is_to_home', 'Show', null, '[{\"id\":\"21\",\"title\":\"adasd\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('786', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('787', '3', '吴楠', 'backend/product/brand/disable', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u5c0f\\u7c73\"},{\"id\":\"2\",\"title\":\"\\u9b45\\u65cf\"},{\"id\":\"3\",\"title\":\"OPPO\"},{\"id\":\"4\",\"title\":\"Vivo\"},{\"id\":\"5\",\"title\":\"\\u4e09\\u661f\"},{\"id\":\"6\",\"title\":\"ThinkPad\"},{\"id\":\"7\",\"title\":\"\\u4e50\\u89c6\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('788', '3', '吴楠', 'backend/product/brand/enable', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u5c0f\\u7c73\"},{\"id\":\"2\",\"title\":\"\\u9b45\\u65cf\"},{\"id\":\"3\",\"title\":\"OPPO\"},{\"id\":\"4\",\"title\":\"Vivo\"},{\"id\":\"5\",\"title\":\"\\u4e09\\u661f\"},{\"id\":\"6\",\"title\":\"ThinkPad\"},{\"id\":\"7\",\"title\":\"\\u4e50\\u89c6\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('789', '1', 'admin', 'backend/show/index/recommend', 'Show', null, '[{\"id\":\"22\",\"title\":\"\\u6d4b\\u8bd5\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('790', '2', '雷达', 'backend/product/category/del', 'product_category', null, '[{\"id\":\"90\",\"title\":\"\\u624b\\u673a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('791', '2', '雷达', 'backend/member/group/del', 'role', null, '[{\"id\":\"14\",\"title\":\"\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('792', '2', '雷达', 'backend/member/group/disable', 'role', null, '[{\"id\":\"12\",\"title\":\"\\u6d4b\\u8bd5\\u7528\\u6237\\u7ec4\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('793', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('794', '3', '吴楠', 'backend/base/public/login', 'admin', null, '[{\"id\":\"3\",\"title\":\"\\u5434\\u6960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('795', '2', '雷达', 'backend/member/group/del', 'role', null, '[{\"id\":\"18\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('796', '2', '雷达', 'backend/member/group/del', 'role', null, '[{\"id\":\"15\",\"title\":\"\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('797', '2', '雷达', 'backend/member/group/del', 'role', null, '[{\"id\":\"12\",\"title\":\"\\u6d4b\\u8bd5\\u7528\\u6237\\u7ec4\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('798', '2', '雷达', 'backend/member/group/del', 'role', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\\u7528\\u6237\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('799', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('800', '1', 'admin', 'backend/member/group/del', 'role', null, '[{\"id\":\"17\",\"title\":\"\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('801', '1', 'admin', 'backend/product/custom/disable', 'custom_preset', null, '[{\"id\":\"6\",\"title\":\"\\u673a\\u8eab\\u6750\\u8d28\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('802', '2', '雷达', 'backend/member/group/del', 'role', null, '[{\"id\":\"17\",\"title\":\"\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('803', '2', '雷达', 'backend/member/group/del', 'role', null, '[{\"id\":\"16\",\"title\":\"\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('804', '2', '雷达', 'backend/member/group/disable', 'role', null, '[{\"id\":\"19\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5_1\"},{\"id\":\"20\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5_2\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('805', '2', '雷达', 'backend/member/group/enable', 'role', null, '[{\"id\":\"19\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5_1\"},{\"id\":\"20\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5_2\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('806', '2', '雷达', 'backend/member/group/del', 'role', null, '[{\"id\":\"19\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5_1\"},{\"id\":\"20\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5_2\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('807', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('808', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('809', '3', '吴楠', 'backend/product/brand/enable', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u5c0f\\u7c73\"},{\"id\":\"2\",\"title\":\"\\u9b45\\u65cf\"},{\"id\":\"3\",\"title\":\"OPPO\"},{\"id\":\"4\",\"title\":\"Vivo\"},{\"id\":\"5\",\"title\":\"\\u4e09\\u661f\"},{\"id\":\"6\",\"title\":\"ThinkPad\"},{\"id\":\"7\",\"title\":\"\\u4e50\\u89c6\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('810', '3', '吴楠', 'backend/product/brand/disable', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u5c0f\\u7c73\"},{\"id\":\"2\",\"title\":\"\\u9b45\\u65cf\"},{\"id\":\"3\",\"title\":\"OPPO\"},{\"id\":\"4\",\"title\":\"Vivo\"},{\"id\":\"5\",\"title\":\"\\u4e09\\u661f\"},{\"id\":\"6\",\"title\":\"ThinkPad\"},{\"id\":\"7\",\"title\":\"\\u4e50\\u89c6\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('811', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"232\",\"title\":\"\\u5e97\\u94fa\\u4e00\\u671f\\u5ba1\\u6838\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('812', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"232\",\"title\":\"\\u5e97\\u94fa\\u4e00\\u671f\\u5ba1\\u6838\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('813', '2', '雷达', 'backend/base/public/login', 'admin', null, '[{\"id\":\"2\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('814', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('815', '1', 'admin', 'backend/member/group/del', 'role', null, '[{\"id\":\"21\",\"title\":\"\\u6d4b\\u8bd5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('816', '1', 'admin', 'backend/product/brand/disable', 'brand', null, '[{\"id\":\"8\",\"title\":\"MX9\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('817', '1', 'admin', 'backend/product/brand/del', 'brand', null, '[{\"id\":\"8\",\"title\":\"MX9\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('818', '1', 'admin', 'backend/shop/index/disable', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('819', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('820', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('821', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('822', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('823', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('824', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('825', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('826', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('827', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('828', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('829', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('830', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('831', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('832', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('833', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('834', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('835', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('836', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('837', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('838', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('839', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('840', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('841', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"82\",\"username\":\"15827144625\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('842', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('843', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('844', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"82\",\"username\":\"15827144625\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('845', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('846', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('847', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('848', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('849', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('850', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('851', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('852', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('853', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('854', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('855', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('856', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('857', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('858', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('859', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('860', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('861', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"69\",\"username\":\"15387133178\"},{\"id\":\"82\",\"username\":\"15827144625\"},{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('862', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('863', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('864', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('865', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"69\",\"username\":\"15387133178\"},{\"id\":\"82\",\"username\":\"15827144625\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('866', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"82\",\"username\":\"15827144625\"},{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('867', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"82\",\"username\":\"15827144625\"},{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('868', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('869', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('870', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('871', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('872', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('873', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('874', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('875', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('876', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('877', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('878', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('879', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('880', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('881', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('882', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('883', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('884', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('885', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('886', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('887', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('888', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('889', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('890', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('891', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('892', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('893', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('894', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('895', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('896', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('897', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('898', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('899', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('900', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('901', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('902', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('903', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('904', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('905', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('906', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('907', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('908', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('909', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('910', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('911', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('912', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('913', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('914', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('915', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('916', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('917', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('918', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('919', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('920', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('921', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('922', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('923', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('924', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('925', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('926', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('927', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('928', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('929', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('930', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('931', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('932', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('933', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('934', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('935', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('936', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('937', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('938', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('939', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('940', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('941', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('942', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('943', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('944', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('945', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('946', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('947', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('948', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('949', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('950', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('951', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('952', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('953', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('954', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('955', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('956', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('957', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"},{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('958', '2', '雷达', 'backend/member/business/del', 'member', null, '[{\"id\":\"88\",\"username\":\"13109876543\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('959', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"87\",\"username\":\"13100000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('960', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"87\",\"username\":\"13100000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('961', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"87\",\"username\":\"13100000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('962', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"87\",\"username\":\"13100000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('963', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('964', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('965', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"87\",\"username\":\"13100000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('966', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"87\",\"username\":\"13100000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('967', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"87\",\"username\":\"13100000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('968', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"87\",\"username\":\"13100000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('969', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('970', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('971', '2', '雷达', 'backend/member/member/del', 'member', null, '[{\"id\":\"87\",\"username\":\"13100000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('972', '2', '雷达', 'backend/member/group/disable', 'role', null, '[{\"id\":\"22\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('973', '2', '雷达', 'backend/member/group/enable', 'role', null, '[{\"id\":\"22\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('974', '2', '雷达', 'backend/member/group/disable', 'role', null, '[{\"id\":\"22\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('975', '2', '雷达', 'backend/member/group/enable', 'role', null, '[{\"id\":\"22\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('976', '2', '雷达', 'backend/member/group/disable', 'role', null, '[{\"id\":\"22\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('977', '2', '雷达', 'backend/member/group/enable', 'role', null, '[{\"id\":\"22\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('978', '2', '雷达', 'backend/member/group/disable', 'role', null, '[{\"id\":\"22\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('979', '2', '雷达', 'backend/member/group/enable', 'role', null, '[{\"id\":\"22\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('980', '2', '雷达', 'backend/member/group/del', 'role', null, '[{\"id\":\"22\",\"title\":\"\\u96f7\\u8fbe\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('981', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"},{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('982', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"},{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('983', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('984', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('985', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('986', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('987', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('988', '2', '雷达', 'backend/product/priattrvalue/disable', 'priattr_value', null, '[{\"id\":\"16\",\"title\":\"123\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('989', '2', '雷达', 'backend/product/priattrvalue/enable', 'priattr_value', null, '[{\"id\":\"16\",\"title\":\"123\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('990', '2', '雷达', 'backend/product/priattrvalue/del', 'priattr_value', null, '[{\"id\":\"16\",\"title\":\"123\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('991', '2', '雷达', 'backend/product/priattr/disable', 'priattr', null, '[{\"id\":\"4\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('992', '2', '雷达', 'backend/product/priattr/enable', 'priattr', null, '[{\"id\":\"4\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('993', '2', '雷达', 'backend/product/priattr/disable', 'priattr', null, '[{\"id\":\"1\",\"title\":\"\\u989c\\u8272\"},{\"id\":\"3\",\"title\":\"\\u5c3a\\u5bf8\"},{\"id\":\"4\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('994', '2', '雷达', 'backend/product/priattr/enable', 'priattr', null, '[{\"id\":\"1\",\"title\":\"\\u989c\\u8272\"},{\"id\":\"3\",\"title\":\"\\u5c3a\\u5bf8\"},{\"id\":\"4\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('995', '2', '雷达', 'backend/product/priattr/del', 'priattr', null, '[{\"id\":\"4\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('996', '2', '雷达', 'backend/article/news/disable', 'article', null, '[{\"id\":\"49\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('997', '2', '雷达', 'backend/article/news/enable', 'article', null, '[{\"id\":\"49\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('998', '2', '雷达', 'backend/article/news/disable', 'article', null, '[{\"id\":\"49\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('999', '2', '雷达', 'backend/article/news/enable', 'article', null, '[{\"id\":\"49\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1000', '2', '雷达', 'backend/article/news/dele', 'article', null, '[{\"id\":\"49\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1001', '1', 'admin', 'backend/article/group/del', 'article_category', null, '[{\"id\":\"12\",\"title\":\"\\u96f7\\u8fbe\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1002', '1', 'admin', 'backend/article/group/del', 'article_category', null, '[{\"id\":\"12\",\"title\":\"\\u96f7\\u8fbe\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1003', '1', 'admin', 'backend/article/group/del', 'article_category', null, '[{\"id\":\"2\",\"title\":\"\\u6295\\u8d44\\u7406\\u8d22\"},{\"id\":\"8\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1004', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1005', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1006', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1007', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1008', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1009', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"},{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1010', '1', 'admin', 'backend/member/member/disable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"},{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1011', '1', 'admin', 'backend/member/member/enable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"},{\"id\":\"85\",\"username\":\"13411111111\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1012', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"},{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1013', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"},{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1014', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1015', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1016', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"},{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1017', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"84\",\"username\":\"13377850432\"},{\"id\":\"85\",\"username\":\"13411111111\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1018', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"81\",\"username\":\"15578999011\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1019', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"81\",\"username\":\"15578999011\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1020', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"80\",\"username\":\"15516788902\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1021', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"80\",\"username\":\"15516788902\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1022', '2', '雷达', 'backend/member/member/disable', 'member', null, '[{\"id\":\"77\",\"username\":\"18627784626\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1023', '2', '雷达', 'backend/member/member/enable', 'member', null, '[{\"id\":\"77\",\"username\":\"18627784626\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1024', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1025', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1026', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1027', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1028', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1029', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1030', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1031', '2', '雷达', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1032', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"83\",\"username\":\"13545370960\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1033', '2', '雷达', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1034', '2', '雷达', 'backend/product/custom/enable', 'custom_preset', null, '[{\"id\":\"6\",\"title\":\"\\u673a\\u8eab\\u6750\\u8d28\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1035', '2', '雷达', 'backend/product/custom/disable', 'custom_preset', null, '[{\"id\":\"7\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1036', '2', '雷达', 'backend/product/custom/enable', 'custom_preset', null, '[{\"id\":\"7\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1037', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1038', '2', '雷达', 'backend/product/custom/disable', 'custom_preset', null, '[{\"id\":\"7\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1039', '2', '雷达', 'backend/product/custom/del', 'custom_preset', null, '[{\"id\":\"7\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1040', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1041', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1042', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1043', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1044', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1045', '2', '雷达', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u6d6a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1046', '2', '雷达', 'backend/navigation/friendlink/enable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u6d6a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1047', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1048', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1049', '1', 'admin', 'backend/member/business/disable_bus', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1050', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1051', '1', 'admin', 'backend/member/business/enable', 'member', null, '[{\"id\":\"19\",\"username\":\"dsadas\"},{\"id\":\"31\",\"username\":\"\\u96f7\\u8fbe11\"},{\"id\":\"48\",\"username\":\"18888888888\"},{\"id\":\"49\",\"username\":\"13888888888\"},{\"id\":\"53\",\"username\":\"15444567895\"},{\"id\":\"63\",\"username\":\"15516855279\"},{\"id\":\"66\",\"username\":\"15777899901\"},{\"id\":\"69\",\"username\":\"15387133178\"},{\"id\":\"82\",\"username\":\"15827144625\"},{\"id\":\"83\",\"username\":\"13545370960\"},{\"id\":\"86\",\"username\":\"13400000000\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1052', '2', '雷达', 'backend/navigation/friendlink/disable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u767e\\u5ea6\"},{\"id\":\"17\",\"title\":\"\\u6dd8\\u5b9d\\u7f51\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1053', '2', '雷达', 'backend/navigation/friendlink/enable', 'friend_link', null, '[{\"id\":\"3\",\"title\":\"\\u767e\\u5ea6\"},{\"id\":\"17\",\"title\":\"\\u6dd8\\u5b9d\\u7f51\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1054', '2', '雷达', 'backend/navigation/friendlink/del', 'friend_link', null, '[{\"id\":\"20\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1055', '2', '雷达', 'backend/navigation/friendlink/del', 'friend_link', null, '[{\"id\":\"19\",\"title\":\"\\u6dd8\\u5b9d\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1056', '2', '雷达', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1057', '2', '雷达', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1058', '2', '雷达', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1059', '2', '雷达', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1060', '2', '雷达', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"},{\"id\":\"30\",\"title\":\"\\u7279\\u8272\\u670d\\u52a1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1061', '2', '雷达', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"},{\"id\":\"30\",\"title\":\"\\u7279\\u8272\\u670d\\u52a1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1062', '2', '雷达', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1063', '2', '雷达', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"3\",\"title\":\"\\u65b0\\u624b\\u6307\\u5bfc\"},{\"id\":\"14\",\"title\":\"\\u6d4b\\u8bd5\\u5bfc\\u822a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1064', '2', '雷达', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"},{\"id\":\"30\",\"title\":\"\\u7279\\u8272\\u670d\\u52a1\"},{\"id\":\"31\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1065', '2', '雷达', 'backend/navigation/bottom/enable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"},{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"},{\"id\":\"30\",\"title\":\"\\u7279\\u8272\\u670d\\u52a1\"},{\"id\":\"31\",\"title\":\"\\u5173\\u4e8e\\u6211\\u4eec\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1066', '2', '雷达', 'backend/navigation/bottom/edit', 'navigation', null, '[{\"id\":\"29\",\"title\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1067', '2', '雷达', 'backend/navigation/bottom/add', 'navigation', null, '[{\"id\":\"37\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1068', '2', '雷达', 'backend/navigation/bottom/del', 'navigation', null, '[{\"id\":\"37\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1069', '2', '雷达', 'backend/product/brand/enable', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u5c0f\\u7c73\"},{\"id\":\"2\",\"title\":\"\\u9b45\\u65cf\"},{\"id\":\"3\",\"title\":\"OPPO\"},{\"id\":\"4\",\"title\":\"Vivo\"},{\"id\":\"5\",\"title\":\"\\u4e09\\u661f\"},{\"id\":\"6\",\"title\":\"ThinkPad\"},{\"id\":\"7\",\"title\":\"\\u4e50\\u89c6\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1070', '2', '雷达', 'backend/product/brand/disable', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u5c0f\\u7c73\"},{\"id\":\"2\",\"title\":\"\\u9b45\\u65cf\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1071', '2', '雷达', 'backend/product/brand/enable', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u5c0f\\u7c73\"},{\"id\":\"2\",\"title\":\"\\u9b45\\u65cf\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1072', '2', '雷达', 'backend/product/brand/disable', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u5c0f\\u7c73\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1073', '2', '雷达', 'backend/product/brand/enable', 'brand', null, '[{\"id\":\"1\",\"title\":\"\\u5c0f\\u7c73\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1074', '2', '雷达', 'backend/product/brand/del', 'brand', null, '[{\"id\":\"10\",\"title\":\"\\u96f7\\u8fbe\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1075', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1076', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"27\",\"title\":\"\\u65b0\\u95fb\\u8d44\\u8baf\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1077', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"35\",\"title\":\"\\u6d4b\\u8bd5\\u9996\\u9875\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1078', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"19\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1079', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"21\",\"title\":\"1\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1080', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"23\",\"title\":\"123\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1081', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"20\",\"title\":\"\\u6d4b\\u8bd5\\u4fe1\\u606f\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1082', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"18\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1083', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"9\",\"title\":\"\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1084', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"8\",\"title\":\"\\u65b0\\u54c1\\u9884\\u5b9a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1085', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1086', '1', 'admin', 'backend/navigation/index/disable', 'navigation', null, '[{\"id\":\"36\",\"title\":\"\\u6d4b\\u8bd5\\u6807\\u9898\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1087', '1', 'admin', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1088', '1', 'admin', 'backend/navigation/bottom/disable', 'navigation', null, '[{\"id\":\"14\",\"title\":\"\\u6d4b\\u8bd5\\u5bfc\\u822a\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1089', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1090', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"9\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa - \\u5c0f\\u7c73\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1091', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"10\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa - \\u8054\\u60f3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1092', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"11\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa - \\u82f9\\u679c\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1093', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1094', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1095', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1096', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1097', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1098', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1099', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1100', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"12\",\"title\":\"NIKE\\u4e13\\u5356\\u70b9\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1101', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1102', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"14\",\"title\":\"nikelist\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1103', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1104', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"},{\"id\":\"6\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1105', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1106', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1107', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1108', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"1\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1109', '1', 'admin', 'backend/shop/examine/enablel', 'shop', null, '[{\"id\":\"2\",\"title\":\"\\u6d4b\\u8bd5\\u5e97\\u94fa\"},{\"id\":\"3\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1110', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1111', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1112', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1113', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '127.0.0.1', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1114', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '171.43.202.55', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1115', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1116', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1117', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1118', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1119', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"29\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1120', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"9\",\"title\":\"\\u5e73\\u53f0\\u7ba1\\u7406\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1121', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"8\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1122', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"9\",\"title\":\"\\u5e73\\u53f0\\u7ba1\\u7406\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1123', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"9\",\"title\":\"\\u5e73\\u53f0\\u7ba1\\u7406\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1124', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1125', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1126', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1127', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1128', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1129', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1130', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1131', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1132', '1', 'admin', 'backend/usermanage/index/disable', 'member', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1133', '1', 'admin', 'backend/usermanage/index/enable', 'member', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1134', '1', 'admin', 'backend/usermanage/index/disable', 'member', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1135', '1', 'admin', 'backend/usermanage/index/enable', 'member', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1136', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1137', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1138', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"7\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1139', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1140', '1', 'admin', 'backend/catelabel/label/del', 'lable', null, '[{\"id\":\"7\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1141', '1', 'admin', 'backend/catelabel/label/del', 'lable', null, '[{\"id\":\"8\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1142', '1', 'admin', 'backend/catelabel/label/disable', 'lable', null, '[{\"id\":\"9\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1143', '1', 'admin', 'backend/catelabel/label/disable', 'lable', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1144', '1', 'admin', 'backend/catelabel/label/del', 'lable', null, '[{\"id\":\"9\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1145', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1146', '1', 'admin', 'backend/usermanage/index/disable', 'member', null, '[{\"id\":\"8\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1147', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"8\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1148', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1149', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1150', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1151', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '221.234.236.75', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1152', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '221.234.236.75', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1153', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '221.234.236.75', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1154', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1155', '1', 'admin', 'backend/catelabel/label/disable', 'lable', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1156', '1', 'admin', 'backend/catelabel/label/enable', 'lable', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1157', '1', 'admin', 'backend/catelabel/label/disable', 'lable', null, '[{\"id\":\"185\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1158', '1', 'admin', 'backend/catelabel/label/enable', 'lable', null, '[{\"id\":\"185\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1159', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1160', '1', 'admin', 'backend/usermanage/index/disable', 'member', null, '[{\"id\":\"79\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1161', '1', 'admin', 'backend/usermanage/index/enable', 'member', null, '[{\"id\":\"79\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1162', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"113\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1163', '1', 'admin', 'backend/catelabel/label/del', 'lable', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1164', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"220\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1165', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"220\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1166', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"123\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1167', '1', 'admin', 'backend/catelabel/cate/del', 'sensitive_words ', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1168', '1', 'admin', 'backend/catelabel/label/disable', 'lable', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1169', '1', 'admin', 'backend/catelabel/label/enable', 'lable', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1170', '1', 'admin', 'backend/catelabel/label/disable', 'lable', null, '[{\"id\":\"2\"},{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1171', '1', 'admin', 'backend/catelabel/label/enable', 'lable', null, '[{\"id\":\"2\"},{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1172', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '221.235.64.4', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1173', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"230\"}]', '221.235.64.4', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1174', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"230\"}]', '221.235.64.4', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1175', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1176', '1', 'admin', 'backend/catelabel/cate/disable', 'sensitive_words ', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1177', '1', 'admin', 'backend/catelabel/cate/enable', 'sensitive_words ', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1178', '1', 'admin', 'backend/catelabel/cate/del', 'sensitive_words ', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1179', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1180', '1', 'admin', 'backend/article/index/del', 'feed ', null, '[{\"id\":\"571\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1181', '1', 'admin', 'backend/article/comment/del', 'Comment', null, '[{\"id\":\"301\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1182', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"570\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1183', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"570\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1184', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"570\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1185', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"570\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1186', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1187', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1188', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1189', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1190', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1191', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1192', '1', 'admin', 'backend/article/index/del', 'feed ', null, '[{\"id\":\"573\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1193', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1194', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1195', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1196', '1', 'admin', 'backend/article/comment/del', 'Comment', null, '[{\"id\":\"302\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1197', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1198', '1', 'admin', 'backend/article/comment/del', 'Comment', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1199', '1', 'admin', 'backend/article/comment/del', 'Comment', null, '[{\"id\":\"303\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1200', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"112\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1201', '1', 'admin', 'backend/catelabel/label/del', 'lable', null, '[{\"id\":\"155\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1202', '1', 'admin', 'backend/catelabel/label/disable', 'lable', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1203', '1', 'admin', 'backend/catelabel/label/del', 'lable', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1204', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1205', '1', 'admin', 'backend/catelabel/cate/disable', 'sensitive_words ', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1206', '1', 'admin', 'backend/catelabel/cate/enable', 'sensitive_words ', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1207', '1', 'admin', 'backend/catelabel/cate/disable', 'sensitive_words ', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1208', '1', 'admin', 'backend/catelabel/cate/enable', 'sensitive_words ', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1209', '1', 'admin', 'backend/catelabel/cate/disable', 'sensitive_words ', null, '[{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1210', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"572\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1211', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"572\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1212', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"572\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1213', '1', 'admin', 'backend/catelabel/cate/del', 'sensitive_words ', null, '[{\"id\":\"5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1214', '1', 'admin', 'backend/catelabel/cate/enable', 'sensitive_words ', null, '[{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1215', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1216', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1217', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1218', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1219', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1220', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"7\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1221', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1222', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1223', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"4\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1224', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1225', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1226', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1227', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1228', '1', 'admin', 'backend/article/special/del', 'special', null, '[{\"id\":\"26\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1229', '1', 'admin', 'backend/article/special/del', 'special', null, '[{\"id\":\"31\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1230', '1', 'admin', 'backend/article/special/del', 'special', null, '[{\"id\":\"29\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1231', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"16\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1232', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1233', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1234', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1235', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"1\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1236', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"1\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1237', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"152\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1238', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"151\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1239', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"15\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1240', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"13\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1241', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"12\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1242', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"11\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1243', '1', 'admin', 'backend/catelabel/label/disable', 'lable', null, '[{\"id\":\"153\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1244', '1', 'admin', 'backend/catelabel/label/enable', 'lable', null, '[{\"id\":\"153\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1245', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1246', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1247', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1248', '1', 'admin', 'backend/catelabel/label/disable', 'lable', null, '[{\"id\":\"153\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1249', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"280\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1250', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"280\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1251', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"280\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1252', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"280\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1253', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"281\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1254', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"281\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1255', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"253\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1256', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1257', '1', 'admin', 'backend/base/menu/enable', 'menu', null, '[{\"id\":\"253\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1258', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1259', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1260', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1261', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1262', '1', 'admin', 'backend/catelabel/label/enable', 'lable', null, '[{\"id\":\"153\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1263', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1264', '1', 'admin', 'backend/catelabel/cate/del', 'sensitive_words ', null, '[{\"id\":\"7\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1265', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1266', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"539\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1267', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"539\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1268', '1', 'admin', 'backend/catelabel/label/del', 'lable', null, '[{\"id\":\"240\"},{\"id\":\"241\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1269', '1', 'admin', 'backend/usermanage/index/disable', 'member', null, '[{\"id\":\"88\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1270', '1', 'admin', 'backend/usermanage/index/disable', 'member', null, '[{\"id\":\"88\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1271', '1', 'admin', 'backend/usermanage/index/enable', 'member', null, '[{\"id\":\"88\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1272', '1', 'admin', 'backend/usermanage/index/enable', 'member', null, '[{\"id\":\"88\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1273', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"161\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1274', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"160\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1275', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"17\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1276', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"17\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1277', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"17\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1278', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"17\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1279', '1', 'admin', 'backend/usermanage/group/del', 'member_role', null, '[{\"id\":\"17\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1280', '1', 'admin', 'backend/catelabel/label/del', 'lable', null, '[{\"id\":\"244\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1281', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"9\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1282', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"9\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1283', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"9\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1284', '1', 'admin', 'backend/article/special/del', 'special', null, '[{\"id\":\"33\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1285', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1286', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1287', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1288', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"25\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1289', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"25\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1290', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"1\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1291', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"1\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1292', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"1\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1293', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1294', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1295', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1296', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"9\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1297', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"657\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1298', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"657\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1299', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1300', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1301', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"626\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1302', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"626\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1303', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"32\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1304', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1305', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1306', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1307', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1308', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1309', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1310', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1311', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1312', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1313', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1314', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1315', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1316', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1317', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1318', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"32\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1319', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"174\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1320', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"176\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1321', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"175\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1322', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"146\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1323', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1324', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1325', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1326', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1327', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1328', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1329', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"182\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1330', '1', 'admin', 'backend/catelabel/cate/disable', 'sensitive_words ', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1331', '1', 'admin', 'backend/catelabel/cate/enable', 'sensitive_words ', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1332', '1', 'admin', 'backend/catelabel/cate/enable', 'sensitive_words ', null, '[{\"id\":\"1\"},{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1333', '1', 'admin', 'backend/catelabel/cate/disable', 'sensitive_words ', null, '[{\"id\":\"3\"},{\"id\":\"4\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1334', '1', 'admin', 'backend/catelabel/cate/enable', 'sensitive_words ', null, '[{\"id\":\"3\"},{\"id\":\"4\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1335', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"588\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1336', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"588\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1337', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"583\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1338', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"583\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1339', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"706\"},{\"id\":\"707\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1340', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"706\"},{\"id\":\"707\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1341', '1', 'admin', 'backend/article/comment/del', 'Comment', null, '[{\"id\":\"307\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1342', '1', 'admin', 'backend/article/special/disable', 'special', null, '[{\"id\":\"1\"},{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1343', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1344', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1345', '1', 'admin', 'backend/article/special/enable', 'special', null, '[{\"id\":\"32\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1346', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1347', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"183\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1348', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1349', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1350', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1351', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"189\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1352', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"9\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1353', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"18\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1354', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"9\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1355', '1', 'admin', 'backend/catelabel/cate/disable', 'sensitive_words ', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1356', '1', 'admin', 'backend/catelabel/cate/enable', 'sensitive_words ', null, '[{\"id\":\"1\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1357', '1', 'admin', 'backend/catelabel/cate/disable', 'sensitive_words ', null, '[{\"id\":\"1\"},{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1358', '1', 'admin', 'backend/catelabel/cate/enable', 'sensitive_words ', null, '[{\"id\":\"1\"},{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1359', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"188\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1360', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1361', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1362', '1', 'admin', 'backend/article/comment/del', 'Comment', null, '[{\"id\":\"408\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1363', '1', 'admin', 'backend/usermanage/group/disable', 'member_role', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1364', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1365', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1366', '1', 'admin', 'backend/article/index/del', 'feed ', null, '[{\"id\":\"399\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1367', '1', 'admin', 'backend/article/index/del', 'feed ', null, '[{\"id\":\"399\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1368', '1', 'admin', 'backend/article/index/del', 'feed ', null, '[{\"id\":\"399\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1369', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1370', '1', 'admin', 'backend/article/index/del', 'feed ', null, '[{\"id\":\"459\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1371', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1372', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1373', '1', 'admin', 'backend/article/index/disable', 'feed ', null, '[{\"id\":\"633\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1374', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"633\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1375', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"190\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1376', '1', 'admin', 'backend/usermanage/group/enable', 'member_role', null, '[{\"id\":\"18\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1377', '1', 'admin', 'backend/help/faq/disable', 'faq', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1378', '1', 'admin', 'backend/help/faq/enable', 'faq', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1379', '1', 'admin', 'backend/help/faq/disable', 'faq', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1380', '1', 'admin', 'backend/help/faq/enable', 'faq', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1381', '1', 'admin', 'backend/help/faq/del', 'faq', null, '[{\"id\":\"4\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1382', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"8\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1383', '1', 'admin', 'backend/help/faq/disable', 'faq', null, '[{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1384', '1', 'admin', 'backend/help/faq/enable', 'faq', null, '[{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1385', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1386', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1387', '1', 'admin', 'backend/base/group/del', 'role', null, '[{\"id\":\"23\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1388', '1', 'admin', 'backend/base/group/del', 'role', null, '[{\"id\":\"23\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1389', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1390', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1391', '1', 'admin', 'backend/help/faq/disable', 'faq', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1392', '1', 'admin', 'backend/help/faq/enable', 'faq', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1393', '1', 'admin', 'backend/help/faq/disable', 'faq', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1394', '1', 'admin', 'backend/help/faq/enable', 'faq', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1395', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"7\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1396', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"6\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1397', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"5\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1398', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1399', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1400', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1401', '1', 'admin', 'backend/base/menu/disable', 'menu', null, '[{\"id\":\"238\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1402', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"45\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1403', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"45\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1404', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"45\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1405', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"45\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1406', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"45\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1407', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"45\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1408', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1409', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.178.89', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1410', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1411', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1412', '1', 'admin', 'backend/help/faq/disable', 'faq', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1413', '1', 'admin', 'backend/help/faq/enable', 'faq', null, '[{\"id\":\"2\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1414', '1', 'admin', 'backend/help/faq/enable', 'faq', null, '[{\"id\":\"2\"},{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1415', '1', 'admin', 'backend/help/faq/disable', 'faq', null, '[{\"id\":\"2\"},{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1416', '1', 'admin', 'backend/help/faq/enable', 'faq', null, '[{\"id\":\"2\"},{\"id\":\"3\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1417', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"4\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1418', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"10\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1419', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"51\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1420', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"50\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1421', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"49\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1422', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"14\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1423', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"15\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1424', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"16\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1425', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"17\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1426', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"22\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1427', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"21\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1428', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"20\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1429', '1', 'admin', 'backend/help/feedback/del', 'feedback', null, '[{\"id\":\"19\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1430', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1431', '1', 'admin', 'backend/base/menu/del', 'menu', null, 'null', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1432', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1433', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1434', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1435', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '192.168.2.11', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1436', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '192.168.1.6', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1437', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1438', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1439', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1440', '1', 'admin', 'backend/article/index/enable', 'feed ', null, '[{\"id\":\"813\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1441', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1442', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1443', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1444', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1445', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1446', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1447', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1448', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1449', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1450', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1451', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1452', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1453', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1454', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1455', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1456', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"227\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1457', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"225\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1458', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"224\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1459', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"223\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1460', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"226\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1461', '1', 'admin', 'backend/usermanage/index/del', 'member', null, 'null', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1462', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"232\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1463', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"236\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1464', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1465', '1', 'admin', 'backend/article/special/del', 'special', null, '[{\"id\":\"21\"},{\"id\":\"23\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1466', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"235\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1467', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1468', '1', 'admin', 'backend/help/faq/del', 'faq', null, '[{\"id\":\"1\"},{\"id\":\"2\"},{\"id\":\"3\"},{\"id\":\"5\"},{\"id\":\"6\"},{\"id\":\"7\"},{\"id\":\"8\"},{\"id\":\"9\"},{\"id\":\"11\"},{\"id\":\"12\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1469', '1', 'admin', 'backend/help/faq/del', 'faq', null, '[{\"id\":\"10\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1470', '1', 'admin', 'backend/article/special/del', 'special', null, '[{\"id\":\"3\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1471', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"239\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1472', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"237\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1473', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"242\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1474', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"241\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1475', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"244\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1476', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"243\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1477', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"246\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1478', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"245\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1479', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1480', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"248\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1481', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"247\"}]', '59.174.77.167', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1482', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '111.175.73.73', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1483', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '221.232.169.253', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1484', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '221.232.169.253', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1485', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '27.19.161.68', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1486', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"259\"}]', '27.19.161.68', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1487', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"260\"}]', '27.19.161.68', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1488', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"261\"}]', '27.19.161.68', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1489', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"262\"}]', '27.19.161.68', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1490', '1', 'admin', 'backend/usermanage/index/del', 'member', null, '[{\"id\":\"263\"}]', '27.19.161.68', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1491', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '59.173.68.152', '0', '0', '0');
INSERT INTO `sr_action_log` VALUES ('1492', '1', 'admin', 'backend/base/public/login', 'admin', null, '[{\"id\":\"1\",\"title\":\"admin\"}]', '0.0.0.0', '0', '0', '0');

-- ----------------------------
-- Table structure for sr_admin
-- ----------------------------
DROP TABLE IF EXISTS `sr_admin`;
CREATE TABLE `sr_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱号',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `nickname` varchar(80) NOT NULL DEFAULT '' COMMENT '昵称',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `realname` varchar(100) NOT NULL DEFAULT '' COMMENT '用户真实姓名',
  `role_id` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组ID',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(6) NOT NULL DEFAULT '' COMMENT '密码加密串',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `rules` text COMMENT '后台菜单ID',
  `reg_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '注册ip',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  `login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '支付密码',
  `login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(20)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台管理员用户表\r\n记录所有用户信息';

-- ----------------------------
-- Records of sr_admin
-- ----------------------------
INSERT INTO `sr_admin` VALUES ('1', '0', '13593894421', '', 'admin', '', '5', '9db06bcff9248837f86d1a6bcf41c9e7', '', '', '192,206,207,208', '', '4294967295', '0', '0', '0.0.0.0', '2016');
INSERT INTO `sr_admin` VALUES ('2', '', '', '', '雷达', '', '8', '9db06bcff9248837f86d1a6bcf41c9e7', '', '', null, '', '0', '0', '0', '171.43.202.55', '2016');
INSERT INTO `sr_admin` VALUES ('3', '', '', '', '吴楠', '', '8', '9db06bcff9248837f86d1a6bcf41c9e7', '', '', null, '', '0', '0', '0', '171.43.202.55', '2016');
INSERT INTO `sr_admin` VALUES ('4', '', '', '', '', '', '0', '', '', '', '1,38,39,40,41,42,43,51,52,53,54,55,56,75,76,77,78,79,80,8,22,107,109,110,108,111,87,90,92,93,91,94,95,88,96,98,99,97,100,101,89,102,104,105,103,106,9,10,12,13,14,15,16,11,17,18,19,20,21,23,24,25,26,27,28,113,114,115,132,134,135,136,137,138,219,221,222,225,230,29,159,160,30,31,32,33,34,35,36,37,45,46,48,49,44,47,146,147,150,151,149,152,153,154,156,157,155,158,50,57,59,60,58,61,62,63,65,66,64,67,74,82,84,85,83,86,133,139,141,142,140,143', '', '0', '0', '0', '', '0');

-- ----------------------------
-- Table structure for sr_area
-- ----------------------------
DROP TABLE IF EXISTS `sr_area`;
CREATE TABLE `sr_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 省 1 市 2 区',
  `path` varchar(30) NOT NULL DEFAULT '' COMMENT '分类的路径：\r\nid：1 ==== -0- 湖北\r\nid：2 ==== -0-1- 武汉\r\nid：3 ==== -0-1-2- 武昌区\r\nid：4 ==== -0-1-2- 汉口区',
  `first_char` char(1) NOT NULL DEFAULT '' COMMENT '首字母',
  `group` char(4) NOT NULL DEFAULT '' COMMENT '地区分组',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序（由大到小）',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0待审核,2审核成功,1审核失败',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3222 DEFAULT CHARSET=utf8 COMMENT='基础地区表';

-- ----------------------------
-- Records of sr_area
-- ----------------------------
INSERT INTO `sr_area` VALUES ('1', '0', '北京', '0', '-0-', 'B', '华北', '0', '1458283436', '0', '0');
INSERT INTO `sr_area` VALUES ('2', '1', '北京市', '1', '-0-1-', 'B', '', '0', '1458283437', '0', '0');
INSERT INTO `sr_area` VALUES ('3', '4', '东城', '3', '-0-1-2-', 'D', '', '0', '1458283438', '0', '0');
INSERT INTO `sr_area` VALUES ('4', '2', '西城区', '2', '-0-1-2-', 'X', '', '0', '1458283439', '0', '0');
INSERT INTO `sr_area` VALUES ('5', '2', '崇文区', '2', '-0-1-2-', 'C', '', '0', '1458283440', '0', '0');
INSERT INTO `sr_area` VALUES ('6', '2', '宣武区', '2', '-0-1-2-', 'X', '', '0', '1458283441', '0', '0');
INSERT INTO `sr_area` VALUES ('7', '2', '朝阳区', '2', '-0-1-2-', 'C', '', '0', '1458283442', '0', '0');
INSERT INTO `sr_area` VALUES ('8', '2', '丰台区', '2', '-0-1-2-', 'F', '', '0', '1458283443', '0', '0');
INSERT INTO `sr_area` VALUES ('9', '2', '石景山区', '2', '-0-1-2-', 'S', '', '0', '1458283444', '0', '0');
INSERT INTO `sr_area` VALUES ('10', '2', '海淀区', '2', '-0-1-2-', 'H', '', '0', '1458283445', '0', '0');
INSERT INTO `sr_area` VALUES ('11', '2', '门头沟区', '2', '-0-1-2-', 'M', '', '0', '1458283446', '0', '0');
INSERT INTO `sr_area` VALUES ('12', '2', '房山区', '2', '-0-1-2-', 'F', '', '0', '1458283447', '0', '0');
INSERT INTO `sr_area` VALUES ('13', '2', '通州区', '2', '-0-1-2-', 'T', '', '0', '1458283448', '0', '0');
INSERT INTO `sr_area` VALUES ('14', '2', '顺义区', '2', '-0-1-2-', 'S', '', '0', '1458283449', '0', '0');
INSERT INTO `sr_area` VALUES ('15', '2', '昌平区', '2', '-0-1-2-', 'C', '', '0', '1458283450', '0', '0');
INSERT INTO `sr_area` VALUES ('16', '2', '大兴区', '2', '-0-1-2-', 'D', '', '0', '1458283451', '0', '0');
INSERT INTO `sr_area` VALUES ('17', '2', '怀柔区', '2', '-0-1-2-', 'H', '', '0', '1458283452', '0', '0');
INSERT INTO `sr_area` VALUES ('18', '2', '平谷区', '2', '-0-1-2-', 'P', '', '0', '1458283453', '0', '0');
INSERT INTO `sr_area` VALUES ('19', '2', '密云县', '2', '-0-1-2-', 'M', '', '0', '1458283454', '0', '0');
INSERT INTO `sr_area` VALUES ('20', '2', '延庆县', '2', '-0-1-2-', 'Y', '', '0', '1458283455', '0', '0');
INSERT INTO `sr_area` VALUES ('21', '0', '天津', '0', '-0-', 'T', '华北', '0', '1458283456', '0', '0');
INSERT INTO `sr_area` VALUES ('22', '21', '天津市', '1', '-0-21-', 'T', '', '0', '1458283457', '0', '0');
INSERT INTO `sr_area` VALUES ('23', '22', '和平区', '2', '-0-21-22-', 'H', '', '0', '1458283458', '0', '0');
INSERT INTO `sr_area` VALUES ('24', '22', '河东区', '2', '-0-21-22-', 'H', '', '0', '1458283459', '0', '0');
INSERT INTO `sr_area` VALUES ('25', '22', '河西区', '2', '-0-21-22-', 'H', '', '0', '1458283460', '0', '0');
INSERT INTO `sr_area` VALUES ('26', '22', '南开区', '2', '-0-21-22-', 'N', '', '0', '1458283461', '0', '0');
INSERT INTO `sr_area` VALUES ('27', '22', '河北区', '2', '-0-21-22-', 'H', '', '0', '1458283462', '0', '0');
INSERT INTO `sr_area` VALUES ('28', '22', '红桥区', '2', '-0-21-22-', 'H', '', '0', '1458283463', '0', '0');
INSERT INTO `sr_area` VALUES ('29', '22', '塘沽区', '2', '-0-21-22-', 'T', '', '0', '1458283464', '0', '0');
INSERT INTO `sr_area` VALUES ('30', '22', '汉沽区', '2', '-0-21-22-', 'H', '', '0', '1458283465', '0', '0');
INSERT INTO `sr_area` VALUES ('31', '22', '大港区', '2', '-0-21-22-', 'D', '', '0', '1458283466', '0', '0');
INSERT INTO `sr_area` VALUES ('32', '22', '东丽区', '2', '-0-21-22-', 'D', '', '0', '1458283467', '0', '0');
INSERT INTO `sr_area` VALUES ('33', '22', '西青区', '2', '-0-21-22-', 'X', '', '0', '1458283468', '0', '0');
INSERT INTO `sr_area` VALUES ('34', '22', '津南区', '2', '-0-21-22-', 'J', '', '0', '1458283469', '0', '0');
INSERT INTO `sr_area` VALUES ('35', '22', '北辰区', '2', '-0-21-22-', 'B', '', '0', '1458283470', '0', '0');
INSERT INTO `sr_area` VALUES ('36', '22', '武清区', '2', '-0-21-22-', 'W', '', '0', '1458283471', '0', '0');
INSERT INTO `sr_area` VALUES ('37', '22', '宝坻区', '2', '-0-21-22-', 'B', '', '0', '1458283472', '0', '0');
INSERT INTO `sr_area` VALUES ('38', '22', '宁河县', '2', '-0-21-22-', 'N', '', '0', '1458283473', '0', '0');
INSERT INTO `sr_area` VALUES ('39', '22', '静海县', '2', '-0-21-22-', 'J', '', '0', '1458283474', '0', '0');
INSERT INTO `sr_area` VALUES ('40', '22', '蓟县', '2', '-0-21-22-', 'J', '', '0', '1458283475', '0', '0');
INSERT INTO `sr_area` VALUES ('41', '0', '河北', '0', '-0-', 'H', '华北', '0', '1458283476', '0', '0');
INSERT INTO `sr_area` VALUES ('42', '41', '石家庄市', '1', '-0-41-', 'S', '', '0', '1458283477', '0', '0');
INSERT INTO `sr_area` VALUES ('43', '42', '长安区', '2', '-0-41-42-', 'C', '', '0', '1458283478', '0', '0');
INSERT INTO `sr_area` VALUES ('44', '42', '桥东区', '2', '-0-41-42-', 'Q', '', '0', '1458283479', '0', '0');
INSERT INTO `sr_area` VALUES ('45', '42', '桥西区', '2', '-0-41-42-', 'Q', '', '0', '1458283480', '0', '0');
INSERT INTO `sr_area` VALUES ('46', '42', '新华区', '2', '-0-41-42-', 'X', '', '0', '1458283481', '0', '0');
INSERT INTO `sr_area` VALUES ('47', '42', '井陉矿区', '2', '-0-41-42-', 'J', '', '0', '1458283482', '0', '0');
INSERT INTO `sr_area` VALUES ('48', '42', '裕华区', '2', '-0-41-42-', 'Y', '', '0', '1458283483', '0', '0');
INSERT INTO `sr_area` VALUES ('49', '42', '井陉县', '2', '-0-41-42-', 'J', '', '0', '1458283484', '0', '0');
INSERT INTO `sr_area` VALUES ('50', '42', '正定县', '2', '-0-41-42-', 'Z', '', '0', '1458283485', '0', '0');
INSERT INTO `sr_area` VALUES ('51', '42', '栾城县', '2', '-0-41-42-', 'L', '', '0', '1458283486', '0', '0');
INSERT INTO `sr_area` VALUES ('52', '42', '行唐县', '2', '-0-41-42-', 'X', '', '0', '1458283487', '0', '0');
INSERT INTO `sr_area` VALUES ('53', '42', '灵寿县', '2', '-0-41-42-', 'L', '', '0', '1458283488', '0', '0');
INSERT INTO `sr_area` VALUES ('54', '42', '高邑县', '2', '-0-41-42-', 'G', '', '0', '1458283489', '0', '0');
INSERT INTO `sr_area` VALUES ('55', '42', '深泽县', '2', '-0-41-42-', 'S', '', '0', '1458283490', '0', '0');
INSERT INTO `sr_area` VALUES ('56', '42', '赞皇县', '2', '-0-41-42-', 'Z', '', '0', '1458283491', '0', '0');
INSERT INTO `sr_area` VALUES ('57', '42', '无极县', '2', '-0-41-42-', 'W', '', '0', '1458283492', '0', '0');
INSERT INTO `sr_area` VALUES ('58', '42', '平山县', '2', '-0-41-42-', 'P', '', '0', '1458283493', '0', '0');
INSERT INTO `sr_area` VALUES ('59', '42', '元氏县', '2', '-0-41-42-', 'Y', '', '0', '1458283494', '0', '0');
INSERT INTO `sr_area` VALUES ('60', '42', '赵县', '2', '-0-41-42-', 'Z', '', '0', '1458283495', '0', '0');
INSERT INTO `sr_area` VALUES ('61', '42', '辛集市', '2', '-0-41-42-', 'X', '', '0', '1458283496', '0', '0');
INSERT INTO `sr_area` VALUES ('62', '42', '藁城市', '2', '-0-41-42-', 'G', '', '0', '1458283497', '0', '0');
INSERT INTO `sr_area` VALUES ('63', '42', '晋州市', '2', '-0-41-42-', 'J', '', '0', '1458283498', '0', '0');
INSERT INTO `sr_area` VALUES ('64', '42', '新乐市', '2', '-0-41-42-', 'X', '', '0', '1458283499', '0', '0');
INSERT INTO `sr_area` VALUES ('65', '42', '鹿泉市', '2', '-0-41-42-', 'L', '', '0', '1458283500', '0', '0');
INSERT INTO `sr_area` VALUES ('66', '41', '唐山市', '1', '-0-41-', 'T', '', '0', '1458283501', '0', '0');
INSERT INTO `sr_area` VALUES ('67', '66', '路南区', '2', '-0-41-66-', 'L', '', '0', '1458283502', '0', '0');
INSERT INTO `sr_area` VALUES ('68', '66', '路北区', '2', '-0-41-66-', 'L', '', '0', '1458283503', '0', '0');
INSERT INTO `sr_area` VALUES ('69', '66', '古冶区', '2', '-0-41-66-', 'G', '', '0', '1458283504', '0', '0');
INSERT INTO `sr_area` VALUES ('70', '66', '开平区', '2', '-0-41-66-', 'K', '', '0', '1458283505', '0', '0');
INSERT INTO `sr_area` VALUES ('71', '66', '丰南区', '2', '-0-41-66-', 'F', '', '0', '1458283506', '0', '0');
INSERT INTO `sr_area` VALUES ('72', '66', '丰润区', '2', '-0-41-66-', 'F', '', '0', '1458283507', '0', '0');
INSERT INTO `sr_area` VALUES ('73', '66', '滦县', '2', '-0-41-66-', 'L', '', '0', '1458283508', '0', '0');
INSERT INTO `sr_area` VALUES ('74', '66', '滦南县', '2', '-0-41-66-', 'L', '', '0', '1458283509', '0', '0');
INSERT INTO `sr_area` VALUES ('75', '66', '乐亭县', '2', '-0-41-66-', 'L', '', '0', '1458283510', '0', '0');
INSERT INTO `sr_area` VALUES ('76', '66', '迁西县', '2', '-0-41-66-', 'Q', '', '0', '1458283511', '0', '0');
INSERT INTO `sr_area` VALUES ('77', '66', '玉田县', '2', '-0-41-66-', 'Y', '', '0', '1458283512', '0', '0');
INSERT INTO `sr_area` VALUES ('78', '66', '唐海县', '2', '-0-41-66-', 'T', '', '0', '1458283513', '0', '0');
INSERT INTO `sr_area` VALUES ('79', '66', '遵化市', '2', '-0-41-66-', 'Z', '', '0', '1458283514', '0', '0');
INSERT INTO `sr_area` VALUES ('80', '66', '迁安市', '2', '-0-41-66-', 'Q', '', '0', '1458283515', '0', '0');
INSERT INTO `sr_area` VALUES ('81', '41', '秦皇岛市', '1', '-0-41-', 'Q', '', '0', '1458283516', '0', '0');
INSERT INTO `sr_area` VALUES ('82', '81', '海港区', '2', '-0-41-81-', 'H', '', '0', '1458283517', '0', '0');
INSERT INTO `sr_area` VALUES ('83', '81', '山海关区', '2', '-0-41-81-', 'S', '', '0', '1458283518', '0', '0');
INSERT INTO `sr_area` VALUES ('84', '81', '北戴河区', '2', '-0-41-81-', 'B', '', '0', '1458283519', '0', '0');
INSERT INTO `sr_area` VALUES ('85', '81', '青龙满族自治县', '2', '-0-41-81-', 'Q', '', '0', '1458283520', '0', '0');
INSERT INTO `sr_area` VALUES ('86', '81', '昌黎县', '2', '-0-41-81-', 'C', '', '0', '1458283521', '0', '0');
INSERT INTO `sr_area` VALUES ('87', '81', '抚宁县', '2', '-0-41-81-', 'F', '', '0', '1458283522', '0', '0');
INSERT INTO `sr_area` VALUES ('88', '81', '卢龙县', '2', '-0-41-81-', 'L', '', '0', '1458283523', '0', '0');
INSERT INTO `sr_area` VALUES ('89', '41', '邯郸市', '1', '-0-41-', 'H', '', '0', '1458283524', '0', '0');
INSERT INTO `sr_area` VALUES ('90', '89', '邯山区', '2', '-0-41-89-', 'H', '', '0', '1458283525', '0', '0');
INSERT INTO `sr_area` VALUES ('91', '89', '丛台区', '2', '-0-41-89-', 'C', '', '0', '1458283526', '0', '0');
INSERT INTO `sr_area` VALUES ('92', '89', '复兴区', '2', '-0-41-89-', 'F', '', '0', '1458283527', '0', '0');
INSERT INTO `sr_area` VALUES ('93', '89', '峰峰矿区', '2', '-0-41-89-', 'F', '', '0', '1458283528', '0', '0');
INSERT INTO `sr_area` VALUES ('94', '89', '邯郸县', '2', '-0-41-89-', 'H', '', '0', '1458283529', '0', '0');
INSERT INTO `sr_area` VALUES ('95', '89', '临漳县', '2', '-0-41-89-', 'L', '', '0', '1458283530', '0', '0');
INSERT INTO `sr_area` VALUES ('96', '89', '成安县', '2', '-0-41-89-', 'C', '', '0', '1458283531', '0', '0');
INSERT INTO `sr_area` VALUES ('97', '89', '大名县', '2', '-0-41-89-', 'D', '', '0', '1458283532', '0', '0');
INSERT INTO `sr_area` VALUES ('98', '89', '涉县', '2', '-0-41-89-', 'S', '', '0', '1458283533', '0', '0');
INSERT INTO `sr_area` VALUES ('99', '89', '磁县', '2', '-0-41-89-', 'C', '', '0', '1458283534', '0', '0');
INSERT INTO `sr_area` VALUES ('100', '89', '肥乡县', '2', '-0-41-89-', 'F', '', '0', '1458283535', '0', '0');
INSERT INTO `sr_area` VALUES ('101', '89', '永年县', '2', '-0-41-89-', 'Y', '', '0', '1458283536', '0', '0');
INSERT INTO `sr_area` VALUES ('102', '89', '邱县', '2', '-0-41-89-', 'Q', '', '0', '1458283537', '0', '0');
INSERT INTO `sr_area` VALUES ('103', '89', '鸡泽县', '2', '-0-41-89-', 'J', '', '0', '1458283538', '0', '0');
INSERT INTO `sr_area` VALUES ('104', '89', '广平县', '2', '-0-41-89-', 'G', '', '0', '1458283539', '0', '0');
INSERT INTO `sr_area` VALUES ('105', '89', '馆陶县', '2', '-0-41-89-', 'G', '', '0', '1458283540', '0', '0');
INSERT INTO `sr_area` VALUES ('106', '89', '魏县', '2', '-0-41-89-', 'W', '', '0', '1458283541', '0', '0');
INSERT INTO `sr_area` VALUES ('107', '89', '曲周县', '2', '-0-41-89-', 'Q', '', '0', '1458283542', '0', '0');
INSERT INTO `sr_area` VALUES ('108', '89', '武安市', '2', '-0-41-89-', 'W', '', '0', '1458283543', '0', '0');
INSERT INTO `sr_area` VALUES ('109', '41', '邢台市', '1', '-0-41-', 'X', '', '0', '1458283544', '0', '0');
INSERT INTO `sr_area` VALUES ('110', '109', '桥东区', '2', '-0-41-109-', 'Q', '', '0', '1458283545', '0', '0');
INSERT INTO `sr_area` VALUES ('111', '109', '桥西区', '2', '-0-41-109-', 'Q', '', '0', '1458283546', '0', '0');
INSERT INTO `sr_area` VALUES ('112', '109', '邢台县', '2', '-0-41-109-', 'X', '', '0', '1458283547', '0', '0');
INSERT INTO `sr_area` VALUES ('113', '109', '临城县', '2', '-0-41-109-', 'L', '', '0', '1458283548', '0', '0');
INSERT INTO `sr_area` VALUES ('114', '109', '内丘县', '2', '-0-41-109-', 'N', '', '0', '1458283549', '0', '0');
INSERT INTO `sr_area` VALUES ('115', '109', '柏乡县', '2', '-0-41-109-', 'B', '', '0', '1458283550', '0', '0');
INSERT INTO `sr_area` VALUES ('116', '109', '隆尧县', '2', '-0-41-109-', 'L', '', '0', '1458283551', '0', '0');
INSERT INTO `sr_area` VALUES ('117', '109', '任县', '2', '-0-41-109-', 'R', '', '0', '1458283552', '0', '0');
INSERT INTO `sr_area` VALUES ('118', '109', '南和县', '2', '-0-41-109-', 'N', '', '0', '1458283553', '0', '0');
INSERT INTO `sr_area` VALUES ('119', '109', '宁晋县', '2', '-0-41-109-', 'N', '', '0', '1458283554', '0', '0');
INSERT INTO `sr_area` VALUES ('120', '109', '巨鹿县', '2', '-0-41-109-', 'J', '', '0', '1458283555', '0', '0');
INSERT INTO `sr_area` VALUES ('121', '109', '新河县', '2', '-0-41-109-', 'X', '', '0', '1458283556', '0', '0');
INSERT INTO `sr_area` VALUES ('122', '109', '广宗县', '2', '-0-41-109-', 'G', '', '0', '1458283557', '0', '0');
INSERT INTO `sr_area` VALUES ('123', '109', '平乡县', '2', '-0-41-109-', 'P', '', '0', '1458283558', '0', '0');
INSERT INTO `sr_area` VALUES ('124', '109', '威县', '2', '-0-41-109-', 'W', '', '0', '1458283559', '0', '0');
INSERT INTO `sr_area` VALUES ('125', '109', '清河县', '2', '-0-41-109-', 'Q', '', '0', '1458283560', '0', '0');
INSERT INTO `sr_area` VALUES ('126', '109', '临西县', '2', '-0-41-109-', 'L', '', '0', '1458283561', '0', '0');
INSERT INTO `sr_area` VALUES ('127', '109', '南宫市', '2', '-0-41-109-', 'N', '', '0', '1458283562', '0', '0');
INSERT INTO `sr_area` VALUES ('128', '109', '沙河市', '2', '-0-41-109-', 'S', '', '0', '1458283563', '0', '0');
INSERT INTO `sr_area` VALUES ('129', '41', '保定市', '1', '-0-41-', 'B', '', '0', '1458283564', '0', '0');
INSERT INTO `sr_area` VALUES ('130', '129', '新市区', '2', '-0-41-129-', 'X', '', '0', '1458283565', '0', '0');
INSERT INTO `sr_area` VALUES ('131', '129', '北市区', '2', '-0-41-129-', 'B', '', '0', '1458283566', '0', '0');
INSERT INTO `sr_area` VALUES ('132', '129', '南市区', '2', '-0-41-129-', 'N', '', '0', '1458283567', '0', '0');
INSERT INTO `sr_area` VALUES ('133', '129', '满城县', '2', '-0-41-129-', 'M', '', '0', '1458283568', '0', '0');
INSERT INTO `sr_area` VALUES ('134', '129', '清苑县', '2', '-0-41-129-', 'Q', '', '0', '1458283569', '0', '0');
INSERT INTO `sr_area` VALUES ('135', '129', '涞水县', '2', '-0-41-129-', 'L', '', '0', '1458283570', '0', '0');
INSERT INTO `sr_area` VALUES ('136', '129', '阜平县', '2', '-0-41-129-', 'F', '', '0', '1458283571', '0', '0');
INSERT INTO `sr_area` VALUES ('137', '129', '徐水县', '2', '-0-41-129-', 'X', '', '0', '1458283572', '0', '0');
INSERT INTO `sr_area` VALUES ('138', '129', '定兴县', '2', '-0-41-129-', 'D', '', '0', '1458283573', '0', '0');
INSERT INTO `sr_area` VALUES ('139', '129', '唐县', '2', '-0-41-129-', 'T', '', '0', '1458283574', '0', '0');
INSERT INTO `sr_area` VALUES ('140', '129', '高阳县', '2', '-0-41-129-', 'G', '', '0', '1458283575', '0', '0');
INSERT INTO `sr_area` VALUES ('141', '129', '容城县', '2', '-0-41-129-', 'R', '', '0', '1458283576', '0', '0');
INSERT INTO `sr_area` VALUES ('142', '129', '涞源县', '2', '-0-41-129-', 'L', '', '0', '1458283577', '0', '0');
INSERT INTO `sr_area` VALUES ('143', '129', '望都县', '2', '-0-41-129-', 'W', '', '0', '1458283578', '0', '0');
INSERT INTO `sr_area` VALUES ('144', '129', '安新县', '2', '-0-41-129-', 'A', '', '0', '1458283579', '0', '0');
INSERT INTO `sr_area` VALUES ('145', '129', '易县', '2', '-0-41-129-', 'Y', '', '0', '1458283580', '0', '0');
INSERT INTO `sr_area` VALUES ('146', '129', '曲阳县', '2', '-0-41-129-', 'Q', '', '0', '1458283581', '0', '0');
INSERT INTO `sr_area` VALUES ('147', '129', '蠡县', '2', '-0-41-129-', 'L', '', '0', '1458283582', '0', '0');
INSERT INTO `sr_area` VALUES ('148', '129', '顺平县', '2', '-0-41-129-', 'S', '', '0', '1458283583', '0', '0');
INSERT INTO `sr_area` VALUES ('149', '129', '博野县', '2', '-0-41-129-', 'B', '', '0', '1458283584', '0', '0');
INSERT INTO `sr_area` VALUES ('150', '129', '雄县', '2', '-0-41-129-', 'X', '', '0', '1458283585', '0', '0');
INSERT INTO `sr_area` VALUES ('151', '129', '涿州市', '2', '-0-41-129-', '', '', '0', '1458283586', '0', '0');
INSERT INTO `sr_area` VALUES ('152', '129', '定州市', '2', '-0-41-129-', 'D', '', '0', '1458283587', '0', '0');
INSERT INTO `sr_area` VALUES ('153', '129', '安国市', '2', '-0-41-129-', 'A', '', '0', '1458283588', '0', '0');
INSERT INTO `sr_area` VALUES ('154', '129', '高碑店市', '2', '-0-41-129-', 'G', '', '0', '1458283589', '0', '0');
INSERT INTO `sr_area` VALUES ('155', '41', '张家口市', '1', '-0-41-', 'Z', '', '0', '1458283590', '0', '0');
INSERT INTO `sr_area` VALUES ('156', '155', '桥东区', '2', '-0-41-155-', 'Q', '', '0', '1458283591', '0', '0');
INSERT INTO `sr_area` VALUES ('157', '155', '桥西区', '2', '-0-41-155-', 'Q', '', '0', '1458283592', '0', '0');
INSERT INTO `sr_area` VALUES ('158', '155', '宣化区', '2', '-0-41-155-', 'X', '', '0', '1458283593', '0', '0');
INSERT INTO `sr_area` VALUES ('159', '155', '下花园区', '2', '-0-41-155-', 'X', '', '0', '1458283594', '0', '0');
INSERT INTO `sr_area` VALUES ('160', '155', '宣化县', '2', '-0-41-155-', 'X', '', '0', '1458283595', '0', '0');
INSERT INTO `sr_area` VALUES ('161', '155', '张北县', '2', '-0-41-155-', 'Z', '', '0', '1458283596', '0', '0');
INSERT INTO `sr_area` VALUES ('162', '155', '康保县', '2', '-0-41-155-', 'K', '', '0', '1458283597', '0', '0');
INSERT INTO `sr_area` VALUES ('163', '155', '沽源县', '2', '-0-41-155-', 'G', '', '0', '1458283598', '0', '0');
INSERT INTO `sr_area` VALUES ('164', '155', '尚义县', '2', '-0-41-155-', 'S', '', '0', '1458283599', '0', '0');
INSERT INTO `sr_area` VALUES ('165', '155', '蔚县', '2', '-0-41-155-', 'W', '', '0', '1458283600', '0', '0');
INSERT INTO `sr_area` VALUES ('166', '155', '阳原县', '2', '-0-41-155-', 'Y', '', '0', '1458283601', '0', '0');
INSERT INTO `sr_area` VALUES ('167', '155', '怀安县', '2', '-0-41-155-', 'H', '', '0', '1458283602', '0', '0');
INSERT INTO `sr_area` VALUES ('168', '155', '万全县', '2', '-0-41-155-', 'W', '', '0', '1458283603', '0', '0');
INSERT INTO `sr_area` VALUES ('169', '155', '怀来县', '2', '-0-41-155-', 'H', '', '0', '1458283604', '0', '0');
INSERT INTO `sr_area` VALUES ('170', '155', '涿鹿县', '2', '-0-41-155-', '', '', '0', '1458283605', '0', '0');
INSERT INTO `sr_area` VALUES ('171', '155', '赤城县', '2', '-0-41-155-', 'C', '', '0', '1458283606', '0', '0');
INSERT INTO `sr_area` VALUES ('172', '155', '崇礼县', '2', '-0-41-155-', 'C', '', '0', '1458283607', '0', '0');
INSERT INTO `sr_area` VALUES ('173', '41', '承德市', '1', '-0-41-', 'C', '', '0', '1458283608', '0', '0');
INSERT INTO `sr_area` VALUES ('174', '173', '双桥区', '2', '-0-41-173-', 'S', '', '0', '1458283609', '0', '0');
INSERT INTO `sr_area` VALUES ('175', '173', '双滦区', '2', '-0-41-173-', 'S', '', '0', '1458283610', '0', '0');
INSERT INTO `sr_area` VALUES ('176', '173', '鹰手营子矿区', '2', '-0-41-173-', 'Y', '', '0', '1458283611', '0', '0');
INSERT INTO `sr_area` VALUES ('177', '173', '承德县', '2', '-0-41-173-', 'C', '', '0', '1458283612', '0', '0');
INSERT INTO `sr_area` VALUES ('178', '173', '兴隆县', '2', '-0-41-173-', 'X', '', '0', '1458283613', '0', '0');
INSERT INTO `sr_area` VALUES ('179', '173', '平泉县', '2', '-0-41-173-', 'P', '', '0', '1458283614', '0', '0');
INSERT INTO `sr_area` VALUES ('180', '173', '滦平县', '2', '-0-41-173-', 'L', '', '0', '1458283615', '0', '0');
INSERT INTO `sr_area` VALUES ('181', '173', '隆化县', '2', '-0-41-173-', 'L', '', '0', '1458283616', '0', '0');
INSERT INTO `sr_area` VALUES ('182', '173', '丰宁满族自治县', '2', '-0-41-173-', 'F', '', '0', '1458283617', '0', '0');
INSERT INTO `sr_area` VALUES ('183', '173', '宽城满族自治县', '2', '-0-41-173-', 'K', '', '0', '1458283618', '0', '0');
INSERT INTO `sr_area` VALUES ('184', '173', '围场满族蒙古族自治县', '2', '-0-41-173-', 'W', '', '0', '1458283619', '0', '0');
INSERT INTO `sr_area` VALUES ('185', '41', '沧州市', '1', '-0-41-', 'C', '', '0', '1458283620', '0', '0');
INSERT INTO `sr_area` VALUES ('186', '185', '新华区', '2', '-0-41-185-', 'X', '', '0', '1458283621', '0', '0');
INSERT INTO `sr_area` VALUES ('187', '185', '运河区', '2', '-0-41-185-', 'Y', '', '0', '1458283622', '0', '0');
INSERT INTO `sr_area` VALUES ('188', '185', '沧县', '2', '-0-41-185-', 'C', '', '0', '1458283623', '0', '0');
INSERT INTO `sr_area` VALUES ('189', '185', '青县', '2', '-0-41-185-', 'Q', '', '0', '1458283624', '0', '0');
INSERT INTO `sr_area` VALUES ('190', '185', '东光县', '2', '-0-41-185-', 'D', '', '0', '1458283625', '0', '0');
INSERT INTO `sr_area` VALUES ('191', '185', '海兴县', '2', '-0-41-185-', 'H', '', '0', '1458283626', '0', '0');
INSERT INTO `sr_area` VALUES ('192', '185', '盐山县', '2', '-0-41-185-', 'Y', '', '0', '1458283627', '0', '0');
INSERT INTO `sr_area` VALUES ('193', '185', '肃宁县', '2', '-0-41-185-', 'S', '', '0', '1458283628', '0', '0');
INSERT INTO `sr_area` VALUES ('194', '185', '南皮县', '2', '-0-41-185-', 'N', '', '0', '1458283629', '0', '0');
INSERT INTO `sr_area` VALUES ('195', '185', '吴桥县', '2', '-0-41-185-', 'W', '', '0', '1458283630', '0', '0');
INSERT INTO `sr_area` VALUES ('196', '185', '献县', '2', '-0-41-185-', 'X', '', '0', '1458283631', '0', '0');
INSERT INTO `sr_area` VALUES ('197', '185', '孟村回族自治县', '2', '-0-41-185-', 'M', '', '0', '1458283632', '0', '0');
INSERT INTO `sr_area` VALUES ('198', '185', '泊头市', '2', '-0-41-185-', 'B', '', '0', '1458283633', '0', '0');
INSERT INTO `sr_area` VALUES ('199', '185', '任丘市', '2', '-0-41-185-', 'R', '', '0', '1458283634', '0', '0');
INSERT INTO `sr_area` VALUES ('200', '185', '黄骅市', '2', '-0-41-185-', 'H', '', '0', '1458283635', '0', '0');
INSERT INTO `sr_area` VALUES ('201', '185', '河间市', '2', '-0-41-185-', 'H', '', '0', '1458283636', '0', '0');
INSERT INTO `sr_area` VALUES ('202', '41', '廊坊市', '1', '-0-41-', 'L', '', '0', '1458283637', '0', '0');
INSERT INTO `sr_area` VALUES ('203', '202', '安次区', '2', '-0-41-202-', 'A', '', '0', '1458283638', '0', '0');
INSERT INTO `sr_area` VALUES ('204', '202', '广阳区', '2', '-0-41-202-', 'G', '', '0', '1458283639', '0', '0');
INSERT INTO `sr_area` VALUES ('205', '202', '固安县', '2', '-0-41-202-', 'G', '', '0', '1458283640', '0', '0');
INSERT INTO `sr_area` VALUES ('206', '202', '永清县', '2', '-0-41-202-', 'Y', '', '0', '1458283641', '0', '0');
INSERT INTO `sr_area` VALUES ('207', '202', '香河县', '2', '-0-41-202-', 'X', '', '0', '1458283642', '0', '0');
INSERT INTO `sr_area` VALUES ('208', '202', '大城县', '2', '-0-41-202-', 'D', '', '0', '1458283643', '0', '0');
INSERT INTO `sr_area` VALUES ('209', '202', '文安县', '2', '-0-41-202-', 'W', '', '0', '1458283644', '0', '0');
INSERT INTO `sr_area` VALUES ('210', '202', '大厂回族自治县', '2', '-0-41-202-', 'D', '', '0', '1458283645', '0', '0');
INSERT INTO `sr_area` VALUES ('211', '202', '霸州市', '2', '-0-41-202-', 'B', '', '0', '1458283646', '0', '0');
INSERT INTO `sr_area` VALUES ('212', '202', '三河市', '2', '-0-41-202-', 'S', '', '0', '1458283647', '0', '0');
INSERT INTO `sr_area` VALUES ('213', '41', '衡水市', '1', '-0-41-', 'H', '', '0', '1458283648', '0', '0');
INSERT INTO `sr_area` VALUES ('214', '213', '桃城区', '2', '-0-41-213-', 'T', '', '0', '1458283649', '0', '0');
INSERT INTO `sr_area` VALUES ('215', '213', '枣强县', '2', '-0-41-213-', 'Z', '', '0', '1458283650', '0', '0');
INSERT INTO `sr_area` VALUES ('216', '213', '武邑县', '2', '-0-41-213-', 'W', '', '0', '1458283651', '0', '0');
INSERT INTO `sr_area` VALUES ('217', '213', '武强县', '2', '-0-41-213-', 'W', '', '0', '1458283652', '0', '0');
INSERT INTO `sr_area` VALUES ('218', '213', '饶阳县', '2', '-0-41-213-', 'R', '', '0', '1458283653', '0', '0');
INSERT INTO `sr_area` VALUES ('219', '213', '安平县', '2', '-0-41-213-', 'A', '', '0', '1458283654', '0', '0');
INSERT INTO `sr_area` VALUES ('220', '213', '故城县', '2', '-0-41-213-', 'G', '', '0', '1458283655', '0', '0');
INSERT INTO `sr_area` VALUES ('221', '213', '景县', '2', '-0-41-213-', 'J', '', '0', '1458283656', '0', '0');
INSERT INTO `sr_area` VALUES ('222', '213', '阜城县', '2', '-0-41-213-', 'F', '', '0', '1458283657', '0', '0');
INSERT INTO `sr_area` VALUES ('223', '213', '冀州市', '2', '-0-41-213-', 'J', '', '0', '1458283658', '0', '0');
INSERT INTO `sr_area` VALUES ('224', '213', '深州市', '2', '-0-41-213-', 'S', '', '0', '1458283659', '0', '0');
INSERT INTO `sr_area` VALUES ('225', '0', '山西', '0', '-0-', 'S', '华北', '0', '1458283660', '0', '0');
INSERT INTO `sr_area` VALUES ('226', '225', '太原市', '1', '-0-225-', 'T', '', '0', '1458283661', '0', '0');
INSERT INTO `sr_area` VALUES ('227', '226', '小店区', '2', '-0-225-226-', 'X', '', '0', '1458283662', '0', '0');
INSERT INTO `sr_area` VALUES ('228', '226', '迎泽区', '2', '-0-225-226-', 'Y', '', '0', '1458283663', '0', '0');
INSERT INTO `sr_area` VALUES ('229', '226', '杏花岭区', '2', '-0-225-226-', 'X', '', '0', '1458283664', '0', '0');
INSERT INTO `sr_area` VALUES ('230', '226', '尖草坪区', '2', '-0-225-226-', 'J', '', '0', '1458283665', '0', '0');
INSERT INTO `sr_area` VALUES ('231', '226', '万柏林区', '2', '-0-225-226-', 'W', '', '0', '1458283666', '0', '0');
INSERT INTO `sr_area` VALUES ('232', '226', '晋源区', '2', '-0-225-226-', 'J', '', '0', '1458283667', '0', '0');
INSERT INTO `sr_area` VALUES ('233', '226', '清徐县', '2', '-0-225-226-', 'Q', '', '0', '1458283668', '0', '0');
INSERT INTO `sr_area` VALUES ('234', '226', '阳曲县', '2', '-0-225-226-', 'Y', '', '0', '1458283669', '0', '0');
INSERT INTO `sr_area` VALUES ('235', '226', '娄烦县', '2', '-0-225-226-', 'L', '', '0', '1458283670', '0', '0');
INSERT INTO `sr_area` VALUES ('236', '226', '古交市', '2', '-0-225-226-', 'G', '', '0', '1458283671', '0', '0');
INSERT INTO `sr_area` VALUES ('237', '225', '大同市', '1', '-0-225-', 'D', '', '0', '1458283672', '0', '0');
INSERT INTO `sr_area` VALUES ('238', '237', '城区', '2', '-0-225-237-', 'C', '', '0', '1458283673', '0', '0');
INSERT INTO `sr_area` VALUES ('239', '237', '矿区', '2', '-0-225-237-', 'K', '', '0', '1458283674', '0', '0');
INSERT INTO `sr_area` VALUES ('240', '237', '南郊区', '2', '-0-225-237-', 'N', '', '0', '1458283675', '0', '0');
INSERT INTO `sr_area` VALUES ('241', '237', '新荣区', '2', '-0-225-237-', 'X', '', '0', '1458283676', '0', '0');
INSERT INTO `sr_area` VALUES ('242', '237', '阳高县', '2', '-0-225-237-', 'Y', '', '0', '1458283677', '0', '0');
INSERT INTO `sr_area` VALUES ('243', '237', '天镇县', '2', '-0-225-237-', 'T', '', '0', '1458283678', '0', '0');
INSERT INTO `sr_area` VALUES ('244', '237', '广灵县', '2', '-0-225-237-', 'G', '', '0', '1458283679', '0', '0');
INSERT INTO `sr_area` VALUES ('245', '237', '灵丘县', '2', '-0-225-237-', 'L', '', '0', '1458283680', '0', '0');
INSERT INTO `sr_area` VALUES ('246', '237', '浑源县', '2', '-0-225-237-', 'H', '', '0', '1458283681', '0', '0');
INSERT INTO `sr_area` VALUES ('247', '237', '左云县', '2', '-0-225-237-', 'Z', '', '0', '1458283682', '0', '0');
INSERT INTO `sr_area` VALUES ('248', '237', '大同县', '2', '-0-225-237-', 'D', '', '0', '1458283683', '0', '0');
INSERT INTO `sr_area` VALUES ('249', '225', '阳泉市', '1', '-0-225-', 'Y', '', '0', '1458283684', '0', '0');
INSERT INTO `sr_area` VALUES ('250', '249', '城区', '2', '-0-225-249-', 'C', '', '0', '1458283685', '0', '0');
INSERT INTO `sr_area` VALUES ('251', '249', '矿区', '2', '-0-225-249-', 'K', '', '0', '1458283686', '0', '0');
INSERT INTO `sr_area` VALUES ('252', '249', '郊区', '2', '-0-225-249-', 'J', '', '0', '1458283687', '0', '0');
INSERT INTO `sr_area` VALUES ('253', '249', '平定县', '2', '-0-225-249-', 'P', '', '0', '1458283688', '0', '0');
INSERT INTO `sr_area` VALUES ('254', '249', '盂县', '2', '-0-225-249-', 'Y', '', '0', '1458283689', '0', '0');
INSERT INTO `sr_area` VALUES ('255', '225', '长治市', '1', '-0-225-', 'C', '', '0', '1458283690', '0', '0');
INSERT INTO `sr_area` VALUES ('256', '255', '城区', '2', '-0-225-255-', 'C', '', '0', '1458283691', '0', '0');
INSERT INTO `sr_area` VALUES ('257', '255', '郊区', '2', '-0-225-255-', 'J', '', '0', '1458283692', '0', '0');
INSERT INTO `sr_area` VALUES ('258', '255', '长治县', '2', '-0-225-255-', 'C', '', '0', '1458283693', '0', '0');
INSERT INTO `sr_area` VALUES ('259', '255', '襄垣县', '2', '-0-225-255-', 'X', '', '0', '1458283694', '0', '0');
INSERT INTO `sr_area` VALUES ('260', '255', '屯留县', '2', '-0-225-255-', 'T', '', '0', '1458283695', '0', '0');
INSERT INTO `sr_area` VALUES ('261', '255', '平顺县', '2', '-0-225-255-', 'P', '', '0', '1458283696', '0', '0');
INSERT INTO `sr_area` VALUES ('262', '255', '黎城县', '2', '-0-225-255-', 'L', '', '0', '1458283697', '0', '0');
INSERT INTO `sr_area` VALUES ('263', '255', '壶关县', '2', '-0-225-255-', 'H', '', '0', '1458283698', '0', '0');
INSERT INTO `sr_area` VALUES ('264', '255', '长子县', '2', '-0-225-255-', 'C', '', '0', '1458283699', '0', '0');
INSERT INTO `sr_area` VALUES ('265', '255', '武乡县', '2', '-0-225-255-', 'W', '', '0', '1458283700', '0', '0');
INSERT INTO `sr_area` VALUES ('266', '255', '沁县', '2', '-0-225-255-', 'Q', '', '0', '1458283701', '0', '0');
INSERT INTO `sr_area` VALUES ('267', '255', '沁源县', '2', '-0-225-255-', 'Q', '', '0', '1458283702', '0', '0');
INSERT INTO `sr_area` VALUES ('268', '255', '潞城市', '2', '-0-225-255-', 'L', '', '0', '1458283703', '0', '0');
INSERT INTO `sr_area` VALUES ('269', '225', '晋城市', '1', '-0-225-', 'J', '', '0', '1458283704', '0', '0');
INSERT INTO `sr_area` VALUES ('270', '269', '城区', '2', '-0-225-269-', 'C', '', '0', '1458283705', '0', '0');
INSERT INTO `sr_area` VALUES ('271', '269', '沁水县', '2', '-0-225-269-', 'Q', '', '0', '1458283706', '0', '0');
INSERT INTO `sr_area` VALUES ('272', '269', '阳城县', '2', '-0-225-269-', 'Y', '', '0', '1458283707', '0', '0');
INSERT INTO `sr_area` VALUES ('273', '269', '陵川县', '2', '-0-225-269-', 'L', '', '0', '1458283708', '0', '0');
INSERT INTO `sr_area` VALUES ('274', '269', '泽州县', '2', '-0-225-269-', 'Z', '', '0', '1458283709', '0', '0');
INSERT INTO `sr_area` VALUES ('275', '269', '高平市', '2', '-0-225-269-', 'G', '', '0', '1458283710', '0', '0');
INSERT INTO `sr_area` VALUES ('276', '225', '朔州市', '1', '-0-225-', 'S', '', '0', '1458283711', '0', '0');
INSERT INTO `sr_area` VALUES ('277', '276', '朔城区', '2', '-0-225-276-', 'S', '', '0', '1458283712', '0', '0');
INSERT INTO `sr_area` VALUES ('278', '276', '平鲁区', '2', '-0-225-276-', 'P', '', '0', '1458283713', '0', '0');
INSERT INTO `sr_area` VALUES ('279', '276', '山阴县', '2', '-0-225-276-', 'S', '', '0', '1458283714', '0', '0');
INSERT INTO `sr_area` VALUES ('280', '276', '应县', '2', '-0-225-276-', 'Y', '', '0', '1458283715', '0', '0');
INSERT INTO `sr_area` VALUES ('281', '276', '右玉县', '2', '-0-225-276-', 'Y', '', '0', '1458283716', '0', '0');
INSERT INTO `sr_area` VALUES ('282', '276', '怀仁县', '2', '-0-225-276-', 'H', '', '0', '1458283717', '0', '0');
INSERT INTO `sr_area` VALUES ('283', '225', '晋中市', '1', '-0-225-', 'J', '', '0', '1458283718', '0', '0');
INSERT INTO `sr_area` VALUES ('284', '283', '榆次区', '2', '-0-225-283-', 'Y', '', '0', '1458283719', '0', '0');
INSERT INTO `sr_area` VALUES ('285', '283', '榆社县', '2', '-0-225-283-', 'Y', '', '0', '1458283720', '0', '0');
INSERT INTO `sr_area` VALUES ('286', '283', '左权县', '2', '-0-225-283-', 'Z', '', '0', '1458283721', '0', '0');
INSERT INTO `sr_area` VALUES ('287', '283', '和顺县', '2', '-0-225-283-', 'H', '', '0', '1458283722', '0', '0');
INSERT INTO `sr_area` VALUES ('288', '283', '昔阳县', '2', '-0-225-283-', 'X', '', '0', '1458283723', '0', '0');
INSERT INTO `sr_area` VALUES ('289', '283', '寿阳县', '2', '-0-225-283-', 'S', '', '0', '1458283724', '0', '0');
INSERT INTO `sr_area` VALUES ('290', '283', '太谷县', '2', '-0-225-283-', 'T', '', '0', '1458283725', '0', '0');
INSERT INTO `sr_area` VALUES ('291', '283', '祁县', '2', '-0-225-283-', 'Q', '', '0', '1458283726', '0', '0');
INSERT INTO `sr_area` VALUES ('292', '283', '平遥县', '2', '-0-225-283-', 'P', '', '0', '1458283727', '0', '0');
INSERT INTO `sr_area` VALUES ('293', '283', '灵石县', '2', '-0-225-283-', 'L', '', '0', '1458283728', '0', '0');
INSERT INTO `sr_area` VALUES ('294', '283', '介休市', '2', '-0-225-283-', 'J', '', '0', '1458283729', '0', '0');
INSERT INTO `sr_area` VALUES ('295', '225', '运城市', '1', '-0-225-', 'Y', '', '0', '1458283730', '0', '0');
INSERT INTO `sr_area` VALUES ('296', '295', '盐湖区', '2', '-0-225-295-', 'Y', '', '0', '1458283731', '0', '0');
INSERT INTO `sr_area` VALUES ('297', '295', '临猗县', '2', '-0-225-295-', 'L', '', '0', '1458283732', '0', '0');
INSERT INTO `sr_area` VALUES ('298', '295', '万荣县', '2', '-0-225-295-', 'W', '', '0', '1458283733', '0', '0');
INSERT INTO `sr_area` VALUES ('299', '295', '闻喜县', '2', '-0-225-295-', 'W', '', '0', '1458283734', '0', '0');
INSERT INTO `sr_area` VALUES ('300', '295', '稷山县', '2', '-0-225-295-', '', '', '0', '1458283735', '0', '0');
INSERT INTO `sr_area` VALUES ('301', '295', '新绛县', '2', '-0-225-295-', 'X', '', '0', '1458283736', '0', '0');
INSERT INTO `sr_area` VALUES ('302', '295', '绛县', '2', '-0-225-295-', '', '', '0', '1458283737', '0', '0');
INSERT INTO `sr_area` VALUES ('303', '295', '垣曲县', '2', '-0-225-295-', 'Y', '', '0', '1458283738', '0', '0');
INSERT INTO `sr_area` VALUES ('304', '295', '夏县', '2', '-0-225-295-', 'X', '', '0', '1458283739', '0', '0');
INSERT INTO `sr_area` VALUES ('305', '295', '平陆县', '2', '-0-225-295-', 'P', '', '0', '1458283740', '0', '0');
INSERT INTO `sr_area` VALUES ('306', '295', '芮城县', '2', '-0-225-295-', '', '', '0', '1458283741', '0', '0');
INSERT INTO `sr_area` VALUES ('307', '295', '永济市', '2', '-0-225-295-', 'Y', '', '0', '1458283742', '0', '0');
INSERT INTO `sr_area` VALUES ('308', '295', '河津市', '2', '-0-225-295-', 'H', '', '0', '1458283743', '0', '0');
INSERT INTO `sr_area` VALUES ('309', '225', '忻州市', '1', '-0-225-', 'X', '', '0', '1458283744', '0', '0');
INSERT INTO `sr_area` VALUES ('310', '309', '忻府区', '2', '-0-225-309-', 'X', '', '0', '1458283745', '0', '0');
INSERT INTO `sr_area` VALUES ('311', '309', '定襄县', '2', '-0-225-309-', 'D', '', '0', '1458283746', '0', '0');
INSERT INTO `sr_area` VALUES ('312', '309', '五台县', '2', '-0-225-309-', 'W', '', '0', '1458283747', '0', '0');
INSERT INTO `sr_area` VALUES ('313', '309', '代县', '2', '-0-225-309-', 'D', '', '0', '1458283748', '0', '0');
INSERT INTO `sr_area` VALUES ('314', '309', '繁峙县', '2', '-0-225-309-', 'F', '', '0', '1458283749', '0', '0');
INSERT INTO `sr_area` VALUES ('315', '309', '宁武县', '2', '-0-225-309-', 'N', '', '0', '1458283750', '0', '0');
INSERT INTO `sr_area` VALUES ('316', '309', '静乐县', '2', '-0-225-309-', 'J', '', '0', '1458283751', '0', '0');
INSERT INTO `sr_area` VALUES ('317', '309', '神池县', '2', '-0-225-309-', 'S', '', '0', '1458283752', '0', '0');
INSERT INTO `sr_area` VALUES ('318', '309', '五寨县', '2', '-0-225-309-', 'W', '', '0', '1458283753', '0', '0');
INSERT INTO `sr_area` VALUES ('319', '309', '岢岚县', '2', '-0-225-309-', '', '', '0', '1458283754', '0', '0');
INSERT INTO `sr_area` VALUES ('320', '309', '河曲县', '2', '-0-225-309-', 'H', '', '0', '1458283755', '0', '0');
INSERT INTO `sr_area` VALUES ('321', '309', '保德县', '2', '-0-225-309-', 'B', '', '0', '1458283756', '0', '0');
INSERT INTO `sr_area` VALUES ('322', '309', '偏关县', '2', '-0-225-309-', 'P', '', '0', '1458283757', '0', '0');
INSERT INTO `sr_area` VALUES ('323', '309', '原平市', '2', '-0-225-309-', 'Y', '', '0', '1458283758', '0', '0');
INSERT INTO `sr_area` VALUES ('324', '225', '临汾市', '1', '-0-225-', 'L', '', '0', '1458283759', '0', '0');
INSERT INTO `sr_area` VALUES ('325', '324', '尧都区', '2', '-0-225-324-', 'Y', '', '0', '1458283760', '0', '0');
INSERT INTO `sr_area` VALUES ('326', '324', '曲沃县', '2', '-0-225-324-', 'Q', '', '0', '1458283761', '0', '0');
INSERT INTO `sr_area` VALUES ('327', '324', '翼城县', '2', '-0-225-324-', 'Y', '', '0', '1458283762', '0', '0');
INSERT INTO `sr_area` VALUES ('328', '324', '襄汾县', '2', '-0-225-324-', 'X', '', '0', '1458283763', '0', '0');
INSERT INTO `sr_area` VALUES ('329', '324', '洪洞县', '2', '-0-225-324-', 'H', '', '0', '1458283764', '0', '0');
INSERT INTO `sr_area` VALUES ('330', '324', '古县', '2', '-0-225-324-', 'G', '', '0', '1458283765', '0', '0');
INSERT INTO `sr_area` VALUES ('331', '324', '安泽县', '2', '-0-225-324-', 'A', '', '0', '1458283766', '0', '0');
INSERT INTO `sr_area` VALUES ('332', '324', '浮山县', '2', '-0-225-324-', 'F', '', '0', '1458283767', '0', '0');
INSERT INTO `sr_area` VALUES ('333', '324', '吉县', '2', '-0-225-324-', 'J', '', '0', '1458283768', '0', '0');
INSERT INTO `sr_area` VALUES ('334', '324', '乡宁县', '2', '-0-225-324-', 'X', '', '0', '1458283769', '0', '0');
INSERT INTO `sr_area` VALUES ('335', '324', '大宁县', '2', '-0-225-324-', 'D', '', '0', '1458283770', '0', '0');
INSERT INTO `sr_area` VALUES ('336', '324', '隰县', '2', '-0-225-324-', '', '', '0', '1458283771', '0', '0');
INSERT INTO `sr_area` VALUES ('337', '324', '永和县', '2', '-0-225-324-', 'Y', '', '0', '1458283772', '0', '0');
INSERT INTO `sr_area` VALUES ('338', '324', '蒲县', '2', '-0-225-324-', 'P', '', '0', '1458283773', '0', '0');
INSERT INTO `sr_area` VALUES ('339', '324', '汾西县', '2', '-0-225-324-', 'F', '', '0', '1458283774', '0', '0');
INSERT INTO `sr_area` VALUES ('340', '324', '侯马市', '2', '-0-225-324-', 'H', '', '0', '1458283775', '0', '0');
INSERT INTO `sr_area` VALUES ('341', '324', '霍州市', '2', '-0-225-324-', 'H', '', '0', '1458283776', '0', '0');
INSERT INTO `sr_area` VALUES ('342', '225', '吕梁市', '1', '-0-225-', 'L', '', '0', '1458283777', '0', '0');
INSERT INTO `sr_area` VALUES ('343', '342', '离石区', '2', '-0-225-342-', 'L', '', '0', '1458283778', '0', '0');
INSERT INTO `sr_area` VALUES ('344', '342', '文水县', '2', '-0-225-342-', 'W', '', '0', '1458283779', '0', '0');
INSERT INTO `sr_area` VALUES ('345', '342', '交城县', '2', '-0-225-342-', 'J', '', '0', '1458283780', '0', '0');
INSERT INTO `sr_area` VALUES ('346', '342', '兴县', '2', '-0-225-342-', 'X', '', '0', '1458283781', '0', '0');
INSERT INTO `sr_area` VALUES ('347', '342', '临县', '2', '-0-225-342-', 'L', '', '0', '1458283782', '0', '0');
INSERT INTO `sr_area` VALUES ('348', '342', '柳林县', '2', '-0-225-342-', 'L', '', '0', '1458283783', '0', '0');
INSERT INTO `sr_area` VALUES ('349', '342', '石楼县', '2', '-0-225-342-', 'S', '', '0', '1458283784', '0', '0');
INSERT INTO `sr_area` VALUES ('350', '342', '岚县', '2', '-0-225-342-', '', '', '0', '1458283785', '0', '0');
INSERT INTO `sr_area` VALUES ('351', '342', '方山县', '2', '-0-225-342-', 'F', '', '0', '1458283786', '0', '0');
INSERT INTO `sr_area` VALUES ('352', '342', '中阳县', '2', '-0-225-342-', 'Z', '', '0', '1458283787', '0', '0');
INSERT INTO `sr_area` VALUES ('353', '342', '交口县', '2', '-0-225-342-', 'J', '', '0', '1458283788', '0', '0');
INSERT INTO `sr_area` VALUES ('354', '342', '孝义市', '2', '-0-225-342-', 'X', '', '0', '1458283789', '0', '0');
INSERT INTO `sr_area` VALUES ('355', '342', '汾阳市', '2', '-0-225-342-', 'F', '', '0', '1458283790', '0', '0');
INSERT INTO `sr_area` VALUES ('356', '0', '内蒙古', '0', '-0-', 'N', '华北', '0', '1458283791', '0', '0');
INSERT INTO `sr_area` VALUES ('357', '356', '呼和浩特市', '1', '-0-356-', 'H', '', '0', '1458283792', '0', '0');
INSERT INTO `sr_area` VALUES ('358', '357', '新城区', '2', '-0-356-357-', 'X', '', '0', '1458283793', '0', '0');
INSERT INTO `sr_area` VALUES ('359', '357', '回民区', '2', '-0-356-357-', 'H', '', '0', '1458283794', '0', '0');
INSERT INTO `sr_area` VALUES ('360', '357', '玉泉区', '2', '-0-356-357-', 'Y', '', '0', '1458283795', '0', '0');
INSERT INTO `sr_area` VALUES ('361', '357', '赛罕区', '2', '-0-356-357-', 'S', '', '0', '1458283796', '0', '0');
INSERT INTO `sr_area` VALUES ('362', '357', '土默特左旗', '2', '-0-356-357-', 'T', '', '0', '1458283797', '0', '0');
INSERT INTO `sr_area` VALUES ('363', '357', '托克托县', '2', '-0-356-357-', 'T', '', '0', '1458283798', '0', '0');
INSERT INTO `sr_area` VALUES ('364', '357', '和林格尔县', '2', '-0-356-357-', 'H', '', '0', '1458283799', '0', '0');
INSERT INTO `sr_area` VALUES ('365', '357', '清水河县', '2', '-0-356-357-', 'Q', '', '0', '1458283800', '0', '0');
INSERT INTO `sr_area` VALUES ('366', '357', '武川县', '2', '-0-356-357-', 'W', '', '0', '1458283801', '0', '0');
INSERT INTO `sr_area` VALUES ('367', '356', '包头市', '1', '-0-356-', 'B', '', '0', '1458283802', '0', '0');
INSERT INTO `sr_area` VALUES ('368', '367', '东河区', '2', '-0-356-367-', 'D', '', '0', '1458283803', '0', '0');
INSERT INTO `sr_area` VALUES ('369', '367', '昆都仑区', '2', '-0-356-367-', 'K', '', '0', '1458283804', '0', '0');
INSERT INTO `sr_area` VALUES ('370', '367', '青山区', '2', '-0-356-367-', 'Q', '', '0', '1458283805', '0', '0');
INSERT INTO `sr_area` VALUES ('371', '367', '石拐区', '2', '-0-356-367-', 'S', '', '0', '1458283806', '0', '0');
INSERT INTO `sr_area` VALUES ('372', '367', '白云矿区', '2', '-0-356-367-', 'B', '', '0', '1458283807', '0', '0');
INSERT INTO `sr_area` VALUES ('373', '367', '九原区', '2', '-0-356-367-', 'J', '', '0', '1458283808', '0', '0');
INSERT INTO `sr_area` VALUES ('374', '367', '土默特右旗', '2', '-0-356-367-', 'T', '', '0', '1458283809', '0', '0');
INSERT INTO `sr_area` VALUES ('375', '367', '固阳县', '2', '-0-356-367-', 'G', '', '0', '1458283810', '0', '0');
INSERT INTO `sr_area` VALUES ('376', '367', '达尔罕茂明安联合旗', '2', '-0-356-367-', 'D', '', '0', '1458283811', '0', '0');
INSERT INTO `sr_area` VALUES ('377', '356', '乌海市', '1', '-0-356-', 'W', '', '0', '1458283812', '0', '0');
INSERT INTO `sr_area` VALUES ('378', '377', '海勃湾区', '2', '-0-356-377-', 'H', '', '0', '1458283813', '0', '0');
INSERT INTO `sr_area` VALUES ('379', '377', '海南区', '2', '-0-356-377-', 'H', '', '0', '1458283814', '0', '0');
INSERT INTO `sr_area` VALUES ('380', '377', '乌达区', '2', '-0-356-377-', 'W', '', '0', '1458283815', '0', '0');
INSERT INTO `sr_area` VALUES ('381', '356', '赤峰市', '1', '-0-356-', 'C', '', '0', '1458283816', '0', '0');
INSERT INTO `sr_area` VALUES ('382', '381', '红山区', '2', '-0-356-381-', 'H', '', '0', '1458283817', '0', '0');
INSERT INTO `sr_area` VALUES ('383', '381', '元宝山区', '2', '-0-356-381-', 'Y', '', '0', '1458283818', '0', '0');
INSERT INTO `sr_area` VALUES ('384', '381', '松山区', '2', '-0-356-381-', 'S', '', '0', '1458283819', '0', '0');
INSERT INTO `sr_area` VALUES ('385', '381', '阿鲁科尔沁旗', '2', '-0-356-381-', 'A', '', '0', '1458283820', '0', '0');
INSERT INTO `sr_area` VALUES ('386', '381', '巴林左旗', '2', '-0-356-381-', 'B', '', '0', '1458283821', '0', '0');
INSERT INTO `sr_area` VALUES ('387', '381', '巴林右旗', '2', '-0-356-381-', 'B', '', '0', '1458283822', '0', '0');
INSERT INTO `sr_area` VALUES ('388', '381', '林西县', '2', '-0-356-381-', 'L', '', '0', '1458283823', '0', '0');
INSERT INTO `sr_area` VALUES ('389', '381', '克什克腾旗', '2', '-0-356-381-', 'K', '', '0', '1458283824', '0', '0');
INSERT INTO `sr_area` VALUES ('390', '381', '翁牛特旗', '2', '-0-356-381-', 'W', '', '0', '1458283825', '0', '0');
INSERT INTO `sr_area` VALUES ('391', '381', '喀喇沁旗', '2', '-0-356-381-', 'K', '', '0', '1458283826', '0', '0');
INSERT INTO `sr_area` VALUES ('392', '381', '宁城县', '2', '-0-356-381-', 'N', '', '0', '1458283827', '0', '0');
INSERT INTO `sr_area` VALUES ('393', '381', '敖汉旗', '2', '-0-356-381-', 'A', '', '0', '1458283828', '0', '0');
INSERT INTO `sr_area` VALUES ('394', '356', '通辽市', '1', '-0-356-', 'T', '', '0', '1458283829', '0', '0');
INSERT INTO `sr_area` VALUES ('395', '394', '科尔沁区', '2', '-0-356-394-', 'K', '', '0', '1458283830', '0', '0');
INSERT INTO `sr_area` VALUES ('396', '394', '科尔沁左翼中旗', '2', '-0-356-394-', 'K', '', '0', '1458283831', '0', '0');
INSERT INTO `sr_area` VALUES ('397', '394', '科尔沁左翼后旗', '2', '-0-356-394-', 'K', '', '0', '1458283832', '0', '0');
INSERT INTO `sr_area` VALUES ('398', '394', '开鲁县', '2', '-0-356-394-', 'K', '', '0', '1458283833', '0', '0');
INSERT INTO `sr_area` VALUES ('399', '394', '库伦旗', '2', '-0-356-394-', 'K', '', '0', '1458283834', '0', '0');
INSERT INTO `sr_area` VALUES ('400', '394', '奈曼旗', '2', '-0-356-394-', 'N', '', '0', '1458283835', '0', '0');
INSERT INTO `sr_area` VALUES ('401', '394', '扎鲁特旗', '2', '-0-356-394-', 'Z', '', '0', '1458283836', '0', '0');
INSERT INTO `sr_area` VALUES ('402', '394', '霍林郭勒市', '2', '-0-356-394-', 'H', '', '0', '1458283837', '0', '0');
INSERT INTO `sr_area` VALUES ('403', '356', '鄂尔多斯市', '1', '-0-356-', 'E', '', '0', '1458283838', '0', '0');
INSERT INTO `sr_area` VALUES ('404', '403', '市辖区', '2', '-0-356-403-', 'S', '', '0', '1458283839', '0', '0');
INSERT INTO `sr_area` VALUES ('405', '403', '东胜区', '2', '-0-356-403-', '', '', '0', '1458283840', '0', '0');
INSERT INTO `sr_area` VALUES ('406', '403', '达拉特旗', '2', '-0-356-403-', 'D', '', '0', '1458283841', '0', '0');
INSERT INTO `sr_area` VALUES ('407', '403', '准格尔旗', '2', '-0-356-403-', 'Z', '', '0', '1458283842', '0', '0');
INSERT INTO `sr_area` VALUES ('408', '403', '鄂托克前旗', '2', '-0-356-403-', 'E', '', '0', '1458283843', '0', '0');
INSERT INTO `sr_area` VALUES ('409', '403', '鄂托克旗', '2', '-0-356-403-', 'E', '', '0', '1458283844', '0', '0');
INSERT INTO `sr_area` VALUES ('410', '403', '杭锦旗', '2', '-0-356-403-', 'H', '', '0', '1458283845', '0', '0');
INSERT INTO `sr_area` VALUES ('411', '403', '乌审旗', '2', '-0-356-403-', 'W', '', '0', '1458283846', '0', '0');
INSERT INTO `sr_area` VALUES ('412', '403', '伊金霍洛旗', '2', '-0-356-403-', 'Y', '', '0', '1458283847', '0', '0');
INSERT INTO `sr_area` VALUES ('413', '356', '呼伦贝尔市', '1', '-0-356-', 'H', '', '0', '1458283848', '0', '0');
INSERT INTO `sr_area` VALUES ('414', '413', '海拉尔区', '2', '-0-356-413-', 'H', '', '0', '1458283849', '0', '0');
INSERT INTO `sr_area` VALUES ('415', '413', '阿荣旗', '2', '-0-356-413-', 'A', '', '0', '1458283850', '0', '0');
INSERT INTO `sr_area` VALUES ('416', '413', '莫力达瓦达斡尔族自治旗', '2', '-0-356-413-', 'M', '', '0', '1458283851', '0', '0');
INSERT INTO `sr_area` VALUES ('417', '413', '鄂伦春自治旗', '2', '-0-356-413-', 'E', '', '0', '1458283852', '0', '0');
INSERT INTO `sr_area` VALUES ('418', '413', '鄂温克族自治旗', '2', '-0-356-413-', 'E', '', '0', '1458283853', '0', '0');
INSERT INTO `sr_area` VALUES ('419', '413', '陈巴尔虎旗', '2', '-0-356-413-', 'C', '', '0', '1458283854', '0', '0');
INSERT INTO `sr_area` VALUES ('420', '413', '新巴尔虎左旗', '2', '-0-356-413-', 'X', '', '0', '1458283855', '0', '0');
INSERT INTO `sr_area` VALUES ('421', '413', '新巴尔虎右旗', '2', '-0-356-413-', 'X', '', '0', '1458283856', '0', '0');
INSERT INTO `sr_area` VALUES ('422', '413', '满洲里市', '2', '-0-356-413-', 'M', '', '0', '1458283857', '0', '0');
INSERT INTO `sr_area` VALUES ('423', '413', '牙克石市', '2', '-0-356-413-', 'Y', '', '0', '1458283858', '0', '0');
INSERT INTO `sr_area` VALUES ('424', '413', '扎兰屯市', '2', '-0-356-413-', 'Z', '', '0', '1458283859', '0', '0');
INSERT INTO `sr_area` VALUES ('425', '413', '额尔古纳市', '2', '-0-356-413-', 'E', '', '0', '1458283860', '0', '0');
INSERT INTO `sr_area` VALUES ('426', '413', '根河市', '2', '-0-356-413-', 'G', '', '0', '1458283861', '0', '0');
INSERT INTO `sr_area` VALUES ('427', '356', '巴彦淖尔市', '1', '-0-356-', 'B', '', '0', '1458283862', '0', '0');
INSERT INTO `sr_area` VALUES ('428', '427', '临河区', '2', '-0-356-427-', 'L', '', '0', '1458283863', '0', '0');
INSERT INTO `sr_area` VALUES ('429', '427', '五原县', '2', '-0-356-427-', 'W', '', '0', '1458283864', '0', '0');
INSERT INTO `sr_area` VALUES ('430', '427', '磴口县', '2', '-0-356-427-', '', '', '0', '1458283865', '0', '0');
INSERT INTO `sr_area` VALUES ('431', '427', '乌拉特前旗', '2', '-0-356-427-', 'W', '', '0', '1458283866', '0', '0');
INSERT INTO `sr_area` VALUES ('432', '427', '乌拉特中旗', '2', '-0-356-427-', 'W', '', '0', '1458283867', '0', '0');
INSERT INTO `sr_area` VALUES ('433', '427', '乌拉特后旗', '2', '-0-356-427-', 'W', '', '0', '1458283868', '0', '0');
INSERT INTO `sr_area` VALUES ('434', '427', '杭锦后旗', '2', '-0-356-427-', 'H', '', '0', '1458283869', '0', '0');
INSERT INTO `sr_area` VALUES ('435', '356', '乌兰察布市', '1', '-0-356-', 'W', '', '0', '1458283870', '0', '0');
INSERT INTO `sr_area` VALUES ('436', '435', '集宁区', '2', '-0-356-435-', 'J', '', '0', '1458283871', '0', '0');
INSERT INTO `sr_area` VALUES ('437', '435', '卓资县', '2', '-0-356-435-', 'Z', '', '0', '1458283872', '0', '0');
INSERT INTO `sr_area` VALUES ('438', '435', '化德县', '2', '-0-356-435-', 'H', '', '0', '1458283873', '0', '0');
INSERT INTO `sr_area` VALUES ('439', '435', '商都县', '2', '-0-356-435-', 'S', '', '0', '1458283874', '0', '0');
INSERT INTO `sr_area` VALUES ('440', '435', '兴和县', '2', '-0-356-435-', 'X', '', '0', '1458283875', '0', '0');
INSERT INTO `sr_area` VALUES ('441', '435', '凉城县', '2', '-0-356-435-', 'L', '', '0', '1458283876', '0', '0');
INSERT INTO `sr_area` VALUES ('442', '435', '察哈尔右翼前旗', '2', '-0-356-435-', 'C', '', '0', '1458283877', '0', '0');
INSERT INTO `sr_area` VALUES ('443', '435', '察哈尔右翼中旗', '2', '-0-356-435-', 'C', '', '0', '1458283878', '0', '0');
INSERT INTO `sr_area` VALUES ('444', '435', '察哈尔右翼后旗', '2', '-0-356-435-', 'C', '', '0', '1458283879', '0', '0');
INSERT INTO `sr_area` VALUES ('445', '435', '四子王旗', '2', '-0-356-435-', 'S', '', '0', '1458283880', '0', '0');
INSERT INTO `sr_area` VALUES ('446', '435', '丰镇市', '2', '-0-356-435-', 'F', '', '0', '1458283881', '0', '0');
INSERT INTO `sr_area` VALUES ('447', '356', '兴安盟', '1', '-0-356-', 'X', '', '0', '1458283882', '0', '0');
INSERT INTO `sr_area` VALUES ('448', '447', '乌兰浩特市', '2', '-0-356-447-', 'W', '', '0', '1458283883', '0', '0');
INSERT INTO `sr_area` VALUES ('449', '447', '阿尔山市', '2', '-0-356-447-', 'A', '', '0', '1458283884', '0', '0');
INSERT INTO `sr_area` VALUES ('450', '447', '科尔沁右翼前旗', '2', '-0-356-447-', 'K', '', '0', '1458283885', '0', '0');
INSERT INTO `sr_area` VALUES ('451', '447', '科尔沁右翼中旗', '2', '-0-356-447-', 'K', '', '0', '1458283886', '0', '0');
INSERT INTO `sr_area` VALUES ('452', '447', '扎赉特旗', '2', '-0-356-447-', 'Z', '', '0', '1458283887', '0', '0');
INSERT INTO `sr_area` VALUES ('453', '447', '突泉县', '2', '-0-356-447-', 'T', '', '0', '1458283888', '0', '0');
INSERT INTO `sr_area` VALUES ('454', '356', '锡林郭勒盟', '1', '-0-356-', 'X', '', '0', '1458283889', '0', '0');
INSERT INTO `sr_area` VALUES ('455', '454', '二连浩特市', '2', '-0-356-454-', 'E', '', '0', '1458283890', '0', '0');
INSERT INTO `sr_area` VALUES ('456', '454', '锡林浩特市', '2', '-0-356-454-', 'X', '', '0', '1458283891', '0', '0');
INSERT INTO `sr_area` VALUES ('457', '454', '阿巴嘎旗', '2', '-0-356-454-', 'A', '', '0', '1458283892', '0', '0');
INSERT INTO `sr_area` VALUES ('458', '454', '苏尼特左旗', '2', '-0-356-454-', 'S', '', '0', '1458283893', '0', '0');
INSERT INTO `sr_area` VALUES ('459', '454', '苏尼特右旗', '2', '-0-356-454-', 'S', '', '0', '1458283894', '0', '0');
INSERT INTO `sr_area` VALUES ('460', '454', '东乌珠穆沁旗', '2', '-0-356-454-', 'D', '', '0', '1458283895', '0', '0');
INSERT INTO `sr_area` VALUES ('461', '454', '西乌珠穆沁旗', '2', '-0-356-454-', 'X', '', '0', '1458283896', '0', '0');
INSERT INTO `sr_area` VALUES ('462', '454', '太仆寺旗', '2', '-0-356-454-', 'T', '', '0', '1458283897', '0', '0');
INSERT INTO `sr_area` VALUES ('463', '454', '镶黄旗', '2', '-0-356-454-', 'X', '', '0', '1458283898', '0', '0');
INSERT INTO `sr_area` VALUES ('464', '454', '正镶白旗', '2', '-0-356-454-', 'Z', '', '0', '1458283899', '0', '0');
INSERT INTO `sr_area` VALUES ('465', '454', '正蓝旗', '2', '-0-356-454-', 'Z', '', '0', '1458283900', '0', '0');
INSERT INTO `sr_area` VALUES ('466', '454', '多伦县', '2', '-0-356-454-', 'D', '', '0', '1458283901', '0', '0');
INSERT INTO `sr_area` VALUES ('467', '356', '阿拉善盟', '1', '-0-356-', 'A', '', '0', '1458283902', '0', '0');
INSERT INTO `sr_area` VALUES ('468', '467', '阿拉善左旗', '2', '-0-356-467-', 'A', '', '0', '1458283903', '0', '0');
INSERT INTO `sr_area` VALUES ('469', '467', '阿拉善右旗', '2', '-0-356-467-', 'A', '', '0', '1458283904', '0', '0');
INSERT INTO `sr_area` VALUES ('470', '467', '额济纳旗', '2', '-0-356-467-', 'E', '', '0', '1458283905', '0', '0');
INSERT INTO `sr_area` VALUES ('471', '0', '辽宁', '0', '-0-', 'L', '东北', '0', '1458283906', '0', '0');
INSERT INTO `sr_area` VALUES ('472', '471', '沈阳市', '1', '-0-471-', 'S', '', '0', '1458283907', '0', '0');
INSERT INTO `sr_area` VALUES ('473', '472', '和平区', '2', '-0-471-472-', 'H', '', '0', '1458283908', '0', '0');
INSERT INTO `sr_area` VALUES ('474', '472', '沈河区', '2', '-0-471-472-', 'S', '', '0', '1458283909', '0', '0');
INSERT INTO `sr_area` VALUES ('475', '472', '大东区', '2', '-0-471-472-', 'D', '', '0', '1458283910', '0', '0');
INSERT INTO `sr_area` VALUES ('476', '472', '皇姑区', '2', '-0-471-472-', 'H', '', '0', '1458283911', '0', '0');
INSERT INTO `sr_area` VALUES ('477', '472', '铁西区', '2', '-0-471-472-', 'T', '', '0', '1458283912', '0', '0');
INSERT INTO `sr_area` VALUES ('478', '472', '苏家屯区', '2', '-0-471-472-', 'S', '', '0', '1458283913', '0', '0');
INSERT INTO `sr_area` VALUES ('479', '472', '东陵区', '2', '-0-471-472-', 'D', '', '0', '1458283914', '0', '0');
INSERT INTO `sr_area` VALUES ('480', '472', '沈北新区', '2', '-0-471-472-', 'S', '', '0', '1458283915', '0', '0');
INSERT INTO `sr_area` VALUES ('481', '472', '于洪区', '2', '-0-471-472-', 'Y', '', '0', '1458283916', '0', '0');
INSERT INTO `sr_area` VALUES ('482', '472', '辽中县', '2', '-0-471-472-', 'L', '', '0', '1458283917', '0', '0');
INSERT INTO `sr_area` VALUES ('483', '472', '康平县', '2', '-0-471-472-', 'K', '', '0', '1458283918', '0', '0');
INSERT INTO `sr_area` VALUES ('484', '472', '法库县', '2', '-0-471-472-', 'F', '', '0', '1458283919', '0', '0');
INSERT INTO `sr_area` VALUES ('485', '472', '新民市', '2', '-0-471-472-', 'X', '', '0', '1458283920', '0', '0');
INSERT INTO `sr_area` VALUES ('486', '471', '大连市', '1', '-0-471-', 'D', '', '0', '1458283921', '0', '0');
INSERT INTO `sr_area` VALUES ('487', '486', '中山区', '2', '-0-471-486-', 'Z', '', '0', '1458283922', '0', '0');
INSERT INTO `sr_area` VALUES ('488', '486', '西岗区', '2', '-0-471-486-', 'X', '', '0', '1458283923', '0', '0');
INSERT INTO `sr_area` VALUES ('489', '486', '沙河口区', '2', '-0-471-486-', 'S', '', '0', '1458283924', '0', '0');
INSERT INTO `sr_area` VALUES ('490', '486', '甘井子区', '2', '-0-471-486-', 'G', '', '0', '1458283925', '0', '0');
INSERT INTO `sr_area` VALUES ('491', '486', '旅顺口区', '2', '-0-471-486-', 'L', '', '0', '1458283926', '0', '0');
INSERT INTO `sr_area` VALUES ('492', '486', '金州区', '2', '-0-471-486-', 'J', '', '0', '1458283927', '0', '0');
INSERT INTO `sr_area` VALUES ('493', '486', '长海县', '2', '-0-471-486-', 'C', '', '0', '1458283928', '0', '0');
INSERT INTO `sr_area` VALUES ('494', '486', '瓦房店市', '2', '-0-471-486-', 'W', '', '0', '1458283929', '0', '0');
INSERT INTO `sr_area` VALUES ('495', '486', '普兰店市', '2', '-0-471-486-', 'P', '', '0', '1458283930', '0', '0');
INSERT INTO `sr_area` VALUES ('496', '486', '庄河市', '2', '-0-471-486-', 'Z', '', '0', '1458283931', '0', '0');
INSERT INTO `sr_area` VALUES ('497', '471', '鞍山市', '1', '-0-471-', 'A', '', '0', '1458283932', '0', '0');
INSERT INTO `sr_area` VALUES ('498', '497', '铁东区', '2', '-0-471-497-', 'T', '', '0', '1458283933', '0', '0');
INSERT INTO `sr_area` VALUES ('499', '497', '铁西区', '2', '-0-471-497-', 'T', '', '0', '1458283934', '0', '0');
INSERT INTO `sr_area` VALUES ('500', '497', '立山区', '2', '-0-471-497-', 'L', '', '0', '1458283935', '0', '0');
INSERT INTO `sr_area` VALUES ('501', '497', '千山区', '2', '-0-471-497-', 'Q', '', '0', '1458283936', '0', '0');
INSERT INTO `sr_area` VALUES ('502', '497', '台安县', '2', '-0-471-497-', 'T', '', '0', '1458283937', '0', '0');
INSERT INTO `sr_area` VALUES ('503', '497', '岫岩满族自治县', '2', '-0-471-497-', '', '', '0', '1458283938', '0', '0');
INSERT INTO `sr_area` VALUES ('504', '497', '海城市', '2', '-0-471-497-', 'H', '', '0', '1458283939', '0', '0');
INSERT INTO `sr_area` VALUES ('505', '471', '抚顺市', '1', '-0-471-', 'F', '', '0', '1458283940', '0', '0');
INSERT INTO `sr_area` VALUES ('506', '505', '新抚区', '2', '-0-471-505-', 'X', '', '0', '1458283941', '0', '0');
INSERT INTO `sr_area` VALUES ('507', '505', '东洲区', '2', '-0-471-505-', 'D', '', '0', '1458283942', '0', '0');
INSERT INTO `sr_area` VALUES ('508', '505', '望花区', '2', '-0-471-505-', 'W', '', '0', '1458283943', '0', '0');
INSERT INTO `sr_area` VALUES ('509', '505', '顺城区', '2', '-0-471-505-', 'S', '', '0', '1458283944', '0', '0');
INSERT INTO `sr_area` VALUES ('510', '505', '抚顺县', '2', '-0-471-505-', 'F', '', '0', '1458283945', '0', '0');
INSERT INTO `sr_area` VALUES ('511', '505', '新宾满族自治县', '2', '-0-471-505-', 'X', '', '0', '1458283946', '0', '0');
INSERT INTO `sr_area` VALUES ('512', '505', '清原满族自治县', '2', '-0-471-505-', 'Q', '', '0', '1458283947', '0', '0');
INSERT INTO `sr_area` VALUES ('513', '471', '本溪市', '1', '-0-471-', 'B', '', '0', '1458283948', '0', '0');
INSERT INTO `sr_area` VALUES ('514', '513', '平山区', '2', '-0-471-513-', 'P', '', '0', '1458283949', '0', '0');
INSERT INTO `sr_area` VALUES ('515', '513', '溪湖区', '2', '-0-471-513-', 'X', '', '0', '1458283950', '0', '0');
INSERT INTO `sr_area` VALUES ('516', '513', '明山区', '2', '-0-471-513-', 'M', '', '0', '1458283951', '0', '0');
INSERT INTO `sr_area` VALUES ('517', '513', '南芬区', '2', '-0-471-513-', 'N', '', '0', '1458283952', '0', '0');
INSERT INTO `sr_area` VALUES ('518', '513', '本溪满族自治县', '2', '-0-471-513-', 'B', '', '0', '1458283953', '0', '0');
INSERT INTO `sr_area` VALUES ('519', '513', '桓仁满族自治县', '2', '-0-471-513-', 'H', '', '0', '1458283954', '0', '0');
INSERT INTO `sr_area` VALUES ('520', '471', '丹东市', '1', '-0-471-', 'D', '', '0', '1458283955', '0', '0');
INSERT INTO `sr_area` VALUES ('521', '520', '元宝区', '2', '-0-471-520-', 'Y', '', '0', '1458283956', '0', '0');
INSERT INTO `sr_area` VALUES ('522', '520', '振兴区', '2', '-0-471-520-', 'Z', '', '0', '1458283957', '0', '0');
INSERT INTO `sr_area` VALUES ('523', '520', '振安区', '2', '-0-471-520-', 'Z', '', '0', '1458283958', '0', '0');
INSERT INTO `sr_area` VALUES ('524', '520', '宽甸满族自治县', '2', '-0-471-520-', 'K', '', '0', '1458283959', '0', '0');
INSERT INTO `sr_area` VALUES ('525', '520', '东港市', '2', '-0-471-520-', 'D', '', '0', '1458283960', '0', '0');
INSERT INTO `sr_area` VALUES ('526', '520', '凤城市', '2', '-0-471-520-', 'F', '', '0', '1458283961', '0', '0');
INSERT INTO `sr_area` VALUES ('527', '471', '锦州市', '1', '-0-471-', 'J', '', '0', '1458283962', '0', '0');
INSERT INTO `sr_area` VALUES ('528', '527', '古塔区', '2', '-0-471-527-', 'G', '', '0', '1458283963', '0', '0');
INSERT INTO `sr_area` VALUES ('529', '527', '凌河区', '2', '-0-471-527-', 'L', '', '0', '1458283964', '0', '0');
INSERT INTO `sr_area` VALUES ('530', '527', '太和区', '2', '-0-471-527-', 'T', '', '0', '1458283965', '0', '0');
INSERT INTO `sr_area` VALUES ('531', '527', '黑山县', '2', '-0-471-527-', 'H', '', '0', '1458283966', '0', '0');
INSERT INTO `sr_area` VALUES ('532', '527', '义县', '2', '-0-471-527-', 'Y', '', '0', '1458283967', '0', '0');
INSERT INTO `sr_area` VALUES ('533', '527', '凌海市', '2', '-0-471-527-', 'L', '', '0', '1458283968', '0', '0');
INSERT INTO `sr_area` VALUES ('534', '527', '北镇市', '2', '-0-471-527-', 'B', '', '0', '1458283969', '0', '0');
INSERT INTO `sr_area` VALUES ('535', '471', '营口市', '1', '-0-471-', 'Y', '', '0', '1458283970', '0', '0');
INSERT INTO `sr_area` VALUES ('536', '535', '站前区', '2', '-0-471-535-', 'Z', '', '0', '1458283971', '0', '0');
INSERT INTO `sr_area` VALUES ('537', '535', '西市区', '2', '-0-471-535-', 'X', '', '0', '1458283972', '0', '0');
INSERT INTO `sr_area` VALUES ('538', '535', '鲅鱼圈区', '2', '-0-471-535-', '', '', '0', '1458283973', '0', '0');
INSERT INTO `sr_area` VALUES ('539', '535', '老边区', '2', '-0-471-535-', 'L', '', '0', '1458283974', '0', '0');
INSERT INTO `sr_area` VALUES ('540', '535', '盖州市', '2', '-0-471-535-', 'G', '', '0', '1458283975', '0', '0');
INSERT INTO `sr_area` VALUES ('541', '535', '大石桥市', '2', '-0-471-535-', 'D', '', '0', '1458283976', '0', '0');
INSERT INTO `sr_area` VALUES ('542', '471', '阜新市', '1', '-0-471-', 'F', '', '0', '1458283977', '0', '0');
INSERT INTO `sr_area` VALUES ('543', '542', '海州区', '2', '-0-471-542-', 'H', '', '0', '1458283978', '0', '0');
INSERT INTO `sr_area` VALUES ('544', '542', '新邱区', '2', '-0-471-542-', 'X', '', '0', '1458283979', '0', '0');
INSERT INTO `sr_area` VALUES ('545', '542', '太平区', '2', '-0-471-542-', 'T', '', '0', '1458283980', '0', '0');
INSERT INTO `sr_area` VALUES ('546', '542', '清河门区', '2', '-0-471-542-', 'Q', '', '0', '1458283981', '0', '0');
INSERT INTO `sr_area` VALUES ('547', '542', '细河区', '2', '-0-471-542-', 'X', '', '0', '1458283982', '0', '0');
INSERT INTO `sr_area` VALUES ('548', '542', '阜新蒙古族自治县', '2', '-0-471-542-', 'F', '', '0', '1458283983', '0', '0');
INSERT INTO `sr_area` VALUES ('549', '542', '彰武县', '2', '-0-471-542-', 'Z', '', '0', '1458283984', '0', '0');
INSERT INTO `sr_area` VALUES ('550', '471', '辽阳市', '1', '-0-471-', 'L', '', '0', '1458283985', '0', '0');
INSERT INTO `sr_area` VALUES ('551', '550', '白塔区', '2', '-0-471-550-', 'B', '', '0', '1458283986', '0', '0');
INSERT INTO `sr_area` VALUES ('552', '550', '文圣区', '2', '-0-471-550-', 'W', '', '0', '1458283987', '0', '0');
INSERT INTO `sr_area` VALUES ('553', '550', '宏伟区', '2', '-0-471-550-', 'H', '', '0', '1458283988', '0', '0');
INSERT INTO `sr_area` VALUES ('554', '550', '弓长岭区', '2', '-0-471-550-', 'G', '', '0', '1458283989', '0', '0');
INSERT INTO `sr_area` VALUES ('555', '550', '太子河区', '2', '-0-471-550-', 'T', '', '0', '1458283990', '0', '0');
INSERT INTO `sr_area` VALUES ('556', '550', '辽阳县', '2', '-0-471-550-', 'L', '', '0', '1458283991', '0', '0');
INSERT INTO `sr_area` VALUES ('557', '550', '灯塔市', '2', '-0-471-550-', 'D', '', '0', '1458283992', '0', '0');
INSERT INTO `sr_area` VALUES ('558', '471', '盘锦市', '1', '-0-471-', 'P', '', '0', '1458283993', '0', '0');
INSERT INTO `sr_area` VALUES ('559', '558', '双台子区', '2', '-0-471-558-', 'S', '', '0', '1458283994', '0', '0');
INSERT INTO `sr_area` VALUES ('560', '558', '兴隆台区', '2', '-0-471-558-', 'X', '', '0', '1458283995', '0', '0');
INSERT INTO `sr_area` VALUES ('561', '558', '大洼县', '2', '-0-471-558-', 'D', '', '0', '1458283996', '0', '0');
INSERT INTO `sr_area` VALUES ('562', '558', '盘山县', '2', '-0-471-558-', 'P', '', '0', '1458283997', '0', '0');
INSERT INTO `sr_area` VALUES ('563', '471', '铁岭市', '1', '-0-471-', 'T', '', '0', '1458283998', '0', '0');
INSERT INTO `sr_area` VALUES ('564', '563', '银州区', '2', '-0-471-563-', 'Y', '', '0', '1458283999', '0', '0');
INSERT INTO `sr_area` VALUES ('565', '563', '清河区', '2', '-0-471-563-', 'Q', '', '0', '1458284000', '0', '0');
INSERT INTO `sr_area` VALUES ('566', '563', '铁岭县', '2', '-0-471-563-', 'T', '', '0', '1458284001', '0', '0');
INSERT INTO `sr_area` VALUES ('567', '563', '西丰县', '2', '-0-471-563-', 'X', '', '0', '1458284002', '0', '0');
INSERT INTO `sr_area` VALUES ('568', '563', '昌图县', '2', '-0-471-563-', 'C', '', '0', '1458284003', '0', '0');
INSERT INTO `sr_area` VALUES ('569', '563', '调兵山市', '2', '-0-471-563-', 'D', '', '0', '1458284004', '0', '0');
INSERT INTO `sr_area` VALUES ('570', '563', '开原市', '2', '-0-471-563-', 'K', '', '0', '1458284005', '0', '0');
INSERT INTO `sr_area` VALUES ('571', '471', '朝阳市', '1', '-0-471-', 'C', '', '0', '1458284006', '0', '0');
INSERT INTO `sr_area` VALUES ('572', '571', '双塔区', '2', '-0-471-571-', 'S', '', '0', '1458284007', '0', '0');
INSERT INTO `sr_area` VALUES ('573', '571', '龙城区', '2', '-0-471-571-', 'L', '', '0', '1458284008', '0', '0');
INSERT INTO `sr_area` VALUES ('574', '571', '朝阳县', '2', '-0-471-571-', 'C', '', '0', '1458284009', '0', '0');
INSERT INTO `sr_area` VALUES ('575', '571', '建平县', '2', '-0-471-571-', 'J', '', '0', '1458284010', '0', '0');
INSERT INTO `sr_area` VALUES ('576', '571', '喀喇沁左翼蒙古族自治县', '2', '-0-471-571-', 'K', '', '0', '1458284011', '0', '0');
INSERT INTO `sr_area` VALUES ('577', '571', '北票市', '2', '-0-471-571-', 'B', '', '0', '1458284012', '0', '0');
INSERT INTO `sr_area` VALUES ('578', '571', '凌源市', '2', '-0-471-571-', 'L', '', '0', '1458284013', '0', '0');
INSERT INTO `sr_area` VALUES ('579', '471', '葫芦岛市', '1', '-0-471-', 'H', '', '0', '1458284014', '0', '0');
INSERT INTO `sr_area` VALUES ('580', '579', '连山区', '2', '-0-471-579-', 'L', '', '0', '1458284015', '0', '0');
INSERT INTO `sr_area` VALUES ('581', '579', '龙港区', '2', '-0-471-579-', 'L', '', '0', '1458284016', '0', '0');
INSERT INTO `sr_area` VALUES ('582', '579', '南票区', '2', '-0-471-579-', 'N', '', '0', '1458284017', '0', '0');
INSERT INTO `sr_area` VALUES ('583', '579', '绥中县', '2', '-0-471-579-', 'S', '', '0', '1458284018', '0', '0');
INSERT INTO `sr_area` VALUES ('584', '579', '建昌县', '2', '-0-471-579-', 'J', '', '0', '1458284019', '0', '0');
INSERT INTO `sr_area` VALUES ('585', '579', '兴城市', '2', '-0-471-579-', 'X', '', '0', '1458284020', '0', '0');
INSERT INTO `sr_area` VALUES ('586', '0', '吉林', '0', '-0-', 'J', '东北', '0', '1458284021', '0', '0');
INSERT INTO `sr_area` VALUES ('587', '586', '长春市', '1', '-0-586-', 'C', '', '0', '1458284022', '0', '0');
INSERT INTO `sr_area` VALUES ('588', '587', '南关区', '2', '-0-586-587-', 'N', '', '0', '1458284023', '0', '0');
INSERT INTO `sr_area` VALUES ('589', '587', '宽城区', '2', '-0-586-587-', 'K', '', '0', '1458284024', '0', '0');
INSERT INTO `sr_area` VALUES ('590', '587', '朝阳区', '2', '-0-586-587-', 'C', '', '0', '1458284025', '0', '0');
INSERT INTO `sr_area` VALUES ('591', '587', '二道区', '2', '-0-586-587-', 'E', '', '0', '1458284026', '0', '0');
INSERT INTO `sr_area` VALUES ('592', '587', '绿园区', '2', '-0-586-587-', 'L', '', '0', '1458284027', '0', '0');
INSERT INTO `sr_area` VALUES ('593', '587', '双阳区', '2', '-0-586-587-', 'S', '', '0', '1458284028', '0', '0');
INSERT INTO `sr_area` VALUES ('594', '587', '农安县', '2', '-0-586-587-', 'N', '', '0', '1458284029', '0', '0');
INSERT INTO `sr_area` VALUES ('595', '587', '九台市', '2', '-0-586-587-', 'J', '', '0', '1458284030', '0', '0');
INSERT INTO `sr_area` VALUES ('596', '587', '榆树市', '2', '-0-586-587-', 'Y', '', '0', '1458284031', '0', '0');
INSERT INTO `sr_area` VALUES ('597', '587', '德惠市', '2', '-0-586-587-', 'D', '', '0', '1458284032', '0', '0');
INSERT INTO `sr_area` VALUES ('598', '586', '吉林市', '1', '-0-586-', 'J', '', '0', '1458284033', '0', '0');
INSERT INTO `sr_area` VALUES ('599', '598', '昌邑区', '2', '-0-586-598-', 'C', '', '0', '1458284034', '0', '0');
INSERT INTO `sr_area` VALUES ('600', '598', '龙潭区', '2', '-0-586-598-', 'L', '', '0', '1458284035', '0', '0');
INSERT INTO `sr_area` VALUES ('601', '598', '船营区', '2', '-0-586-598-', 'C', '', '0', '1458284036', '0', '0');
INSERT INTO `sr_area` VALUES ('602', '598', '丰满区', '2', '-0-586-598-', 'F', '', '0', '1458284037', '0', '0');
INSERT INTO `sr_area` VALUES ('603', '598', '永吉县', '2', '-0-586-598-', 'Y', '', '0', '1458284038', '0', '0');
INSERT INTO `sr_area` VALUES ('604', '598', '蛟河市', '2', '-0-586-598-', '', '', '0', '1458284039', '0', '0');
INSERT INTO `sr_area` VALUES ('605', '598', '桦甸市', '2', '-0-586-598-', '', '', '0', '1458284040', '0', '0');
INSERT INTO `sr_area` VALUES ('606', '598', '舒兰市', '2', '-0-586-598-', 'S', '', '0', '1458284041', '0', '0');
INSERT INTO `sr_area` VALUES ('607', '598', '磐石市', '2', '-0-586-598-', 'P', '', '0', '1458284042', '0', '0');
INSERT INTO `sr_area` VALUES ('608', '586', '四平市', '1', '-0-586-', 'S', '', '0', '1458284043', '0', '0');
INSERT INTO `sr_area` VALUES ('609', '608', '铁西区', '2', '-0-586-608-', 'T', '', '0', '1458284044', '0', '0');
INSERT INTO `sr_area` VALUES ('610', '608', '铁东区', '2', '-0-586-608-', 'T', '', '0', '1458284045', '0', '0');
INSERT INTO `sr_area` VALUES ('611', '608', '梨树县', '2', '-0-586-608-', 'L', '', '0', '1458284046', '0', '0');
INSERT INTO `sr_area` VALUES ('612', '608', '伊通满族自治县', '2', '-0-586-608-', 'Y', '', '0', '1458284047', '0', '0');
INSERT INTO `sr_area` VALUES ('613', '608', '公主岭市', '2', '-0-586-608-', 'G', '', '0', '1458284048', '0', '0');
INSERT INTO `sr_area` VALUES ('614', '608', '双辽市', '2', '-0-586-608-', 'S', '', '0', '1458284049', '0', '0');
INSERT INTO `sr_area` VALUES ('615', '586', '辽源市', '1', '-0-586-', 'L', '', '0', '1458284050', '0', '0');
INSERT INTO `sr_area` VALUES ('616', '615', '龙山区', '2', '-0-586-615-', 'L', '', '0', '1458284051', '0', '0');
INSERT INTO `sr_area` VALUES ('617', '615', '西安区', '2', '-0-586-615-', 'X', '', '0', '1458284052', '0', '0');
INSERT INTO `sr_area` VALUES ('618', '615', '东丰县', '2', '-0-586-615-', 'D', '', '0', '1458284053', '0', '0');
INSERT INTO `sr_area` VALUES ('619', '615', '东辽县', '2', '-0-586-615-', 'D', '', '0', '1458284054', '0', '0');
INSERT INTO `sr_area` VALUES ('620', '586', '通化市', '1', '-0-586-', 'T', '', '0', '1458284055', '0', '0');
INSERT INTO `sr_area` VALUES ('621', '620', '东昌区', '2', '-0-586-620-', 'D', '', '0', '1458284056', '0', '0');
INSERT INTO `sr_area` VALUES ('622', '620', '二道江区', '2', '-0-586-620-', 'E', '', '0', '1458284057', '0', '0');
INSERT INTO `sr_area` VALUES ('623', '620', '通化县', '2', '-0-586-620-', 'T', '', '0', '1458284058', '0', '0');
INSERT INTO `sr_area` VALUES ('624', '620', '辉南县', '2', '-0-586-620-', 'H', '', '0', '1458284059', '0', '0');
INSERT INTO `sr_area` VALUES ('625', '620', '柳河县', '2', '-0-586-620-', 'L', '', '0', '1458284060', '0', '0');
INSERT INTO `sr_area` VALUES ('626', '620', '梅河口市', '2', '-0-586-620-', 'M', '', '0', '1458284061', '0', '0');
INSERT INTO `sr_area` VALUES ('627', '620', '集安市', '2', '-0-586-620-', 'J', '', '0', '1458284062', '0', '0');
INSERT INTO `sr_area` VALUES ('628', '586', '白山市', '1', '-0-586-', 'B', '', '0', '1458284063', '0', '0');
INSERT INTO `sr_area` VALUES ('629', '628', '八道江区', '2', '-0-586-628-', 'B', '', '0', '1458284064', '0', '0');
INSERT INTO `sr_area` VALUES ('630', '628', '  江源区', '2', '-0-586-628-', '', '', '0', '1458284065', '0', '0');
INSERT INTO `sr_area` VALUES ('631', '628', '抚松县', '2', '-0-586-628-', 'F', '', '0', '1458284066', '0', '0');
INSERT INTO `sr_area` VALUES ('632', '628', '靖宇县', '2', '-0-586-628-', 'J', '', '0', '1458284067', '0', '0');
INSERT INTO `sr_area` VALUES ('633', '628', '长白朝鲜族自治县', '2', '-0-586-628-', 'C', '', '0', '1458284068', '0', '0');
INSERT INTO `sr_area` VALUES ('634', '628', '临江市', '2', '-0-586-628-', 'L', '', '0', '1458284069', '0', '0');
INSERT INTO `sr_area` VALUES ('635', '586', '松原市', '1', '-0-586-', 'S', '', '0', '1458284070', '0', '0');
INSERT INTO `sr_area` VALUES ('636', '635', '宁江区', '2', '-0-586-635-', 'N', '', '0', '1458284071', '0', '0');
INSERT INTO `sr_area` VALUES ('637', '635', '前郭尔罗斯蒙古族自治县', '2', '-0-586-635-', 'Q', '', '0', '1458284072', '0', '0');
INSERT INTO `sr_area` VALUES ('638', '635', '长岭县', '2', '-0-586-635-', 'C', '', '0', '1458284073', '0', '0');
INSERT INTO `sr_area` VALUES ('639', '635', '乾安县', '2', '-0-586-635-', 'Q', '', '0', '1458284074', '0', '0');
INSERT INTO `sr_area` VALUES ('640', '635', '扶余县', '2', '-0-586-635-', 'F', '', '0', '1458284075', '0', '0');
INSERT INTO `sr_area` VALUES ('641', '586', '白城市', '1', '-0-586-', 'B', '', '0', '1458284076', '0', '0');
INSERT INTO `sr_area` VALUES ('642', '641', '洮北区', '2', '-0-586-641-', '', '', '0', '1458284077', '0', '0');
INSERT INTO `sr_area` VALUES ('643', '641', '镇赉县', '2', '-0-586-641-', 'Z', '', '0', '1458284078', '0', '0');
INSERT INTO `sr_area` VALUES ('644', '641', '通榆县', '2', '-0-586-641-', 'T', '', '0', '1458284079', '0', '0');
INSERT INTO `sr_area` VALUES ('645', '641', '洮南市', '2', '-0-586-641-', '', '', '0', '1458284080', '0', '0');
INSERT INTO `sr_area` VALUES ('646', '641', '大安市', '2', '-0-586-641-', 'D', '', '0', '1458284081', '0', '0');
INSERT INTO `sr_area` VALUES ('647', '586', '延边朝鲜族自治州', '1', '-0-586-', 'Y', '', '0', '1458284082', '0', '0');
INSERT INTO `sr_area` VALUES ('648', '647', '延吉市', '2', '-0-586-647-', 'Y', '', '0', '1458284083', '0', '0');
INSERT INTO `sr_area` VALUES ('649', '647', '图们市', '2', '-0-586-647-', 'T', '', '0', '1458284084', '0', '0');
INSERT INTO `sr_area` VALUES ('650', '647', '敦化市', '2', '-0-586-647-', 'D', '', '0', '1458284085', '0', '0');
INSERT INTO `sr_area` VALUES ('651', '647', '珲春市', '2', '-0-586-647-', '', '', '0', '1458284086', '0', '0');
INSERT INTO `sr_area` VALUES ('652', '647', '龙井市', '2', '-0-586-647-', 'L', '', '0', '1458284087', '0', '0');
INSERT INTO `sr_area` VALUES ('653', '647', '和龙市', '2', '-0-586-647-', 'H', '', '0', '1458284088', '0', '0');
INSERT INTO `sr_area` VALUES ('654', '647', '汪清县', '2', '-0-586-647-', 'W', '', '0', '1458284089', '0', '0');
INSERT INTO `sr_area` VALUES ('655', '647', '安图县', '2', '-0-586-647-', 'A', '', '0', '1458284090', '0', '0');
INSERT INTO `sr_area` VALUES ('656', '0', '黑龙江', '0', '-0-', 'H', '东北', '0', '1458284091', '0', '0');
INSERT INTO `sr_area` VALUES ('657', '656', '哈尔滨市', '1', '-0-656-', 'H', '', '0', '1458284092', '0', '0');
INSERT INTO `sr_area` VALUES ('658', '657', '道里区', '2', '-0-656-657-', 'D', '', '0', '1458284093', '0', '0');
INSERT INTO `sr_area` VALUES ('659', '657', '南岗区', '2', '-0-656-657-', 'N', '', '0', '1458284094', '0', '0');
INSERT INTO `sr_area` VALUES ('660', '657', '道外区', '2', '-0-656-657-', 'D', '', '0', '1458284095', '0', '0');
INSERT INTO `sr_area` VALUES ('661', '657', '平房区', '2', '-0-656-657-', 'P', '', '0', '1458284096', '0', '0');
INSERT INTO `sr_area` VALUES ('662', '657', '松北区', '2', '-0-656-657-', 'S', '', '0', '1458284097', '0', '0');
INSERT INTO `sr_area` VALUES ('663', '657', '香坊区', '2', '-0-656-657-', 'X', '', '0', '1458284098', '0', '0');
INSERT INTO `sr_area` VALUES ('664', '657', '呼兰区', '2', '-0-656-657-', 'H', '', '0', '1458284099', '0', '0');
INSERT INTO `sr_area` VALUES ('665', '657', '阿城区                 ', '2', '-0-656-657-', 'A', '', '0', '1458284100', '0', '0');
INSERT INTO `sr_area` VALUES ('666', '657', '依兰县', '2', '-0-656-657-', 'Y', '', '0', '1458284101', '0', '0');
INSERT INTO `sr_area` VALUES ('667', '657', '方正县', '2', '-0-656-657-', 'F', '', '0', '1458284102', '0', '0');
INSERT INTO `sr_area` VALUES ('668', '657', '宾县', '2', '-0-656-657-', 'B', '', '0', '1458284103', '0', '0');
INSERT INTO `sr_area` VALUES ('669', '657', '巴彦县', '2', '-0-656-657-', 'B', '', '0', '1458284104', '0', '0');
INSERT INTO `sr_area` VALUES ('670', '657', '木兰县', '2', '-0-656-657-', 'M', '', '0', '1458284105', '0', '0');
INSERT INTO `sr_area` VALUES ('671', '657', '通河县', '2', '-0-656-657-', 'T', '', '0', '1458284106', '0', '0');
INSERT INTO `sr_area` VALUES ('672', '657', '延寿县', '2', '-0-656-657-', 'Y', '', '0', '1458284107', '0', '0');
INSERT INTO `sr_area` VALUES ('673', '657', '双城市', '2', '-0-656-657-', 'S', '', '0', '1458284108', '0', '0');
INSERT INTO `sr_area` VALUES ('674', '657', '尚志市', '2', '-0-656-657-', 'S', '', '0', '1458284109', '0', '0');
INSERT INTO `sr_area` VALUES ('675', '657', '五常市', '2', '-0-656-657-', 'W', '', '0', '1458284110', '0', '0');
INSERT INTO `sr_area` VALUES ('676', '656', '齐齐哈尔市', '1', '-0-656-', 'Q', '', '0', '1458284111', '0', '0');
INSERT INTO `sr_area` VALUES ('677', '676', '龙沙区', '2', '-0-656-676-', 'L', '', '0', '1458284112', '0', '0');
INSERT INTO `sr_area` VALUES ('678', '676', '建华区', '2', '-0-656-676-', 'J', '', '0', '1458284113', '0', '0');
INSERT INTO `sr_area` VALUES ('679', '676', '铁锋区', '2', '-0-656-676-', 'T', '', '0', '1458284114', '0', '0');
INSERT INTO `sr_area` VALUES ('680', '676', '昂昂溪区', '2', '-0-656-676-', 'A', '', '0', '1458284115', '0', '0');
INSERT INTO `sr_area` VALUES ('681', '676', '富拉尔基区', '2', '-0-656-676-', 'F', '', '0', '1458284116', '0', '0');
INSERT INTO `sr_area` VALUES ('682', '676', '碾子山区', '2', '-0-656-676-', 'N', '', '0', '1458284117', '0', '0');
INSERT INTO `sr_area` VALUES ('683', '676', '梅里斯达斡尔族区', '2', '-0-656-676-', 'M', '', '0', '1458284118', '0', '0');
INSERT INTO `sr_area` VALUES ('684', '676', '龙江县', '2', '-0-656-676-', 'L', '', '0', '1458284119', '0', '0');
INSERT INTO `sr_area` VALUES ('685', '676', '依安县', '2', '-0-656-676-', 'Y', '', '0', '1458284120', '0', '0');
INSERT INTO `sr_area` VALUES ('686', '676', '泰来县', '2', '-0-656-676-', 'T', '', '0', '1458284121', '0', '0');
INSERT INTO `sr_area` VALUES ('687', '676', '甘南县', '2', '-0-656-676-', 'G', '', '0', '1458284122', '0', '0');
INSERT INTO `sr_area` VALUES ('688', '676', '富裕县', '2', '-0-656-676-', 'F', '', '0', '1458284123', '0', '0');
INSERT INTO `sr_area` VALUES ('689', '676', '克山县', '2', '-0-656-676-', 'K', '', '0', '1458284124', '0', '0');
INSERT INTO `sr_area` VALUES ('690', '676', '克东县', '2', '-0-656-676-', 'K', '', '0', '1458284125', '0', '0');
INSERT INTO `sr_area` VALUES ('691', '676', '拜泉县', '2', '-0-656-676-', 'B', '', '0', '1458284126', '0', '0');
INSERT INTO `sr_area` VALUES ('692', '676', '讷河市', '2', '-0-656-676-', '', '', '0', '1458284127', '0', '0');
INSERT INTO `sr_area` VALUES ('693', '656', '鸡西市', '1', '-0-656-', 'J', '', '0', '1458284128', '0', '0');
INSERT INTO `sr_area` VALUES ('694', '693', '鸡冠区', '2', '-0-656-693-', 'J', '', '0', '1458284129', '0', '0');
INSERT INTO `sr_area` VALUES ('695', '693', '恒山区', '2', '-0-656-693-', 'H', '', '0', '1458284130', '0', '0');
INSERT INTO `sr_area` VALUES ('696', '693', '滴道区', '2', '-0-656-693-', 'D', '', '0', '1458284131', '0', '0');
INSERT INTO `sr_area` VALUES ('697', '693', '梨树区', '2', '-0-656-693-', 'L', '', '0', '1458284132', '0', '0');
INSERT INTO `sr_area` VALUES ('698', '693', '城子河区', '2', '-0-656-693-', 'C', '', '0', '1458284133', '0', '0');
INSERT INTO `sr_area` VALUES ('699', '693', '麻山区', '2', '-0-656-693-', 'M', '', '0', '1458284134', '0', '0');
INSERT INTO `sr_area` VALUES ('700', '693', '鸡东县', '2', '-0-656-693-', 'J', '', '0', '1458284135', '0', '0');
INSERT INTO `sr_area` VALUES ('701', '693', '虎林市', '2', '-0-656-693-', 'H', '', '0', '1458284136', '0', '0');
INSERT INTO `sr_area` VALUES ('702', '693', '密山市', '2', '-0-656-693-', 'M', '', '0', '1458284137', '0', '0');
INSERT INTO `sr_area` VALUES ('703', '656', '鹤岗市', '1', '-0-656-', 'H', '', '0', '1458284138', '0', '0');
INSERT INTO `sr_area` VALUES ('704', '703', '向阳区', '2', '-0-656-703-', 'X', '', '0', '1458284139', '0', '0');
INSERT INTO `sr_area` VALUES ('705', '703', '工农区', '2', '-0-656-703-', 'G', '', '0', '1458284140', '0', '0');
INSERT INTO `sr_area` VALUES ('706', '703', '南山区', '2', '-0-656-703-', 'N', '', '0', '1458284141', '0', '0');
INSERT INTO `sr_area` VALUES ('707', '703', '兴安区', '2', '-0-656-703-', 'X', '', '0', '1458284142', '0', '0');
INSERT INTO `sr_area` VALUES ('708', '703', '东山区', '2', '-0-656-703-', 'D', '', '0', '1458284143', '0', '0');
INSERT INTO `sr_area` VALUES ('709', '703', '兴山区', '2', '-0-656-703-', 'X', '', '0', '1458284144', '0', '0');
INSERT INTO `sr_area` VALUES ('710', '703', '萝北县', '2', '-0-656-703-', 'L', '', '0', '1458284145', '0', '0');
INSERT INTO `sr_area` VALUES ('711', '703', '绥滨县', '2', '-0-656-703-', 'S', '', '0', '1458284146', '0', '0');
INSERT INTO `sr_area` VALUES ('712', '656', '双鸭山市', '1', '-0-656-', 'S', '', '0', '1458284147', '0', '0');
INSERT INTO `sr_area` VALUES ('713', '712', '尖山区', '2', '-0-656-712-', 'J', '', '0', '1458284148', '0', '0');
INSERT INTO `sr_area` VALUES ('714', '712', '岭东区', '2', '-0-656-712-', 'L', '', '0', '1458284149', '0', '0');
INSERT INTO `sr_area` VALUES ('715', '712', '四方台区', '2', '-0-656-712-', 'S', '', '0', '1458284150', '0', '0');
INSERT INTO `sr_area` VALUES ('716', '712', '宝山区', '2', '-0-656-712-', 'B', '', '0', '1458284151', '0', '0');
INSERT INTO `sr_area` VALUES ('717', '712', '集贤县', '2', '-0-656-712-', 'J', '', '0', '1458284152', '0', '0');
INSERT INTO `sr_area` VALUES ('718', '712', '友谊县', '2', '-0-656-712-', 'Y', '', '0', '1458284153', '0', '0');
INSERT INTO `sr_area` VALUES ('719', '712', '宝清县', '2', '-0-656-712-', 'B', '', '0', '1458284154', '0', '0');
INSERT INTO `sr_area` VALUES ('720', '712', '饶河县', '2', '-0-656-712-', 'R', '', '0', '1458284155', '0', '0');
INSERT INTO `sr_area` VALUES ('721', '656', '大庆市', '1', '-0-656-', 'D', '', '0', '1458284156', '0', '0');
INSERT INTO `sr_area` VALUES ('722', '721', '萨尔图区', '2', '-0-656-721-', 'S', '', '0', '1458284157', '0', '0');
INSERT INTO `sr_area` VALUES ('723', '721', '龙凤区', '2', '-0-656-721-', 'L', '', '0', '1458284158', '0', '0');
INSERT INTO `sr_area` VALUES ('724', '721', '让胡路区', '2', '-0-656-721-', 'R', '', '0', '1458284159', '0', '0');
INSERT INTO `sr_area` VALUES ('725', '721', '红岗区', '2', '-0-656-721-', 'H', '', '0', '1458284160', '0', '0');
INSERT INTO `sr_area` VALUES ('726', '721', '大同区', '2', '-0-656-721-', 'D', '', '0', '1458284161', '0', '0');
INSERT INTO `sr_area` VALUES ('727', '721', '肇州县', '2', '-0-656-721-', 'Z', '', '0', '1458284162', '0', '0');
INSERT INTO `sr_area` VALUES ('728', '721', '肇源县', '2', '-0-656-721-', 'Z', '', '0', '1458284163', '0', '0');
INSERT INTO `sr_area` VALUES ('729', '721', '林甸县', '2', '-0-656-721-', 'L', '', '0', '1458284164', '0', '0');
INSERT INTO `sr_area` VALUES ('730', '721', '杜尔伯特蒙古族自治县', '2', '-0-656-721-', 'D', '', '1', '1458284165', '0', '0');
INSERT INTO `sr_area` VALUES ('731', '656', '伊春市', '1', '-0-656-', 'Y', '', '0', '1458284166', '0', '0');
INSERT INTO `sr_area` VALUES ('732', '731', '伊春区', '2', '-0-656-731-', 'Y', '', '0', '1458284167', '0', '0');
INSERT INTO `sr_area` VALUES ('733', '731', '南岔区', '2', '-0-656-731-', 'N', '', '0', '1458284168', '0', '0');
INSERT INTO `sr_area` VALUES ('734', '731', '友好区', '2', '-0-656-731-', 'Y', '', '0', '1458284169', '0', '0');
INSERT INTO `sr_area` VALUES ('735', '731', '西林区', '2', '-0-656-731-', 'X', '', '0', '1458284170', '0', '0');
INSERT INTO `sr_area` VALUES ('736', '731', '翠峦区', '2', '-0-656-731-', 'C', '', '0', '1458284171', '0', '0');
INSERT INTO `sr_area` VALUES ('737', '731', '新青区', '2', '-0-656-731-', 'X', '', '0', '1458284172', '0', '0');
INSERT INTO `sr_area` VALUES ('738', '731', '美溪区', '2', '-0-656-731-', 'M', '', '0', '1458284173', '0', '0');
INSERT INTO `sr_area` VALUES ('739', '731', '金山屯区', '2', '-0-656-731-', 'J', '', '0', '1458284174', '0', '0');
INSERT INTO `sr_area` VALUES ('740', '731', '五营区', '2', '-0-656-731-', 'W', '', '0', '1458284175', '0', '0');
INSERT INTO `sr_area` VALUES ('741', '731', '乌马河区', '2', '-0-656-731-', 'W', '', '0', '1458284176', '0', '0');
INSERT INTO `sr_area` VALUES ('742', '731', '汤旺河区', '2', '-0-656-731-', 'T', '', '0', '1458284177', '0', '0');
INSERT INTO `sr_area` VALUES ('743', '731', '带岭区', '2', '-0-656-731-', 'D', '', '0', '1458284178', '0', '0');
INSERT INTO `sr_area` VALUES ('744', '731', '乌伊岭区', '2', '-0-656-731-', 'W', '', '0', '1458284179', '0', '0');
INSERT INTO `sr_area` VALUES ('745', '731', '红星区', '2', '-0-656-731-', 'H', '', '0', '1458284180', '0', '0');
INSERT INTO `sr_area` VALUES ('746', '731', '上甘岭区', '2', '-0-656-731-', 'S', '', '0', '1458284181', '0', '0');
INSERT INTO `sr_area` VALUES ('747', '731', '嘉荫县', '2', '-0-656-731-', 'J', '', '0', '1458284182', '0', '0');
INSERT INTO `sr_area` VALUES ('748', '731', '铁力市', '2', '-0-656-731-', 'T', '', '0', '1458284183', '0', '0');
INSERT INTO `sr_area` VALUES ('749', '656', '佳木斯市', '1', '-0-656-', 'J', '', '0', '1458284184', '0', '0');
INSERT INTO `sr_area` VALUES ('750', '749', '向阳区', '2', '-0-656-749-', 'X', '', '0', '1458284185', '0', '0');
INSERT INTO `sr_area` VALUES ('751', '749', '前进区', '2', '-0-656-749-', 'Q', '', '0', '1458284186', '0', '0');
INSERT INTO `sr_area` VALUES ('752', '749', '东风区', '2', '-0-656-749-', 'D', '', '0', '1458284187', '0', '0');
INSERT INTO `sr_area` VALUES ('753', '749', '郊区', '2', '-0-656-749-', 'J', '', '0', '1458284188', '0', '0');
INSERT INTO `sr_area` VALUES ('754', '749', '桦南县', '2', '-0-656-749-', '', '', '0', '1458284189', '0', '0');
INSERT INTO `sr_area` VALUES ('755', '749', '桦川县', '2', '-0-656-749-', '', '', '0', '1458284190', '0', '0');
INSERT INTO `sr_area` VALUES ('756', '749', '汤原县', '2', '-0-656-749-', 'T', '', '0', '1458284191', '0', '0');
INSERT INTO `sr_area` VALUES ('757', '749', '抚远县', '2', '-0-656-749-', 'F', '', '0', '1458284192', '0', '0');
INSERT INTO `sr_area` VALUES ('758', '749', '同江市', '2', '-0-656-749-', 'T', '', '0', '1458284193', '0', '0');
INSERT INTO `sr_area` VALUES ('759', '749', '富锦市', '2', '-0-656-749-', 'F', '', '0', '1458284194', '0', '0');
INSERT INTO `sr_area` VALUES ('760', '656', '七台河市', '1', '-0-656-', 'Q', '', '0', '1458284195', '0', '0');
INSERT INTO `sr_area` VALUES ('761', '760', '新兴区', '2', '-0-656-760-', 'X', '', '0', '1458284196', '0', '0');
INSERT INTO `sr_area` VALUES ('762', '760', '桃山区', '2', '-0-656-760-', 'T', '', '0', '1458284197', '0', '0');
INSERT INTO `sr_area` VALUES ('763', '760', '茄子河区', '2', '-0-656-760-', 'Q', '', '0', '1458284198', '0', '0');
INSERT INTO `sr_area` VALUES ('764', '760', '勃利县', '2', '-0-656-760-', 'B', '', '0', '1458284199', '0', '0');
INSERT INTO `sr_area` VALUES ('765', '656', '牡丹江市', '1', '-0-656-', 'M', '', '0', '1458284200', '0', '0');
INSERT INTO `sr_area` VALUES ('766', '765', '东安区', '2', '-0-656-765-', 'D', '', '0', '1458284201', '0', '0');
INSERT INTO `sr_area` VALUES ('767', '765', '阳明区', '2', '-0-656-765-', 'Y', '', '0', '1458284202', '0', '0');
INSERT INTO `sr_area` VALUES ('768', '765', '爱民区', '2', '-0-656-765-', 'A', '', '0', '1458284203', '0', '0');
INSERT INTO `sr_area` VALUES ('769', '765', '西安区', '2', '-0-656-765-', 'X', '', '0', '1458284204', '0', '0');
INSERT INTO `sr_area` VALUES ('770', '765', '东宁县', '2', '-0-656-765-', 'D', '', '0', '1458284205', '0', '0');
INSERT INTO `sr_area` VALUES ('771', '765', '林口县', '2', '-0-656-765-', 'L', '', '0', '1458284206', '0', '0');
INSERT INTO `sr_area` VALUES ('772', '765', '绥芬河市', '2', '-0-656-765-', 'S', '', '0', '1458284207', '0', '0');
INSERT INTO `sr_area` VALUES ('773', '765', '海林市', '2', '-0-656-765-', 'H', '', '0', '1458284208', '0', '0');
INSERT INTO `sr_area` VALUES ('774', '765', '宁安市', '2', '-0-656-765-', 'N', '', '0', '1458284209', '0', '0');
INSERT INTO `sr_area` VALUES ('775', '765', '穆棱市', '2', '-0-656-765-', 'M', '', '0', '1458284210', '0', '0');
INSERT INTO `sr_area` VALUES ('776', '656', '黑河市', '1', '-0-656-', 'H', '', '0', '1458284211', '0', '0');
INSERT INTO `sr_area` VALUES ('777', '776', '爱辉区', '2', '-0-656-776-', 'A', '', '0', '1458284212', '0', '0');
INSERT INTO `sr_area` VALUES ('778', '776', '嫩江县', '2', '-0-656-776-', 'N', '', '0', '1458284213', '0', '0');
INSERT INTO `sr_area` VALUES ('779', '776', '逊克县', '2', '-0-656-776-', 'X', '', '0', '1458284214', '0', '0');
INSERT INTO `sr_area` VALUES ('780', '776', '孙吴县', '2', '-0-656-776-', 'S', '', '0', '1458284215', '0', '0');
INSERT INTO `sr_area` VALUES ('781', '776', '北安市', '2', '-0-656-776-', 'B', '', '0', '1458284216', '0', '0');
INSERT INTO `sr_area` VALUES ('782', '776', '五大连池市', '2', '-0-656-776-', 'W', '', '0', '1458284217', '0', '0');
INSERT INTO `sr_area` VALUES ('783', '656', '绥化市', '1', '-0-656-', 'S', '', '0', '1458284218', '0', '0');
INSERT INTO `sr_area` VALUES ('784', '783', '北林区', '2', '-0-656-783-', 'B', '', '0', '1458284219', '0', '0');
INSERT INTO `sr_area` VALUES ('785', '783', '望奎县', '2', '-0-656-783-', 'W', '', '0', '1458284220', '0', '0');
INSERT INTO `sr_area` VALUES ('786', '783', '兰西县', '2', '-0-656-783-', 'L', '', '0', '1458284221', '0', '0');
INSERT INTO `sr_area` VALUES ('787', '783', '青冈县', '2', '-0-656-783-', 'Q', '', '0', '1458284222', '0', '0');
INSERT INTO `sr_area` VALUES ('788', '783', '庆安县', '2', '-0-656-783-', 'Q', '', '0', '1458284223', '0', '0');
INSERT INTO `sr_area` VALUES ('789', '783', '明水县', '2', '-0-656-783-', 'M', '', '0', '1458284224', '0', '0');
INSERT INTO `sr_area` VALUES ('790', '783', '绥棱县', '2', '-0-656-783-', 'S', '', '0', '1458284225', '0', '0');
INSERT INTO `sr_area` VALUES ('791', '783', '安达市', '2', '-0-656-783-', 'A', '', '0', '1458284226', '0', '0');
INSERT INTO `sr_area` VALUES ('792', '783', '肇东市', '2', '-0-656-783-', 'Z', '', '0', '1458284227', '0', '0');
INSERT INTO `sr_area` VALUES ('793', '783', '海伦市', '2', '-0-656-783-', 'H', '', '0', '1458284228', '0', '0');
INSERT INTO `sr_area` VALUES ('794', '656', '大兴安岭地区', '1', '-0-656-', 'D', '', '0', '1458284229', '0', '0');
INSERT INTO `sr_area` VALUES ('795', '794', '加格达奇区', '2', '-0-656-794-', 'J', '', '0', '1458284230', '0', '0');
INSERT INTO `sr_area` VALUES ('796', '794', '松岭区', '2', '-0-656-794-', 'S', '', '0', '1458284231', '0', '0');
INSERT INTO `sr_area` VALUES ('797', '794', '新林区', '2', '-0-656-794-', 'X', '', '0', '1458284232', '0', '0');
INSERT INTO `sr_area` VALUES ('798', '794', '呼中区', '2', '-0-656-794-', 'H', '', '0', '1458284233', '0', '0');
INSERT INTO `sr_area` VALUES ('799', '794', '呼玛县', '2', '-0-656-794-', 'H', '', '0', '1458284234', '0', '0');
INSERT INTO `sr_area` VALUES ('800', '794', '塔河县', '2', '-0-656-794-', 'T', '', '0', '1458284235', '0', '0');
INSERT INTO `sr_area` VALUES ('801', '794', '漠河县', '2', '-0-656-794-', 'M', '', '0', '1458284236', '0', '0');
INSERT INTO `sr_area` VALUES ('802', '0', '上海', '0', '-0-', 'S', '华东', '0', '1458284237', '0', '0');
INSERT INTO `sr_area` VALUES ('803', '802', '上海市', '1', '-0-802-', 'S', '', '0', '1458284238', '0', '0');
INSERT INTO `sr_area` VALUES ('804', '803', '黄浦区', '2', '-0-802-803-', 'H', '', '0', '1458284239', '0', '0');
INSERT INTO `sr_area` VALUES ('805', '803', '卢湾区', '2', '-0-802-803-', 'L', '', '0', '1458284240', '0', '0');
INSERT INTO `sr_area` VALUES ('806', '803', '徐汇区', '2', '-0-802-803-', 'X', '', '0', '1458284241', '0', '0');
INSERT INTO `sr_area` VALUES ('807', '803', '长宁区', '2', '-0-802-803-', 'C', '', '0', '1458284242', '0', '0');
INSERT INTO `sr_area` VALUES ('808', '803', '静安区', '2', '-0-802-803-', 'J', '', '0', '1458284243', '0', '0');
INSERT INTO `sr_area` VALUES ('809', '803', '普陀区', '2', '-0-802-803-', 'P', '', '0', '1458284244', '0', '0');
INSERT INTO `sr_area` VALUES ('810', '803', '闸北区', '2', '-0-802-803-', 'Z', '', '0', '1458284245', '0', '0');
INSERT INTO `sr_area` VALUES ('811', '803', '虹口区', '2', '-0-802-803-', 'H', '', '0', '1458284246', '0', '0');
INSERT INTO `sr_area` VALUES ('812', '803', '杨浦区', '2', '-0-802-803-', 'Y', '', '0', '1458284247', '0', '0');
INSERT INTO `sr_area` VALUES ('813', '803', '闵行区', '2', '-0-802-803-', '', '', '0', '1458284248', '0', '0');
INSERT INTO `sr_area` VALUES ('814', '803', '宝山区', '2', '-0-802-803-', 'B', '', '0', '1458284249', '0', '0');
INSERT INTO `sr_area` VALUES ('815', '803', '嘉定区', '2', '-0-802-803-', 'J', '', '0', '1458284250', '0', '0');
INSERT INTO `sr_area` VALUES ('816', '803', '浦东新区', '2', '-0-802-803-', 'P', '', '0', '1458284251', '0', '0');
INSERT INTO `sr_area` VALUES ('817', '803', '金山区', '2', '-0-802-803-', 'J', '', '0', '1458284252', '0', '0');
INSERT INTO `sr_area` VALUES ('818', '803', '松江区', '2', '-0-802-803-', 'S', '', '0', '1458284253', '0', '0');
INSERT INTO `sr_area` VALUES ('819', '803', '青浦区', '2', '-0-802-803-', 'Q', '', '0', '1458284254', '0', '0');
INSERT INTO `sr_area` VALUES ('820', '803', '南汇区', '2', '-0-802-803-', 'N', '', '0', '1458284255', '0', '0');
INSERT INTO `sr_area` VALUES ('821', '803', '奉贤区', '2', '-0-802-803-', 'F', '', '0', '1458284256', '0', '0');
INSERT INTO `sr_area` VALUES ('822', '803', '崇明县', '2', '-0-802-803-', 'C', '', '0', '1458284257', '0', '0');
INSERT INTO `sr_area` VALUES ('823', '0', '江苏', '0', '-0-', 'J', '华东', '0', '1458284258', '0', '0');
INSERT INTO `sr_area` VALUES ('824', '823', '南京市', '1', '-0-823-', 'N', '', '0', '1458284259', '0', '0');
INSERT INTO `sr_area` VALUES ('825', '824', '玄武区', '2', '-0-823-824-', 'X', '', '0', '1458284260', '0', '0');
INSERT INTO `sr_area` VALUES ('826', '824', '白下区', '2', '-0-823-824-', 'B', '', '0', '1458284261', '0', '0');
INSERT INTO `sr_area` VALUES ('827', '824', '秦淮区', '2', '-0-823-824-', 'Q', '', '0', '1458284262', '0', '0');
INSERT INTO `sr_area` VALUES ('828', '824', '建邺区', '2', '-0-823-824-', 'J', '', '0', '1458284263', '0', '0');
INSERT INTO `sr_area` VALUES ('829', '824', '鼓楼区', '2', '-0-823-824-', 'G', '', '0', '1458284264', '0', '0');
INSERT INTO `sr_area` VALUES ('830', '824', '下关区', '2', '-0-823-824-', 'X', '', '0', '1458284265', '0', '0');
INSERT INTO `sr_area` VALUES ('831', '824', '浦口区', '2', '-0-823-824-', 'P', '', '0', '1458284266', '0', '0');
INSERT INTO `sr_area` VALUES ('832', '824', '栖霞区', '2', '-0-823-824-', 'Q', '', '0', '1458284267', '0', '0');
INSERT INTO `sr_area` VALUES ('833', '824', '雨花台区', '2', '-0-823-824-', 'Y', '', '0', '1458284268', '0', '0');
INSERT INTO `sr_area` VALUES ('834', '824', '江宁区', '2', '-0-823-824-', 'J', '', '0', '1458284269', '0', '0');
INSERT INTO `sr_area` VALUES ('835', '824', '六合区', '2', '-0-823-824-', 'L', '', '0', '1458284270', '0', '0');
INSERT INTO `sr_area` VALUES ('836', '824', '溧水县', '2', '-0-823-824-', '', '', '0', '1458284271', '0', '0');
INSERT INTO `sr_area` VALUES ('837', '824', '高淳县', '2', '-0-823-824-', 'G', '', '0', '1458284272', '0', '0');
INSERT INTO `sr_area` VALUES ('838', '823', '无锡市', '1', '-0-823-', 'W', '', '0', '1458284273', '0', '0');
INSERT INTO `sr_area` VALUES ('839', '838', '崇安区', '2', '-0-823-838-', 'C', '', '0', '1458284274', '0', '0');
INSERT INTO `sr_area` VALUES ('840', '838', '南长区', '2', '-0-823-838-', 'N', '', '0', '1458284275', '0', '0');
INSERT INTO `sr_area` VALUES ('841', '838', '北塘区', '2', '-0-823-838-', 'B', '', '0', '1458284276', '0', '0');
INSERT INTO `sr_area` VALUES ('842', '838', '锡山区', '2', '-0-823-838-', 'X', '', '0', '1458284277', '0', '0');
INSERT INTO `sr_area` VALUES ('843', '838', '惠山区', '2', '-0-823-838-', 'H', '', '0', '1458284278', '0', '0');
INSERT INTO `sr_area` VALUES ('844', '838', '滨湖区', '2', '-0-823-838-', 'B', '', '0', '1458284279', '0', '0');
INSERT INTO `sr_area` VALUES ('845', '838', '江阴市', '2', '-0-823-838-', 'J', '', '0', '1458284280', '0', '0');
INSERT INTO `sr_area` VALUES ('846', '838', '宜兴市', '2', '-0-823-838-', 'Y', '', '0', '1458284281', '0', '0');
INSERT INTO `sr_area` VALUES ('847', '823', '徐州市', '1', '-0-823-', 'X', '', '0', '1458284282', '0', '0');
INSERT INTO `sr_area` VALUES ('848', '847', '鼓楼区', '2', '-0-823-847-', 'G', '', '0', '1458284283', '0', '0');
INSERT INTO `sr_area` VALUES ('849', '847', '云龙区', '2', '-0-823-847-', 'Y', '', '0', '1458284284', '0', '0');
INSERT INTO `sr_area` VALUES ('850', '847', '九里区', '2', '-0-823-847-', 'J', '', '0', '1458284285', '0', '0');
INSERT INTO `sr_area` VALUES ('851', '847', '贾汪区', '2', '-0-823-847-', 'J', '', '0', '1458284286', '0', '0');
INSERT INTO `sr_area` VALUES ('852', '847', '泉山区', '2', '-0-823-847-', 'Q', '', '0', '1458284287', '0', '0');
INSERT INTO `sr_area` VALUES ('853', '847', '丰县', '2', '-0-823-847-', 'F', '', '0', '1458284288', '0', '0');
INSERT INTO `sr_area` VALUES ('854', '847', '沛县', '2', '-0-823-847-', 'P', '', '0', '1458284289', '0', '0');
INSERT INTO `sr_area` VALUES ('855', '847', '铜山县', '2', '-0-823-847-', 'T', '', '0', '1458284290', '0', '0');
INSERT INTO `sr_area` VALUES ('856', '847', '睢宁县', '2', '-0-823-847-', '', '', '0', '1458284291', '0', '0');
INSERT INTO `sr_area` VALUES ('857', '847', '新沂市', '2', '-0-823-847-', 'X', '', '0', '1458284292', '0', '0');
INSERT INTO `sr_area` VALUES ('858', '847', '邳州市', '2', '-0-823-847-', '', '', '0', '1458284293', '0', '0');
INSERT INTO `sr_area` VALUES ('859', '823', '常州市', '1', '-0-823-', 'C', '', '0', '1458284294', '0', '0');
INSERT INTO `sr_area` VALUES ('860', '859', '天宁区', '2', '-0-823-859-', 'T', '', '0', '1458284295', '0', '0');
INSERT INTO `sr_area` VALUES ('861', '859', '钟楼区', '2', '-0-823-859-', 'Z', '', '0', '1458284296', '0', '0');
INSERT INTO `sr_area` VALUES ('862', '859', '戚墅堰区', '2', '-0-823-859-', 'Q', '', '0', '1458284297', '0', '0');
INSERT INTO `sr_area` VALUES ('863', '859', '新北区', '2', '-0-823-859-', 'X', '', '0', '1458284298', '0', '0');
INSERT INTO `sr_area` VALUES ('864', '859', '武进区', '2', '-0-823-859-', 'W', '', '0', '1458284299', '0', '0');
INSERT INTO `sr_area` VALUES ('865', '859', '溧阳市', '2', '-0-823-859-', '', '', '0', '1458284300', '0', '0');
INSERT INTO `sr_area` VALUES ('866', '859', '金坛市', '2', '-0-823-859-', 'J', '', '0', '1458284301', '0', '0');
INSERT INTO `sr_area` VALUES ('867', '823', '苏州市', '1', '-0-823-', 'S', '', '0', '1458284302', '0', '0');
INSERT INTO `sr_area` VALUES ('868', '867', '沧浪区', '2', '-0-823-867-', 'C', '', '0', '1458284303', '0', '0');
INSERT INTO `sr_area` VALUES ('869', '867', '平江区', '2', '-0-823-867-', 'P', '', '0', '1458284304', '0', '0');
INSERT INTO `sr_area` VALUES ('870', '867', '金阊区', '2', '-0-823-867-', 'J', '', '0', '1458284305', '0', '0');
INSERT INTO `sr_area` VALUES ('871', '867', '虎丘区', '2', '-0-823-867-', 'H', '', '0', '1458284306', '0', '0');
INSERT INTO `sr_area` VALUES ('872', '867', '吴中区', '2', '-0-823-867-', 'W', '', '0', '1458284307', '0', '0');
INSERT INTO `sr_area` VALUES ('873', '867', '相城区', '2', '-0-823-867-', 'X', '', '0', '1458284308', '0', '0');
INSERT INTO `sr_area` VALUES ('874', '867', '常熟市', '2', '-0-823-867-', 'C', '', '0', '1458284309', '0', '0');
INSERT INTO `sr_area` VALUES ('875', '867', '张家港市', '2', '-0-823-867-', 'Z', '', '0', '1458284310', '0', '0');
INSERT INTO `sr_area` VALUES ('876', '867', '昆山市', '2', '-0-823-867-', 'K', '', '0', '1458284311', '0', '0');
INSERT INTO `sr_area` VALUES ('877', '867', '吴江市', '2', '-0-823-867-', 'W', '', '0', '1458284312', '0', '0');
INSERT INTO `sr_area` VALUES ('878', '867', '太仓市', '2', '-0-823-867-', 'T', '', '0', '1458284313', '0', '0');
INSERT INTO `sr_area` VALUES ('879', '823', '南通市', '1', '-0-823-', 'N', '', '0', '1458284314', '0', '0');
INSERT INTO `sr_area` VALUES ('880', '879', '崇川区', '2', '-0-823-879-', 'C', '', '0', '1458284315', '0', '0');
INSERT INTO `sr_area` VALUES ('881', '879', '港闸区', '2', '-0-823-879-', 'G', '', '0', '1458284316', '0', '0');
INSERT INTO `sr_area` VALUES ('882', '879', '海安县', '2', '-0-823-879-', 'H', '', '0', '1458284317', '0', '0');
INSERT INTO `sr_area` VALUES ('883', '879', '如东县', '2', '-0-823-879-', 'R', '', '0', '1458284318', '0', '0');
INSERT INTO `sr_area` VALUES ('884', '879', '启东市', '2', '-0-823-879-', 'Q', '', '0', '1458284319', '0', '0');
INSERT INTO `sr_area` VALUES ('885', '879', '如皋市', '2', '-0-823-879-', 'R', '', '0', '1458284320', '0', '0');
INSERT INTO `sr_area` VALUES ('886', '879', '通州市', '2', '-0-823-879-', 'T', '', '0', '1458284321', '0', '0');
INSERT INTO `sr_area` VALUES ('887', '879', '海门市', '2', '-0-823-879-', 'H', '', '0', '1458284322', '0', '0');
INSERT INTO `sr_area` VALUES ('888', '823', '连云港市', '1', '-0-823-', 'L', '', '0', '1458284323', '0', '0');
INSERT INTO `sr_area` VALUES ('889', '888', '连云区', '2', '-0-823-888-', 'L', '', '0', '1458284324', '0', '0');
INSERT INTO `sr_area` VALUES ('890', '888', '新浦区', '2', '-0-823-888-', 'X', '', '0', '1458284325', '0', '0');
INSERT INTO `sr_area` VALUES ('891', '888', '海州区', '2', '-0-823-888-', 'H', '', '0', '1458284326', '0', '0');
INSERT INTO `sr_area` VALUES ('892', '888', '赣榆县', '2', '-0-823-888-', 'G', '', '0', '1458284327', '0', '0');
INSERT INTO `sr_area` VALUES ('893', '888', '东海县', '2', '-0-823-888-', 'D', '', '0', '1458284328', '0', '0');
INSERT INTO `sr_area` VALUES ('894', '888', '灌云县', '2', '-0-823-888-', 'G', '', '0', '1458284329', '0', '0');
INSERT INTO `sr_area` VALUES ('895', '888', '灌南县', '2', '-0-823-888-', 'G', '', '0', '1458284330', '0', '0');
INSERT INTO `sr_area` VALUES ('896', '823', '淮安市', '1', '-0-823-', 'H', '', '0', '1458284331', '0', '0');
INSERT INTO `sr_area` VALUES ('897', '896', '清河区', '2', '-0-823-896-', 'Q', '', '0', '1458284332', '0', '0');
INSERT INTO `sr_area` VALUES ('898', '896', '楚州区', '2', '-0-823-896-', 'C', '', '0', '1458284333', '0', '0');
INSERT INTO `sr_area` VALUES ('899', '896', '淮阴区', '2', '-0-823-896-', 'H', '', '0', '1458284334', '0', '0');
INSERT INTO `sr_area` VALUES ('900', '896', '清浦区', '2', '-0-823-896-', 'Q', '', '0', '1458284335', '0', '0');
INSERT INTO `sr_area` VALUES ('901', '896', '涟水县', '2', '-0-823-896-', 'L', '', '0', '1458284336', '0', '0');
INSERT INTO `sr_area` VALUES ('902', '896', '洪泽县', '2', '-0-823-896-', 'H', '', '0', '1458284337', '0', '0');
INSERT INTO `sr_area` VALUES ('903', '896', '盱眙县', '2', '-0-823-896-', '', '', '0', '1458284338', '0', '0');
INSERT INTO `sr_area` VALUES ('904', '896', '金湖县', '2', '-0-823-896-', 'J', '', '0', '1458284339', '0', '0');
INSERT INTO `sr_area` VALUES ('905', '823', '盐城市', '1', '-0-823-', 'Y', '', '0', '1458284340', '0', '0');
INSERT INTO `sr_area` VALUES ('906', '905', '亭湖区', '2', '-0-823-905-', 'T', '', '0', '1458284341', '0', '0');
INSERT INTO `sr_area` VALUES ('907', '905', '盐都区', '2', '-0-823-905-', 'Y', '', '0', '1458284342', '0', '0');
INSERT INTO `sr_area` VALUES ('908', '905', '响水县', '2', '-0-823-905-', 'X', '', '0', '1458284343', '0', '0');
INSERT INTO `sr_area` VALUES ('909', '905', '滨海县', '2', '-0-823-905-', 'B', '', '0', '1458284344', '0', '0');
INSERT INTO `sr_area` VALUES ('910', '905', '阜宁县', '2', '-0-823-905-', 'F', '', '0', '1458284345', '0', '0');
INSERT INTO `sr_area` VALUES ('911', '905', '射阳县', '2', '-0-823-905-', 'S', '', '0', '1458284346', '0', '0');
INSERT INTO `sr_area` VALUES ('912', '905', '建湖县', '2', '-0-823-905-', 'J', '', '0', '1458284347', '0', '0');
INSERT INTO `sr_area` VALUES ('913', '905', '东台市', '2', '-0-823-905-', 'D', '', '0', '1458284348', '0', '0');
INSERT INTO `sr_area` VALUES ('914', '905', '大丰市', '2', '-0-823-905-', 'D', '', '0', '1458284349', '0', '0');
INSERT INTO `sr_area` VALUES ('915', '823', '扬州市', '1', '-0-823-', 'Y', '', '0', '1458284350', '0', '0');
INSERT INTO `sr_area` VALUES ('916', '915', '广陵区', '2', '-0-823-915-', 'G', '', '0', '1458284351', '0', '0');
INSERT INTO `sr_area` VALUES ('917', '915', '邗江区', '2', '-0-823-915-', '', '', '0', '1458284352', '0', '0');
INSERT INTO `sr_area` VALUES ('918', '915', '维扬区', '2', '-0-823-915-', 'W', '', '0', '1458284353', '0', '0');
INSERT INTO `sr_area` VALUES ('919', '915', '宝应县', '2', '-0-823-915-', 'B', '', '0', '1458284354', '0', '0');
INSERT INTO `sr_area` VALUES ('920', '915', '仪征市', '2', '-0-823-915-', 'Y', '', '0', '1458284355', '0', '0');
INSERT INTO `sr_area` VALUES ('921', '915', '高邮市', '2', '-0-823-915-', 'G', '', '0', '1458284356', '0', '0');
INSERT INTO `sr_area` VALUES ('922', '915', '江都市', '2', '-0-823-915-', 'J', '', '0', '1458284357', '0', '0');
INSERT INTO `sr_area` VALUES ('923', '823', '镇江市', '1', '-0-823-', 'Z', '', '0', '1458284358', '0', '0');
INSERT INTO `sr_area` VALUES ('924', '923', '京口区', '2', '-0-823-923-', 'J', '', '0', '1458284359', '0', '0');
INSERT INTO `sr_area` VALUES ('925', '923', '润州区', '2', '-0-823-923-', 'R', '', '0', '1458284360', '0', '0');
INSERT INTO `sr_area` VALUES ('926', '923', '丹徒区', '2', '-0-823-923-', 'D', '', '0', '1458284361', '0', '0');
INSERT INTO `sr_area` VALUES ('927', '923', '丹阳市', '2', '-0-823-923-', 'D', '', '0', '1458284362', '0', '0');
INSERT INTO `sr_area` VALUES ('928', '923', '扬中市', '2', '-0-823-923-', 'Y', '', '0', '1458284363', '0', '0');
INSERT INTO `sr_area` VALUES ('929', '923', '句容市', '2', '-0-823-923-', 'J', '', '0', '1458284364', '0', '0');
INSERT INTO `sr_area` VALUES ('930', '823', '泰州市', '1', '-0-823-', 'T', '', '0', '1458284365', '0', '0');
INSERT INTO `sr_area` VALUES ('931', '930', '海陵区', '2', '-0-823-930-', 'H', '', '0', '1458284366', '0', '0');
INSERT INTO `sr_area` VALUES ('932', '930', '高港区', '2', '-0-823-930-', 'G', '', '0', '1458284367', '0', '0');
INSERT INTO `sr_area` VALUES ('933', '930', '兴化市', '2', '-0-823-930-', 'X', '', '0', '1458284368', '0', '0');
INSERT INTO `sr_area` VALUES ('934', '930', '靖江市', '2', '-0-823-930-', 'J', '', '0', '1458284369', '0', '0');
INSERT INTO `sr_area` VALUES ('935', '930', '泰兴市', '2', '-0-823-930-', 'T', '', '0', '1458284370', '0', '0');
INSERT INTO `sr_area` VALUES ('936', '930', '姜堰市', '2', '-0-823-930-', 'J', '', '0', '1458284371', '0', '0');
INSERT INTO `sr_area` VALUES ('937', '823', '宿迁市', '1', '-0-823-', 'S', '', '0', '1458284372', '0', '0');
INSERT INTO `sr_area` VALUES ('938', '937', '宿城区', '2', '-0-823-937-', 'S', '', '0', '1458284373', '0', '0');
INSERT INTO `sr_area` VALUES ('939', '937', '宿豫区', '2', '-0-823-937-', 'S', '', '0', '1458284374', '0', '0');
INSERT INTO `sr_area` VALUES ('940', '937', '沭阳县', '2', '-0-823-937-', '', '', '0', '1458284375', '0', '0');
INSERT INTO `sr_area` VALUES ('941', '937', '泗阳县', '2', '-0-823-937-', '', '', '0', '1458284376', '0', '0');
INSERT INTO `sr_area` VALUES ('942', '937', '泗洪县', '2', '-0-823-937-', '', '', '0', '1458284377', '0', '0');
INSERT INTO `sr_area` VALUES ('943', '0', '浙江', '0', '-0-', 'Z', '华东', '0', '1458284378', '0', '0');
INSERT INTO `sr_area` VALUES ('944', '943', '杭州市', '1', '-0-943-', 'H', '', '0', '1458284379', '0', '0');
INSERT INTO `sr_area` VALUES ('945', '944', '上城区', '2', '-0-943-944-', 'S', '', '0', '1458284380', '0', '0');
INSERT INTO `sr_area` VALUES ('946', '944', '下城区', '2', '-0-943-944-', 'X', '', '0', '1458284381', '0', '0');
INSERT INTO `sr_area` VALUES ('947', '944', '江干区', '2', '-0-943-944-', 'J', '', '0', '1458284382', '0', '0');
INSERT INTO `sr_area` VALUES ('948', '944', '拱墅区', '2', '-0-943-944-', 'G', '', '0', '1458284383', '0', '0');
INSERT INTO `sr_area` VALUES ('949', '944', '西湖区', '2', '-0-943-944-', 'X', '', '0', '1458284384', '0', '0');
INSERT INTO `sr_area` VALUES ('950', '944', '滨江区', '2', '-0-943-944-', 'B', '', '0', '1458284385', '0', '0');
INSERT INTO `sr_area` VALUES ('951', '944', '萧山区', '2', '-0-943-944-', 'X', '', '0', '1458284386', '0', '0');
INSERT INTO `sr_area` VALUES ('952', '944', '余杭区', '2', '-0-943-944-', 'Y', '', '0', '1458284387', '0', '0');
INSERT INTO `sr_area` VALUES ('953', '944', '桐庐县', '2', '-0-943-944-', 'T', '', '0', '1458284388', '0', '0');
INSERT INTO `sr_area` VALUES ('954', '944', '淳安县', '2', '-0-943-944-', 'C', '', '0', '1458284389', '0', '0');
INSERT INTO `sr_area` VALUES ('955', '944', '建德市', '2', '-0-943-944-', 'J', '', '0', '1458284390', '0', '0');
INSERT INTO `sr_area` VALUES ('956', '944', '富阳市', '2', '-0-943-944-', 'F', '', '0', '1458284391', '0', '0');
INSERT INTO `sr_area` VALUES ('957', '944', '临安市', '2', '-0-943-944-', 'L', '', '0', '1458284392', '0', '0');
INSERT INTO `sr_area` VALUES ('958', '943', '宁波市', '1', '-0-943-', 'N', '', '0', '1458284393', '0', '0');
INSERT INTO `sr_area` VALUES ('959', '958', '海曙区', '2', '-0-943-958-', 'H', '', '0', '1458284394', '0', '0');
INSERT INTO `sr_area` VALUES ('960', '958', '江东区', '2', '-0-943-958-', 'J', '', '0', '1458284395', '0', '0');
INSERT INTO `sr_area` VALUES ('961', '958', '江北区', '2', '-0-943-958-', 'J', '', '0', '1458284396', '0', '0');
INSERT INTO `sr_area` VALUES ('962', '958', '北仑区', '2', '-0-943-958-', 'B', '', '0', '1458284397', '0', '0');
INSERT INTO `sr_area` VALUES ('963', '958', '镇海区', '2', '-0-943-958-', 'Z', '', '0', '1458284398', '0', '0');
INSERT INTO `sr_area` VALUES ('964', '958', '鄞州区', '2', '-0-943-958-', '', '', '0', '1458284399', '0', '0');
INSERT INTO `sr_area` VALUES ('965', '958', '象山县', '2', '-0-943-958-', 'X', '', '0', '1458284400', '0', '0');
INSERT INTO `sr_area` VALUES ('966', '958', '宁海县', '2', '-0-943-958-', 'N', '', '0', '1458284401', '0', '0');
INSERT INTO `sr_area` VALUES ('967', '958', '余姚市', '2', '-0-943-958-', 'Y', '', '0', '1458284402', '0', '0');
INSERT INTO `sr_area` VALUES ('968', '958', '慈溪市', '2', '-0-943-958-', 'C', '', '0', '1458284403', '0', '0');
INSERT INTO `sr_area` VALUES ('969', '958', '奉化市', '2', '-0-943-958-', 'F', '', '0', '1458284404', '0', '0');
INSERT INTO `sr_area` VALUES ('970', '943', '温州市', '1', '-0-943-', 'W', '', '0', '1458284405', '0', '0');
INSERT INTO `sr_area` VALUES ('971', '970', '鹿城区', '2', '-0-943-970-', 'L', '', '0', '1458284406', '0', '0');
INSERT INTO `sr_area` VALUES ('972', '970', '龙湾区', '2', '-0-943-970-', 'L', '', '0', '1458284407', '0', '0');
INSERT INTO `sr_area` VALUES ('973', '970', '瓯海区', '2', '-0-943-970-', '', '', '0', '1458284408', '0', '0');
INSERT INTO `sr_area` VALUES ('974', '970', '洞头县', '2', '-0-943-970-', 'D', '', '0', '1458284409', '0', '0');
INSERT INTO `sr_area` VALUES ('975', '970', '永嘉县', '2', '-0-943-970-', 'Y', '', '0', '1458284410', '0', '0');
INSERT INTO `sr_area` VALUES ('976', '970', '平阳县', '2', '-0-943-970-', 'P', '', '0', '1458284411', '0', '0');
INSERT INTO `sr_area` VALUES ('977', '970', '苍南县', '2', '-0-943-970-', 'C', '', '0', '1458284412', '0', '0');
INSERT INTO `sr_area` VALUES ('978', '970', '文成县', '2', '-0-943-970-', 'W', '', '0', '1458284413', '0', '0');
INSERT INTO `sr_area` VALUES ('979', '970', '泰顺县', '2', '-0-943-970-', 'T', '', '0', '1458284414', '0', '0');
INSERT INTO `sr_area` VALUES ('980', '970', '瑞安市', '2', '-0-943-970-', 'R', '', '0', '1458284415', '0', '0');
INSERT INTO `sr_area` VALUES ('981', '970', '乐清市', '2', '-0-943-970-', 'L', '', '0', '1458284416', '0', '0');
INSERT INTO `sr_area` VALUES ('982', '943', '嘉兴市', '1', '-0-943-', 'J', '', '0', '1458284417', '0', '0');
INSERT INTO `sr_area` VALUES ('983', '982', '南湖区', '2', '-0-943-982-', 'N', '', '0', '1458284418', '0', '0');
INSERT INTO `sr_area` VALUES ('984', '982', '秀洲区', '2', '-0-943-982-', 'X', '', '0', '1458284419', '0', '0');
INSERT INTO `sr_area` VALUES ('985', '982', '嘉善县', '2', '-0-943-982-', 'J', '', '0', '1458284420', '0', '0');
INSERT INTO `sr_area` VALUES ('986', '982', '海盐县', '2', '-0-943-982-', 'H', '', '0', '1458284421', '0', '0');
INSERT INTO `sr_area` VALUES ('987', '982', '海宁市', '2', '-0-943-982-', 'H', '', '0', '1458284422', '0', '0');
INSERT INTO `sr_area` VALUES ('988', '982', '平湖市', '2', '-0-943-982-', 'P', '', '0', '1458284423', '0', '0');
INSERT INTO `sr_area` VALUES ('989', '982', '桐乡市', '2', '-0-943-982-', 'T', '', '0', '1458284424', '0', '0');
INSERT INTO `sr_area` VALUES ('990', '943', '湖州市', '1', '-0-943-', 'H', '', '0', '1458284425', '0', '0');
INSERT INTO `sr_area` VALUES ('991', '990', '吴兴区', '2', '-0-943-990-', 'W', '', '0', '1458284426', '0', '0');
INSERT INTO `sr_area` VALUES ('992', '990', '南浔区', '2', '-0-943-990-', 'N', '', '0', '1458284427', '0', '0');
INSERT INTO `sr_area` VALUES ('993', '990', '德清县', '2', '-0-943-990-', 'D', '', '0', '1458284428', '0', '0');
INSERT INTO `sr_area` VALUES ('994', '990', '长兴县', '2', '-0-943-990-', 'C', '', '0', '1458284429', '0', '0');
INSERT INTO `sr_area` VALUES ('995', '990', '安吉县', '2', '-0-943-990-', 'A', '', '0', '1458284430', '0', '0');
INSERT INTO `sr_area` VALUES ('996', '943', '绍兴市', '1', '-0-943-', 'S', '', '0', '1458284431', '0', '0');
INSERT INTO `sr_area` VALUES ('997', '996', '越城区', '2', '-0-943-996-', 'Y', '', '0', '1458284432', '0', '0');
INSERT INTO `sr_area` VALUES ('998', '996', '绍兴县', '2', '-0-943-996-', 'S', '', '0', '1458284433', '0', '0');
INSERT INTO `sr_area` VALUES ('999', '996', '新昌县', '2', '-0-943-996-', 'X', '', '0', '1458284434', '0', '0');
INSERT INTO `sr_area` VALUES ('1000', '996', '诸暨市', '2', '-0-943-996-', 'Z', '', '0', '1458284435', '0', '0');
INSERT INTO `sr_area` VALUES ('1001', '996', '上虞市', '2', '-0-943-996-', 'S', '', '0', '1458284436', '0', '0');
INSERT INTO `sr_area` VALUES ('1002', '996', '嵊州市', '2', '-0-943-996-', '', '', '0', '1458284437', '0', '0');
INSERT INTO `sr_area` VALUES ('1003', '943', '金华市', '1', '-0-943-', 'J', '', '0', '1458284438', '0', '0');
INSERT INTO `sr_area` VALUES ('1004', '1003', '婺城区', '2', '-0-943-1003-', '', '', '0', '1458284439', '0', '0');
INSERT INTO `sr_area` VALUES ('1005', '1003', '金东区', '2', '-0-943-1003-', 'J', '', '0', '1458284440', '0', '0');
INSERT INTO `sr_area` VALUES ('1006', '1003', '武义县', '2', '-0-943-1003-', 'W', '', '0', '1458284441', '0', '0');
INSERT INTO `sr_area` VALUES ('1007', '1003', '浦江县', '2', '-0-943-1003-', 'P', '', '0', '1458284442', '0', '0');
INSERT INTO `sr_area` VALUES ('1008', '1003', '磐安县', '2', '-0-943-1003-', 'P', '', '0', '1458284443', '0', '0');
INSERT INTO `sr_area` VALUES ('1009', '1003', '兰溪市', '2', '-0-943-1003-', 'L', '', '0', '1458284444', '0', '0');
INSERT INTO `sr_area` VALUES ('1010', '1003', '义乌市', '2', '-0-943-1003-', 'Y', '', '0', '1458284445', '0', '0');
INSERT INTO `sr_area` VALUES ('1011', '1003', '东阳市', '2', '-0-943-1003-', 'D', '', '0', '1458284446', '0', '0');
INSERT INTO `sr_area` VALUES ('1012', '1003', '永康市', '2', '-0-943-1003-', 'Y', '', '0', '1458284447', '0', '0');
INSERT INTO `sr_area` VALUES ('1013', '943', '衢州市', '1', '-0-943-', 'Q', '', '0', '1458284448', '0', '0');
INSERT INTO `sr_area` VALUES ('1014', '1013', '柯城区', '2', '-0-943-1013-', 'K', '', '0', '1458284449', '0', '0');
INSERT INTO `sr_area` VALUES ('1015', '1013', '衢江区', '2', '-0-943-1013-', '', '', '0', '1458284450', '0', '0');
INSERT INTO `sr_area` VALUES ('1016', '1013', '常山县', '2', '-0-943-1013-', 'C', '', '0', '1458284451', '0', '0');
INSERT INTO `sr_area` VALUES ('1017', '1013', '开化县', '2', '-0-943-1013-', 'K', '', '0', '1458284452', '0', '0');
INSERT INTO `sr_area` VALUES ('1018', '1013', '龙游县', '2', '-0-943-1013-', 'L', '', '0', '1458284453', '0', '0');
INSERT INTO `sr_area` VALUES ('1019', '1013', '江山市', '2', '-0-943-1013-', 'J', '', '0', '1458284454', '0', '0');
INSERT INTO `sr_area` VALUES ('1020', '943', '舟山市', '1', '-0-943-', 'Z', '', '0', '1458284455', '0', '0');
INSERT INTO `sr_area` VALUES ('1021', '1020', '定海区', '2', '-0-943-1020-', 'D', '', '0', '1458284456', '0', '0');
INSERT INTO `sr_area` VALUES ('1022', '1020', '普陀区', '2', '-0-943-1020-', 'P', '', '0', '1458284457', '0', '0');
INSERT INTO `sr_area` VALUES ('1023', '1020', '岱山县', '2', '-0-943-1020-', '', '', '0', '1458284458', '0', '0');
INSERT INTO `sr_area` VALUES ('1024', '1020', '嵊泗县', '2', '-0-943-1020-', '', '', '0', '1458284459', '0', '0');
INSERT INTO `sr_area` VALUES ('1025', '943', '台州市', '1', '-0-943-', 'T', '', '0', '1458284460', '0', '0');
INSERT INTO `sr_area` VALUES ('1026', '1025', '椒江区', '2', '-0-943-1025-', 'J', '', '0', '1458284461', '0', '0');
INSERT INTO `sr_area` VALUES ('1027', '1025', '黄岩区', '2', '-0-943-1025-', 'H', '', '0', '1458284462', '0', '0');
INSERT INTO `sr_area` VALUES ('1028', '1025', '路桥区', '2', '-0-943-1025-', 'L', '', '0', '1458284463', '0', '0');
INSERT INTO `sr_area` VALUES ('1029', '1025', '玉环县', '2', '-0-943-1025-', 'Y', '', '0', '1458284464', '0', '0');
INSERT INTO `sr_area` VALUES ('1030', '1025', '三门县', '2', '-0-943-1025-', 'S', '', '0', '1458284465', '0', '0');
INSERT INTO `sr_area` VALUES ('1031', '1025', '天台县', '2', '-0-943-1025-', 'T', '', '0', '1458284466', '0', '0');
INSERT INTO `sr_area` VALUES ('1032', '1025', '仙居县', '2', '-0-943-1025-', 'X', '', '0', '1458284467', '0', '0');
INSERT INTO `sr_area` VALUES ('1033', '1025', '温岭市', '2', '-0-943-1025-', 'W', '', '0', '1458284468', '0', '0');
INSERT INTO `sr_area` VALUES ('1034', '1025', '临海市', '2', '-0-943-1025-', 'L', '', '0', '1458284469', '0', '0');
INSERT INTO `sr_area` VALUES ('1035', '943', '丽水市', '1', '-0-943-', 'L', '', '0', '1458284470', '0', '0');
INSERT INTO `sr_area` VALUES ('1036', '1035', '莲都区', '2', '-0-943-1035-', 'L', '', '0', '1458284471', '0', '0');
INSERT INTO `sr_area` VALUES ('1037', '1035', '青田县', '2', '-0-943-1035-', 'Q', '', '0', '1458284472', '0', '0');
INSERT INTO `sr_area` VALUES ('1038', '1035', '缙云县', '2', '-0-943-1035-', '', '', '0', '1458284473', '0', '0');
INSERT INTO `sr_area` VALUES ('1039', '1035', '遂昌县', '2', '-0-943-1035-', 'S', '', '0', '1458284474', '0', '0');
INSERT INTO `sr_area` VALUES ('1040', '1035', '松阳县', '2', '-0-943-1035-', 'S', '', '0', '1458284475', '0', '0');
INSERT INTO `sr_area` VALUES ('1041', '1035', '云和县', '2', '-0-943-1035-', 'Y', '', '0', '1458284476', '0', '0');
INSERT INTO `sr_area` VALUES ('1042', '1035', '庆元县', '2', '-0-943-1035-', 'Q', '', '0', '1458284477', '0', '0');
INSERT INTO `sr_area` VALUES ('1043', '1035', '景宁畲族自治县', '2', '-0-943-1035-', 'J', '', '0', '1458284478', '0', '0');
INSERT INTO `sr_area` VALUES ('1044', '1035', '龙泉市', '2', '-0-943-1035-', 'L', '', '0', '1458284479', '0', '0');
INSERT INTO `sr_area` VALUES ('1045', '0', '安徽', '0', '-0-', 'A', '华东', '0', '1458284480', '0', '0');
INSERT INTO `sr_area` VALUES ('1046', '1045', '合肥市', '1', '-0-1045-', 'H', '', '0', '1458284481', '0', '0');
INSERT INTO `sr_area` VALUES ('1047', '1046', '瑶海区', '2', '-0-1045-1046-', 'Y', '', '0', '1458284482', '0', '0');
INSERT INTO `sr_area` VALUES ('1048', '1046', '庐阳区', '2', '-0-1045-1046-', 'L', '', '0', '1458284483', '0', '0');
INSERT INTO `sr_area` VALUES ('1049', '1046', '蜀山区', '2', '-0-1045-1046-', 'S', '', '0', '1458284484', '0', '0');
INSERT INTO `sr_area` VALUES ('1050', '1046', '包河区', '2', '-0-1045-1046-', 'B', '', '0', '1458284485', '0', '0');
INSERT INTO `sr_area` VALUES ('1051', '1046', '长丰县', '2', '-0-1045-1046-', 'C', '', '0', '1458284486', '0', '0');
INSERT INTO `sr_area` VALUES ('1052', '1046', '肥东县', '2', '-0-1045-1046-', 'F', '', '0', '1458284487', '0', '0');
INSERT INTO `sr_area` VALUES ('1053', '1046', '肥西县', '2', '-0-1045-1046-', 'F', '', '0', '1458284488', '0', '0');
INSERT INTO `sr_area` VALUES ('1054', '1045', '芜湖市', '1', '-0-1045-', 'W', '', '0', '1458284489', '0', '0');
INSERT INTO `sr_area` VALUES ('1055', '1054', '镜湖区', '2', '-0-1045-1054-', 'J', '', '0', '1458284490', '0', '0');
INSERT INTO `sr_area` VALUES ('1056', '1054', '弋江区', '2', '-0-1045-1054-', '', '', '0', '1458284491', '0', '0');
INSERT INTO `sr_area` VALUES ('1057', '1054', '鸠江区', '2', '-0-1045-1054-', '', '', '0', '1458284492', '0', '0');
INSERT INTO `sr_area` VALUES ('1058', '1054', '三山区', '2', '-0-1045-1054-', 'S', '', '0', '1458284493', '0', '0');
INSERT INTO `sr_area` VALUES ('1059', '1054', '芜湖县', '2', '-0-1045-1054-', 'W', '', '0', '1458284494', '0', '0');
INSERT INTO `sr_area` VALUES ('1060', '1054', '繁昌县', '2', '-0-1045-1054-', 'F', '', '0', '1458284495', '0', '0');
INSERT INTO `sr_area` VALUES ('1061', '1054', '南陵县', '2', '-0-1045-1054-', 'N', '', '0', '1458284496', '0', '0');
INSERT INTO `sr_area` VALUES ('1062', '1045', '蚌埠市', '1', '-0-1045-', 'B', '', '0', '1458284497', '0', '0');
INSERT INTO `sr_area` VALUES ('1063', '1062', '龙子湖区', '2', '-0-1045-1062-', 'L', '', '0', '1458284498', '0', '0');
INSERT INTO `sr_area` VALUES ('1064', '1062', '蚌山区', '2', '-0-1045-1062-', 'B', '', '0', '1458284499', '0', '0');
INSERT INTO `sr_area` VALUES ('1065', '1062', '禹会区', '2', '-0-1045-1062-', 'Y', '', '0', '1458284500', '0', '0');
INSERT INTO `sr_area` VALUES ('1066', '1062', '淮上区', '2', '-0-1045-1062-', 'H', '', '0', '1458284501', '0', '0');
INSERT INTO `sr_area` VALUES ('1067', '1062', '怀远县', '2', '-0-1045-1062-', 'H', '', '0', '1458284502', '0', '0');
INSERT INTO `sr_area` VALUES ('1068', '1062', '五河县', '2', '-0-1045-1062-', 'W', '', '0', '1458284503', '0', '0');
INSERT INTO `sr_area` VALUES ('1069', '1062', '固镇县', '2', '-0-1045-1062-', 'G', '', '0', '1458284504', '0', '0');
INSERT INTO `sr_area` VALUES ('1070', '1045', '淮南市', '1', '-0-1045-', 'H', '', '0', '1458284505', '0', '0');
INSERT INTO `sr_area` VALUES ('1071', '1070', '大通区', '2', '-0-1045-1070-', 'D', '', '0', '1458284506', '0', '0');
INSERT INTO `sr_area` VALUES ('1072', '1070', '田家庵区', '2', '-0-1045-1070-', 'T', '', '0', '1458284507', '0', '0');
INSERT INTO `sr_area` VALUES ('1073', '1070', '谢家集区', '2', '-0-1045-1070-', 'X', '', '0', '1458284508', '0', '0');
INSERT INTO `sr_area` VALUES ('1074', '1070', '八公山区', '2', '-0-1045-1070-', 'B', '', '0', '1458284509', '0', '0');
INSERT INTO `sr_area` VALUES ('1075', '1070', '潘集区', '2', '-0-1045-1070-', 'P', '', '0', '1458284510', '0', '0');
INSERT INTO `sr_area` VALUES ('1076', '1070', '凤台县', '2', '-0-1045-1070-', 'F', '', '0', '1458284511', '0', '0');
INSERT INTO `sr_area` VALUES ('1077', '1045', '马鞍山市', '1', '-0-1045-', 'M', '', '0', '1458284512', '0', '0');
INSERT INTO `sr_area` VALUES ('1078', '1077', '金家庄区', '2', '-0-1045-1077-', 'J', '', '0', '1458284513', '0', '0');
INSERT INTO `sr_area` VALUES ('1079', '1077', '花山区', '2', '-0-1045-1077-', 'H', '', '0', '1458284514', '0', '0');
INSERT INTO `sr_area` VALUES ('1080', '1077', '雨山区', '2', '-0-1045-1077-', 'Y', '', '0', '1458284515', '0', '0');
INSERT INTO `sr_area` VALUES ('1081', '1077', '当涂县', '2', '-0-1045-1077-', 'D', '', '0', '1458284516', '0', '0');
INSERT INTO `sr_area` VALUES ('1082', '1045', '淮北市', '1', '-0-1045-', 'H', '', '0', '1458284517', '0', '0');
INSERT INTO `sr_area` VALUES ('1083', '1082', '杜集区', '2', '-0-1045-1082-', 'D', '', '0', '1458284518', '0', '0');
INSERT INTO `sr_area` VALUES ('1084', '1082', '相山区', '2', '-0-1045-1082-', 'X', '', '0', '1458284519', '0', '0');
INSERT INTO `sr_area` VALUES ('1085', '1082', '烈山区', '2', '-0-1045-1082-', 'L', '', '0', '1458284520', '0', '0');
INSERT INTO `sr_area` VALUES ('1086', '1082', '濉溪县', '2', '-0-1045-1082-', '', '', '0', '1458284521', '0', '0');
INSERT INTO `sr_area` VALUES ('1087', '1045', '铜陵市', '1', '-0-1045-', 'T', '', '0', '1458284522', '0', '0');
INSERT INTO `sr_area` VALUES ('1088', '1087', '铜官山区', '2', '-0-1045-1087-', 'T', '', '0', '1458284523', '0', '0');
INSERT INTO `sr_area` VALUES ('1089', '1087', '狮子山区', '2', '-0-1045-1087-', 'S', '', '0', '1458284524', '0', '0');
INSERT INTO `sr_area` VALUES ('1090', '1087', '郊区', '2', '-0-1045-1087-', 'J', '', '0', '1458284525', '0', '0');
INSERT INTO `sr_area` VALUES ('1091', '1087', '铜陵县', '2', '-0-1045-1087-', 'T', '', '0', '1458284526', '0', '0');
INSERT INTO `sr_area` VALUES ('1092', '1045', '安庆市', '1', '-0-1045-', 'A', '', '0', '1458284527', '0', '0');
INSERT INTO `sr_area` VALUES ('1093', '1092', '迎江区', '2', '-0-1045-1092-', 'Y', '', '0', '1458284528', '0', '0');
INSERT INTO `sr_area` VALUES ('1094', '1092', '大观区', '2', '-0-1045-1092-', 'D', '', '0', '1458284529', '0', '0');
INSERT INTO `sr_area` VALUES ('1095', '1092', '宜秀区', '2', '-0-1045-1092-', 'Y', '', '0', '1458284530', '0', '0');
INSERT INTO `sr_area` VALUES ('1096', '1092', '怀宁县', '2', '-0-1045-1092-', 'H', '', '0', '1458284531', '0', '0');
INSERT INTO `sr_area` VALUES ('1097', '1092', '枞阳县', '2', '-0-1045-1092-', '', '', '0', '1458284532', '0', '0');
INSERT INTO `sr_area` VALUES ('1098', '1092', '潜山县', '2', '-0-1045-1092-', 'Q', '', '0', '1458284533', '0', '0');
INSERT INTO `sr_area` VALUES ('1099', '1092', '太湖县', '2', '-0-1045-1092-', 'T', '', '0', '1458284534', '0', '0');
INSERT INTO `sr_area` VALUES ('1100', '1092', '宿松县', '2', '-0-1045-1092-', 'S', '', '0', '1458284535', '0', '0');
INSERT INTO `sr_area` VALUES ('1101', '1092', '望江县', '2', '-0-1045-1092-', 'W', '', '0', '1458284536', '0', '0');
INSERT INTO `sr_area` VALUES ('1102', '1092', '岳西县', '2', '-0-1045-1092-', 'Y', '', '0', '1458284537', '0', '0');
INSERT INTO `sr_area` VALUES ('1103', '1092', '桐城市', '2', '-0-1045-1092-', 'T', '', '0', '1458284538', '0', '0');
INSERT INTO `sr_area` VALUES ('1104', '1045', '黄山市', '1', '-0-1045-', 'H', '', '0', '1458284539', '0', '0');
INSERT INTO `sr_area` VALUES ('1105', '1104', '屯溪区', '2', '-0-1045-1104-', 'T', '', '0', '1458284540', '0', '0');
INSERT INTO `sr_area` VALUES ('1106', '1104', '黄山区', '2', '-0-1045-1104-', 'H', '', '0', '1458284541', '0', '0');
INSERT INTO `sr_area` VALUES ('1107', '1104', '徽州区', '2', '-0-1045-1104-', 'H', '', '0', '1458284542', '0', '0');
INSERT INTO `sr_area` VALUES ('1108', '1104', '歙县', '2', '-0-1045-1104-', '', '', '0', '1458284543', '0', '0');
INSERT INTO `sr_area` VALUES ('1109', '1104', '休宁县', '2', '-0-1045-1104-', 'X', '', '0', '1458284544', '0', '0');
INSERT INTO `sr_area` VALUES ('1110', '1104', '黟县', '2', '-0-1045-1104-', '', '', '0', '1458284545', '0', '0');
INSERT INTO `sr_area` VALUES ('1111', '1104', '祁门县', '2', '-0-1045-1104-', 'Q', '', '0', '1458284546', '0', '0');
INSERT INTO `sr_area` VALUES ('1112', '1045', '滁州市', '1', '-0-1045-', 'C', '', '0', '1458284547', '0', '0');
INSERT INTO `sr_area` VALUES ('1113', '1112', '琅琊区', '2', '-0-1045-1112-', 'L', '', '0', '1458284548', '0', '0');
INSERT INTO `sr_area` VALUES ('1114', '1112', '南谯区', '2', '-0-1045-1112-', 'N', '', '0', '1458284549', '0', '0');
INSERT INTO `sr_area` VALUES ('1115', '1112', '来安县', '2', '-0-1045-1112-', 'L', '', '0', '1458284550', '0', '0');
INSERT INTO `sr_area` VALUES ('1116', '1112', '全椒县', '2', '-0-1045-1112-', 'Q', '', '0', '1458284551', '0', '0');
INSERT INTO `sr_area` VALUES ('1117', '1112', '定远县', '2', '-0-1045-1112-', 'D', '', '0', '1458284552', '0', '0');
INSERT INTO `sr_area` VALUES ('1118', '1112', '凤阳县', '2', '-0-1045-1112-', 'F', '', '0', '1458284553', '0', '0');
INSERT INTO `sr_area` VALUES ('1119', '1112', '天长市', '2', '-0-1045-1112-', 'T', '', '0', '1458284554', '0', '0');
INSERT INTO `sr_area` VALUES ('1120', '1112', '明光市', '2', '-0-1045-1112-', 'M', '', '0', '1458284555', '0', '0');
INSERT INTO `sr_area` VALUES ('1121', '1045', '阜阳市', '1', '-0-1045-', 'F', '', '0', '1458284556', '0', '0');
INSERT INTO `sr_area` VALUES ('1122', '1121', '颍州区', '2', '-0-1045-1121-', '', '', '0', '1458284557', '0', '0');
INSERT INTO `sr_area` VALUES ('1123', '1121', '颍东区', '2', '-0-1045-1121-', '', '', '0', '1458284558', '0', '0');
INSERT INTO `sr_area` VALUES ('1124', '1121', '颍泉区', '2', '-0-1045-1121-', '', '', '0', '1458284559', '0', '0');
INSERT INTO `sr_area` VALUES ('1125', '1121', '临泉县', '2', '-0-1045-1121-', 'L', '', '0', '1458284560', '0', '0');
INSERT INTO `sr_area` VALUES ('1126', '1121', '太和县', '2', '-0-1045-1121-', 'T', '', '0', '1458284561', '0', '0');
INSERT INTO `sr_area` VALUES ('1127', '1121', '阜南县', '2', '-0-1045-1121-', 'F', '', '0', '1458284562', '0', '0');
INSERT INTO `sr_area` VALUES ('1128', '1121', '颍上县', '2', '-0-1045-1121-', '', '', '0', '1458284563', '0', '0');
INSERT INTO `sr_area` VALUES ('1129', '1121', '界首市', '2', '-0-1045-1121-', 'J', '', '0', '1458284564', '0', '0');
INSERT INTO `sr_area` VALUES ('1130', '1045', '宿州市', '1', '-0-1045-', 'S', '', '0', '1458284565', '0', '0');
INSERT INTO `sr_area` VALUES ('1131', '1130', '埇桥区', '2', '-0-1045-1130-', '', '', '0', '1458284566', '0', '0');
INSERT INTO `sr_area` VALUES ('1132', '1130', '砀山县', '2', '-0-1045-1130-', '', '', '0', '1458284567', '0', '0');
INSERT INTO `sr_area` VALUES ('1133', '1130', '萧县', '2', '-0-1045-1130-', 'X', '', '0', '1458284568', '0', '0');
INSERT INTO `sr_area` VALUES ('1134', '1130', '灵璧县', '2', '-0-1045-1130-', 'L', '', '0', '1458284569', '0', '0');
INSERT INTO `sr_area` VALUES ('1135', '1130', '泗县', '2', '-0-1045-1130-', '', '', '0', '1458284570', '0', '0');
INSERT INTO `sr_area` VALUES ('1136', '1045', '巢湖市', '1', '-0-1045-', 'C', '', '0', '1458284571', '0', '0');
INSERT INTO `sr_area` VALUES ('1137', '1136', '居巢区', '2', '-0-1045-1136-', 'J', '', '0', '1458284572', '0', '0');
INSERT INTO `sr_area` VALUES ('1138', '1136', '庐江县', '2', '-0-1045-1136-', 'L', '', '0', '1458284573', '0', '0');
INSERT INTO `sr_area` VALUES ('1139', '1136', '无为县', '2', '-0-1045-1136-', 'W', '', '0', '1458284574', '0', '0');
INSERT INTO `sr_area` VALUES ('1140', '1136', '含山县', '2', '-0-1045-1136-', 'H', '', '0', '1458284575', '0', '0');
INSERT INTO `sr_area` VALUES ('1141', '1136', '和县', '2', '-0-1045-1136-', 'H', '', '0', '1458284576', '0', '0');
INSERT INTO `sr_area` VALUES ('1142', '1045', '六安市', '1', '-0-1045-', 'L', '', '0', '1458284577', '0', '0');
INSERT INTO `sr_area` VALUES ('1143', '1142', '金安区', '2', '-0-1045-1142-', 'J', '', '0', '1458284578', '0', '0');
INSERT INTO `sr_area` VALUES ('1144', '1142', '裕安区', '2', '-0-1045-1142-', 'Y', '', '0', '1458284579', '0', '0');
INSERT INTO `sr_area` VALUES ('1145', '1142', '寿县', '2', '-0-1045-1142-', 'S', '', '0', '1458284580', '0', '0');
INSERT INTO `sr_area` VALUES ('1146', '1142', '霍邱县', '2', '-0-1045-1142-', 'H', '', '0', '1458284581', '0', '0');
INSERT INTO `sr_area` VALUES ('1147', '1142', '舒城县', '2', '-0-1045-1142-', 'S', '', '0', '1458284582', '0', '0');
INSERT INTO `sr_area` VALUES ('1148', '1142', '金寨县', '2', '-0-1045-1142-', 'J', '', '0', '1458284583', '0', '0');
INSERT INTO `sr_area` VALUES ('1149', '1142', '霍山县', '2', '-0-1045-1142-', 'H', '', '0', '1458284584', '0', '0');
INSERT INTO `sr_area` VALUES ('1150', '1045', '亳州市', '1', '-0-1045-', 'B', '', '0', '1458284585', '0', '0');
INSERT INTO `sr_area` VALUES ('1151', '1150', '谯城区', '2', '-0-1045-1150-', '', '', '0', '1458284586', '0', '0');
INSERT INTO `sr_area` VALUES ('1152', '1150', '涡阳县', '2', '-0-1045-1150-', 'W', '', '0', '1458284587', '0', '0');
INSERT INTO `sr_area` VALUES ('1153', '1150', '蒙城县', '2', '-0-1045-1150-', 'M', '', '0', '1458284588', '0', '0');
INSERT INTO `sr_area` VALUES ('1154', '1150', '利辛县', '2', '-0-1045-1150-', 'L', '', '0', '1458284589', '0', '0');
INSERT INTO `sr_area` VALUES ('1155', '1045', '池州市', '1', '-0-1045-', 'C', '', '0', '1458284590', '0', '0');
INSERT INTO `sr_area` VALUES ('1156', '1155', '贵池区', '2', '-0-1045-1155-', 'G', '', '0', '1458284591', '0', '0');
INSERT INTO `sr_area` VALUES ('1157', '1155', '东至县', '2', '-0-1045-1155-', 'D', '', '0', '1458284592', '0', '0');
INSERT INTO `sr_area` VALUES ('1158', '1155', '石台县', '2', '-0-1045-1155-', 'S', '', '0', '1458284593', '0', '0');
INSERT INTO `sr_area` VALUES ('1159', '1155', '青阳县', '2', '-0-1045-1155-', 'Q', '', '0', '1458284594', '0', '0');
INSERT INTO `sr_area` VALUES ('1160', '1045', '宣城市', '1', '-0-1045-', 'X', '', '0', '1458284595', '0', '0');
INSERT INTO `sr_area` VALUES ('1161', '1160', '宣州区', '2', '-0-1045-1160-', 'X', '', '0', '1458284596', '0', '0');
INSERT INTO `sr_area` VALUES ('1162', '1160', '郎溪县', '2', '-0-1045-1160-', 'L', '', '0', '1458284597', '0', '0');
INSERT INTO `sr_area` VALUES ('1163', '1160', '广德县', '2', '-0-1045-1160-', 'G', '', '0', '1458284598', '0', '0');
INSERT INTO `sr_area` VALUES ('1164', '1160', '泾县', '2', '-0-1045-1160-', '', '', '0', '1458284599', '0', '0');
INSERT INTO `sr_area` VALUES ('1165', '1160', '绩溪县', '2', '-0-1045-1160-', 'J', '', '0', '1458284600', '0', '0');
INSERT INTO `sr_area` VALUES ('1166', '1160', '旌德县', '2', '-0-1045-1160-', '', '', '0', '1458284601', '0', '0');
INSERT INTO `sr_area` VALUES ('1167', '1160', '宁国市', '2', '-0-1045-1160-', 'N', '', '0', '1458284602', '0', '0');
INSERT INTO `sr_area` VALUES ('1168', '0', '福建', '0', '-0-', 'F', '华南', '0', '1458284603', '0', '0');
INSERT INTO `sr_area` VALUES ('1169', '1168', '福州市', '1', '-0-1168-', 'F', '', '0', '1458284604', '0', '0');
INSERT INTO `sr_area` VALUES ('1170', '1169', '鼓楼区', '2', '-0-1168-1169-', 'G', '', '0', '1458284605', '0', '0');
INSERT INTO `sr_area` VALUES ('1171', '1169', '台江区', '2', '-0-1168-1169-', 'T', '', '0', '1458284606', '0', '0');
INSERT INTO `sr_area` VALUES ('1172', '1169', '仓山区', '2', '-0-1168-1169-', 'C', '', '0', '1458284607', '0', '0');
INSERT INTO `sr_area` VALUES ('1173', '1169', '马尾区', '2', '-0-1168-1169-', 'M', '', '0', '1458284608', '0', '0');
INSERT INTO `sr_area` VALUES ('1174', '1169', '晋安区', '2', '-0-1168-1169-', 'J', '', '0', '1458284609', '0', '0');
INSERT INTO `sr_area` VALUES ('1175', '1169', '闽侯县', '2', '-0-1168-1169-', 'M', '', '0', '1458284610', '0', '0');
INSERT INTO `sr_area` VALUES ('1176', '1169', '连江县', '2', '-0-1168-1169-', 'L', '', '0', '1458284611', '0', '0');
INSERT INTO `sr_area` VALUES ('1177', '1169', '罗源县', '2', '-0-1168-1169-', 'L', '', '0', '1458284612', '0', '0');
INSERT INTO `sr_area` VALUES ('1178', '1169', '闽清县', '2', '-0-1168-1169-', 'M', '', '0', '1458284613', '0', '0');
INSERT INTO `sr_area` VALUES ('1179', '1169', '永泰县', '2', '-0-1168-1169-', 'Y', '', '0', '1458284614', '0', '0');
INSERT INTO `sr_area` VALUES ('1180', '1169', '平潭县', '2', '-0-1168-1169-', 'P', '', '0', '1458284615', '0', '0');
INSERT INTO `sr_area` VALUES ('1181', '1169', '福清市', '2', '-0-1168-1169-', 'F', '', '0', '1458284616', '0', '0');
INSERT INTO `sr_area` VALUES ('1182', '1169', '长乐市', '2', '-0-1168-1169-', 'C', '', '0', '1458284617', '0', '0');
INSERT INTO `sr_area` VALUES ('1183', '1168', '厦门市', '1', '-0-1168-', 'X', '', '0', '1458284618', '0', '0');
INSERT INTO `sr_area` VALUES ('1184', '1183', '思明区', '2', '-0-1168-1183-', 'S', '', '0', '1458284619', '0', '0');
INSERT INTO `sr_area` VALUES ('1185', '1183', '海沧区', '2', '-0-1168-1183-', 'H', '', '0', '1458284620', '0', '0');
INSERT INTO `sr_area` VALUES ('1186', '1183', '湖里区', '2', '-0-1168-1183-', 'H', '', '0', '1458284621', '0', '0');
INSERT INTO `sr_area` VALUES ('1187', '1183', '集美区', '2', '-0-1168-1183-', 'J', '', '0', '1458284622', '0', '0');
INSERT INTO `sr_area` VALUES ('1188', '1183', '同安区', '2', '-0-1168-1183-', 'T', '', '0', '1458284623', '0', '0');
INSERT INTO `sr_area` VALUES ('1189', '1183', '翔安区', '2', '-0-1168-1183-', 'X', '', '0', '1458284624', '0', '0');
INSERT INTO `sr_area` VALUES ('1190', '1168', '莆田市', '1', '-0-1168-', 'P', '', '0', '1458284625', '0', '0');
INSERT INTO `sr_area` VALUES ('1191', '1190', '城厢区', '2', '-0-1168-1190-', 'C', '', '0', '1458284626', '0', '0');
INSERT INTO `sr_area` VALUES ('1192', '1190', '涵江区', '2', '-0-1168-1190-', 'H', '', '0', '1458284627', '0', '0');
INSERT INTO `sr_area` VALUES ('1193', '1190', '荔城区', '2', '-0-1168-1190-', 'L', '', '0', '1458284628', '0', '0');
INSERT INTO `sr_area` VALUES ('1194', '1190', '秀屿区', '2', '-0-1168-1190-', 'X', '', '0', '1458284629', '0', '0');
INSERT INTO `sr_area` VALUES ('1195', '1190', '仙游县', '2', '-0-1168-1190-', 'X', '', '0', '1458284630', '0', '0');
INSERT INTO `sr_area` VALUES ('1196', '1168', '三明市', '1', '-0-1168-', 'S', '', '0', '1458284631', '0', '0');
INSERT INTO `sr_area` VALUES ('1197', '1196', '梅列区', '2', '-0-1168-1196-', 'M', '', '0', '1458284632', '0', '0');
INSERT INTO `sr_area` VALUES ('1198', '1196', '三元区', '2', '-0-1168-1196-', 'S', '', '0', '1458284633', '0', '0');
INSERT INTO `sr_area` VALUES ('1199', '1196', '明溪县', '2', '-0-1168-1196-', 'M', '', '0', '1458284634', '0', '0');
INSERT INTO `sr_area` VALUES ('1200', '1196', '清流县', '2', '-0-1168-1196-', 'Q', '', '0', '1458284635', '0', '0');
INSERT INTO `sr_area` VALUES ('1201', '1196', '宁化县', '2', '-0-1168-1196-', 'N', '', '0', '1458284636', '0', '0');
INSERT INTO `sr_area` VALUES ('1202', '1196', '大田县', '2', '-0-1168-1196-', 'D', '', '0', '1458284637', '0', '0');
INSERT INTO `sr_area` VALUES ('1203', '1196', '尤溪县', '2', '-0-1168-1196-', 'Y', '', '0', '1458284638', '0', '0');
INSERT INTO `sr_area` VALUES ('1204', '1196', '沙县', '2', '-0-1168-1196-', 'S', '', '0', '1458284639', '0', '0');
INSERT INTO `sr_area` VALUES ('1205', '1196', '将乐县', '2', '-0-1168-1196-', 'J', '', '0', '1458284640', '0', '0');
INSERT INTO `sr_area` VALUES ('1206', '1196', '泰宁县', '2', '-0-1168-1196-', 'T', '', '0', '1458284641', '0', '0');
INSERT INTO `sr_area` VALUES ('1207', '1196', '建宁县', '2', '-0-1168-1196-', 'J', '', '0', '1458284642', '0', '0');
INSERT INTO `sr_area` VALUES ('1208', '1196', '永安市', '2', '-0-1168-1196-', 'Y', '', '0', '1458284643', '0', '0');
INSERT INTO `sr_area` VALUES ('1209', '1168', '泉州市', '1', '-0-1168-', 'Q', '', '0', '1458284644', '0', '0');
INSERT INTO `sr_area` VALUES ('1210', '1209', '鲤城区', '2', '-0-1168-1209-', 'L', '', '0', '1458284645', '0', '0');
INSERT INTO `sr_area` VALUES ('1211', '1209', '丰泽区', '2', '-0-1168-1209-', 'F', '', '0', '1458284646', '0', '0');
INSERT INTO `sr_area` VALUES ('1212', '1209', '洛江区', '2', '-0-1168-1209-', 'L', '', '0', '1458284647', '0', '0');
INSERT INTO `sr_area` VALUES ('1213', '1209', '泉港区', '2', '-0-1168-1209-', 'Q', '', '0', '1458284648', '0', '0');
INSERT INTO `sr_area` VALUES ('1214', '1209', '惠安县', '2', '-0-1168-1209-', 'H', '', '0', '1458284649', '0', '0');
INSERT INTO `sr_area` VALUES ('1215', '1209', '安溪县', '2', '-0-1168-1209-', 'A', '', '0', '1458284650', '0', '0');
INSERT INTO `sr_area` VALUES ('1216', '1209', '永春县', '2', '-0-1168-1209-', 'Y', '', '0', '1458284651', '0', '0');
INSERT INTO `sr_area` VALUES ('1217', '1209', '德化县', '2', '-0-1168-1209-', 'D', '', '0', '1458284652', '0', '0');
INSERT INTO `sr_area` VALUES ('1218', '1209', '金门县', '2', '-0-1168-1209-', 'J', '', '0', '1458284653', '0', '0');
INSERT INTO `sr_area` VALUES ('1219', '1209', '石狮市', '2', '-0-1168-1209-', 'S', '', '0', '1458284654', '0', '0');
INSERT INTO `sr_area` VALUES ('1220', '1209', '晋江市', '2', '-0-1168-1209-', 'J', '', '0', '1458284655', '0', '0');
INSERT INTO `sr_area` VALUES ('1221', '1209', '南安市', '2', '-0-1168-1209-', 'N', '', '0', '1458284656', '0', '0');
INSERT INTO `sr_area` VALUES ('1222', '1168', '漳州市', '1', '-0-1168-', 'Z', '', '0', '1458284657', '0', '0');
INSERT INTO `sr_area` VALUES ('1223', '1222', '芗城区', '2', '-0-1168-1222-', '', '', '0', '1458284658', '0', '0');
INSERT INTO `sr_area` VALUES ('1224', '1222', '龙文区', '2', '-0-1168-1222-', 'L', '', '0', '1458284659', '0', '0');
INSERT INTO `sr_area` VALUES ('1225', '1222', '云霄县', '2', '-0-1168-1222-', 'Y', '', '0', '1458284660', '0', '0');
INSERT INTO `sr_area` VALUES ('1226', '1222', '漳浦县', '2', '-0-1168-1222-', 'Z', '', '0', '1458284661', '0', '0');
INSERT INTO `sr_area` VALUES ('1227', '1222', '诏安县', '2', '-0-1168-1222-', '', '', '0', '1458284662', '0', '0');
INSERT INTO `sr_area` VALUES ('1228', '1222', '长泰县', '2', '-0-1168-1222-', 'C', '', '0', '1458284663', '0', '0');
INSERT INTO `sr_area` VALUES ('1229', '1222', '东山县', '2', '-0-1168-1222-', 'D', '', '0', '1458284664', '0', '0');
INSERT INTO `sr_area` VALUES ('1230', '1222', '南靖县', '2', '-0-1168-1222-', 'N', '', '0', '1458284665', '0', '0');
INSERT INTO `sr_area` VALUES ('1231', '1222', '平和县', '2', '-0-1168-1222-', 'P', '', '0', '1458284666', '0', '0');
INSERT INTO `sr_area` VALUES ('1232', '1222', '华安县', '2', '-0-1168-1222-', 'H', '', '0', '1458284667', '0', '0');
INSERT INTO `sr_area` VALUES ('1233', '1222', '龙海市', '2', '-0-1168-1222-', 'L', '', '0', '1458284668', '0', '0');
INSERT INTO `sr_area` VALUES ('1234', '1168', '南平市', '1', '-0-1168-', 'N', '', '0', '1458284669', '0', '0');
INSERT INTO `sr_area` VALUES ('1235', '1234', '延平区', '2', '-0-1168-1234-', 'Y', '', '0', '1458284670', '0', '0');
INSERT INTO `sr_area` VALUES ('1236', '1234', '顺昌县', '2', '-0-1168-1234-', 'S', '', '0', '1458284671', '0', '0');
INSERT INTO `sr_area` VALUES ('1237', '1234', '浦城县', '2', '-0-1168-1234-', 'P', '', '0', '1458284672', '0', '0');
INSERT INTO `sr_area` VALUES ('1238', '1234', '光泽县', '2', '-0-1168-1234-', 'G', '', '0', '1458284673', '0', '0');
INSERT INTO `sr_area` VALUES ('1239', '1234', '松溪县', '2', '-0-1168-1234-', 'S', '', '0', '1458284674', '0', '0');
INSERT INTO `sr_area` VALUES ('1240', '1234', '政和县', '2', '-0-1168-1234-', 'Z', '', '0', '1458284675', '0', '0');
INSERT INTO `sr_area` VALUES ('1241', '1234', '邵武市', '2', '-0-1168-1234-', 'S', '', '0', '1458284676', '0', '0');
INSERT INTO `sr_area` VALUES ('1242', '1234', '武夷山市', '2', '-0-1168-1234-', 'W', '', '0', '1458284677', '0', '0');
INSERT INTO `sr_area` VALUES ('1243', '1234', '建瓯市', '2', '-0-1168-1234-', 'J', '', '0', '1458284678', '0', '0');
INSERT INTO `sr_area` VALUES ('1244', '1234', '建阳市', '2', '-0-1168-1234-', 'J', '', '0', '1458284679', '0', '0');
INSERT INTO `sr_area` VALUES ('1245', '1168', '龙岩市', '1', '-0-1168-', 'L', '', '0', '1458284680', '0', '0');
INSERT INTO `sr_area` VALUES ('1246', '1245', '新罗区', '2', '-0-1168-1245-', 'X', '', '0', '1458284681', '0', '0');
INSERT INTO `sr_area` VALUES ('1247', '1245', '长汀县', '2', '-0-1168-1245-', 'C', '', '0', '1458284682', '0', '0');
INSERT INTO `sr_area` VALUES ('1248', '1245', '永定县', '2', '-0-1168-1245-', 'Y', '', '0', '1458284683', '0', '0');
INSERT INTO `sr_area` VALUES ('1249', '1245', '上杭县', '2', '-0-1168-1245-', 'S', '', '0', '1458284684', '0', '0');
INSERT INTO `sr_area` VALUES ('1250', '1245', '武平县', '2', '-0-1168-1245-', 'W', '', '0', '1458284685', '0', '0');
INSERT INTO `sr_area` VALUES ('1251', '1245', '连城县', '2', '-0-1168-1245-', 'L', '', '0', '1458284686', '0', '0');
INSERT INTO `sr_area` VALUES ('1252', '1245', '漳平市', '2', '-0-1168-1245-', 'Z', '', '0', '1458284687', '0', '0');
INSERT INTO `sr_area` VALUES ('1253', '1168', '宁德市', '1', '-0-1168-', 'N', '', '0', '1458284688', '0', '0');
INSERT INTO `sr_area` VALUES ('1254', '1253', '蕉城区', '2', '-0-1168-1253-', 'J', '', '0', '1458284689', '0', '0');
INSERT INTO `sr_area` VALUES ('1255', '1253', '霞浦县', '2', '-0-1168-1253-', 'X', '', '0', '1458284690', '0', '0');
INSERT INTO `sr_area` VALUES ('1256', '1253', '古田县', '2', '-0-1168-1253-', 'G', '', '0', '1458284691', '0', '0');
INSERT INTO `sr_area` VALUES ('1257', '1253', '屏南县', '2', '-0-1168-1253-', 'P', '', '0', '1458284692', '0', '0');
INSERT INTO `sr_area` VALUES ('1258', '1253', '寿宁县', '2', '-0-1168-1253-', 'S', '', '0', '1458284693', '0', '0');
INSERT INTO `sr_area` VALUES ('1259', '1253', '周宁县', '2', '-0-1168-1253-', 'Z', '', '0', '1458284694', '0', '0');
INSERT INTO `sr_area` VALUES ('1260', '1253', '柘荣县', '2', '-0-1168-1253-', '', '', '0', '1458284695', '0', '0');
INSERT INTO `sr_area` VALUES ('1261', '1253', '福安市', '2', '-0-1168-1253-', 'F', '', '0', '1458284696', '0', '0');
INSERT INTO `sr_area` VALUES ('1262', '1253', '福鼎市', '2', '-0-1168-1253-', 'F', '', '0', '1458284697', '0', '0');
INSERT INTO `sr_area` VALUES ('1263', '0', '江西', '0', '-0-', 'J', '华东', '0', '1458284698', '0', '0');
INSERT INTO `sr_area` VALUES ('1264', '1263', '南昌市', '1', '-0-1263-', 'N', '', '0', '1458284699', '0', '0');
INSERT INTO `sr_area` VALUES ('1265', '1264', '东湖区', '2', '-0-1263-1264-', 'D', '', '0', '1458284700', '0', '0');
INSERT INTO `sr_area` VALUES ('1266', '1264', '西湖区', '2', '-0-1263-1264-', 'X', '', '0', '1458284701', '0', '0');
INSERT INTO `sr_area` VALUES ('1267', '1264', '青云谱区', '2', '-0-1263-1264-', 'Q', '', '0', '1458284702', '0', '0');
INSERT INTO `sr_area` VALUES ('1268', '1264', '湾里区', '2', '-0-1263-1264-', 'W', '', '0', '1458284703', '0', '0');
INSERT INTO `sr_area` VALUES ('1269', '1264', '青山湖区', '2', '-0-1263-1264-', 'Q', '', '0', '1458284704', '0', '0');
INSERT INTO `sr_area` VALUES ('1270', '1264', '南昌县', '2', '-0-1263-1264-', 'N', '', '0', '1458284705', '0', '0');
INSERT INTO `sr_area` VALUES ('1271', '1264', '新建县', '2', '-0-1263-1264-', 'X', '', '0', '1458284706', '0', '0');
INSERT INTO `sr_area` VALUES ('1272', '1264', '安义县', '2', '-0-1263-1264-', 'A', '', '0', '1458284707', '0', '0');
INSERT INTO `sr_area` VALUES ('1273', '1264', '进贤县', '2', '-0-1263-1264-', 'J', '', '0', '1458284708', '0', '0');
INSERT INTO `sr_area` VALUES ('1274', '1263', '景德镇市', '1', '-0-1263-', 'J', '', '0', '1458284709', '0', '0');
INSERT INTO `sr_area` VALUES ('1275', '1274', '昌江区', '2', '-0-1263-1274-', 'C', '', '0', '1458284710', '0', '0');
INSERT INTO `sr_area` VALUES ('1276', '1274', '珠山区', '2', '-0-1263-1274-', 'Z', '', '0', '1458284711', '0', '0');
INSERT INTO `sr_area` VALUES ('1277', '1274', '浮梁县', '2', '-0-1263-1274-', 'F', '', '0', '1458284712', '0', '0');
INSERT INTO `sr_area` VALUES ('1278', '1274', '乐平市', '2', '-0-1263-1274-', 'L', '', '0', '1458284713', '0', '0');
INSERT INTO `sr_area` VALUES ('1279', '1263', '萍乡市', '1', '-0-1263-', 'P', '', '0', '1458284714', '0', '0');
INSERT INTO `sr_area` VALUES ('1280', '1279', '安源区', '2', '-0-1263-1279-', 'A', '', '0', '1458284715', '0', '0');
INSERT INTO `sr_area` VALUES ('1281', '1279', '湘东区', '2', '-0-1263-1279-', 'X', '', '0', '1458284716', '0', '0');
INSERT INTO `sr_area` VALUES ('1282', '1279', '莲花县', '2', '-0-1263-1279-', 'L', '', '0', '1458284717', '0', '0');
INSERT INTO `sr_area` VALUES ('1283', '1279', '上栗县', '2', '-0-1263-1279-', 'S', '', '0', '1458284718', '0', '0');
INSERT INTO `sr_area` VALUES ('1284', '1279', '芦溪县', '2', '-0-1263-1279-', 'L', '', '0', '1458284719', '0', '0');
INSERT INTO `sr_area` VALUES ('1285', '1263', '九江市', '1', '-0-1263-', 'J', '', '0', '1458284720', '0', '0');
INSERT INTO `sr_area` VALUES ('1286', '1285', '庐山区', '2', '-0-1263-1285-', 'L', '', '0', '1458284721', '0', '0');
INSERT INTO `sr_area` VALUES ('1287', '1285', '浔阳区', '2', '-0-1263-1285-', '', '', '0', '1458284722', '0', '0');
INSERT INTO `sr_area` VALUES ('1288', '1285', '九江县', '2', '-0-1263-1285-', 'J', '', '0', '1458284723', '0', '0');
INSERT INTO `sr_area` VALUES ('1289', '1285', '武宁县', '2', '-0-1263-1285-', 'W', '', '0', '1458284724', '0', '0');
INSERT INTO `sr_area` VALUES ('1290', '1285', '修水县', '2', '-0-1263-1285-', 'X', '', '0', '1458284725', '0', '0');
INSERT INTO `sr_area` VALUES ('1291', '1285', '永修县', '2', '-0-1263-1285-', 'Y', '', '0', '1458284726', '0', '0');
INSERT INTO `sr_area` VALUES ('1292', '1285', '德安县', '2', '-0-1263-1285-', 'D', '', '0', '1458284727', '0', '0');
INSERT INTO `sr_area` VALUES ('1293', '1285', '星子县', '2', '-0-1263-1285-', 'X', '', '0', '1458284728', '0', '0');
INSERT INTO `sr_area` VALUES ('1294', '1285', '都昌县', '2', '-0-1263-1285-', 'D', '', '0', '1458284729', '0', '0');
INSERT INTO `sr_area` VALUES ('1295', '1285', '湖口县', '2', '-0-1263-1285-', 'H', '', '0', '1458284730', '0', '0');
INSERT INTO `sr_area` VALUES ('1296', '1285', '彭泽县', '2', '-0-1263-1285-', 'P', '', '0', '1458284731', '0', '0');
INSERT INTO `sr_area` VALUES ('1297', '1285', '瑞昌市', '2', '-0-1263-1285-', 'R', '', '0', '1458284732', '0', '0');
INSERT INTO `sr_area` VALUES ('1298', '1263', '新余市', '1', '-0-1263-', 'X', '', '0', '1458284733', '0', '0');
INSERT INTO `sr_area` VALUES ('1299', '1298', '渝水区', '2', '-0-1263-1298-', 'Y', '', '0', '1458284734', '0', '0');
INSERT INTO `sr_area` VALUES ('1300', '1298', '分宜县', '2', '-0-1263-1298-', 'F', '', '0', '1458284735', '0', '0');
INSERT INTO `sr_area` VALUES ('1301', '1263', '鹰潭市', '1', '-0-1263-', 'Y', '', '0', '1458284736', '0', '0');
INSERT INTO `sr_area` VALUES ('1302', '1301', '月湖区', '2', '-0-1263-1301-', 'Y', '', '0', '1458284737', '0', '0');
INSERT INTO `sr_area` VALUES ('1303', '1301', '余江县', '2', '-0-1263-1301-', 'Y', '', '0', '1458284738', '0', '0');
INSERT INTO `sr_area` VALUES ('1304', '1301', '贵溪市', '2', '-0-1263-1301-', 'G', '', '0', '1458284739', '0', '0');
INSERT INTO `sr_area` VALUES ('1305', '1263', '赣州市', '1', '-0-1263-', 'G', '', '0', '1458284740', '0', '0');
INSERT INTO `sr_area` VALUES ('1306', '1305', '章贡区', '2', '-0-1263-1305-', 'Z', '', '0', '1458284741', '0', '0');
INSERT INTO `sr_area` VALUES ('1307', '1305', '赣县', '2', '-0-1263-1305-', 'G', '', '0', '1458284742', '0', '0');
INSERT INTO `sr_area` VALUES ('1308', '1305', '信丰县', '2', '-0-1263-1305-', 'X', '', '0', '1458284743', '0', '0');
INSERT INTO `sr_area` VALUES ('1309', '1305', '大余县', '2', '-0-1263-1305-', 'D', '', '0', '1458284744', '0', '0');
INSERT INTO `sr_area` VALUES ('1310', '1305', '上犹县', '2', '-0-1263-1305-', 'S', '', '0', '1458284745', '0', '0');
INSERT INTO `sr_area` VALUES ('1311', '1305', '崇义县', '2', '-0-1263-1305-', 'C', '', '0', '1458284746', '0', '0');
INSERT INTO `sr_area` VALUES ('1312', '1305', '安远县', '2', '-0-1263-1305-', 'A', '', '0', '1458284747', '0', '0');
INSERT INTO `sr_area` VALUES ('1313', '1305', '龙南县', '2', '-0-1263-1305-', 'L', '', '0', '1458284748', '0', '0');
INSERT INTO `sr_area` VALUES ('1314', '1305', '定南县', '2', '-0-1263-1305-', 'D', '', '0', '1458284749', '0', '0');
INSERT INTO `sr_area` VALUES ('1315', '1305', '全南县', '2', '-0-1263-1305-', 'Q', '', '0', '1458284750', '0', '0');
INSERT INTO `sr_area` VALUES ('1316', '1305', '宁都县', '2', '-0-1263-1305-', 'N', '', '0', '1458284751', '0', '0');
INSERT INTO `sr_area` VALUES ('1317', '1305', '于都县', '2', '-0-1263-1305-', 'Y', '', '0', '1458284752', '0', '0');
INSERT INTO `sr_area` VALUES ('1318', '1305', '兴国县', '2', '-0-1263-1305-', 'X', '', '0', '1458284753', '0', '0');
INSERT INTO `sr_area` VALUES ('1319', '1305', '会昌县', '2', '-0-1263-1305-', 'H', '', '0', '1458284754', '0', '0');
INSERT INTO `sr_area` VALUES ('1320', '1305', '寻乌县', '2', '-0-1263-1305-', 'X', '', '0', '1458284755', '0', '0');
INSERT INTO `sr_area` VALUES ('1321', '1305', '石城县', '2', '-0-1263-1305-', 'S', '', '0', '1458284756', '0', '0');
INSERT INTO `sr_area` VALUES ('1322', '1305', '瑞金市', '2', '-0-1263-1305-', 'R', '', '0', '1458284757', '0', '0');
INSERT INTO `sr_area` VALUES ('1323', '1305', '南康市', '2', '-0-1263-1305-', 'N', '', '0', '1458284758', '0', '0');
INSERT INTO `sr_area` VALUES ('1324', '1263', '吉安市', '1', '-0-1263-', 'J', '', '0', '1458284759', '0', '0');
INSERT INTO `sr_area` VALUES ('1325', '1324', '吉州区', '2', '-0-1263-1324-', 'J', '', '0', '1458284760', '0', '0');
INSERT INTO `sr_area` VALUES ('1326', '1324', '青原区', '2', '-0-1263-1324-', 'Q', '', '0', '1458284761', '0', '0');
INSERT INTO `sr_area` VALUES ('1327', '1324', '吉安县', '2', '-0-1263-1324-', 'J', '', '0', '1458284762', '0', '0');
INSERT INTO `sr_area` VALUES ('1328', '1324', '吉水县', '2', '-0-1263-1324-', 'J', '', '0', '1458284763', '0', '0');
INSERT INTO `sr_area` VALUES ('1329', '1324', '峡江县', '2', '-0-1263-1324-', 'X', '', '0', '1458284764', '0', '0');
INSERT INTO `sr_area` VALUES ('1330', '1324', '新干县', '2', '-0-1263-1324-', 'X', '', '0', '1458284765', '0', '0');
INSERT INTO `sr_area` VALUES ('1331', '1324', '永丰县', '2', '-0-1263-1324-', 'Y', '', '0', '1458284766', '0', '0');
INSERT INTO `sr_area` VALUES ('1332', '1324', '泰和县', '2', '-0-1263-1324-', 'T', '', '0', '1458284767', '0', '0');
INSERT INTO `sr_area` VALUES ('1333', '1324', '遂川县', '2', '-0-1263-1324-', 'S', '', '0', '1458284768', '0', '0');
INSERT INTO `sr_area` VALUES ('1334', '1324', '万安县', '2', '-0-1263-1324-', 'W', '', '0', '1458284769', '0', '0');
INSERT INTO `sr_area` VALUES ('1335', '1324', '安福县', '2', '-0-1263-1324-', 'A', '', '0', '1458284770', '0', '0');
INSERT INTO `sr_area` VALUES ('1336', '1324', '永新县', '2', '-0-1263-1324-', 'Y', '', '0', '1458284771', '0', '0');
INSERT INTO `sr_area` VALUES ('1337', '1324', '井冈山市', '2', '-0-1263-1324-', 'J', '', '0', '1458284772', '0', '0');
INSERT INTO `sr_area` VALUES ('1338', '1263', '宜春市', '1', '-0-1263-', 'Y', '', '0', '1458284773', '0', '0');
INSERT INTO `sr_area` VALUES ('1339', '1338', '袁州区', '2', '-0-1263-1338-', 'Y', '', '0', '1458284774', '0', '0');
INSERT INTO `sr_area` VALUES ('1340', '1338', '奉新县', '2', '-0-1263-1338-', 'F', '', '0', '1458284775', '0', '0');
INSERT INTO `sr_area` VALUES ('1341', '1338', '万载县', '2', '-0-1263-1338-', 'W', '', '0', '1458284776', '0', '0');
INSERT INTO `sr_area` VALUES ('1342', '1338', '上高县', '2', '-0-1263-1338-', 'S', '', '0', '1458284777', '0', '0');
INSERT INTO `sr_area` VALUES ('1343', '1338', '宜丰县', '2', '-0-1263-1338-', 'Y', '', '0', '1458284778', '0', '0');
INSERT INTO `sr_area` VALUES ('1344', '1338', '靖安县', '2', '-0-1263-1338-', 'J', '', '0', '1458284779', '0', '0');
INSERT INTO `sr_area` VALUES ('1345', '1338', '铜鼓县', '2', '-0-1263-1338-', 'T', '', '0', '1458284780', '0', '0');
INSERT INTO `sr_area` VALUES ('1346', '1338', '丰城市', '2', '-0-1263-1338-', 'F', '', '0', '1458284781', '0', '0');
INSERT INTO `sr_area` VALUES ('1347', '1338', '樟树市', '2', '-0-1263-1338-', 'Z', '', '0', '1458284782', '0', '0');
INSERT INTO `sr_area` VALUES ('1348', '1338', '高安市', '2', '-0-1263-1338-', 'G', '', '0', '1458284783', '0', '0');
INSERT INTO `sr_area` VALUES ('1349', '1263', '抚州市', '1', '-0-1263-', 'F', '', '0', '1458284784', '0', '0');
INSERT INTO `sr_area` VALUES ('1350', '1349', '临川区', '2', '-0-1263-1349-', 'L', '', '0', '1458284785', '0', '0');
INSERT INTO `sr_area` VALUES ('1351', '1349', '南城县', '2', '-0-1263-1349-', 'N', '', '0', '1458284786', '0', '0');
INSERT INTO `sr_area` VALUES ('1352', '1349', '黎川县', '2', '-0-1263-1349-', 'L', '', '0', '1458284787', '0', '0');
INSERT INTO `sr_area` VALUES ('1353', '1349', '南丰县', '2', '-0-1263-1349-', 'N', '', '0', '1458284788', '0', '0');
INSERT INTO `sr_area` VALUES ('1354', '1349', '崇仁县', '2', '-0-1263-1349-', 'C', '', '0', '1458284789', '0', '0');
INSERT INTO `sr_area` VALUES ('1355', '1349', '乐安县', '2', '-0-1263-1349-', 'L', '', '0', '1458284790', '0', '0');
INSERT INTO `sr_area` VALUES ('1356', '1349', '宜黄县', '2', '-0-1263-1349-', 'Y', '', '0', '1458284791', '0', '0');
INSERT INTO `sr_area` VALUES ('1357', '1349', '金溪县', '2', '-0-1263-1349-', 'J', '', '0', '1458284792', '0', '0');
INSERT INTO `sr_area` VALUES ('1358', '1349', '资溪县', '2', '-0-1263-1349-', 'Z', '', '0', '1458284793', '0', '0');
INSERT INTO `sr_area` VALUES ('1359', '1349', '东乡县', '2', '-0-1263-1349-', 'D', '', '0', '1458284794', '0', '0');
INSERT INTO `sr_area` VALUES ('1360', '1349', '广昌县', '2', '-0-1263-1349-', 'G', '', '0', '1458284795', '0', '0');
INSERT INTO `sr_area` VALUES ('1361', '1263', '上饶市', '1', '-0-1263-', 'S', '', '0', '1458284796', '0', '0');
INSERT INTO `sr_area` VALUES ('1362', '1361', '信州区', '2', '-0-1263-1361-', 'X', '', '0', '1458284797', '0', '0');
INSERT INTO `sr_area` VALUES ('1363', '1361', '上饶县', '2', '-0-1263-1361-', 'S', '', '0', '1458284798', '0', '0');
INSERT INTO `sr_area` VALUES ('1364', '1361', '广丰县', '2', '-0-1263-1361-', 'G', '', '0', '1458284799', '0', '0');
INSERT INTO `sr_area` VALUES ('1365', '1361', '玉山县', '2', '-0-1263-1361-', 'Y', '', '0', '1458284800', '0', '0');
INSERT INTO `sr_area` VALUES ('1366', '1361', '铅山县', '2', '-0-1263-1361-', 'Q', '', '0', '1458284801', '0', '0');
INSERT INTO `sr_area` VALUES ('1367', '1361', '横峰县', '2', '-0-1263-1361-', 'H', '', '0', '1458284802', '0', '0');
INSERT INTO `sr_area` VALUES ('1368', '1361', '弋阳县', '2', '-0-1263-1361-', '', '', '0', '1458284803', '0', '0');
INSERT INTO `sr_area` VALUES ('1369', '1361', '余干县', '2', '-0-1263-1361-', 'Y', '', '0', '1458284804', '0', '0');
INSERT INTO `sr_area` VALUES ('1370', '1361', '鄱阳县', '2', '-0-1263-1361-', '', '', '0', '1458284805', '0', '0');
INSERT INTO `sr_area` VALUES ('1371', '1361', '万年县', '2', '-0-1263-1361-', 'W', '', '0', '1458284806', '0', '0');
INSERT INTO `sr_area` VALUES ('1372', '1361', '婺源县', '2', '-0-1263-1361-', '', '', '0', '1458284807', '0', '0');
INSERT INTO `sr_area` VALUES ('1373', '1361', '德兴市', '2', '-0-1263-1361-', 'D', '', '0', '1458284808', '0', '0');
INSERT INTO `sr_area` VALUES ('1374', '0', '山东', '0', '-0-', 'S', '华北', '0', '1458284809', '0', '0');
INSERT INTO `sr_area` VALUES ('1375', '1374', '济南市', '1', '-0-1374-', 'J', '', '0', '1458284810', '0', '0');
INSERT INTO `sr_area` VALUES ('1376', '1375', '历下区', '2', '-0-1374-1375-', 'L', '', '0', '1458284811', '0', '0');
INSERT INTO `sr_area` VALUES ('1377', '1375', '市中区', '2', '-0-1374-1375-', 'S', '', '0', '1458284812', '0', '0');
INSERT INTO `sr_area` VALUES ('1378', '1375', '槐荫区', '2', '-0-1374-1375-', 'H', '', '0', '1458284813', '0', '0');
INSERT INTO `sr_area` VALUES ('1379', '1375', '天桥区', '2', '-0-1374-1375-', 'T', '', '0', '1458284814', '0', '0');
INSERT INTO `sr_area` VALUES ('1380', '1375', '历城区', '2', '-0-1374-1375-', 'L', '', '0', '1458284815', '0', '0');
INSERT INTO `sr_area` VALUES ('1381', '1375', '长清区', '2', '-0-1374-1375-', 'C', '', '0', '1458284816', '0', '0');
INSERT INTO `sr_area` VALUES ('1382', '1375', '平阴县', '2', '-0-1374-1375-', 'P', '', '0', '1458284817', '0', '0');
INSERT INTO `sr_area` VALUES ('1383', '1375', '济阳县', '2', '-0-1374-1375-', 'J', '', '0', '1458284818', '0', '0');
INSERT INTO `sr_area` VALUES ('1384', '1375', '商河县', '2', '-0-1374-1375-', 'S', '', '0', '1458284819', '0', '0');
INSERT INTO `sr_area` VALUES ('1385', '1375', '章丘市', '2', '-0-1374-1375-', 'Z', '', '0', '1458284820', '0', '0');
INSERT INTO `sr_area` VALUES ('1386', '1374', '青岛市', '1', '-0-1374-', 'Q', '', '0', '1458284821', '0', '0');
INSERT INTO `sr_area` VALUES ('1387', '1386', '市南区', '2', '-0-1374-1386-', 'S', '', '0', '1458284822', '0', '0');
INSERT INTO `sr_area` VALUES ('1388', '1386', '市北区', '2', '-0-1374-1386-', 'S', '', '0', '1458284823', '0', '0');
INSERT INTO `sr_area` VALUES ('1389', '1386', '四方区', '2', '-0-1374-1386-', 'S', '', '0', '1458284824', '0', '0');
INSERT INTO `sr_area` VALUES ('1390', '1386', '黄岛区', '2', '-0-1374-1386-', 'H', '', '0', '1458284825', '0', '0');
INSERT INTO `sr_area` VALUES ('1391', '1386', '崂山区', '2', '-0-1374-1386-', '', '', '0', '1458284826', '0', '0');
INSERT INTO `sr_area` VALUES ('1392', '1386', '李沧区', '2', '-0-1374-1386-', 'L', '', '0', '1458284827', '0', '0');
INSERT INTO `sr_area` VALUES ('1393', '1386', '城阳区', '2', '-0-1374-1386-', 'C', '', '0', '1458284828', '0', '0');
INSERT INTO `sr_area` VALUES ('1394', '1386', '胶州市', '2', '-0-1374-1386-', 'J', '', '0', '1458284829', '0', '0');
INSERT INTO `sr_area` VALUES ('1395', '1386', '即墨市', '2', '-0-1374-1386-', 'J', '', '0', '1458284830', '0', '0');
INSERT INTO `sr_area` VALUES ('1396', '1386', '平度市', '2', '-0-1374-1386-', 'P', '', '0', '1458284831', '0', '0');
INSERT INTO `sr_area` VALUES ('1397', '1386', '胶南市', '2', '-0-1374-1386-', 'J', '', '0', '1458284832', '0', '0');
INSERT INTO `sr_area` VALUES ('1398', '1386', '莱西市', '2', '-0-1374-1386-', 'L', '', '0', '1458284833', '0', '0');
INSERT INTO `sr_area` VALUES ('1399', '1374', '淄博市', '1', '-0-1374-', 'Z', '', '0', '1458284834', '0', '0');
INSERT INTO `sr_area` VALUES ('1400', '1399', '淄川区', '2', '-0-1374-1399-', 'Z', '', '0', '1458284835', '0', '0');
INSERT INTO `sr_area` VALUES ('1401', '1399', '张店区', '2', '-0-1374-1399-', 'Z', '', '0', '1458284836', '0', '0');
INSERT INTO `sr_area` VALUES ('1402', '1399', '博山区', '2', '-0-1374-1399-', 'B', '', '0', '1458284837', '0', '0');
INSERT INTO `sr_area` VALUES ('1403', '1399', '临淄区', '2', '-0-1374-1399-', 'L', '', '0', '1458284838', '0', '0');
INSERT INTO `sr_area` VALUES ('1404', '1399', '周村区', '2', '-0-1374-1399-', 'Z', '', '0', '1458284839', '0', '0');
INSERT INTO `sr_area` VALUES ('1405', '1399', '桓台县', '2', '-0-1374-1399-', 'H', '', '0', '1458284840', '0', '0');
INSERT INTO `sr_area` VALUES ('1406', '1399', '高青县', '2', '-0-1374-1399-', 'G', '', '0', '1458284841', '0', '0');
INSERT INTO `sr_area` VALUES ('1407', '1399', '沂源县', '2', '-0-1374-1399-', 'Y', '', '0', '1458284842', '0', '0');
INSERT INTO `sr_area` VALUES ('1408', '1374', '枣庄市', '1', '-0-1374-', 'Z', '', '0', '1458284843', '0', '0');
INSERT INTO `sr_area` VALUES ('1409', '1408', '市中区', '2', '-0-1374-1408-', 'S', '', '0', '1458284844', '0', '0');
INSERT INTO `sr_area` VALUES ('1410', '1408', '薛城区', '2', '-0-1374-1408-', 'X', '', '0', '1458284845', '0', '0');
INSERT INTO `sr_area` VALUES ('1411', '1408', '峄城区', '2', '-0-1374-1408-', '', '', '0', '1458284846', '0', '0');
INSERT INTO `sr_area` VALUES ('1412', '1408', '台儿庄区', '2', '-0-1374-1408-', 'T', '', '0', '1458284847', '0', '0');
INSERT INTO `sr_area` VALUES ('1413', '1408', '山亭区', '2', '-0-1374-1408-', 'S', '', '0', '1458284848', '0', '0');
INSERT INTO `sr_area` VALUES ('1414', '1408', '滕州市', '2', '-0-1374-1408-', '', '', '0', '1458284849', '0', '0');
INSERT INTO `sr_area` VALUES ('1415', '1374', '东营市', '1', '-0-1374-', 'D', '', '0', '1458284850', '0', '0');
INSERT INTO `sr_area` VALUES ('1416', '1415', '东营区', '2', '-0-1374-1415-', 'D', '', '0', '1458284851', '0', '0');
INSERT INTO `sr_area` VALUES ('1417', '1415', '河口区', '2', '-0-1374-1415-', 'H', '', '0', '1458284852', '0', '0');
INSERT INTO `sr_area` VALUES ('1418', '1415', '垦利县', '2', '-0-1374-1415-', 'K', '', '0', '1458284853', '0', '0');
INSERT INTO `sr_area` VALUES ('1419', '1415', '利津县', '2', '-0-1374-1415-', 'L', '', '0', '1458284854', '0', '0');
INSERT INTO `sr_area` VALUES ('1420', '1415', '广饶县', '2', '-0-1374-1415-', 'G', '', '0', '1458284855', '0', '0');
INSERT INTO `sr_area` VALUES ('1421', '1374', '烟台市', '1', '-0-1374-', 'Y', '', '0', '1458284856', '0', '0');
INSERT INTO `sr_area` VALUES ('1422', '1421', '芝罘区', '2', '-0-1374-1421-', 'Z', '', '0', '1458284857', '0', '0');
INSERT INTO `sr_area` VALUES ('1423', '1421', '福山区', '2', '-0-1374-1421-', 'F', '', '0', '1458284858', '0', '0');
INSERT INTO `sr_area` VALUES ('1424', '1421', '牟平区', '2', '-0-1374-1421-', 'M', '', '0', '1458284859', '0', '0');
INSERT INTO `sr_area` VALUES ('1425', '1421', '莱山区', '2', '-0-1374-1421-', 'L', '', '0', '1458284860', '0', '0');
INSERT INTO `sr_area` VALUES ('1426', '1421', '长岛县', '2', '-0-1374-1421-', 'C', '', '0', '1458284861', '0', '0');
INSERT INTO `sr_area` VALUES ('1427', '1421', '龙口市', '2', '-0-1374-1421-', 'L', '', '0', '1458284862', '0', '0');
INSERT INTO `sr_area` VALUES ('1428', '1421', '莱阳市', '2', '-0-1374-1421-', 'L', '', '0', '1458284863', '0', '0');
INSERT INTO `sr_area` VALUES ('1429', '1421', '莱州市', '2', '-0-1374-1421-', 'L', '', '0', '1458284864', '0', '0');
INSERT INTO `sr_area` VALUES ('1430', '1421', '蓬莱市', '2', '-0-1374-1421-', 'P', '', '0', '1458284865', '0', '0');
INSERT INTO `sr_area` VALUES ('1431', '1421', '招远市', '2', '-0-1374-1421-', 'Z', '', '0', '1458284866', '0', '0');
INSERT INTO `sr_area` VALUES ('1432', '1421', '栖霞市', '2', '-0-1374-1421-', 'Q', '', '0', '1458284867', '0', '0');
INSERT INTO `sr_area` VALUES ('1433', '1421', '海阳市', '2', '-0-1374-1421-', 'H', '', '0', '1458284868', '0', '0');
INSERT INTO `sr_area` VALUES ('1434', '1374', '潍坊市', '1', '-0-1374-', 'W', '', '0', '1458284869', '0', '0');
INSERT INTO `sr_area` VALUES ('1435', '1434', '潍城区', '2', '-0-1374-1434-', 'W', '', '0', '1458284870', '0', '0');
INSERT INTO `sr_area` VALUES ('1436', '1434', '寒亭区', '2', '-0-1374-1434-', 'H', '', '0', '1458284871', '0', '0');
INSERT INTO `sr_area` VALUES ('1437', '1434', '坊子区', '2', '-0-1374-1434-', 'F', '', '0', '1458284872', '0', '0');
INSERT INTO `sr_area` VALUES ('1438', '1434', '奎文区', '2', '-0-1374-1434-', 'K', '', '0', '1458284873', '0', '0');
INSERT INTO `sr_area` VALUES ('1439', '1434', '临朐县', '2', '-0-1374-1434-', 'L', '', '0', '1458284874', '0', '0');
INSERT INTO `sr_area` VALUES ('1440', '1434', '昌乐县', '2', '-0-1374-1434-', 'C', '', '0', '1458284875', '0', '0');
INSERT INTO `sr_area` VALUES ('1441', '1434', '青州市', '2', '-0-1374-1434-', 'Q', '', '0', '1458284876', '0', '0');
INSERT INTO `sr_area` VALUES ('1442', '1434', '诸城市', '2', '-0-1374-1434-', 'Z', '', '0', '1458284877', '0', '0');
INSERT INTO `sr_area` VALUES ('1443', '1434', '寿光市', '2', '-0-1374-1434-', 'S', '', '0', '1458284878', '0', '0');
INSERT INTO `sr_area` VALUES ('1444', '1434', '安丘市', '2', '-0-1374-1434-', 'A', '', '0', '1458284879', '0', '0');
INSERT INTO `sr_area` VALUES ('1445', '1434', '高密市', '2', '-0-1374-1434-', 'G', '', '0', '1458284880', '0', '0');
INSERT INTO `sr_area` VALUES ('1446', '1434', '昌邑市', '2', '-0-1374-1434-', 'C', '', '0', '1458284881', '0', '0');
INSERT INTO `sr_area` VALUES ('1447', '1374', '济宁市', '1', '-0-1374-', 'J', '', '0', '1458284882', '0', '0');
INSERT INTO `sr_area` VALUES ('1448', '1447', '市中区', '2', '-0-1374-1447-', 'S', '', '0', '1458284883', '0', '0');
INSERT INTO `sr_area` VALUES ('1449', '1447', '任城区', '2', '-0-1374-1447-', 'R', '', '0', '1458284884', '0', '0');
INSERT INTO `sr_area` VALUES ('1450', '1447', '微山县', '2', '-0-1374-1447-', 'W', '', '0', '1458284885', '0', '0');
INSERT INTO `sr_area` VALUES ('1451', '1447', '鱼台县', '2', '-0-1374-1447-', 'Y', '', '0', '1458284886', '0', '0');
INSERT INTO `sr_area` VALUES ('1452', '1447', '金乡县', '2', '-0-1374-1447-', 'J', '', '0', '1458284887', '0', '0');
INSERT INTO `sr_area` VALUES ('1453', '1447', '嘉祥县', '2', '-0-1374-1447-', 'J', '', '0', '1458284888', '0', '0');
INSERT INTO `sr_area` VALUES ('1454', '1447', '汶上县', '2', '-0-1374-1447-', '', '', '0', '1458284889', '0', '0');
INSERT INTO `sr_area` VALUES ('1455', '1447', '泗水县', '2', '-0-1374-1447-', '', '', '0', '1458284890', '0', '0');
INSERT INTO `sr_area` VALUES ('1456', '1447', '梁山县', '2', '-0-1374-1447-', 'L', '', '0', '1458284891', '0', '0');
INSERT INTO `sr_area` VALUES ('1457', '1447', '曲阜市', '2', '-0-1374-1447-', 'Q', '', '0', '1458284892', '0', '0');
INSERT INTO `sr_area` VALUES ('1458', '1447', '兖州市', '2', '-0-1374-1447-', '', '', '0', '1458284893', '0', '0');
INSERT INTO `sr_area` VALUES ('1459', '1447', '邹城市', '2', '-0-1374-1447-', 'Z', '', '0', '1458284894', '0', '0');
INSERT INTO `sr_area` VALUES ('1460', '1374', '泰安市', '1', '-0-1374-', 'T', '', '0', '1458284895', '0', '0');
INSERT INTO `sr_area` VALUES ('1461', '1460', '泰山区', '2', '-0-1374-1460-', 'T', '', '0', '1458284896', '0', '0');
INSERT INTO `sr_area` VALUES ('1462', '1460', '岱岳区', '2', '-0-1374-1460-', '', '', '0', '1458284897', '0', '0');
INSERT INTO `sr_area` VALUES ('1463', '1460', '宁阳县', '2', '-0-1374-1460-', 'N', '', '0', '1458284898', '0', '0');
INSERT INTO `sr_area` VALUES ('1464', '1460', '东平县', '2', '-0-1374-1460-', 'D', '', '0', '1458284899', '0', '0');
INSERT INTO `sr_area` VALUES ('1465', '1460', '新泰市', '2', '-0-1374-1460-', 'X', '', '0', '1458284900', '0', '0');
INSERT INTO `sr_area` VALUES ('1466', '1460', '肥城市', '2', '-0-1374-1460-', 'F', '', '0', '1458284901', '0', '0');
INSERT INTO `sr_area` VALUES ('1467', '1374', '威海市', '1', '-0-1374-', 'W', '', '0', '1458284902', '0', '0');
INSERT INTO `sr_area` VALUES ('1468', '1467', '环翠区', '2', '-0-1374-1467-', 'H', '', '0', '1458284903', '0', '0');
INSERT INTO `sr_area` VALUES ('1469', '1467', '文登市', '2', '-0-1374-1467-', 'W', '', '0', '1458284904', '0', '0');
INSERT INTO `sr_area` VALUES ('1470', '1467', '荣成市', '2', '-0-1374-1467-', 'R', '', '0', '1458284905', '0', '0');
INSERT INTO `sr_area` VALUES ('1471', '1467', '乳山市', '2', '-0-1374-1467-', 'R', '', '0', '1458284906', '0', '0');
INSERT INTO `sr_area` VALUES ('1472', '1374', '日照市', '1', '-0-1374-', 'R', '', '0', '1458284907', '0', '0');
INSERT INTO `sr_area` VALUES ('1473', '1472', '东港区', '2', '-0-1374-1472-', 'D', '', '0', '1458284908', '0', '0');
INSERT INTO `sr_area` VALUES ('1474', '1472', '岚山区', '2', '-0-1374-1472-', '', '', '0', '1458284909', '0', '0');
INSERT INTO `sr_area` VALUES ('1475', '1472', '五莲县', '2', '-0-1374-1472-', 'W', '', '0', '1458284910', '0', '0');
INSERT INTO `sr_area` VALUES ('1476', '1472', '莒县', '2', '-0-1374-1472-', '', '', '0', '1458284911', '0', '0');
INSERT INTO `sr_area` VALUES ('1477', '1374', '莱芜市', '1', '-0-1374-', 'L', '', '0', '1458284912', '0', '0');
INSERT INTO `sr_area` VALUES ('1478', '1477', '莱城区', '2', '-0-1374-1477-', 'L', '', '0', '1458284913', '0', '0');
INSERT INTO `sr_area` VALUES ('1479', '1477', '钢城区', '2', '-0-1374-1477-', 'G', '', '0', '1458284914', '0', '0');
INSERT INTO `sr_area` VALUES ('1480', '1374', '临沂市', '1', '-0-1374-', 'L', '', '0', '1458284915', '0', '0');
INSERT INTO `sr_area` VALUES ('1481', '1480', '兰山区', '2', '-0-1374-1480-', 'L', '', '0', '1458284916', '0', '0');
INSERT INTO `sr_area` VALUES ('1482', '1480', '罗庄区', '2', '-0-1374-1480-', 'L', '', '0', '1458284917', '0', '0');
INSERT INTO `sr_area` VALUES ('1483', '1480', '河东区', '2', '-0-1374-1480-', 'H', '', '0', '1458284918', '0', '0');
INSERT INTO `sr_area` VALUES ('1484', '1480', '沂南县', '2', '-0-1374-1480-', 'Y', '', '0', '1458284919', '0', '0');
INSERT INTO `sr_area` VALUES ('1485', '1480', '郯城县', '2', '-0-1374-1480-', '', '', '0', '1458284920', '0', '0');
INSERT INTO `sr_area` VALUES ('1486', '1480', '沂水县', '2', '-0-1374-1480-', 'Y', '', '0', '1458284921', '0', '0');
INSERT INTO `sr_area` VALUES ('1487', '1480', '苍山县', '2', '-0-1374-1480-', 'C', '', '0', '1458284922', '0', '0');
INSERT INTO `sr_area` VALUES ('1488', '1480', '费县', '2', '-0-1374-1480-', 'F', '', '0', '1458284923', '0', '0');
INSERT INTO `sr_area` VALUES ('1489', '1480', '平邑县', '2', '-0-1374-1480-', 'P', '', '0', '1458284924', '0', '0');
INSERT INTO `sr_area` VALUES ('1490', '1480', '莒南县', '2', '-0-1374-1480-', '', '', '0', '1458284925', '0', '0');
INSERT INTO `sr_area` VALUES ('1491', '1480', '蒙阴县', '2', '-0-1374-1480-', 'M', '', '0', '1458284926', '0', '0');
INSERT INTO `sr_area` VALUES ('1492', '1480', '临沭县', '2', '-0-1374-1480-', 'L', '', '0', '1458284927', '0', '0');
INSERT INTO `sr_area` VALUES ('1493', '1374', '德州市', '1', '-0-1374-', 'D', '', '0', '1458284928', '0', '0');
INSERT INTO `sr_area` VALUES ('1494', '1493', '德城区', '2', '-0-1374-1493-', 'D', '', '0', '1458284929', '0', '0');
INSERT INTO `sr_area` VALUES ('1495', '1493', '陵县', '2', '-0-1374-1493-', 'L', '', '0', '1458284930', '0', '0');
INSERT INTO `sr_area` VALUES ('1496', '1493', '宁津县', '2', '-0-1374-1493-', 'N', '', '0', '1458284931', '0', '0');
INSERT INTO `sr_area` VALUES ('1497', '1493', '庆云县', '2', '-0-1374-1493-', 'Q', '', '0', '1458284932', '0', '0');
INSERT INTO `sr_area` VALUES ('1498', '1493', '临邑县', '2', '-0-1374-1493-', 'L', '', '0', '1458284933', '0', '0');
INSERT INTO `sr_area` VALUES ('1499', '1493', '齐河县', '2', '-0-1374-1493-', 'Q', '', '0', '1458284934', '0', '0');
INSERT INTO `sr_area` VALUES ('1500', '1493', '平原县', '2', '-0-1374-1493-', 'P', '', '0', '1458284935', '0', '0');
INSERT INTO `sr_area` VALUES ('1501', '1493', '夏津县', '2', '-0-1374-1493-', 'X', '', '0', '1458284936', '0', '0');
INSERT INTO `sr_area` VALUES ('1502', '1493', '武城县', '2', '-0-1374-1493-', 'W', '', '0', '1458284937', '0', '0');
INSERT INTO `sr_area` VALUES ('1503', '1493', '乐陵市', '2', '-0-1374-1493-', 'L', '', '0', '1458284938', '0', '0');
INSERT INTO `sr_area` VALUES ('1504', '1493', '禹城市', '2', '-0-1374-1493-', 'Y', '', '0', '1458284939', '0', '0');
INSERT INTO `sr_area` VALUES ('1505', '1374', '聊城市', '1', '-0-1374-', 'L', '', '0', '1458284940', '0', '0');
INSERT INTO `sr_area` VALUES ('1506', '1505', '东昌府区', '2', '-0-1374-1505-', 'D', '', '0', '1458284941', '0', '0');
INSERT INTO `sr_area` VALUES ('1507', '1505', '阳谷县', '2', '-0-1374-1505-', 'Y', '', '0', '1458284942', '0', '0');
INSERT INTO `sr_area` VALUES ('1508', '1505', '莘县', '2', '-0-1374-1505-', '', '', '0', '1458284943', '0', '0');
INSERT INTO `sr_area` VALUES ('1509', '1505', '茌平县', '2', '-0-1374-1505-', '', '', '0', '1458284944', '0', '0');
INSERT INTO `sr_area` VALUES ('1510', '1505', '东阿县', '2', '-0-1374-1505-', 'D', '', '0', '1458284945', '0', '0');
INSERT INTO `sr_area` VALUES ('1511', '1505', '冠县', '2', '-0-1374-1505-', 'G', '', '0', '1458284946', '0', '0');
INSERT INTO `sr_area` VALUES ('1512', '1505', '高唐县', '2', '-0-1374-1505-', 'G', '', '0', '1458284947', '0', '0');
INSERT INTO `sr_area` VALUES ('1513', '1505', '临清市', '2', '-0-1374-1505-', 'L', '', '0', '1458284948', '0', '0');
INSERT INTO `sr_area` VALUES ('1514', '1374', '滨州市', '1', '-0-1374-', 'B', '', '0', '1458284949', '0', '0');
INSERT INTO `sr_area` VALUES ('1515', '1514', '滨城区', '2', '-0-1374-1514-', 'B', '', '0', '1458284950', '0', '0');
INSERT INTO `sr_area` VALUES ('1516', '1514', '惠民县', '2', '-0-1374-1514-', 'H', '', '0', '1458284951', '0', '0');
INSERT INTO `sr_area` VALUES ('1517', '1514', '阳信县', '2', '-0-1374-1514-', 'Y', '', '0', '1458284952', '0', '0');
INSERT INTO `sr_area` VALUES ('1518', '1514', '无棣县', '2', '-0-1374-1514-', 'W', '', '0', '1458284953', '0', '0');
INSERT INTO `sr_area` VALUES ('1519', '1514', '沾化县', '2', '-0-1374-1514-', 'Z', '', '0', '1458284954', '0', '0');
INSERT INTO `sr_area` VALUES ('1520', '1514', '博兴县', '2', '-0-1374-1514-', 'B', '', '0', '1458284955', '0', '0');
INSERT INTO `sr_area` VALUES ('1521', '1514', '邹平县', '2', '-0-1374-1514-', 'Z', '', '0', '1458284956', '0', '0');
INSERT INTO `sr_area` VALUES ('1522', '1374', '菏泽市', '1', '-0-1374-', 'H', '', '0', '1458284957', '0', '0');
INSERT INTO `sr_area` VALUES ('1523', '1522', '牡丹区', '2', '-0-1374-1522-', 'M', '', '0', '1458284958', '0', '0');
INSERT INTO `sr_area` VALUES ('1524', '1522', '曹县', '2', '-0-1374-1522-', 'C', '', '0', '1458284959', '0', '0');
INSERT INTO `sr_area` VALUES ('1525', '1522', '单县', '2', '-0-1374-1522-', 'D', '', '0', '1458284960', '0', '0');
INSERT INTO `sr_area` VALUES ('1526', '1522', '成武县', '2', '-0-1374-1522-', 'C', '', '0', '1458284961', '0', '0');
INSERT INTO `sr_area` VALUES ('1527', '1522', '巨野县', '2', '-0-1374-1522-', 'J', '', '0', '1458284962', '0', '0');
INSERT INTO `sr_area` VALUES ('1528', '1522', '郓城县', '2', '-0-1374-1522-', '', '', '0', '1458284963', '0', '0');
INSERT INTO `sr_area` VALUES ('1529', '1522', '鄄城县', '2', '-0-1374-1522-', '', '', '0', '1458284964', '0', '0');
INSERT INTO `sr_area` VALUES ('1530', '1522', '定陶县', '2', '-0-1374-1522-', 'D', '', '0', '1458284965', '0', '0');
INSERT INTO `sr_area` VALUES ('1531', '1522', '东明县', '2', '-0-1374-1522-', 'D', '', '0', '1458284966', '0', '0');
INSERT INTO `sr_area` VALUES ('1532', '0', '河南', '0', '-0-', 'H', '华中', '0', '1458284967', '0', '0');
INSERT INTO `sr_area` VALUES ('1533', '1532', '郑州市', '1', '-0-1532-', 'Z', '', '0', '1458284968', '0', '0');
INSERT INTO `sr_area` VALUES ('1534', '1533', '中原区', '2', '-0-1532-1533-', 'Z', '', '0', '1458284969', '0', '0');
INSERT INTO `sr_area` VALUES ('1535', '1533', '二七区', '2', '-0-1532-1533-', 'E', '', '0', '1458284970', '0', '0');
INSERT INTO `sr_area` VALUES ('1536', '1533', '管城回族区', '2', '-0-1532-1533-', 'G', '', '0', '1458284971', '0', '0');
INSERT INTO `sr_area` VALUES ('1537', '1533', '金水区', '2', '-0-1532-1533-', 'J', '', '0', '1458284972', '0', '0');
INSERT INTO `sr_area` VALUES ('1538', '1533', '上街区', '2', '-0-1532-1533-', 'S', '', '0', '1458284973', '0', '0');
INSERT INTO `sr_area` VALUES ('1539', '1533', '惠济区', '2', '-0-1532-1533-', 'H', '', '0', '1458284974', '0', '0');
INSERT INTO `sr_area` VALUES ('1540', '1533', '中牟县', '2', '-0-1532-1533-', 'Z', '', '0', '1458284975', '0', '0');
INSERT INTO `sr_area` VALUES ('1541', '1533', '巩义市', '2', '-0-1532-1533-', 'G', '', '0', '1458284976', '0', '0');
INSERT INTO `sr_area` VALUES ('1542', '1533', '荥阳市', '2', '-0-1532-1533-', '', '', '0', '1458284977', '0', '0');
INSERT INTO `sr_area` VALUES ('1543', '1533', '新密市', '2', '-0-1532-1533-', 'X', '', '0', '1458284978', '0', '0');
INSERT INTO `sr_area` VALUES ('1544', '1533', '新郑市', '2', '-0-1532-1533-', 'X', '', '0', '1458284979', '0', '0');
INSERT INTO `sr_area` VALUES ('1545', '1533', '登封市', '2', '-0-1532-1533-', 'D', '', '0', '1458284980', '0', '0');
INSERT INTO `sr_area` VALUES ('1546', '1532', '开封市', '1', '-0-1532-', 'K', '', '0', '1458284981', '0', '0');
INSERT INTO `sr_area` VALUES ('1547', '1546', '龙亭区', '2', '-0-1532-1546-', 'L', '', '0', '1458284982', '0', '0');
INSERT INTO `sr_area` VALUES ('1548', '1546', '顺河回族区', '2', '-0-1532-1546-', 'S', '', '0', '1458284983', '0', '0');
INSERT INTO `sr_area` VALUES ('1549', '1546', '鼓楼区', '2', '-0-1532-1546-', 'G', '', '0', '1458284984', '0', '0');
INSERT INTO `sr_area` VALUES ('1550', '1546', '禹王台区', '2', '-0-1532-1546-', 'Y', '', '0', '1458284985', '0', '0');
INSERT INTO `sr_area` VALUES ('1551', '1546', '金明区', '2', '-0-1532-1546-', 'J', '', '0', '1458284986', '0', '0');
INSERT INTO `sr_area` VALUES ('1552', '1546', '杞县', '2', '-0-1532-1546-', '', '', '0', '1458284987', '0', '0');
INSERT INTO `sr_area` VALUES ('1553', '1546', '通许县', '2', '-0-1532-1546-', 'T', '', '0', '1458284988', '0', '0');
INSERT INTO `sr_area` VALUES ('1554', '1546', '尉氏县', '2', '-0-1532-1546-', 'W', '', '0', '1458284989', '0', '0');
INSERT INTO `sr_area` VALUES ('1555', '1546', '开封县', '2', '-0-1532-1546-', 'K', '', '0', '1458284990', '0', '0');
INSERT INTO `sr_area` VALUES ('1556', '1546', '兰考县', '2', '-0-1532-1546-', 'L', '', '0', '1458284991', '0', '0');
INSERT INTO `sr_area` VALUES ('1557', '1532', '洛阳市', '1', '-0-1532-', 'L', '', '0', '1458284992', '0', '0');
INSERT INTO `sr_area` VALUES ('1558', '1557', '老城区', '2', '-0-1532-1557-', 'L', '', '0', '1458284993', '0', '0');
INSERT INTO `sr_area` VALUES ('1559', '1557', '西工区', '2', '-0-1532-1557-', 'X', '', '0', '1458284994', '0', '0');
INSERT INTO `sr_area` VALUES ('1560', '1557', '瀍河回族区', '2', '-0-1532-1557-', '', '', '0', '1458284995', '0', '0');
INSERT INTO `sr_area` VALUES ('1561', '1557', '涧西区', '2', '-0-1532-1557-', 'J', '', '0', '1458284996', '0', '0');
INSERT INTO `sr_area` VALUES ('1562', '1557', '吉利区', '2', '-0-1532-1557-', 'J', '', '0', '1458284997', '0', '0');
INSERT INTO `sr_area` VALUES ('1563', '1557', '洛龙区', '2', '-0-1532-1557-', 'L', '', '0', '1458284998', '0', '0');
INSERT INTO `sr_area` VALUES ('1564', '1557', '孟津县', '2', '-0-1532-1557-', 'M', '', '0', '1458284999', '0', '0');
INSERT INTO `sr_area` VALUES ('1565', '1557', '新安县', '2', '-0-1532-1557-', 'X', '', '0', '1458285000', '0', '0');
INSERT INTO `sr_area` VALUES ('1566', '1557', '栾川县', '2', '-0-1532-1557-', '', '', '0', '1458285001', '0', '0');
INSERT INTO `sr_area` VALUES ('1567', '1557', '嵩县', '2', '-0-1532-1557-', '', '', '0', '1458285002', '0', '0');
INSERT INTO `sr_area` VALUES ('1568', '1557', '汝阳县', '2', '-0-1532-1557-', 'R', '', '0', '1458285003', '0', '0');
INSERT INTO `sr_area` VALUES ('1569', '1557', '宜阳县', '2', '-0-1532-1557-', 'Y', '', '0', '1458285004', '0', '0');
INSERT INTO `sr_area` VALUES ('1570', '1557', '洛宁县', '2', '-0-1532-1557-', 'L', '', '0', '1458285005', '0', '0');
INSERT INTO `sr_area` VALUES ('1571', '1557', '伊川县', '2', '-0-1532-1557-', 'Y', '', '0', '1458285006', '0', '0');
INSERT INTO `sr_area` VALUES ('1572', '1557', '偃师市', '2', '-0-1532-1557-', '', '', '0', '1458285007', '0', '0');
INSERT INTO `sr_area` VALUES ('1573', '1532', '平顶山市', '1', '-0-1532-', 'P', '', '0', '1458285008', '0', '0');
INSERT INTO `sr_area` VALUES ('1574', '1573', '新华区', '2', '-0-1532-1573-', 'X', '', '0', '1458285009', '0', '0');
INSERT INTO `sr_area` VALUES ('1575', '1573', '卫东区', '2', '-0-1532-1573-', 'W', '', '0', '1458285010', '0', '0');
INSERT INTO `sr_area` VALUES ('1576', '1573', '石龙区', '2', '-0-1532-1573-', 'S', '', '0', '1458285011', '0', '0');
INSERT INTO `sr_area` VALUES ('1577', '1573', '湛河区', '2', '-0-1532-1573-', 'Z', '', '0', '1458285012', '0', '0');
INSERT INTO `sr_area` VALUES ('1578', '1573', '宝丰县', '2', '-0-1532-1573-', 'B', '', '0', '1458285013', '0', '0');
INSERT INTO `sr_area` VALUES ('1579', '1573', '叶县', '2', '-0-1532-1573-', 'Y', '', '0', '1458285014', '0', '0');
INSERT INTO `sr_area` VALUES ('1580', '1573', '鲁山县', '2', '-0-1532-1573-', 'L', '', '0', '1458285015', '0', '0');
INSERT INTO `sr_area` VALUES ('1581', '1573', '郏县', '2', '-0-1532-1573-', '', '', '0', '1458285016', '0', '0');
INSERT INTO `sr_area` VALUES ('1582', '1573', '舞钢市', '2', '-0-1532-1573-', 'W', '', '0', '1458285017', '0', '0');
INSERT INTO `sr_area` VALUES ('1583', '1573', '汝州市', '2', '-0-1532-1573-', 'R', '', '0', '1458285018', '0', '0');
INSERT INTO `sr_area` VALUES ('1584', '1532', '安阳市', '1', '-0-1532-', 'A', '', '0', '1458285019', '0', '0');
INSERT INTO `sr_area` VALUES ('1585', '1584', '文峰区', '2', '-0-1532-1584-', 'W', '', '0', '1458285020', '0', '0');
INSERT INTO `sr_area` VALUES ('1586', '1584', '北关区', '2', '-0-1532-1584-', 'B', '', '0', '1458285021', '0', '0');
INSERT INTO `sr_area` VALUES ('1587', '1584', '殷都区', '2', '-0-1532-1584-', 'Y', '', '0', '1458285022', '0', '0');
INSERT INTO `sr_area` VALUES ('1588', '1584', '龙安区', '2', '-0-1532-1584-', 'L', '', '0', '1458285023', '0', '0');
INSERT INTO `sr_area` VALUES ('1589', '1584', '安阳县', '2', '-0-1532-1584-', 'A', '', '0', '1458285024', '0', '0');
INSERT INTO `sr_area` VALUES ('1590', '1584', '汤阴县', '2', '-0-1532-1584-', 'T', '', '0', '1458285025', '0', '0');
INSERT INTO `sr_area` VALUES ('1591', '1584', '滑县', '2', '-0-1532-1584-', 'H', '', '0', '1458285026', '0', '0');
INSERT INTO `sr_area` VALUES ('1592', '1584', '内黄县', '2', '-0-1532-1584-', 'N', '', '0', '1458285027', '0', '0');
INSERT INTO `sr_area` VALUES ('1593', '1584', '林州市', '2', '-0-1532-1584-', 'L', '', '0', '1458285028', '0', '0');
INSERT INTO `sr_area` VALUES ('1594', '1532', '鹤壁市', '1', '-0-1532-', 'H', '', '0', '1458285029', '0', '0');
INSERT INTO `sr_area` VALUES ('1595', '1594', '鹤山区', '2', '-0-1532-1594-', 'H', '', '0', '1458285030', '0', '0');
INSERT INTO `sr_area` VALUES ('1596', '1594', '山城区', '2', '-0-1532-1594-', 'S', '', '0', '1458285031', '0', '0');
INSERT INTO `sr_area` VALUES ('1597', '1594', '淇滨区', '2', '-0-1532-1594-', '', '', '0', '1458285032', '0', '0');
INSERT INTO `sr_area` VALUES ('1598', '1594', '浚县', '2', '-0-1532-1594-', 'J', '', '0', '1458285033', '0', '0');
INSERT INTO `sr_area` VALUES ('1599', '1594', '淇县', '2', '-0-1532-1594-', '', '', '0', '1458285034', '0', '0');
INSERT INTO `sr_area` VALUES ('1600', '1532', '新乡市', '1', '-0-1532-', 'X', '', '0', '1458285035', '0', '0');
INSERT INTO `sr_area` VALUES ('1601', '1600', '红旗区', '2', '-0-1532-1600-', 'H', '', '0', '1458285036', '0', '0');
INSERT INTO `sr_area` VALUES ('1602', '1600', '卫滨区', '2', '-0-1532-1600-', 'W', '', '0', '1458285037', '0', '0');
INSERT INTO `sr_area` VALUES ('1603', '1600', '凤泉区', '2', '-0-1532-1600-', 'F', '', '0', '1458285038', '0', '0');
INSERT INTO `sr_area` VALUES ('1604', '1600', '牧野区', '2', '-0-1532-1600-', 'M', '', '0', '1458285039', '0', '0');
INSERT INTO `sr_area` VALUES ('1605', '1600', '新乡县', '2', '-0-1532-1600-', 'X', '', '0', '1458285040', '0', '0');
INSERT INTO `sr_area` VALUES ('1606', '1600', '获嘉县', '2', '-0-1532-1600-', 'H', '', '0', '1458285041', '0', '0');
INSERT INTO `sr_area` VALUES ('1607', '1600', '原阳县', '2', '-0-1532-1600-', 'Y', '', '0', '1458285042', '0', '0');
INSERT INTO `sr_area` VALUES ('1608', '1600', '延津县', '2', '-0-1532-1600-', 'Y', '', '0', '1458285043', '0', '0');
INSERT INTO `sr_area` VALUES ('1609', '1600', '封丘县', '2', '-0-1532-1600-', 'F', '', '0', '1458285044', '0', '0');
INSERT INTO `sr_area` VALUES ('1610', '1600', '长垣县', '2', '-0-1532-1600-', 'C', '', '0', '1458285045', '0', '0');
INSERT INTO `sr_area` VALUES ('1611', '1600', '卫辉市', '2', '-0-1532-1600-', 'W', '', '0', '1458285046', '0', '0');
INSERT INTO `sr_area` VALUES ('1612', '1600', '辉县市', '2', '-0-1532-1600-', 'H', '', '0', '1458285047', '0', '0');
INSERT INTO `sr_area` VALUES ('1613', '1532', '焦作市', '1', '-0-1532-', 'J', '', '0', '1458285048', '0', '0');
INSERT INTO `sr_area` VALUES ('1614', '1613', '解放区', '2', '-0-1532-1613-', 'J', '', '0', '1458285049', '0', '0');
INSERT INTO `sr_area` VALUES ('1615', '1613', '中站区', '2', '-0-1532-1613-', 'Z', '', '0', '1458285050', '0', '0');
INSERT INTO `sr_area` VALUES ('1616', '1613', '马村区', '2', '-0-1532-1613-', 'M', '', '0', '1458285051', '0', '0');
INSERT INTO `sr_area` VALUES ('1617', '1613', '山阳区', '2', '-0-1532-1613-', 'S', '', '0', '1458285052', '0', '0');
INSERT INTO `sr_area` VALUES ('1618', '1613', '修武县', '2', '-0-1532-1613-', 'X', '', '0', '1458285053', '0', '0');
INSERT INTO `sr_area` VALUES ('1619', '1613', '博爱县', '2', '-0-1532-1613-', 'B', '', '0', '1458285054', '0', '0');
INSERT INTO `sr_area` VALUES ('1620', '1613', '武陟县', '2', '-0-1532-1613-', 'W', '', '0', '1458285055', '0', '0');
INSERT INTO `sr_area` VALUES ('1621', '1613', '温县', '2', '-0-1532-1613-', 'W', '', '0', '1458285056', '0', '0');
INSERT INTO `sr_area` VALUES ('1622', '1613', '济源市', '2', '-0-1532-1613-', 'J', '', '0', '1458285057', '0', '0');
INSERT INTO `sr_area` VALUES ('1623', '1613', '沁阳市', '2', '-0-1532-1613-', 'Q', '', '0', '1458285058', '0', '0');
INSERT INTO `sr_area` VALUES ('1624', '1613', '孟州市', '2', '-0-1532-1613-', 'M', '', '0', '1458285059', '0', '0');
INSERT INTO `sr_area` VALUES ('1625', '1532', '濮阳市', '1', '-0-1532-', 'P', '', '0', '1458285060', '0', '0');
INSERT INTO `sr_area` VALUES ('1626', '1625', '华龙区', '2', '-0-1532-1625-', 'H', '', '0', '1458285061', '0', '0');
INSERT INTO `sr_area` VALUES ('1627', '1625', '清丰县', '2', '-0-1532-1625-', 'Q', '', '0', '1458285062', '0', '0');
INSERT INTO `sr_area` VALUES ('1628', '1625', '南乐县', '2', '-0-1532-1625-', 'N', '', '0', '1458285063', '0', '0');
INSERT INTO `sr_area` VALUES ('1629', '1625', '范县', '2', '-0-1532-1625-', 'F', '', '0', '1458285064', '0', '0');
INSERT INTO `sr_area` VALUES ('1630', '1625', '台前县', '2', '-0-1532-1625-', 'T', '', '0', '1458285065', '0', '0');
INSERT INTO `sr_area` VALUES ('1631', '1625', '濮阳县', '2', '-0-1532-1625-', 'P', '', '0', '1458285066', '0', '0');
INSERT INTO `sr_area` VALUES ('1632', '1532', '许昌市', '1', '-0-1532-', 'X', '', '0', '1458285067', '0', '0');
INSERT INTO `sr_area` VALUES ('1633', '1632', '魏都区', '2', '-0-1532-1632-', 'W', '', '0', '1458285068', '0', '0');
INSERT INTO `sr_area` VALUES ('1634', '1632', '许昌县', '2', '-0-1532-1632-', 'X', '', '0', '1458285069', '0', '0');
INSERT INTO `sr_area` VALUES ('1635', '1632', '鄢陵县', '2', '-0-1532-1632-', '', '', '0', '1458285070', '0', '0');
INSERT INTO `sr_area` VALUES ('1636', '1632', '襄城县', '2', '-0-1532-1632-', 'X', '', '0', '1458285071', '0', '0');
INSERT INTO `sr_area` VALUES ('1637', '1632', '禹州市', '2', '-0-1532-1632-', 'Y', '', '0', '1458285072', '0', '0');
INSERT INTO `sr_area` VALUES ('1638', '1632', '长葛市', '2', '-0-1532-1632-', 'C', '', '0', '1458285073', '0', '0');
INSERT INTO `sr_area` VALUES ('1639', '1532', '漯河市', '1', '-0-1532-', 'L', '', '0', '1458285074', '0', '0');
INSERT INTO `sr_area` VALUES ('1640', '1639', '源汇区', '2', '-0-1532-1639-', 'Y', '', '0', '1458285075', '0', '0');
INSERT INTO `sr_area` VALUES ('1641', '1639', '郾城区', '2', '-0-1532-1639-', '', '', '0', '1458285076', '0', '0');
INSERT INTO `sr_area` VALUES ('1642', '1639', '召陵区', '2', '-0-1532-1639-', 'Z', '', '0', '1458285077', '0', '0');
INSERT INTO `sr_area` VALUES ('1643', '1639', '舞阳县', '2', '-0-1532-1639-', 'W', '', '0', '1458285078', '0', '0');
INSERT INTO `sr_area` VALUES ('1644', '1639', '临颍县', '2', '-0-1532-1639-', 'L', '', '0', '1458285079', '0', '0');
INSERT INTO `sr_area` VALUES ('1645', '1532', '三门峡市', '1', '-0-1532-', 'S', '', '0', '1458285080', '0', '0');
INSERT INTO `sr_area` VALUES ('1646', '1645', '湖滨区', '2', '-0-1532-1645-', 'H', '', '0', '1458285081', '0', '0');
INSERT INTO `sr_area` VALUES ('1647', '1645', '渑池县', '2', '-0-1532-1645-', '', '', '0', '1458285082', '0', '0');
INSERT INTO `sr_area` VALUES ('1648', '1645', '陕县', '2', '-0-1532-1645-', 'S', '', '0', '1458285083', '0', '0');
INSERT INTO `sr_area` VALUES ('1649', '1645', '卢氏县', '2', '-0-1532-1645-', 'L', '', '0', '1458285084', '0', '0');
INSERT INTO `sr_area` VALUES ('1650', '1645', '义马市', '2', '-0-1532-1645-', 'Y', '', '0', '1458285085', '0', '0');
INSERT INTO `sr_area` VALUES ('1651', '1645', '灵宝市', '2', '-0-1532-1645-', 'L', '', '0', '1458285086', '0', '0');
INSERT INTO `sr_area` VALUES ('1652', '1532', '南阳市', '1', '-0-1532-', 'N', '', '0', '1458285087', '0', '0');
INSERT INTO `sr_area` VALUES ('1653', '1652', '宛城区', '2', '-0-1532-1652-', 'W', '', '0', '1458285088', '0', '0');
INSERT INTO `sr_area` VALUES ('1654', '1652', '卧龙区', '2', '-0-1532-1652-', 'W', '', '0', '1458285089', '0', '0');
INSERT INTO `sr_area` VALUES ('1655', '1652', '南召县', '2', '-0-1532-1652-', 'N', '', '0', '1458285090', '0', '0');
INSERT INTO `sr_area` VALUES ('1656', '1652', '方城县', '2', '-0-1532-1652-', 'F', '', '0', '1458285091', '0', '0');
INSERT INTO `sr_area` VALUES ('1657', '1652', '西峡县', '2', '-0-1532-1652-', 'X', '', '0', '1458285092', '0', '0');
INSERT INTO `sr_area` VALUES ('1658', '1652', '镇平县', '2', '-0-1532-1652-', 'Z', '', '0', '1458285093', '0', '0');
INSERT INTO `sr_area` VALUES ('1659', '1652', '内乡县', '2', '-0-1532-1652-', 'N', '', '0', '1458285094', '0', '0');
INSERT INTO `sr_area` VALUES ('1660', '1652', '淅川县', '2', '-0-1532-1652-', '', '', '0', '1458285095', '0', '0');
INSERT INTO `sr_area` VALUES ('1661', '1652', '社旗县', '2', '-0-1532-1652-', 'S', '', '0', '1458285096', '0', '0');
INSERT INTO `sr_area` VALUES ('1662', '1652', '唐河县', '2', '-0-1532-1652-', 'T', '', '0', '1458285097', '0', '0');
INSERT INTO `sr_area` VALUES ('1663', '1652', '新野县', '2', '-0-1532-1652-', 'X', '', '0', '1458285098', '0', '0');
INSERT INTO `sr_area` VALUES ('1664', '1652', '桐柏县', '2', '-0-1532-1652-', 'T', '', '0', '1458285099', '0', '0');
INSERT INTO `sr_area` VALUES ('1665', '1652', '邓州市', '2', '-0-1532-1652-', 'D', '', '0', '1458285100', '0', '0');
INSERT INTO `sr_area` VALUES ('1666', '1532', '商丘市', '1', '-0-1532-', 'S', '', '0', '1458285101', '0', '0');
INSERT INTO `sr_area` VALUES ('1667', '1666', '梁园区', '2', '-0-1532-1666-', 'L', '', '0', '1458285102', '0', '0');
INSERT INTO `sr_area` VALUES ('1668', '1666', '睢阳区', '2', '-0-1532-1666-', '', '', '0', '1458285103', '0', '0');
INSERT INTO `sr_area` VALUES ('1669', '1666', '民权县', '2', '-0-1532-1666-', 'M', '', '0', '1458285104', '0', '0');
INSERT INTO `sr_area` VALUES ('1670', '1666', '睢县', '2', '-0-1532-1666-', '', '', '0', '1458285105', '0', '0');
INSERT INTO `sr_area` VALUES ('1671', '1666', '宁陵县', '2', '-0-1532-1666-', 'N', '', '0', '1458285106', '0', '0');
INSERT INTO `sr_area` VALUES ('1672', '1666', '柘城县', '2', '-0-1532-1666-', '', '', '0', '1458285107', '0', '0');
INSERT INTO `sr_area` VALUES ('1673', '1666', '虞城县', '2', '-0-1532-1666-', 'Y', '', '0', '1458285108', '0', '0');
INSERT INTO `sr_area` VALUES ('1674', '1666', '夏邑县', '2', '-0-1532-1666-', 'X', '', '0', '1458285109', '0', '0');
INSERT INTO `sr_area` VALUES ('1675', '1666', '永城市', '2', '-0-1532-1666-', 'Y', '', '0', '1458285110', '0', '0');
INSERT INTO `sr_area` VALUES ('1676', '1532', '信阳市', '1', '-0-1532-', 'X', '', '0', '1458285111', '0', '0');
INSERT INTO `sr_area` VALUES ('1677', '1676', '浉河区', '2', '-0-1532-1676-', '', '', '0', '1458285112', '0', '0');
INSERT INTO `sr_area` VALUES ('1678', '1676', '平桥区', '2', '-0-1532-1676-', 'P', '', '0', '1458285113', '0', '0');
INSERT INTO `sr_area` VALUES ('1679', '1676', '罗山县', '2', '-0-1532-1676-', 'L', '', '0', '1458285114', '0', '0');
INSERT INTO `sr_area` VALUES ('1680', '1676', '光山县', '2', '-0-1532-1676-', 'G', '', '0', '1458285115', '0', '0');
INSERT INTO `sr_area` VALUES ('1681', '1676', '新县', '2', '-0-1532-1676-', 'X', '', '0', '1458285116', '0', '0');
INSERT INTO `sr_area` VALUES ('1682', '1676', '商城县', '2', '-0-1532-1676-', 'S', '', '0', '1458285117', '0', '0');
INSERT INTO `sr_area` VALUES ('1683', '1676', '固始县', '2', '-0-1532-1676-', 'G', '', '0', '1458285118', '0', '0');
INSERT INTO `sr_area` VALUES ('1684', '1676', '潢川县', '2', '-0-1532-1676-', '', '', '0', '1458285119', '0', '0');
INSERT INTO `sr_area` VALUES ('1685', '1676', '淮滨县', '2', '-0-1532-1676-', 'H', '', '0', '1458285120', '0', '0');
INSERT INTO `sr_area` VALUES ('1686', '1676', '息县', '2', '-0-1532-1676-', 'X', '', '0', '1458285121', '0', '0');
INSERT INTO `sr_area` VALUES ('1687', '1532', '周口市', '1', '-0-1532-', 'Z', '', '0', '1458285122', '0', '0');
INSERT INTO `sr_area` VALUES ('1688', '1687', '川汇区', '2', '-0-1532-1687-', 'C', '', '0', '1458285123', '0', '0');
INSERT INTO `sr_area` VALUES ('1689', '1687', '扶沟县', '2', '-0-1532-1687-', 'F', '', '0', '1458285124', '0', '0');
INSERT INTO `sr_area` VALUES ('1690', '1687', '西华县', '2', '-0-1532-1687-', 'X', '', '0', '1458285125', '0', '0');
INSERT INTO `sr_area` VALUES ('1691', '1687', '商水县', '2', '-0-1532-1687-', 'S', '', '0', '1458285126', '0', '0');
INSERT INTO `sr_area` VALUES ('1692', '1687', '沈丘县', '2', '-0-1532-1687-', 'S', '', '0', '1458285127', '0', '0');
INSERT INTO `sr_area` VALUES ('1693', '1687', '郸城县', '2', '-0-1532-1687-', 'D', '', '0', '1458285128', '0', '0');
INSERT INTO `sr_area` VALUES ('1694', '1687', '淮阳县', '2', '-0-1532-1687-', 'H', '', '0', '1458285129', '0', '0');
INSERT INTO `sr_area` VALUES ('1695', '1687', '太康县', '2', '-0-1532-1687-', 'T', '', '0', '1458285130', '0', '0');
INSERT INTO `sr_area` VALUES ('1696', '1687', '鹿邑县', '2', '-0-1532-1687-', 'L', '', '0', '1458285131', '0', '0');
INSERT INTO `sr_area` VALUES ('1697', '1687', '项城市', '2', '-0-1532-1687-', 'X', '', '0', '1458285132', '0', '0');
INSERT INTO `sr_area` VALUES ('1698', '1532', '驻马店市', '1', '-0-1532-', 'Z', '', '0', '1458285133', '0', '0');
INSERT INTO `sr_area` VALUES ('1699', '1698', '驿城区', '2', '-0-1532-1698-', '', '', '0', '1458285134', '0', '0');
INSERT INTO `sr_area` VALUES ('1700', '1698', '西平县', '2', '-0-1532-1698-', 'X', '', '0', '1458285135', '0', '0');
INSERT INTO `sr_area` VALUES ('1701', '1698', '上蔡县', '2', '-0-1532-1698-', 'S', '', '0', '1458285136', '0', '0');
INSERT INTO `sr_area` VALUES ('1702', '1698', '平舆县', '2', '-0-1532-1698-', 'P', '', '0', '1458285137', '0', '0');
INSERT INTO `sr_area` VALUES ('1703', '1698', '正阳县', '2', '-0-1532-1698-', 'Z', '', '0', '1458285138', '0', '0');
INSERT INTO `sr_area` VALUES ('1704', '1698', '确山县', '2', '-0-1532-1698-', 'Q', '', '0', '1458285139', '0', '0');
INSERT INTO `sr_area` VALUES ('1705', '1698', '泌阳县', '2', '-0-1532-1698-', 'M', '', '0', '1458285140', '0', '0');
INSERT INTO `sr_area` VALUES ('1706', '1698', '汝南县', '2', '-0-1532-1698-', 'R', '', '0', '1458285141', '0', '0');
INSERT INTO `sr_area` VALUES ('1707', '1698', '遂平县', '2', '-0-1532-1698-', 'S', '', '0', '1458285142', '0', '0');
INSERT INTO `sr_area` VALUES ('1708', '1698', '新蔡县', '2', '-0-1532-1698-', 'X', '', '0', '1458285143', '0', '0');
INSERT INTO `sr_area` VALUES ('1709', '0', '湖北', '0', '-0-', 'H', '华中', '0', '1458285144', '0', '0');
INSERT INTO `sr_area` VALUES ('1710', '1709', '武汉市', '1', '-0-1709-', 'W', '', '0', '1458285145', '0', '0');
INSERT INTO `sr_area` VALUES ('1711', '1710', '江岸区', '2', '-0-1709-1710-', 'J', '', '0', '1458285146', '0', '0');
INSERT INTO `sr_area` VALUES ('1712', '1710', '江汉区', '2', '-0-1709-1710-', 'J', '', '0', '1458285147', '0', '0');
INSERT INTO `sr_area` VALUES ('1713', '1710', '硚口区', '2', '-0-1709-1710-', 'C', '', '0', '1458285148', '0', '0');
INSERT INTO `sr_area` VALUES ('1714', '1710', '汉阳区', '2', '-0-1709-1710-', 'H', '', '0', '1458285149', '0', '0');
INSERT INTO `sr_area` VALUES ('1715', '1710', '武昌区', '2', '-0-1709-1710-', 'W', '', '0', '1458285150', '0', '0');
INSERT INTO `sr_area` VALUES ('1716', '1710', '青山区', '2', '-0-1709-1710-', 'Q', '', '0', '1458285151', '0', '0');
INSERT INTO `sr_area` VALUES ('1717', '1710', '洪山区', '2', '-0-1709-1710-', 'H', '', '0', '1458285152', '0', '0');
INSERT INTO `sr_area` VALUES ('1718', '1710', '东西湖区', '2', '-0-1709-1710-', 'D', '', '0', '1458285153', '0', '0');
INSERT INTO `sr_area` VALUES ('1719', '1710', '汉南区', '2', '-0-1709-1710-', 'H', '', '0', '1458285154', '0', '0');
INSERT INTO `sr_area` VALUES ('1720', '1710', '蔡甸区', '2', '-0-1709-1710-', 'C', '', '0', '1458285155', '0', '0');
INSERT INTO `sr_area` VALUES ('1721', '1710', '江夏区', '2', '-0-1709-1710-', 'J', '', '0', '1458285156', '0', '0');
INSERT INTO `sr_area` VALUES ('1722', '1710', '黄陂区', '2', '-0-1709-1710-', 'H', '', '0', '1458285157', '0', '0');
INSERT INTO `sr_area` VALUES ('1723', '1710', '新洲区', '2', '-0-1709-1710-', 'X', '', '0', '1458285158', '0', '0');
INSERT INTO `sr_area` VALUES ('1724', '1709', '黄石市', '1', '-0-1709-', 'H', '', '0', '1458285159', '0', '0');
INSERT INTO `sr_area` VALUES ('1725', '1724', '黄石港区', '2', '-0-1709-1724-', 'H', '', '0', '1458285160', '0', '0');
INSERT INTO `sr_area` VALUES ('1726', '1724', '西塞山区', '2', '-0-1709-1724-', 'X', '', '0', '1458285161', '0', '0');
INSERT INTO `sr_area` VALUES ('1727', '1724', '下陆区', '2', '-0-1709-1724-', 'X', '', '0', '1458285162', '0', '0');
INSERT INTO `sr_area` VALUES ('1728', '1724', '铁山区', '2', '-0-1709-1724-', 'T', '', '0', '1458285163', '0', '0');
INSERT INTO `sr_area` VALUES ('1729', '1724', '阳新县', '2', '-0-1709-1724-', 'Y', '', '0', '1458285164', '0', '0');
INSERT INTO `sr_area` VALUES ('1730', '1724', '大冶市', '2', '-0-1709-1724-', 'D', '', '0', '1458285165', '0', '0');
INSERT INTO `sr_area` VALUES ('1731', '1709', '十堰市', '1', '-0-1709-', 'S', '', '0', '1458285166', '0', '0');
INSERT INTO `sr_area` VALUES ('1732', '1731', '茅箭区', '2', '-0-1709-1731-', 'M', '', '0', '1458285167', '0', '0');
INSERT INTO `sr_area` VALUES ('1733', '1731', '张湾区', '2', '-0-1709-1731-', 'Z', '', '0', '1458285168', '0', '0');
INSERT INTO `sr_area` VALUES ('1734', '1731', '郧县', '2', '-0-1709-1731-', 'Y', '', '0', '1458285169', '0', '0');
INSERT INTO `sr_area` VALUES ('1735', '1731', '郧西县', '2', '-0-1709-1731-', 'Y', '', '0', '1458285170', '0', '0');
INSERT INTO `sr_area` VALUES ('1736', '1731', '竹山县', '2', '-0-1709-1731-', 'Z', '', '0', '1458285171', '0', '0');
INSERT INTO `sr_area` VALUES ('1737', '1731', '竹溪县', '2', '-0-1709-1731-', 'Z', '', '0', '1458285172', '0', '0');
INSERT INTO `sr_area` VALUES ('1738', '1731', '房县', '2', '-0-1709-1731-', 'F', '', '0', '1458285173', '0', '0');
INSERT INTO `sr_area` VALUES ('1739', '1731', '丹江口市', '2', '-0-1709-1731-', 'D', '', '0', '1458285174', '0', '0');
INSERT INTO `sr_area` VALUES ('1740', '1709', '宜昌市', '1', '-0-1709-', 'Y', '', '0', '1458285175', '0', '0');
INSERT INTO `sr_area` VALUES ('1741', '1740', '西陵区', '2', '-0-1709-1740-', 'X', '', '0', '1458285176', '0', '0');
INSERT INTO `sr_area` VALUES ('1742', '1740', '伍家岗区', '2', '-0-1709-1740-', 'W', '', '0', '1458285177', '0', '0');
INSERT INTO `sr_area` VALUES ('1743', '1740', '点军区', '2', '-0-1709-1740-', 'D', '', '0', '1458285178', '0', '0');
INSERT INTO `sr_area` VALUES ('1744', '1740', '猇亭区', '2', '-0-1709-1740-', '', '', '0', '1458285179', '0', '0');
INSERT INTO `sr_area` VALUES ('1745', '1740', '夷陵区', '2', '-0-1709-1740-', 'Y', '', '0', '1458285180', '0', '0');
INSERT INTO `sr_area` VALUES ('1746', '1740', '远安县', '2', '-0-1709-1740-', 'Y', '', '0', '1458285181', '0', '0');
INSERT INTO `sr_area` VALUES ('1747', '1740', '兴山县', '2', '-0-1709-1740-', 'X', '', '0', '1458285182', '0', '0');
INSERT INTO `sr_area` VALUES ('1748', '1740', '秭归县', '2', '-0-1709-1740-', '', '', '0', '1458285183', '0', '0');
INSERT INTO `sr_area` VALUES ('1749', '1740', '长阳土家族自治县', '2', '-0-1709-1740-', 'C', '', '0', '1458285184', '0', '0');
INSERT INTO `sr_area` VALUES ('1750', '1740', '五峰土家族自治县', '2', '-0-1709-1740-', 'W', '', '0', '1458285185', '0', '0');
INSERT INTO `sr_area` VALUES ('1751', '1740', '宜都市', '2', '-0-1709-1740-', 'Y', '', '0', '1458285186', '0', '0');
INSERT INTO `sr_area` VALUES ('1752', '1740', '当阳市', '2', '-0-1709-1740-', 'D', '', '0', '1458285187', '0', '0');
INSERT INTO `sr_area` VALUES ('1753', '1740', '枝江市', '2', '-0-1709-1740-', 'Z', '', '0', '1458285188', '0', '0');
INSERT INTO `sr_area` VALUES ('1754', '1709', '襄樊市', '1', '-0-1709-', 'X', '', '0', '1458285189', '0', '0');
INSERT INTO `sr_area` VALUES ('1755', '1754', '襄城区', '2', '-0-1709-1754-', 'X', '', '0', '1458285190', '0', '0');
INSERT INTO `sr_area` VALUES ('1756', '1754', '樊城区', '2', '-0-1709-1754-', 'F', '', '0', '1458285191', '0', '0');
INSERT INTO `sr_area` VALUES ('1757', '1754', '襄阳区', '2', '-0-1709-1754-', 'X', '', '0', '1458285192', '0', '0');
INSERT INTO `sr_area` VALUES ('1758', '1754', '南漳县', '2', '-0-1709-1754-', 'N', '', '0', '1458285193', '0', '0');
INSERT INTO `sr_area` VALUES ('1759', '1754', '谷城县', '2', '-0-1709-1754-', 'G', '', '0', '1458285194', '0', '0');
INSERT INTO `sr_area` VALUES ('1760', '1754', '保康县', '2', '-0-1709-1754-', 'B', '', '0', '1458285195', '0', '0');
INSERT INTO `sr_area` VALUES ('1761', '1754', '老河口市', '2', '-0-1709-1754-', 'L', '', '0', '1458285196', '0', '0');
INSERT INTO `sr_area` VALUES ('1762', '1754', '枣阳市', '2', '-0-1709-1754-', 'Z', '', '0', '1458285197', '0', '0');
INSERT INTO `sr_area` VALUES ('1763', '1754', '宜城市', '2', '-0-1709-1754-', 'Y', '', '0', '1458285198', '0', '0');
INSERT INTO `sr_area` VALUES ('1764', '1709', '鄂州市', '1', '-0-1709-', 'E', '', '0', '1458285199', '0', '0');
INSERT INTO `sr_area` VALUES ('1765', '1764', '梁子湖区', '2', '-0-1709-1764-', 'L', '', '0', '1458285200', '0', '0');
INSERT INTO `sr_area` VALUES ('1766', '1764', '华容区', '2', '-0-1709-1764-', 'H', '', '0', '1458285201', '0', '0');
INSERT INTO `sr_area` VALUES ('1767', '1764', '鄂城区', '2', '-0-1709-1764-', 'E', '', '0', '1458285202', '0', '0');
INSERT INTO `sr_area` VALUES ('1768', '1709', '荆门市', '1', '-0-1709-', 'J', '', '0', '1458285203', '0', '0');
INSERT INTO `sr_area` VALUES ('1769', '1768', '东宝区', '2', '-0-1709-1768-', 'D', '', '0', '1458285204', '0', '0');
INSERT INTO `sr_area` VALUES ('1770', '1768', '掇刀区', '2', '-0-1709-1768-', 'D', '', '0', '1458285205', '0', '0');
INSERT INTO `sr_area` VALUES ('1771', '1768', '京山县', '2', '-0-1709-1768-', 'J', '', '0', '1458285206', '0', '0');
INSERT INTO `sr_area` VALUES ('1772', '1768', '沙洋县', '2', '-0-1709-1768-', 'S', '', '0', '1458285207', '0', '0');
INSERT INTO `sr_area` VALUES ('1773', '1768', '钟祥市', '2', '-0-1709-1768-', 'Z', '', '0', '1458285208', '0', '0');
INSERT INTO `sr_area` VALUES ('1774', '1709', '孝感市', '1', '-0-1709-', 'X', '', '0', '1458285209', '0', '0');
INSERT INTO `sr_area` VALUES ('1775', '1774', '孝南区', '2', '-0-1709-1774-', 'X', '', '0', '1458285210', '0', '0');
INSERT INTO `sr_area` VALUES ('1776', '1774', '孝昌县', '2', '-0-1709-1774-', 'X', '', '0', '1458285211', '0', '0');
INSERT INTO `sr_area` VALUES ('1777', '1774', '大悟县', '2', '-0-1709-1774-', 'D', '', '0', '1458285212', '0', '0');
INSERT INTO `sr_area` VALUES ('1778', '1774', '云梦县', '2', '-0-1709-1774-', 'Y', '', '0', '1458285213', '0', '0');
INSERT INTO `sr_area` VALUES ('1779', '1774', '应城市', '2', '-0-1709-1774-', 'Y', '', '0', '1458285214', '0', '0');
INSERT INTO `sr_area` VALUES ('1780', '1774', '安陆市', '2', '-0-1709-1774-', 'A', '', '0', '1458285215', '0', '0');
INSERT INTO `sr_area` VALUES ('1781', '1774', '汉川市', '2', '-0-1709-1774-', 'H', '', '0', '1458285216', '0', '0');
INSERT INTO `sr_area` VALUES ('1782', '1709', '荆州市', '1', '-0-1709-', 'J', '', '0', '1458285217', '0', '0');
INSERT INTO `sr_area` VALUES ('1783', '1782', '沙市区', '2', '-0-1709-1782-', 'S', '', '0', '1458285218', '0', '0');
INSERT INTO `sr_area` VALUES ('1784', '1782', '荆州区', '2', '-0-1709-1782-', 'J', '', '0', '1458285219', '0', '0');
INSERT INTO `sr_area` VALUES ('1785', '1782', '公安县', '2', '-0-1709-1782-', 'G', '', '0', '1458285220', '0', '0');
INSERT INTO `sr_area` VALUES ('1786', '1782', '监利县', '2', '-0-1709-1782-', 'J', '', '0', '1458285221', '0', '0');
INSERT INTO `sr_area` VALUES ('1787', '1782', '江陵县', '2', '-0-1709-1782-', 'J', '', '0', '1458285222', '0', '0');
INSERT INTO `sr_area` VALUES ('1788', '1782', '石首市', '2', '-0-1709-1782-', 'S', '', '0', '1458285223', '0', '0');
INSERT INTO `sr_area` VALUES ('1789', '1782', '洪湖市', '2', '-0-1709-1782-', 'H', '', '0', '1458285224', '0', '0');
INSERT INTO `sr_area` VALUES ('1790', '1782', '松滋市', '2', '-0-1709-1782-', 'S', '', '0', '1458285225', '0', '0');
INSERT INTO `sr_area` VALUES ('1791', '1709', '黄冈市', '1', '-0-1709-', 'H', '', '0', '1458285226', '0', '0');
INSERT INTO `sr_area` VALUES ('1792', '1791', '黄州区', '2', '-0-1709-1791-', 'H', '', '0', '1458285227', '0', '0');
INSERT INTO `sr_area` VALUES ('1793', '1791', '团风县', '2', '-0-1709-1791-', 'T', '', '0', '1458285228', '0', '0');
INSERT INTO `sr_area` VALUES ('1794', '1791', '红安县', '2', '-0-1709-1791-', 'H', '', '0', '1458285229', '0', '0');
INSERT INTO `sr_area` VALUES ('1795', '1791', '罗田县', '2', '-0-1709-1791-', 'L', '', '0', '1458285230', '0', '0');
INSERT INTO `sr_area` VALUES ('1796', '1791', '英山县', '2', '-0-1709-1791-', 'Y', '', '0', '1458285231', '0', '0');
INSERT INTO `sr_area` VALUES ('1797', '1791', '浠水县', '2', '-0-1709-1791-', '', '', '0', '1458285232', '0', '0');
INSERT INTO `sr_area` VALUES ('1798', '1791', '蕲春县', '2', '-0-1709-1791-', '', '', '0', '1458285233', '0', '0');
INSERT INTO `sr_area` VALUES ('1799', '1791', '黄梅县', '2', '-0-1709-1791-', 'H', '', '0', '1458285234', '0', '0');
INSERT INTO `sr_area` VALUES ('1800', '1791', '麻城市', '2', '-0-1709-1791-', 'M', '', '0', '1458285235', '0', '0');
INSERT INTO `sr_area` VALUES ('1801', '1791', '武穴市', '2', '-0-1709-1791-', 'W', '', '0', '1458285236', '0', '0');
INSERT INTO `sr_area` VALUES ('1802', '1709', '咸宁市', '1', '-0-1709-', 'X', '', '0', '1458285237', '0', '0');
INSERT INTO `sr_area` VALUES ('1803', '1802', '咸安区', '2', '-0-1709-1802-', 'X', '', '0', '1458285238', '0', '0');
INSERT INTO `sr_area` VALUES ('1804', '1802', '嘉鱼县', '2', '-0-1709-1802-', 'J', '', '0', '1458285239', '0', '0');
INSERT INTO `sr_area` VALUES ('1805', '1802', '通城县', '2', '-0-1709-1802-', 'T', '', '0', '1458285240', '0', '0');
INSERT INTO `sr_area` VALUES ('1806', '1802', '崇阳县', '2', '-0-1709-1802-', 'C', '', '0', '1458285241', '0', '0');
INSERT INTO `sr_area` VALUES ('1807', '1802', '通山县', '2', '-0-1709-1802-', 'T', '', '0', '1458285242', '0', '0');
INSERT INTO `sr_area` VALUES ('1808', '1802', '赤壁市', '2', '-0-1709-1802-', 'C', '', '0', '1458285243', '0', '0');
INSERT INTO `sr_area` VALUES ('1809', '1709', '随州市', '1', '-0-1709-', 'S', '', '0', '1458285244', '0', '0');
INSERT INTO `sr_area` VALUES ('1810', '1809', '曾都区', '2', '-0-1709-1809-', 'Z', '', '0', '1458285245', '0', '0');
INSERT INTO `sr_area` VALUES ('1811', '1809', '广水市', '2', '-0-1709-1809-', 'G', '', '0', '1458285246', '0', '0');
INSERT INTO `sr_area` VALUES ('1812', '1709', '恩施土家族苗族自治州', '1', '-0-1709-', 'E', '', '0', '1458285247', '0', '0');
INSERT INTO `sr_area` VALUES ('1813', '1812', '恩施市', '2', '-0-1709-1812-', 'E', '', '0', '1458285248', '0', '0');
INSERT INTO `sr_area` VALUES ('1814', '1812', '利川市', '2', '-0-1709-1812-', 'L', '', '0', '1458285249', '0', '0');
INSERT INTO `sr_area` VALUES ('1815', '1812', '建始县', '2', '-0-1709-1812-', 'J', '', '0', '1458285250', '0', '0');
INSERT INTO `sr_area` VALUES ('1816', '1812', '巴东县', '2', '-0-1709-1812-', 'B', '', '0', '1458285251', '0', '0');
INSERT INTO `sr_area` VALUES ('1817', '1812', '宣恩县', '2', '-0-1709-1812-', 'X', '', '0', '1458285252', '0', '0');
INSERT INTO `sr_area` VALUES ('1818', '1812', '咸丰县', '2', '-0-1709-1812-', 'X', '', '0', '1458285253', '0', '0');
INSERT INTO `sr_area` VALUES ('1819', '1812', '来凤县', '2', '-0-1709-1812-', 'L', '', '0', '1458285254', '0', '0');
INSERT INTO `sr_area` VALUES ('1820', '1812', '鹤峰县', '2', '-0-1709-1812-', 'H', '', '0', '1458285255', '0', '0');
INSERT INTO `sr_area` VALUES ('1821', '1709', '省直辖县级行政单位', '1', '-0-1709-', 'S', '', '0', '1458285256', '0', '0');
INSERT INTO `sr_area` VALUES ('1822', '1821', '仙桃市', '2', '-0-1709-1821-', 'X', '', '0', '1458285257', '0', '0');
INSERT INTO `sr_area` VALUES ('1823', '1821', '潜江市', '2', '-0-1709-1821-', 'Q', '', '0', '1458285258', '0', '0');
INSERT INTO `sr_area` VALUES ('1824', '1821', '天门市', '2', '-0-1709-1821-', 'T', '', '0', '1458285259', '0', '0');
INSERT INTO `sr_area` VALUES ('1825', '1821', '神农架林区', '2', '-0-1709-1821-', 'S', '', '0', '1458285260', '0', '0');
INSERT INTO `sr_area` VALUES ('1826', '0', '湖南', '0', '-0-', 'H', '华中', '0', '1458285261', '0', '0');
INSERT INTO `sr_area` VALUES ('1827', '1826', '长沙市', '1', '-0-1826-', 'C', '', '0', '1458285262', '0', '0');
INSERT INTO `sr_area` VALUES ('1828', '1827', '芙蓉区', '2', '-0-1826-1827-', '', '', '0', '1458285263', '0', '0');
INSERT INTO `sr_area` VALUES ('1829', '1827', '天心区', '2', '-0-1826-1827-', 'T', '', '0', '1458285264', '0', '0');
INSERT INTO `sr_area` VALUES ('1830', '1827', '岳麓区', '2', '-0-1826-1827-', 'Y', '', '0', '1458285265', '0', '0');
INSERT INTO `sr_area` VALUES ('1831', '1827', '开福区', '2', '-0-1826-1827-', 'K', '', '0', '1458285266', '0', '0');
INSERT INTO `sr_area` VALUES ('1832', '1827', '雨花区', '2', '-0-1826-1827-', 'Y', '', '0', '1458285267', '0', '0');
INSERT INTO `sr_area` VALUES ('1833', '1827', '长沙县', '2', '-0-1826-1827-', 'C', '', '0', '1458285268', '0', '0');
INSERT INTO `sr_area` VALUES ('1834', '1827', '望城县', '2', '-0-1826-1827-', 'W', '', '0', '1458285269', '0', '0');
INSERT INTO `sr_area` VALUES ('1835', '1827', '宁乡县', '2', '-0-1826-1827-', 'N', '', '0', '1458285270', '0', '0');
INSERT INTO `sr_area` VALUES ('1836', '1827', '浏阳市', '2', '-0-1826-1827-', '', '', '0', '1458285271', '0', '0');
INSERT INTO `sr_area` VALUES ('1837', '1826', '株洲市', '1', '-0-1826-', 'Z', '', '0', '1458285272', '0', '0');
INSERT INTO `sr_area` VALUES ('1838', '1837', '荷塘区', '2', '-0-1826-1837-', 'H', '', '0', '1458285273', '0', '0');
INSERT INTO `sr_area` VALUES ('1839', '1837', '芦淞区', '2', '-0-1826-1837-', 'L', '', '0', '1458285274', '0', '0');
INSERT INTO `sr_area` VALUES ('1840', '1837', '石峰区', '2', '-0-1826-1837-', 'S', '', '0', '1458285275', '0', '0');
INSERT INTO `sr_area` VALUES ('1841', '1837', '天元区', '2', '-0-1826-1837-', 'T', '', '0', '1458285276', '0', '0');
INSERT INTO `sr_area` VALUES ('1842', '1837', '株洲县', '2', '-0-1826-1837-', 'Z', '', '0', '1458285277', '0', '0');
INSERT INTO `sr_area` VALUES ('1843', '1837', '攸县', '2', '-0-1826-1837-', '', '', '0', '1458285278', '0', '0');
INSERT INTO `sr_area` VALUES ('1844', '1837', '茶陵县', '2', '-0-1826-1837-', 'C', '', '0', '1458285279', '0', '0');
INSERT INTO `sr_area` VALUES ('1845', '1837', '炎陵县', '2', '-0-1826-1837-', 'Y', '', '0', '1458285280', '0', '0');
INSERT INTO `sr_area` VALUES ('1846', '1837', '醴陵市', '2', '-0-1826-1837-', '', '', '0', '1458285281', '0', '0');
INSERT INTO `sr_area` VALUES ('1847', '1826', '湘潭市', '1', '-0-1826-', 'X', '', '0', '1458285282', '0', '0');
INSERT INTO `sr_area` VALUES ('1848', '1847', '雨湖区', '2', '-0-1826-1847-', 'Y', '', '0', '1458285283', '0', '0');
INSERT INTO `sr_area` VALUES ('1849', '1847', '岳塘区', '2', '-0-1826-1847-', 'Y', '', '0', '1458285284', '0', '0');
INSERT INTO `sr_area` VALUES ('1850', '1847', '湘潭县', '2', '-0-1826-1847-', 'X', '', '0', '1458285285', '0', '0');
INSERT INTO `sr_area` VALUES ('1851', '1847', '湘乡市', '2', '-0-1826-1847-', 'X', '', '0', '1458285286', '0', '0');
INSERT INTO `sr_area` VALUES ('1852', '1847', '韶山市', '2', '-0-1826-1847-', 'S', '', '0', '1458285287', '0', '0');
INSERT INTO `sr_area` VALUES ('1853', '1826', '衡阳市', '1', '-0-1826-', 'H', '', '0', '1458285288', '0', '0');
INSERT INTO `sr_area` VALUES ('1854', '1853', '珠晖区', '2', '-0-1826-1853-', 'Z', '', '0', '1458285289', '0', '0');
INSERT INTO `sr_area` VALUES ('1855', '1853', '雁峰区', '2', '-0-1826-1853-', 'Y', '', '0', '1458285290', '0', '0');
INSERT INTO `sr_area` VALUES ('1856', '1853', '石鼓区', '2', '-0-1826-1853-', 'S', '', '0', '1458285291', '0', '0');
INSERT INTO `sr_area` VALUES ('1857', '1853', '蒸湘区', '2', '-0-1826-1853-', 'Z', '', '0', '1458285292', '0', '0');
INSERT INTO `sr_area` VALUES ('1858', '1853', '南岳区', '2', '-0-1826-1853-', 'N', '', '0', '1458285293', '0', '0');
INSERT INTO `sr_area` VALUES ('1859', '1853', '衡阳县', '2', '-0-1826-1853-', 'H', '', '0', '1458285294', '0', '0');
INSERT INTO `sr_area` VALUES ('1860', '1853', '衡南县', '2', '-0-1826-1853-', 'H', '', '0', '1458285295', '0', '0');
INSERT INTO `sr_area` VALUES ('1861', '1853', '衡山县', '2', '-0-1826-1853-', 'H', '', '0', '1458285296', '0', '0');
INSERT INTO `sr_area` VALUES ('1862', '1853', '衡东县', '2', '-0-1826-1853-', 'H', '', '0', '1458285297', '0', '0');
INSERT INTO `sr_area` VALUES ('1863', '1853', '祁东县', '2', '-0-1826-1853-', 'Q', '', '0', '1458285298', '0', '0');
INSERT INTO `sr_area` VALUES ('1864', '1853', '耒阳市', '2', '-0-1826-1853-', '', '', '0', '1458285299', '0', '0');
INSERT INTO `sr_area` VALUES ('1865', '1853', '常宁市', '2', '-0-1826-1853-', 'C', '', '0', '1458285300', '0', '0');
INSERT INTO `sr_area` VALUES ('1866', '1826', '邵阳市', '1', '-0-1826-', 'S', '', '0', '1458285301', '0', '0');
INSERT INTO `sr_area` VALUES ('1867', '1866', '双清区', '2', '-0-1826-1866-', 'S', '', '0', '1458285302', '0', '0');
INSERT INTO `sr_area` VALUES ('1868', '1866', '大祥区', '2', '-0-1826-1866-', 'D', '', '0', '1458285303', '0', '0');
INSERT INTO `sr_area` VALUES ('1869', '1866', '北塔区', '2', '-0-1826-1866-', 'B', '', '0', '1458285304', '0', '0');
INSERT INTO `sr_area` VALUES ('1870', '1866', '邵东县', '2', '-0-1826-1866-', 'S', '', '0', '1458285305', '0', '0');
INSERT INTO `sr_area` VALUES ('1871', '1866', '新邵县', '2', '-0-1826-1866-', 'X', '', '0', '1458285306', '0', '0');
INSERT INTO `sr_area` VALUES ('1872', '1866', '邵阳县', '2', '-0-1826-1866-', 'S', '', '0', '1458285307', '0', '0');
INSERT INTO `sr_area` VALUES ('1873', '1866', '隆回县', '2', '-0-1826-1866-', 'L', '', '0', '1458285308', '0', '0');
INSERT INTO `sr_area` VALUES ('1874', '1866', '洞口县', '2', '-0-1826-1866-', 'D', '', '0', '1458285309', '0', '0');
INSERT INTO `sr_area` VALUES ('1875', '1866', '绥宁县', '2', '-0-1826-1866-', 'S', '', '0', '1458285310', '0', '0');
INSERT INTO `sr_area` VALUES ('1876', '1866', '新宁县', '2', '-0-1826-1866-', 'X', '', '0', '1458285311', '0', '0');
INSERT INTO `sr_area` VALUES ('1877', '1866', '城步苗族自治县', '2', '-0-1826-1866-', 'C', '', '0', '1458285312', '0', '0');
INSERT INTO `sr_area` VALUES ('1878', '1866', '武冈市', '2', '-0-1826-1866-', 'W', '', '0', '1458285313', '0', '0');
INSERT INTO `sr_area` VALUES ('1879', '1826', '岳阳市', '1', '-0-1826-', 'Y', '', '0', '1458285314', '0', '0');
INSERT INTO `sr_area` VALUES ('1880', '1879', '岳阳楼区', '2', '-0-1826-1879-', 'Y', '', '0', '1458285315', '0', '0');
INSERT INTO `sr_area` VALUES ('1881', '1879', '云溪区', '2', '-0-1826-1879-', 'Y', '', '0', '1458285316', '0', '0');
INSERT INTO `sr_area` VALUES ('1882', '1879', '君山区', '2', '-0-1826-1879-', 'J', '', '0', '1458285317', '0', '0');
INSERT INTO `sr_area` VALUES ('1883', '1879', '岳阳县', '2', '-0-1826-1879-', 'Y', '', '0', '1458285318', '0', '0');
INSERT INTO `sr_area` VALUES ('1884', '1879', '华容县', '2', '-0-1826-1879-', 'H', '', '0', '1458285319', '0', '0');
INSERT INTO `sr_area` VALUES ('1885', '1879', '湘阴县', '2', '-0-1826-1879-', 'X', '', '0', '1458285320', '0', '0');
INSERT INTO `sr_area` VALUES ('1886', '1879', '平江县', '2', '-0-1826-1879-', 'P', '', '0', '1458285321', '0', '0');
INSERT INTO `sr_area` VALUES ('1887', '1879', '汨罗市', '2', '-0-1826-1879-', '', '', '0', '1458285322', '0', '0');
INSERT INTO `sr_area` VALUES ('1888', '1879', '临湘市', '2', '-0-1826-1879-', 'L', '', '0', '1458285323', '0', '0');
INSERT INTO `sr_area` VALUES ('1889', '1826', '常德市', '1', '-0-1826-', 'C', '', '0', '1458285324', '0', '0');
INSERT INTO `sr_area` VALUES ('1890', '1889', '武陵区', '2', '-0-1826-1889-', 'W', '', '0', '1458285325', '0', '0');
INSERT INTO `sr_area` VALUES ('1891', '1889', '鼎城区', '2', '-0-1826-1889-', 'D', '', '0', '1458285326', '0', '0');
INSERT INTO `sr_area` VALUES ('1892', '1889', '安乡县', '2', '-0-1826-1889-', 'A', '', '0', '1458285327', '0', '0');
INSERT INTO `sr_area` VALUES ('1893', '1889', '汉寿县', '2', '-0-1826-1889-', 'H', '', '0', '1458285328', '0', '0');
INSERT INTO `sr_area` VALUES ('1894', '1889', '澧县', '2', '-0-1826-1889-', '', '', '0', '1458285329', '0', '0');
INSERT INTO `sr_area` VALUES ('1895', '1889', '临澧县', '2', '-0-1826-1889-', 'L', '', '0', '1458285330', '0', '0');
INSERT INTO `sr_area` VALUES ('1896', '1889', '桃源县', '2', '-0-1826-1889-', 'T', '', '0', '1458285331', '0', '0');
INSERT INTO `sr_area` VALUES ('1897', '1889', '石门县', '2', '-0-1826-1889-', 'S', '', '0', '1458285332', '0', '0');
INSERT INTO `sr_area` VALUES ('1898', '1889', '津市市', '2', '-0-1826-1889-', 'J', '', '0', '1458285333', '0', '0');
INSERT INTO `sr_area` VALUES ('1899', '1826', '张家界市', '1', '-0-1826-', 'Z', '', '0', '1458285334', '0', '0');
INSERT INTO `sr_area` VALUES ('1900', '1899', '永定区', '2', '-0-1826-1899-', 'Y', '', '0', '1458285335', '0', '0');
INSERT INTO `sr_area` VALUES ('1901', '1899', '武陵源区', '2', '-0-1826-1899-', 'W', '', '0', '1458285336', '0', '0');
INSERT INTO `sr_area` VALUES ('1902', '1899', '慈利县', '2', '-0-1826-1899-', 'C', '', '0', '1458285337', '0', '0');
INSERT INTO `sr_area` VALUES ('1903', '1899', '桑植县', '2', '-0-1826-1899-', 'S', '', '0', '1458285338', '0', '0');
INSERT INTO `sr_area` VALUES ('1904', '1826', '益阳市', '1', '-0-1826-', 'Y', '', '0', '1458285339', '0', '0');
INSERT INTO `sr_area` VALUES ('1905', '1904', '资阳区', '2', '-0-1826-1904-', 'Z', '', '0', '1458285340', '0', '0');
INSERT INTO `sr_area` VALUES ('1906', '1904', '赫山区', '2', '-0-1826-1904-', 'H', '', '0', '1458285341', '0', '0');
INSERT INTO `sr_area` VALUES ('1907', '1904', '南县', '2', '-0-1826-1904-', 'N', '', '0', '1458285342', '0', '0');
INSERT INTO `sr_area` VALUES ('1908', '1904', '桃江县', '2', '-0-1826-1904-', 'T', '', '0', '1458285343', '0', '0');
INSERT INTO `sr_area` VALUES ('1909', '1904', '安化县', '2', '-0-1826-1904-', 'A', '', '0', '1458285344', '0', '0');
INSERT INTO `sr_area` VALUES ('1910', '1904', '沅江市', '2', '-0-1826-1904-', '', '', '0', '1458285345', '0', '0');
INSERT INTO `sr_area` VALUES ('1911', '1826', '郴州市', '1', '-0-1826-', 'C', '', '0', '1458285346', '0', '0');
INSERT INTO `sr_area` VALUES ('1912', '1911', '北湖区', '2', '-0-1826-1911-', 'B', '', '0', '1458285347', '0', '0');
INSERT INTO `sr_area` VALUES ('1913', '1911', '苏仙区', '2', '-0-1826-1911-', 'S', '', '0', '1458285348', '0', '0');
INSERT INTO `sr_area` VALUES ('1914', '1911', '桂阳县', '2', '-0-1826-1911-', 'G', '', '0', '1458285349', '0', '0');
INSERT INTO `sr_area` VALUES ('1915', '1911', '宜章县', '2', '-0-1826-1911-', 'Y', '', '0', '1458285350', '0', '0');
INSERT INTO `sr_area` VALUES ('1916', '1911', '永兴县', '2', '-0-1826-1911-', 'Y', '', '0', '1458285351', '0', '0');
INSERT INTO `sr_area` VALUES ('1917', '1911', '嘉禾县', '2', '-0-1826-1911-', 'J', '', '0', '1458285352', '0', '0');
INSERT INTO `sr_area` VALUES ('1918', '1911', '临武县', '2', '-0-1826-1911-', 'L', '', '0', '1458285353', '0', '0');
INSERT INTO `sr_area` VALUES ('1919', '1911', '汝城县', '2', '-0-1826-1911-', 'R', '', '0', '1458285354', '0', '0');
INSERT INTO `sr_area` VALUES ('1920', '1911', '桂东县', '2', '-0-1826-1911-', 'G', '', '0', '1458285355', '0', '0');
INSERT INTO `sr_area` VALUES ('1921', '1911', '安仁县', '2', '-0-1826-1911-', 'A', '', '0', '1458285356', '0', '0');
INSERT INTO `sr_area` VALUES ('1922', '1911', '资兴市', '2', '-0-1826-1911-', 'Z', '', '0', '1458285357', '0', '0');
INSERT INTO `sr_area` VALUES ('1923', '1826', '永州市', '1', '-0-1826-', 'Y', '', '0', '1458285358', '0', '0');
INSERT INTO `sr_area` VALUES ('1924', '1923', '零陵区', '2', '-0-1826-1923-', 'L', '', '0', '1458285359', '0', '0');
INSERT INTO `sr_area` VALUES ('1925', '1923', '冷水滩区', '2', '-0-1826-1923-', 'L', '', '0', '1458285360', '0', '0');
INSERT INTO `sr_area` VALUES ('1926', '1923', '祁阳县', '2', '-0-1826-1923-', 'Q', '', '0', '1458285361', '0', '0');
INSERT INTO `sr_area` VALUES ('1927', '1923', '东安县', '2', '-0-1826-1923-', 'D', '', '0', '1458285362', '0', '0');
INSERT INTO `sr_area` VALUES ('1928', '1923', '双牌县', '2', '-0-1826-1923-', 'S', '', '0', '1458285363', '0', '0');
INSERT INTO `sr_area` VALUES ('1929', '1923', '道县', '2', '-0-1826-1923-', 'D', '', '0', '1458285364', '0', '0');
INSERT INTO `sr_area` VALUES ('1930', '1923', '江永县', '2', '-0-1826-1923-', 'J', '', '0', '1458285365', '0', '0');
INSERT INTO `sr_area` VALUES ('1931', '1923', '宁远县', '2', '-0-1826-1923-', 'N', '', '0', '1458285366', '0', '0');
INSERT INTO `sr_area` VALUES ('1932', '1923', '蓝山县', '2', '-0-1826-1923-', 'L', '', '0', '1458285367', '0', '0');
INSERT INTO `sr_area` VALUES ('1933', '1923', '新田县', '2', '-0-1826-1923-', 'X', '', '0', '1458285368', '0', '0');
INSERT INTO `sr_area` VALUES ('1934', '1923', '江华瑶族自治县', '2', '-0-1826-1923-', 'J', '', '0', '1458285369', '0', '0');
INSERT INTO `sr_area` VALUES ('1935', '1826', '怀化市', '1', '-0-1826-', 'H', '', '0', '1458285370', '0', '0');
INSERT INTO `sr_area` VALUES ('1936', '1935', '鹤城区', '2', '-0-1826-1935-', 'H', '', '0', '1458285371', '0', '0');
INSERT INTO `sr_area` VALUES ('1937', '1935', '中方县', '2', '-0-1826-1935-', 'Z', '', '0', '1458285372', '0', '0');
INSERT INTO `sr_area` VALUES ('1938', '1935', '沅陵县', '2', '-0-1826-1935-', '', '', '0', '1458285373', '0', '0');
INSERT INTO `sr_area` VALUES ('1939', '1935', '辰溪县', '2', '-0-1826-1935-', 'C', '', '0', '1458285374', '0', '0');
INSERT INTO `sr_area` VALUES ('1940', '1935', '溆浦县', '2', '-0-1826-1935-', '', '', '0', '1458285375', '0', '0');
INSERT INTO `sr_area` VALUES ('1941', '1935', '会同县', '2', '-0-1826-1935-', 'H', '', '0', '1458285376', '0', '0');
INSERT INTO `sr_area` VALUES ('1942', '1935', '麻阳苗族自治县', '2', '-0-1826-1935-', 'M', '', '0', '1458285377', '0', '0');
INSERT INTO `sr_area` VALUES ('1943', '1935', '新晃侗族自治县', '2', '-0-1826-1935-', 'X', '', '0', '1458285378', '0', '0');
INSERT INTO `sr_area` VALUES ('1944', '1935', '芷江侗族自治县', '2', '-0-1826-1935-', '', '', '0', '1458285379', '0', '0');
INSERT INTO `sr_area` VALUES ('1945', '1935', '靖州苗族侗族自治县', '2', '-0-1826-1935-', 'J', '', '0', '1458285380', '0', '0');
INSERT INTO `sr_area` VALUES ('1946', '1935', '通道侗族自治县', '2', '-0-1826-1935-', 'T', '', '0', '1458285381', '0', '0');
INSERT INTO `sr_area` VALUES ('1947', '1935', '洪江市', '2', '-0-1826-1935-', 'H', '', '0', '1458285382', '0', '0');
INSERT INTO `sr_area` VALUES ('1948', '1826', '娄底市', '1', '-0-1826-', 'L', '', '0', '1458285383', '0', '0');
INSERT INTO `sr_area` VALUES ('1949', '1948', '娄星区', '2', '-0-1826-1948-', 'L', '', '0', '1458285384', '0', '0');
INSERT INTO `sr_area` VALUES ('1950', '1948', '双峰县', '2', '-0-1826-1948-', 'S', '', '0', '1458285385', '0', '0');
INSERT INTO `sr_area` VALUES ('1951', '1948', '新化县', '2', '-0-1826-1948-', 'X', '', '0', '1458285386', '0', '0');
INSERT INTO `sr_area` VALUES ('1952', '1948', '冷水江市', '2', '-0-1826-1948-', 'L', '', '0', '1458285387', '0', '0');
INSERT INTO `sr_area` VALUES ('1953', '1948', '涟源市', '2', '-0-1826-1948-', 'L', '', '0', '1458285388', '0', '0');
INSERT INTO `sr_area` VALUES ('1954', '1826', '湘西土家族苗族自治州', '1', '-0-1826-', 'X', '', '0', '1458285389', '0', '0');
INSERT INTO `sr_area` VALUES ('1955', '1954', '吉首市', '2', '-0-1826-1954-', 'J', '', '0', '1458285390', '0', '0');
INSERT INTO `sr_area` VALUES ('1956', '1954', '泸溪县', '2', '-0-1826-1954-', '', '', '0', '1458285391', '0', '0');
INSERT INTO `sr_area` VALUES ('1957', '1954', '凤凰县', '2', '-0-1826-1954-', 'F', '', '0', '1458285392', '0', '0');
INSERT INTO `sr_area` VALUES ('1958', '1954', '花垣县', '2', '-0-1826-1954-', 'H', '', '0', '1458285393', '0', '0');
INSERT INTO `sr_area` VALUES ('1959', '1954', '保靖县', '2', '-0-1826-1954-', 'B', '', '0', '1458285394', '0', '0');
INSERT INTO `sr_area` VALUES ('1960', '1954', '古丈县', '2', '-0-1826-1954-', 'G', '', '0', '1458285395', '0', '0');
INSERT INTO `sr_area` VALUES ('1961', '1954', '永顺县', '2', '-0-1826-1954-', 'Y', '', '0', '1458285396', '0', '0');
INSERT INTO `sr_area` VALUES ('1962', '1954', '龙山县', '2', '-0-1826-1954-', 'L', '', '0', '1458285397', '0', '0');
INSERT INTO `sr_area` VALUES ('1963', '0', '广东', '0', '-0-', 'G', '华南', '0', '1458285398', '0', '0');
INSERT INTO `sr_area` VALUES ('1964', '1963', '广州市', '1', '-0-1963-', 'G', '', '0', '1458285399', '0', '0');
INSERT INTO `sr_area` VALUES ('1965', '1964', '荔湾区', '2', '-0-1963-1964-', 'L', '', '0', '1458285400', '0', '0');
INSERT INTO `sr_area` VALUES ('1966', '1964', '越秀区', '2', '-0-1963-1964-', 'Y', '', '0', '1458285401', '0', '0');
INSERT INTO `sr_area` VALUES ('1967', '1964', '海珠区', '2', '-0-1963-1964-', 'H', '', '0', '1458285402', '0', '0');
INSERT INTO `sr_area` VALUES ('1968', '1964', '天河区', '2', '-0-1963-1964-', 'T', '', '0', '1458285403', '0', '0');
INSERT INTO `sr_area` VALUES ('1969', '1964', '白云区', '2', '-0-1963-1964-', 'B', '', '0', '1458285404', '0', '0');
INSERT INTO `sr_area` VALUES ('1970', '1964', '黄埔区', '2', '-0-1963-1964-', 'H', '', '0', '1458285405', '0', '0');
INSERT INTO `sr_area` VALUES ('1971', '1964', '番禺区', '2', '-0-1963-1964-', 'F', '', '0', '1458285406', '0', '0');
INSERT INTO `sr_area` VALUES ('1972', '1964', '花都区', '2', '-0-1963-1964-', 'H', '', '0', '1458285407', '0', '0');
INSERT INTO `sr_area` VALUES ('1973', '1964', '南沙区', '2', '-0-1963-1964-', 'N', '', '0', '1458285408', '0', '0');
INSERT INTO `sr_area` VALUES ('1974', '1964', '萝岗区', '2', '-0-1963-1964-', 'L', '', '0', '1458285409', '0', '0');
INSERT INTO `sr_area` VALUES ('1975', '1964', '增城市', '2', '-0-1963-1964-', 'Z', '', '0', '1458285410', '0', '0');
INSERT INTO `sr_area` VALUES ('1976', '1964', '从化市', '2', '-0-1963-1964-', 'C', '', '0', '1458285411', '0', '0');
INSERT INTO `sr_area` VALUES ('1977', '1963', '韶关市', '1', '-0-1963-', 'S', '', '0', '1458285412', '0', '0');
INSERT INTO `sr_area` VALUES ('1978', '1977', '武江区', '2', '-0-1963-1977-', 'W', '', '0', '1458285413', '0', '0');
INSERT INTO `sr_area` VALUES ('1979', '1977', '浈江区', '2', '-0-1963-1977-', '', '', '0', '1458285414', '0', '0');
INSERT INTO `sr_area` VALUES ('1980', '1977', '曲江区', '2', '-0-1963-1977-', 'Q', '', '0', '1458285415', '0', '0');
INSERT INTO `sr_area` VALUES ('1981', '1977', '始兴县', '2', '-0-1963-1977-', 'S', '', '0', '1458285416', '0', '0');
INSERT INTO `sr_area` VALUES ('1982', '1977', '仁化县', '2', '-0-1963-1977-', 'R', '', '0', '1458285417', '0', '0');
INSERT INTO `sr_area` VALUES ('1983', '1977', '翁源县', '2', '-0-1963-1977-', 'W', '', '0', '1458285418', '0', '0');
INSERT INTO `sr_area` VALUES ('1984', '1977', '乳源瑶族自治县', '2', '-0-1963-1977-', 'R', '', '0', '1458285419', '0', '0');
INSERT INTO `sr_area` VALUES ('1985', '1977', '新丰县', '2', '-0-1963-1977-', 'X', '', '0', '1458285420', '0', '0');
INSERT INTO `sr_area` VALUES ('1986', '1977', '乐昌市', '2', '-0-1963-1977-', 'L', '', '0', '1458285421', '0', '0');
INSERT INTO `sr_area` VALUES ('1987', '1977', '南雄市', '2', '-0-1963-1977-', 'N', '', '0', '1458285422', '0', '0');
INSERT INTO `sr_area` VALUES ('1988', '1963', '深圳市', '1', '-0-1963-', 'S', '', '0', '1458285423', '0', '0');
INSERT INTO `sr_area` VALUES ('1989', '1988', '罗湖区', '2', '-0-1963-1988-', 'L', '', '0', '1458285424', '0', '0');
INSERT INTO `sr_area` VALUES ('1990', '1988', '福田区', '2', '-0-1963-1988-', 'F', '', '0', '1458285425', '0', '0');
INSERT INTO `sr_area` VALUES ('1991', '1988', '南山区', '2', '-0-1963-1988-', 'N', '', '0', '1458285426', '0', '0');
INSERT INTO `sr_area` VALUES ('1992', '1988', '宝安区', '2', '-0-1963-1988-', 'B', '', '0', '1458285427', '0', '0');
INSERT INTO `sr_area` VALUES ('1993', '1988', '龙岗区', '2', '-0-1963-1988-', 'L', '', '0', '1458285428', '0', '0');
INSERT INTO `sr_area` VALUES ('1994', '1988', '盐田区', '2', '-0-1963-1988-', 'Y', '', '0', '1458285429', '0', '0');
INSERT INTO `sr_area` VALUES ('1995', '1963', '珠海市', '1', '-0-1963-', 'Z', '', '0', '1458285430', '0', '0');
INSERT INTO `sr_area` VALUES ('1996', '1995', '香洲区', '2', '-0-1963-1995-', 'X', '', '0', '1458285431', '0', '0');
INSERT INTO `sr_area` VALUES ('1997', '1995', '斗门区', '2', '-0-1963-1995-', 'D', '', '0', '1458285432', '0', '0');
INSERT INTO `sr_area` VALUES ('1998', '1995', '金湾区', '2', '-0-1963-1995-', 'J', '', '0', '1458285433', '0', '0');
INSERT INTO `sr_area` VALUES ('1999', '1963', '汕头市', '1', '-0-1963-', 'S', '', '0', '1458285434', '0', '0');
INSERT INTO `sr_area` VALUES ('2000', '1999', '龙湖区', '2', '-0-1963-1999-', 'L', '', '0', '1458285435', '0', '0');
INSERT INTO `sr_area` VALUES ('2001', '1999', '金平区', '2', '-0-1963-1999-', 'J', '', '0', '1458285436', '0', '0');
INSERT INTO `sr_area` VALUES ('2002', '1999', '濠江区', '2', '-0-1963-1999-', '', '', '0', '1458285437', '0', '0');
INSERT INTO `sr_area` VALUES ('2003', '1999', '潮阳区', '2', '-0-1963-1999-', 'C', '', '0', '1458285438', '0', '0');
INSERT INTO `sr_area` VALUES ('2004', '1999', '潮南区', '2', '-0-1963-1999-', 'C', '', '0', '1458285439', '0', '0');
INSERT INTO `sr_area` VALUES ('2005', '1999', '澄海区', '2', '-0-1963-1999-', 'C', '', '0', '1458285440', '0', '0');
INSERT INTO `sr_area` VALUES ('2006', '1999', '南澳县', '2', '-0-1963-1999-', 'N', '', '0', '1458285441', '0', '0');
INSERT INTO `sr_area` VALUES ('2007', '1963', '佛山市', '1', '-0-1963-', 'F', '', '0', '1458285442', '0', '0');
INSERT INTO `sr_area` VALUES ('2008', '2007', '禅城区', '2', '-0-1963-2007-', '', '', '0', '1458285443', '0', '0');
INSERT INTO `sr_area` VALUES ('2009', '2007', '南海区', '2', '-0-1963-2007-', 'N', '', '0', '1458285444', '0', '0');
INSERT INTO `sr_area` VALUES ('2010', '2007', '顺德区', '2', '-0-1963-2007-', 'S', '', '0', '1458285445', '0', '0');
INSERT INTO `sr_area` VALUES ('2011', '2007', '三水区', '2', '-0-1963-2007-', 'S', '', '0', '1458285446', '0', '0');
INSERT INTO `sr_area` VALUES ('2012', '2007', '高明区', '2', '-0-1963-2007-', 'G', '', '0', '1458285447', '0', '0');
INSERT INTO `sr_area` VALUES ('2013', '1963', '江门市', '1', '-0-1963-', 'J', '', '0', '1458285448', '0', '0');
INSERT INTO `sr_area` VALUES ('2014', '2013', '蓬江区', '2', '-0-1963-2013-', 'P', '', '0', '1458285449', '0', '0');
INSERT INTO `sr_area` VALUES ('2015', '2013', '江海区', '2', '-0-1963-2013-', 'J', '', '0', '1458285450', '0', '0');
INSERT INTO `sr_area` VALUES ('2016', '2013', '新会区', '2', '-0-1963-2013-', 'X', '', '0', '1458285451', '0', '0');
INSERT INTO `sr_area` VALUES ('2017', '2013', '台山市', '2', '-0-1963-2013-', 'T', '', '0', '1458285452', '0', '0');
INSERT INTO `sr_area` VALUES ('2018', '2013', '开平市', '2', '-0-1963-2013-', 'K', '', '0', '1458285453', '0', '0');
INSERT INTO `sr_area` VALUES ('2019', '2013', '鹤山市', '2', '-0-1963-2013-', 'H', '', '0', '1458285454', '0', '0');
INSERT INTO `sr_area` VALUES ('2020', '2013', '恩平市', '2', '-0-1963-2013-', 'E', '', '0', '1458285455', '0', '0');
INSERT INTO `sr_area` VALUES ('2021', '1963', '湛江市', '1', '-0-1963-', 'Z', '', '0', '1458285456', '0', '0');
INSERT INTO `sr_area` VALUES ('2022', '2021', '赤坎区', '2', '-0-1963-2021-', 'C', '', '0', '1458285457', '0', '0');
INSERT INTO `sr_area` VALUES ('2023', '2021', '霞山区', '2', '-0-1963-2021-', 'X', '', '0', '1458285458', '0', '0');
INSERT INTO `sr_area` VALUES ('2024', '2021', '坡头区', '2', '-0-1963-2021-', 'P', '', '0', '1458285459', '0', '0');
INSERT INTO `sr_area` VALUES ('2025', '2021', '麻章区', '2', '-0-1963-2021-', 'M', '', '0', '1458285460', '0', '0');
INSERT INTO `sr_area` VALUES ('2026', '2021', '遂溪县', '2', '-0-1963-2021-', 'S', '', '0', '1458285461', '0', '0');
INSERT INTO `sr_area` VALUES ('2027', '2021', '徐闻县', '2', '-0-1963-2021-', 'X', '', '0', '1458285462', '0', '0');
INSERT INTO `sr_area` VALUES ('2028', '2021', '廉江市', '2', '-0-1963-2021-', 'L', '', '0', '1458285463', '0', '0');
INSERT INTO `sr_area` VALUES ('2029', '2021', '雷州市', '2', '-0-1963-2021-', 'L', '', '0', '1458285464', '0', '0');
INSERT INTO `sr_area` VALUES ('2030', '2021', '吴川市', '2', '-0-1963-2021-', 'W', '', '0', '1458285465', '0', '0');
INSERT INTO `sr_area` VALUES ('2031', '1963', '茂名市', '1', '-0-1963-', 'M', '', '0', '1458285466', '0', '0');
INSERT INTO `sr_area` VALUES ('2032', '2031', '茂南区', '2', '-0-1963-2031-', 'M', '', '0', '1458285467', '0', '0');
INSERT INTO `sr_area` VALUES ('2033', '2031', '茂港区', '2', '-0-1963-2031-', 'M', '', '0', '1458285468', '0', '0');
INSERT INTO `sr_area` VALUES ('2034', '2031', '电白县', '2', '-0-1963-2031-', 'D', '', '0', '1458285469', '0', '0');
INSERT INTO `sr_area` VALUES ('2035', '2031', '高州市', '2', '-0-1963-2031-', 'G', '', '0', '1458285470', '0', '0');
INSERT INTO `sr_area` VALUES ('2036', '2031', '化州市', '2', '-0-1963-2031-', 'H', '', '0', '1458285471', '0', '0');
INSERT INTO `sr_area` VALUES ('2037', '2031', '信宜市', '2', '-0-1963-2031-', 'X', '', '0', '1458285472', '0', '0');
INSERT INTO `sr_area` VALUES ('2038', '1963', '肇庆市', '1', '-0-1963-', 'Z', '', '0', '1458285473', '0', '0');
INSERT INTO `sr_area` VALUES ('2039', '2038', '端州区', '2', '-0-1963-2038-', 'D', '', '0', '1458285474', '0', '0');
INSERT INTO `sr_area` VALUES ('2040', '2038', '鼎湖区', '2', '-0-1963-2038-', 'D', '', '0', '1458285475', '0', '0');
INSERT INTO `sr_area` VALUES ('2041', '2038', '广宁县', '2', '-0-1963-2038-', 'G', '', '0', '1458285476', '0', '0');
INSERT INTO `sr_area` VALUES ('2042', '2038', '怀集县', '2', '-0-1963-2038-', 'H', '', '0', '1458285477', '0', '0');
INSERT INTO `sr_area` VALUES ('2043', '2038', '封开县', '2', '-0-1963-2038-', 'F', '', '0', '1458285478', '0', '0');
INSERT INTO `sr_area` VALUES ('2044', '2038', '德庆县', '2', '-0-1963-2038-', 'D', '', '0', '1458285479', '0', '0');
INSERT INTO `sr_area` VALUES ('2045', '2038', '高要市', '2', '-0-1963-2038-', 'G', '', '0', '1458285480', '0', '0');
INSERT INTO `sr_area` VALUES ('2046', '2038', '四会市', '2', '-0-1963-2038-', 'S', '', '0', '1458285481', '0', '0');
INSERT INTO `sr_area` VALUES ('2047', '1963', '惠州市', '1', '-0-1963-', 'H', '', '0', '1458285482', '0', '0');
INSERT INTO `sr_area` VALUES ('2048', '2047', '惠城区', '2', '-0-1963-2047-', 'H', '', '0', '1458285483', '0', '0');
INSERT INTO `sr_area` VALUES ('2049', '2047', '惠阳区', '2', '-0-1963-2047-', 'H', '', '0', '1458285484', '0', '0');
INSERT INTO `sr_area` VALUES ('2050', '2047', '博罗县', '2', '-0-1963-2047-', 'B', '', '0', '1458285485', '0', '0');
INSERT INTO `sr_area` VALUES ('2051', '2047', '惠东县', '2', '-0-1963-2047-', 'H', '', '0', '1458285486', '0', '0');
INSERT INTO `sr_area` VALUES ('2052', '2047', '龙门县', '2', '-0-1963-2047-', 'L', '', '0', '1458285487', '0', '0');
INSERT INTO `sr_area` VALUES ('2053', '1963', '梅州市', '1', '-0-1963-', 'M', '', '0', '1458285488', '0', '0');
INSERT INTO `sr_area` VALUES ('2054', '2053', '梅江区', '2', '-0-1963-2053-', 'M', '', '0', '1458285489', '0', '0');
INSERT INTO `sr_area` VALUES ('2055', '2053', '梅县', '2', '-0-1963-2053-', 'M', '', '0', '1458285490', '0', '0');
INSERT INTO `sr_area` VALUES ('2056', '2053', '大埔县', '2', '-0-1963-2053-', 'D', '', '0', '1458285491', '0', '0');
INSERT INTO `sr_area` VALUES ('2057', '2053', '丰顺县', '2', '-0-1963-2053-', 'F', '', '0', '1458285492', '0', '0');
INSERT INTO `sr_area` VALUES ('2058', '2053', '五华县', '2', '-0-1963-2053-', 'W', '', '0', '1458285493', '0', '0');
INSERT INTO `sr_area` VALUES ('2059', '2053', '平远县', '2', '-0-1963-2053-', 'P', '', '0', '1458285494', '0', '0');
INSERT INTO `sr_area` VALUES ('2060', '2053', '蕉岭县', '2', '-0-1963-2053-', 'J', '', '0', '1458285495', '0', '0');
INSERT INTO `sr_area` VALUES ('2061', '2053', '兴宁市', '2', '-0-1963-2053-', 'X', '', '0', '1458285496', '0', '0');
INSERT INTO `sr_area` VALUES ('2062', '1963', '汕尾市', '1', '-0-1963-', 'S', '', '0', '1458285497', '0', '0');
INSERT INTO `sr_area` VALUES ('2063', '2062', '城区', '2', '-0-1963-2062-', 'C', '', '0', '1458285498', '0', '0');
INSERT INTO `sr_area` VALUES ('2064', '2062', '海丰县', '2', '-0-1963-2062-', 'H', '', '0', '1458285499', '0', '0');
INSERT INTO `sr_area` VALUES ('2065', '2062', '陆河县', '2', '-0-1963-2062-', 'L', '', '0', '1458285500', '0', '0');
INSERT INTO `sr_area` VALUES ('2066', '2062', '陆丰市', '2', '-0-1963-2062-', 'L', '', '0', '1458285501', '0', '0');
INSERT INTO `sr_area` VALUES ('2067', '1963', '河源市', '1', '-0-1963-', 'H', '', '0', '1458285502', '0', '0');
INSERT INTO `sr_area` VALUES ('2068', '2067', '源城区', '2', '-0-1963-2067-', 'Y', '', '0', '1458285503', '0', '0');
INSERT INTO `sr_area` VALUES ('2069', '2067', '紫金县', '2', '-0-1963-2067-', 'Z', '', '0', '1458285504', '0', '0');
INSERT INTO `sr_area` VALUES ('2070', '2067', '龙川县', '2', '-0-1963-2067-', 'L', '', '0', '1458285505', '0', '0');
INSERT INTO `sr_area` VALUES ('2071', '2067', '连平县', '2', '-0-1963-2067-', 'L', '', '0', '1458285506', '0', '0');
INSERT INTO `sr_area` VALUES ('2072', '2067', '和平县', '2', '-0-1963-2067-', 'H', '', '0', '1458285507', '0', '0');
INSERT INTO `sr_area` VALUES ('2073', '2067', '东源县', '2', '-0-1963-2067-', 'D', '', '0', '1458285508', '0', '0');
INSERT INTO `sr_area` VALUES ('2074', '1963', '阳江市', '1', '-0-1963-', 'Y', '', '0', '1458285509', '0', '0');
INSERT INTO `sr_area` VALUES ('2075', '2074', '江城区', '2', '-0-1963-2074-', 'J', '', '0', '1458285510', '0', '0');
INSERT INTO `sr_area` VALUES ('2076', '2074', '阳西县', '2', '-0-1963-2074-', 'Y', '', '0', '1458285511', '0', '0');
INSERT INTO `sr_area` VALUES ('2077', '2074', '阳东县', '2', '-0-1963-2074-', 'Y', '', '0', '1458285512', '0', '0');
INSERT INTO `sr_area` VALUES ('2078', '2074', '阳春市', '2', '-0-1963-2074-', 'Y', '', '0', '1458285513', '0', '0');
INSERT INTO `sr_area` VALUES ('2079', '1963', '清远市', '1', '-0-1963-', 'Q', '', '0', '1458285514', '0', '0');
INSERT INTO `sr_area` VALUES ('2080', '2079', '清城区', '2', '-0-1963-2079-', 'Q', '', '0', '1458285515', '0', '0');
INSERT INTO `sr_area` VALUES ('2081', '2079', '佛冈县', '2', '-0-1963-2079-', 'F', '', '0', '1458285516', '0', '0');
INSERT INTO `sr_area` VALUES ('2082', '2079', '阳山县', '2', '-0-1963-2079-', 'Y', '', '0', '1458285517', '0', '0');
INSERT INTO `sr_area` VALUES ('2083', '2079', '连山壮族瑶族自治县', '2', '-0-1963-2079-', 'L', '', '0', '1458285518', '0', '0');
INSERT INTO `sr_area` VALUES ('2084', '2079', '连南瑶族自治县', '2', '-0-1963-2079-', 'L', '', '0', '1458285519', '0', '0');
INSERT INTO `sr_area` VALUES ('2085', '2079', '清新县', '2', '-0-1963-2079-', 'Q', '', '0', '1458285520', '0', '0');
INSERT INTO `sr_area` VALUES ('2086', '2079', '英德市', '2', '-0-1963-2079-', 'Y', '', '0', '1458285521', '0', '0');
INSERT INTO `sr_area` VALUES ('2087', '2079', '连州市', '2', '-0-1963-2079-', 'L', '', '0', '1458285522', '0', '0');
INSERT INTO `sr_area` VALUES ('2088', '1963', '东莞市', '1', '-0-1963-', 'D', '', '0', '1458285523', '0', '0');
INSERT INTO `sr_area` VALUES ('2089', '1963', '中山市', '1', '-0-1963-', 'Z', '', '0', '1458285524', '0', '0');
INSERT INTO `sr_area` VALUES ('2090', '1963', '潮州市', '1', '-0-1963-', 'C', '', '0', '1458285525', '0', '0');
INSERT INTO `sr_area` VALUES ('2091', '2090', '湘桥区', '2', '-0-1963-2090-', 'X', '', '0', '1458285526', '0', '0');
INSERT INTO `sr_area` VALUES ('2092', '2090', '潮安县', '2', '-0-1963-2090-', 'C', '', '0', '1458285527', '0', '0');
INSERT INTO `sr_area` VALUES ('2093', '2090', '饶平县', '2', '-0-1963-2090-', 'R', '', '0', '1458285528', '0', '0');
INSERT INTO `sr_area` VALUES ('2094', '1963', '揭阳市', '1', '-0-1963-', 'J', '', '0', '1458285529', '0', '0');
INSERT INTO `sr_area` VALUES ('2095', '2094', '榕城区', '2', '-0-1963-2094-', '', '', '0', '1458285530', '0', '0');
INSERT INTO `sr_area` VALUES ('2096', '2094', '揭东县', '2', '-0-1963-2094-', 'J', '', '0', '1458285531', '0', '0');
INSERT INTO `sr_area` VALUES ('2097', '2094', '揭西县', '2', '-0-1963-2094-', 'J', '', '0', '1458285532', '0', '0');
INSERT INTO `sr_area` VALUES ('2098', '2094', '惠来县', '2', '-0-1963-2094-', 'H', '', '0', '1458285533', '0', '0');
INSERT INTO `sr_area` VALUES ('2099', '2094', '普宁市', '2', '-0-1963-2094-', 'P', '', '0', '1458285534', '0', '0');
INSERT INTO `sr_area` VALUES ('2100', '1963', '云浮市', '1', '-0-1963-', 'Y', '', '0', '1458285535', '0', '0');
INSERT INTO `sr_area` VALUES ('2101', '2100', '云城区', '2', '-0-1963-2100-', 'Y', '', '0', '1458285536', '0', '0');
INSERT INTO `sr_area` VALUES ('2102', '2100', '新兴县', '2', '-0-1963-2100-', 'X', '', '0', '1458285537', '0', '0');
INSERT INTO `sr_area` VALUES ('2103', '2100', '郁南县', '2', '-0-1963-2100-', 'Y', '', '0', '1458285538', '0', '0');
INSERT INTO `sr_area` VALUES ('2104', '2100', '云安县', '2', '-0-1963-2100-', 'Y', '', '0', '1458285539', '0', '0');
INSERT INTO `sr_area` VALUES ('2105', '2100', '罗定市', '2', '-0-1963-2100-', 'L', '', '0', '1458285540', '0', '0');
INSERT INTO `sr_area` VALUES ('2106', '0', '广西', '0', '-0-', 'G', '华南', '0', '1458285541', '0', '0');
INSERT INTO `sr_area` VALUES ('2107', '2106', '南宁市', '1', '-0-2106-', 'N', '', '0', '1458285542', '0', '0');
INSERT INTO `sr_area` VALUES ('2108', '2107', '兴宁区', '2', '-0-2106-2107-', 'X', '', '0', '1458285543', '0', '0');
INSERT INTO `sr_area` VALUES ('2109', '2107', '青秀区', '2', '-0-2106-2107-', 'Q', '', '0', '1458285544', '0', '0');
INSERT INTO `sr_area` VALUES ('2110', '2107', '江南区', '2', '-0-2106-2107-', 'J', '', '0', '1458285545', '0', '0');
INSERT INTO `sr_area` VALUES ('2111', '2107', '西乡塘区', '2', '-0-2106-2107-', 'X', '', '0', '1458285546', '0', '0');
INSERT INTO `sr_area` VALUES ('2112', '2107', '良庆区', '2', '-0-2106-2107-', 'L', '', '0', '1458285547', '0', '0');
INSERT INTO `sr_area` VALUES ('2113', '2107', '邕宁区', '2', '-0-2106-2107-', '', '', '0', '1458285548', '0', '0');
INSERT INTO `sr_area` VALUES ('2114', '2107', '武鸣县', '2', '-0-2106-2107-', 'W', '', '0', '1458285549', '0', '0');
INSERT INTO `sr_area` VALUES ('2115', '2107', '隆安县', '2', '-0-2106-2107-', 'L', '', '0', '1458285550', '0', '0');
INSERT INTO `sr_area` VALUES ('2116', '2107', '马山县', '2', '-0-2106-2107-', 'M', '', '0', '1458285551', '0', '0');
INSERT INTO `sr_area` VALUES ('2117', '2107', '上林县', '2', '-0-2106-2107-', 'S', '', '0', '1458285552', '0', '0');
INSERT INTO `sr_area` VALUES ('2118', '2107', '宾阳县', '2', '-0-2106-2107-', 'B', '', '0', '1458285553', '0', '0');
INSERT INTO `sr_area` VALUES ('2119', '2107', '横县', '2', '-0-2106-2107-', 'H', '', '0', '1458285554', '0', '0');
INSERT INTO `sr_area` VALUES ('2120', '2106', '柳州市', '1', '-0-2106-', 'L', '', '0', '1458285555', '0', '0');
INSERT INTO `sr_area` VALUES ('2121', '2120', '城中区', '2', '-0-2106-2120-', 'C', '', '0', '1458285556', '0', '0');
INSERT INTO `sr_area` VALUES ('2122', '2120', '鱼峰区', '2', '-0-2106-2120-', 'Y', '', '0', '1458285557', '0', '0');
INSERT INTO `sr_area` VALUES ('2123', '2120', '柳南区', '2', '-0-2106-2120-', 'L', '', '0', '1458285558', '0', '0');
INSERT INTO `sr_area` VALUES ('2124', '2120', '柳北区', '2', '-0-2106-2120-', 'L', '', '0', '1458285559', '0', '0');
INSERT INTO `sr_area` VALUES ('2125', '2120', '柳江县', '2', '-0-2106-2120-', 'L', '', '0', '1458285560', '0', '0');
INSERT INTO `sr_area` VALUES ('2126', '2120', '柳城县', '2', '-0-2106-2120-', 'L', '', '0', '1458285561', '0', '0');
INSERT INTO `sr_area` VALUES ('2127', '2120', '鹿寨县', '2', '-0-2106-2120-', 'L', '', '0', '1458285562', '0', '0');
INSERT INTO `sr_area` VALUES ('2128', '2120', '融安县', '2', '-0-2106-2120-', 'R', '', '0', '1458285563', '0', '0');
INSERT INTO `sr_area` VALUES ('2129', '2120', '融水苗族自治县', '2', '-0-2106-2120-', 'R', '', '0', '1458285564', '0', '0');
INSERT INTO `sr_area` VALUES ('2130', '2120', '三江侗族自治县', '2', '-0-2106-2120-', 'S', '', '0', '1458285565', '0', '0');
INSERT INTO `sr_area` VALUES ('2131', '2106', '桂林市', '1', '-0-2106-', 'G', '', '0', '1458285566', '0', '0');
INSERT INTO `sr_area` VALUES ('2132', '2131', '秀峰区', '2', '-0-2106-2131-', 'X', '', '0', '1458285567', '0', '0');
INSERT INTO `sr_area` VALUES ('2133', '2131', '叠彩区', '2', '-0-2106-2131-', 'D', '', '0', '1458285568', '0', '0');
INSERT INTO `sr_area` VALUES ('2134', '2131', '象山区', '2', '-0-2106-2131-', 'X', '', '0', '1458285569', '0', '0');
INSERT INTO `sr_area` VALUES ('2135', '2131', '七星区', '2', '-0-2106-2131-', 'Q', '', '0', '1458285570', '0', '0');
INSERT INTO `sr_area` VALUES ('2136', '2131', '雁山区', '2', '-0-2106-2131-', 'Y', '', '0', '1458285571', '0', '0');
INSERT INTO `sr_area` VALUES ('2137', '2131', '阳朔县', '2', '-0-2106-2131-', 'Y', '', '0', '1458285572', '0', '0');
INSERT INTO `sr_area` VALUES ('2138', '2131', '临桂县', '2', '-0-2106-2131-', 'L', '', '0', '1458285573', '0', '0');
INSERT INTO `sr_area` VALUES ('2139', '2131', '灵川县', '2', '-0-2106-2131-', 'L', '', '0', '1458285574', '0', '0');
INSERT INTO `sr_area` VALUES ('2140', '2131', '全州县', '2', '-0-2106-2131-', 'Q', '', '0', '1458285575', '0', '0');
INSERT INTO `sr_area` VALUES ('2141', '2131', '兴安县', '2', '-0-2106-2131-', 'X', '', '0', '1458285576', '0', '0');
INSERT INTO `sr_area` VALUES ('2142', '2131', '永福县', '2', '-0-2106-2131-', 'Y', '', '0', '1458285577', '0', '0');
INSERT INTO `sr_area` VALUES ('2143', '2131', '灌阳县', '2', '-0-2106-2131-', 'G', '', '0', '1458285578', '0', '0');
INSERT INTO `sr_area` VALUES ('2144', '2131', '龙胜各族自治县', '2', '-0-2106-2131-', 'L', '', '0', '1458285579', '0', '0');
INSERT INTO `sr_area` VALUES ('2145', '2131', '资源县', '2', '-0-2106-2131-', 'Z', '', '0', '1458285580', '0', '0');
INSERT INTO `sr_area` VALUES ('2146', '2131', '平乐县', '2', '-0-2106-2131-', 'P', '', '0', '1458285581', '0', '0');
INSERT INTO `sr_area` VALUES ('2147', '2131', '荔蒲县', '2', '-0-2106-2131-', 'L', '', '0', '1458285582', '0', '0');
INSERT INTO `sr_area` VALUES ('2148', '2131', '恭城瑶族自治县', '2', '-0-2106-2131-', 'G', '', '0', '1458285583', '0', '0');
INSERT INTO `sr_area` VALUES ('2149', '2106', '梧州市', '1', '-0-2106-', 'W', '', '0', '1458285584', '0', '0');
INSERT INTO `sr_area` VALUES ('2150', '2149', '万秀区', '2', '-0-2106-2149-', 'W', '', '0', '1458285585', '0', '0');
INSERT INTO `sr_area` VALUES ('2151', '2149', '蝶山区', '2', '-0-2106-2149-', 'D', '', '0', '1458285586', '0', '0');
INSERT INTO `sr_area` VALUES ('2152', '2149', '长洲区', '2', '-0-2106-2149-', 'C', '', '0', '1458285587', '0', '0');
INSERT INTO `sr_area` VALUES ('2153', '2149', '苍梧县', '2', '-0-2106-2149-', 'C', '', '0', '1458285588', '0', '0');
INSERT INTO `sr_area` VALUES ('2154', '2149', '藤县', '2', '-0-2106-2149-', 'T', '', '0', '1458285589', '0', '0');
INSERT INTO `sr_area` VALUES ('2155', '2149', '蒙山县', '2', '-0-2106-2149-', 'M', '', '0', '1458285590', '0', '0');
INSERT INTO `sr_area` VALUES ('2156', '2149', '岑溪市', '2', '-0-2106-2149-', '', '', '0', '1458285591', '0', '0');
INSERT INTO `sr_area` VALUES ('2157', '2106', '北海市', '1', '-0-2106-', 'B', '', '0', '1458285592', '0', '0');
INSERT INTO `sr_area` VALUES ('2158', '2157', '海城区', '2', '-0-2106-2157-', 'H', '', '0', '1458285593', '0', '0');
INSERT INTO `sr_area` VALUES ('2159', '2157', '银海区', '2', '-0-2106-2157-', 'Y', '', '0', '1458285594', '0', '0');
INSERT INTO `sr_area` VALUES ('2160', '2157', '铁山港区', '2', '-0-2106-2157-', 'T', '', '0', '1458285595', '0', '0');
INSERT INTO `sr_area` VALUES ('2161', '2157', '合浦县', '2', '-0-2106-2157-', 'H', '', '0', '1458285596', '0', '0');
INSERT INTO `sr_area` VALUES ('2162', '2106', '防城港市', '1', '-0-2106-', 'F', '', '0', '1458285597', '0', '0');
INSERT INTO `sr_area` VALUES ('2163', '2162', '港口区', '2', '-0-2106-2162-', 'G', '', '0', '1458285598', '0', '0');
INSERT INTO `sr_area` VALUES ('2164', '2162', '防城区', '2', '-0-2106-2162-', 'F', '', '0', '1458285599', '0', '0');
INSERT INTO `sr_area` VALUES ('2165', '2162', '上思县', '2', '-0-2106-2162-', 'S', '', '0', '1458285600', '0', '0');
INSERT INTO `sr_area` VALUES ('2166', '2162', '东兴市', '2', '-0-2106-2162-', 'D', '', '0', '1458285601', '0', '0');
INSERT INTO `sr_area` VALUES ('2167', '2106', '钦州市', '1', '-0-2106-', 'Q', '', '0', '1458285602', '0', '0');
INSERT INTO `sr_area` VALUES ('2168', '2167', '钦南区', '2', '-0-2106-2167-', 'Q', '', '0', '1458285603', '0', '0');
INSERT INTO `sr_area` VALUES ('2169', '2167', '钦北区', '2', '-0-2106-2167-', 'Q', '', '0', '1458285604', '0', '0');
INSERT INTO `sr_area` VALUES ('2170', '2167', '灵山县', '2', '-0-2106-2167-', 'L', '', '0', '1458285605', '0', '0');
INSERT INTO `sr_area` VALUES ('2171', '2167', '浦北县', '2', '-0-2106-2167-', 'P', '', '0', '1458285606', '0', '0');
INSERT INTO `sr_area` VALUES ('2172', '2106', '贵港市', '1', '-0-2106-', 'G', '', '0', '1458285607', '0', '0');
INSERT INTO `sr_area` VALUES ('2173', '2172', '港北区', '2', '-0-2106-2172-', 'G', '', '0', '1458285608', '0', '0');
INSERT INTO `sr_area` VALUES ('2174', '2172', '港南区', '2', '-0-2106-2172-', 'G', '', '0', '1458285609', '0', '0');
INSERT INTO `sr_area` VALUES ('2175', '2172', '覃塘区', '2', '-0-2106-2172-', '', '', '0', '1458285610', '0', '0');
INSERT INTO `sr_area` VALUES ('2176', '2172', '平南县', '2', '-0-2106-2172-', 'P', '', '0', '1458285611', '0', '0');
INSERT INTO `sr_area` VALUES ('2177', '2172', '桂平市', '2', '-0-2106-2172-', 'G', '', '0', '1458285612', '0', '0');
INSERT INTO `sr_area` VALUES ('2178', '2106', '玉林市', '1', '-0-2106-', 'Y', '', '0', '1458285613', '0', '0');
INSERT INTO `sr_area` VALUES ('2179', '2178', '玉州区', '2', '-0-2106-2178-', 'Y', '', '0', '1458285614', '0', '0');
INSERT INTO `sr_area` VALUES ('2180', '2178', '容县', '2', '-0-2106-2178-', 'R', '', '0', '1458285615', '0', '0');
INSERT INTO `sr_area` VALUES ('2181', '2178', '陆川县', '2', '-0-2106-2178-', 'L', '', '0', '1458285616', '0', '0');
INSERT INTO `sr_area` VALUES ('2182', '2178', '博白县', '2', '-0-2106-2178-', 'B', '', '0', '1458285617', '0', '0');
INSERT INTO `sr_area` VALUES ('2183', '2178', '兴业县', '2', '-0-2106-2178-', 'X', '', '0', '1458285618', '0', '0');
INSERT INTO `sr_area` VALUES ('2184', '2178', '北流市', '2', '-0-2106-2178-', 'B', '', '0', '1458285619', '0', '0');
INSERT INTO `sr_area` VALUES ('2185', '2106', '百色市', '1', '-0-2106-', 'B', '', '0', '1458285620', '0', '0');
INSERT INTO `sr_area` VALUES ('2186', '2185', '右江区', '2', '-0-2106-2185-', 'Y', '', '0', '1458285621', '0', '0');
INSERT INTO `sr_area` VALUES ('2187', '2185', '田阳县', '2', '-0-2106-2185-', 'T', '', '0', '1458285622', '0', '0');
INSERT INTO `sr_area` VALUES ('2188', '2185', '田东县', '2', '-0-2106-2185-', 'T', '', '0', '1458285623', '0', '0');
INSERT INTO `sr_area` VALUES ('2189', '2185', '平果县', '2', '-0-2106-2185-', 'P', '', '0', '1458285624', '0', '0');
INSERT INTO `sr_area` VALUES ('2190', '2185', '德保县', '2', '-0-2106-2185-', 'D', '', '0', '1458285625', '0', '0');
INSERT INTO `sr_area` VALUES ('2191', '2185', '靖西县', '2', '-0-2106-2185-', 'J', '', '0', '1458285626', '0', '0');
INSERT INTO `sr_area` VALUES ('2192', '2185', '那坡县', '2', '-0-2106-2185-', 'N', '', '0', '1458285627', '0', '0');
INSERT INTO `sr_area` VALUES ('2193', '2185', '凌云县', '2', '-0-2106-2185-', 'L', '', '0', '1458285628', '0', '0');
INSERT INTO `sr_area` VALUES ('2194', '2185', '乐业县', '2', '-0-2106-2185-', 'L', '', '0', '1458285629', '0', '0');
INSERT INTO `sr_area` VALUES ('2195', '2185', '田林县', '2', '-0-2106-2185-', 'T', '', '0', '1458285630', '0', '0');
INSERT INTO `sr_area` VALUES ('2196', '2185', '西林县', '2', '-0-2106-2185-', 'X', '', '0', '1458285631', '0', '0');
INSERT INTO `sr_area` VALUES ('2197', '2185', '隆林各族自治县', '2', '-0-2106-2185-', 'L', '', '0', '1458285632', '0', '0');
INSERT INTO `sr_area` VALUES ('2198', '2106', '贺州市', '1', '-0-2106-', 'H', '', '0', '1458285633', '0', '0');
INSERT INTO `sr_area` VALUES ('2199', '2198', '八步区', '2', '-0-2106-2198-', 'B', '', '0', '1458285634', '0', '0');
INSERT INTO `sr_area` VALUES ('2200', '2198', '昭平县', '2', '-0-2106-2198-', 'Z', '', '0', '1458285635', '0', '0');
INSERT INTO `sr_area` VALUES ('2201', '2198', '钟山县', '2', '-0-2106-2198-', 'Z', '', '0', '1458285636', '0', '0');
INSERT INTO `sr_area` VALUES ('2202', '2198', '富川瑶族自治县', '2', '-0-2106-2198-', 'F', '', '0', '1458285637', '0', '0');
INSERT INTO `sr_area` VALUES ('2203', '2106', '河池市', '1', '-0-2106-', 'H', '', '0', '1458285638', '0', '0');
INSERT INTO `sr_area` VALUES ('2204', '2203', '金城江区', '2', '-0-2106-2203-', 'J', '', '0', '1458285639', '0', '0');
INSERT INTO `sr_area` VALUES ('2205', '2203', '南丹县', '2', '-0-2106-2203-', 'N', '', '0', '1458285640', '0', '0');
INSERT INTO `sr_area` VALUES ('2206', '2203', '天峨县', '2', '-0-2106-2203-', 'T', '', '0', '1458285641', '0', '0');
INSERT INTO `sr_area` VALUES ('2207', '2203', '凤山县', '2', '-0-2106-2203-', 'F', '', '0', '1458285642', '0', '0');
INSERT INTO `sr_area` VALUES ('2208', '2203', '东兰县', '2', '-0-2106-2203-', 'D', '', '0', '1458285643', '0', '0');
INSERT INTO `sr_area` VALUES ('2209', '2203', '罗城仫佬族自治县', '2', '-0-2106-2203-', 'L', '', '0', '1458285644', '0', '0');
INSERT INTO `sr_area` VALUES ('2210', '2203', '环江毛南族自治县', '2', '-0-2106-2203-', 'H', '', '0', '1458285645', '0', '0');
INSERT INTO `sr_area` VALUES ('2211', '2203', '巴马瑶族自治县', '2', '-0-2106-2203-', 'B', '', '0', '1458285646', '0', '0');
INSERT INTO `sr_area` VALUES ('2212', '2203', '都安瑶族自治县', '2', '-0-2106-2203-', 'D', '', '0', '1458285647', '0', '0');
INSERT INTO `sr_area` VALUES ('2213', '2203', '大化瑶族自治县', '2', '-0-2106-2203-', 'D', '', '0', '1458285648', '0', '0');
INSERT INTO `sr_area` VALUES ('2214', '2203', '宜州市', '2', '-0-2106-2203-', 'Y', '', '0', '1458285649', '0', '0');
INSERT INTO `sr_area` VALUES ('2215', '2106', '来宾市', '1', '-0-2106-', 'L', '', '0', '1458285650', '0', '0');
INSERT INTO `sr_area` VALUES ('2216', '2215', '兴宾区', '2', '-0-2106-2215-', 'X', '', '0', '1458285651', '0', '0');
INSERT INTO `sr_area` VALUES ('2217', '2215', '忻城县', '2', '-0-2106-2215-', 'X', '', '0', '1458285652', '0', '0');
INSERT INTO `sr_area` VALUES ('2218', '2215', '象州县', '2', '-0-2106-2215-', 'X', '', '0', '1458285653', '0', '0');
INSERT INTO `sr_area` VALUES ('2219', '2215', '武宣县', '2', '-0-2106-2215-', 'W', '', '0', '1458285654', '0', '0');
INSERT INTO `sr_area` VALUES ('2220', '2215', '金秀瑶族自治县', '2', '-0-2106-2215-', 'J', '', '0', '1458285655', '0', '0');
INSERT INTO `sr_area` VALUES ('2221', '2215', '合山市', '2', '-0-2106-2215-', 'H', '', '0', '1458285656', '0', '0');
INSERT INTO `sr_area` VALUES ('2222', '2106', '崇左市', '1', '-0-2106-', 'C', '', '0', '1458285657', '0', '0');
INSERT INTO `sr_area` VALUES ('2223', '2222', '江洲区', '2', '-0-2106-2222-', 'J', '', '0', '1458285658', '0', '0');
INSERT INTO `sr_area` VALUES ('2224', '2222', '扶绥县', '2', '-0-2106-2222-', 'F', '', '0', '1458285659', '0', '0');
INSERT INTO `sr_area` VALUES ('2225', '2222', '宁明县', '2', '-0-2106-2222-', 'N', '', '0', '1458285660', '0', '0');
INSERT INTO `sr_area` VALUES ('2226', '2222', '龙州县', '2', '-0-2106-2222-', 'L', '', '0', '1458285661', '0', '0');
INSERT INTO `sr_area` VALUES ('2227', '2222', '大新县', '2', '-0-2106-2222-', 'D', '', '0', '1458285662', '0', '0');
INSERT INTO `sr_area` VALUES ('2228', '2222', '天等县', '2', '-0-2106-2222-', 'T', '', '0', '1458285663', '0', '0');
INSERT INTO `sr_area` VALUES ('2229', '2222', '凭祥市', '2', '-0-2106-2222-', 'P', '', '0', '1458285664', '0', '0');
INSERT INTO `sr_area` VALUES ('2230', '0', '海南', '0', '-0-', 'H', '华南', '0', '1458285665', '0', '0');
INSERT INTO `sr_area` VALUES ('2231', '2230', '海口市', '1', '-0-2230-', 'H', '', '0', '1458285666', '0', '0');
INSERT INTO `sr_area` VALUES ('2232', '2231', '秀英区', '2', '-0-2230-2231-', 'X', '', '0', '1458285667', '0', '0');
INSERT INTO `sr_area` VALUES ('2233', '2231', '龙华区', '2', '-0-2230-2231-', 'L', '', '0', '1458285668', '0', '0');
INSERT INTO `sr_area` VALUES ('2234', '2231', '琼山区', '2', '-0-2230-2231-', 'Q', '', '0', '1458285669', '0', '0');
INSERT INTO `sr_area` VALUES ('2235', '2231', '美兰区', '2', '-0-2230-2231-', 'M', '', '0', '1458285670', '0', '0');
INSERT INTO `sr_area` VALUES ('2236', '2230', '三亚市', '1', '-0-2230-', 'S', '', '0', '1458285671', '0', '0');
INSERT INTO `sr_area` VALUES ('2237', '2230', '省直辖县级行政单位', '1', '-0-2230-', 'S', '', '0', '1458285672', '0', '0');
INSERT INTO `sr_area` VALUES ('2238', '2237', '五指山市', '2', '-0-2230-2237-', 'W', '', '0', '1458285673', '0', '0');
INSERT INTO `sr_area` VALUES ('2239', '2237', '琼海市', '2', '-0-2230-2237-', 'Q', '', '0', '1458285674', '0', '0');
INSERT INTO `sr_area` VALUES ('2240', '2237', '儋州市', '2', '-0-2230-2237-', '', '', '0', '1458285675', '0', '0');
INSERT INTO `sr_area` VALUES ('2241', '2237', '文昌市', '2', '-0-2230-2237-', 'W', '', '0', '1458285676', '0', '0');
INSERT INTO `sr_area` VALUES ('2242', '2237', '万宁市', '2', '-0-2230-2237-', 'W', '', '0', '1458285677', '0', '0');
INSERT INTO `sr_area` VALUES ('2243', '2237', '东方市', '2', '-0-2230-2237-', 'D', '', '0', '1458285678', '0', '0');
INSERT INTO `sr_area` VALUES ('2244', '2237', '定安县', '2', '-0-2230-2237-', 'D', '', '0', '1458285679', '0', '0');
INSERT INTO `sr_area` VALUES ('2245', '2237', '屯昌县', '2', '-0-2230-2237-', 'T', '', '0', '1458285680', '0', '0');
INSERT INTO `sr_area` VALUES ('2246', '2237', '澄迈县', '2', '-0-2230-2237-', 'C', '', '0', '1458285681', '0', '0');
INSERT INTO `sr_area` VALUES ('2247', '2237', '临高县', '2', '-0-2230-2237-', 'L', '', '0', '1458285682', '0', '0');
INSERT INTO `sr_area` VALUES ('2248', '2237', '白沙黎族自治县', '2', '-0-2230-2237-', 'B', '', '0', '1458285683', '0', '0');
INSERT INTO `sr_area` VALUES ('2249', '2237', '昌江黎族自治县', '2', '-0-2230-2237-', 'C', '', '0', '1458285684', '0', '0');
INSERT INTO `sr_area` VALUES ('2250', '2237', '乐东黎族自治县', '2', '-0-2230-2237-', 'L', '', '0', '1458285685', '0', '0');
INSERT INTO `sr_area` VALUES ('2251', '2237', '陵水黎族自治县', '2', '-0-2230-2237-', 'L', '', '0', '1458285686', '0', '0');
INSERT INTO `sr_area` VALUES ('2252', '2237', '保亭黎族苗族自治县', '2', '-0-2230-2237-', 'B', '', '0', '1458285687', '0', '0');
INSERT INTO `sr_area` VALUES ('2253', '2237', '琼中黎族苗族自治县', '2', '-0-2230-2237-', 'Q', '', '0', '1458285688', '0', '0');
INSERT INTO `sr_area` VALUES ('2254', '2237', '西沙群岛', '2', '-0-2230-2237-', 'X', '', '0', '1458285689', '0', '0');
INSERT INTO `sr_area` VALUES ('2255', '2237', '南沙群岛', '2', '-0-2230-2237-', 'N', '', '0', '1458285690', '0', '0');
INSERT INTO `sr_area` VALUES ('2256', '2237', '中沙群岛的岛礁及其海域', '2', '-0-2230-2237-', 'Z', '', '0', '1458285691', '0', '0');
INSERT INTO `sr_area` VALUES ('2257', '0', '重庆市', '0', '-0-', 'Z', '西南', '0', '1458285692', '0', '0');
INSERT INTO `sr_area` VALUES ('2258', '2257', '重庆市', '1', '-0-2257-', 'Z', '', '0', '1458285693', '0', '0');
INSERT INTO `sr_area` VALUES ('2259', '2258', '万州区', '2', '-0-2257-2258-', 'W', '', '0', '1458285694', '0', '0');
INSERT INTO `sr_area` VALUES ('2260', '2258', '涪陵区', '2', '-0-2257-2258-', 'F', '', '0', '1458285695', '0', '0');
INSERT INTO `sr_area` VALUES ('2261', '2258', '渝中区', '2', '-0-2257-2258-', 'Y', '', '0', '1458285696', '0', '0');
INSERT INTO `sr_area` VALUES ('2262', '2258', '大渡口区', '2', '-0-2257-2258-', 'D', '', '0', '1458285697', '0', '0');
INSERT INTO `sr_area` VALUES ('2263', '2258', '江北区', '2', '-0-2257-2258-', 'J', '', '0', '1458285698', '0', '0');
INSERT INTO `sr_area` VALUES ('2264', '2258', '沙坪坝区', '2', '-0-2257-2258-', 'S', '', '0', '1458285699', '0', '0');
INSERT INTO `sr_area` VALUES ('2265', '2258', '九龙坡区', '2', '-0-2257-2258-', 'J', '', '0', '1458285700', '0', '0');
INSERT INTO `sr_area` VALUES ('2266', '2258', '南岸区', '2', '-0-2257-2258-', 'N', '', '0', '1458285701', '0', '0');
INSERT INTO `sr_area` VALUES ('2267', '2258', '北碚区', '2', '-0-2257-2258-', 'B', '', '0', '1458285702', '0', '0');
INSERT INTO `sr_area` VALUES ('2268', '2258', '万盛区', '2', '-0-2257-2258-', 'W', '', '0', '1458285703', '0', '0');
INSERT INTO `sr_area` VALUES ('2269', '2258', '双桥区', '2', '-0-2257-2258-', 'S', '', '0', '1458285704', '0', '0');
INSERT INTO `sr_area` VALUES ('2270', '2258', '渝北区', '2', '-0-2257-2258-', 'Y', '', '0', '1458285705', '0', '0');
INSERT INTO `sr_area` VALUES ('2271', '2258', '巴南区', '2', '-0-2257-2258-', 'B', '', '0', '1458285706', '0', '0');
INSERT INTO `sr_area` VALUES ('2272', '2258', '黔江区', '2', '-0-2257-2258-', 'Q', '', '0', '1458285707', '0', '0');
INSERT INTO `sr_area` VALUES ('2273', '2258', '长寿区', '2', '-0-2257-2258-', 'C', '', '0', '1458285708', '0', '0');
INSERT INTO `sr_area` VALUES ('2274', '2258', '江津区', '2', '-0-2257-2258-', 'J', '', '0', '1458285709', '0', '0');
INSERT INTO `sr_area` VALUES ('2275', '2258', '合川区', '2', '-0-2257-2258-', 'H', '', '0', '1458285710', '0', '0');
INSERT INTO `sr_area` VALUES ('2276', '2258', '永川区', '2', '-0-2257-2258-', 'Y', '', '0', '1458285711', '0', '0');
INSERT INTO `sr_area` VALUES ('2277', '2258', '南川区', '2', '-0-2257-2258-', 'N', '', '0', '1458285712', '0', '0');
INSERT INTO `sr_area` VALUES ('2278', '2258', '綦江县', '2', '-0-2257-2258-', '', '', '0', '1458285713', '0', '0');
INSERT INTO `sr_area` VALUES ('2279', '2258', '潼南县', '2', '-0-2257-2258-', '', '', '0', '1458285714', '0', '0');
INSERT INTO `sr_area` VALUES ('2280', '2258', '铜梁县', '2', '-0-2257-2258-', 'T', '', '0', '1458285715', '0', '0');
INSERT INTO `sr_area` VALUES ('2281', '2258', '大足县', '2', '-0-2257-2258-', 'D', '', '0', '1458285716', '0', '0');
INSERT INTO `sr_area` VALUES ('2282', '2258', '荣昌县', '2', '-0-2257-2258-', 'R', '', '0', '1458285717', '0', '0');
INSERT INTO `sr_area` VALUES ('2283', '2258', '璧山县', '2', '-0-2257-2258-', '', '', '0', '1458285718', '0', '0');
INSERT INTO `sr_area` VALUES ('2284', '2258', '梁平县', '2', '-0-2257-2258-', 'L', '', '0', '1458285719', '0', '0');
INSERT INTO `sr_area` VALUES ('2285', '2258', '城口县', '2', '-0-2257-2258-', 'C', '', '0', '1458285720', '0', '0');
INSERT INTO `sr_area` VALUES ('2286', '2258', '丰都县', '2', '-0-2257-2258-', 'F', '', '0', '1458285721', '0', '0');
INSERT INTO `sr_area` VALUES ('2287', '2258', '垫江县', '2', '-0-2257-2258-', 'D', '', '0', '1458285722', '0', '0');
INSERT INTO `sr_area` VALUES ('2288', '2258', '武隆县', '2', '-0-2257-2258-', 'W', '', '0', '1458285723', '0', '0');
INSERT INTO `sr_area` VALUES ('2289', '2258', '忠县', '2', '-0-2257-2258-', 'Z', '', '0', '1458285724', '0', '0');
INSERT INTO `sr_area` VALUES ('2290', '2258', '开县', '2', '-0-2257-2258-', 'K', '', '0', '1458285725', '0', '0');
INSERT INTO `sr_area` VALUES ('2291', '2258', '云阳县', '2', '-0-2257-2258-', 'Y', '', '0', '1458285726', '0', '0');
INSERT INTO `sr_area` VALUES ('2292', '2258', '奉节县', '2', '-0-2257-2258-', 'F', '', '0', '1458285727', '0', '0');
INSERT INTO `sr_area` VALUES ('2293', '2258', '巫山县', '2', '-0-2257-2258-', 'W', '', '0', '1458285728', '0', '0');
INSERT INTO `sr_area` VALUES ('2294', '2258', '巫溪县', '2', '-0-2257-2258-', 'W', '', '0', '1458285729', '0', '0');
INSERT INTO `sr_area` VALUES ('2295', '2258', '石柱土家族自治县', '2', '-0-2257-2258-', 'S', '', '0', '1458285730', '0', '0');
INSERT INTO `sr_area` VALUES ('2296', '2258', '秀山土家族苗族自治县', '2', '-0-2257-2258-', 'X', '', '0', '1458285731', '0', '0');
INSERT INTO `sr_area` VALUES ('2297', '2258', '酉阳土家族苗族自治县', '2', '-0-2257-2258-', 'Y', '', '0', '1458285732', '0', '0');
INSERT INTO `sr_area` VALUES ('2298', '2258', '彭水苗族土家族自治县', '2', '-0-2257-2258-', 'P', '', '0', '1458285733', '0', '0');
INSERT INTO `sr_area` VALUES ('2299', '0', '四川', '0', '-0-', 'S', '西南', '0', '1458285734', '0', '0');
INSERT INTO `sr_area` VALUES ('2300', '2299', '成都市', '1', '-0-2299-', 'C', '', '0', '1458285735', '0', '0');
INSERT INTO `sr_area` VALUES ('2301', '2300', '锦江区', '2', '-0-2299-2300-', 'J', '', '0', '1458285736', '0', '0');
INSERT INTO `sr_area` VALUES ('2302', '2300', '青羊区', '2', '-0-2299-2300-', 'Q', '', '0', '1458285737', '0', '0');
INSERT INTO `sr_area` VALUES ('2303', '2300', '金牛区', '2', '-0-2299-2300-', 'J', '', '0', '1458285738', '0', '0');
INSERT INTO `sr_area` VALUES ('2304', '2300', '武侯区', '2', '-0-2299-2300-', 'W', '', '0', '1458285739', '0', '0');
INSERT INTO `sr_area` VALUES ('2305', '2300', '成华区', '2', '-0-2299-2300-', 'C', '', '0', '1458285740', '0', '0');
INSERT INTO `sr_area` VALUES ('2306', '2300', '龙泉驿区', '2', '-0-2299-2300-', 'L', '', '0', '1458285741', '0', '0');
INSERT INTO `sr_area` VALUES ('2307', '2300', '青白江区', '2', '-0-2299-2300-', 'Q', '', '0', '1458285742', '0', '0');
INSERT INTO `sr_area` VALUES ('2308', '2300', '新都区', '2', '-0-2299-2300-', 'X', '', '0', '1458285743', '0', '0');
INSERT INTO `sr_area` VALUES ('2309', '2300', '温江区', '2', '-0-2299-2300-', 'W', '', '0', '1458285744', '0', '0');
INSERT INTO `sr_area` VALUES ('2310', '2300', '金堂县', '2', '-0-2299-2300-', 'J', '', '0', '1458285745', '0', '0');
INSERT INTO `sr_area` VALUES ('2311', '2300', '双流县', '2', '-0-2299-2300-', 'S', '', '0', '1458285746', '0', '0');
INSERT INTO `sr_area` VALUES ('2312', '2300', '郫县', '2', '-0-2299-2300-', '', '', '0', '1458285747', '0', '0');
INSERT INTO `sr_area` VALUES ('2313', '2300', '大邑县', '2', '-0-2299-2300-', 'D', '', '0', '1458285748', '0', '0');
INSERT INTO `sr_area` VALUES ('2314', '2300', '蒲江县', '2', '-0-2299-2300-', 'P', '', '0', '1458285749', '0', '0');
INSERT INTO `sr_area` VALUES ('2315', '2300', '新津县', '2', '-0-2299-2300-', 'X', '', '0', '1458285750', '0', '0');
INSERT INTO `sr_area` VALUES ('2316', '2300', '都江堰市', '2', '-0-2299-2300-', 'D', '', '0', '1458285751', '0', '0');
INSERT INTO `sr_area` VALUES ('2317', '2300', '彭州市', '2', '-0-2299-2300-', 'P', '', '0', '1458285752', '0', '0');
INSERT INTO `sr_area` VALUES ('2318', '2300', '邛崃市', '2', '-0-2299-2300-', '', '', '0', '1458285753', '0', '0');
INSERT INTO `sr_area` VALUES ('2319', '2300', '崇州市', '2', '-0-2299-2300-', 'C', '', '0', '1458285754', '0', '0');
INSERT INTO `sr_area` VALUES ('2320', '2299', '自贡市', '1', '-0-2299-', 'Z', '', '0', '1458285755', '0', '0');
INSERT INTO `sr_area` VALUES ('2321', '2320', '自流井区', '2', '-0-2299-2320-', 'Z', '', '0', '1458285756', '0', '0');
INSERT INTO `sr_area` VALUES ('2322', '2320', '贡井区', '2', '-0-2299-2320-', 'G', '', '0', '1458285757', '0', '0');
INSERT INTO `sr_area` VALUES ('2323', '2320', '大安区', '2', '-0-2299-2320-', 'D', '', '0', '1458285758', '0', '0');
INSERT INTO `sr_area` VALUES ('2324', '2320', '沿滩区', '2', '-0-2299-2320-', 'Y', '', '0', '1458285759', '0', '0');
INSERT INTO `sr_area` VALUES ('2325', '2320', '荣县', '2', '-0-2299-2320-', 'R', '', '0', '1458285760', '0', '0');
INSERT INTO `sr_area` VALUES ('2326', '2320', '富顺县', '2', '-0-2299-2320-', 'F', '', '0', '1458285761', '0', '0');
INSERT INTO `sr_area` VALUES ('2327', '2299', '攀枝花市', '1', '-0-2299-', 'P', '', '0', '1458285762', '0', '0');
INSERT INTO `sr_area` VALUES ('2328', '2327', '东区', '2', '-0-2299-2327-', 'D', '', '0', '1458285763', '0', '0');
INSERT INTO `sr_area` VALUES ('2329', '2327', '西区', '2', '-0-2299-2327-', 'X', '', '0', '1458285764', '0', '0');
INSERT INTO `sr_area` VALUES ('2330', '2327', '仁和区', '2', '-0-2299-2327-', 'R', '', '0', '1458285765', '0', '0');
INSERT INTO `sr_area` VALUES ('2331', '2327', '米易县', '2', '-0-2299-2327-', 'M', '', '0', '1458285766', '0', '0');
INSERT INTO `sr_area` VALUES ('2332', '2327', '盐边县', '2', '-0-2299-2327-', 'Y', '', '0', '1458285767', '0', '0');
INSERT INTO `sr_area` VALUES ('2333', '2299', '泸州市', '1', '-0-2299-', 'L', '', '0', '1458285768', '0', '0');
INSERT INTO `sr_area` VALUES ('2334', '2333', '江阳区', '2', '-0-2299-2333-', 'J', '', '0', '1458285769', '0', '0');
INSERT INTO `sr_area` VALUES ('2335', '2333', '纳溪区', '2', '-0-2299-2333-', 'N', '', '0', '1458285770', '0', '0');
INSERT INTO `sr_area` VALUES ('2336', '2333', '龙马潭区', '2', '-0-2299-2333-', 'L', '', '0', '1458285771', '0', '0');
INSERT INTO `sr_area` VALUES ('2337', '2333', '泸县', '2', '-0-2299-2333-', '', '', '0', '1458285772', '0', '0');
INSERT INTO `sr_area` VALUES ('2338', '2333', '合江县', '2', '-0-2299-2333-', 'H', '', '0', '1458285773', '0', '0');
INSERT INTO `sr_area` VALUES ('2339', '2333', '叙永县', '2', '-0-2299-2333-', 'X', '', '0', '1458285774', '0', '0');
INSERT INTO `sr_area` VALUES ('2340', '2333', '古蔺县', '2', '-0-2299-2333-', 'G', '', '0', '1458285775', '0', '0');
INSERT INTO `sr_area` VALUES ('2341', '2299', '德阳市', '1', '-0-2299-', 'D', '', '0', '1458285776', '0', '0');
INSERT INTO `sr_area` VALUES ('2342', '2341', '旌阳区', '2', '-0-2299-2341-', '', '', '0', '1458285777', '0', '0');
INSERT INTO `sr_area` VALUES ('2343', '2341', '中江县', '2', '-0-2299-2341-', 'Z', '', '0', '1458285778', '0', '0');
INSERT INTO `sr_area` VALUES ('2344', '2341', '罗江县', '2', '-0-2299-2341-', 'L', '', '0', '1458285779', '0', '0');
INSERT INTO `sr_area` VALUES ('2345', '2341', '广汉市', '2', '-0-2299-2341-', 'G', '', '0', '1458285780', '0', '0');
INSERT INTO `sr_area` VALUES ('2346', '2341', '什邡市', '2', '-0-2299-2341-', 'S', '', '0', '1458285781', '0', '0');
INSERT INTO `sr_area` VALUES ('2347', '2341', '绵竹市', '2', '-0-2299-2341-', 'M', '', '0', '1458285782', '0', '0');
INSERT INTO `sr_area` VALUES ('2348', '2299', '绵阳市', '1', '-0-2299-', 'M', '', '0', '1458285783', '0', '0');
INSERT INTO `sr_area` VALUES ('2349', '2348', '涪城区', '2', '-0-2299-2348-', 'F', '', '0', '1458285784', '0', '0');
INSERT INTO `sr_area` VALUES ('2350', '2348', '游仙区', '2', '-0-2299-2348-', 'Y', '', '0', '1458285785', '0', '0');
INSERT INTO `sr_area` VALUES ('2351', '2348', '三台县', '2', '-0-2299-2348-', 'S', '', '0', '1458285786', '0', '0');
INSERT INTO `sr_area` VALUES ('2352', '2348', '盐亭县', '2', '-0-2299-2348-', 'Y', '', '0', '1458285787', '0', '0');
INSERT INTO `sr_area` VALUES ('2353', '2348', '安县', '2', '-0-2299-2348-', 'A', '', '0', '1458285788', '0', '0');
INSERT INTO `sr_area` VALUES ('2354', '2348', '梓潼县', '2', '-0-2299-2348-', '', '', '0', '1458285789', '0', '0');
INSERT INTO `sr_area` VALUES ('2355', '2348', '北川羌族自治县', '2', '-0-2299-2348-', 'B', '', '0', '1458285790', '0', '0');
INSERT INTO `sr_area` VALUES ('2356', '2348', '平武县', '2', '-0-2299-2348-', 'P', '', '0', '1458285791', '0', '0');
INSERT INTO `sr_area` VALUES ('2357', '2348', '江油市', '2', '-0-2299-2348-', 'J', '', '0', '1458285792', '0', '0');
INSERT INTO `sr_area` VALUES ('2358', '2299', '广元市', '1', '-0-2299-', 'G', '', '0', '1458285793', '0', '0');
INSERT INTO `sr_area` VALUES ('2359', '2358', '市中区', '2', '-0-2299-2358-', 'S', '', '0', '1458285794', '0', '0');
INSERT INTO `sr_area` VALUES ('2360', '2358', '元坝区', '2', '-0-2299-2358-', 'Y', '', '0', '1458285795', '0', '0');
INSERT INTO `sr_area` VALUES ('2361', '2358', '朝天区', '2', '-0-2299-2358-', 'C', '', '0', '1458285796', '0', '0');
INSERT INTO `sr_area` VALUES ('2362', '2358', '旺苍县', '2', '-0-2299-2358-', 'W', '', '0', '1458285797', '0', '0');
INSERT INTO `sr_area` VALUES ('2363', '2358', '青川县', '2', '-0-2299-2358-', 'Q', '', '0', '1458285798', '0', '0');
INSERT INTO `sr_area` VALUES ('2364', '2358', '剑阁县', '2', '-0-2299-2358-', 'J', '', '0', '1458285799', '0', '0');
INSERT INTO `sr_area` VALUES ('2365', '2358', '苍溪县', '2', '-0-2299-2358-', 'C', '', '0', '1458285800', '0', '0');
INSERT INTO `sr_area` VALUES ('2366', '2299', '遂宁市', '1', '-0-2299-', 'S', '', '0', '1458285801', '0', '0');
INSERT INTO `sr_area` VALUES ('2367', '2366', '船山区', '2', '-0-2299-2366-', 'C', '', '0', '1458285802', '0', '0');
INSERT INTO `sr_area` VALUES ('2368', '2366', '安居区', '2', '-0-2299-2366-', 'A', '', '0', '1458285803', '0', '0');
INSERT INTO `sr_area` VALUES ('2369', '2366', '蓬溪县', '2', '-0-2299-2366-', 'P', '', '0', '1458285804', '0', '0');
INSERT INTO `sr_area` VALUES ('2370', '2366', '射洪县', '2', '-0-2299-2366-', 'S', '', '0', '1458285805', '0', '0');
INSERT INTO `sr_area` VALUES ('2371', '2366', '大英县', '2', '-0-2299-2366-', 'D', '', '0', '1458285806', '0', '0');
INSERT INTO `sr_area` VALUES ('2372', '2299', '内江市', '1', '-0-2299-', 'N', '', '0', '1458285807', '0', '0');
INSERT INTO `sr_area` VALUES ('2373', '2372', '市中区', '2', '-0-2299-2372-', 'S', '', '0', '1458285808', '0', '0');
INSERT INTO `sr_area` VALUES ('2374', '2372', '东兴区', '2', '-0-2299-2372-', 'D', '', '0', '1458285809', '0', '0');
INSERT INTO `sr_area` VALUES ('2375', '2372', '威远县', '2', '-0-2299-2372-', 'W', '', '0', '1458285810', '0', '0');
INSERT INTO `sr_area` VALUES ('2376', '2372', '资中县', '2', '-0-2299-2372-', 'Z', '', '0', '1458285811', '0', '0');
INSERT INTO `sr_area` VALUES ('2377', '2372', '隆昌县', '2', '-0-2299-2372-', 'L', '', '0', '1458285812', '0', '0');
INSERT INTO `sr_area` VALUES ('2378', '2299', '乐山市', '1', '-0-2299-', 'L', '', '0', '1458285813', '0', '0');
INSERT INTO `sr_area` VALUES ('2379', '2378', '市中区', '2', '-0-2299-2378-', 'S', '', '0', '1458285814', '0', '0');
INSERT INTO `sr_area` VALUES ('2380', '2378', '沙湾区', '2', '-0-2299-2378-', 'S', '', '0', '1458285815', '0', '0');
INSERT INTO `sr_area` VALUES ('2381', '2378', '五通桥区', '2', '-0-2299-2378-', 'W', '', '0', '1458285816', '0', '0');
INSERT INTO `sr_area` VALUES ('2382', '2378', '金口河区', '2', '-0-2299-2378-', 'J', '', '0', '1458285817', '0', '0');
INSERT INTO `sr_area` VALUES ('2383', '2378', '犍为县', '2', '-0-2299-2378-', '', '', '0', '1458285818', '0', '0');
INSERT INTO `sr_area` VALUES ('2384', '2378', '井研县', '2', '-0-2299-2378-', 'J', '', '0', '1458285819', '0', '0');
INSERT INTO `sr_area` VALUES ('2385', '2378', '夹江县', '2', '-0-2299-2378-', 'J', '', '0', '1458285820', '0', '0');
INSERT INTO `sr_area` VALUES ('2386', '2378', '沐川县', '2', '-0-2299-2378-', '', '', '0', '1458285821', '0', '0');
INSERT INTO `sr_area` VALUES ('2387', '2378', '峨边彝族自治县', '2', '-0-2299-2378-', 'E', '', '0', '1458285822', '0', '0');
INSERT INTO `sr_area` VALUES ('2388', '2378', '马边彝族自治县', '2', '-0-2299-2378-', 'M', '', '0', '1458285823', '0', '0');
INSERT INTO `sr_area` VALUES ('2389', '2378', '峨眉山市', '2', '-0-2299-2378-', 'E', '', '0', '1458285824', '0', '0');
INSERT INTO `sr_area` VALUES ('2390', '2299', '南充市', '1', '-0-2299-', 'N', '', '0', '1458285825', '0', '0');
INSERT INTO `sr_area` VALUES ('2391', '2390', '顺庆区', '2', '-0-2299-2390-', 'S', '', '0', '1458285826', '0', '0');
INSERT INTO `sr_area` VALUES ('2392', '2390', '高坪区', '2', '-0-2299-2390-', 'G', '', '0', '1458285827', '0', '0');
INSERT INTO `sr_area` VALUES ('2393', '2390', '嘉陵区', '2', '-0-2299-2390-', 'J', '', '0', '1458285828', '0', '0');
INSERT INTO `sr_area` VALUES ('2394', '2390', '南部县', '2', '-0-2299-2390-', 'N', '', '0', '1458285829', '0', '0');
INSERT INTO `sr_area` VALUES ('2395', '2390', '营山县', '2', '-0-2299-2390-', 'Y', '', '0', '1458285830', '0', '0');
INSERT INTO `sr_area` VALUES ('2396', '2390', '蓬安县', '2', '-0-2299-2390-', 'P', '', '0', '1458285831', '0', '0');
INSERT INTO `sr_area` VALUES ('2397', '2390', '仪陇县', '2', '-0-2299-2390-', 'Y', '', '0', '1458285832', '0', '0');
INSERT INTO `sr_area` VALUES ('2398', '2390', '西充县', '2', '-0-2299-2390-', 'X', '', '0', '1458285833', '0', '0');
INSERT INTO `sr_area` VALUES ('2399', '2390', '阆中市', '2', '-0-2299-2390-', '', '', '0', '1458285834', '0', '0');
INSERT INTO `sr_area` VALUES ('2400', '2299', '眉山市', '1', '-0-2299-', 'M', '', '0', '1458285835', '0', '0');
INSERT INTO `sr_area` VALUES ('2401', '2400', '东坡区', '2', '-0-2299-2400-', 'D', '', '0', '1458285836', '0', '0');
INSERT INTO `sr_area` VALUES ('2402', '2400', '仁寿县', '2', '-0-2299-2400-', 'R', '', '0', '1458285837', '0', '0');
INSERT INTO `sr_area` VALUES ('2403', '2400', '彭山县', '2', '-0-2299-2400-', 'P', '', '0', '1458285838', '0', '0');
INSERT INTO `sr_area` VALUES ('2404', '2400', '洪雅县', '2', '-0-2299-2400-', 'H', '', '0', '1458285839', '0', '0');
INSERT INTO `sr_area` VALUES ('2405', '2400', '丹棱县', '2', '-0-2299-2400-', 'D', '', '0', '1458285840', '0', '0');
INSERT INTO `sr_area` VALUES ('2406', '2400', '青神县', '2', '-0-2299-2400-', 'Q', '', '0', '1458285841', '0', '0');
INSERT INTO `sr_area` VALUES ('2407', '2299', '宜宾市', '1', '-0-2299-', 'Y', '', '0', '1458285842', '0', '0');
INSERT INTO `sr_area` VALUES ('2408', '2407', '翠屏区', '2', '-0-2299-2407-', 'C', '', '0', '1458285843', '0', '0');
INSERT INTO `sr_area` VALUES ('2409', '2407', '宜宾县', '2', '-0-2299-2407-', 'Y', '', '0', '1458285844', '0', '0');
INSERT INTO `sr_area` VALUES ('2410', '2407', '南溪县', '2', '-0-2299-2407-', 'N', '', '0', '1458285845', '0', '0');
INSERT INTO `sr_area` VALUES ('2411', '2407', '江安县', '2', '-0-2299-2407-', 'J', '', '0', '1458285846', '0', '0');
INSERT INTO `sr_area` VALUES ('2412', '2407', '长宁县', '2', '-0-2299-2407-', 'C', '', '0', '1458285847', '0', '0');
INSERT INTO `sr_area` VALUES ('2413', '2407', '高县', '2', '-0-2299-2407-', 'G', '', '0', '1458285848', '0', '0');
INSERT INTO `sr_area` VALUES ('2414', '2407', '珙县', '2', '-0-2299-2407-', '', '', '0', '1458285849', '0', '0');
INSERT INTO `sr_area` VALUES ('2415', '2407', '筠连县', '2', '-0-2299-2407-', '', '', '0', '1458285850', '0', '0');
INSERT INTO `sr_area` VALUES ('2416', '2407', '兴文县', '2', '-0-2299-2407-', 'X', '', '0', '1458285851', '0', '0');
INSERT INTO `sr_area` VALUES ('2417', '2407', '屏山县', '2', '-0-2299-2407-', 'P', '', '0', '1458285852', '0', '0');
INSERT INTO `sr_area` VALUES ('2418', '2299', '广安市', '1', '-0-2299-', 'G', '', '0', '1458285853', '0', '0');
INSERT INTO `sr_area` VALUES ('2419', '2418', '广安区', '2', '-0-2299-2418-', 'G', '', '0', '1458285854', '0', '0');
INSERT INTO `sr_area` VALUES ('2420', '2418', '岳池县', '2', '-0-2299-2418-', 'Y', '', '0', '1458285855', '0', '0');
INSERT INTO `sr_area` VALUES ('2421', '2418', '武胜县', '2', '-0-2299-2418-', 'W', '', '0', '1458285856', '0', '0');
INSERT INTO `sr_area` VALUES ('2422', '2418', '邻水县', '2', '-0-2299-2418-', 'L', '', '0', '1458285857', '0', '0');
INSERT INTO `sr_area` VALUES ('2423', '2418', '华蓥市', '2', '-0-2299-2418-', 'H', '', '0', '1458285858', '0', '0');
INSERT INTO `sr_area` VALUES ('2424', '2299', '达州市', '1', '-0-2299-', 'D', '', '0', '1458285859', '0', '0');
INSERT INTO `sr_area` VALUES ('2425', '2424', '通川区', '2', '-0-2299-2424-', 'T', '', '0', '1458285860', '0', '0');
INSERT INTO `sr_area` VALUES ('2426', '2424', '达县', '2', '-0-2299-2424-', 'D', '', '0', '1458285861', '0', '0');
INSERT INTO `sr_area` VALUES ('2427', '2424', '宣汉县', '2', '-0-2299-2424-', 'X', '', '0', '1458285862', '0', '0');
INSERT INTO `sr_area` VALUES ('2428', '2424', '开江县', '2', '-0-2299-2424-', 'K', '', '0', '1458285863', '0', '0');
INSERT INTO `sr_area` VALUES ('2429', '2424', '大竹县', '2', '-0-2299-2424-', 'D', '', '0', '1458285864', '0', '0');
INSERT INTO `sr_area` VALUES ('2430', '2424', '渠县', '2', '-0-2299-2424-', 'Q', '', '0', '1458285865', '0', '0');
INSERT INTO `sr_area` VALUES ('2431', '2424', '万源市', '2', '-0-2299-2424-', 'W', '', '0', '1458285866', '0', '0');
INSERT INTO `sr_area` VALUES ('2432', '2299', '雅安市', '1', '-0-2299-', 'Y', '', '0', '1458285867', '0', '0');
INSERT INTO `sr_area` VALUES ('2433', '2432', '雨城区', '2', '-0-2299-2432-', 'Y', '', '0', '1458285868', '0', '0');
INSERT INTO `sr_area` VALUES ('2434', '2432', '名山县', '2', '-0-2299-2432-', 'M', '', '0', '1458285869', '0', '0');
INSERT INTO `sr_area` VALUES ('2435', '2432', '荥经县', '2', '-0-2299-2432-', '', '', '0', '1458285870', '0', '0');
INSERT INTO `sr_area` VALUES ('2436', '2432', '汉源县', '2', '-0-2299-2432-', 'H', '', '0', '1458285871', '0', '0');
INSERT INTO `sr_area` VALUES ('2437', '2432', '石棉县', '2', '-0-2299-2432-', 'S', '', '0', '1458285872', '0', '0');
INSERT INTO `sr_area` VALUES ('2438', '2432', '天全县', '2', '-0-2299-2432-', 'T', '', '0', '1458285873', '0', '0');
INSERT INTO `sr_area` VALUES ('2439', '2432', '芦山县', '2', '-0-2299-2432-', 'L', '', '0', '1458285874', '0', '0');
INSERT INTO `sr_area` VALUES ('2440', '2432', '宝兴县', '2', '-0-2299-2432-', 'B', '', '0', '1458285875', '0', '0');
INSERT INTO `sr_area` VALUES ('2441', '2299', '巴中市', '1', '-0-2299-', 'B', '', '0', '1458285876', '0', '0');
INSERT INTO `sr_area` VALUES ('2442', '2441', '巴州区', '2', '-0-2299-2441-', 'B', '', '0', '1458285877', '0', '0');
INSERT INTO `sr_area` VALUES ('2443', '2441', '通江县', '2', '-0-2299-2441-', 'T', '', '0', '1458285878', '0', '0');
INSERT INTO `sr_area` VALUES ('2444', '2441', '南江县', '2', '-0-2299-2441-', 'N', '', '0', '1458285879', '0', '0');
INSERT INTO `sr_area` VALUES ('2445', '2441', '平昌县', '2', '-0-2299-2441-', 'P', '', '0', '1458285880', '0', '0');
INSERT INTO `sr_area` VALUES ('2446', '2299', '资阳市', '1', '-0-2299-', 'Z', '', '0', '1458285881', '0', '0');
INSERT INTO `sr_area` VALUES ('2447', '2446', '雁江区', '2', '-0-2299-2446-', 'Y', '', '0', '1458285882', '0', '0');
INSERT INTO `sr_area` VALUES ('2448', '2446', '安岳县', '2', '-0-2299-2446-', 'A', '', '0', '1458285883', '0', '0');
INSERT INTO `sr_area` VALUES ('2449', '2446', '乐至县', '2', '-0-2299-2446-', 'L', '', '0', '1458285884', '0', '0');
INSERT INTO `sr_area` VALUES ('2450', '2446', '简阳市', '2', '-0-2299-2446-', 'J', '', '0', '1458285885', '0', '0');
INSERT INTO `sr_area` VALUES ('2451', '2299', '阿坝藏族羌族自治州', '1', '-0-2299-', 'A', '', '0', '1458285886', '0', '0');
INSERT INTO `sr_area` VALUES ('2452', '2451', '汶川县', '2', '-0-2299-2451-', '', '', '0', '1458285887', '0', '0');
INSERT INTO `sr_area` VALUES ('2453', '2451', '理县', '2', '-0-2299-2451-', 'L', '', '0', '1458285888', '0', '0');
INSERT INTO `sr_area` VALUES ('2454', '2451', '茂县', '2', '-0-2299-2451-', 'M', '', '0', '1458285889', '0', '0');
INSERT INTO `sr_area` VALUES ('2455', '2451', '松潘县', '2', '-0-2299-2451-', 'S', '', '0', '1458285890', '0', '0');
INSERT INTO `sr_area` VALUES ('2456', '2451', '九寨沟县', '2', '-0-2299-2451-', 'J', '', '0', '1458285891', '0', '0');
INSERT INTO `sr_area` VALUES ('2457', '2451', '金川县', '2', '-0-2299-2451-', 'J', '', '0', '1458285892', '0', '0');
INSERT INTO `sr_area` VALUES ('2458', '2451', '小金县', '2', '-0-2299-2451-', 'X', '', '0', '1458285893', '0', '0');
INSERT INTO `sr_area` VALUES ('2459', '2451', '黑水县', '2', '-0-2299-2451-', 'H', '', '0', '1458285894', '0', '0');
INSERT INTO `sr_area` VALUES ('2460', '2451', '马尔康县', '2', '-0-2299-2451-', 'M', '', '0', '1458285895', '0', '0');
INSERT INTO `sr_area` VALUES ('2461', '2451', '壤塘县', '2', '-0-2299-2451-', 'R', '', '0', '1458285896', '0', '0');
INSERT INTO `sr_area` VALUES ('2462', '2451', '阿坝县', '2', '-0-2299-2451-', 'A', '', '0', '1458285897', '0', '0');
INSERT INTO `sr_area` VALUES ('2463', '2451', '若尔盖县', '2', '-0-2299-2451-', 'R', '', '0', '1458285898', '0', '0');
INSERT INTO `sr_area` VALUES ('2464', '2451', '红原县', '2', '-0-2299-2451-', 'H', '', '0', '1458285899', '0', '0');
INSERT INTO `sr_area` VALUES ('2465', '2299', '甘孜藏族自治州', '1', '-0-2299-', 'G', '', '0', '1458285900', '0', '0');
INSERT INTO `sr_area` VALUES ('2466', '2465', '康定县', '2', '-0-2299-2465-', 'K', '', '0', '1458285901', '0', '0');
INSERT INTO `sr_area` VALUES ('2467', '2465', '泸定县', '2', '-0-2299-2465-', '', '', '0', '1458285902', '0', '0');
INSERT INTO `sr_area` VALUES ('2468', '2465', '丹巴县', '2', '-0-2299-2465-', 'D', '', '0', '1458285903', '0', '0');
INSERT INTO `sr_area` VALUES ('2469', '2465', '九龙县', '2', '-0-2299-2465-', 'J', '', '0', '1458285904', '0', '0');
INSERT INTO `sr_area` VALUES ('2470', '2465', '雅江县', '2', '-0-2299-2465-', 'Y', '', '0', '1458285905', '0', '0');
INSERT INTO `sr_area` VALUES ('2471', '2465', '道孚县', '2', '-0-2299-2465-', 'D', '', '0', '1458285906', '0', '0');
INSERT INTO `sr_area` VALUES ('2472', '2465', '炉霍县', '2', '-0-2299-2465-', 'L', '', '0', '1458285907', '0', '0');
INSERT INTO `sr_area` VALUES ('2473', '2465', '甘孜县', '2', '-0-2299-2465-', 'G', '', '0', '1458285908', '0', '0');
INSERT INTO `sr_area` VALUES ('2474', '2465', '新龙县', '2', '-0-2299-2465-', 'X', '', '0', '1458285909', '0', '0');
INSERT INTO `sr_area` VALUES ('2475', '2465', '德格县', '2', '-0-2299-2465-', 'D', '', '0', '1458285910', '0', '0');
INSERT INTO `sr_area` VALUES ('2476', '2465', '白玉县', '2', '-0-2299-2465-', 'B', '', '0', '1458285911', '0', '0');
INSERT INTO `sr_area` VALUES ('2477', '2465', '石渠县', '2', '-0-2299-2465-', 'S', '', '0', '1458285912', '0', '0');
INSERT INTO `sr_area` VALUES ('2478', '2465', '色达县', '2', '-0-2299-2465-', 'S', '', '0', '1458285913', '0', '0');
INSERT INTO `sr_area` VALUES ('2479', '2465', '理塘县', '2', '-0-2299-2465-', 'L', '', '0', '1458285914', '0', '0');
INSERT INTO `sr_area` VALUES ('2480', '2465', '巴塘县', '2', '-0-2299-2465-', 'B', '', '0', '1458285915', '0', '0');
INSERT INTO `sr_area` VALUES ('2481', '2465', '乡城县', '2', '-0-2299-2465-', 'X', '', '0', '1458285916', '0', '0');
INSERT INTO `sr_area` VALUES ('2482', '2465', '稻城县', '2', '-0-2299-2465-', 'D', '', '0', '1458285917', '0', '0');
INSERT INTO `sr_area` VALUES ('2483', '2465', '得荣县', '2', '-0-2299-2465-', 'D', '', '0', '1458285918', '0', '0');
INSERT INTO `sr_area` VALUES ('2484', '2299', '凉山彝族自治州', '1', '-0-2299-', 'L', '', '0', '1458285919', '0', '0');
INSERT INTO `sr_area` VALUES ('2485', '2484', '西昌市', '2', '-0-2299-2484-', 'X', '', '0', '1458285920', '0', '0');
INSERT INTO `sr_area` VALUES ('2486', '2484', '木里藏族自治县', '2', '-0-2299-2484-', 'M', '', '0', '1458285921', '0', '0');
INSERT INTO `sr_area` VALUES ('2487', '2484', '盐源县', '2', '-0-2299-2484-', 'Y', '', '0', '1458285922', '0', '0');
INSERT INTO `sr_area` VALUES ('2488', '2484', '德昌县', '2', '-0-2299-2484-', 'D', '', '0', '1458285923', '0', '0');
INSERT INTO `sr_area` VALUES ('2489', '2484', '会理县', '2', '-0-2299-2484-', 'H', '', '0', '1458285924', '0', '0');
INSERT INTO `sr_area` VALUES ('2490', '2484', '会东县', '2', '-0-2299-2484-', 'H', '', '0', '1458285925', '0', '0');
INSERT INTO `sr_area` VALUES ('2491', '2484', '宁南县', '2', '-0-2299-2484-', 'N', '', '0', '1458285926', '0', '0');
INSERT INTO `sr_area` VALUES ('2492', '2484', '普格县', '2', '-0-2299-2484-', 'P', '', '0', '1458285927', '0', '0');
INSERT INTO `sr_area` VALUES ('2493', '2484', '布拖县', '2', '-0-2299-2484-', 'B', '', '0', '1458285928', '0', '0');
INSERT INTO `sr_area` VALUES ('2494', '2484', '金阳县', '2', '-0-2299-2484-', 'J', '', '0', '1458285929', '0', '0');
INSERT INTO `sr_area` VALUES ('2495', '2484', '昭觉县', '2', '-0-2299-2484-', 'Z', '', '0', '1458285930', '0', '0');
INSERT INTO `sr_area` VALUES ('2496', '2484', '喜德县', '2', '-0-2299-2484-', 'X', '', '0', '1458285931', '0', '0');
INSERT INTO `sr_area` VALUES ('2497', '2484', '冕宁县', '2', '-0-2299-2484-', 'M', '', '0', '1458285932', '0', '0');
INSERT INTO `sr_area` VALUES ('2498', '2484', '越西县', '2', '-0-2299-2484-', 'Y', '', '0', '1458285933', '0', '0');
INSERT INTO `sr_area` VALUES ('2499', '2484', '甘洛县', '2', '-0-2299-2484-', 'G', '', '0', '1458285934', '0', '0');
INSERT INTO `sr_area` VALUES ('2500', '2484', '美姑县', '2', '-0-2299-2484-', 'M', '', '0', '1458285935', '0', '0');
INSERT INTO `sr_area` VALUES ('2501', '2484', '雷波县', '2', '-0-2299-2484-', 'L', '', '0', '1458285936', '0', '0');
INSERT INTO `sr_area` VALUES ('2502', '0', '贵州', '0', '-0-', 'G', '西南', '0', '1458285937', '0', '0');
INSERT INTO `sr_area` VALUES ('2503', '2502', '贵阳市', '1', '-0-2502-', 'G', '', '0', '1458285938', '0', '0');
INSERT INTO `sr_area` VALUES ('2504', '2503', '南明区', '2', '-0-2502-2503-', 'N', '', '0', '1458285939', '0', '0');
INSERT INTO `sr_area` VALUES ('2505', '2503', '云岩区', '2', '-0-2502-2503-', 'Y', '', '0', '1458285940', '0', '0');
INSERT INTO `sr_area` VALUES ('2506', '2503', '花溪区', '2', '-0-2502-2503-', 'H', '', '0', '1458285941', '0', '0');
INSERT INTO `sr_area` VALUES ('2507', '2503', '乌当区', '2', '-0-2502-2503-', 'W', '', '0', '1458285942', '0', '0');
INSERT INTO `sr_area` VALUES ('2508', '2503', '白云区', '2', '-0-2502-2503-', 'B', '', '0', '1458285943', '0', '0');
INSERT INTO `sr_area` VALUES ('2509', '2503', '小河区', '2', '-0-2502-2503-', 'X', '', '0', '1458285944', '0', '0');
INSERT INTO `sr_area` VALUES ('2510', '2503', '开阳县', '2', '-0-2502-2503-', 'K', '', '0', '1458285945', '0', '0');
INSERT INTO `sr_area` VALUES ('2511', '2503', '息烽县', '2', '-0-2502-2503-', 'X', '', '0', '1458285946', '0', '0');
INSERT INTO `sr_area` VALUES ('2512', '2503', '修文县', '2', '-0-2502-2503-', 'X', '', '0', '1458285947', '0', '0');
INSERT INTO `sr_area` VALUES ('2513', '2503', '清镇市', '2', '-0-2502-2503-', 'Q', '', '0', '1458285948', '0', '0');
INSERT INTO `sr_area` VALUES ('2514', '2502', '六盘水市', '1', '-0-2502-', 'L', '', '0', '1458285949', '0', '0');
INSERT INTO `sr_area` VALUES ('2515', '2514', '钟山区', '2', '-0-2502-2514-', 'Z', '', '0', '1458285950', '0', '0');
INSERT INTO `sr_area` VALUES ('2516', '2514', '六枝特区', '2', '-0-2502-2514-', 'L', '', '0', '1458285951', '0', '0');
INSERT INTO `sr_area` VALUES ('2517', '2514', '水城县', '2', '-0-2502-2514-', 'S', '', '0', '1458285952', '0', '0');
INSERT INTO `sr_area` VALUES ('2518', '2514', '盘县', '2', '-0-2502-2514-', 'P', '', '0', '1458285953', '0', '0');
INSERT INTO `sr_area` VALUES ('2519', '2502', '遵义市', '1', '-0-2502-', 'Z', '', '0', '1458285954', '0', '0');
INSERT INTO `sr_area` VALUES ('2520', '2519', '红花岗区', '2', '-0-2502-2519-', 'H', '', '0', '1458285955', '0', '0');
INSERT INTO `sr_area` VALUES ('2521', '2519', '汇川区', '2', '-0-2502-2519-', 'H', '', '0', '1458285956', '0', '0');
INSERT INTO `sr_area` VALUES ('2522', '2519', '遵义县', '2', '-0-2502-2519-', 'Z', '', '0', '1458285957', '0', '0');
INSERT INTO `sr_area` VALUES ('2523', '2519', '桐梓县', '2', '-0-2502-2519-', 'T', '', '0', '1458285958', '0', '0');
INSERT INTO `sr_area` VALUES ('2524', '2519', '绥阳县', '2', '-0-2502-2519-', 'S', '', '0', '1458285959', '0', '0');
INSERT INTO `sr_area` VALUES ('2525', '2519', '正安县', '2', '-0-2502-2519-', 'Z', '', '0', '1458285960', '0', '0');
INSERT INTO `sr_area` VALUES ('2526', '2519', '道真仡佬族苗族自治县', '2', '-0-2502-2519-', 'D', '', '0', '1458285961', '0', '0');
INSERT INTO `sr_area` VALUES ('2527', '2519', '务川仡佬族苗族自治县', '2', '-0-2502-2519-', 'W', '', '0', '1458285962', '0', '0');
INSERT INTO `sr_area` VALUES ('2528', '2519', '凤冈县', '2', '-0-2502-2519-', 'F', '', '0', '1458285963', '0', '0');
INSERT INTO `sr_area` VALUES ('2529', '2519', '湄潭县', '2', '-0-2502-2519-', '', '', '0', '1458285964', '0', '0');
INSERT INTO `sr_area` VALUES ('2530', '2519', '余庆县', '2', '-0-2502-2519-', 'Y', '', '0', '1458285965', '0', '0');
INSERT INTO `sr_area` VALUES ('2531', '2519', '习水县', '2', '-0-2502-2519-', 'X', '', '0', '1458285966', '0', '0');
INSERT INTO `sr_area` VALUES ('2532', '2519', '赤水市', '2', '-0-2502-2519-', 'C', '', '0', '1458285967', '0', '0');
INSERT INTO `sr_area` VALUES ('2533', '2519', '仁怀市', '2', '-0-2502-2519-', 'R', '', '0', '1458285968', '0', '0');
INSERT INTO `sr_area` VALUES ('2534', '2502', '安顺市', '1', '-0-2502-', 'A', '', '0', '1458285969', '0', '0');
INSERT INTO `sr_area` VALUES ('2535', '2534', '西秀区', '2', '-0-2502-2534-', 'X', '', '0', '1458285970', '0', '0');
INSERT INTO `sr_area` VALUES ('2536', '2534', '平坝县', '2', '-0-2502-2534-', 'P', '', '0', '1458285971', '0', '0');
INSERT INTO `sr_area` VALUES ('2537', '2534', '普定县', '2', '-0-2502-2534-', 'P', '', '0', '1458285972', '0', '0');
INSERT INTO `sr_area` VALUES ('2538', '2534', '镇宁布依族苗族自治县', '2', '-0-2502-2534-', 'Z', '', '0', '1458285973', '0', '0');
INSERT INTO `sr_area` VALUES ('2539', '2534', '关岭布依族苗族自治县', '2', '-0-2502-2534-', 'G', '', '0', '1458285974', '0', '0');
INSERT INTO `sr_area` VALUES ('2540', '2534', '紫云苗族布依族自治县', '2', '-0-2502-2534-', 'Z', '', '0', '1458285975', '0', '0');
INSERT INTO `sr_area` VALUES ('2541', '2502', '铜仁地区', '1', '-0-2502-', 'T', '', '0', '1458285976', '0', '0');
INSERT INTO `sr_area` VALUES ('2542', '2541', '铜仁市', '2', '-0-2502-2541-', 'T', '', '0', '1458285977', '0', '0');
INSERT INTO `sr_area` VALUES ('2543', '2541', '江口县', '2', '-0-2502-2541-', 'J', '', '0', '1458285978', '0', '0');
INSERT INTO `sr_area` VALUES ('2544', '2541', '玉屏侗族自治县', '2', '-0-2502-2541-', 'Y', '', '0', '1458285979', '0', '0');
INSERT INTO `sr_area` VALUES ('2545', '2541', '石阡县', '2', '-0-2502-2541-', 'S', '', '0', '1458285980', '0', '0');
INSERT INTO `sr_area` VALUES ('2546', '2541', '思南县', '2', '-0-2502-2541-', 'S', '', '0', '1458285981', '0', '0');
INSERT INTO `sr_area` VALUES ('2547', '2541', '印江土家族苗族自治县', '2', '-0-2502-2541-', 'Y', '', '0', '1458285982', '0', '0');
INSERT INTO `sr_area` VALUES ('2548', '2541', '德江县', '2', '-0-2502-2541-', 'D', '', '0', '1458285983', '0', '0');
INSERT INTO `sr_area` VALUES ('2549', '2541', '沿河土家族自治县', '2', '-0-2502-2541-', 'Y', '', '0', '1458285984', '0', '0');
INSERT INTO `sr_area` VALUES ('2550', '2541', '松桃苗族自治县', '2', '-0-2502-2541-', 'S', '', '0', '1458285985', '0', '0');
INSERT INTO `sr_area` VALUES ('2551', '2541', '万山特区', '2', '-0-2502-2541-', 'W', '', '0', '1458285986', '0', '0');
INSERT INTO `sr_area` VALUES ('2552', '2502', '黔西南布依族苗族自治州', '1', '-0-2502-', 'Q', '', '0', '1458285987', '0', '0');
INSERT INTO `sr_area` VALUES ('2553', '2552', '兴义市', '2', '-0-2502-2552-', 'X', '', '0', '1458285988', '0', '0');
INSERT INTO `sr_area` VALUES ('2554', '2552', '兴仁县', '2', '-0-2502-2552-', 'X', '', '0', '1458285989', '0', '0');
INSERT INTO `sr_area` VALUES ('2555', '2552', '普安县', '2', '-0-2502-2552-', 'P', '', '0', '1458285990', '0', '0');
INSERT INTO `sr_area` VALUES ('2556', '2552', '晴隆县', '2', '-0-2502-2552-', 'Q', '', '0', '1458285991', '0', '0');
INSERT INTO `sr_area` VALUES ('2557', '2552', '贞丰县', '2', '-0-2502-2552-', 'Z', '', '0', '1458285992', '0', '0');
INSERT INTO `sr_area` VALUES ('2558', '2552', '望谟县', '2', '-0-2502-2552-', 'W', '', '0', '1458285993', '0', '0');
INSERT INTO `sr_area` VALUES ('2559', '2552', '册亨县', '2', '-0-2502-2552-', 'C', '', '0', '1458285994', '0', '0');
INSERT INTO `sr_area` VALUES ('2560', '2552', '安龙县', '2', '-0-2502-2552-', 'A', '', '0', '1458285995', '0', '0');
INSERT INTO `sr_area` VALUES ('2561', '2502', '毕节地区', '1', '-0-2502-', 'B', '', '0', '1458285996', '0', '0');
INSERT INTO `sr_area` VALUES ('2562', '2561', '毕节市', '2', '-0-2502-2561-', 'B', '', '0', '1458285997', '0', '0');
INSERT INTO `sr_area` VALUES ('2563', '2561', '大方县', '2', '-0-2502-2561-', 'D', '', '0', '1458285998', '0', '0');
INSERT INTO `sr_area` VALUES ('2564', '2561', '黔西县', '2', '-0-2502-2561-', 'Q', '', '0', '1458285999', '0', '0');
INSERT INTO `sr_area` VALUES ('2565', '2561', '金沙县', '2', '-0-2502-2561-', 'J', '', '0', '1458286000', '0', '0');
INSERT INTO `sr_area` VALUES ('2566', '2561', '织金县', '2', '-0-2502-2561-', 'Z', '', '0', '1458286001', '0', '0');
INSERT INTO `sr_area` VALUES ('2567', '2561', '纳雍县', '2', '-0-2502-2561-', 'N', '', '0', '1458286002', '0', '0');
INSERT INTO `sr_area` VALUES ('2568', '2561', '威宁彝族回族苗族自治县', '2', '-0-2502-2561-', 'W', '', '0', '1458286003', '0', '0');
INSERT INTO `sr_area` VALUES ('2569', '2561', '赫章县', '2', '-0-2502-2561-', 'H', '', '0', '1458286004', '0', '0');
INSERT INTO `sr_area` VALUES ('2570', '2502', '黔东南苗族侗族自治州', '1', '-0-2502-', 'Q', '', '0', '1458286005', '0', '0');
INSERT INTO `sr_area` VALUES ('2571', '2570', '凯里市', '2', '-0-2502-2570-', 'K', '', '0', '1458286006', '0', '0');
INSERT INTO `sr_area` VALUES ('2572', '2570', '黄平县', '2', '-0-2502-2570-', 'H', '', '0', '1458286007', '0', '0');
INSERT INTO `sr_area` VALUES ('2573', '2570', '施秉县', '2', '-0-2502-2570-', 'S', '', '0', '1458286008', '0', '0');
INSERT INTO `sr_area` VALUES ('2574', '2570', '三穗县', '2', '-0-2502-2570-', 'S', '', '0', '1458286009', '0', '0');
INSERT INTO `sr_area` VALUES ('2575', '2570', '镇远县', '2', '-0-2502-2570-', 'Z', '', '0', '1458286010', '0', '0');
INSERT INTO `sr_area` VALUES ('2576', '2570', '岑巩县', '2', '-0-2502-2570-', '', '', '0', '1458286011', '0', '0');
INSERT INTO `sr_area` VALUES ('2577', '2570', '天柱县', '2', '-0-2502-2570-', 'T', '', '0', '1458286012', '0', '0');
INSERT INTO `sr_area` VALUES ('2578', '2570', '锦屏县', '2', '-0-2502-2570-', 'J', '', '0', '1458286013', '0', '0');
INSERT INTO `sr_area` VALUES ('2579', '2570', '剑河县', '2', '-0-2502-2570-', 'J', '', '0', '1458286014', '0', '0');
INSERT INTO `sr_area` VALUES ('2580', '2570', '台江县', '2', '-0-2502-2570-', 'T', '', '0', '1458286015', '0', '0');
INSERT INTO `sr_area` VALUES ('2581', '2570', '黎平县', '2', '-0-2502-2570-', 'L', '', '0', '1458286016', '0', '0');
INSERT INTO `sr_area` VALUES ('2582', '2570', '榕江县', '2', '-0-2502-2570-', '', '', '0', '1458286017', '0', '0');
INSERT INTO `sr_area` VALUES ('2583', '2570', '从江县', '2', '-0-2502-2570-', 'C', '', '0', '1458286018', '0', '0');
INSERT INTO `sr_area` VALUES ('2584', '2570', '雷山县', '2', '-0-2502-2570-', 'L', '', '0', '1458286019', '0', '0');
INSERT INTO `sr_area` VALUES ('2585', '2570', '麻江县', '2', '-0-2502-2570-', 'M', '', '0', '1458286020', '0', '0');
INSERT INTO `sr_area` VALUES ('2586', '2570', '丹寨县', '2', '-0-2502-2570-', 'D', '', '0', '1458286021', '0', '0');
INSERT INTO `sr_area` VALUES ('2587', '2502', '黔南布依族苗族自治州', '1', '-0-2502-', 'Q', '', '0', '1458286022', '0', '0');
INSERT INTO `sr_area` VALUES ('2588', '2587', '都匀市', '2', '-0-2502-2587-', 'D', '', '0', '1458286023', '0', '0');
INSERT INTO `sr_area` VALUES ('2589', '2587', '福泉市', '2', '-0-2502-2587-', 'F', '', '0', '1458286024', '0', '0');
INSERT INTO `sr_area` VALUES ('2590', '2587', '荔波县', '2', '-0-2502-2587-', 'L', '', '0', '1458286025', '0', '0');
INSERT INTO `sr_area` VALUES ('2591', '2587', '贵定县', '2', '-0-2502-2587-', 'G', '', '0', '1458286026', '0', '0');
INSERT INTO `sr_area` VALUES ('2592', '2587', '瓮安县', '2', '-0-2502-2587-', 'W', '', '0', '1458286027', '0', '0');
INSERT INTO `sr_area` VALUES ('2593', '2587', '独山县', '2', '-0-2502-2587-', 'D', '', '0', '1458286028', '0', '0');
INSERT INTO `sr_area` VALUES ('2594', '2587', '平塘县', '2', '-0-2502-2587-', 'P', '', '0', '1458286029', '0', '0');
INSERT INTO `sr_area` VALUES ('2595', '2587', '罗甸县', '2', '-0-2502-2587-', 'L', '', '0', '1458286030', '0', '0');
INSERT INTO `sr_area` VALUES ('2596', '2587', '长顺县', '2', '-0-2502-2587-', 'C', '', '0', '1458286031', '0', '0');
INSERT INTO `sr_area` VALUES ('2597', '2587', '龙里县', '2', '-0-2502-2587-', 'L', '', '0', '1458286032', '0', '0');
INSERT INTO `sr_area` VALUES ('2598', '2587', '惠水县', '2', '-0-2502-2587-', 'H', '', '0', '1458286033', '0', '0');
INSERT INTO `sr_area` VALUES ('2599', '2587', '三都水族自治县', '2', '-0-2502-2587-', 'S', '', '0', '1458286034', '0', '0');
INSERT INTO `sr_area` VALUES ('2600', '0', '云南', '0', '-0-', 'Y', '西南', '0', '1458286035', '0', '0');
INSERT INTO `sr_area` VALUES ('2601', '2600', '昆明市', '1', '-0-2600-', 'K', '', '0', '1458286036', '0', '0');
INSERT INTO `sr_area` VALUES ('2602', '2601', '五华区', '2', '-0-2600-2601-', 'W', '', '0', '1458286037', '0', '0');
INSERT INTO `sr_area` VALUES ('2603', '2601', '盘龙区', '2', '-0-2600-2601-', 'P', '', '0', '1458286038', '0', '0');
INSERT INTO `sr_area` VALUES ('2604', '2601', '官渡区', '2', '-0-2600-2601-', 'G', '', '0', '1458286039', '0', '0');
INSERT INTO `sr_area` VALUES ('2605', '2601', '西山区', '2', '-0-2600-2601-', 'X', '', '0', '1458286040', '0', '0');
INSERT INTO `sr_area` VALUES ('2606', '2601', '东川区', '2', '-0-2600-2601-', 'D', '', '0', '1458286041', '0', '0');
INSERT INTO `sr_area` VALUES ('2607', '2601', '呈贡县', '2', '-0-2600-2601-', 'C', '', '0', '1458286042', '0', '0');
INSERT INTO `sr_area` VALUES ('2608', '2601', '晋宁县', '2', '-0-2600-2601-', 'J', '', '0', '1458286043', '0', '0');
INSERT INTO `sr_area` VALUES ('2609', '2601', '富民县', '2', '-0-2600-2601-', 'F', '', '0', '1458286044', '0', '0');
INSERT INTO `sr_area` VALUES ('2610', '2601', '宜良县', '2', '-0-2600-2601-', 'Y', '', '0', '1458286045', '0', '0');
INSERT INTO `sr_area` VALUES ('2611', '2601', '石林彝族自治县', '2', '-0-2600-2601-', 'S', '', '0', '1458286046', '0', '0');
INSERT INTO `sr_area` VALUES ('2612', '2601', '嵩明县', '2', '-0-2600-2601-', '', '', '0', '1458286047', '0', '0');
INSERT INTO `sr_area` VALUES ('2613', '2601', '禄劝彝族苗族自治县', '2', '-0-2600-2601-', 'L', '', '0', '1458286048', '0', '0');
INSERT INTO `sr_area` VALUES ('2614', '2601', '寻甸回族彝族自治县', '2', '-0-2600-2601-', 'X', '', '0', '1458286049', '0', '0');
INSERT INTO `sr_area` VALUES ('2615', '2601', '安宁市', '2', '-0-2600-2601-', 'A', '', '0', '1458286050', '0', '0');
INSERT INTO `sr_area` VALUES ('2616', '2600', '曲靖市', '1', '-0-2600-', 'Q', '', '0', '1458286051', '0', '0');
INSERT INTO `sr_area` VALUES ('2617', '2616', '麒麟区', '2', '-0-2600-2616-', '', '', '0', '1458286052', '0', '0');
INSERT INTO `sr_area` VALUES ('2618', '2616', '马龙县', '2', '-0-2600-2616-', 'M', '', '0', '1458286053', '0', '0');
INSERT INTO `sr_area` VALUES ('2619', '2616', '陆良县', '2', '-0-2600-2616-', 'L', '', '0', '1458286054', '0', '0');
INSERT INTO `sr_area` VALUES ('2620', '2616', '师宗县', '2', '-0-2600-2616-', 'S', '', '0', '1458286055', '0', '0');
INSERT INTO `sr_area` VALUES ('2621', '2616', '罗平县', '2', '-0-2600-2616-', 'L', '', '0', '1458286056', '0', '0');
INSERT INTO `sr_area` VALUES ('2622', '2616', '富源县', '2', '-0-2600-2616-', 'F', '', '0', '1458286057', '0', '0');
INSERT INTO `sr_area` VALUES ('2623', '2616', '会泽县', '2', '-0-2600-2616-', 'H', '', '0', '1458286058', '0', '0');
INSERT INTO `sr_area` VALUES ('2624', '2616', '沾益县', '2', '-0-2600-2616-', 'Z', '', '0', '1458286059', '0', '0');
INSERT INTO `sr_area` VALUES ('2625', '2616', '宣威市', '2', '-0-2600-2616-', 'X', '', '0', '1458286060', '0', '0');
INSERT INTO `sr_area` VALUES ('2626', '2600', '玉溪市', '1', '-0-2600-', 'Y', '', '0', '1458286061', '0', '0');
INSERT INTO `sr_area` VALUES ('2627', '2626', '红塔区', '2', '-0-2600-2626-', 'H', '', '0', '1458286062', '0', '0');
INSERT INTO `sr_area` VALUES ('2628', '2626', '江川县', '2', '-0-2600-2626-', 'J', '', '0', '1458286063', '0', '0');
INSERT INTO `sr_area` VALUES ('2629', '2626', '澄江县', '2', '-0-2600-2626-', 'C', '', '0', '1458286064', '0', '0');
INSERT INTO `sr_area` VALUES ('2630', '2626', '通海县', '2', '-0-2600-2626-', 'T', '', '0', '1458286065', '0', '0');
INSERT INTO `sr_area` VALUES ('2631', '2626', '华宁县', '2', '-0-2600-2626-', 'H', '', '0', '1458286066', '0', '0');
INSERT INTO `sr_area` VALUES ('2632', '2626', '易门县', '2', '-0-2600-2626-', 'Y', '', '0', '1458286067', '0', '0');
INSERT INTO `sr_area` VALUES ('2633', '2626', '峨山彝族自治县', '2', '-0-2600-2626-', 'E', '', '0', '1458286068', '0', '0');
INSERT INTO `sr_area` VALUES ('2634', '2626', '新平彝族傣族自治县', '2', '-0-2600-2626-', 'X', '', '0', '1458286069', '0', '0');
INSERT INTO `sr_area` VALUES ('2635', '2626', '元江哈尼族彝族傣族自治县', '2', '-0-2600-2626-', 'Y', '', '0', '1458286070', '0', '0');
INSERT INTO `sr_area` VALUES ('2636', '2600', '保山市', '1', '-0-2600-', 'B', '', '0', '1458286071', '0', '0');
INSERT INTO `sr_area` VALUES ('2637', '2636', '隆阳区', '2', '-0-2600-2636-', 'L', '', '0', '1458286072', '0', '0');
INSERT INTO `sr_area` VALUES ('2638', '2636', '施甸县', '2', '-0-2600-2636-', 'S', '', '0', '1458286073', '0', '0');
INSERT INTO `sr_area` VALUES ('2639', '2636', '腾冲县', '2', '-0-2600-2636-', 'T', '', '0', '1458286074', '0', '0');
INSERT INTO `sr_area` VALUES ('2640', '2636', '龙陵县', '2', '-0-2600-2636-', 'L', '', '0', '1458286075', '0', '0');
INSERT INTO `sr_area` VALUES ('2641', '2636', '昌宁县', '2', '-0-2600-2636-', 'C', '', '0', '1458286076', '0', '0');
INSERT INTO `sr_area` VALUES ('2642', '2600', '昭通市', '1', '-0-2600-', 'Z', '', '0', '1458286077', '0', '0');
INSERT INTO `sr_area` VALUES ('2643', '2642', '昭阳区', '2', '-0-2600-2642-', 'Z', '', '0', '1458286078', '0', '0');
INSERT INTO `sr_area` VALUES ('2644', '2642', '鲁甸县', '2', '-0-2600-2642-', 'L', '', '0', '1458286079', '0', '0');
INSERT INTO `sr_area` VALUES ('2645', '2642', '巧家县', '2', '-0-2600-2642-', 'Q', '', '0', '1458286080', '0', '0');
INSERT INTO `sr_area` VALUES ('2646', '2642', '盐津县', '2', '-0-2600-2642-', 'Y', '', '0', '1458286081', '0', '0');
INSERT INTO `sr_area` VALUES ('2647', '2642', '大关县', '2', '-0-2600-2642-', 'D', '', '0', '1458286082', '0', '0');
INSERT INTO `sr_area` VALUES ('2648', '2642', '永善县', '2', '-0-2600-2642-', 'Y', '', '0', '1458286083', '0', '0');
INSERT INTO `sr_area` VALUES ('2649', '2642', '绥江县', '2', '-0-2600-2642-', 'S', '', '0', '1458286084', '0', '0');
INSERT INTO `sr_area` VALUES ('2650', '2642', '镇雄县', '2', '-0-2600-2642-', 'Z', '', '0', '1458286085', '0', '0');
INSERT INTO `sr_area` VALUES ('2651', '2642', '彝良县', '2', '-0-2600-2642-', 'Y', '', '0', '1458286086', '0', '0');
INSERT INTO `sr_area` VALUES ('2652', '2642', '威信县', '2', '-0-2600-2642-', 'W', '', '0', '1458286087', '0', '0');
INSERT INTO `sr_area` VALUES ('2653', '2642', '水富县', '2', '-0-2600-2642-', 'S', '', '0', '1458286088', '0', '0');
INSERT INTO `sr_area` VALUES ('2654', '2600', '丽江市', '1', '-0-2600-', 'L', '', '0', '1458286089', '0', '0');
INSERT INTO `sr_area` VALUES ('2655', '2654', '古城区', '2', '-0-2600-2654-', 'G', '', '0', '1458286090', '0', '0');
INSERT INTO `sr_area` VALUES ('2656', '2654', '玉龙纳西族自治县', '2', '-0-2600-2654-', 'Y', '', '0', '1458286091', '0', '0');
INSERT INTO `sr_area` VALUES ('2657', '2654', '永胜县', '2', '-0-2600-2654-', 'Y', '', '0', '1458286092', '0', '0');
INSERT INTO `sr_area` VALUES ('2658', '2654', '华坪县', '2', '-0-2600-2654-', 'H', '', '0', '1458286093', '0', '0');
INSERT INTO `sr_area` VALUES ('2659', '2654', '宁蒗彝族自治县', '2', '-0-2600-2654-', 'N', '', '0', '1458286094', '0', '0');
INSERT INTO `sr_area` VALUES ('2660', '2600', '普洱市', '1', '-0-2600-', 'P', '', '0', '1458286095', '0', '0');
INSERT INTO `sr_area` VALUES ('2661', '2660', '思茅区', '2', '-0-2600-2660-', 'S', '', '0', '1458286096', '0', '0');
INSERT INTO `sr_area` VALUES ('2662', '2660', '宁洱哈尼族彝族自治县', '2', '-0-2600-2660-', 'N', '', '0', '1458286097', '0', '0');
INSERT INTO `sr_area` VALUES ('2663', '2660', '墨江哈尼族自治县', '2', '-0-2600-2660-', 'M', '', '0', '1458286098', '0', '0');
INSERT INTO `sr_area` VALUES ('2664', '2660', '景东彝族自治县', '2', '-0-2600-2660-', 'J', '', '0', '1458286099', '0', '0');
INSERT INTO `sr_area` VALUES ('2665', '2660', '景谷傣族彝族自治县', '2', '-0-2600-2660-', 'J', '', '0', '1458286100', '0', '0');
INSERT INTO `sr_area` VALUES ('2666', '2660', '镇沅彝族哈尼族拉祜族自治县', '2', '-0-2600-2660-', 'Z', '', '0', '1458286101', '0', '0');
INSERT INTO `sr_area` VALUES ('2667', '2660', '江城哈尼族彝族自治县', '2', '-0-2600-2660-', 'J', '', '0', '1458286102', '0', '0');
INSERT INTO `sr_area` VALUES ('2668', '2660', '孟连傣族拉祜族佤族自治县', '2', '-0-2600-2660-', 'M', '', '0', '1458286103', '0', '0');
INSERT INTO `sr_area` VALUES ('2669', '2660', '澜沧拉祜族自治县', '2', '-0-2600-2660-', 'L', '', '0', '1458286104', '0', '0');
INSERT INTO `sr_area` VALUES ('2670', '2660', '西盟佤族自治县', '2', '-0-2600-2660-', 'X', '', '0', '1458286105', '0', '0');
INSERT INTO `sr_area` VALUES ('2671', '2600', '临沧市', '1', '-0-2600-', 'L', '', '0', '1458286106', '0', '0');
INSERT INTO `sr_area` VALUES ('2672', '2671', '临翔区', '2', '-0-2600-2671-', 'L', '', '0', '1458286107', '0', '0');
INSERT INTO `sr_area` VALUES ('2673', '2671', '凤庆县', '2', '-0-2600-2671-', 'F', '', '0', '1458286108', '0', '0');
INSERT INTO `sr_area` VALUES ('2674', '2671', '云县', '2', '-0-2600-2671-', 'Y', '', '0', '1458286109', '0', '0');
INSERT INTO `sr_area` VALUES ('2675', '2671', '永德县', '2', '-0-2600-2671-', 'Y', '', '0', '1458286110', '0', '0');
INSERT INTO `sr_area` VALUES ('2676', '2671', '镇康县', '2', '-0-2600-2671-', 'Z', '', '0', '1458286111', '0', '0');
INSERT INTO `sr_area` VALUES ('2677', '2671', '双江拉祜族佤族布朗族傣族自治县', '2', '-0-2600-2671-', 'S', '', '0', '1458286112', '0', '0');
INSERT INTO `sr_area` VALUES ('2678', '2671', '耿马傣族佤族自治县', '2', '-0-2600-2671-', 'G', '', '0', '1458286113', '0', '0');
INSERT INTO `sr_area` VALUES ('2679', '2671', '沧源佤族自治县', '2', '-0-2600-2671-', 'C', '', '0', '1458286114', '0', '0');
INSERT INTO `sr_area` VALUES ('2680', '2600', '楚雄彝族自治州', '1', '-0-2600-', 'C', '', '0', '1458286115', '0', '0');
INSERT INTO `sr_area` VALUES ('2681', '2680', '楚雄市', '2', '-0-2600-2680-', 'C', '', '0', '1458286116', '0', '0');
INSERT INTO `sr_area` VALUES ('2682', '2680', '双柏县', '2', '-0-2600-2680-', 'S', '', '0', '1458286117', '0', '0');
INSERT INTO `sr_area` VALUES ('2683', '2680', '牟定县', '2', '-0-2600-2680-', 'M', '', '0', '1458286118', '0', '0');
INSERT INTO `sr_area` VALUES ('2684', '2680', '南华县', '2', '-0-2600-2680-', 'N', '', '0', '1458286119', '0', '0');
INSERT INTO `sr_area` VALUES ('2685', '2680', '姚安县', '2', '-0-2600-2680-', 'Y', '', '0', '1458286120', '0', '0');
INSERT INTO `sr_area` VALUES ('2686', '2680', '大姚县', '2', '-0-2600-2680-', 'D', '', '0', '1458286121', '0', '0');
INSERT INTO `sr_area` VALUES ('2687', '2680', '永仁县', '2', '-0-2600-2680-', 'Y', '', '0', '1458286122', '0', '0');
INSERT INTO `sr_area` VALUES ('2688', '2680', '元谋县', '2', '-0-2600-2680-', 'Y', '', '0', '1458286123', '0', '0');
INSERT INTO `sr_area` VALUES ('2689', '2680', '武定县', '2', '-0-2600-2680-', 'W', '', '0', '1458286124', '0', '0');
INSERT INTO `sr_area` VALUES ('2690', '2680', '禄丰县', '2', '-0-2600-2680-', 'L', '', '0', '1458286125', '0', '0');
INSERT INTO `sr_area` VALUES ('2691', '2600', '红河哈尼族彝族自治州', '1', '-0-2600-', 'H', '', '0', '1458286126', '0', '0');
INSERT INTO `sr_area` VALUES ('2692', '2691', '个旧市', '2', '-0-2600-2691-', 'G', '', '0', '1458286127', '0', '0');
INSERT INTO `sr_area` VALUES ('2693', '2691', '开远市', '2', '-0-2600-2691-', 'K', '', '0', '1458286128', '0', '0');
INSERT INTO `sr_area` VALUES ('2694', '2691', '蒙自县', '2', '-0-2600-2691-', 'M', '', '0', '1458286129', '0', '0');
INSERT INTO `sr_area` VALUES ('2695', '2691', '屏边苗族自治县', '2', '-0-2600-2691-', 'P', '', '0', '1458286130', '0', '0');
INSERT INTO `sr_area` VALUES ('2696', '2691', '建水县', '2', '-0-2600-2691-', 'J', '', '0', '1458286131', '0', '0');
INSERT INTO `sr_area` VALUES ('2697', '2691', '石屏县', '2', '-0-2600-2691-', 'S', '', '0', '1458286132', '0', '0');
INSERT INTO `sr_area` VALUES ('2698', '2691', '弥勒县', '2', '-0-2600-2691-', 'M', '', '0', '1458286133', '0', '0');
INSERT INTO `sr_area` VALUES ('2699', '2691', '泸西县', '2', '-0-2600-2691-', '', '', '0', '1458286134', '0', '0');
INSERT INTO `sr_area` VALUES ('2700', '2691', '元阳县', '2', '-0-2600-2691-', 'Y', '', '0', '1458286135', '0', '0');
INSERT INTO `sr_area` VALUES ('2701', '2691', '红河县', '2', '-0-2600-2691-', 'H', '', '0', '1458286136', '0', '0');
INSERT INTO `sr_area` VALUES ('2702', '2691', '金平苗族瑶族傣族自治县', '2', '-0-2600-2691-', 'J', '', '0', '1458286137', '0', '0');
INSERT INTO `sr_area` VALUES ('2703', '2691', '绿春县', '2', '-0-2600-2691-', 'L', '', '0', '1458286138', '0', '0');
INSERT INTO `sr_area` VALUES ('2704', '2691', '河口瑶族自治县', '2', '-0-2600-2691-', 'H', '', '0', '1458286139', '0', '0');
INSERT INTO `sr_area` VALUES ('2705', '2600', '文山壮族苗族自治州', '1', '-0-2600-', 'W', '', '0', '1458286140', '0', '0');
INSERT INTO `sr_area` VALUES ('2706', '2705', '文山县', '2', '-0-2600-2705-', 'W', '', '0', '1458286141', '0', '0');
INSERT INTO `sr_area` VALUES ('2707', '2705', '砚山县', '2', '-0-2600-2705-', 'Y', '', '0', '1458286142', '0', '0');
INSERT INTO `sr_area` VALUES ('2708', '2705', '西畴县', '2', '-0-2600-2705-', 'X', '', '0', '1458286143', '0', '0');
INSERT INTO `sr_area` VALUES ('2709', '2705', '麻栗坡县', '2', '-0-2600-2705-', 'M', '', '0', '1458286144', '0', '0');
INSERT INTO `sr_area` VALUES ('2710', '2705', '马关县', '2', '-0-2600-2705-', 'M', '', '0', '1458286145', '0', '0');
INSERT INTO `sr_area` VALUES ('2711', '2705', '丘北县', '2', '-0-2600-2705-', 'Q', '', '0', '1458286146', '0', '0');
INSERT INTO `sr_area` VALUES ('2712', '2705', '广南县', '2', '-0-2600-2705-', 'G', '', '0', '1458286147', '0', '0');
INSERT INTO `sr_area` VALUES ('2713', '2705', '富宁县', '2', '-0-2600-2705-', 'F', '', '0', '1458286148', '0', '0');
INSERT INTO `sr_area` VALUES ('2714', '2600', '西双版纳傣族自治州', '1', '-0-2600-', 'X', '', '0', '1458286149', '0', '0');
INSERT INTO `sr_area` VALUES ('2715', '2714', '景洪市', '2', '-0-2600-2714-', 'J', '', '0', '1458286150', '0', '0');
INSERT INTO `sr_area` VALUES ('2716', '2714', '勐海县', '2', '-0-2600-2714-', '', '', '0', '1458286151', '0', '0');
INSERT INTO `sr_area` VALUES ('2717', '2714', '勐腊县', '2', '-0-2600-2714-', '', '', '0', '1458286152', '0', '0');
INSERT INTO `sr_area` VALUES ('2718', '2600', '大理白族自治州', '1', '-0-2600-', 'D', '', '0', '1458286153', '0', '0');
INSERT INTO `sr_area` VALUES ('2719', '2718', '大理市', '2', '-0-2600-2718-', 'D', '', '0', '1458286154', '0', '0');
INSERT INTO `sr_area` VALUES ('2720', '2718', '漾濞彝族自治县', '2', '-0-2600-2718-', 'Y', '', '0', '1458286155', '0', '0');
INSERT INTO `sr_area` VALUES ('2721', '2718', '祥云县', '2', '-0-2600-2718-', 'X', '', '0', '1458286156', '0', '0');
INSERT INTO `sr_area` VALUES ('2722', '2718', '宾川县', '2', '-0-2600-2718-', 'B', '', '0', '1458286157', '0', '0');
INSERT INTO `sr_area` VALUES ('2723', '2718', '弥渡县', '2', '-0-2600-2718-', 'M', '', '0', '1458286158', '0', '0');
INSERT INTO `sr_area` VALUES ('2724', '2718', '南涧彝族自治县', '2', '-0-2600-2718-', 'N', '', '0', '1458286159', '0', '0');
INSERT INTO `sr_area` VALUES ('2725', '2718', '巍山彝族回族自治县', '2', '-0-2600-2718-', 'W', '', '0', '1458286160', '0', '0');
INSERT INTO `sr_area` VALUES ('2726', '2718', '永平县', '2', '-0-2600-2718-', 'Y', '', '0', '1458286161', '0', '0');
INSERT INTO `sr_area` VALUES ('2727', '2718', '云龙县', '2', '-0-2600-2718-', 'Y', '', '0', '1458286162', '0', '0');
INSERT INTO `sr_area` VALUES ('2728', '2718', '洱源县', '2', '-0-2600-2718-', 'E', '', '0', '1458286163', '0', '0');
INSERT INTO `sr_area` VALUES ('2729', '2718', '剑川县', '2', '-0-2600-2718-', 'J', '', '0', '1458286164', '0', '0');
INSERT INTO `sr_area` VALUES ('2730', '2718', '鹤庆县', '2', '-0-2600-2718-', 'H', '', '0', '1458286165', '0', '0');
INSERT INTO `sr_area` VALUES ('2731', '2600', '德宏傣族景颇族自治州', '1', '-0-2600-', 'D', '', '0', '1458286166', '0', '0');
INSERT INTO `sr_area` VALUES ('2732', '2731', '瑞丽市', '2', '-0-2600-2731-', 'R', '', '0', '1458286167', '0', '0');
INSERT INTO `sr_area` VALUES ('2733', '2731', '潞西市', '2', '-0-2600-2731-', 'L', '', '0', '1458286168', '0', '0');
INSERT INTO `sr_area` VALUES ('2734', '2731', '梁河县', '2', '-0-2600-2731-', 'L', '', '0', '1458286169', '0', '0');
INSERT INTO `sr_area` VALUES ('2735', '2731', '盈江县', '2', '-0-2600-2731-', 'Y', '', '0', '1458286170', '0', '0');
INSERT INTO `sr_area` VALUES ('2736', '2731', '陇川县', '2', '-0-2600-2731-', 'L', '', '0', '1458286171', '0', '0');
INSERT INTO `sr_area` VALUES ('2737', '2600', '怒江傈僳族自治州', '1', '-0-2600-', 'N', '', '0', '1458286172', '0', '0');
INSERT INTO `sr_area` VALUES ('2738', '2737', '泸水县', '2', '-0-2600-2737-', '', '', '0', '1458286173', '0', '0');
INSERT INTO `sr_area` VALUES ('2739', '2737', '福贡县', '2', '-0-2600-2737-', 'F', '', '0', '1458286174', '0', '0');
INSERT INTO `sr_area` VALUES ('2740', '2737', '贡山独龙族怒族自治县', '2', '-0-2600-2737-', 'G', '', '0', '1458286175', '0', '0');
INSERT INTO `sr_area` VALUES ('2741', '2737', '兰坪白族普米族自治县', '2', '-0-2600-2737-', 'L', '', '0', '1458286176', '0', '0');
INSERT INTO `sr_area` VALUES ('2742', '2600', '迪庆藏族自治州', '1', '-0-2600-', 'D', '', '0', '1458286177', '0', '0');
INSERT INTO `sr_area` VALUES ('2743', '2742', '香格里拉县', '2', '-0-2600-2742-', 'X', '', '0', '1458286178', '0', '0');
INSERT INTO `sr_area` VALUES ('2744', '2742', '德钦县', '2', '-0-2600-2742-', 'D', '', '0', '1458286179', '0', '0');
INSERT INTO `sr_area` VALUES ('2745', '2742', '维西傈僳族自治县', '2', '-0-2600-2742-', 'W', '', '0', '1458286180', '0', '0');
INSERT INTO `sr_area` VALUES ('2746', '0', '西藏', '0', '-0-', 'X', '西南', '0', '1458286181', '0', '0');
INSERT INTO `sr_area` VALUES ('2747', '2746', '拉萨市', '1', '-0-2746-', 'L', '', '0', '1458286182', '0', '0');
INSERT INTO `sr_area` VALUES ('2748', '2747', '城关区', '2', '-0-2746-2747-', 'C', '', '0', '1458286183', '0', '0');
INSERT INTO `sr_area` VALUES ('2749', '2747', '林周县', '2', '-0-2746-2747-', 'L', '', '0', '1458286184', '0', '0');
INSERT INTO `sr_area` VALUES ('2750', '2747', '当雄县', '2', '-0-2746-2747-', 'D', '', '0', '1458286185', '0', '0');
INSERT INTO `sr_area` VALUES ('2751', '2747', '尼木县', '2', '-0-2746-2747-', 'N', '', '0', '1458286186', '0', '0');
INSERT INTO `sr_area` VALUES ('2752', '2747', '曲水县', '2', '-0-2746-2747-', 'Q', '', '0', '1458286187', '0', '0');
INSERT INTO `sr_area` VALUES ('2753', '2747', '堆龙德庆县', '2', '-0-2746-2747-', 'D', '', '0', '1458286188', '0', '0');
INSERT INTO `sr_area` VALUES ('2754', '2747', '达孜县', '2', '-0-2746-2747-', 'D', '', '0', '1458286189', '0', '0');
INSERT INTO `sr_area` VALUES ('2755', '2747', '墨竹工卡县', '2', '-0-2746-2747-', 'M', '', '0', '1458286190', '0', '0');
INSERT INTO `sr_area` VALUES ('2756', '2746', '昌都地区', '1', '-0-2746-', 'C', '', '0', '1458286191', '0', '0');
INSERT INTO `sr_area` VALUES ('2757', '2756', '昌都县', '2', '-0-2746-2756-', 'C', '', '0', '1458286192', '0', '0');
INSERT INTO `sr_area` VALUES ('2758', '2756', '江达县', '2', '-0-2746-2756-', 'J', '', '0', '1458286193', '0', '0');
INSERT INTO `sr_area` VALUES ('2759', '2756', '贡觉县', '2', '-0-2746-2756-', 'G', '', '0', '1458286194', '0', '0');
INSERT INTO `sr_area` VALUES ('2760', '2756', '类乌齐县', '2', '-0-2746-2756-', 'L', '', '0', '1458286195', '0', '0');
INSERT INTO `sr_area` VALUES ('2761', '2756', '丁青县', '2', '-0-2746-2756-', 'D', '', '0', '1458286196', '0', '0');
INSERT INTO `sr_area` VALUES ('2762', '2756', '察雅县', '2', '-0-2746-2756-', 'C', '', '0', '1458286197', '0', '0');
INSERT INTO `sr_area` VALUES ('2763', '2756', '八宿县', '2', '-0-2746-2756-', 'B', '', '0', '1458286198', '0', '0');
INSERT INTO `sr_area` VALUES ('2764', '2756', '左贡县', '2', '-0-2746-2756-', 'Z', '', '0', '1458286199', '0', '0');
INSERT INTO `sr_area` VALUES ('2765', '2756', '芒康县', '2', '-0-2746-2756-', 'M', '', '0', '1458286200', '0', '0');
INSERT INTO `sr_area` VALUES ('2766', '2756', '洛隆县', '2', '-0-2746-2756-', 'L', '', '0', '1458286201', '0', '0');
INSERT INTO `sr_area` VALUES ('2767', '2756', '边坝县', '2', '-0-2746-2756-', 'B', '', '0', '1458286202', '0', '0');
INSERT INTO `sr_area` VALUES ('2768', '2746', '山南地区', '1', '-0-2746-', 'S', '', '0', '1458286203', '0', '0');
INSERT INTO `sr_area` VALUES ('2769', '2768', '乃东县', '2', '-0-2746-2768-', 'N', '', '0', '1458286204', '0', '0');
INSERT INTO `sr_area` VALUES ('2770', '2768', '扎囊县', '2', '-0-2746-2768-', 'Z', '', '0', '1458286205', '0', '0');
INSERT INTO `sr_area` VALUES ('2771', '2768', '贡嘎县', '2', '-0-2746-2768-', 'G', '', '0', '1458286206', '0', '0');
INSERT INTO `sr_area` VALUES ('2772', '2768', '桑日县', '2', '-0-2746-2768-', 'S', '', '0', '1458286207', '0', '0');
INSERT INTO `sr_area` VALUES ('2773', '2768', '琼结县', '2', '-0-2746-2768-', 'Q', '', '0', '1458286208', '0', '0');
INSERT INTO `sr_area` VALUES ('2774', '2768', '曲松县', '2', '-0-2746-2768-', 'Q', '', '0', '1458286209', '0', '0');
INSERT INTO `sr_area` VALUES ('2775', '2768', '措美县', '2', '-0-2746-2768-', 'C', '', '0', '1458286210', '0', '0');
INSERT INTO `sr_area` VALUES ('2776', '2768', '洛扎县', '2', '-0-2746-2768-', 'L', '', '0', '1458286211', '0', '0');
INSERT INTO `sr_area` VALUES ('2777', '2768', '加查县', '2', '-0-2746-2768-', 'J', '', '0', '1458286212', '0', '0');
INSERT INTO `sr_area` VALUES ('2778', '2768', '隆子县', '2', '-0-2746-2768-', 'L', '', '0', '1458286213', '0', '0');
INSERT INTO `sr_area` VALUES ('2779', '2768', '错那县', '2', '-0-2746-2768-', 'C', '', '0', '1458286214', '0', '0');
INSERT INTO `sr_area` VALUES ('2780', '2768', '浪卡子县', '2', '-0-2746-2768-', 'L', '', '0', '1458286215', '0', '0');
INSERT INTO `sr_area` VALUES ('2781', '2746', '日喀则地区', '1', '-0-2746-', 'R', '', '0', '1458286216', '0', '0');
INSERT INTO `sr_area` VALUES ('2782', '2781', '日喀则市', '2', '-0-2746-2781-', 'R', '', '0', '1458286217', '0', '0');
INSERT INTO `sr_area` VALUES ('2783', '2781', '南木林县', '2', '-0-2746-2781-', 'N', '', '0', '1458286218', '0', '0');
INSERT INTO `sr_area` VALUES ('2784', '2781', '江孜县', '2', '-0-2746-2781-', 'J', '', '0', '1458286219', '0', '0');
INSERT INTO `sr_area` VALUES ('2785', '2781', '定日县', '2', '-0-2746-2781-', 'D', '', '0', '1458286220', '0', '0');
INSERT INTO `sr_area` VALUES ('2786', '2781', '萨迦县', '2', '-0-2746-2781-', 'S', '', '0', '1458286221', '0', '0');
INSERT INTO `sr_area` VALUES ('2787', '2781', '拉孜县', '2', '-0-2746-2781-', 'L', '', '0', '1458286222', '0', '0');
INSERT INTO `sr_area` VALUES ('2788', '2781', '昂仁县', '2', '-0-2746-2781-', 'A', '', '0', '1458286223', '0', '0');
INSERT INTO `sr_area` VALUES ('2789', '2781', '谢通门县', '2', '-0-2746-2781-', 'X', '', '0', '1458286224', '0', '0');
INSERT INTO `sr_area` VALUES ('2790', '2781', '白朗县', '2', '-0-2746-2781-', 'B', '', '0', '1458286225', '0', '0');
INSERT INTO `sr_area` VALUES ('2791', '2781', '仁布县', '2', '-0-2746-2781-', 'R', '', '0', '1458286226', '0', '0');
INSERT INTO `sr_area` VALUES ('2792', '2781', '康马县', '2', '-0-2746-2781-', 'K', '', '0', '1458286227', '0', '0');
INSERT INTO `sr_area` VALUES ('2793', '2781', '定结县', '2', '-0-2746-2781-', 'D', '', '0', '1458286228', '0', '0');
INSERT INTO `sr_area` VALUES ('2794', '2781', '仲巴县', '2', '-0-2746-2781-', 'Z', '', '0', '1458286229', '0', '0');
INSERT INTO `sr_area` VALUES ('2795', '2781', '亚东县', '2', '-0-2746-2781-', 'Y', '', '0', '1458286230', '0', '0');
INSERT INTO `sr_area` VALUES ('2796', '2781', '吉隆县', '2', '-0-2746-2781-', 'J', '', '0', '1458286231', '0', '0');
INSERT INTO `sr_area` VALUES ('2797', '2781', '聂拉木县', '2', '-0-2746-2781-', 'N', '', '0', '1458286232', '0', '0');
INSERT INTO `sr_area` VALUES ('2798', '2781', '萨嘎县', '2', '-0-2746-2781-', 'S', '', '0', '1458286233', '0', '0');
INSERT INTO `sr_area` VALUES ('2799', '2781', '岗巴县', '2', '-0-2746-2781-', 'G', '', '0', '1458286234', '0', '0');
INSERT INTO `sr_area` VALUES ('2800', '2746', '那曲地区', '1', '-0-2746-', 'N', '', '0', '1458286235', '0', '0');
INSERT INTO `sr_area` VALUES ('2801', '2800', '那曲县', '2', '-0-2746-2800-', 'N', '', '0', '1458286236', '0', '0');
INSERT INTO `sr_area` VALUES ('2802', '2800', '嘉黎县', '2', '-0-2746-2800-', 'J', '', '0', '1458286237', '0', '0');
INSERT INTO `sr_area` VALUES ('2803', '2800', '比如县', '2', '-0-2746-2800-', 'B', '', '0', '1458286238', '0', '0');
INSERT INTO `sr_area` VALUES ('2804', '2800', '聂荣县', '2', '-0-2746-2800-', 'N', '', '0', '1458286239', '0', '0');
INSERT INTO `sr_area` VALUES ('2805', '2800', '安多县', '2', '-0-2746-2800-', 'A', '', '0', '1458286240', '0', '0');
INSERT INTO `sr_area` VALUES ('2806', '2800', '申扎县', '2', '-0-2746-2800-', 'S', '', '0', '1458286241', '0', '0');
INSERT INTO `sr_area` VALUES ('2807', '2800', '索县', '2', '-0-2746-2800-', 'S', '', '0', '1458286242', '0', '0');
INSERT INTO `sr_area` VALUES ('2808', '2800', '班戈县', '2', '-0-2746-2800-', 'B', '', '0', '1458286243', '0', '0');
INSERT INTO `sr_area` VALUES ('2809', '2800', '巴青县', '2', '-0-2746-2800-', 'B', '', '0', '1458286244', '0', '0');
INSERT INTO `sr_area` VALUES ('2810', '2800', '尼玛县', '2', '-0-2746-2800-', 'N', '', '0', '1458286245', '0', '0');
INSERT INTO `sr_area` VALUES ('2811', '2746', '阿里地区', '1', '-0-2746-', 'A', '', '0', '1458286246', '0', '0');
INSERT INTO `sr_area` VALUES ('2812', '2811', '普兰县', '2', '-0-2746-2811-', 'P', '', '0', '1458286247', '0', '0');
INSERT INTO `sr_area` VALUES ('2813', '2811', '札达县', '2', '-0-2746-2811-', 'Z', '', '0', '1458286248', '0', '0');
INSERT INTO `sr_area` VALUES ('2814', '2811', '噶尔县', '2', '-0-2746-2811-', 'G', '', '0', '1458286249', '0', '0');
INSERT INTO `sr_area` VALUES ('2815', '2811', '日土县', '2', '-0-2746-2811-', 'R', '', '0', '1458286250', '0', '0');
INSERT INTO `sr_area` VALUES ('2816', '2811', '革吉县', '2', '-0-2746-2811-', 'G', '', '0', '1458286251', '0', '0');
INSERT INTO `sr_area` VALUES ('2817', '2811', '改则县', '2', '-0-2746-2811-', 'G', '', '0', '1458286252', '0', '0');
INSERT INTO `sr_area` VALUES ('2818', '2811', '措勤县', '2', '-0-2746-2811-', 'C', '', '0', '1458286253', '0', '0');
INSERT INTO `sr_area` VALUES ('2819', '2746', '林芝地区', '1', '-0-2746-', 'L', '', '0', '1458286254', '0', '0');
INSERT INTO `sr_area` VALUES ('2820', '2819', '林芝县', '2', '-0-2746-2819-', 'L', '', '0', '1458286255', '0', '0');
INSERT INTO `sr_area` VALUES ('2821', '2819', '工布江达县', '2', '-0-2746-2819-', 'G', '', '0', '1458286256', '0', '0');
INSERT INTO `sr_area` VALUES ('2822', '2819', '米林县', '2', '-0-2746-2819-', 'M', '', '0', '1458286257', '0', '0');
INSERT INTO `sr_area` VALUES ('2823', '2819', '墨脱县', '2', '-0-2746-2819-', 'M', '', '0', '1458286258', '0', '0');
INSERT INTO `sr_area` VALUES ('2824', '2819', '波密县', '2', '-0-2746-2819-', 'B', '', '0', '1458286259', '0', '0');
INSERT INTO `sr_area` VALUES ('2825', '2819', '察隅县', '2', '-0-2746-2819-', 'C', '', '0', '1458286260', '0', '0');
INSERT INTO `sr_area` VALUES ('2826', '2819', '朗县', '2', '-0-2746-2819-', 'L', '', '0', '1458286261', '0', '0');
INSERT INTO `sr_area` VALUES ('2827', '0', '陕西', '0', '-0-', 'S', '西北', '0', '1458286262', '0', '0');
INSERT INTO `sr_area` VALUES ('2828', '2827', '西安市', '1', '-0-2827-', 'X', '', '0', '1458286263', '0', '0');
INSERT INTO `sr_area` VALUES ('2829', '2828', '新城区', '2', '-0-2827-2828-', 'X', '', '0', '1458286264', '0', '0');
INSERT INTO `sr_area` VALUES ('2830', '2828', '碑林区', '2', '-0-2827-2828-', 'B', '', '0', '1458286265', '0', '0');
INSERT INTO `sr_area` VALUES ('2831', '2828', '莲湖区', '2', '-0-2827-2828-', 'L', '', '0', '1458286266', '0', '0');
INSERT INTO `sr_area` VALUES ('2832', '2828', '灞桥区', '2', '-0-2827-2828-', '', '', '0', '1458286267', '0', '0');
INSERT INTO `sr_area` VALUES ('2833', '2828', '未央区', '2', '-0-2827-2828-', 'W', '', '0', '1458286268', '0', '0');
INSERT INTO `sr_area` VALUES ('2834', '2828', '雁塔区', '2', '-0-2827-2828-', 'Y', '', '0', '1458286269', '0', '0');
INSERT INTO `sr_area` VALUES ('2835', '2828', '阎良区', '2', '-0-2827-2828-', 'Y', '', '0', '1458286270', '0', '0');
INSERT INTO `sr_area` VALUES ('2836', '2828', '临潼区', '2', '-0-2827-2828-', 'L', '', '0', '1458286271', '0', '0');
INSERT INTO `sr_area` VALUES ('2837', '2828', '长安区', '2', '-0-2827-2828-', 'C', '', '0', '1458286272', '0', '0');
INSERT INTO `sr_area` VALUES ('2838', '2828', '蓝田县', '2', '-0-2827-2828-', 'L', '', '0', '1458286273', '0', '0');
INSERT INTO `sr_area` VALUES ('2839', '2828', '周至县', '2', '-0-2827-2828-', 'Z', '', '0', '1458286274', '0', '0');
INSERT INTO `sr_area` VALUES ('2840', '2828', '户县', '2', '-0-2827-2828-', 'H', '', '0', '1458286275', '0', '0');
INSERT INTO `sr_area` VALUES ('2841', '2828', '高陵县', '2', '-0-2827-2828-', 'G', '', '0', '1458286276', '0', '0');
INSERT INTO `sr_area` VALUES ('2842', '2827', '铜川市', '1', '-0-2827-', 'T', '', '0', '1458286277', '0', '0');
INSERT INTO `sr_area` VALUES ('2843', '2842', '王益区', '2', '-0-2827-2842-', 'W', '', '0', '1458286278', '0', '0');
INSERT INTO `sr_area` VALUES ('2844', '2842', '印台区', '2', '-0-2827-2842-', 'Y', '', '0', '1458286279', '0', '0');
INSERT INTO `sr_area` VALUES ('2845', '2842', '耀州区', '2', '-0-2827-2842-', 'Y', '', '0', '1458286280', '0', '0');
INSERT INTO `sr_area` VALUES ('2846', '2842', '宜君县', '2', '-0-2827-2842-', 'Y', '', '0', '1458286281', '0', '0');
INSERT INTO `sr_area` VALUES ('2847', '2827', '宝鸡市', '1', '-0-2827-', 'B', '', '0', '1458286282', '0', '0');
INSERT INTO `sr_area` VALUES ('2848', '2847', '渭滨区', '2', '-0-2827-2847-', 'W', '', '0', '1458286283', '0', '0');
INSERT INTO `sr_area` VALUES ('2849', '2847', '金台区', '2', '-0-2827-2847-', 'J', '', '0', '1458286284', '0', '0');
INSERT INTO `sr_area` VALUES ('2850', '2847', '陈仓区', '2', '-0-2827-2847-', 'C', '', '0', '1458286285', '0', '0');
INSERT INTO `sr_area` VALUES ('2851', '2847', '凤翔县', '2', '-0-2827-2847-', 'F', '', '0', '1458286286', '0', '0');
INSERT INTO `sr_area` VALUES ('2852', '2847', '岐山县', '2', '-0-2827-2847-', '', '', '0', '1458286287', '0', '0');
INSERT INTO `sr_area` VALUES ('2853', '2847', '扶风县', '2', '-0-2827-2847-', 'F', '', '0', '1458286288', '0', '0');
INSERT INTO `sr_area` VALUES ('2854', '2847', '眉县', '2', '-0-2827-2847-', 'M', '', '0', '1458286289', '0', '0');
INSERT INTO `sr_area` VALUES ('2855', '2847', '陇县', '2', '-0-2827-2847-', 'L', '', '0', '1458286290', '0', '0');
INSERT INTO `sr_area` VALUES ('2856', '2847', '千阳县', '2', '-0-2827-2847-', 'Q', '', '0', '1458286291', '0', '0');
INSERT INTO `sr_area` VALUES ('2857', '2847', '麟游县', '2', '-0-2827-2847-', '', '', '0', '1458286292', '0', '0');
INSERT INTO `sr_area` VALUES ('2858', '2847', '凤县', '2', '-0-2827-2847-', 'F', '', '0', '1458286293', '0', '0');
INSERT INTO `sr_area` VALUES ('2859', '2847', '太白县', '2', '-0-2827-2847-', 'T', '', '0', '1458286294', '0', '0');
INSERT INTO `sr_area` VALUES ('2860', '2827', '咸阳市', '1', '-0-2827-', 'X', '', '0', '1458286295', '0', '0');
INSERT INTO `sr_area` VALUES ('2861', '2860', '秦都区', '2', '-0-2827-2860-', 'Q', '', '0', '1458286296', '0', '0');
INSERT INTO `sr_area` VALUES ('2862', '2860', '杨凌区', '2', '-0-2827-2860-', 'Y', '', '0', '1458286297', '0', '0');
INSERT INTO `sr_area` VALUES ('2863', '2860', '渭城区', '2', '-0-2827-2860-', 'W', '', '0', '1458286298', '0', '0');
INSERT INTO `sr_area` VALUES ('2864', '2860', '三原县', '2', '-0-2827-2860-', 'S', '', '0', '1458286299', '0', '0');
INSERT INTO `sr_area` VALUES ('2865', '2860', '泾阳县', '2', '-0-2827-2860-', '', '', '0', '1458286300', '0', '0');
INSERT INTO `sr_area` VALUES ('2866', '2860', '乾县', '2', '-0-2827-2860-', 'Q', '', '0', '1458286301', '0', '0');
INSERT INTO `sr_area` VALUES ('2867', '2860', '礼泉县', '2', '-0-2827-2860-', 'L', '', '0', '1458286302', '0', '0');
INSERT INTO `sr_area` VALUES ('2868', '2860', '永寿县', '2', '-0-2827-2860-', 'Y', '', '0', '1458286303', '0', '0');
INSERT INTO `sr_area` VALUES ('2869', '2860', '彬县', '2', '-0-2827-2860-', 'B', '', '0', '1458286304', '0', '0');
INSERT INTO `sr_area` VALUES ('2870', '2860', '长武县', '2', '-0-2827-2860-', 'C', '', '0', '1458286305', '0', '0');
INSERT INTO `sr_area` VALUES ('2871', '2860', '旬邑县', '2', '-0-2827-2860-', 'X', '', '0', '1458286306', '0', '0');
INSERT INTO `sr_area` VALUES ('2872', '2860', '淳化县', '2', '-0-2827-2860-', 'C', '', '0', '1458286307', '0', '0');
INSERT INTO `sr_area` VALUES ('2873', '2860', '武功县', '2', '-0-2827-2860-', 'W', '', '0', '1458286308', '0', '0');
INSERT INTO `sr_area` VALUES ('2874', '2860', '兴平市', '2', '-0-2827-2860-', 'X', '', '0', '1458286309', '0', '0');
INSERT INTO `sr_area` VALUES ('2875', '2827', '渭南市', '1', '-0-2827-', 'W', '', '0', '1458286310', '0', '0');
INSERT INTO `sr_area` VALUES ('2876', '2875', '临渭区', '2', '-0-2827-2875-', 'L', '', '0', '1458286311', '0', '0');
INSERT INTO `sr_area` VALUES ('2877', '2875', '华县', '2', '-0-2827-2875-', 'H', '', '0', '1458286312', '0', '0');
INSERT INTO `sr_area` VALUES ('2878', '2875', '潼关县', '2', '-0-2827-2875-', '', '', '0', '1458286313', '0', '0');
INSERT INTO `sr_area` VALUES ('2879', '2875', '大荔县', '2', '-0-2827-2875-', 'D', '', '0', '1458286314', '0', '0');
INSERT INTO `sr_area` VALUES ('2880', '2875', '合阳县', '2', '-0-2827-2875-', 'H', '', '0', '1458286315', '0', '0');
INSERT INTO `sr_area` VALUES ('2881', '2875', '澄城县', '2', '-0-2827-2875-', 'C', '', '0', '1458286316', '0', '0');
INSERT INTO `sr_area` VALUES ('2882', '2875', '蒲城县', '2', '-0-2827-2875-', 'P', '', '0', '1458286317', '0', '0');
INSERT INTO `sr_area` VALUES ('2883', '2875', '白水县', '2', '-0-2827-2875-', 'B', '', '0', '1458286318', '0', '0');
INSERT INTO `sr_area` VALUES ('2884', '2875', '富平县', '2', '-0-2827-2875-', 'F', '', '0', '1458286319', '0', '0');
INSERT INTO `sr_area` VALUES ('2885', '2875', '韩城市', '2', '-0-2827-2875-', 'H', '', '0', '1458286320', '0', '0');
INSERT INTO `sr_area` VALUES ('2886', '2875', '华阴市', '2', '-0-2827-2875-', 'H', '', '0', '1458286321', '0', '0');
INSERT INTO `sr_area` VALUES ('2887', '2827', '延安市', '1', '-0-2827-', 'Y', '', '0', '1458286322', '0', '0');
INSERT INTO `sr_area` VALUES ('2888', '2887', '宝塔区', '2', '-0-2827-2887-', 'B', '', '0', '1458286323', '0', '0');
INSERT INTO `sr_area` VALUES ('2889', '2887', '延长县', '2', '-0-2827-2887-', 'Y', '', '0', '1458286324', '0', '0');
INSERT INTO `sr_area` VALUES ('2890', '2887', '延川县', '2', '-0-2827-2887-', 'Y', '', '0', '1458286325', '0', '0');
INSERT INTO `sr_area` VALUES ('2891', '2887', '子长县', '2', '-0-2827-2887-', 'Z', '', '0', '1458286326', '0', '0');
INSERT INTO `sr_area` VALUES ('2892', '2887', '安塞县', '2', '-0-2827-2887-', 'A', '', '0', '1458286327', '0', '0');
INSERT INTO `sr_area` VALUES ('2893', '2887', '志丹县', '2', '-0-2827-2887-', 'Z', '', '0', '1458286328', '0', '0');
INSERT INTO `sr_area` VALUES ('2894', '2887', '吴起县', '2', '-0-2827-2887-', 'W', '', '0', '1458286329', '0', '0');
INSERT INTO `sr_area` VALUES ('2895', '2887', '甘泉县', '2', '-0-2827-2887-', 'G', '', '0', '1458286330', '0', '0');
INSERT INTO `sr_area` VALUES ('2896', '2887', '富县', '2', '-0-2827-2887-', 'F', '', '0', '1458286331', '0', '0');
INSERT INTO `sr_area` VALUES ('2897', '2887', '洛川县', '2', '-0-2827-2887-', 'L', '', '0', '1458286332', '0', '0');
INSERT INTO `sr_area` VALUES ('2898', '2887', '宜川县', '2', '-0-2827-2887-', 'Y', '', '0', '1458286333', '0', '0');
INSERT INTO `sr_area` VALUES ('2899', '2887', '黄龙县', '2', '-0-2827-2887-', 'H', '', '0', '1458286334', '0', '0');
INSERT INTO `sr_area` VALUES ('2900', '2887', '黄陵县', '2', '-0-2827-2887-', 'H', '', '0', '1458286335', '0', '0');
INSERT INTO `sr_area` VALUES ('2901', '2827', '汉中市', '1', '-0-2827-', 'H', '', '0', '1458286336', '0', '0');
INSERT INTO `sr_area` VALUES ('2902', '2901', '汉台区', '2', '-0-2827-2901-', 'H', '', '0', '1458286337', '0', '0');
INSERT INTO `sr_area` VALUES ('2903', '2901', '南郑县', '2', '-0-2827-2901-', 'N', '', '0', '1458286338', '0', '0');
INSERT INTO `sr_area` VALUES ('2904', '2901', '城固县', '2', '-0-2827-2901-', 'C', '', '0', '1458286339', '0', '0');
INSERT INTO `sr_area` VALUES ('2905', '2901', '洋县', '2', '-0-2827-2901-', 'Y', '', '0', '1458286340', '0', '0');
INSERT INTO `sr_area` VALUES ('2906', '2901', '西乡县', '2', '-0-2827-2901-', 'X', '', '0', '1458286341', '0', '0');
INSERT INTO `sr_area` VALUES ('2907', '2901', '勉县', '2', '-0-2827-2901-', 'M', '', '0', '1458286342', '0', '0');
INSERT INTO `sr_area` VALUES ('2908', '2901', '宁强县', '2', '-0-2827-2901-', 'N', '', '0', '1458286343', '0', '0');
INSERT INTO `sr_area` VALUES ('2909', '2901', '略阳县', '2', '-0-2827-2901-', 'L', '', '0', '1458286344', '0', '0');
INSERT INTO `sr_area` VALUES ('2910', '2901', '镇巴县', '2', '-0-2827-2901-', 'Z', '', '0', '1458286345', '0', '0');
INSERT INTO `sr_area` VALUES ('2911', '2901', '留坝县', '2', '-0-2827-2901-', 'L', '', '0', '1458286346', '0', '0');
INSERT INTO `sr_area` VALUES ('2912', '2901', '佛坪县', '2', '-0-2827-2901-', 'F', '', '0', '1458286347', '0', '0');
INSERT INTO `sr_area` VALUES ('2913', '2827', '榆林市', '1', '-0-2827-', 'Y', '', '0', '1458286348', '0', '0');
INSERT INTO `sr_area` VALUES ('2914', '2913', '榆阳区', '2', '-0-2827-2913-', 'Y', '', '0', '1458286349', '0', '0');
INSERT INTO `sr_area` VALUES ('2915', '2913', '神木县', '2', '-0-2827-2913-', 'S', '', '0', '1458286350', '0', '0');
INSERT INTO `sr_area` VALUES ('2916', '2913', '府谷县', '2', '-0-2827-2913-', 'F', '', '0', '1458286351', '0', '0');
INSERT INTO `sr_area` VALUES ('2917', '2913', '横山县', '2', '-0-2827-2913-', 'H', '', '0', '1458286352', '0', '0');
INSERT INTO `sr_area` VALUES ('2918', '2913', '靖边县', '2', '-0-2827-2913-', 'J', '', '0', '1458286353', '0', '0');
INSERT INTO `sr_area` VALUES ('2919', '2913', '定边县', '2', '-0-2827-2913-', 'D', '', '0', '1458286354', '0', '0');
INSERT INTO `sr_area` VALUES ('2920', '2913', '绥德县', '2', '-0-2827-2913-', 'S', '', '0', '1458286355', '0', '0');
INSERT INTO `sr_area` VALUES ('2921', '2913', '米脂县', '2', '-0-2827-2913-', 'M', '', '0', '1458286356', '0', '0');
INSERT INTO `sr_area` VALUES ('2922', '2913', '佳县', '2', '-0-2827-2913-', 'J', '', '0', '1458286357', '0', '0');
INSERT INTO `sr_area` VALUES ('2923', '2913', '吴堡县', '2', '-0-2827-2913-', 'W', '', '0', '1458286358', '0', '0');
INSERT INTO `sr_area` VALUES ('2924', '2913', '清涧县', '2', '-0-2827-2913-', 'Q', '', '0', '1458286359', '0', '0');
INSERT INTO `sr_area` VALUES ('2925', '2913', '子洲县', '2', '-0-2827-2913-', 'Z', '', '0', '1458286360', '0', '0');
INSERT INTO `sr_area` VALUES ('2926', '2827', '安康市', '1', '-0-2827-', 'A', '', '0', '1458286361', '0', '0');
INSERT INTO `sr_area` VALUES ('2927', '2926', '汉滨区', '2', '-0-2827-2926-', 'H', '', '0', '1458286362', '0', '0');
INSERT INTO `sr_area` VALUES ('2928', '2926', '汉阴县', '2', '-0-2827-2926-', 'H', '', '0', '1458286363', '0', '0');
INSERT INTO `sr_area` VALUES ('2929', '2926', '石泉县', '2', '-0-2827-2926-', 'S', '', '0', '1458286364', '0', '0');
INSERT INTO `sr_area` VALUES ('2930', '2926', '宁陕县', '2', '-0-2827-2926-', 'N', '', '0', '1458286365', '0', '0');
INSERT INTO `sr_area` VALUES ('2931', '2926', '紫阳县', '2', '-0-2827-2926-', 'Z', '', '0', '1458286366', '0', '0');
INSERT INTO `sr_area` VALUES ('2932', '2926', '岚皋县', '2', '-0-2827-2926-', '', '', '0', '1458286367', '0', '0');
INSERT INTO `sr_area` VALUES ('2933', '2926', '平利县', '2', '-0-2827-2926-', 'P', '', '0', '1458286368', '0', '0');
INSERT INTO `sr_area` VALUES ('2934', '2926', '镇坪县', '2', '-0-2827-2926-', 'Z', '', '0', '1458286369', '0', '0');
INSERT INTO `sr_area` VALUES ('2935', '2926', '旬阳县', '2', '-0-2827-2926-', 'X', '', '0', '1458286370', '0', '0');
INSERT INTO `sr_area` VALUES ('2936', '2926', '白河县', '2', '-0-2827-2926-', 'B', '', '0', '1458286371', '0', '0');
INSERT INTO `sr_area` VALUES ('2937', '2827', '商洛市', '1', '-0-2827-', 'S', '', '0', '1458286372', '0', '0');
INSERT INTO `sr_area` VALUES ('2938', '2937', '商州区', '2', '-0-2827-2937-', 'S', '', '0', '1458286373', '0', '0');
INSERT INTO `sr_area` VALUES ('2939', '2937', '洛南县', '2', '-0-2827-2937-', 'L', '', '0', '1458286374', '0', '0');
INSERT INTO `sr_area` VALUES ('2940', '2937', '丹凤县', '2', '-0-2827-2937-', 'D', '', '0', '1458286375', '0', '0');
INSERT INTO `sr_area` VALUES ('2941', '2937', '商南县', '2', '-0-2827-2937-', 'S', '', '0', '1458286376', '0', '0');
INSERT INTO `sr_area` VALUES ('2942', '2937', '山阳县', '2', '-0-2827-2937-', 'S', '', '0', '1458286377', '0', '0');
INSERT INTO `sr_area` VALUES ('2943', '2937', '镇安县', '2', '-0-2827-2937-', 'Z', '', '0', '1458286378', '0', '0');
INSERT INTO `sr_area` VALUES ('2944', '2937', '柞水县', '2', '-0-2827-2937-', 'Z', '', '0', '1458286379', '0', '0');
INSERT INTO `sr_area` VALUES ('2945', '0', '甘肃', '0', '-0-', 'G', '西北', '0', '1458286380', '0', '0');
INSERT INTO `sr_area` VALUES ('2946', '2945', '兰州市', '1', '-0-2945-', 'L', '', '0', '1458286381', '0', '0');
INSERT INTO `sr_area` VALUES ('2947', '2946', '城关区', '2', '-0-2945-2946-', 'C', '', '0', '1458286382', '0', '0');
INSERT INTO `sr_area` VALUES ('2948', '2946', '七里河区', '2', '-0-2945-2946-', 'Q', '', '0', '1458286383', '0', '0');
INSERT INTO `sr_area` VALUES ('2949', '2946', '西固区', '2', '-0-2945-2946-', 'X', '', '0', '1458286384', '0', '0');
INSERT INTO `sr_area` VALUES ('2950', '2946', '安宁区', '2', '-0-2945-2946-', 'A', '', '0', '1458286385', '0', '0');
INSERT INTO `sr_area` VALUES ('2951', '2946', '红古区', '2', '-0-2945-2946-', 'H', '', '0', '1458286386', '0', '0');
INSERT INTO `sr_area` VALUES ('2952', '2946', '永登县', '2', '-0-2945-2946-', 'Y', '', '0', '1458286387', '0', '0');
INSERT INTO `sr_area` VALUES ('2953', '2946', '皋兰县', '2', '-0-2945-2946-', 'G', '', '0', '1458286388', '0', '0');
INSERT INTO `sr_area` VALUES ('2954', '2946', '榆中县', '2', '-0-2945-2946-', 'Y', '', '0', '1458286389', '0', '0');
INSERT INTO `sr_area` VALUES ('2955', '2945', '嘉峪关市', '1', '-0-2945-', 'J', '', '0', '1458286390', '0', '0');
INSERT INTO `sr_area` VALUES ('2956', '2945', '金昌市', '1', '-0-2945-', 'J', '', '0', '1458286391', '0', '0');
INSERT INTO `sr_area` VALUES ('2957', '2956', '金川区', '2', '-0-2945-2956-', 'J', '', '0', '1458286392', '0', '0');
INSERT INTO `sr_area` VALUES ('2958', '2956', '永昌县', '2', '-0-2945-2956-', 'Y', '', '0', '1458286393', '0', '0');
INSERT INTO `sr_area` VALUES ('2959', '2945', '白银市', '1', '-0-2945-', 'B', '', '0', '1458286394', '0', '0');
INSERT INTO `sr_area` VALUES ('2960', '2959', '白银区', '2', '-0-2945-2959-', 'B', '', '0', '1458286395', '0', '0');
INSERT INTO `sr_area` VALUES ('2961', '2959', '平川区', '2', '-0-2945-2959-', 'P', '', '0', '1458286396', '0', '0');
INSERT INTO `sr_area` VALUES ('2962', '2959', '靖远县', '2', '-0-2945-2959-', 'J', '', '0', '1458286397', '0', '0');
INSERT INTO `sr_area` VALUES ('2963', '2959', '会宁县', '2', '-0-2945-2959-', 'H', '', '0', '1458286398', '0', '0');
INSERT INTO `sr_area` VALUES ('2964', '2959', '景泰县', '2', '-0-2945-2959-', 'J', '', '0', '1458286399', '0', '0');
INSERT INTO `sr_area` VALUES ('2965', '2945', '天水市', '1', '-0-2945-', 'T', '', '0', '1458286400', '0', '0');
INSERT INTO `sr_area` VALUES ('2966', '2965', '秦州区', '2', '-0-2945-2965-', 'Q', '', '0', '1458286401', '0', '0');
INSERT INTO `sr_area` VALUES ('2967', '2965', '麦积区', '2', '-0-2945-2965-', 'M', '', '0', '1458286402', '0', '0');
INSERT INTO `sr_area` VALUES ('2968', '2965', '清水县', '2', '-0-2945-2965-', 'Q', '', '0', '1458286403', '0', '0');
INSERT INTO `sr_area` VALUES ('2969', '2965', '秦安县', '2', '-0-2945-2965-', 'Q', '', '0', '1458286404', '0', '0');
INSERT INTO `sr_area` VALUES ('2970', '2965', '甘谷县', '2', '-0-2945-2965-', 'G', '', '0', '1458286405', '0', '0');
INSERT INTO `sr_area` VALUES ('2971', '2965', '武山县', '2', '-0-2945-2965-', 'W', '', '0', '1458286406', '0', '0');
INSERT INTO `sr_area` VALUES ('2972', '2965', '张家川回族自治县', '2', '-0-2945-2965-', 'Z', '', '0', '1458286407', '0', '0');
INSERT INTO `sr_area` VALUES ('2973', '2945', '武威市', '1', '-0-2945-', 'W', '', '0', '1458286408', '0', '0');
INSERT INTO `sr_area` VALUES ('2974', '2973', '凉州区', '2', '-0-2945-2973-', 'L', '', '0', '1458286409', '0', '0');
INSERT INTO `sr_area` VALUES ('2975', '2973', '民勤县', '2', '-0-2945-2973-', 'M', '', '0', '1458286410', '0', '0');
INSERT INTO `sr_area` VALUES ('2976', '2973', '古浪县', '2', '-0-2945-2973-', 'G', '', '0', '1458286411', '0', '0');
INSERT INTO `sr_area` VALUES ('2977', '2973', '天祝藏族自治县', '2', '-0-2945-2973-', 'T', '', '0', '1458286412', '0', '0');
INSERT INTO `sr_area` VALUES ('2978', '2945', '张掖市', '1', '-0-2945-', 'Z', '', '0', '1458286413', '0', '0');
INSERT INTO `sr_area` VALUES ('2979', '2978', '甘州区', '2', '-0-2945-2978-', 'G', '', '0', '1458286414', '0', '0');
INSERT INTO `sr_area` VALUES ('2980', '2978', '肃南裕固族自治县', '2', '-0-2945-2978-', 'S', '', '0', '1458286415', '0', '0');
INSERT INTO `sr_area` VALUES ('2981', '2978', '民乐县', '2', '-0-2945-2978-', 'M', '', '0', '1458286416', '0', '0');
INSERT INTO `sr_area` VALUES ('2982', '2978', '临泽县', '2', '-0-2945-2978-', 'L', '', '0', '1458286417', '0', '0');
INSERT INTO `sr_area` VALUES ('2983', '2978', '高台县', '2', '-0-2945-2978-', 'G', '', '0', '1458286418', '0', '0');
INSERT INTO `sr_area` VALUES ('2984', '2978', '山丹县', '2', '-0-2945-2978-', 'S', '', '0', '1458286419', '0', '0');
INSERT INTO `sr_area` VALUES ('2985', '2945', '平凉市', '1', '-0-2945-', 'P', '', '0', '1458286420', '0', '0');
INSERT INTO `sr_area` VALUES ('2986', '2985', '崆峒区', '2', '-0-2945-2985-', '', '', '0', '1458286421', '0', '0');
INSERT INTO `sr_area` VALUES ('2987', '2985', '泾川县', '2', '-0-2945-2985-', '', '', '0', '1458286422', '0', '0');
INSERT INTO `sr_area` VALUES ('2988', '2985', '灵台县', '2', '-0-2945-2985-', 'L', '', '0', '1458286423', '0', '0');
INSERT INTO `sr_area` VALUES ('2989', '2985', '崇信县', '2', '-0-2945-2985-', 'C', '', '0', '1458286424', '0', '0');
INSERT INTO `sr_area` VALUES ('2990', '2985', '华亭县', '2', '-0-2945-2985-', 'H', '', '0', '1458286425', '0', '0');
INSERT INTO `sr_area` VALUES ('2991', '2985', '庄浪县', '2', '-0-2945-2985-', 'Z', '', '0', '1458286426', '0', '0');
INSERT INTO `sr_area` VALUES ('2992', '2985', '静宁县', '2', '-0-2945-2985-', 'J', '', '0', '1458286427', '0', '0');
INSERT INTO `sr_area` VALUES ('2993', '2945', '酒泉市', '1', '-0-2945-', 'J', '', '0', '1458286428', '0', '0');
INSERT INTO `sr_area` VALUES ('2994', '2993', '肃州区', '2', '-0-2945-2993-', 'S', '', '0', '1458286429', '0', '0');
INSERT INTO `sr_area` VALUES ('2995', '2993', '金塔县', '2', '-0-2945-2993-', 'J', '', '0', '1458286430', '0', '0');
INSERT INTO `sr_area` VALUES ('2996', '2993', '瓜州县', '2', '-0-2945-2993-', 'G', '', '0', '1458286431', '0', '0');
INSERT INTO `sr_area` VALUES ('2997', '2993', '肃北蒙古族自治县', '2', '-0-2945-2993-', 'S', '', '0', '1458286432', '0', '0');
INSERT INTO `sr_area` VALUES ('2998', '2993', '阿克塞哈萨克族自治县', '2', '-0-2945-2993-', 'A', '', '0', '1458286433', '0', '0');
INSERT INTO `sr_area` VALUES ('2999', '2993', '玉门市', '2', '-0-2945-2993-', 'Y', '', '0', '1458286434', '0', '0');
INSERT INTO `sr_area` VALUES ('3000', '2993', '敦煌市', '2', '-0-2945-2993-', 'D', '', '0', '1458286435', '0', '0');
INSERT INTO `sr_area` VALUES ('3001', '2945', '庆阳市', '1', '-0-2945-', 'Q', '', '0', '1458286436', '0', '0');
INSERT INTO `sr_area` VALUES ('3002', '3001', '西峰区', '2', '-0-2945-3001-', 'X', '', '0', '1458286437', '0', '0');
INSERT INTO `sr_area` VALUES ('3003', '3001', '庆城县', '2', '-0-2945-3001-', 'Q', '', '0', '1458286438', '0', '0');
INSERT INTO `sr_area` VALUES ('3004', '3001', '环县', '2', '-0-2945-3001-', 'H', '', '0', '1458286439', '0', '0');
INSERT INTO `sr_area` VALUES ('3005', '3001', '华池县', '2', '-0-2945-3001-', 'H', '', '0', '1458286440', '0', '0');
INSERT INTO `sr_area` VALUES ('3006', '3001', '合水县', '2', '-0-2945-3001-', 'H', '', '0', '1458286441', '0', '0');
INSERT INTO `sr_area` VALUES ('3007', '3001', '正宁县', '2', '-0-2945-3001-', 'Z', '', '0', '1458286442', '0', '0');
INSERT INTO `sr_area` VALUES ('3008', '3001', '宁县', '2', '-0-2945-3001-', 'N', '', '0', '1458286443', '0', '0');
INSERT INTO `sr_area` VALUES ('3009', '3001', '镇原县', '2', '-0-2945-3001-', 'Z', '', '0', '1458286444', '0', '0');
INSERT INTO `sr_area` VALUES ('3010', '2945', '定西市', '1', '-0-2945-', 'D', '', '0', '1458286445', '0', '0');
INSERT INTO `sr_area` VALUES ('3011', '3010', '安定区', '2', '-0-2945-3010-', 'A', '', '0', '1458286446', '0', '0');
INSERT INTO `sr_area` VALUES ('3012', '3010', '通渭县', '2', '-0-2945-3010-', 'T', '', '0', '1458286447', '0', '0');
INSERT INTO `sr_area` VALUES ('3013', '3010', '陇西县', '2', '-0-2945-3010-', 'L', '', '0', '1458286448', '0', '0');
INSERT INTO `sr_area` VALUES ('3014', '3010', '渭源县', '2', '-0-2945-3010-', 'W', '', '0', '1458286449', '0', '0');
INSERT INTO `sr_area` VALUES ('3015', '3010', '临洮县', '2', '-0-2945-3010-', 'L', '', '0', '1458286450', '0', '0');
INSERT INTO `sr_area` VALUES ('3016', '3010', '漳县', '2', '-0-2945-3010-', 'Z', '', '0', '1458286451', '0', '0');
INSERT INTO `sr_area` VALUES ('3017', '3010', '岷县', '2', '-0-2945-3010-', '', '', '0', '1458286452', '0', '0');
INSERT INTO `sr_area` VALUES ('3018', '2945', '陇南市', '1', '-0-2945-', 'L', '', '0', '1458286453', '0', '0');
INSERT INTO `sr_area` VALUES ('3019', '3018', '武都区', '2', '-0-2945-3018-', 'W', '', '0', '1458286454', '0', '0');
INSERT INTO `sr_area` VALUES ('3020', '3018', '成县', '2', '-0-2945-3018-', 'C', '', '0', '1458286455', '0', '0');
INSERT INTO `sr_area` VALUES ('3021', '3018', '文县', '2', '-0-2945-3018-', 'W', '', '0', '1458286456', '0', '0');
INSERT INTO `sr_area` VALUES ('3022', '3018', '宕昌县', '2', '-0-2945-3018-', '', '', '0', '1458286457', '0', '0');
INSERT INTO `sr_area` VALUES ('3023', '3018', '康县', '2', '-0-2945-3018-', 'K', '', '0', '1458286458', '0', '0');
INSERT INTO `sr_area` VALUES ('3024', '3018', '西和县', '2', '-0-2945-3018-', 'X', '', '0', '1458286459', '0', '0');
INSERT INTO `sr_area` VALUES ('3025', '3018', '礼县', '2', '-0-2945-3018-', 'L', '', '0', '1458286460', '0', '0');
INSERT INTO `sr_area` VALUES ('3026', '3018', '徽县', '2', '-0-2945-3018-', 'H', '', '0', '1458286461', '0', '0');
INSERT INTO `sr_area` VALUES ('3027', '3018', '两当县', '2', '-0-2945-3018-', 'L', '', '0', '1458286462', '0', '0');
INSERT INTO `sr_area` VALUES ('3028', '2945', '临夏回族自治州', '1', '-0-2945-', 'L', '', '0', '1458286463', '0', '0');
INSERT INTO `sr_area` VALUES ('3029', '3028', '临夏市', '2', '-0-2945-3028-', 'L', '', '0', '1458286464', '0', '0');
INSERT INTO `sr_area` VALUES ('3030', '3028', '临夏县', '2', '-0-2945-3028-', 'L', '', '0', '1458286465', '0', '0');
INSERT INTO `sr_area` VALUES ('3031', '3028', '康乐县', '2', '-0-2945-3028-', 'K', '', '0', '1458286466', '0', '0');
INSERT INTO `sr_area` VALUES ('3032', '3028', '永靖县', '2', '-0-2945-3028-', 'Y', '', '0', '1458286467', '0', '0');
INSERT INTO `sr_area` VALUES ('3033', '3028', '广河县', '2', '-0-2945-3028-', 'G', '', '0', '1458286468', '0', '0');
INSERT INTO `sr_area` VALUES ('3034', '3028', '和政县', '2', '-0-2945-3028-', 'H', '', '0', '1458286469', '0', '0');
INSERT INTO `sr_area` VALUES ('3035', '3028', '东乡族自治县', '2', '-0-2945-3028-', 'D', '', '0', '1458286470', '0', '0');
INSERT INTO `sr_area` VALUES ('3036', '3028', '积石山保安族东乡族撒拉族自治县', '2', '-0-2945-3028-', 'J', '', '0', '1458286471', '0', '0');
INSERT INTO `sr_area` VALUES ('3037', '2945', '甘南藏族自治州', '1', '-0-2945-', 'G', '', '0', '1458286472', '0', '0');
INSERT INTO `sr_area` VALUES ('3038', '3037', '合作市', '2', '-0-2945-3037-', 'H', '', '0', '1458286473', '0', '0');
INSERT INTO `sr_area` VALUES ('3039', '3037', '临潭县', '2', '-0-2945-3037-', 'L', '', '0', '1458286474', '0', '0');
INSERT INTO `sr_area` VALUES ('3040', '3037', '卓尼县', '2', '-0-2945-3037-', 'Z', '', '0', '1458286475', '0', '0');
INSERT INTO `sr_area` VALUES ('3041', '3037', '舟曲县', '2', '-0-2945-3037-', 'Z', '', '0', '1458286476', '0', '0');
INSERT INTO `sr_area` VALUES ('3042', '3037', '迭部县', '2', '-0-2945-3037-', 'D', '', '0', '1458286477', '0', '0');
INSERT INTO `sr_area` VALUES ('3043', '3037', '玛曲县', '2', '-0-2945-3037-', 'M', '', '0', '1458286478', '0', '0');
INSERT INTO `sr_area` VALUES ('3044', '3037', '碌曲县', '2', '-0-2945-3037-', 'L', '', '0', '1458286479', '0', '0');
INSERT INTO `sr_area` VALUES ('3045', '3037', '夏河县', '2', '-0-2945-3037-', 'X', '', '0', '1458286480', '0', '0');
INSERT INTO `sr_area` VALUES ('3046', '0', '青海', '0', '-0-', 'Q', '西北', '0', '1458286481', '0', '0');
INSERT INTO `sr_area` VALUES ('3047', '3046', '西宁市', '1', '-0-3046-', 'X', '', '0', '1458286482', '0', '0');
INSERT INTO `sr_area` VALUES ('3048', '3047', '城东区', '2', '-0-3046-3047-', 'C', '', '0', '1458286483', '0', '0');
INSERT INTO `sr_area` VALUES ('3049', '3047', '城中区', '2', '-0-3046-3047-', 'C', '', '0', '1458286484', '0', '0');
INSERT INTO `sr_area` VALUES ('3050', '3047', '城西区', '2', '-0-3046-3047-', 'C', '', '0', '1458286485', '0', '0');
INSERT INTO `sr_area` VALUES ('3051', '3047', '城北区', '2', '-0-3046-3047-', 'C', '', '0', '1458286486', '0', '0');
INSERT INTO `sr_area` VALUES ('3052', '3047', '大通回族土族自治县', '2', '-0-3046-3047-', 'D', '', '0', '1458286487', '0', '0');
INSERT INTO `sr_area` VALUES ('3053', '3047', '湟中县', '2', '-0-3046-3047-', '', '', '0', '1458286488', '0', '0');
INSERT INTO `sr_area` VALUES ('3054', '3047', '湟源县', '2', '-0-3046-3047-', '', '', '0', '1458286489', '0', '0');
INSERT INTO `sr_area` VALUES ('3055', '3046', '海东地区', '1', '-0-3046-', 'H', '', '0', '1458286490', '0', '0');
INSERT INTO `sr_area` VALUES ('3056', '3055', '平安县', '2', '-0-3046-3055-', 'P', '', '0', '1458286491', '0', '0');
INSERT INTO `sr_area` VALUES ('3057', '3055', '民和回族土族自治县', '2', '-0-3046-3055-', 'M', '', '0', '1458286492', '0', '0');
INSERT INTO `sr_area` VALUES ('3058', '3055', '乐都县', '2', '-0-3046-3055-', 'L', '', '0', '1458286493', '0', '0');
INSERT INTO `sr_area` VALUES ('3059', '3055', '互助土族自治县', '2', '-0-3046-3055-', 'H', '', '0', '1458286494', '0', '0');
INSERT INTO `sr_area` VALUES ('3060', '3055', '化隆回族自治县', '2', '-0-3046-3055-', 'H', '', '0', '1458286495', '0', '0');
INSERT INTO `sr_area` VALUES ('3061', '3055', '循化撒拉族自治县', '2', '-0-3046-3055-', 'X', '', '0', '1458286496', '0', '0');
INSERT INTO `sr_area` VALUES ('3062', '3046', '海北藏族自治州', '1', '-0-3046-', 'H', '', '0', '1458286497', '0', '0');
INSERT INTO `sr_area` VALUES ('3063', '3062', '门源回族自治县', '2', '-0-3046-3062-', 'M', '', '0', '1458286498', '0', '0');
INSERT INTO `sr_area` VALUES ('3064', '3062', '祁连县', '2', '-0-3046-3062-', 'Q', '', '0', '1458286499', '0', '0');
INSERT INTO `sr_area` VALUES ('3065', '3062', '海晏县', '2', '-0-3046-3062-', 'H', '', '0', '1458286500', '0', '0');
INSERT INTO `sr_area` VALUES ('3066', '3062', '刚察县', '2', '-0-3046-3062-', 'G', '', '0', '1458286501', '0', '0');
INSERT INTO `sr_area` VALUES ('3067', '3046', '黄南藏族自治州', '1', '-0-3046-', 'H', '', '0', '1458286502', '0', '0');
INSERT INTO `sr_area` VALUES ('3068', '3067', '同仁县', '2', '-0-3046-3067-', 'T', '', '0', '1458286503', '0', '0');
INSERT INTO `sr_area` VALUES ('3069', '3067', '尖扎县', '2', '-0-3046-3067-', 'J', '', '0', '1458286504', '0', '0');
INSERT INTO `sr_area` VALUES ('3070', '3067', '泽库县', '2', '-0-3046-3067-', 'Z', '', '0', '1458286505', '0', '0');
INSERT INTO `sr_area` VALUES ('3071', '3067', '河南蒙古族自治县', '2', '-0-3046-3067-', 'H', '', '0', '1458286506', '0', '0');
INSERT INTO `sr_area` VALUES ('3072', '3046', '海南藏族自治州', '1', '-0-3046-', 'H', '', '0', '1458286507', '0', '0');
INSERT INTO `sr_area` VALUES ('3073', '3072', '共和县', '2', '-0-3046-3072-', 'G', '', '0', '1458286508', '0', '0');
INSERT INTO `sr_area` VALUES ('3074', '3072', '同德县', '2', '-0-3046-3072-', 'T', '', '0', '1458286509', '0', '0');
INSERT INTO `sr_area` VALUES ('3075', '3072', '贵德县', '2', '-0-3046-3072-', 'G', '', '0', '1458286510', '0', '0');
INSERT INTO `sr_area` VALUES ('3076', '3072', '兴海县', '2', '-0-3046-3072-', 'X', '', '0', '1458286511', '0', '0');
INSERT INTO `sr_area` VALUES ('3077', '3072', '贵南县', '2', '-0-3046-3072-', 'G', '', '0', '1458286512', '0', '0');
INSERT INTO `sr_area` VALUES ('3078', '3046', '果洛藏族自治州', '1', '-0-3046-', 'G', '', '0', '1458286513', '0', '0');
INSERT INTO `sr_area` VALUES ('3079', '3078', '玛沁县', '2', '-0-3046-3078-', 'M', '', '0', '1458286514', '0', '0');
INSERT INTO `sr_area` VALUES ('3080', '3078', '班玛县', '2', '-0-3046-3078-', 'B', '', '0', '1458286515', '0', '0');
INSERT INTO `sr_area` VALUES ('3081', '3078', '甘德县', '2', '-0-3046-3078-', 'G', '', '0', '1458286516', '0', '0');
INSERT INTO `sr_area` VALUES ('3082', '3078', '达日县', '2', '-0-3046-3078-', 'D', '', '0', '1458286517', '0', '0');
INSERT INTO `sr_area` VALUES ('3083', '3078', '久治县', '2', '-0-3046-3078-', 'J', '', '0', '1458286518', '0', '0');
INSERT INTO `sr_area` VALUES ('3084', '3078', '玛多县', '2', '-0-3046-3078-', 'M', '', '0', '1458286519', '0', '0');
INSERT INTO `sr_area` VALUES ('3085', '3046', '玉树藏族自治州', '1', '-0-3046-', 'Y', '', '0', '1458286520', '0', '0');
INSERT INTO `sr_area` VALUES ('3086', '3085', '玉树县', '2', '-0-3046-3085-', 'Y', '', '0', '1458286521', '0', '0');
INSERT INTO `sr_area` VALUES ('3087', '3085', '杂多县', '2', '-0-3046-3085-', 'Z', '', '0', '1458286522', '0', '0');
INSERT INTO `sr_area` VALUES ('3088', '3085', '称多县', '2', '-0-3046-3085-', 'C', '', '0', '1458286523', '0', '0');
INSERT INTO `sr_area` VALUES ('3089', '3085', '治多县', '2', '-0-3046-3085-', 'Z', '', '0', '1458286524', '0', '0');
INSERT INTO `sr_area` VALUES ('3090', '3085', '囊谦县', '2', '-0-3046-3085-', 'N', '', '0', '1458286525', '0', '0');
INSERT INTO `sr_area` VALUES ('3091', '3085', '曲麻莱县', '2', '-0-3046-3085-', 'Q', '', '0', '1458286526', '0', '0');
INSERT INTO `sr_area` VALUES ('3092', '3046', '海西蒙古族藏族自治州', '1', '-0-3046-', 'H', '', '0', '1458286527', '0', '0');
INSERT INTO `sr_area` VALUES ('3093', '3092', '格尔木市', '2', '-0-3046-3092-', 'G', '', '0', '1458286528', '0', '0');
INSERT INTO `sr_area` VALUES ('3094', '3092', '德令哈市', '2', '-0-3046-3092-', 'D', '', '0', '1458286529', '0', '0');
INSERT INTO `sr_area` VALUES ('3095', '3092', '乌兰县', '2', '-0-3046-3092-', 'W', '', '0', '1458286530', '0', '0');
INSERT INTO `sr_area` VALUES ('3096', '3092', '都兰县', '2', '-0-3046-3092-', 'D', '', '0', '1458286531', '0', '0');
INSERT INTO `sr_area` VALUES ('3097', '3092', '天峻县', '2', '-0-3046-3092-', 'T', '', '0', '1458286532', '0', '0');
INSERT INTO `sr_area` VALUES ('3098', '0', '宁夏', '0', '-0-', 'N', '西北', '0', '1458286533', '0', '0');
INSERT INTO `sr_area` VALUES ('3099', '3098', '银川市', '1', '-0-3098-', 'Y', '', '0', '1458286534', '0', '0');
INSERT INTO `sr_area` VALUES ('3100', '3099', '兴庆区', '2', '-0-3098-3099-', 'X', '', '0', '1458286535', '0', '0');
INSERT INTO `sr_area` VALUES ('3101', '3099', '西夏区', '2', '-0-3098-3099-', 'X', '', '0', '1458286536', '0', '0');
INSERT INTO `sr_area` VALUES ('3102', '3099', '金凤区', '2', '-0-3098-3099-', 'J', '', '0', '1458286537', '0', '0');
INSERT INTO `sr_area` VALUES ('3103', '3099', '永宁县', '2', '-0-3098-3099-', 'Y', '', '0', '1458286538', '0', '0');
INSERT INTO `sr_area` VALUES ('3104', '3099', '贺兰县', '2', '-0-3098-3099-', 'H', '', '0', '1458286539', '0', '0');
INSERT INTO `sr_area` VALUES ('3105', '3099', '灵武市', '2', '-0-3098-3099-', 'L', '', '0', '1458286540', '0', '0');
INSERT INTO `sr_area` VALUES ('3106', '3098', '石嘴山市', '1', '-0-3098-', 'S', '', '0', '1458286541', '0', '0');
INSERT INTO `sr_area` VALUES ('3107', '3106', '大武口区', '2', '-0-3098-3106-', 'D', '', '0', '1458286542', '0', '0');
INSERT INTO `sr_area` VALUES ('3108', '3106', '惠农区', '2', '-0-3098-3106-', 'H', '', '0', '1458286543', '0', '0');
INSERT INTO `sr_area` VALUES ('3109', '3106', '平罗县', '2', '-0-3098-3106-', 'P', '', '0', '1458286544', '0', '0');
INSERT INTO `sr_area` VALUES ('3110', '3098', '吴忠市', '1', '-0-3098-', 'W', '', '0', '1458286545', '0', '0');
INSERT INTO `sr_area` VALUES ('3111', '3110', '利通区', '2', '-0-3098-3110-', 'L', '', '0', '1458286546', '0', '0');
INSERT INTO `sr_area` VALUES ('3112', '3110', '盐池县', '2', '-0-3098-3110-', 'Y', '', '0', '1458286547', '0', '0');
INSERT INTO `sr_area` VALUES ('3113', '3110', '同心县', '2', '-0-3098-3110-', 'T', '', '0', '1458286548', '0', '0');
INSERT INTO `sr_area` VALUES ('3114', '3110', '青铜峡市', '2', '-0-3098-3110-', 'Q', '', '0', '1458286549', '0', '0');
INSERT INTO `sr_area` VALUES ('3115', '3098', '固原市', '1', '-0-3098-', 'G', '', '0', '1458286550', '0', '0');
INSERT INTO `sr_area` VALUES ('3116', '3115', '原州区', '2', '-0-3098-3115-', 'Y', '', '0', '1458286551', '0', '0');
INSERT INTO `sr_area` VALUES ('3117', '3115', '西吉县', '2', '-0-3098-3115-', 'X', '', '0', '1458286552', '0', '0');
INSERT INTO `sr_area` VALUES ('3118', '3115', '隆德县', '2', '-0-3098-3115-', 'L', '', '0', '1458286553', '0', '0');
INSERT INTO `sr_area` VALUES ('3119', '3115', '泾源县', '2', '-0-3098-3115-', '', '', '0', '1458286554', '0', '0');
INSERT INTO `sr_area` VALUES ('3120', '3115', '彭阳县', '2', '-0-3098-3115-', 'P', '', '0', '1458286555', '0', '0');
INSERT INTO `sr_area` VALUES ('3121', '3098', '中卫市', '1', '-0-3098-', 'Z', '', '0', '1458286556', '0', '0');
INSERT INTO `sr_area` VALUES ('3122', '3121', '沙坡头区', '2', '-0-3098-3121-', 'S', '', '0', '1458286557', '0', '0');
INSERT INTO `sr_area` VALUES ('3123', '3121', '中宁县', '2', '-0-3098-3121-', 'Z', '', '0', '1458286558', '0', '0');
INSERT INTO `sr_area` VALUES ('3124', '3121', '海原县', '2', '-0-3098-3121-', 'H', '', '0', '1458286559', '0', '0');
INSERT INTO `sr_area` VALUES ('3125', '0', '新疆', '0', '-0-', 'X', '西北', '0', '1458286560', '0', '0');
INSERT INTO `sr_area` VALUES ('3126', '3125', '乌鲁木齐市', '1', '-0-3125-', 'W', '', '0', '1458286561', '0', '0');
INSERT INTO `sr_area` VALUES ('3127', '3126', '天山区', '2', '-0-3125-3126-', 'T', '', '0', '1458286562', '0', '0');
INSERT INTO `sr_area` VALUES ('3128', '3126', '沙依巴克区', '2', '-0-3125-3126-', 'S', '', '0', '1458286563', '0', '0');
INSERT INTO `sr_area` VALUES ('3129', '3126', '新市区', '2', '-0-3125-3126-', 'X', '', '0', '1458286564', '0', '0');
INSERT INTO `sr_area` VALUES ('3130', '3126', '水磨沟区', '2', '-0-3125-3126-', 'S', '', '0', '1458286565', '0', '0');
INSERT INTO `sr_area` VALUES ('3131', '3126', '头屯河区', '2', '-0-3125-3126-', 'T', '', '0', '1458286566', '0', '0');
INSERT INTO `sr_area` VALUES ('3132', '3126', '达坂城区', '2', '-0-3125-3126-', 'D', '', '0', '1458286567', '0', '0');
INSERT INTO `sr_area` VALUES ('3133', '3126', '米东区', '2', '-0-3125-3126-', 'M', '', '0', '1458286568', '0', '0');
INSERT INTO `sr_area` VALUES ('3134', '3126', '乌鲁木齐县', '2', '-0-3125-3126-', 'W', '', '0', '1458286569', '0', '0');
INSERT INTO `sr_area` VALUES ('3135', '3125', '克拉玛依市', '1', '-0-3125-', 'K', '', '0', '1458286570', '0', '0');
INSERT INTO `sr_area` VALUES ('3136', '3135', '独山子区', '2', '-0-3125-3135-', 'D', '', '0', '1458286571', '0', '0');
INSERT INTO `sr_area` VALUES ('3137', '3135', '克拉玛依区', '2', '-0-3125-3135-', 'K', '', '0', '1458286572', '0', '0');
INSERT INTO `sr_area` VALUES ('3138', '3135', '白碱滩区', '2', '-0-3125-3135-', 'B', '', '0', '1458286573', '0', '0');
INSERT INTO `sr_area` VALUES ('3139', '3135', '乌尔禾区', '2', '-0-3125-3135-', 'W', '', '0', '1458286574', '0', '0');
INSERT INTO `sr_area` VALUES ('3140', '3125', '吐鲁番地区', '1', '-0-3125-', 'T', '', '0', '1458286575', '0', '0');
INSERT INTO `sr_area` VALUES ('3141', '3140', '吐鲁番市', '2', '-0-3125-3140-', 'T', '', '0', '1458286576', '0', '0');
INSERT INTO `sr_area` VALUES ('3142', '3140', '鄯善县', '2', '-0-3125-3140-', '', '', '0', '1458286577', '0', '0');
INSERT INTO `sr_area` VALUES ('3143', '3140', '托克逊县', '2', '-0-3125-3140-', 'T', '', '0', '1458286578', '0', '0');
INSERT INTO `sr_area` VALUES ('3144', '3125', '哈密地区', '1', '-0-3125-', 'H', '', '0', '1458286579', '0', '0');
INSERT INTO `sr_area` VALUES ('3145', '3125', '昌吉回族自治州', '1', '-0-3125-', 'C', '', '0', '1458286580', '0', '0');
INSERT INTO `sr_area` VALUES ('3146', '3145', '昌吉市', '2', '-0-3125-3145-', 'C', '', '0', '1458286581', '0', '0');
INSERT INTO `sr_area` VALUES ('3147', '3145', '阜康市', '2', '-0-3125-3145-', 'F', '', '0', '1458286582', '0', '0');
INSERT INTO `sr_area` VALUES ('3148', '3145', '呼图壁县', '2', '-0-3125-3145-', 'H', '', '0', '1458286583', '0', '0');
INSERT INTO `sr_area` VALUES ('3149', '3145', '玛纳斯县', '2', '-0-3125-3145-', 'M', '', '0', '1458286584', '0', '0');
INSERT INTO `sr_area` VALUES ('3150', '3145', '奇台县', '2', '-0-3125-3145-', 'Q', '', '0', '1458286585', '0', '0');
INSERT INTO `sr_area` VALUES ('3151', '3145', '吉木萨尔县', '2', '-0-3125-3145-', 'J', '', '0', '1458286586', '0', '0');
INSERT INTO `sr_area` VALUES ('3152', '3145', '木垒哈萨克自治县', '2', '-0-3125-3145-', 'M', '', '0', '1458286587', '0', '0');
INSERT INTO `sr_area` VALUES ('3153', '3125', '博尔塔拉蒙古自治州', '1', '-0-3125-', 'B', '', '0', '1458286588', '0', '0');
INSERT INTO `sr_area` VALUES ('3154', '3153', '博乐市', '2', '-0-3125-3153-', 'B', '', '0', '1458286589', '0', '0');
INSERT INTO `sr_area` VALUES ('3155', '3153', '精河县', '2', '-0-3125-3153-', 'J', '', '0', '1458286590', '0', '0');
INSERT INTO `sr_area` VALUES ('3156', '3153', '温泉县', '2', '-0-3125-3153-', 'W', '', '0', '1458286591', '0', '0');
INSERT INTO `sr_area` VALUES ('3157', '3125', '巴音郭楞蒙古自治州', '1', '-0-3125-', 'B', '', '0', '1458286592', '0', '0');
INSERT INTO `sr_area` VALUES ('3158', '3157', '库尔勒市', '2', '-0-3125-3157-', 'K', '', '0', '1458286593', '0', '0');
INSERT INTO `sr_area` VALUES ('3159', '3157', '轮台县', '2', '-0-3125-3157-', 'L', '', '0', '1458286594', '0', '0');
INSERT INTO `sr_area` VALUES ('3160', '3157', '尉犁县', '2', '-0-3125-3157-', 'W', '', '0', '1458286595', '0', '0');
INSERT INTO `sr_area` VALUES ('3161', '3157', '若羌县', '2', '-0-3125-3157-', 'R', '', '0', '1458286596', '0', '0');
INSERT INTO `sr_area` VALUES ('3162', '3157', '且末县', '2', '-0-3125-3157-', 'Q', '', '0', '1458286597', '0', '0');
INSERT INTO `sr_area` VALUES ('3163', '3157', '焉耆回族自治县', '2', '-0-3125-3157-', 'Y', '', '0', '1458286598', '0', '0');
INSERT INTO `sr_area` VALUES ('3164', '3157', '和静县', '2', '-0-3125-3157-', 'H', '', '0', '1458286599', '0', '0');
INSERT INTO `sr_area` VALUES ('3165', '3157', '和硕县', '2', '-0-3125-3157-', 'H', '', '0', '1458286600', '0', '0');
INSERT INTO `sr_area` VALUES ('3166', '3157', '博湖县', '2', '-0-3125-3157-', 'B', '', '0', '1458286601', '0', '0');
INSERT INTO `sr_area` VALUES ('3167', '3125', '阿克苏地区', '1', '-0-3125-', 'A', '', '0', '1458286602', '0', '0');
INSERT INTO `sr_area` VALUES ('3168', '3167', '阿克苏市', '2', '-0-3125-3167-', 'A', '', '0', '1458286603', '0', '0');
INSERT INTO `sr_area` VALUES ('3169', '3167', '温宿县', '2', '-0-3125-3167-', 'W', '', '0', '1458286604', '0', '0');
INSERT INTO `sr_area` VALUES ('3170', '3167', '库车县', '2', '-0-3125-3167-', 'K', '', '0', '1458286605', '0', '0');
INSERT INTO `sr_area` VALUES ('3171', '3167', '沙雅县', '2', '-0-3125-3167-', 'S', '', '0', '1458286606', '0', '0');
INSERT INTO `sr_area` VALUES ('3172', '3167', '新和县', '2', '-0-3125-3167-', 'X', '', '0', '1458286607', '0', '0');
INSERT INTO `sr_area` VALUES ('3173', '3167', '拜城县', '2', '-0-3125-3167-', 'B', '', '0', '1458286608', '0', '0');
INSERT INTO `sr_area` VALUES ('3174', '3167', '乌什县', '2', '-0-3125-3167-', 'W', '', '0', '1458286609', '0', '0');
INSERT INTO `sr_area` VALUES ('3175', '3167', '阿瓦提县', '2', '-0-3125-3167-', 'A', '', '0', '1458286610', '0', '0');
INSERT INTO `sr_area` VALUES ('3176', '3167', '柯坪县', '2', '-0-3125-3167-', 'K', '', '0', '1458286611', '0', '0');
INSERT INTO `sr_area` VALUES ('3177', '3125', '克孜勒苏柯尔克孜自治州', '1', '-0-3125-', 'K', '', '0', '1458286612', '0', '0');
INSERT INTO `sr_area` VALUES ('3178', '3177', '阿图什市', '2', '-0-3125-3177-', 'A', '', '0', '1458286613', '0', '0');
INSERT INTO `sr_area` VALUES ('3179', '3177', '阿克陶县', '2', '-0-3125-3177-', 'A', '', '0', '1458286614', '0', '0');
INSERT INTO `sr_area` VALUES ('3180', '3177', '阿合奇县', '2', '-0-3125-3177-', 'A', '', '0', '1458286615', '0', '0');
INSERT INTO `sr_area` VALUES ('3181', '3177', '乌恰县', '2', '-0-3125-3177-', 'W', '', '0', '1458286616', '0', '0');
INSERT INTO `sr_area` VALUES ('3182', '3125', '喀什地区', '1', '-0-3125-', 'K', '', '0', '1458286617', '0', '0');
INSERT INTO `sr_area` VALUES ('3183', '3182', '喀什市', '2', '-0-3125-3182-', 'K', '', '0', '1458286618', '0', '0');
INSERT INTO `sr_area` VALUES ('3184', '3182', '疏附县', '2', '-0-3125-3182-', 'S', '', '0', '1458286619', '0', '0');
INSERT INTO `sr_area` VALUES ('3185', '3182', '疏勒县', '2', '-0-3125-3182-', 'S', '', '0', '1458286620', '0', '0');
INSERT INTO `sr_area` VALUES ('3186', '3182', '英吉沙县', '2', '-0-3125-3182-', 'Y', '', '0', '1458286621', '0', '0');
INSERT INTO `sr_area` VALUES ('3187', '3182', '泽普县', '2', '-0-3125-3182-', 'Z', '', '0', '1458286622', '0', '0');
INSERT INTO `sr_area` VALUES ('3188', '3182', '莎车县', '2', '-0-3125-3182-', 'S', '', '0', '1458286623', '0', '0');
INSERT INTO `sr_area` VALUES ('3189', '3182', '叶城县', '2', '-0-3125-3182-', 'Y', '', '0', '1458286624', '0', '0');
INSERT INTO `sr_area` VALUES ('3190', '3182', '麦盖提县', '2', '-0-3125-3182-', 'M', '', '0', '1458286625', '0', '0');
INSERT INTO `sr_area` VALUES ('3191', '3182', '岳普湖县', '2', '-0-3125-3182-', 'Y', '', '0', '1458286626', '0', '0');
INSERT INTO `sr_area` VALUES ('3192', '3182', '伽师县', '2', '-0-3125-3182-', '', '', '0', '1458286627', '0', '0');
INSERT INTO `sr_area` VALUES ('3193', '3182', '巴楚县', '2', '-0-3125-3182-', 'B', '', '0', '1458286628', '0', '0');
INSERT INTO `sr_area` VALUES ('3194', '3182', '塔什库尔干塔吉克自治县', '2', '-0-3125-3182-', 'T', '', '0', '1458286629', '0', '0');
INSERT INTO `sr_area` VALUES ('3195', '3125', '和田地区', '1', '-0-3125-', 'H', '', '0', '1458286630', '0', '0');
INSERT INTO `sr_area` VALUES ('3196', '3195', '和田市', '2', '-0-3125-3195-', 'H', '', '0', '1458286631', '0', '0');
INSERT INTO `sr_area` VALUES ('3197', '3195', '和田县', '2', '-0-3125-3195-', 'H', '', '0', '1458286632', '0', '0');
INSERT INTO `sr_area` VALUES ('3198', '3195', '墨玉县', '2', '-0-3125-3195-', 'M', '', '0', '1458286633', '0', '0');
INSERT INTO `sr_area` VALUES ('3199', '3195', '皮山县', '2', '-0-3125-3195-', 'P', '', '0', '1458286634', '0', '0');
INSERT INTO `sr_area` VALUES ('3200', '3195', '洛浦县', '2', '-0-3125-3195-', 'L', '', '0', '1458286635', '0', '0');
INSERT INTO `sr_area` VALUES ('3201', '3195', '策勒县', '2', '-0-3125-3195-', 'C', '', '0', '1458286636', '0', '0');
INSERT INTO `sr_area` VALUES ('3202', '3195', '于田县', '2', '-0-3125-3195-', 'Y', '', '0', '1458286637', '0', '0');
INSERT INTO `sr_area` VALUES ('3203', '3195', '民丰县', '2', '-0-3125-3195-', 'M', '', '0', '1458286638', '0', '0');
INSERT INTO `sr_area` VALUES ('3204', '3125', '伊犁哈萨克自治州', '1', '-0-3125-', 'Y', '', '0', '1458286639', '0', '0');
INSERT INTO `sr_area` VALUES ('3205', '3204', '伊宁市', '2', '-0-3125-3204-', 'Y', '', '0', '1458286640', '0', '0');
INSERT INTO `sr_area` VALUES ('3206', '3204', '奎屯市', '2', '-0-3125-3204-', 'K', '', '0', '1458286641', '0', '0');
INSERT INTO `sr_area` VALUES ('3207', '3204', '伊宁县', '2', '-0-3125-3204-', 'Y', '', '0', '1458286642', '0', '0');
INSERT INTO `sr_area` VALUES ('3208', '3204', '察布查尔锡伯自治县', '2', '-0-3125-3204-', 'C', '', '0', '1458286643', '0', '0');
INSERT INTO `sr_area` VALUES ('3209', '3204', '霍城县', '2', '-0-3125-3204-', 'H', '', '0', '1458286644', '0', '0');
INSERT INTO `sr_area` VALUES ('3210', '3204', '巩留县', '2', '-0-3125-3204-', 'G', '', '0', '1458286645', '0', '0');
INSERT INTO `sr_area` VALUES ('3211', '3204', '新源县', '2', '-0-3125-3204-', 'X', '', '0', '1458286646', '0', '0');
INSERT INTO `sr_area` VALUES ('3212', '3204', '昭苏县', '2', '-0-3125-3204-', 'Z', '', '0', '1458286647', '0', '0');
INSERT INTO `sr_area` VALUES ('3213', '3204', '特克斯县', '2', '-0-3125-3204-', 'T', '', '0', '1458286648', '0', '0');
INSERT INTO `sr_area` VALUES ('3214', '3204', '尼勒克县', '2', '-0-3125-3204-', 'N', '', '0', '1458286649', '0', '0');
INSERT INTO `sr_area` VALUES ('3215', '3125', '塔城地区', '1', '-0-3125-', 'T', '', '0', '1458286650', '0', '0');
INSERT INTO `sr_area` VALUES ('3216', '3215', '塔城市', '2', '-0-3125-3215-', 'T', '', '0', '1458286651', '0', '0');
INSERT INTO `sr_area` VALUES ('3217', '3215', '乌苏市', '2', '-0-3125-3215-', 'W', '', '0', '1458286652', '0', '0');
INSERT INTO `sr_area` VALUES ('3218', '3215', '额敏县', '2', '-0-3125-3215-', 'E', '', '0', '1458286653', '0', '0');
INSERT INTO `sr_area` VALUES ('3219', '3215', '沙湾县', '2', '-0-3125-3215-', 'S', '', '0', '1458286654', '0', '0');
INSERT INTO `sr_area` VALUES ('3220', '3215', '托里县', '2', '-0-3125-3215-', 'T', '', '0', '1458286655', '0', '0');
INSERT INTO `sr_area` VALUES ('3221', '3215', '裕民县', '2', '-0-3125-3215-', 'Y', '', '0', '1458286656', '0', '0');

-- ----------------------------
-- Table structure for sr_atme
-- ----------------------------
DROP TABLE IF EXISTS `sr_atme`;
CREATE TABLE `sr_atme` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，@我的编号',
  `table` char(15) NOT NULL COMMENT '存储应用内容的表名',
  `row_id` int(11) NOT NULL COMMENT '应用含有@的内容的编号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '被@的用户的编号',
  PRIMARY KEY (`id`),
  KEY `app_2` (`uid`,`table`) USING BTREE,
  KEY `app_3` (`table`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='@记录表\r\n记录被@的信息';

-- ----------------------------
-- Records of sr_atme
-- ----------------------------

-- ----------------------------
-- Table structure for sr_chat
-- ----------------------------
DROP TABLE IF EXISTS `sr_chat`;
CREATE TABLE `sr_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '接收人id',
  `content` text COMMENT 'json 格式的消息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sr_chat
-- ----------------------------
INSERT INTO `sr_chat` VALUES ('636', '188', '{\"Local_url\":\"\\/data\\/data\\/com.cnsunrun.talk\\/cache\\/1464081271828.mp3\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160511\\/5732e4bd2fdb8.jpg\",\"from_name\":\"\\u4e3f\\u4e36\",\"from_uid\":\"82\",\"id\":\"1464081271732\",\"length\":\"4\",\"msg_type\":\"VOICE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/voice\\/71c8a1c4eb314512.mp3\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160523\\/57427c51023d2.jpg\",\"to_name\":\"123\",\"to_uid\":\"188\",\"add_time\":1464081271732}');
INSERT INTO `sr_chat` VALUES ('637', '188', '{\"Local_url\":\"\\/data\\/data\\/com.cnsunrun.talk\\/cache\\/1464081391315.mp3\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160511\\/5732e4bd2fdb8.jpg\",\"from_name\":\"\\u4e3f\\u4e36\",\"from_uid\":\"82\",\"id\":\"1464081391277\",\"length\":\"10\",\"msg_type\":\"VOICE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/voice\\/c72f5fd2f3bf1c91.mp3\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160523\\/57427c51023d2.jpg\",\"to_name\":\"123\",\"to_uid\":\"188\",\"add_time\":1464081391277}');
INSERT INTO `sr_chat` VALUES ('638', '188', '{\"Local_url\":\"\\/data\\/data\\/com.cnsunrun.talk\\/cache\\/1464081707179.mp3\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160511\\/5732e4bd2fdb8.jpg\",\"from_name\":\"\\u4e3f\\u4e36\",\"from_uid\":\"82\",\"id\":\"1464081707130\",\"length\":\"10\",\"msg_type\":\"VOICE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/voice\\/032647fd3f542162.mp3\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160523\\/57427c51023d2.jpg\",\"to_name\":\"123\",\"to_uid\":\"188\",\"add_time\":1464081707130}');
INSERT INTO `sr_chat` VALUES ('639', '188', '{\"Local_url\":\"\\/data\\/data\\/com.cnsunrun.talk\\/cache\\/1464082059529.mp3\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160511\\/5732e4bd2fdb8.jpg\",\"from_name\":\"\\u4e3f\\u4e36\",\"from_uid\":\"82\",\"id\":\"1464082059474\",\"length\":\"10\",\"msg_type\":\"VOICE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/voice\\/3f5b7ee96a5bc2b0.mp3\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160523\\/57427c51023d2.jpg\",\"to_name\":\"123\",\"to_uid\":\"188\",\"add_time\":1464082059474}');
INSERT INTO `sr_chat` VALUES ('640', '188', '{\"Local_url\":\"\\/data\\/data\\/com.cnsunrun.talk\\/cache\\/1464082355815.mp3\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160511\\/5732e4bd2fdb8.jpg\",\"from_name\":\"\\u4e3f\\u4e36\",\"from_uid\":\"82\",\"id\":\"1464082355765\",\"length\":\"10\",\"msg_type\":\"VOICE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/voice\\/13901b57b7810982.mp3\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160523\\/57427c51023d2.jpg\",\"to_name\":\"123\",\"to_uid\":\"188\",\"add_time\":1464082355765}');
INSERT INTO `sr_chat` VALUES ('655', '92', '{\"Local_url\":\"\\/data\\/user\\/0\\/com.cnsunrun.talk\\/cache\\/1464090908835.mp3\",\"add_time\":1464090908767,\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"from_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"from_uid\":\"80\",\"id\":\"1464090908767\",\"length\":\"3\",\"msg_type\":\"VOICE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/voice\\/6583f3267cefdbdb.mp3\",\"to_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/8A9AA39C54864FB63E3C65A33782CCE7\\/40\",\"to_name\":\"\\u5929\\u624d\\u5728\\u5de6\\uff0c\\u75af\\u5b50\\u5728\\u53f3\",\"to_uid\":\"92\",\"type\":\"send_one\"}');
INSERT INTO `sr_chat` VALUES ('734', '89', '{\"type\":\"send_one\",\"content\":\"\\u989d\\u989d\",\"from_icon\":\"\",\"from_name\":\"\\u731c\\u731c\\u6211\\u662f\\u8c01\",\"from_uid\":\"207\",\"id\":\"1464252916030\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160512\\/5733e80f2aa10.jpg\",\"to_name\":\"\\u6b6a\\u6b6a\",\"to_uid\":\"89\",\"add_time\":1464252916030}');
INSERT INTO `sr_chat` VALUES ('802', '122', '{\"to_uid\":\"122\",\"content\":\"\\u80fd\\u770b\\u89c1\\u5417[\\u9f87\\u7259]\",\"from_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105299997\\/4DC3AE5209EFB8997FDA429FC03CCCFA\\/100\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160516\\/573975005b035.jpg\",\"to_name\":\"\\u91d1\\u91d1\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"126\",\"add_time\":\"1464581046797\"}');
INSERT INTO `sr_chat` VALUES ('803', '122', '{\"to_uid\":\"122\",\"content\":\"\\u5728\\u7ebf\\u804a\\u5929\\u4f20\\u8f93\\u8c8c\\u4f3c\\u4e0d\\u5feb\",\"from_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105299997\\/4DC3AE5209EFB8997FDA429FC03CCCFA\\/100\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160516\\/573975005b035.jpg\",\"to_name\":\"\\u91d1\\u91d1\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"126\",\"add_time\":\"1464581066453\"}');
INSERT INTO `sr_chat` VALUES ('875', '92', '{\"Local_url\":\"\\/storage\\/sdcard0\\/DCIM\\/cnsunrun_talk\\/1463650701674.jpg\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"from_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"from_uid\":\"80\",\"id\":\"1464848709876\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/f2056bb50939f979.jpg\",\"to_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/8A9AA39C54864FB63E3C65A33782CCE7\\/40\",\"to_name\":\"\\u5929\\u624d\\u5728\\u5de6\\uff0c\\u75af\\u5b50\\u5728\\u53f3\",\"to_uid\":\"92\",\"add_time\":1464848709876}');
INSERT INTO `sr_chat` VALUES ('876', '92', '{\"type\":\"send_one\",\"content\":\"[\\u574f\\u7b11][\\u5927\\u5175][\\u5927\\u5175][\\u5927\\u54ed]\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"from_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"from_uid\":\"80\",\"id\":\"1464848715360\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/8A9AA39C54864FB63E3C65A33782CCE7\\/40\",\"to_name\":\"\\u5929\\u624d\\u5728\\u5de6\\uff0c\\u75af\\u5b50\\u5728\\u53f3\",\"to_uid\":\"92\",\"add_time\":1464848715360}');
INSERT INTO `sr_chat` VALUES ('878', '180', '{\"to_uid\":\"180\",\"content\":\"1111\",\"from_name\":\"\\u4f20\\u9053\\n\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/5751466a82703.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160523\\/57426f1d9e79a.jpg\",\"to_name\":\"\\u6e5b\\u84dd\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"84\",\"add_time\":\"1464944595697\"}');
INSERT INTO `sr_chat` VALUES ('882', '180', '{\"to_uid\":\"180\",\"from_name\":\"\\u4f20\\u9053\\n\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/5751466a82703.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160523\\/57426f1d9e79a.jpg\",\"to_name\":\"\\u6e5b\\u84dd\",\"msg_type\":\"IMAGE\",\"type\":\"send_one\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/7cf5643805d48e01.jpg\",\"from_uid\":\"84\",\"add_time\":\"1464945009522\"}');
INSERT INTO `sr_chat` VALUES ('883', '180', '{\"to_uid\":\"180\",\"from_name\":\"\\u4f20\\u9053\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/5751466a82703.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160523\\/57426f1d9e79a.jpg\",\"to_name\":\"\\u6e5b\\u84dd\",\"msg_type\":\"IMAGE\",\"type\":\"send_one\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/1320da3a65803ea6.jpg\",\"from_uid\":\"84\",\"add_time\":\"1464945443829\"}');
INSERT INTO `sr_chat` VALUES ('884', '210', '{\"to_uid\":\"210\",\"content\":\"\\u5c1a\\u8f6f\\u79d1\\u6280\",\"from_name\":\"\\u4f20\\u9053\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/5751466a82703.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/57514853e438b.jpg\",\"to_name\":\"\\u6768\\u5f00\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"84\",\"add_time\":\"1464945513446\"}');
INSERT INTO `sr_chat` VALUES ('885', '210', '{\"to_uid\":\"210\",\"content\":\"\\u5c1a\\u8f6f\\u79d1\\u6280\",\"from_name\":\"\\u4f20\\u9053\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/5751466a82703.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/57514853e438b.jpg\",\"to_name\":\"\\u6768\\u5f00\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"84\",\"add_time\":\"1464946228210\"}');
INSERT INTO `sr_chat` VALUES ('887', '210', '{\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/5751466a82703.jpg\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/cd59a4fd04bce782.jpg\",\"type\":\"send_one\",\"to_name\":\"\\u6768\\u5f00\",\"msg_type\":\"IMAGE\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/57514853e438b.jpg\",\"from_name\":\"\\u4f20\\u9053\",\"to_uid\":\"210\",\"add_time\":\"1464946633933\",\"from_uid\":\"84\"}');
INSERT INTO `sr_chat` VALUES ('888', '126', '{\"type\":\"send_one\",\"content\":\"[\\u53f3\\u54fc\\u54fc]\",\"from_icon\":\"\",\"from_name\":\"\\u563f\\u563f\\u563f\",\"from_uid\":\"211\",\"id\":\"1464946686447\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105299997\\/4DC3AE5209EFB8997FDA429FC03CCCFA\\/100\",\"to_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"to_uid\":\"126\",\"add_time\":1464946686447}');
INSERT INTO `sr_chat` VALUES ('889', '126', '{\"type\":\"send_one\",\"content\":\"11\",\"from_icon\":\"\",\"from_name\":\"\\u563f\\u563f\\u563f\",\"from_uid\":\"211\",\"id\":\"1464947326007\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105299997\\/4DC3AE5209EFB8997FDA429FC03CCCFA\\/100\",\"to_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"to_uid\":\"126\",\"add_time\":1464947326007}');
INSERT INTO `sr_chat` VALUES ('912', '84', '{\"type\":\"send_one\",\"content\":\"\\u54c8\\u54c8\\u54c8\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"from_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"from_uid\":\"80\",\"id\":\"1464953073101\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160603\\/5751466a82703.jpg\",\"to_name\":\"\\u4f20\\u9053\",\"to_uid\":\"84\",\"add_time\":1464953073101}');
INSERT INTO `sr_chat` VALUES ('926', '232', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"\\u5916\\u5a46\\u5bb6\\u7684\\u6447\\u7bee\",\"content\":\"1\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"232\",\"add_time\":\"1465185468153\",\"from_uid\":\"235\"}');
INSERT INTO `sr_chat` VALUES ('927', '232', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"\\u5916\\u5a46\\u5bb6\\u7684\\u6447\\u7bee\",\"content\":\"1\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"232\",\"add_time\":\"1465185540988\",\"from_uid\":\"235\"}');
INSERT INTO `sr_chat` VALUES ('928', '80', '{\"type\":\"send_one\",\"content\":\"[\\u50b2\\u6162][\\u50b2\\u6162][\\u50b2\\u6162]\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186080103\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186080103}');
INSERT INTO `sr_chat` VALUES ('929', '80', '{\"Local_url\":\"\\/storage\\/emulated\\/0\\/DCIM\\/cnsunrun_talk\\/-6dc0a105d1238cd.jpg\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186092152\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/34caee4e8e4409a1.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186092152}');
INSERT INTO `sr_chat` VALUES ('930', '80', '{\"Local_url\":\"\\/storage\\/emulated\\/0\\/DCIM\\/cnsunrun_talk\\/7a9fad963993ede9.jpg\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186092270\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/38fef467b627c3d6.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186092270}');
INSERT INTO `sr_chat` VALUES ('931', '80', '{\"Local_url\":\"\\/storage\\/emulated\\/0\\/DCIM\\/cnsunrun_talk\\/7e66c66128847724.gif\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186092450\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/ea268201931ff085.gif\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186092450}');
INSERT INTO `sr_chat` VALUES ('932', '80', '{\"Local_url\":\"\\/storage\\/emulated\\/0\\/DCIM\\/cnsunrun_talk\\/11dd6e7746ec0969.jpg\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186092501\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/7a3f9c5ca95ee364.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186092501}');
INSERT INTO `sr_chat` VALUES ('933', '80', '{\"Local_url\":\"\\/storage\\/emulated\\/0\\/DCIM\\/cnsunrun_talk\\/-14e71355a964cbff.jpg\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186092569\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/3d24c832f7543708.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186092569}');
INSERT INTO `sr_chat` VALUES ('934', '80', '{\"Local_url\":\"\\/storage\\/emulated\\/0\\/DCIM\\/cnsunrun_talk\\/-17f89381ef0e8702.gif\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186092662\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/09ea006537dde1cb.gif\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186092662}');
INSERT INTO `sr_chat` VALUES ('935', '80', '{\"Local_url\":\"\\/storage\\/emulated\\/0\\/DCIM\\/cnsunrun_talk\\/19bb98b97077d049.gif\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186092709\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/69d1b7a00a479a77.gif\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186092709}');
INSERT INTO `sr_chat` VALUES ('936', '80', '{\"Local_url\":\"\\/storage\\/emulated\\/0\\/DCIM\\/cnsunrun_talk\\/-7c56d01b5b0d5bbb.gif\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186092390\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/a4f6af83326581f4.gif\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186092390}');
INSERT INTO `sr_chat` VALUES ('937', '80', '{\"Local_url\":\"\\/storage\\/emulated\\/0\\/DCIM\\/cnsunrun_talk\\/7a35c5f5dc492154.jpg\",\"type\":\"send_one\",\"from_icon\":\"http:\\/\\/q.qlogo.cn\\/qqapp\\/1105299997\\/52A562B2566D04F2AAC88854DB6AFA3B\\/100\",\"from_name\":\"\\u6668\\u6668\\u6668\\u6668\\u6668\\u3001\",\"from_uid\":\"234\",\"id\":\"1465186092336\",\"msg_type\":\"IMAGE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/3c7105fafb40f863.jpg\",\"to_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160524\\/574431a0e7077.jpg\",\"to_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\\u2728\",\"to_uid\":\"80\",\"add_time\":1465186092336}');
INSERT INTO `sr_chat` VALUES ('938', '239', '{\"to_uid\":\"239\",\"content\":\"\\u560e\\u560e\",\"from_name\":\"\\u5916\\u5a46\\u5bb6\\u7684\\u6447\\u7bee\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"to_name\":\"\\u6768\\u5f00\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"237\",\"add_time\":\"1465186354638\"}');
INSERT INTO `sr_chat` VALUES ('975', '247', '{\"to_uid\":\"247\",\"content\":\"111\",\"from_name\":\"\\u4e01\\u4f1f\\u624b\\u673a\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160607\\/575637be568e1.jpg\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"to_name\":\"\\u5916\\u5a46\\u5bb6\\u7684\\u6447\\u7bee\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"233\",\"add_time\":\"1465711946534\"}');
INSERT INTO `sr_chat` VALUES ('976', '247', '{\"to_uid\":\"247\",\"content\":\"222\",\"from_name\":\"\\u4e01\\u4f1f\\u624b\\u673a\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160607\\/575637be568e1.jpg\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"to_name\":\"\\u5916\\u5a46\\u5bb6\\u7684\\u6447\\u7bee\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"233\",\"add_time\":\"1465712049748\"}');
INSERT INTO `sr_chat` VALUES ('978', '247', '{\"to_uid\":\"247\",\"content\":\"Www\",\"from_name\":\"\\u4e01\\u4f1f\\u624b\\u673a\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160607\\/575637be568e1.jpg\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"to_name\":\"\\u5916\\u5a46\\u5bb6\\u7684\\u6447\\u7bee\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"233\",\"add_time\":\"1465716739942\"}');
INSERT INTO `sr_chat` VALUES ('1039', '240', '{\"type\":\"send_one\",\"content\":\"\\u54e6\\u54e6\",\"from_icon\":\"\",\"from_name\":\"\\u989c\\u603b\",\"from_uid\":\"252\",\"id\":\"1465892797097\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105299997\\/4DC3AE5209EFB8997FDA429FC03CCCFA\\/100\",\"to_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"to_uid\":\"240\",\"add_time\":1465892797097}');
INSERT INTO `sr_chat` VALUES ('1040', '240', '{\"type\":\"send_one\",\"content\":\"[\\u9ebb\\u5c06]\",\"from_icon\":\"\",\"from_name\":\"\\u989c\\u603b\",\"from_uid\":\"252\",\"id\":\"1465892804932\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105299997\\/4DC3AE5209EFB8997FDA429FC03CCCFA\\/100\",\"to_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"to_uid\":\"240\",\"add_time\":1465892804932}');
INSERT INTO `sr_chat` VALUES ('1041', '240', '{\"Local_url\":\"\\/data\\/data\\/com.cnsunrun.talk\\/cache\\/1465892817679.mp3\",\"type\":\"send_one\",\"from_icon\":\"\",\"from_name\":\"\\u989c\\u603b\",\"from_uid\":\"252\",\"id\":\"1465892817632\",\"length\":\"6\",\"msg_type\":\"VOICE\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/voice\\/efd300ee3189e54f.mp3\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105299997\\/4DC3AE5209EFB8997FDA429FC03CCCFA\\/100\",\"to_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"to_uid\":\"240\",\"add_time\":1465892817632}');
INSERT INTO `sr_chat` VALUES ('1082', '263', '{\"to_uid\":\"263\",\"from_name\":\"\\u4e01\\u4f1f\\u624b\\u673aQQ\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"to_icon\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw\\/0\",\"to_name\":\"\\u4e01\\u4f1f\",\"msg_type\":\"IMAGE\",\"type\":\"send_one\",\"net_url\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Chat\\/image\\/5b4334985900fc67.jpg\",\"from_uid\":\"250\",\"add_time\":\"1466174474332\"}');
INSERT INTO `sr_chat` VALUES ('1083', '263', '{\"to_uid\":\"263\",\"from_name\":\"\\u4e01\\u4f1f\\u624b\\u673aQQ\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"to_icon\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw\\/0\",\"to_name\":\"\\u4e01\\u4f1f\",\"msg_type\":\"CMD\",\"type\":\"send_one\",\"cmd\":\"revocation\",\"from_uid\":\"250\",\"add_time\":\"1466174474332\"}');
INSERT INTO `sr_chat` VALUES ('1084', '263', '{\"to_uid\":\"263\",\"content\":\"[\\u59d4\\u5c48][\\u53ef\\u7231]\",\"from_name\":\"\\u4e01\\u4f1f\\u624b\\u673aQQ\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"to_icon\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw\\/0\",\"to_name\":\"\\u4e01\\u4f1f\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"250\",\"add_time\":\"1466174492651\"}');
INSERT INTO `sr_chat` VALUES ('1085', '263', '{\"to_uid\":\"263\",\"content\":\"[\\u6293\\u72c2][\\u8272][\\u8272]\",\"from_name\":\"\\u4e01\\u4f1f\\u624b\\u673aQQ\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"to_icon\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw\\/0\",\"to_name\":\"\\u4e01\\u4f1f\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"250\",\"add_time\":\"1466174494452\"}');
INSERT INTO `sr_chat` VALUES ('1086', '263', '{\"to_uid\":\"263\",\"content\":\"[\\u59d4\\u5c48][\\u53ef\\u7231]\",\"from_name\":\"\\u4e01\\u4f1f\\u624b\\u673aQQ\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/D67D9D2734B5A302E69C8843C624375E\\/100\",\"to_icon\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw\\/0\",\"to_name\":\"\\u4e01\\u4f1f\",\"msg_type\":\"CMD\",\"type\":\"send_one\",\"cmd\":\"revocation\",\"from_uid\":\"250\",\"add_time\":\"1466174492651\"}');
INSERT INTO `sr_chat` VALUES ('1087', '265', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"\",\"content\":\"\\u7ecf\\u5178\\u52a8\\u753b\\u5c06\\u6253\\u51fb\",\"msg_type\":\"TEXT\",\"to_icon\":\"\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"265\",\"add_time\":\"1466418651898\",\"from_uid\":\"249\"}');
INSERT INTO `sr_chat` VALUES ('1088', '266', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"hycold\",\"content\":\"ndndnq\",\"msg_type\":\"TEXT\",\"to_icon\":\"\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"266\",\"add_time\":\"1466430179739\",\"from_uid\":\"249\"}');
INSERT INTO `sr_chat` VALUES ('1089', '266', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"hycold\",\"content\":\"cnnfjq\",\"msg_type\":\"TEXT\",\"to_icon\":\"\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"266\",\"add_time\":\"1466430181274\",\"from_uid\":\"249\"}');
INSERT INTO `sr_chat` VALUES ('1090', '266', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"hycold\",\"content\":\"[\\u5fae\\u7b11][\\u5f97\\u610f][\\u5fae\\u7b11][\\u5618][\\u5fae\\u7b11]\",\"msg_type\":\"TEXT\",\"to_icon\":\"\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"266\",\"add_time\":\"1466430183489\",\"from_uid\":\"249\"}');
INSERT INTO `sr_chat` VALUES ('1091', '267', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"11111\",\"content\":\"\\u7ecf\\u5e38\\u8fdb\\u884c\\u51e0\\u5757\\u94b1\",\"msg_type\":\"TEXT\",\"to_icon\":\"\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"267\",\"add_time\":\"1466430268360\",\"from_uid\":\"249\"}');
INSERT INTO `sr_chat` VALUES ('1092', '267', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"11111\",\"content\":\"[\\u6293\\u72c2][\\u5927\\u54ed][\\u6293\\u72c2][\\u5618][\\u6012]\",\"msg_type\":\"TEXT\",\"to_icon\":\"\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"267\",\"add_time\":\"1466430270874\",\"from_uid\":\"249\"}');
INSERT INTO `sr_chat` VALUES ('1094', '268', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"Mr.H\",\"content\":\"\\u6211\\u4e0d\\u77e5\\u9053\\u4f60\\u662f\\u4e0d\\u662f\\u8981\\u8fd9\\u4e2a \",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/667DDC2496CAF79B0F2D551D8CA0B1D5\\/100\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"268\",\"add_time\":\"1466503608444\",\"from_uid\":\"249\"}');
INSERT INTO `sr_chat` VALUES ('1095', '268', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"Mr.H\",\"content\":\"\\u7535\\u8111\\u7535\\u8111\\u7535\\u8111\\u5462\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/667DDC2496CAF79B0F2D551D8CA0B1D5\\/100\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"268\",\"add_time\":\"1466503654192\",\"from_uid\":\"249\"}');
INSERT INTO `sr_chat` VALUES ('1096', '268', '{\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/A404267378367D1C37C7ECB90F9CE31E\\/100\",\"type\":\"send_one\",\"to_name\":\"Mr.H\",\"content\":\"\\u5230\\u5bb6\\u9644\\u8fd1\\u9152\\u5e97\",\"msg_type\":\"TEXT\",\"to_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/667DDC2496CAF79B0F2D551D8CA0B1D5\\/100\",\"from_name\":\"\\u6768\\u5f00\",\"to_uid\":\"268\",\"add_time\":\"1466503677494\",\"from_uid\":\"249\"}');
INSERT INTO `sr_chat` VALUES ('1097', '269', '{\"to_uid\":\"269\",\"content\":\"[\\u9f87\\u7259][\\u9f87\\u7259][\\u9f87\\u7259]\",\"from_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/DB1E31E952FFEF224C89E6201C2FA467\\/100\",\"to_icon\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/jj4e65x0Px24HqBXGmsgqTm2x8OictY3ciaiatuHbicCFibyxmBmPBABrre5DwkmWoTUKlribCUku6EsR1lW2tYnwyH0KY1DUqOGwNWyNWAEseHrk\\/0\",\"to_name\":\"\\u6768\\u9704\\u7fbd \\u00b7 Michael Yang\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"253\",\"add_time\":\"1466653460709\"}');
INSERT INTO `sr_chat` VALUES ('1098', '269', '{\"to_uid\":\"269\",\"content\":\"\\u5185\\u90e8\\u6d4b\\u8bd5\\u7684\",\"from_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/DB1E31E952FFEF224C89E6201C2FA467\\/100\",\"to_icon\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/jj4e65x0Px24HqBXGmsgqTm2x8OictY3ciaiatuHbicCFibyxmBmPBABrre5DwkmWoTUKlribCUku6EsR1lW2tYnwyH0KY1DUqOGwNWyNWAEseHrk\\/0\",\"to_name\":\"\\u6768\\u9704\\u7fbd \\u00b7 Michael Yang\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"253\",\"add_time\":\"1466653466295\"}');
INSERT INTO `sr_chat` VALUES ('1099', '269', '{\"to_uid\":\"269\",\"content\":\"\\u591a\\u63d0\\u610f\\u89c1 \\u4f30\\u8ba1\\u6253\\u78e8\\u597d \\u4e5f\\u52302017\\u5e74\\u4e86\",\"from_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/DB1E31E952FFEF224C89E6201C2FA467\\/100\",\"to_icon\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/jj4e65x0Px24HqBXGmsgqTm2x8OictY3ciaiatuHbicCFibyxmBmPBABrre5DwkmWoTUKlribCUku6EsR1lW2tYnwyH0KY1DUqOGwNWyNWAEseHrk\\/0\",\"to_name\":\"\\u6768\\u9704\\u7fbd \\u00b7 Michael Yang\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"253\",\"add_time\":\"1466653488682\"}');
INSERT INTO `sr_chat` VALUES ('1100', '269', '{\"to_uid\":\"269\",\"content\":\"[\\u63e1\\u624b]\",\"from_name\":\"\\u83e9\\u63d0\\u9053\\u5fc3\",\"from_icon\":\"http:\\/\\/qzapp.qlogo.cn\\/qzapp\\/1105373679\\/DB1E31E952FFEF224C89E6201C2FA467\\/100\",\"to_icon\":\"http:\\/\\/wx.qlogo.cn\\/mmopen\\/jj4e65x0Px24HqBXGmsgqTm2x8OictY3ciaiatuHbicCFibyxmBmPBABrre5DwkmWoTUKlribCUku6EsR1lW2tYnwyH0KY1DUqOGwNWyNWAEseHrk\\/0\",\"to_name\":\"\\u6768\\u9704\\u7fbd \\u00b7 Michael Yang\",\"msg_type\":\"TEXT\",\"type\":\"send_one\",\"from_uid\":\"253\",\"add_time\":\"1466653495176\"}');
INSERT INTO `sr_chat` VALUES ('1105', '252', '{\"add_time\":1466683501232,\"content\":\"\\u50bb\\u53fc\\u4e48\",\"from_icon\":\"http:\\/\\/test.cnsunrun.com\\/qbk\\/Uploads\\/head\\/20160606\\/5754f48acb847.jpg\",\"from_name\":\"\\u6de1\\u5b9a\\u7684\\u7a0b\\u5e8f\\u733f\",\"from_uid\":\"238\",\"id\":\"1466683501232\",\"msg_type\":\"TEXT\",\"to_icon\":\"\",\"to_name\":\"\\u989c\\u603b\",\"to_uid\":\"252\",\"type\":\"send_one\"}');

-- ----------------------------
-- Table structure for sr_comment
-- ----------------------------
DROP TABLE IF EXISTS `sr_comment`;
CREATE TABLE `sr_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，评论编号',
  `table` varchar(100) NOT NULL DEFAULT '' COMMENT '被评论的内容所存储的表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户编号',
  `content` text NOT NULL COMMENT '评论内容',
  `feed_id` int(11) NOT NULL DEFAULT '0' COMMENT '被回复的评论的文章编号',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被回复id',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '评论发布的时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标记删除（0：没删除，1：已删除）',
  `is_audit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否已审核 0-未审核 1-已审核',
  `storey` int(11) NOT NULL DEFAULT '0' COMMENT '评论绝对楼层',
  `from_uid` int(11) NOT NULL DEFAULT '0' COMMENT '评论人id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  PRIMARY KEY (`id`),
  KEY `app` (`table`,`is_del`) USING BTREE,
  KEY `app_3` (`to_uid`,`is_del`,`table`) USING BTREE,
  KEY `app_2` (`uid`,`is_del`,`table`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of sr_comment
-- ----------------------------
INSERT INTO `sr_comment` VALUES ('301', '', '79', '', '386', '0', '1462974668', '1', '1', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('302', '', '79', '标题', '386', '0', '1462974677', '1', '0', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('303', '', '82', '(*°ω°*)ﾉ&quot;非战斗人员请撤离！！', '389', '0', '1463015841', '1', '0', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('304', '', '82', '来咯', '390', '0', '1463016092', '0', '0', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('305', '', '80', '你。也是耿直', '395', '0', '1463018983', '0', '0', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('306', '', '89', '花花', '397', '0', '1463020265', '0', '1', '0', '89', '0');
INSERT INTO `sr_comment` VALUES ('307', '', '89', '哈哈', '400', '0', '1463020686', '1', '0', '0', '89', '0');
INSERT INTO `sr_comment` VALUES ('308', '', '89', '回复', '400', '89', '1463020698', '0', '1', '0', '89', '307');
INSERT INTO `sr_comment` VALUES ('309', '', '89', '好漂亮啊', '400', '0', '1463021230', '0', '1', '0', '87', '0');
INSERT INTO `sr_comment` VALUES ('310', '', '89', '送几盆我撒', '400', '0', '1463021258', '0', '1', '0', '87', '0');
INSERT INTO `sr_comment` VALUES ('311', '', '87', '这周刚重新移植了，等度过危险期先。', '400', '87', '1463021996', '0', '1', '0', '89', '309');
INSERT INTO `sr_comment` VALUES ('312', '', '80', '大哥哥', '389', '80', '1463023928', '1', '1', '0', '82', '303');
INSERT INTO `sr_comment` VALUES ('313', '', '80', '看不到', '389', '80', '1463023940', '1', '1', '0', '82', '303');
INSERT INTO `sr_comment` VALUES ('314', '', '82', '呵呵', '389', '82', '1463024049', '1', '1', '0', '80', '303');
INSERT INTO `sr_comment` VALUES ('315', '', '82', '丢丢丢', '401', '0', '1463031772', '0', '1', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('316', '', '87', '烦躁', '399', '0', '1463031790', '0', '1', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('317', '', '82', '咯额', '401', '0', '1463033272', '0', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('318', '', '82', '伪锁', '401', '0', '1463033284', '0', '0', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('319', '', '80', '攻击', '401', '80', '1463033513', '0', '1', '0', '82', '318');
INSERT INTO `sr_comment` VALUES ('320', '', '94', '你是逗比么', '403', '0', '1463034232', '0', '1', '0', '67', '0');
INSERT INTO `sr_comment` VALUES ('321', '', '89', '可以啊可以啊', '400', '89', '1463041642', '0', '1', '0', '80', '309');
INSERT INTO `sr_comment` VALUES ('322', '', '95', '别这样', '404', '0', '1463044973', '0', '1', '0', '67', '0');
INSERT INTO `sr_comment` VALUES ('323', '', '80', '哈哈', '408', '0', '1463045116', '0', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('324', '', '89', '好漂亮啊', '400', '0', '1463047998', '0', '1', '0', '96', '0');
INSERT INTO `sr_comment` VALUES ('325', '', '94', '文明好不好', '403', '0', '1463048146', '0', '1', '0', '96', '0');
INSERT INTO `sr_comment` VALUES ('326', '', '79', '我们都市', '436', '0', '1463104023', '0', '1', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('327', '', '87', '121', '399', '0', '1463105096', '0', '1', '0', '0', '0');
INSERT INTO `sr_comment` VALUES ('328', '', '80', '啊啊啊', '395', '0', '1463105147', '0', '1', '0', '0', '0');
INSERT INTO `sr_comment` VALUES ('329', '', '95', '1', '404', '0', '1463105512', '0', '1', '0', '0', '0');
INSERT INTO `sr_comment` VALUES ('330', '', '80', '记录了', '395', '0', '1463105614', '0', '1', '0', '0', '0');
INSERT INTO `sr_comment` VALUES ('331', '', '80', '毕竟', '395', '0', '1463105662', '0', '1', '0', '0', '0');
INSERT INTO `sr_comment` VALUES ('332', '', '80', '', '395', '0', '1463105762', '0', '1', '0', '0', '0');
INSERT INTO `sr_comment` VALUES ('333', '', '79', '一', '386', '79', '1463106960', '0', '0', '0', '79', '302');
INSERT INTO `sr_comment` VALUES ('334', '', '79', '一件解决', '436', '79', '1463106965', '0', '0', '0', '79', '326');
INSERT INTO `sr_comment` VALUES ('335', '', '80', '什么情况', '461', '0', '1463114901', '0', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('336', '', '80', '哎', '461', '80', '1463114907', '0', '1', '0', '80', '335');
INSERT INTO `sr_comment` VALUES ('337', '', '79', '额额额', '462', '0', '1463114928', '0', '0', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('338', '', '80', '哈哈', '462', '80', '1463117637', '0', '1', '0', '80', '337');
INSERT INTO `sr_comment` VALUES ('339', '', '80', '哈哈哈', '460', '0', '1463118644', '0', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('340', '', '80', '太好了', '460', '80', '1463118654', '0', '1', '0', '80', '339');
INSERT INTO `sr_comment` VALUES ('341', '', '100', '哈哈', '471', '0', '1463121890', '0', '1', '0', '100', '0');
INSERT INTO `sr_comment` VALUES ('342', '', '84', '好', '478', '0', '1463126603', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('343', '', '106', 'Hi', '485', '0', '1463131206', '0', '1', '0', '106', '0');
INSERT INTO `sr_comment` VALUES ('344', '', '100', 'Hi', '473', '0', '1463131776', '0', '1', '0', '106', '0');
INSERT INTO `sr_comment` VALUES ('345', '', '100', 'Hi', '473', '0', '1463131779', '0', '1', '0', '106', '0');
INSERT INTO `sr_comment` VALUES ('346', '', '100', 'Hi', '473', '0', '1463131780', '0', '1', '0', '106', '0');
INSERT INTO `sr_comment` VALUES ('347', '', '100', 'Hi', '473', '0', '1463131783', '0', '1', '0', '106', '0');
INSERT INTO `sr_comment` VALUES ('348', '', '82', 'Test so hard', '401', '0', '1463133129', '0', '1', '0', '106', '0');
INSERT INTO `sr_comment` VALUES ('349', '', '79', '咯', '511', '0', '1463145693', '0', '0', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('350', '', '84', '我评论了', '538', '0', '1463363557', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('351', '', '84', '我回复了', '538', '84', '1463363564', '1', '1', '0', '84', '350');
INSERT INTO `sr_comment` VALUES ('352', '', '106', '看看', '473', '106', '1463370128', '0', '1', '0', '96', '347');
INSERT INTO `sr_comment` VALUES ('353', '', '122', '不错', '562', '0', '1463383921', '0', '1', '0', '122', '0');
INSERT INTO `sr_comment` VALUES ('354', '', '122', '赞一个', '561', '0', '1463386997', '0', '1', '0', '96', '0');
INSERT INTO `sr_comment` VALUES ('355', '', '122', '我是评论', '562', '0', '1463387308', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('356', '', '122', '我回复了', '562', '84', '1463387314', '0', '1', '0', '84', '355');
INSERT INTO `sr_comment` VALUES ('357', '', '122', '可以', '560', '0', '1463387342', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('358', '', '122', '小盆友好喜庆', '560', '0', '1463395069', '0', '1', '0', '126', '0');
INSERT INTO `sr_comment` VALUES ('359', '', '122', '漂亮的村子', '562', '0', '1463395349', '0', '1', '0', '126', '0');
INSERT INTO `sr_comment` VALUES ('360', '', '80', '我现在', '395', '0', '1463453699', '0', '1', '0', '112', '0');
INSERT INTO `sr_comment` VALUES ('361', '', '80', '把', '395', '0', '1463453718', '0', '1', '0', '112', '0');
INSERT INTO `sr_comment` VALUES ('362', '', '112', 'nnn', '574', '0', '1463454053', '0', '1', '0', '112', '0');
INSERT INTO `sr_comment` VALUES ('363', '', '112', 'bbb', '574', '0', '1463456414', '0', '0', '0', '112', '0');
INSERT INTO `sr_comment` VALUES ('364', '', '112', 'bjnnnngh', '574', '0', '1463456452', '0', '1', '0', '112', '0');
INSERT INTO `sr_comment` VALUES ('365', '', '112', '珉珉哦哦哦哦哦哦', '633', '0', '1463561250', '0', '1', '0', '112', '0');
INSERT INTO `sr_comment` VALUES ('366', '', '150', '哇哈哈哈', '656', '0', '1463644855', '0', '0', '0', '150', '0');
INSERT INTO `sr_comment` VALUES ('367', '', '150', '我也忘了', '656', '0', '1463645438', '0', '0', '0', '150', '0');
INSERT INTO `sr_comment` VALUES ('368', '', '150', '我让你摸婆婆婆婆陪你一起做生意且行且珍惜仔细一看我外婆6艘组织了一下也有利于学生一起学习小朋友水原希子一览无余自给自足语文数学水至清则无鱼呜呜呜嘘嘘嘘嘘十五字十五字行尸走肉所以我认为随心所欲', '656', '0', '1463645554', '0', '0', '0', '150', '0');
INSERT INTO `sr_comment` VALUES ('369', '', '79', '清理你妹', '634', '0', '1463696947', '0', '0', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('370', '', '92', '清理你妹这是啥', '626', '0', '1463696969', '0', '1', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('371', '', '84', '谁啊', '538', '0', '1463697018', '0', '1', '0', '96', '0');
INSERT INTO `sr_comment` VALUES ('372', '', '84', '时候', '538', '84', '1463697028', '1', '1', '0', '96', '350');
INSERT INTO `sr_comment` VALUES ('373', '', '79', '路径图互相', '634', '0', '1463715595', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('374', '', '150', 'nnnnjjnn', '657', '0', '1463739236', '0', '1', '0', '150', '0');
INSERT INTO `sr_comment` VALUES ('375', '', '150', 'bbjjjjjjj', '657', '0', '1463739250', '0', '1', '0', '150', '0');
INSERT INTO `sr_comment` VALUES ('376', '', '150', 'ghb', '657', '0', '1463742410', '0', '1', '0', '178', '0');
INSERT INTO `sr_comment` VALUES ('377', '', '179', 'hb', '704', '0', '1463742548', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('378', '', '179', 'ppp', '704', '0', '1463742579', '0', '1', '0', '178', '0');
INSERT INTO `sr_comment` VALUES ('379', '', '179', 'bbb', '704', '179', '1463742589', '0', '1', '0', '178', '377');
INSERT INTO `sr_comment` VALUES ('380', '', '179', 'vbjn', '704', '0', '1463742613', '0', '1', '0', '178', '0');
INSERT INTO `sr_comment` VALUES ('381', '', '180', '1231', '705', '0', '1463743097', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('382', '', '84', '1231123123123', '705', '84', '1463743109', '0', '1', '0', '84', '381');
INSERT INTO `sr_comment` VALUES ('383', '', '84', '654', '705', '84', '1463743115', '0', '1', '0', '180', '381');
INSERT INTO `sr_comment` VALUES ('384', '', '84', '你hklv', '705', '84', '1463743164', '0', '1', '0', '180', '381');
INSERT INTO `sr_comment` VALUES ('385', '', '84', '哈哼哦', '705', '84', '1463743194', '0', '1', '0', '180', '381');
INSERT INTO `sr_comment` VALUES ('386', '', '180', '123123', '705', '180', '1463743213', '0', '1', '0', '84', '381');
INSERT INTO `sr_comment` VALUES ('387', '', '180', '1111', '706', '0', '1463743288', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('388', '', '84', '2222', '706', '84', '1463743299', '0', '1', '0', '180', '387');
INSERT INTO `sr_comment` VALUES ('389', '', '179', 'hh', '704', '0', '1463743664', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('390', '', '179', '@ghj', '704', '0', '1463743762', '0', '0', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('391', '', '89', '怎么举报文章啊', '400', '0', '1463808618', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('392', '', '79', '刘巧', '724', '0', '1463930464', '0', '1', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('393', '', '79', '可以啊……小伙子', '724', '79', '1463930487', '1', '1', '0', '79', '392');
INSERT INTO `sr_comment` VALUES ('394', '', '79', '也是闹', '724', '79', '1463930508', '1', '1', '0', '79', '392');
INSERT INTO `sr_comment` VALUES ('395', '', '79', '嗯', '724', '0', '1463930518', '0', '1', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('396', '', '79', '123', '727', '0', '1463970013', '0', '1', '0', '180', '0');
INSERT INTO `sr_comment` VALUES ('397', '', '79', '呃呃呃呃', '727', '0', '1463974328', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('398', '', '79', '哈哈哈', '708', '0', '1463975873', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('399', '', '92', '哈哈哈', '626', '0', '1463975933', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('400', '', '79', '嘻嘻嘻', '719', '0', '1463975946', '0', '1', '0', '79', '0');
INSERT INTO `sr_comment` VALUES ('401', '', '79', '评论', '531', '0', '1463975964', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('402', '', '79', '后台没返回数据', '715', '0', '1463976108', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('403', '', '79', '是指删除功能无效还是不要删除', '712', '0', '1463976212', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('404', '', '79', '这个你把后台的提示文字修改下', '710', '0', '1463976256', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('405', '', '82', '好', '710', '82', '1463981101', '1', '1', '0', '79', '404');
INSERT INTO `sr_comment` VALUES ('406', '', '79', 'ff', '725', '0', '1463987436', '0', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('407', '', '79', 'sbb', '726', '0', '1463989149', '0', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('408', '', '79', '借钱', '726', '0', '1463989158', '1', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('409', '', '79', '土', '714', '0', '1463997151', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('410', '', '79', '上', '727', '0', '1463997664', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('411', '', '79', '测试这么仔细！？牛逼', '713', '0', '1464009379', '0', '1', '0', '96', '0');
INSERT INTO `sr_comment` VALUES ('412', '', '82', '二逼', '710', '82', '1464009402', '0', '1', '0', '96', '404');
INSERT INTO `sr_comment` VALUES ('413', '', '79', '二逼就要提示', '708', '0', '1464009422', '0', '1', '0', '96', '0');
INSERT INTO `sr_comment` VALUES ('414', '', '80', '多', '755', '0', '1464061696', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('415', '', '84', '等你等你拿到你', '755', '84', '1464061705', '0', '1', '0', '84', '414');
INSERT INTO `sr_comment` VALUES ('416', '', '179', '哈哈', '727', '179', '1464070410', '0', '1', '0', '82', '397');
INSERT INTO `sr_comment` VALUES ('417', '', '82', '哈哈', '0', '82', '1464070429', '0', '1', '0', '82', '404');
INSERT INTO `sr_comment` VALUES ('418', '', '79', '现在', '727', '0', '1464070448', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('419', '', '79', '呵呵呵呵呵', '727', '0', '1464070496', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('420', '', '79', '摸', '727', '0', '1464071051', '0', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('421', '', '82', '摸', '727', '82', '1464071072', '0', '1', '0', '82', '420');
INSERT INTO `sr_comment` VALUES ('422', '', '82', '还蛤蟆', '727', '82', '1464071270', '0', '1', '0', '82', '420');
INSERT INTO `sr_comment` VALUES ('423', '', '82', '拉面', '727', '82', '1464071551', '0', '1', '0', '82', '420');
INSERT INTO `sr_comment` VALUES ('424', '', '80', '11', '757', '0', '1464073135', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('425', '', '80', '22', '757', '0', '1464073141', '1', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('426', '', '80', '33', '757', '0', '1464073145', '1', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('427', '', '82', '图', '754', '0', '1464073194', '1', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('428', '', '82', '谈吗', '754', '0', '1464073205', '1', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('429', '', '80', '死', '757', '0', '1464074307', '1', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('430', '', '82', '111', '751', '0', '1464074822', '1', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('431', '', '84', '傻逼', '750', '0', '1464074840', '1', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('432', '', '82', '家里垃圾', '753', '0', '1464074900', '1', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('433', '', '84', '记录了', '750', '0', '1464074941', '1', '1', '0', '82', '0');
INSERT INTO `sr_comment` VALUES ('434', '', '82', '1111', '754', '0', '1464074981', '1', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('435', '', '82', '1111222', '754', '0', '1464074987', '1', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('436', '', '82', '哦哦哦', '754', '0', '1464076641', '1', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('437', '', '82', '咯莫', '754', '0', '1464076654', '0', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('438', '', '80', '嘎嘎噶', '757', '0', '1464076693', '0', '1', '0', '80', '0');
INSERT INTO `sr_comment` VALUES ('439', '', '80', 'o', '757', '80', '1464080685', '0', '1', '0', '84', '438');
INSERT INTO `sr_comment` VALUES ('440', '', '80', 'ov', '757', '80', '1464080692', '0', '1', '0', '84', '438');
INSERT INTO `sr_comment` VALUES ('441', '', '96', '傻屌', '708', '96', '1464104408', '0', '1', '0', '79', '413');
INSERT INTO `sr_comment` VALUES ('442', '', '87', '12313', '758', '0', '1464141777', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('443', '', '87', '大男大女呢', '758', '0', '1464185384', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('444', '', '96', '(⊙o⊙)', '708', '96', '1464220090', '0', '1', '0', '96', '413');
INSERT INTO `sr_comment` VALUES ('445', '', '96', '膜', '708', '96', '1464224132', '0', '1', '0', '96', '413');
INSERT INTO `sr_comment` VALUES ('446', '', '96', '哦JOJO', '708', '96', '1464224164', '0', '1', '0', '96', '413');
INSERT INTO `sr_comment` VALUES ('447', '', '84', '空', '757', '84', '1464224249', '0', '1', '0', '96', '438');
INSERT INTO `sr_comment` VALUES ('448', '', '84', '123', '755', '84', '1464225726', '0', '1', '0', '84', '414');
INSERT INTO `sr_comment` VALUES ('449', '', '82', '土', '727', '82', '1464225941', '0', '1', '0', '82', '420');
INSERT INTO `sr_comment` VALUES ('450', '', '106', '土', '401', '106', '1464225959', '0', '1', '0', '82', '348');
INSERT INTO `sr_comment` VALUES ('451', '', '84', '111', '706', '84', '1464226351', '0', '1', '0', '84', '387');
INSERT INTO `sr_comment` VALUES ('452', '', '180', '123', '706', '180', '1464226360', '0', '1', '0', '84', '387');
INSERT INTO `sr_comment` VALUES ('453', '', '180', '123', '705', '180', '1464226474', '0', '1', '0', '84', '381');
INSERT INTO `sr_comment` VALUES ('454', '', '180', '13', '706', '180', '1464226614', '0', '1', '0', '84', '387');
INSERT INTO `sr_comment` VALUES ('455', '', '96', '123', '757', '96', '1464226752', '0', '1', '0', '84', '438');
INSERT INTO `sr_comment` VALUES ('456', '', '84', '123', '757', '84', '1464226755', '0', '1', '0', '84', '438');
INSERT INTO `sr_comment` VALUES ('457', '', '180', '123', '705', '180', '1464226765', '0', '1', '0', '84', '381');
INSERT INTO `sr_comment` VALUES ('458', '', '84', '123', '705', '84', '1464226767', '0', '1', '0', '84', '381');
INSERT INTO `sr_comment` VALUES ('459', '', '79', 'Ggg high', '708', '79', '1464244947', '0', '1', '0', '96', '413');
INSERT INTO `sr_comment` VALUES ('460', '', '84', 'Kiki', '757', '84', '1464244954', '0', '1', '0', '96', '438');
INSERT INTO `sr_comment` VALUES ('461', '', '179', '哦哦哦6天现在我也一样', '761', '0', '1464252959', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('462', '', '96', '大家都难', '757', '96', '1464253747', '0', '1', '0', '84', '438');
INSERT INTO `sr_comment` VALUES ('463', '', '84', '大家都难打开咖啡看看', '705', '84', '1464253758', '0', '1', '0', '84', '381');
INSERT INTO `sr_comment` VALUES ('464', '', '84', 'Shins', '757', '84', '1464303814', '0', '1', '0', '96', '438');
INSERT INTO `sr_comment` VALUES ('465', '', '80', '11', '765', '0', '1464312020', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('466', '', '84', '123123', '765', '84', '1464312026', '0', '1', '0', '84', '465');
INSERT INTO `sr_comment` VALUES ('467', '', '84', '123123123123', '765', '84', '1464312029', '0', '1', '0', '84', '465');
INSERT INTO `sr_comment` VALUES ('468', '', '80', '111', '765', '0', '1464312164', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('469', '', '80', '12312', '765', '0', '1464312168', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('470', '', '84', '123', '765', '84', '1464312173', '0', '1', '0', '84', '468');
INSERT INTO `sr_comment` VALUES ('471', '', '84', '123123', '765', '84', '1464312182', '0', '1', '0', '84', '469');
INSERT INTO `sr_comment` VALUES ('472', '', '80', '111', '765', '0', '1464312362', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('473', '', '84', '111', '765', '84', '1464312398', '0', '1', '0', '84', '472');
INSERT INTO `sr_comment` VALUES ('474', '', '80', '1', '765', '0', '1464312417', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('475', '', '179', '1111', '761', '179', '1464312610', '0', '1', '0', '84', '461');
INSERT INTO `sr_comment` VALUES ('476', '', '179', '1111', '761', '179', '1464312759', '0', '1', '0', '84', '461');
INSERT INTO `sr_comment` VALUES ('477', '', '84', '2222222', '761', '84', '1464312771', '0', '1', '0', '84', '461');
INSERT INTO `sr_comment` VALUES ('478', '', '179', '111', '761', '0', '1464312788', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('479', '', '84', '333', '761', '84', '1464312800', '0', '1', '0', '84', '461');
INSERT INTO `sr_comment` VALUES ('480', '', '84', '111', '761', '84', '1464312808', '0', '1', '0', '84', '478');
INSERT INTO `sr_comment` VALUES ('481', '', '84', '131', '750', '0', '1464313551', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('482', '', '179', '欧洲朋友圈', '760', '0', '1464316249', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('483', '', '179', '☝', '760', '0', '1464316275', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('484', '', '179', 'O_o', '760', '0', '1464316306', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('485', '', '179', ':-O:-O:-O:-O:-O', '760', '0', '1464316321', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('486', '', '179', '莫咯咯哦', '760', '179', '1464316404', '0', '1', '0', '179', '483');
INSERT INTO `sr_comment` VALUES ('487', '', '179', 'MSN婆婆女女', '760', '179', '1464316416', '0', '1', '0', '179', '482');
INSERT INTO `sr_comment` VALUES ('488', '', '179', 'ROM婆婆破口', '760', '179', '1464316422', '0', '1', '0', '179', '482');
INSERT INTO `sr_comment` VALUES ('489', '', '179', '默默婆婆', '760', '0', '1464316436', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('490', '', '84', '哈哈', '758', '84', '1464327378', '0', '1', '0', '89', '442');
INSERT INTO `sr_comment` VALUES ('491', '', '112', '你欧欧欧诺诺', '633', '0', '1464327582', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('492', '', '112', '哦1哦你需要啥休息', '633', '0', '1464327588', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('493', '', '112', '明末头目', '633', '0', '1464327591', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('494', '', '112', '星期一', '633', '0', '1464327606', '0', '1', '0', '179', '0');
INSERT INTO `sr_comment` VALUES ('495', '', '80', '闲', '766', '0', '1464498835', '0', '1', '0', '212', '0');
INSERT INTO `sr_comment` VALUES ('496', '', '84', '123', '772', '0', '1464849060', '0', '1', '0', '96', '0');
INSERT INTO `sr_comment` VALUES ('497', '', '84', '222', '749', '0', '1464849214', '0', '1', '0', '96', '0');
INSERT INTO `sr_comment` VALUES ('498', '', '82', '123', '727', '82', '1464925913', '0', '1', '0', '84', '420');
INSERT INTO `sr_comment` VALUES ('499', '', '82', '123', '727', '82', '1464925934', '0', '1', '0', '84', '420');
INSERT INTO `sr_comment` VALUES ('500', '', '84', '走在互联网前端的公司', '868', '0', '1464944885', '0', '1', '0', '84', '0');
INSERT INTO `sr_comment` VALUES ('501', '', '221', '无线可能', '873', '0', '1464966514', '0', '1', '0', '221', '0');
INSERT INTO `sr_comment` VALUES ('502', '', '225', '可以', '878', '0', '1465179337', '0', '1', '0', '225', '0');
INSERT INTO `sr_comment` VALUES ('503', '', '225', '真他妈帅啊～', '878', '0', '1465180005', '0', '1', '0', '219', '0');
INSERT INTO `sr_comment` VALUES ('504', '', '231', '发这么多东西', '887', '0', '1465788851', '0', '1', '0', '256', '0');
INSERT INTO `sr_comment` VALUES ('505', '', '231', '傻屌', '887', '0', '1465788915', '0', '1', '0', '256', '0');
INSERT INTO `sr_comment` VALUES ('506', '', '249', '额', '891', '0', '1466666779', '0', '1', '0', '257', '0');
INSERT INTO `sr_comment` VALUES ('507', '', '249', '你猜', '891', '0', '1466666793', '0', '1', '0', '257', '0');

-- ----------------------------
-- Table structure for sr_config
-- ----------------------------
DROP TABLE IF EXISTS `sr_config`;
CREATE TABLE `sr_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '显示标题',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '配置名称，标识，只能使用英文且不能重复',
  `groups` varchar(50) NOT NULL DEFAULT '' COMMENT '所属分组',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT 'text,radio,checkbox,select,editor',
  `options` text COMMENT '多个选择项 json格式存储',
  `value` text,
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '配置说明',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='站点配置表';

-- ----------------------------
-- Records of sr_config
-- ----------------------------
INSERT INTO `sr_config` VALUES ('1', '站点状态', 'SITE_STATUS', '基本设置', 'radio', '0:关闭\r\n1:开启', '1', '关闭后只有管理员可见，其它人将无法正常访问站点', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('2', '站点LOGO', 'SITE_LOGO', '基本设置', 'image', '', 'Uploads/System/Image/570778549f113.jpg', 'logo', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('3', '版权声明', 'COPY_RIGHT', '基本设置', 'textarea', '', '备鄂ICP证05032410号', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('6', 'SMTP服务器', 'SMTP_HOST', '邮件配置', 'text', '', 'smtp.163.com', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('7', 'SMTP端口', 'SMTP_PORT', '邮件配置', 'text', '', '25', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('8', 'SMTP用户名', 'SMTP_USER', '邮件配置', 'text', '', '15623973029@163.com', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('9', 'SMTP密码', 'SMTP_PASS', '邮件配置', 'text', '', 'xi199410', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('10', '发件人邮箱', 'FROM_EMAIL', '邮件配置', 'text', '', '15623973029@163.com', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('11', '发件人', 'FROM_NAME', '邮件配置', 'text', '', '武汉尚软科技', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('12', '站点标题', 'SITE_TITLE', '基本设置', 'text', '', '小喇叭', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('13', '二维码', 'QR_CODE', '基本设置', 'image', '', 'Uploads/System/Image/56206a7fa8c40.png', '站点二维码', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('14', '联系电话', 'CONTACT_NUMBER', '基本设置', 'text', '', '411-811-8826', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('15', '营业时间', 'HOURS', '基本设置', 'text', '', '周一到周日', '网站运营和服务时间', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('16', '售后服务申明', 'SALE_SERVE', '平台设置', 'editor', '', '&lt;p&gt;&amp;nbsp; &amp;nbsp;如您对在九骚包官网买到的商品不满意，或出现质量问题，可随时与我们取得联系，提出售后维修或退换货申请。相关工作人员将为您提供一对一的VIP式服务，确保您的消费权益。在您提交售后服务申请前，请阅读本页说明，了解我们的售后服务政策和退换货流程，谢谢。&lt;br/&gt;\r\n	&amp;nbsp;&amp;nbsp;1.自签收之日起，如商品及包装保持小米出售时原状且配件齐全，七天退货，十五天换货，一年内质保（质保范围：客户在正常使用条件下由于产品自身原&lt;/p&gt;', '(商品详情页展示)', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('17', 'iphone下载链接地址', 'IPHONE', '基本设置', 'text', '', '', '', '0', '0', '2147483647', '0', '9');
INSERT INTO `sr_config` VALUES ('18', 'Android下载链接地址', 'ANDROID', '基本设置', 'text', '', '', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('19', 'ipad下载链接地址', 'IPAD', '基本设置', 'text', '', '', '', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('20', '下单优惠', 'PREFERENTIAL', '基本设置', 'text', '', '', '提示用户下单优惠条件', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('21', '平台使用规则', 'RULES', '基本设置', 'text', '', '', '用户注册时需要同意使用该网站的协议', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('22', '联系我们', 'CONTACT_US', '基本设置', 'text', '', '18', '文章id', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('23', '售后原因', 'REASON_SALE', '其它设置', 'text', '实物与描述不符？|商品破损？', '实物与描述不符|商品破损', '不同原因之间使用 | 分隔', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('24', '订单确认收货超时时间', 'CONFIRM_RECEIPT', '其它设置', 'text', '', '15', '单位天', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('28', '关于我们', 'ABOUTUS', '其它设置', 'textarea', '', '', '显示网站基本信息', '0', '0', '2147483647', '0', '0');
INSERT INTO `sr_config` VALUES ('29', 'QQ客服', 'QQ_SERVE', '客服设置', 'text', '', '114445678,99877768,5564789', '多个QQ请用英文半角逗号隔开', '0', '0', '0', '0', '0');
INSERT INTO `sr_config` VALUES ('31', '用户协议', 'USER_AGREEMENT', '平台设置', 'editor', '', null, '', '0', '0', '0', '0', '0');
INSERT INTO `sr_config` VALUES ('32', '审核一期时间', 'Examine_One', '基本设置', 'text', '', '30', '时间单位：天', '0', '0', '0', '0', '0');
INSERT INTO `sr_config` VALUES ('33', '审核二期时间', 'Examine_Tow', '基本设置', 'text', '', '2', '时间单位：月', '0', '0', '0', '0', '0');
INSERT INTO `sr_config` VALUES ('34', '短信用户名', 'MESSAGE_NAME', '短信设置', 'text', '', 'cf_cnsunrun', '', '0', '0', '0', '0', '0');
INSERT INTO `sr_config` VALUES ('35', '短信密码', 'PASSWORD', '短信设置', 'text', '', 'cnsunrun87778785..', '', '0', '0', '0', '0', '0');
INSERT INTO `sr_config` VALUES ('36', '验证短信内容', 'CONTENT', '短信设置', 'text', '', ' 您的验证码是：#code#。请不要把验证码泄露给其他人。如非本人操作，可不用理会！', '', '0', '0', '0', '0', '0');
INSERT INTO `sr_config` VALUES ('37', '分享链接', 'SHARE', '分享配置', 'text', '', 'http://cd.cnsunrun.com/Home/Index/browse/ids', '填写APP分享地址', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sr_faq
-- ----------------------------
DROP TABLE IF EXISTS `sr_faq`;
CREATE TABLE `sr_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL COMMENT '问题',
  `answer` text NOT NULL COMMENT '答案',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0否，1是',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sr_faq
-- ----------------------------
INSERT INTO `sr_faq` VALUES ('1', '关于bootstrap一些乱七八糟', '&amp;lt;p&amp;gt;在 Bootstrap 中，输入框和单选/多选框控件默认被设置为 width: 100%; 宽度。在内联表单，我们将这些元素的宽度设置为 width: auto;，因此，多个控件可以排列在同一行。根据你的布局需求，可能需要一些额外的定制化组件。在 Bootstrap 中，输入框和单选/多选框控件默认被设置为 width: 100%; 宽度。在内联表单，我们将这些元素的宽度设置为 width: auto;，因此，多个控件可以排列在同一行。根据你的布局需求，可能需要一些额外的定制化组件。在 Bootstrap 中，输入框和单选/多选框控件默认被设置为 width: 100%; 宽度。在内联&amp;lt;/p&amp;gt;', '1', '0', '22', '1464251499');
INSERT INTO `sr_faq` VALUES ('2', 'form ???', '&amp;lt;p&amp;gt;由小编来回答1111&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;amp;lt;form&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp; &amp;amp;lt;div class=&amp;amp;quot;form-group&amp;amp;quot;&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;label for=&amp;amp;quot;exampleInputEmail1&amp;amp;quot;&amp;amp;gt;Email address&amp;amp;lt;/label&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;input type=&amp;amp;quot;email&amp;amp;quot; class=&amp;amp;quot;form-control&amp;amp;quot; id=&amp;amp;quot;exampleInputEmail1&amp;amp;quot; placeholder=&amp;amp;quot;Email&amp;amp;quot;&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp; &amp;amp;lt;/div&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp; &amp;amp;lt;div class=&amp;amp;quot;form-group&amp;amp;quot;&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;label for=&amp;amp;quot;exampleInputPassword1&amp;amp;quot;&amp;amp;gt;Password&amp;amp;lt;/label&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;input type=&amp;amp;quot;password&amp;amp;quot; class=&amp;amp;quot;form-control&amp;amp;quot; id=&amp;amp;quot;exampleInputPassword1&amp;amp;quot; placeholder=&amp;amp;quot;Password&amp;amp;quot;&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp; &amp;amp;lt;/div&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp; &amp;amp;lt;div class=&amp;amp;quot;form-group&amp;amp;quot;&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;label for=&amp;amp;quot;exampleInputFile&amp;amp;quot;&amp;amp;gt;File input&amp;amp;lt;/label&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;input type=&amp;amp;quot;file&amp;amp;quot; id=&amp;amp;quot;exampleInputFile&amp;amp;quot;&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;p class=&amp;amp;quot;help-block&amp;amp;quot;&amp;amp;gt;Example block-level help text here.&amp;amp;lt;/p&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp; &amp;amp;lt;/div&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp; &amp;amp;lt;div class=&amp;amp;quot;checkbox&amp;amp;quot;&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;label&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;input type=&amp;amp;quot;checkbox&amp;amp;quot;&amp;amp;gt; Check me out&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;/label&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp; &amp;amp;lt;/div&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp; &amp;amp;lt;button type=&amp;amp;quot;submit&amp;amp;quot; class=&amp;amp;quot;btn btn-default&amp;amp;quot;&amp;amp;gt;Submit&amp;amp;lt;/button&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;amp;lt;/form&amp;amp;gt;&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;', '1', '0', '1', '1464316738');
INSERT INTO `sr_faq` VALUES ('3', 'are you ok?jokmjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', '&amp;lt;p&amp;gt;1、看见好久好久骄傲和思考多喝水&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;2、安德森的是多少客户说撒开大会&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;3、&amp;lt;img src=&amp;quot;http://img.baidu.com/hi/jx2/j_0015.gif&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;http://img.baidu.com/hi/jx2/j_0058.gif&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;http://img.baidu.com/hi/jx2/j_0056.gif&amp;quot;/&amp;gt;&amp;lt;img src=&amp;quot;http://img.baidu.com/hi/jx2/j_0078.gif&amp;quot;/&amp;gt;&amp;lt;/p&amp;gt;', '1', '0', '1', '1464411677');
INSERT INTO `sr_faq` VALUES ('4', '1111111111111', '&lt;p&gt;1111111111111111111&lt;br/&gt;&lt;/p&gt;', '1', '0', '111', '1464070468');
INSERT INTO `sr_faq` VALUES ('5', 'table???????????', '&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;table&amp;amp;nbsp;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;style&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;table-layout:fixed&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;amp;nbsp;width&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;200&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;tr&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;td&amp;amp;nbsp;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;width&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;25%&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;amp;nbsp;style&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;word-break&amp;amp;nbsp;:&amp;amp;nbsp;break-all;&amp;amp;nbsp;overflow:hidden;&amp;amp;nbsp;&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;abcdefghigklmnopqrstuvwxyz1234567890&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;&amp;amp;lt;/td&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;td&amp;amp;nbsp;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;width&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;75%&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;amp;nbsp;style&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;word-wrap&amp;amp;nbsp;:&amp;amp;nbsp;break-word;&amp;amp;nbsp;overflow:hidden;&amp;amp;nbsp;&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;abcdefghigklmnopqrstuvwxyz1234567890&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;&amp;amp;lt;/td&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; &amp;amp;lt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;/tr&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;&amp;amp;lt;/table&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;', '1', '0', '123', '1464173405');
INSERT INTO `sr_faq` VALUES ('6', '怎样强制换行？', '&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;lt;span style=&amp;quot;color:#000000&amp;quot;&amp;gt;对于table&amp;lt;/span&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;lt;span style=&amp;quot;color:#000000&amp;quot;&amp;gt;1. (IE浏览器)使用 table-layout:fixed;强制table的宽度,多余内容隐藏&amp;lt;/span&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;table&amp;amp;nbsp;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;style&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;table-layout:fixed&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;amp;nbsp;width&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;200&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;tr&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;td&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;abcdefghigklmnopqrstuvwxyz1234567890ssssssssssssss&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;td&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;tr&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;table&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#000000&amp;quot;&amp;gt;效果：隐藏多余内容&amp;lt;br/&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;lt;span style=&amp;quot;color:#000000&amp;quot;&amp;gt;2.(IE浏览器)使用 table-layout:fixed;强制table的宽度,内层td,th采用word-break : break-all;或者word-wrap : break-word ;换行&amp;lt;/span&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;table&amp;amp;nbsp;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;width&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;200&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;amp;nbsp;style&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;table-layout:fixed;&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;tr&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;td&amp;amp;nbsp;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;width&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;25%&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;&amp;amp;nbsp;style&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;word-break&amp;amp;nbsp;:&amp;amp;nbsp;break-all;&amp;amp;nbsp;&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;abcdefghigklmnopqrstuvwxy&amp;amp;nbsp;1234567890&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;td&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;lt;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;td&amp;amp;nbsp;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#ff0000&amp;quot;&amp;gt;style&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;=&amp;amp;quot;word-wrap&amp;amp;nbsp;:&amp;amp;nbsp;break-word&amp;amp;nbsp;;&amp;amp;quot;&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;abcdefghigklmnopqrstuvwxyz&amp;amp;nbsp;1234567890&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;td&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;tr&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;color:#800000&amp;quot;&amp;gt;table&amp;lt;/span&amp;gt;&amp;lt;span style=&amp;quot;color:#0000ff&amp;quot;&amp;gt;&amp;amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;span style=&amp;quot;color:#000000&amp;quot;&amp;gt;效果：可以换行&amp;lt;/span&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;', '1', '0', '11', '1464088719');
INSERT INTO `sr_faq` VALUES ('7', '呵呵？', '&amp;lt;p&amp;gt;呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵&amp;lt;/p&amp;gt;', '1', '0', '22', '1464088799');
INSERT INTO `sr_faq` VALUES ('8', 'test', '&amp;lt;p&amp;gt;测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试&amp;lt;/p&amp;gt;', '1', '0', '111', '1464088780');
INSERT INTO `sr_faq` VALUES ('9', 'Jquery中$.get(),$.post(),$.ajax(),$.getJSON()的用法总结!', '&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;lt;span style=&amp;quot;COLOR: #ff0000&amp;quot;&amp;gt;一，$.get(url,[data],[callback])&amp;lt;/span&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;说明：url为请求地址，data为请求数据的列表，callback为请求成功后的回调函数，该函数接受两个参数，第一个为服务器返回的数据，第二个参数为服务器的状态，是可选参数。&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;而其中，服务器返回数据的格式其实是字符串形势，并不是我们想要的json数据格式，在此引用只是为了对比说明&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;a style=&amp;quot;CURSOR: pointer&amp;quot; class=&amp;quot;copybut&amp;quot; id=&amp;quot;copybut59237&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;text-decoration:underline;&amp;quot;&amp;gt;复制代码&amp;lt;/span&amp;gt;&amp;lt;/a&amp;gt; 代码如下:&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;$.get(&amp;amp;quot;data.php&amp;amp;quot;,$(&amp;amp;quot;#firstName.val()&amp;amp;quot;),function(data){&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;$(&amp;amp;quot;#getResponse&amp;amp;quot;).html(data); }//返回的data是字符串类型&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;);&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;strong&amp;gt;&amp;lt;span style=&amp;quot;COLOR: #ff0000&amp;quot;&amp;gt;二，$.post(url,[data],[callback],[type])&amp;lt;/span&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;说明：这个函数跟$.get()参数差不多，多了一个type参数，type为请求 \r\n的数据类型，可以是html,xml,json等类型，如果我们设置这个参数为：json，那么返回的格式则是json格式的，如果没有设置，就 \r\n和$.get()返回的格式一样，都是字符串的&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;a style=&amp;quot;CURSOR: pointer&amp;quot; class=&amp;quot;copybut&amp;quot; id=&amp;quot;copybut50951&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;text-decoration:underline;&amp;quot;&amp;gt;复制代码&amp;lt;/span&amp;gt;&amp;lt;/a&amp;gt; 代码如下:&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;$.post(&amp;amp;quot;data.php&amp;amp;quot;,$(&amp;amp;quot;#firstName.val()&amp;amp;quot;),function(data){&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;$(&amp;amp;quot;#postResponse&amp;amp;quot;).html(data.name);&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;},&amp;amp;quot;json&amp;amp;quot;//设置了获取数据的类型，所以得到的数据格式为json类型的&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;);&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;strong&amp;gt;&amp;lt;span style=&amp;quot;COLOR: #ff0000&amp;quot;&amp;gt;三，$.ajax(opiton)&amp;lt;/span&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;说明：$.ajax()这个函数功能强大，可以对ajax进行许多精确的控制，需要详细说明的请参照相关资料&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;a style=&amp;quot;CURSOR: pointer&amp;quot; class=&amp;quot;copybut&amp;quot; id=&amp;quot;copybut28925&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;text-decoration:underline;&amp;quot;&amp;gt;复制代码&amp;lt;/span&amp;gt;&amp;lt;/a&amp;gt; 代码如下:&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;$.ajax({&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;url: &amp;amp;quot;ajax/ajax_selectPicType.aspx&amp;amp;quot;,&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;data:{Full:&amp;amp;quot;fu&amp;amp;quot;},&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;type: &amp;amp;quot;POST&amp;amp;quot;,&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;dataType:&amp;amp;#39;json&amp;amp;#39;,&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;success:CallBack,&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;error:function(er){&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;BackErr(er);}&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;});&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;strong&amp;gt;&amp;lt;span style=&amp;quot;COLOR: #ff0000&amp;quot;&amp;gt;四，$.getJSON(url,[data],[callback])&amp;lt;br/&amp;gt;&amp;lt;/span&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;a style=&amp;quot;CURSOR: pointer&amp;quot; class=&amp;quot;copybut&amp;quot; id=&amp;quot;copybut68445&amp;quot;&amp;gt;&amp;lt;span style=&amp;quot;text-decoration:underline;&amp;quot;&amp;gt;复制代码&amp;lt;/span&amp;gt;&amp;lt;/a&amp;gt; 代码如下:&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;$.getJSON(&amp;amp;quot;data.php&amp;amp;quot;,$(&amp;amp;quot;#firstName.val()&amp;amp;quot;),function(jsonData){&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;$(&amp;amp;quot;#getJSONResponse&amp;amp;quot;).html(jsonData.id);}//无需设置，直接获取的数据类型为json，&amp;lt;br/&amp;gt;所以调用时需要使用jsonData.id方式&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;);&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;When Ajax meets jQuery \r\n基于AJAX的应用现在越来越多，而对于前台开发人员来说，直接和底层的HTTPRequest打交道又不是一件令人愉快的事情。jQuery既然封装了\r\n \r\nJavaScript，肯定已经考虑过AJAX应用的问题。的确，如果用jQuery写AJAX会比直接用JS写方便N倍。（不知道用jQuery长了，\r\n 会不会丧失对JS的知识了……） 这里假设大家对jQuery语法已经比较熟悉，来对ajax的一些应用作一些总结&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;', '1', '0', '242', '1464173474');
INSERT INTO `sr_faq` VALUES ('10', 'javascript里面的$.getJSON和$.get有什么区别?', '&amp;lt;pre id=&amp;quot;best-content-1767651762&amp;quot; class=&amp;quot;best-text mb-10&amp;quot;&amp;gt;$.get(url&amp;amp;nbsp;...)&amp;amp;nbsp;是得到这个url指向的网址的内容，&amp;amp;nbsp;&amp;amp;nbsp;内容可以是任意类型的数据，&amp;amp;nbsp;通常是\r\n如果我们已经知道请求的网址返回的是一段，&amp;amp;nbsp;那么用$.get(url&amp;amp;nbsp;...),&amp;amp;nbsp;jQuery会帮我们吧取的的字符串转换成&amp;amp;nbsp;对象&amp;lt;/pre&amp;gt;&amp;lt;p&amp;gt;&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;', '1', '0', '2424', '1464173522');
INSERT INTO `sr_faq` VALUES ('11', '哇哈哈哈哈哈哈哈？', '&amp;lt;p&amp;gt;哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈哇哈哈哈哈哈&amp;lt;/p&amp;gt;', '1', '0', '23', '1464173568');
INSERT INTO `sr_faq` VALUES ('12', '测试', '&amp;lt;p&amp;gt;啊哒哒哒&amp;lt;br/&amp;gt;&amp;lt;/p&amp;gt;', '1', '0', '22', '1464088816');

-- ----------------------------
-- Table structure for sr_feed
-- ----------------------------
DROP TABLE IF EXISTS `sr_feed`;
CREATE TABLE `sr_feed` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '产生动态的用户UID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:原创 2：转发',
  `addtime` int(11) NOT NULL COMMENT '产生时间戳',
  `is_del` int(2) NOT NULL DEFAULT '0' COMMENT '是否删除 默认为0',
  `comment_count` int(10) NOT NULL DEFAULT '0' COMMENT '评论数',
  `hot_count` int(10) NOT NULL DEFAULT '0' COMMENT '热度  包括  点赞数  转载数  推荐',
  `is_repost` int(2) NOT NULL DEFAULT '0' COMMENT '是否转发 0-否  1-是',
  `is_hid` int(2) NOT NULL DEFAULT '0' COMMENT '是否禁用0-否1-是',
  `is_recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `recommend_time` int(11) NOT NULL DEFAULT '0',
  `style` tinyint(1) NOT NULL DEFAULT '1' COMMENT '发表文章的类型  1：文字 2：图片3：音乐 4：视频',
  `feed_rule_id` int(10) NOT NULL DEFAULT '0' COMMENT '文章发布的rule  id  ',
  `feed_lable` varchar(110) NOT NULL DEFAULT '' COMMENT '使用的标签，用英文的逗号分隔,',
  `special_id` int(6) NOT NULL DEFAULT '1' COMMENT '专题 1：尚软说 2：活动邀请函 3：搞笑',
  `copy_id` int(11) NOT NULL DEFAULT '0' COMMENT '如果转载，记录被转载人的id',
  `recommend_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人的id',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '若文章为管理员发布，则记录管理员id',
  `creat_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章原创id',
  `feed_row_id` int(11) NOT NULL DEFAULT '0' COMMENT '转载文章id',
  `rule_id` int(5) NOT NULL DEFAULT '0' COMMENT '文章的权限id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '首页推荐 1： 未推荐 2： 已推荐',
  PRIMARY KEY (`id`),
  KEY `is_del` (`is_del`,`addtime`) USING BTREE,
  KEY `uid` (`uid`,`is_del`,`addtime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=898 DEFAULT CHARSET=utf8 COMMENT='文章基础信息记录表\r\n';

-- ----------------------------
-- Records of sr_feed
-- ----------------------------
INSERT INTO `sr_feed` VALUES ('879', '0', '1', '1465182485', '0', '0', '0', '0', '0', '0', '0', '2', '0', '', '1', '0', '0', '1', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('880', '211', '1', '1465183561', '0', '0', '0', '0', '0', '0', '0', '1', '3', '', '1', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('881', '211', '1', '1465183848', '0', '0', '0', '0', '0', '0', '1465185299', '1', '3', '', '1', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('882', '80', '1', '1465185373', '1', '0', '0', '0', '0', '0', '0', '2', '3', '', '11', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('883', '238', '1', '1465185478', '0', '0', '0', '0', '0', '0', '0', '2', '3', '', '11', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('884', '231', '2', '1465222199', '0', '0', '1', '1', '0', '1', '1465297482', '2', '0', '', '11', '238', '251', '0', '0', '883', '0', '1');
INSERT INTO `sr_feed` VALUES ('885', '238', '1', '1465264047', '1', '0', '0', '0', '0', '0', '0', '1', '3', ',279,280,281,', '2', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('886', '233', '1', '1465267933', '0', '0', '0', '0', '0', '0', '1467037297', '2', '3', ',282,', '1', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('887', '231', '1', '1465309361', '0', '2', '0', '0', '0', '0', '0', '1', '3', ',283,', '46', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('888', '211', '1', '1465712957', '0', '0', '0', '0', '0', '0', '0', '1', '3', '', '1', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('889', '211', '1', '1465712980', '0', '0', '0', '0', '0', '0', '0', '1', '3', '', '1', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('890', '254', '1', '1465718278', '0', '0', '0', '0', '0', '0', '0', '1', '3', '', '1', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('891', '249', '1', '1466430085', '0', '2', '0', '0', '0', '0', '0', '2', '3', ',289,', '46', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('892', '257', '2', '1466669509', '1', '0', '0', '1', '0', '0', '0', '2', '0', ',289,', '46', '249', '0', '0', '0', '891', '0', '1');
INSERT INTO `sr_feed` VALUES ('893', '257', '2', '1466669521', '1', '0', '0', '1', '0', '0', '0', '2', '0', ',289,', '46', '257', '0', '0', '249', '891', '0', '1');
INSERT INTO `sr_feed` VALUES ('894', '238', '1', '1466683456', '0', '0', '1', '0', '0', '0', '0', '2', '3', ',301,', '1', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('895', '253', '1', '1466685589', '0', '0', '5', '0', '0', '1', '1467179425', '2', '3', '', '1', '0', '271', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('896', '250', '1', '1467021023', '1', '0', '0', '0', '0', '0', '0', '1', '3', '', '1', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `sr_feed` VALUES ('897', '273', '1', '1467271592', '0', '0', '1', '0', '0', '0', '0', '2', '3', ',302,', '1', '0', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for sr_feedback
-- ----------------------------
DROP TABLE IF EXISTS `sr_feedback`;
CREATE TABLE `sr_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '反馈用户id，0，时为路人',
  `mobile` varchar(15) NOT NULL,
  `content` text NOT NULL COMMENT '反馈内容',
  `is_del` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0否  1是',
  `addtime` int(11) NOT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='反馈';

-- ----------------------------
-- Records of sr_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for sr_feed_content
-- ----------------------------
DROP TABLE IF EXISTS `sr_feed_content`;
CREATE TABLE `sr_feed_content` (
  `feed_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联ts_feed表，feed_id',
  `feed_content` text COMMENT '纯分享内容',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '发表地址   json 数据',
  `feed_title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章标题',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`feed_id`),
  KEY `feed_id` (`feed_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容表';

-- ----------------------------
-- Records of sr_feed_content
-- ----------------------------
INSERT INTO `sr_feed_content` VALUES ('879', '小时候老家有句话叫：不落实。主要用来形容看那个人不踏实，不可信。一路走来我谨小慎微，走着走着我明白了一件事情，够不着地时候就停下来扎梯子，练力气。慢慢走，稳稳走。直到夕阳……\r\n\r\n我喜欢听那首《顺流逆流》：不付出怎会拥有......就算付出不能拥有，也要心平气和。哪有那么简单。\r\n\r\n欲望是难填的坑，我够幸福了，常说传递真实和幸福，我想从心平气和开始。在透满机缘的运道河流中静静的随着河水向前。那顺风的帆总比逆流的浆要好。\r\n\r\n不比：没什么好比的，常人为了生活生机，也为了证明自己。我不需要这些。高人为了梦想为了使命，我只需要把持自己。无为中有为。无需比较。\r\n\r\n我好久不看电视，杂志，和现代流行书籍了。总结自己多看历史多动手，多身体力行。多听，多看，多体验。好好静静的去学习。做潮流的平行轨道。\r\n\r\n赢是什么？输又是什么？让我想起儿时自己的小游戏自己规定的规则。这世间哪有输赢，发乎心。得又是什么？失又是什么？空手来游走世间，空手去告别世间。一个管家一个游客，何必那么执。\r\n\r\n信仰？我没有，我知道活着需要一个完整的自我体系。加入任何安抚心灵的都', '', '阳光下无新事', '0');
INSERT INTO `sr_feed_content` VALUES ('880', '任天堂', '', '通天塔', '0');
INSERT INTO `sr_feed_content` VALUES ('881', '测试的', '', '测试', '0');
INSERT INTO `sr_feed_content` VALUES ('882', '壁纸', '', '', '1');
INSERT INTO `sr_feed_content` VALUES ('883', '壁纸', '', '', '0');
INSERT INTO `sr_feed_content` VALUES ('884', '', '', '', '0');
INSERT INTO `sr_feed_content` VALUES ('885', '', '', '测试内容', '1');
INSERT INTO `sr_feed_content` VALUES ('886', '今天天气不好，不适合活动', '武汉市·碧水社区党员群众服务中心', '活动1', '0');
INSERT INTO `sr_feed_content` VALUES ('887', 'session同步问题.有几种方式:\n1.session sticky (session粘贴)。大概意思就是你第一次访问那台服务器节点。以后还访问那个。\n2.session replication(session复制).大概意思就是每个节点都会复制一份session进行保存.这样可以随意访问任何一个节点\n但是问题是如果节点数量非常多,那么带来的网络消耗非常大。只适合几台机器做负载时用。\n3.session数据集中存储.同样是希望同一个会话的请求可以发到不同的Web服务器上，刚才的session replication是一种方案，还有另\n一种方案就是把Session数据集中存储起来，然后不同Web服务器从同样的地方获取Session.也有问题。就是延时和不稳定性。如果\n存储session的服务器宕机。\n4.Cooike Based.把session数据放在Cooike中传递。然后在Web服务器上从Cooike中生成对应的Session数据。这就好比每次把碗筷带在\n身上。去哪个饭店自己选择.缺点:受Cooike长度限制。数据暴露在外边安全性问题。增加带宽。\n总结:这4个方案都是可行方案,不过对于大型网站sessionSticky和session数据集中存储是比较好的方案。', '', '', '0');
INSERT INTO `sr_feed_content` VALUES ('888', '天天', '', '呵呵', '0');
INSERT INTO `sr_feed_content` VALUES ('889', '急急急', '', 'BBB', '0');
INSERT INTO `sr_feed_content` VALUES ('890', '短短的', '', '短短的', '0');
INSERT INTO `sr_feed_content` VALUES ('891', '杨开测试', '', '', '0');
INSERT INTO `sr_feed_content` VALUES ('892', '嘿嘿嘿嘿', '', '', '1');
INSERT INTO `sr_feed_content` VALUES ('893', '额额额', '', '', '1');
INSERT INTO `sr_feed_content` VALUES ('894', '漂亮的一些东西，过来瞧瞧', '湖北省武汉市洪山区楚韵路靠近一横书画(楚韵路)', '', '0');
INSERT INTO `sr_feed_content` VALUES ('895', '[太阳]6月23日下午，尚软科技与纽约Carma餐饮集团的CFO ，在世界开源论坛会场地进行了一番深入的交流合作探讨，从近期项目落地，到长期合作双方都表示了强烈的兴趣。Jen女士表示邀请尚软科技CTO赴美考察，在此表示非常感谢。期待合作深入落地开花结果。', '', '', '0');
INSERT INTO `sr_feed_content` VALUES ('896', '', '', '涂抹', '1');
INSERT INTO `sr_feed_content` VALUES ('897', '这是要翻天吗', '武汉市', '', '0');

-- ----------------------------
-- Table structure for sr_feed_hot
-- ----------------------------
DROP TABLE IF EXISTS `sr_feed_hot`;
CREATE TABLE `sr_feed_hot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '通知人id ',
  `feed_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章id',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:点赞 2：转载 3：推荐',
  `from_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被转载人id',
  `operator_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '原创人员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8 COMMENT='文章推荐表';

-- ----------------------------
-- Records of sr_feed_hot
-- ----------------------------
INSERT INTO `sr_feed_hot` VALUES ('585', '231', '884', '1465297482', '3', '0', '251', '0');
INSERT INTO `sr_feed_hot` VALUES ('591', '238', '894', '1466683465', '1', '0', '238', '0');
INSERT INTO `sr_feed_hot` VALUES ('592', '253', '895', '1466685598', '1', '0', '253', '0');
INSERT INTO `sr_feed_hot` VALUES ('593', '253', '895', '1467019207', '1', '0', '250', '0');
INSERT INTO `sr_feed_hot` VALUES ('596', '253', '895', '1467096550', '1', '0', '249', '0');
INSERT INTO `sr_feed_hot` VALUES ('597', '253', '895', '1467179420', '1', '0', '271', '0');
INSERT INTO `sr_feed_hot` VALUES ('598', '253', '895', '1467179425', '3', '0', '271', '0');
INSERT INTO `sr_feed_hot` VALUES ('599', '273', '897', '1467271613', '1', '0', '273', '0');

-- ----------------------------
-- Table structure for sr_feed_image
-- ----------------------------
DROP TABLE IF EXISTS `sr_feed_image`;
CREATE TABLE `sr_feed_image` (
  `feed_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片路径',
  `size` varchar(30) NOT NULL DEFAULT '' COMMENT '图片大小',
  `height` int(10) NOT NULL DEFAULT '0',
  `width` int(10) NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8 COMMENT='评论图片表';

-- ----------------------------
-- Records of sr_feed_image
-- ----------------------------
INSERT INTO `sr_feed_image` VALUES ('879', 'Uploads/banner/285754e90d1f8aa.jpg', '', '481', '1289', '405');
INSERT INTO `sr_feed_image` VALUES ('882', 'Uploads/feed/20160606/5754f45dd184b.jpg', '60549', '768', '1366', '406');
INSERT INTO `sr_feed_image` VALUES ('883', 'Uploads/feed/20160606/5754f4c61669a.jpg', '60549', '768', '1366', '407');
INSERT INTO `sr_feed_image` VALUES ('883', 'Uploads/feed/20160606/5754f4c616b30.jpg', '89888', '1920', '2160', '408');
INSERT INTO `sr_feed_image` VALUES ('886', 'Uploads/feed/20160607/575636dde8b34.jpg', '31083', '750', '750', '409');
INSERT INTO `sr_feed_image` VALUES ('891', 'Uploads/feed/20160620/5767f285f31d7.jpg', '8345', '330', '440', '410');
INSERT INTO `sr_feed_image` VALUES ('894', 'Uploads/feed/20160623/576bd0407ac7c.jpg', '91780', '1920', '1080', '411');
INSERT INTO `sr_feed_image` VALUES ('894', 'Uploads/feed/20160623/576bd0407b5c9.jpg', '85885', '1920', '1080', '412');
INSERT INTO `sr_feed_image` VALUES ('894', 'Uploads/feed/20160623/576bd0407bd42.jpg', '68208', '1920', '1080', '413');
INSERT INTO `sr_feed_image` VALUES ('894', 'Uploads/feed/20160623/576bd0407c842.jpg', '128907', '1920', '1080', '414');
INSERT INTO `sr_feed_image` VALUES ('894', 'Uploads/feed/20160623/576bd0407ccb9.jpg', '5361', '220', '236', '415');
INSERT INTO `sr_feed_image` VALUES ('894', 'Uploads/feed/20160623/576bd0407d56e.jpg', '105215', '1920', '1080', '416');
INSERT INTO `sr_feed_image` VALUES ('894', 'Uploads/feed/20160623/576bd0407de52.jpg', '93326', '1920', '1080', '417');
INSERT INTO `sr_feed_image` VALUES ('894', 'Uploads/feed/20160623/576bd0407edd8.jpg', '232908', '1920', '1080', '418');
INSERT INTO `sr_feed_image` VALUES ('894', 'Uploads/feed/20160623/576bd0407f69a.jpg', '71653', '1920', '1080', '419');
INSERT INTO `sr_feed_image` VALUES ('895', 'Uploads/feed/20160623/576bd8952eb26.jpg', '57958', '1280', '960', '420');
INSERT INTO `sr_feed_image` VALUES ('897', 'Uploads/feed/20160630/5774c9a851e6c.jpg', '43782', '1280', '960', '421');

-- ----------------------------
-- Table structure for sr_feed_report
-- ----------------------------
DROP TABLE IF EXISTS `sr_feed_report`;
CREATE TABLE `sr_feed_report` (
  `feed_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '举报状态,未处理1，已处理2',
  `feed_uid` int(11) NOT NULL DEFAULT '0' COMMENT '文章的用户id',
  `report_id` int(11) NOT NULL DEFAULT '0' COMMENT '举报用户id',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标记删除（0：没删除，1：已删除）',
  PRIMARY KEY (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='举报列表';

-- ----------------------------
-- Records of sr_feed_report
-- ----------------------------

-- ----------------------------
-- Table structure for sr_feed_rule
-- ----------------------------
DROP TABLE IF EXISTS `sr_feed_rule`;
CREATE TABLE `sr_feed_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章权限列表标题',
  `description` varchar(225) NOT NULL DEFAULT '' COMMENT '文章权限列表描述',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0：否 1： 是',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用 0 ：否  1 是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COMMENT='文章发布规则表';

-- ----------------------------
-- Records of sr_feed_rule
-- ----------------------------
INSERT INTO `sr_feed_rule` VALUES ('1', '仅自己可见', '', '0', '0');
INSERT INTO `sr_feed_rule` VALUES ('2', '禁止转载', '', '0', '0');
INSERT INTO `sr_feed_rule` VALUES ('3', '所有人可见', '', '0', '0');

-- ----------------------------
-- Table structure for sr_feed_shield
-- ----------------------------
DROP TABLE IF EXISTS `sr_feed_shield`;
CREATE TABLE `sr_feed_shield` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `feed_ids` varchar(50) NOT NULL DEFAULT '' COMMENT '用户文章屏蔽列表'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='用户屏蔽文章列表';

-- ----------------------------
-- Records of sr_feed_shield
-- ----------------------------
INSERT INTO `sr_feed_shield` VALUES ('230', '');
INSERT INTO `sr_feed_shield` VALUES ('231', '');
INSERT INTO `sr_feed_shield` VALUES ('232', '');
INSERT INTO `sr_feed_shield` VALUES ('233', '');
INSERT INTO `sr_feed_shield` VALUES ('234', '');
INSERT INTO `sr_feed_shield` VALUES ('235', '');
INSERT INTO `sr_feed_shield` VALUES ('236', '');
INSERT INTO `sr_feed_shield` VALUES ('237', '');
INSERT INTO `sr_feed_shield` VALUES ('238', '');
INSERT INTO `sr_feed_shield` VALUES ('239', '');
INSERT INTO `sr_feed_shield` VALUES ('240', '');
INSERT INTO `sr_feed_shield` VALUES ('241', '');
INSERT INTO `sr_feed_shield` VALUES ('242', '');
INSERT INTO `sr_feed_shield` VALUES ('243', '');
INSERT INTO `sr_feed_shield` VALUES ('244', '');
INSERT INTO `sr_feed_shield` VALUES ('245', '');
INSERT INTO `sr_feed_shield` VALUES ('246', '');
INSERT INTO `sr_feed_shield` VALUES ('247', '');
INSERT INTO `sr_feed_shield` VALUES ('248', '');
INSERT INTO `sr_feed_shield` VALUES ('249', '');
INSERT INTO `sr_feed_shield` VALUES ('250', '');
INSERT INTO `sr_feed_shield` VALUES ('251', '');
INSERT INTO `sr_feed_shield` VALUES ('252', '');
INSERT INTO `sr_feed_shield` VALUES ('253', '');
INSERT INTO `sr_feed_shield` VALUES ('256', '');
INSERT INTO `sr_feed_shield` VALUES ('257', '');
INSERT INTO `sr_feed_shield` VALUES ('258', '');
INSERT INTO `sr_feed_shield` VALUES ('259', '');
INSERT INTO `sr_feed_shield` VALUES ('260', '');
INSERT INTO `sr_feed_shield` VALUES ('261', '');
INSERT INTO `sr_feed_shield` VALUES ('262', '');
INSERT INTO `sr_feed_shield` VALUES ('263', '');
INSERT INTO `sr_feed_shield` VALUES ('264', '');
INSERT INTO `sr_feed_shield` VALUES ('265', '');
INSERT INTO `sr_feed_shield` VALUES ('266', '');
INSERT INTO `sr_feed_shield` VALUES ('267', '');
INSERT INTO `sr_feed_shield` VALUES ('268', '');
INSERT INTO `sr_feed_shield` VALUES ('269', '');
INSERT INTO `sr_feed_shield` VALUES ('270', '');
INSERT INTO `sr_feed_shield` VALUES ('271', '');
INSERT INTO `sr_feed_shield` VALUES ('272', '');
INSERT INTO `sr_feed_shield` VALUES ('273', '');

-- ----------------------------
-- Table structure for sr_file
-- ----------------------------
DROP TABLE IF EXISTS `sr_file`;
CREATE TABLE `sr_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `save_path` varchar(255) NOT NULL DEFAULT '',
  `ext` varchar(255) NOT NULL DEFAULT '',
  `mime` varchar(255) NOT NULL DEFAULT '',
  `size` varchar(255) NOT NULL DEFAULT '',
  `width` int(10) NOT NULL DEFAULT '0',
  `height` int(10) NOT NULL DEFAULT '0',
  `md5` varchar(255) NOT NULL DEFAULT '',
  `sha1` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='上传文件临时表';

-- ----------------------------
-- Records of sr_file
-- ----------------------------
INSERT INTO `sr_file` VALUES ('1', '', 'Uploads/ImgTemp/574d4a0e9d6e4.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '741fbf91eecdb998e8b6d865740e5cba', '', '0');
INSERT INTO `sr_file` VALUES ('2', '', 'Uploads/ImgTemp/574d4acf32031.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '02403a8c0d36b848f35a6ab793c82808', '', '0');
INSERT INTO `sr_file` VALUES ('3', '', 'Uploads/ImgTemp/574d4eeaee09f.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '68bbc1a00ee691cd0b34fc9b059a253e', '', '0');
INSERT INTO `sr_file` VALUES ('4', '', 'Uploads/ImgTemp/574d4f050f80b.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '3422e3b22acd098d143aa192bf377fda', '', '0');
INSERT INTO `sr_file` VALUES ('5', '', 'Uploads/ImgTemp/574d4f2b9caaa.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '002674a228dab3dd62c93f63dae9d77c', '', '0');
INSERT INTO `sr_file` VALUES ('6', '', 'Uploads/ImgTemp/574d4f3edfd48.jpg', 'jpg', 'application/octet-stream', '777835', '1024', '768', 'dcc2a4fa09327b05b3646c00a4e79157', '', '0');
INSERT INTO `sr_file` VALUES ('7', '', 'Uploads/ImgTemp/574d4f4e23cf7.jpg', 'jpg', 'application/octet-stream', '620888', '1024', '768', '56d77aa835ef4b53332e6fd08a6d233f', '', '0');
INSERT INTO `sr_file` VALUES ('8', '', 'Uploads/ImgTemp/574d4f8fec314.jpg', 'jpg', 'application/octet-stream', '879394', '1024', '768', '41cbe28f32da6dbc3b40898c868fff64', '', '0');
INSERT INTO `sr_file` VALUES ('9', '', 'Uploads/ImgTemp/574d4fa0dd4ad.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', 'cf33f3e350d20ded2eedda8e85b2ae45', '', '0');
INSERT INTO `sr_file` VALUES ('10', '', 'Uploads/ImgTemp/574d4faa245ce.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '4c647028b274f34bded5737670dfbbd6', '', '0');
INSERT INTO `sr_file` VALUES ('11', '', 'Uploads/ImgTemp/574d4fd48cf58.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '2d96684b0050ce5bb054e08eb58d756f', '', '0');
INSERT INTO `sr_file` VALUES ('12', '', 'Uploads/ImgTemp/574d5002ab637.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '94229b79d5591862d364dc011f9fe0ae', '', '0');
INSERT INTO `sr_file` VALUES ('13', '', 'Uploads/ImgTemp/574d5021db6e7.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '0363752f016d7417d0c5fd4a08456388', '', '0');
INSERT INTO `sr_file` VALUES ('14', '', 'Uploads/ImgTemp/574d504e550ad.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', 'dd045cc09109ca96fbe29969a99a05de', '', '0');
INSERT INTO `sr_file` VALUES ('15', '', 'Uploads/ImgTemp/574d5064d25b5.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '0ad6056b6f4f5d968b6469358ae04964', '', '0');
INSERT INTO `sr_file` VALUES ('16', '', 'Uploads/ImgTemp/574d507fee52c.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '51f4332f1f307e057ebd99aed9a1f85a', '', '0');
INSERT INTO `sr_file` VALUES ('17', '', 'Uploads/ImgTemp/574d508cb4e26.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '3667720cd13c4b3acd03ad1d35373b13', '', '0');
INSERT INTO `sr_file` VALUES ('18', '', 'Uploads/ImgTemp/574d50ac4f84d.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '7bc9f3448ca3192a287ea03aaa15d493', '', '0');
INSERT INTO `sr_file` VALUES ('19', '', 'Uploads/ImgTemp/574d50bb02934.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '180b6f8d9f917bcd39eddcc5e9658562', '', '0');
INSERT INTO `sr_file` VALUES ('20', '', 'Uploads/ImgTemp/574d50e8d3393.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '11a739acd80a4a8a0b93bb8efafca589', '', '0');
INSERT INTO `sr_file` VALUES ('21', '', 'Uploads/ImgTemp/574d5137f3559.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '627130a72d4f58ff9d6c749254da315c', '', '0');
INSERT INTO `sr_file` VALUES ('22', '', 'Uploads/ImgTemp/574d51f806451.jpg', 'jpg', 'application/octet-stream', '780831', '1024', '768', '6b98b01d31b745b473d82408695a4530', '', '0');
INSERT INTO `sr_file` VALUES ('24', '', 'Uploads/ImgTemp/574d58b0ef87a.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '704618439d87c6487bb037c08753566e', '', '0');
INSERT INTO `sr_file` VALUES ('25', '', 'Uploads/ImgTemp/574d58d22a3d4.jpg', 'jpg', 'application/octet-stream', '775702', '1024', '768', '189def28f0c4e9c738b7fd73b48191f8', '', '0');
INSERT INTO `sr_file` VALUES ('26', '', 'Uploads/ImgTemp/574d58e7b092d.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '867d5699680821d2d143d60871a0a5f0', '', '0');
INSERT INTO `sr_file` VALUES ('27', '', 'Uploads/ImgTemp/574d58fc8e326.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', 'cd2debfe09df21b2adbc43e7d26cae98', '', '0');
INSERT INTO `sr_file` VALUES ('28', '', 'Uploads/ImgTemp/574d599bd7775.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '51b1a89992eac58e67a6386f2ab9846e', '', '0');
INSERT INTO `sr_file` VALUES ('29', '', 'Uploads/ImgTemp/574d5cc423d5b.jpg', 'jpg', 'application/octet-stream', '620888', '1024', '768', 'b785e1e89e5de9fe5727331516181e4a', '', '0');
INSERT INTO `sr_file` VALUES ('30', '', 'Uploads/ImgTemp/574d5e0c91e3e.jpg', 'jpg', 'application/octet-stream', '561276', '1024', '768', '38ac39521287150e02cd02cf67b89808', '', '0');
INSERT INTO `sr_file` VALUES ('31', '', 'Uploads/ImgTemp/574d5e9a32f19.jpg', 'jpg', 'application/octet-stream', '777835', '1024', '768', '630691042b807e8ae18272abf4413856', '', '0');
INSERT INTO `sr_file` VALUES ('32', '', 'Uploads/ImgTemp/574d5edac0787.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '7d00126d7303455cd05cb1371aa9f5d0', '', '0');
INSERT INTO `sr_file` VALUES ('33', '', 'Uploads/ImgTemp/574d613cd2445.jpg', 'jpg', 'application/octet-stream', '620888', '1024', '768', 'fdceb20286ce67ed128a6a224a3ae636', '', '0');
INSERT INTO `sr_file` VALUES ('34', '', 'Uploads/ImgTemp/574d62614b30c.jpg', 'jpg', 'application/octet-stream', '595284', '1024', '768', '573cf313a3f77ce56132c9397863d957', '', '0');
INSERT INTO `sr_file` VALUES ('36', '', 'Uploads/ImgTemp/574d63ee8b936.jpg', 'jpg', 'application/octet-stream', '845941', '1024', '768', '346f4d44dfcf64919a1d46df60e54f98', '', '0');
INSERT INTO `sr_file` VALUES ('38', '', 'Uploads/ImgTemp/574d660037a9d.jpg', 'jpg', 'image/jpeg', '37138', '1000', '750', '29dc5e8004431454c67944a8fb3b65db', '', '0');
INSERT INTO `sr_file` VALUES ('39', '', 'Uploads/ImgTemp/574d662ba46ca.png', 'png', 'image/png', '9835', '1000', '750', 'd5883c7b89de0598038e1c52854f058e', '', '0');
INSERT INTO `sr_file` VALUES ('40', '', 'Uploads/ImgTemp/574d66cd31bc9.jpg', 'jpg', 'image/jpeg', '21568', '1000', '750', '7ab5f5140bc4663a41d65a2726c655e1', '', '0');
INSERT INTO `sr_file` VALUES ('41', '', 'Uploads/ImgTemp/574d6707f0be3.jpg', 'jpg', 'image/jpeg', '21568', '1000', '750', '8916dd646271bfe75180552bdfa1f56d', '', '0');
INSERT INTO `sr_file` VALUES ('42', '', 'Uploads/ImgTemp/574d670db7f05.jpg', 'jpg', 'image/jpeg', '34666', '1000', '750', '7addfbb1f44f8f545b99fcade26d5399', '', '0');
INSERT INTO `sr_file` VALUES ('43', '', 'Uploads/ImgTemp/574d672eef171.jpg', 'jpg', 'image/jpeg', '845941', '1024', '768', '51f4e3f519d2e4a0584a29ab5c87af18', '', '0');
INSERT INTO `sr_file` VALUES ('44', '', 'Uploads/ImgTemp/574d6d73449f2.png', 'png', 'image/png', '5049', '300', '400', '497c8a8eb3e4eccf86f598a76bd771ac', '', '0');
INSERT INTO `sr_file` VALUES ('45', '', 'Uploads/ImgTemp/574d6d9315b3e.png', 'png', 'image/png', '9835', '1000', '750', 'd2ecaf3df07a574329e7cd7f9e9c606e', '', '0');
INSERT INTO `sr_file` VALUES ('46', '', 'Uploads/ImgTemp/574d6db957aab.png', 'png', 'image/png', '9835', '1000', '750', '5535e3a748d669e6a1211d11ff5c7649', '', '0');
INSERT INTO `sr_file` VALUES ('47', '', 'Uploads/ImgTemp/574d6dec37e80.png', 'png', 'image/png', '9835', '1000', '750', '760f9b6382688100e9d2a6e221b940d4', '', '0');
INSERT INTO `sr_file` VALUES ('48', '', 'Uploads/ImgTemp/574d6ebb44903.png', 'png', 'image/png', '9835', '1000', '750', 'dc06f0060b717b14c6ac3c41cc88fcda', '', '0');
INSERT INTO `sr_file` VALUES ('49', '', 'Uploads/ImgTemp/574d6ed219e9c.png', 'png', 'image/png', '9835', '1000', '750', '951aa7dba03cbe47ee484c90819ed521', '', '0');
INSERT INTO `sr_file` VALUES ('50', '', 'Uploads/ImgTemp/574d7041e7004.png', 'png', 'image/png', '9835', '1000', '750', '02f037a8ced9a866f8571cfec9878daf', '', '0');
INSERT INTO `sr_file` VALUES ('51', '', 'Uploads/ImgTemp/574d705bbd5e9.png', 'png', 'image/png', '9835', '1000', '750', '7634256e99e4f9c9d3c640a4c64b5976', '', '0');
INSERT INTO `sr_file` VALUES ('52', '', 'Uploads/ImgTemp/574d722e22814.png', 'png', 'image/png', '9835', '1000', '750', 'b0a86ddf1c78577c1bdff8897bc267f0', '', '0');
INSERT INTO `sr_file` VALUES ('53', '', 'Uploads/ImgTemp/574d726250e35.png', 'png', 'image/png', '9835', '1000', '750', '637f4fc110aa4cae0d093c5a802737fe', '', '0');
INSERT INTO `sr_file` VALUES ('54', '', 'Uploads/ImgTemp/574d7517d4661.png', 'png', 'image/png', '9835', '1000', '750', 'f5e3056175e2ea3ba00854887813722a', '', '0');
INSERT INTO `sr_file` VALUES ('55', '', 'Uploads/ImgTemp/574d76524c68a.png', 'png', 'image/png', '9835', '1000', '750', '1b482615ff40ca4d1e91d703a007f135', '', '0');
INSERT INTO `sr_file` VALUES ('56', '', 'Uploads/ImgTemp/574d76f0b17f7.jpg', 'jpg', 'image/jpeg', '34666', '1000', '750', '982d8233418ff65a0353e43feb9cc1bd', '', '0');
INSERT INTO `sr_file` VALUES ('57', '', 'Uploads/ImgTemp/574d7729d9d8c.png', 'png', 'image/png', '9835', '1000', '750', '873d73472296fd27098972bc0b55fd7d', '', '0');
INSERT INTO `sr_file` VALUES ('58', '', 'Uploads/ImgTemp/574d7991370d7.png', 'png', 'image/png', '9835', '1000', '750', '4f873e894bdf1e87d6a1304d71c472e7', '', '0');
INSERT INTO `sr_file` VALUES ('59', '', 'Uploads/ImgTemp/574d8e56cbc55.jpg', 'jpg', 'image/jpeg', '31025', '1000', '750', '7213af51e9279f9f44fc6c607c8cca5b', '', '0');
INSERT INTO `sr_file` VALUES ('60', '', 'Uploads/ImgTemp/574d8efd6cedf.jpg', 'jpg', 'image/jpeg', '37138', '1000', '750', '7ecb8cdf43c2207da14e0c5ddb1376f7', '', '0');
INSERT INTO `sr_file` VALUES ('61', '', 'Uploads/ImgTemp/574e57b2be1fc.png', 'png', 'image/png', '9835', '1000', '750', '6f74a08a1a4bb8eb4666bc2a24b00777', '', '0');
INSERT INTO `sr_file` VALUES ('62', '', 'Uploads/ImgTemp/574e763f80722.png', 'png', 'image/png', '9835', '1000', '750', '0c834874799e1488a43a1f47494511c5', '', '0');
INSERT INTO `sr_file` VALUES ('63', '', 'Uploads/ImgTemp/574e7691a4815.png', 'png', 'image/png', '9835', '1000', '750', 'e59a3b6e55656a34f729f378c48a393e', '', '0');
INSERT INTO `sr_file` VALUES ('64', '', 'Uploads/ImgTemp/574e78d0653de.jpg', 'jpg', 'image/jpeg', '31025', '1000', '750', '56c6a51e6214e43d007b2532c7f97bcf', '', '0');
INSERT INTO `sr_file` VALUES ('65', '', 'Uploads/ImgTemp/574e7bcc13dd5.jpg', 'jpg', 'image/jpeg', '34666', '1000', '750', '0acd26c661ae2cf0c3500f51283db350', '', '0');
INSERT INTO `sr_file` VALUES ('66', '', 'Uploads/ImgTemp/574f9106cdc5b.jpg', 'jpg', 'image/jpeg', '620888', '1024', '768', '39b51a335d730ce818ba070a708df725', '', '0');
INSERT INTO `sr_file` VALUES ('67', '', 'Uploads/ImgTemp/574f91fba1f5f.jpg', 'jpg', 'image/jpeg', '620888', '1024', '768', 'a3a08c5b4f918bbac3d3f26732b24a88', '', '0');
INSERT INTO `sr_file` VALUES ('68', '', 'Uploads/ImgTemp/574f924b9814c.jpg', 'jpg', 'image/jpeg', '620888', '1024', '768', '2ec499f1ec14992ca7fb39cba545dacc', '', '0');
INSERT INTO `sr_file` VALUES ('69', '', 'Uploads/ImgTemp/574f927f4688a.jpg', 'jpg', 'image/jpeg', '845941', '1024', '768', '51cec801b9f69668197cf0ebdb2631a3', '', '0');
INSERT INTO `sr_file` VALUES ('70', '', 'Uploads/ImgTemp/574f929695a2c.jpg', 'jpg', 'image/jpeg', '595284', '1024', '768', '3d257abc095dc75f81475c99debc5863', '', '0');
INSERT INTO `sr_file` VALUES ('71', '', 'Uploads/ImgTemp/574f92e754a86.jpg', 'jpg', 'image/jpeg', '620888', '1024', '768', 'f5770490e1beb510eeb4cfdcce103859', '', '0');
INSERT INTO `sr_file` VALUES ('72', '', 'Uploads/ImgTemp/574f930e3ab99.jpg', 'jpg', 'image/jpeg', '595284', '1024', '768', '5ffa4c76cf1039a490da771aceec02ec', '', '0');
INSERT INTO `sr_file` VALUES ('73', '', 'Uploads/ImgTemp/574f93f70684e.jpg', 'jpg', 'image/jpeg', '620888', '1024', '768', 'f31d089cfee5e1a0b2193aa11a312fef', '', '0');
INSERT INTO `sr_file` VALUES ('74', '', 'Uploads/ImgTemp/574f94422a737.jpg', 'jpg', 'image/jpeg', '879394', '1024', '768', '52910c042cb065f0dff673df9993e240', '', '0');
INSERT INTO `sr_file` VALUES ('75', '', 'Uploads/ImgTemp/574f9667a8d05.png', 'png', 'image/png', '13643', '999', '372', 'aa34c2bfae5cfe7eb0deb15bbb4ca9e9', '', '0');
INSERT INTO `sr_file` VALUES ('76', '', 'Uploads/ImgTemp/574f967f48ba9.png', 'png', 'image/png', '13643', '999', '372', '5aad4325cb8bdf5e8ed0ff746b0715e2', '', '0');
INSERT INTO `sr_file` VALUES ('77', '', 'Uploads/ImgTemp/575194750c011.jpg', 'jpg', 'image/jpeg', '143945', '1920', '480', '6480f06d8738810c6079a6175984fab0', '', '0');
INSERT INTO `sr_file` VALUES ('78', '', 'Uploads/ImgTemp/575195e2539d8.jpg', 'jpg', 'image/jpeg', '143945', '1920', '480', 'ccaac35bcd37f560481c53da605833ed', '', '0');
INSERT INTO `sr_file` VALUES ('79', '', 'Uploads/ImgTemp/5754e90d1f8aa.jpg', 'jpg', 'image/jpeg', '143945', '1920', '480', 'bafa453831a8808c7d1c1f619f9fcc70', '', '0');

-- ----------------------------
-- Table structure for sr_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `sr_friend_link`;
CREATE TABLE `sr_friend_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '友情链接类型:1文字连接,2图片链接',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT 'URL',
  `logo` varchar(120) NOT NULL DEFAULT '' COMMENT 'logo图片地址',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of sr_friend_link
-- ----------------------------
INSERT INTO `sr_friend_link` VALUES ('1', '0', '首页', '/', '', '0', '0', '1', '4294967295');
INSERT INTO `sr_friend_link` VALUES ('2', '1', '百度', 'https://www.baidu.com/', '', '0', '0', '1', '1458203212');
INSERT INTO `sr_friend_link` VALUES ('3', '1', '百度', 'http://www.baidu.com', '', '1', '0', '0', '1458203595');
INSERT INTO `sr_friend_link` VALUES ('4', '2', '百度', '', '', '0', '0', '0', '1458293752');
INSERT INTO `sr_friend_link` VALUES ('5', '1', '测试', '#', '', '0', '1', '0', '1458555502');
INSERT INTO `sr_friend_link` VALUES ('6', '1', '测试数据9', '', '', '99', '1', '1', '1458565578');
INSERT INTO `sr_friend_link` VALUES ('7', '2', '测试', '', 'Uploads/Friendlink/56f097a8a91c3.jpg', '0', '0', '0', '1458608051');
INSERT INTO `sr_friend_link` VALUES ('8', '1', '1', '', '', '0', '1', '0', '1458638811');
INSERT INTO `sr_friend_link` VALUES ('9', '2', '1', '', '', '0', '0', '0', '1458638840');
INSERT INTO `sr_friend_link` VALUES ('10', '1', '百度', 'https://www.baidu.com', '', '0', '0', '0', '1458813722');
INSERT INTO `sr_friend_link` VALUES ('11', '1', '优酷', '', '', '0', '0', '0', '1458813752');
INSERT INTO `sr_friend_link` VALUES ('12', '1', '腾讯新闻', '', '', '0', '0', '0', '1458813763');
INSERT INTO `sr_friend_link` VALUES ('13', '1', '土豆', '', '', '0', '0', '0', '1458813771');
INSERT INTO `sr_friend_link` VALUES ('14', '1', '快递100', '', '', '0', '0', '0', '1458813808');
INSERT INTO `sr_friend_link` VALUES ('15', '1', '物流查询', '', '', '0', '0', '0', '1458813837');
INSERT INTO `sr_friend_link` VALUES ('16', '1', '京东商城', '', '', '0', '0', '0', '1458813869');
INSERT INTO `sr_friend_link` VALUES ('17', '1', '淘宝网', '', '', '0', '0', '0', '1458813875');
INSERT INTO `sr_friend_link` VALUES ('18', '1', '当当网', '', '', '0', '0', '0', '1458813884');
INSERT INTO `sr_friend_link` VALUES ('19', '1', '淘宝', 'www.baidu.com', '', '1', '0', '1', '1460109789');
INSERT INTO `sr_friend_link` VALUES ('20', '1', '雷达', 'www.baidu.com', '', '1', '0', '1', '1460109823');

-- ----------------------------
-- Table structure for sr_home_recommond
-- ----------------------------
DROP TABLE IF EXISTS `sr_home_recommond`;
CREATE TABLE `sr_home_recommond` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '文章id  或者 用户id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `addtime` int(20) NOT NULL DEFAULT '0' COMMENT '时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0：否 1：  是',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用 0：否 1： 是',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文章推荐 1 ： 用户推荐 2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页推荐轮播的文章';

-- ----------------------------
-- Records of sr_home_recommond
-- ----------------------------

-- ----------------------------
-- Table structure for sr_lable
-- ----------------------------
DROP TABLE IF EXISTS `sr_lable`;
CREATE TABLE `sr_lable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '' COMMENT '标签名',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0：否1：是',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用：0 禁用 1： 启用',
  `talent` int(11) NOT NULL DEFAULT '0' COMMENT '标签达人的id',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐  0:推荐 1：推荐',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统标签  0 是 1：否',
  `activity` int(11) NOT NULL DEFAULT '0' COMMENT '标签活跃度',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf16 COMMENT='标签表';

-- ----------------------------
-- Records of sr_lable
-- ----------------------------
INSERT INTO `sr_lable` VALUES ('279', '开源', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('280', '谷歌', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('281', 'JAVA', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('282', '天气', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `sr_lable` VALUES ('283', 'php', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `sr_lable` VALUES ('284', '只能拿到你', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('285', '难道你的你', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('286', '将打击打击', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('287', '大家记得叫', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('288', '的亟待解决', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('289', '测试', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `sr_lable` VALUES ('290', 'vbb', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('291', 'df', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('292', 'ggf', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('293', 'fff', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('294', 'ggg', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('295', 'ggggggggg', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('296', 'ffgggg', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('297', 'g', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('298', 'gg', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('299', 'f', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('300', 'gff', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sr_lable` VALUES ('301', '美图', '0', '0', '0', '0', '0', '1', '0');
INSERT INTO `sr_lable` VALUES ('302', '熊孩子', '0', '0', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for sr_member
-- ----------------------------
DROP TABLE IF EXISTS `sr_member`;
CREATE TABLE `sr_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户组ID',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(6) NOT NULL DEFAULT '' COMMENT '密码加密串',
  `login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '登录id',
  `login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `deal_salt` char(6) NOT NULL DEFAULT '' COMMENT '支付密码加密串',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐别人关注:0否,1是',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  `qq_open_id` varchar(50) NOT NULL DEFAULT '' COMMENT 'QQ第三方登录的OPEN_ID',
  `sina_open_id` varchar(50) NOT NULL DEFAULT '' COMMENT '微博第三方登录的OPEN_ID',
  `weixin_open_id` varchar(50) NOT NULL DEFAULT '' COMMENT '微信第三方登录',
  `speciall_id` varchar(50) NOT NULL DEFAULT '' COMMENT '专题权限 用户英文逗号分隔',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '个人描述',
  `icon` varchar(225) NOT NULL DEFAULT '' COMMENT '用户头像',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:男 2：女  0：保密',
  `is_attention` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:显示关注 1： 不显示关注',
  `is_fans` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：显示我的粉丝  1： 不显示我的关注',
  `is_favor` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：显示我的喜欢文章  1： 不显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8 COMMENT='前台用户信息表';

-- ----------------------------
-- Records of sr_member
-- ----------------------------
INSERT INTO `sr_member` VALUES ('231', '', 'Do', '0', '', '', '', '1465182399', '', '0', '0', '0', '6143AAEC9D26B86168F8EE3BD34CF542', '', '', '', '', 'http://q.qlogo.cn/qqapp/1105299997/6143AAEC9D26B86168F8EE3BD34CF542/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('232', '', '外婆家的摇篮', '0', '', '', '', '1465182902', '', '0', '0', '1', 'D67D9D2734B5A302E69C8843C624375E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/D67D9D2734B5A302E69C8843C624375E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('233', '13554161526', '丁伟手机', '0', '9db06bcff9248837f86d1a6bcf41c9e7', '', '', '1465183002', '', '0', '0', '0', '', '', '', '', '112312312313', 'Uploads/head/20160607/575637be568e1.jpg', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('234', '', '晨晨晨晨晨、', '0', '', '', '', '1465183335', '', '0', '0', '0', '52A562B2566D04F2AAC88854DB6AFA3B', '', '', '', '', 'http://q.qlogo.cn/qqapp/1105299997/52A562B2566D04F2AAC88854DB6AFA3B/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('235', '', '杨开', '0', '', '', '', '1465183905', '', '0', '0', '1', 'A404267378367D1C37C7ECB90F9CE31E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/A404267378367D1C37C7ECB90F9CE31E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('236', '', '外婆家的摇篮', '0', '', '', '', '1465184713', '', '0', '0', '1', 'D67D9D2734B5A302E69C8843C624375E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/D67D9D2734B5A302E69C8843C624375E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('237', '', '外婆家的摇篮', '0', '', '', '', '1465184958', '', '0', '0', '1', 'D67D9D2734B5A302E69C8843C624375E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/D67D9D2734B5A302E69C8843C624375E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('238', '', '淡定的程序猿', '1', '', '', '', '1465185393', '', '0', '0', '0', '5573191A8368C873A0391E90A3790FBE', '', '', '', '', 'Uploads/head/20160606/5754f48acb847.jpg', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('239', '', '杨开', '0', '', '', '', '1465185601', '', '0', '0', '1', 'A404267378367D1C37C7ECB90F9CE31E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/A404267378367D1C37C7ECB90F9CE31E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('240', '', '菩提道心', '0', '', '', '', '1465185908', '', '0', '0', '0', '4DC3AE5209EFB8997FDA429FC03CCCFA', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105299997/4DC3AE5209EFB8997FDA429FC03CCCFA/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('241', '', '杨开', '0', '', '', '', '1465186316', '', '0', '0', '1', 'A404267378367D1C37C7ECB90F9CE31E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/A404267378367D1C37C7ECB90F9CE31E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('242', '18627072783', '杨开手机号', '0', '9db06bcff9248837f86d1a6bcf41c9e7', '', '', '1465191895', '', '0', '0', '1', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('243', '', '杨开', '0', '', '', '', '1465192070', '', '0', '0', '1', 'A404267378367D1C37C7ECB90F9CE31E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/A404267378367D1C37C7ECB90F9CE31E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('244', '', '外婆家的摇篮', '0', '', '', '', '1465192513', '', '0', '0', '1', 'D67D9D2734B5A302E69C8843C624375E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/D67D9D2734B5A302E69C8843C624375E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('245', '', '外婆家的摇篮', '0', '', '', '', '1465193033', '', '0', '0', '1', 'D67D9D2734B5A302E69C8843C624375E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/D67D9D2734B5A302E69C8843C624375E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('246', '', '杨开', '0', '', '', '', '1465193085', '', '0', '0', '1', '', '', 'ojahIs306NwUfHv8V07sBKsLoZOI', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6TOsuBDsNV9sSNkdia7Nsicicbh0RVGjp5OjTBnB3K4cOdDeuMH1BhC4tFU8txX7jF7EpGRqelzrL4wGnuYEgyLWI054cDYUibdy8/0', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('247', '', '外婆家的摇篮', '0', '', '', '', '1465193156', '', '0', '0', '1', 'D67D9D2734B5A302E69C8843C624375E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/D67D9D2734B5A302E69C8843C624375E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('248', '', '杨开', '0', '', '', '', '1465193564', '', '0', '0', '1', 'A404267378367D1C37C7ECB90F9CE31E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/A404267378367D1C37C7ECB90F9CE31E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('249', '', '杨开', '0', '', '', '', '1465195495', '', '0', '0', '0', 'A404267378367D1C37C7ECB90F9CE31E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/A404267378367D1C37C7ECB90F9CE31E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('250', '', '丁伟手机QQ', '0', '', '', '', '1465255389', '', '0', '0', '0', 'D67D9D2734B5A302E69C8843C624375E', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/D67D9D2734B5A302E69C8843C624375E/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('251', '13177005680', '小白', '0', '14e1b600b1fd579f47433b88e8d85291', '', '', '1465297146', '', '0', '0', '0', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('252', '15827501795', '颜总', '0', '9db06bcff9248837f86d1a6bcf41c9e7', '', '', '1465356369', '', '0', '0', '0', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('253', '', '菩提道心', '0', '', '', '', '1465698197', '', '0', '0', '0', 'DB1E31E952FFEF224C89E6201C2FA467', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/DB1E31E952FFEF224C89E6201C2FA467/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('254', '', '', '0', '', '', '', '0', '', '0', '0', '0', '', '', '', '', '', 'Uploads/head/20160612/575d157896965.jpg', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('255', '', '', '0', '', '', '', '0', '', '0', '0', '0', '', '', '', '', '', 'Uploads/head/20160613/575e1b818d2dc.jpg', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('256', '15171438797', '淡定', '0', '9db06bcff9248837f86d1a6bcf41c9e7', '', '', '1465788285', '', '0', '0', '0', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('257', '', '天才在左，疯子在右', '0', '', '', '', '1465871038', '', '0', '0', '0', '8A9AA39C54864FB63E3C65A33782CCE7', '', '', '', '', 'http://q.qlogo.cn/qqapp/1105299997/8A9AA39C54864FB63E3C65A33782CCE7/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('258', '13476095803', '周杨', '0', '9db06bcff9248837f86d1a6bcf41c9e7', '', '', '1465978270', '', '0', '0', '0', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('259', '', '丁伟', '0', '', '', '', '1465988181', '', '0', '0', '1', '', '', 'ojahIs6XirwXVekr_768jbpLuL8E', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw/0', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('260', '', '丁伟', '0', '', '', '', '1465988537', '', '0', '0', '1', '', '', 'ojahIs6XirwXVekr_768jbpLuL8E', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw/0', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('261', '', '丁伟', '0', '', '', '', '1465991132', '', '0', '0', '1', '', '', 'ojahIs6XirwXVekr_768jbpLuL8E', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw/0', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('262', '', '丁伟', '0', '', '', '', '1465991401', '', '0', '0', '1', '', '', 'ojahIs6XirwXVekr_768jbpLuL8E', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw/0', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('263', '', '丁伟', '0', '', '', '', '1465991551', '', '0', '0', '1', '', '', 'ojahIs6XirwXVekr_768jbpLuL8E', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw/0', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('264', '', '丁伟', '0', '', '', '', '1465991663', '', '0', '0', '0', '', '', 'ojahIs6XirwXVekr_768jbpLuL8E', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4y19fJn3t8yPb4YfqibLw8EzO5QWNB5ODRrsNwLqAy0uej0icIHLjxrMA5icsHZ5BTY8hMegEOZEGKw/0', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('265', '', '', '0', '', '', '', '1465999261', '', '0', '0', '0', 'B3B4911F4CDAD63E18646E159849EA5F', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('266', '18671427937', 'hycold', '0', '679ba113a3cfe634d73e35404cf04892', '', '', '1466227632', '', '0', '0', '0', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('267', '13554101846', '11111', '0', '9db06bcff9248837f86d1a6bcf41c9e7', '', '', '1466227824', '', '0', '0', '0', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('268', '', 'Mr.H', '0', '', '', '', '1466470107', '', '0', '0', '0', '667DDC2496CAF79B0F2D551D8CA0B1D5', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/667DDC2496CAF79B0F2D551D8CA0B1D5/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('269', '', '杨霄羽 · Michael Yang', '0', '', '', '', '1466651493', '', '0', '0', '0', '', '', 'ojahIs7Gq0mDL5oi_sJ0FmXqhQT4', '', '', 'http://wx.qlogo.cn/mmopen/jj4e65x0Px24HqBXGmsgqTm2x8OictY3ciaiatuHbicCFibyxmBmPBABrre5DwkmWoTUKlribCUku6EsR1lW2tYnwyH0KY1DUqOGwNWyNWAEseHrk/0', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('270', '', '鱼鱼鱼鱼、', '0', '', '', '', '1467037090', '', '0', '0', '0', '0007FA15905D4E3837771A6B1B1B5B0F', '', '', '', '', 'http://qzapp.qlogo.cn/qzapp/1105373679/0007FA15905D4E3837771A6B1B1B5B0F/100', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('271', '18924599066', 'lure', '0', '1869cf9b9f74fc9e1bdd33afaae9c6e5', '', '', '1467179245', '', '0', '0', '0', '', '', '', '', '', '', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('272', '', '杨开123', '0', '', '', '', '1467183726', '', '0', '0', '0', '', '5407356896', '', '', '', 'http://tva3.sinaimg.cn/crop.0.0.640.640.50/005TWIxOjw8f2dirf71jyj30hs0hstax.jpg', '0000-00-00', '0', '0', '0', '0');
INSERT INTO `sr_member` VALUES ('273', '13125180840', '金金', '0', 'd0521106f6ba7f9ac0a7370fb28d0ec6', '', '', '1467271414', '', '0', '0', '0', '', '', '', '', '', 'Uploads/head/20160630/5774c95b57001.jpg', '0000-00-00', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sr_member_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `sr_member_blacklist`;
CREATE TABLE `sr_member_blacklist` (
  `uid` int(11) NOT NULL COMMENT '户用UID',
  `fid` int(11) NOT NULL COMMENT '被屏蔽的用户UID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间戳',
  UNIQUE KEY `uid` (`uid`,`fid`) USING BTREE,
  KEY `fid` (`fid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台用户拉黑表';

-- ----------------------------
-- Records of sr_member_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for sr_member_count
-- ----------------------------
DROP TABLE IF EXISTS `sr_member_count`;
CREATE TABLE `sr_member_count` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `feed_count` int(6) NOT NULL DEFAULT '0' COMMENT '文章数',
  `attention_count` int(6) NOT NULL DEFAULT '0' COMMENT '关注数',
  `fond_count` int(6) NOT NULL DEFAULT '0' COMMENT '喜欢的数量',
  `fans_count` int(6) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  KEY `atme` (`uid`,`feed_count`) USING BTREE,
  KEY `comment` (`uid`,`attention_count`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人记录表';

-- ----------------------------
-- Records of sr_member_count
-- ----------------------------
INSERT INTO `sr_member_count` VALUES ('230', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('231', '2', '1', '0', '0');
INSERT INTO `sr_member_count` VALUES ('232', '0', '0', '0', '-1');
INSERT INTO `sr_member_count` VALUES ('233', '1', '3', '0', '0');
INSERT INTO `sr_member_count` VALUES ('234', '0', '1', '0', '1');
INSERT INTO `sr_member_count` VALUES ('235', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('236', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('237', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('238', '2', '2', '1', '2');
INSERT INTO `sr_member_count` VALUES ('239', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('240', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('241', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('242', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('243', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('244', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('245', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('246', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('247', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('248', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('249', '1', '11', '1', '1');
INSERT INTO `sr_member_count` VALUES ('250', '0', '0', '1', '1');
INSERT INTO `sr_member_count` VALUES ('251', '0', '0', '0', '2');
INSERT INTO `sr_member_count` VALUES ('252', '0', '3', '0', '2');
INSERT INTO `sr_member_count` VALUES ('253', '1', '1', '1', '3');
INSERT INTO `sr_member_count` VALUES ('256', '0', '0', '0', '2');
INSERT INTO `sr_member_count` VALUES ('257', '0', '0', '0', '3');
INSERT INTO `sr_member_count` VALUES ('258', '0', '0', '0', '1');
INSERT INTO `sr_member_count` VALUES ('259', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('260', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('261', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('262', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('263', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('264', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('265', '0', '0', '0', '1');
INSERT INTO `sr_member_count` VALUES ('266', '0', '0', '0', '1');
INSERT INTO `sr_member_count` VALUES ('267', '0', '0', '0', '1');
INSERT INTO `sr_member_count` VALUES ('268', '0', '0', '0', '1');
INSERT INTO `sr_member_count` VALUES ('269', '0', '0', '0', '2');
INSERT INTO `sr_member_count` VALUES ('270', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('271', '0', '0', '1', '0');
INSERT INTO `sr_member_count` VALUES ('272', '0', '0', '0', '0');
INSERT INTO `sr_member_count` VALUES ('273', '1', '0', '1', '0');

-- ----------------------------
-- Table structure for sr_member_follow
-- ----------------------------
DROP TABLE IF EXISTS `sr_member_follow`;
CREATE TABLE `sr_member_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '被关注者ID',
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '关注者ID(粉丝)',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '关注时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid-fid` (`uid`,`fid`) USING BTREE,
  UNIQUE KEY `fid-uid` (`fid`,`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8 COMMENT='用户关系表';

-- ----------------------------
-- Records of sr_member_follow
-- ----------------------------
INSERT INTO `sr_member_follow` VALUES ('775', '231', '232', '1465182903');
INSERT INTO `sr_member_follow` VALUES ('776', '231', '233', '1465183002');
INSERT INTO `sr_member_follow` VALUES ('778', '231', '234', '1465183335');
INSERT INTO `sr_member_follow` VALUES ('779', '232', '234', '1465183335');
INSERT INTO `sr_member_follow` VALUES ('780', '233', '234', '1465183335');
INSERT INTO `sr_member_follow` VALUES ('781', '234', '80', '1465183347');
INSERT INTO `sr_member_follow` VALUES ('782', '231', '235', '1465183905');
INSERT INTO `sr_member_follow` VALUES ('783', '232', '235', '1465183905');
INSERT INTO `sr_member_follow` VALUES ('784', '233', '235', '1465183905');
INSERT INTO `sr_member_follow` VALUES ('785', '234', '235', '1465183905');
INSERT INTO `sr_member_follow` VALUES ('786', '231', '236', '1465184713');
INSERT INTO `sr_member_follow` VALUES ('787', '233', '236', '1465184713');
INSERT INTO `sr_member_follow` VALUES ('788', '234', '236', '1465184713');
INSERT INTO `sr_member_follow` VALUES ('789', '235', '236', '1465184713');
INSERT INTO `sr_member_follow` VALUES ('790', '231', '237', '1465184958');
INSERT INTO `sr_member_follow` VALUES ('791', '233', '237', '1465184958');
INSERT INTO `sr_member_follow` VALUES ('792', '234', '237', '1465184958');
INSERT INTO `sr_member_follow` VALUES ('793', '235', '237', '1465184958');
INSERT INTO `sr_member_follow` VALUES ('794', '231', '238', '1465185393');
INSERT INTO `sr_member_follow` VALUES ('795', '233', '238', '1465185393');
INSERT INTO `sr_member_follow` VALUES ('796', '234', '238', '1465185393');
INSERT INTO `sr_member_follow` VALUES ('797', '235', '238', '1465185393');
INSERT INTO `sr_member_follow` VALUES ('798', '237', '238', '1465185393');
INSERT INTO `sr_member_follow` VALUES ('799', '231', '239', '1465185601');
INSERT INTO `sr_member_follow` VALUES ('800', '233', '239', '1465185601');
INSERT INTO `sr_member_follow` VALUES ('801', '234', '239', '1465185601');
INSERT INTO `sr_member_follow` VALUES ('802', '237', '239', '1465185601');
INSERT INTO `sr_member_follow` VALUES ('803', '238', '239', '1465185601');
INSERT INTO `sr_member_follow` VALUES ('804', '231', '240', '1465185908');
INSERT INTO `sr_member_follow` VALUES ('805', '233', '240', '1465185908');
INSERT INTO `sr_member_follow` VALUES ('806', '234', '240', '1465185908');
INSERT INTO `sr_member_follow` VALUES ('807', '237', '240', '1465185908');
INSERT INTO `sr_member_follow` VALUES ('808', '238', '240', '1465185908');
INSERT INTO `sr_member_follow` VALUES ('809', '239', '240', '1465185908');
INSERT INTO `sr_member_follow` VALUES ('810', '231', '241', '1465186316');
INSERT INTO `sr_member_follow` VALUES ('811', '233', '241', '1465186316');
INSERT INTO `sr_member_follow` VALUES ('812', '234', '241', '1465186316');
INSERT INTO `sr_member_follow` VALUES ('813', '237', '241', '1465186316');
INSERT INTO `sr_member_follow` VALUES ('814', '238', '241', '1465186316');
INSERT INTO `sr_member_follow` VALUES ('815', '240', '241', '1465186316');
INSERT INTO `sr_member_follow` VALUES ('816', '231', '242', '1465191895');
INSERT INTO `sr_member_follow` VALUES ('817', '233', '242', '1465191895');
INSERT INTO `sr_member_follow` VALUES ('818', '234', '242', '1465191895');
INSERT INTO `sr_member_follow` VALUES ('819', '238', '242', '1465191895');
INSERT INTO `sr_member_follow` VALUES ('820', '240', '242', '1465191895');
INSERT INTO `sr_member_follow` VALUES ('821', '241', '242', '1465191895');
INSERT INTO `sr_member_follow` VALUES ('822', '231', '243', '1465192070');
INSERT INTO `sr_member_follow` VALUES ('823', '233', '243', '1465192070');
INSERT INTO `sr_member_follow` VALUES ('824', '234', '243', '1465192070');
INSERT INTO `sr_member_follow` VALUES ('825', '238', '243', '1465192070');
INSERT INTO `sr_member_follow` VALUES ('826', '240', '243', '1465192070');
INSERT INTO `sr_member_follow` VALUES ('827', '231', '244', '1465192513');
INSERT INTO `sr_member_follow` VALUES ('828', '233', '244', '1465192513');
INSERT INTO `sr_member_follow` VALUES ('829', '234', '244', '1465192513');
INSERT INTO `sr_member_follow` VALUES ('830', '238', '244', '1465192513');
INSERT INTO `sr_member_follow` VALUES ('831', '240', '244', '1465192513');
INSERT INTO `sr_member_follow` VALUES ('832', '243', '244', '1465192513');
INSERT INTO `sr_member_follow` VALUES ('833', '231', '245', '1465193033');
INSERT INTO `sr_member_follow` VALUES ('834', '233', '245', '1465193033');
INSERT INTO `sr_member_follow` VALUES ('835', '234', '245', '1465193033');
INSERT INTO `sr_member_follow` VALUES ('836', '238', '245', '1465193033');
INSERT INTO `sr_member_follow` VALUES ('837', '240', '245', '1465193033');
INSERT INTO `sr_member_follow` VALUES ('838', '243', '245', '1465193033');
INSERT INTO `sr_member_follow` VALUES ('839', '231', '246', '1465193085');
INSERT INTO `sr_member_follow` VALUES ('840', '233', '246', '1465193085');
INSERT INTO `sr_member_follow` VALUES ('841', '234', '246', '1465193085');
INSERT INTO `sr_member_follow` VALUES ('842', '238', '246', '1465193085');
INSERT INTO `sr_member_follow` VALUES ('843', '240', '246', '1465193085');
INSERT INTO `sr_member_follow` VALUES ('844', '243', '246', '1465193085');
INSERT INTO `sr_member_follow` VALUES ('845', '245', '246', '1465193085');
INSERT INTO `sr_member_follow` VALUES ('846', '231', '247', '1465193157');
INSERT INTO `sr_member_follow` VALUES ('847', '233', '247', '1465193157');
INSERT INTO `sr_member_follow` VALUES ('848', '234', '247', '1465193157');
INSERT INTO `sr_member_follow` VALUES ('849', '238', '247', '1465193157');
INSERT INTO `sr_member_follow` VALUES ('850', '240', '247', '1465193157');
INSERT INTO `sr_member_follow` VALUES ('851', '231', '248', '1465193564');
INSERT INTO `sr_member_follow` VALUES ('852', '233', '248', '1465193564');
INSERT INTO `sr_member_follow` VALUES ('853', '234', '248', '1465193564');
INSERT INTO `sr_member_follow` VALUES ('854', '238', '248', '1465193564');
INSERT INTO `sr_member_follow` VALUES ('855', '240', '248', '1465193564');
INSERT INTO `sr_member_follow` VALUES ('856', '247', '248', '1465193564');
INSERT INTO `sr_member_follow` VALUES ('857', '231', '249', '1465195495');
INSERT INTO `sr_member_follow` VALUES ('859', '234', '249', '1465195495');
INSERT INTO `sr_member_follow` VALUES ('860', '238', '249', '1465195495');
INSERT INTO `sr_member_follow` VALUES ('861', '240', '249', '1465195495');
INSERT INTO `sr_member_follow` VALUES ('862', '238', '231', '1465222183');
INSERT INTO `sr_member_follow` VALUES ('863', '231', '250', '1465255389');
INSERT INTO `sr_member_follow` VALUES ('864', '233', '250', '1465255389');
INSERT INTO `sr_member_follow` VALUES ('865', '234', '250', '1465255389');
INSERT INTO `sr_member_follow` VALUES ('866', '238', '250', '1465255389');
INSERT INTO `sr_member_follow` VALUES ('867', '240', '250', '1465255389');
INSERT INTO `sr_member_follow` VALUES ('868', '249', '250', '1465255389');
INSERT INTO `sr_member_follow` VALUES ('869', '231', '251', '1465297146');
INSERT INTO `sr_member_follow` VALUES ('870', '233', '251', '1465297146');
INSERT INTO `sr_member_follow` VALUES ('871', '234', '251', '1465297146');
INSERT INTO `sr_member_follow` VALUES ('872', '238', '251', '1465297146');
INSERT INTO `sr_member_follow` VALUES ('873', '240', '251', '1465297146');
INSERT INTO `sr_member_follow` VALUES ('874', '249', '251', '1465297146');
INSERT INTO `sr_member_follow` VALUES ('875', '250', '251', '1465297146');
INSERT INTO `sr_member_follow` VALUES ('876', '233', '249', '1465353759');
INSERT INTO `sr_member_follow` VALUES ('877', '231', '252', '1465356369');
INSERT INTO `sr_member_follow` VALUES ('878', '233', '252', '1465356369');
INSERT INTO `sr_member_follow` VALUES ('879', '234', '252', '1465356369');
INSERT INTO `sr_member_follow` VALUES ('880', '238', '252', '1465356369');
INSERT INTO `sr_member_follow` VALUES ('881', '240', '252', '1465356369');
INSERT INTO `sr_member_follow` VALUES ('882', '249', '252', '1465356369');
INSERT INTO `sr_member_follow` VALUES ('883', '250', '252', '1465356369');
INSERT INTO `sr_member_follow` VALUES ('884', '251', '252', '1465356369');
INSERT INTO `sr_member_follow` VALUES ('885', '252', '233', '1465369663');
INSERT INTO `sr_member_follow` VALUES ('886', '249', '233', '1465369664');
INSERT INTO `sr_member_follow` VALUES ('887', '251', '233', '1465369667');
INSERT INTO `sr_member_follow` VALUES ('889', '231', '253', '1465698197');
INSERT INTO `sr_member_follow` VALUES ('890', '233', '253', '1465698197');
INSERT INTO `sr_member_follow` VALUES ('891', '234', '253', '1465698197');
INSERT INTO `sr_member_follow` VALUES ('892', '238', '253', '1465698197');
INSERT INTO `sr_member_follow` VALUES ('893', '240', '253', '1465698197');
INSERT INTO `sr_member_follow` VALUES ('894', '249', '253', '1465698197');
INSERT INTO `sr_member_follow` VALUES ('895', '250', '253', '1465698197');
INSERT INTO `sr_member_follow` VALUES ('896', '251', '253', '1465698197');
INSERT INTO `sr_member_follow` VALUES ('897', '252', '253', '1465698197');
INSERT INTO `sr_member_follow` VALUES ('898', '253', '249', '1465698674');
INSERT INTO `sr_member_follow` VALUES ('899', '252', '249', '1465698685');
INSERT INTO `sr_member_follow` VALUES ('900', '251', '249', '1465698686');
INSERT INTO `sr_member_follow` VALUES ('901', '250', '249', '1465698686');
INSERT INTO `sr_member_follow` VALUES ('902', '238', '233', '1465723273');
INSERT INTO `sr_member_follow` VALUES ('903', '231', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('904', '233', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('905', '234', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('906', '238', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('907', '240', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('908', '249', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('909', '250', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('910', '251', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('911', '252', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('912', '253', '256', '1465788285');
INSERT INTO `sr_member_follow` VALUES ('913', '231', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('914', '233', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('915', '234', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('916', '238', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('917', '240', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('918', '249', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('919', '250', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('920', '251', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('921', '252', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('922', '253', '257', '1465871038');
INSERT INTO `sr_member_follow` VALUES ('923', '257', '252', '1465892749');
INSERT INTO `sr_member_follow` VALUES ('924', '256', '252', '1465892751');
INSERT INTO `sr_member_follow` VALUES ('925', '253', '252', '1465892752');
INSERT INTO `sr_member_follow` VALUES ('926', '231', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('927', '233', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('928', '234', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('929', '238', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('930', '240', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('931', '249', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('932', '250', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('933', '251', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('934', '252', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('935', '253', '258', '1465978270');
INSERT INTO `sr_member_follow` VALUES ('936', '231', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('937', '233', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('938', '234', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('939', '238', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('940', '240', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('941', '249', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('942', '250', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('943', '251', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('944', '252', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('945', '253', '259', '1465988181');
INSERT INTO `sr_member_follow` VALUES ('946', '231', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('947', '233', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('948', '234', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('949', '238', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('950', '240', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('951', '249', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('952', '250', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('953', '251', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('954', '252', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('955', '253', '260', '1465988537');
INSERT INTO `sr_member_follow` VALUES ('956', '231', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('957', '233', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('958', '234', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('959', '238', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('960', '240', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('961', '249', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('962', '250', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('963', '251', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('964', '252', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('965', '253', '261', '1465991132');
INSERT INTO `sr_member_follow` VALUES ('966', '231', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('967', '233', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('968', '234', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('969', '238', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('970', '240', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('971', '249', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('972', '250', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('973', '251', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('974', '252', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('975', '253', '262', '1465991401');
INSERT INTO `sr_member_follow` VALUES ('976', '231', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('977', '233', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('978', '234', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('979', '238', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('980', '240', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('981', '249', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('982', '250', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('983', '251', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('984', '252', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('985', '253', '263', '1465991551');
INSERT INTO `sr_member_follow` VALUES ('986', '231', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('987', '233', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('988', '234', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('989', '238', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('990', '240', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('991', '249', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('992', '250', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('993', '251', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('994', '252', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('995', '253', '264', '1465991663');
INSERT INTO `sr_member_follow` VALUES ('996', '231', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('997', '233', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('998', '234', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('999', '238', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('1000', '240', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('1001', '249', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('1002', '250', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('1003', '251', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('1004', '252', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('1005', '253', '265', '1465999261');
INSERT INTO `sr_member_follow` VALUES ('1006', '231', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1007', '233', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1008', '234', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1009', '238', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1010', '240', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1011', '249', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1012', '250', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1013', '251', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1014', '252', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1015', '253', '266', '1466227632');
INSERT INTO `sr_member_follow` VALUES ('1016', '231', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1017', '233', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1018', '234', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1019', '238', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1020', '240', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1021', '249', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1022', '250', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1023', '251', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1024', '252', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1025', '253', '267', '1466227824');
INSERT INTO `sr_member_follow` VALUES ('1026', '258', '249', '1466418639');
INSERT INTO `sr_member_follow` VALUES ('1027', '257', '249', '1466430163');
INSERT INTO `sr_member_follow` VALUES ('1028', '256', '249', '1466430164');
INSERT INTO `sr_member_follow` VALUES ('1029', '266', '249', '1466430170');
INSERT INTO `sr_member_follow` VALUES ('1030', '265', '249', '1466430171');
INSERT INTO `sr_member_follow` VALUES ('1031', '267', '249', '1466430172');
INSERT INTO `sr_member_follow` VALUES ('1032', '231', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1033', '233', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1034', '234', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1035', '238', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1036', '240', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1037', '249', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1038', '250', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1039', '251', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1040', '252', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1041', '253', '268', '1466470107');
INSERT INTO `sr_member_follow` VALUES ('1042', '268', '249', '1466503553');
INSERT INTO `sr_member_follow` VALUES ('1043', '231', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1044', '233', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1045', '234', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1046', '238', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1047', '240', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1048', '249', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1049', '250', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1050', '251', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1051', '252', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1052', '253', '269', '1466651494');
INSERT INTO `sr_member_follow` VALUES ('1053', '269', '253', '1466653448');
INSERT INTO `sr_member_follow` VALUES ('1054', '257', '238', '1466683060');
INSERT INTO `sr_member_follow` VALUES ('1055', '253', '238', '1466739403');
INSERT INTO `sr_member_follow` VALUES ('1056', '269', '234', '1467010172');
INSERT INTO `sr_member_follow` VALUES ('1057', '231', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1058', '233', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1059', '234', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1060', '238', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1061', '240', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1062', '249', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1063', '250', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1064', '251', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1065', '252', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1066', '253', '270', '1467037090');
INSERT INTO `sr_member_follow` VALUES ('1067', '231', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1068', '233', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1069', '234', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1070', '238', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1071', '240', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1072', '249', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1073', '250', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1074', '251', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1075', '252', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1076', '253', '271', '1467179245');
INSERT INTO `sr_member_follow` VALUES ('1077', '231', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1078', '233', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1079', '234', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1080', '238', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1081', '240', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1082', '249', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1083', '250', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1084', '251', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1085', '252', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1086', '253', '272', '1467183726');
INSERT INTO `sr_member_follow` VALUES ('1087', '231', '273', '1467271414');
INSERT INTO `sr_member_follow` VALUES ('1088', '233', '273', '1467271414');
INSERT INTO `sr_member_follow` VALUES ('1089', '234', '273', '1467271414');
INSERT INTO `sr_member_follow` VALUES ('1090', '238', '273', '1467271414');
INSERT INTO `sr_member_follow` VALUES ('1091', '240', '273', '1467271414');
INSERT INTO `sr_member_follow` VALUES ('1092', '249', '273', '1467271414');
INSERT INTO `sr_member_follow` VALUES ('1093', '250', '273', '1467271414');
INSERT INTO `sr_member_follow` VALUES ('1094', '251', '273', '1467271414');
INSERT INTO `sr_member_follow` VALUES ('1095', '252', '273', '1467271414');
INSERT INTO `sr_member_follow` VALUES ('1096', '253', '273', '1467271414');

-- ----------------------------
-- Table structure for sr_member_lable
-- ----------------------------
DROP TABLE IF EXISTS `sr_member_lable`;
CREATE TABLE `sr_member_lable` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `lable_id` text COMMENT '标签id,用英文逗号分隔'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='用户标签关系表';

-- ----------------------------
-- Records of sr_member_lable
-- ----------------------------
INSERT INTO `sr_member_lable` VALUES ('230', null);
INSERT INTO `sr_member_lable` VALUES ('231', '283,');
INSERT INTO `sr_member_lable` VALUES ('232', null);
INSERT INTO `sr_member_lable` VALUES ('233', '282,');
INSERT INTO `sr_member_lable` VALUES ('234', null);
INSERT INTO `sr_member_lable` VALUES ('235', null);
INSERT INTO `sr_member_lable` VALUES ('236', null);
INSERT INTO `sr_member_lable` VALUES ('237', null);
INSERT INTO `sr_member_lable` VALUES ('238', '301,279,280,281,');
INSERT INTO `sr_member_lable` VALUES ('239', null);
INSERT INTO `sr_member_lable` VALUES ('240', null);
INSERT INTO `sr_member_lable` VALUES ('241', null);
INSERT INTO `sr_member_lable` VALUES ('242', null);
INSERT INTO `sr_member_lable` VALUES ('243', null);
INSERT INTO `sr_member_lable` VALUES ('244', null);
INSERT INTO `sr_member_lable` VALUES ('245', null);
INSERT INTO `sr_member_lable` VALUES ('246', null);
INSERT INTO `sr_member_lable` VALUES ('247', null);
INSERT INTO `sr_member_lable` VALUES ('248', null);
INSERT INTO `sr_member_lable` VALUES ('249', '289,');
INSERT INTO `sr_member_lable` VALUES ('250', null);
INSERT INTO `sr_member_lable` VALUES ('251', null);
INSERT INTO `sr_member_lable` VALUES ('252', null);
INSERT INTO `sr_member_lable` VALUES ('253', null);
INSERT INTO `sr_member_lable` VALUES ('256', null);
INSERT INTO `sr_member_lable` VALUES ('257', null);
INSERT INTO `sr_member_lable` VALUES ('258', null);
INSERT INTO `sr_member_lable` VALUES ('259', null);
INSERT INTO `sr_member_lable` VALUES ('260', null);
INSERT INTO `sr_member_lable` VALUES ('261', null);
INSERT INTO `sr_member_lable` VALUES ('262', null);
INSERT INTO `sr_member_lable` VALUES ('263', null);
INSERT INTO `sr_member_lable` VALUES ('264', null);
INSERT INTO `sr_member_lable` VALUES ('265', null);
INSERT INTO `sr_member_lable` VALUES ('266', null);
INSERT INTO `sr_member_lable` VALUES ('267', null);
INSERT INTO `sr_member_lable` VALUES ('268', null);
INSERT INTO `sr_member_lable` VALUES ('269', null);
INSERT INTO `sr_member_lable` VALUES ('270', null);
INSERT INTO `sr_member_lable` VALUES ('271', null);
INSERT INTO `sr_member_lable` VALUES ('272', null);
INSERT INTO `sr_member_lable` VALUES ('273', '302,');

-- ----------------------------
-- Table structure for sr_member_role
-- ----------------------------
DROP TABLE IF EXISTS `sr_member_role`;
CREATE TABLE `sr_member_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '组名',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `rules` text COMMENT '后台菜单id，多个用英文逗号分隔',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：分组管理；0：权限管理',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0没删；1删除',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用  0 ：没有　１；　禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台操作权限规则表';

-- ----------------------------
-- Records of sr_member_role
-- ----------------------------
INSERT INTO `sr_member_role` VALUES ('1', '管理员', '管理员', '1,2', '1', '1463493998', '0', '0', '0');

-- ----------------------------
-- Table structure for sr_member_specia
-- ----------------------------
DROP TABLE IF EXISTS `sr_member_specia`;
CREATE TABLE `sr_member_specia` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `specia_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题id',
  `specia_feed_count` int(11) NOT NULL DEFAULT '0' COMMENT '发表文章数',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='用户专题详情表';

-- ----------------------------
-- Records of sr_member_specia
-- ----------------------------
INSERT INTO `sr_member_specia` VALUES ('211', '0', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('211', '0', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('80', '11', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('238', '11', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('238', '2', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('233', '1', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('231', '46', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('211', '0', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('211', '0', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('254', '0', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('249', '46', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('238', '1', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('253', '1', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('250', '1', '1', '0', '0');
INSERT INTO `sr_member_specia` VALUES ('273', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for sr_menu
-- ----------------------------
DROP TABLE IF EXISTS `sr_menu`;
CREATE TABLE `sr_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `path` varchar(30) NOT NULL DEFAULT '-0-',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '菜单等级',
  `groups` varchar(50) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '路径',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `log_title` varchar(255) NOT NULL DEFAULT '' COMMENT '显示在操作日志中的标题',
  `class` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单、按钮的class',
  `display_position` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '显示位置，1头部显示，2列表显示，3都显示',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `path` (`path`) USING BTREE,
  KEY `level` (`level`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8 COMMENT='后台管理菜单';

-- ----------------------------
-- Records of sr_menu
-- ----------------------------
INSERT INTO `sr_menu` VALUES ('1', '0', '-0-', '0', '', '系统设置', '', '', '', '', '3', '99', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('2', '1', '-0-1-', '1', '系统设置', '菜单管理', 'Backend/Base/Menu/index', '', '', '', '3', '99', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('3', '2', '-0-1-2-', '2', '', '添加', 'Backend/Base/Menu/add', '', '', 'btn btn-primary btn-xs', '1', '99', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('4', '2', '-0-1-2-', '2', '', '修改', 'Backend/Base/Menu/edit', '', '', 'btn btn-success btn-xs', '2', '90', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('5', '2', '-0-1-2-', '2', '', '启用', 'Backend/Base/Menu/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '96', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('6', '2', '-0-1-2-', '2', '', '禁用', 'Backend/Base/Menu/disable', '', '', 'btn btn-warning btn-xs ajax-get ', '3', '95', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('7', '2', '-0-1-2-', '2', '', '删除', 'Backend/Base/Menu/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '80', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('38', '1', '-0-1-', '1', '链接管理', '头部导航', 'Backend/Navigation/Index/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('39', '38', '-0-1-38-', '2', '', '添加', 'Backend/Navigation/Index/add', '', '', 'btn btn-primary btn-xs', '1', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('40', '38', '-0-1-38-', '2', '', '修改', 'Backend/Navigation/Index/edit', '', '', 'btn btn-success btn-xs', '2', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('41', '38', '-0-1-38-', '2', '', '启用', 'Backend/Navigation/Index/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('42', '38', '-0-1-38-', '2', '', '禁用', 'Backend/Navigation/Index/disable', '', '', 'btn btn-warning btn-xs ajax-get ', '3', '9', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('43', '38', '-0-1-38-', '2', '', '删除', 'Backend/Navigation/Index/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('51', '1', '-0-1-', '1', '链接管理', '底部导航', 'Backend/Navigation/Bottom/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('52', '51', '-0-1-51-', '2', '', '添加', 'Backend/Navigation/Bottom/add', '', '', 'btn btn-primary btn-xs', '1', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('53', '51', '-0-1-51-', '2', '', '修改', 'Backend/Navigation/Bottom/edit', '', '', 'btn btn-success btn-xs', '2', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('54', '51', '-0-1-51-', '2', '', '启用', 'Backend/Navigation/Bottom/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('55', '51', '-0-1-51-', '2', '', '禁用', 'Backend/Navigation/Bottom/disable', '', '', 'btn btn-warning btn-xs ajax-get ', '3', '9', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('56', '51', '-0-1-51-', '2', '', '删除', 'Backend/Navigation/Bottom/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('75', '1', '-0-1-', '1', '链接管理', '友情链接', 'Backend/Navigation/Friendlink/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('76', '75', '-0-1-75-', '2', '', '文字链接添加', 'Backend/Navigation/Friendlink/we_add', '', '', 'btn btn-primary btn-xs', '1', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('77', '75', '-0-1-75-', '2', '', '修改', 'Backend/Navigation/Friendlink/edit', '', '', 'btn btn-success btn-xs', '2', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('78', '75', '-0-1-75-', '2', '', '启用', 'Backend/Navigation/Friendlink/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('79', '75', '-0-1-75-', '2', '', '禁用', 'Backend/Navigation/Friendlink/disable', '', '', 'btn btn-warning btn-xs ajax-get ', '3', '10', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('80', '75', '-0-1-75-', '2', '', '删除', 'Backend/Navigation/Friendlink/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('116', '1', '-0-1-', '1', '管理员管理', '管理员列表', 'Backend/Base/Member/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('117', '116', '-0-1-116-', '2', '', '添加', 'Backend/Base/Member/add', '', '', 'btn btn-primary btn-xs', '1', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('118', '116', '-0-1-116-', '2', '', '修改', 'Backend/Base/Member/edit', '', '', 'btn btn-success btn-xs', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('119', '116', '-0-1-116-', '2', '', '启用', 'Backend/Base/Member/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('120', '116', '-0-1-116-', '2', '', '禁用', 'Backend/Base/Member/disable', '', '', 'btn btn-warning btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('121', '116', '-0-1-116-', '2', '', '删除', 'Backend/Base/Member/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('122', '116', '-0-1-116-', '2', '', '访问授权', 'Backend/Base/Member/access', '', '', 'btn btn-xs btn-bitbucket', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('123', '1', '-0-1-', '1', '管理员管理', '权限管理', 'Backend/Base/Group/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('124', '123', '-0-1-123-', '2', '', '添加', 'Backend/Base/Group/add', '', '', 'btn btn-primary btn-xs', '1', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('125', '123', '-0-1-123-', '2', '', '修改', 'Backend/Base/Group/edit', '', '', 'btn btn-success btn-xs', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('126', '123', '-0-1-123-', '2', '', '启用', 'Backend/Base/Group/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('127', '123', '-0-1-123-', '2', '', '禁用', 'Backend/Base/Group/disable', '', '', 'btn btn-warning btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('128', '123', '-0-1-123-', '2', '', '删除', 'Backend/Base/Group/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('129', '123', '-0-1-123-', '2', '', '访问授权', 'Backend/Base/Group/access', '', '', 'btn btn-xs btn-bitbucket', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('130', '1', '-0-1-', '1', '管理员管理', '操作日志', 'Backend/Base/ActionLog/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('131', '130', '-0-1-130-', '2', '', '删除', 'Backend/Base/ActionLog/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('163', '1', '-0-1-', '1', '系统设置', '配置管理', 'Backend/Base/Config/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('164', '1', '-0-1-', '1', '系统设置', '站点设置', 'Backend/Base/Set/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('165', '163', '-0-1-163-', '2', '', '添加', 'Backend/Base/Config/add', '', '', 'btn btn-primary btn-xs', '1', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('166', '163', '-0-1-163-', '2', '', '修改', 'Backend/Base/Config/edit', '', '', 'btn btn-success btn-xs', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('167', '163', '-0-1-163-', '2', '', '启用', 'Backend/Base/Config/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('168', '163', '-0-1-163-', '2', '', '禁用', 'Backend/Base/Config/disable', '', '', 'btn btn-warning btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('169', '163', '-0-1-163-', '2', '', '删除', 'Backend/Base/Config/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('200', '1', '-0-1-', '1', '系统设置', 'SEO配置', 'Backend/Base/SeoPage/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('201', '200', '-0-1-200-', '2', '', '启用', 'Backend/Base/SeoPage/enable', '', '', 'btn btn-warning btn-xs ajax-get  ', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('202', '200', '-0-1-200-', '2', '', '禁用', 'Backend/Base/SeoPage/disable', '', '', 'btn btn-info btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('203', '200', '-0-1-200-', '2', '', '修改', 'Backend/Base/SeoPage/edit', '', '', 'btn btn-success btn-xs', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('204', '200', '-0-1-200-', '2', '', '删除', 'Backend/Base/SeoPage/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('205', '200', '-0-1-200-', '2', '', '添加', 'Backend/Base/SeoPage/add', '', '', 'btn btn-primary btn-xs', '1', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('209', '1', '-0-1-', '1', '系统设置', '搜索关键词', 'Backend/Base/SearchKeywords/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('210', '209', '-0-1-209-', '2', '', '添加', 'Backend/Base/SearchKeywords/add', '', '', 'btn btn-primary btn-xs', '1', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('211', '209', '-0-1-209-', '2', '', '删除', 'Backend/Base/SearchKeywords/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('212', '209', '-0-1-209-', '2', '', '修改', 'Backend/Base/SearchKeywords/edit', '', '', 'btn btn-success btn-xs', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('213', '1', '-0-1-', '1', '系统设置', '数据库', 'Backend/Base/Db/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('214', '213', '-0-1-213-', '2', '', '结构', 'Backend/Base/Db/structure', '', '', 'btn btn-primary btn-xs', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('215', '213', '-0-1-213-', '2', '', '数据', 'Backend/Base/Db/data_list', '', '', 'btn btn-info btn-xs', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('216', '1', '-0-1-', '1', '系统设置', '缓存/日志', 'Backend/Base/File/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('217', '216', '-0-1-216-', '2', '', '删除', 'Backend/Base/File/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('218', '0', '-0-', '0', '', '用户管理', '', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('219', '218', '-0-218-', '1', '用户管理', '用户信息', 'Backend/Usermanage/Index/index', '', '', '', '3', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('220', '219', '-0-218-219-', '2', '', '删除', 'Backend/Usermanage/Index/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('223', '219', '-0-218-219-', '2', '', '查看', 'Backend/Usermanage/Index/see', '', '', 'btn btn-primary btn-xs', '2', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('228', '219', '-0-218-219-', '2', '', '添加用户', 'Backend/Usermanage/Index/add', '', '', 'btn btn-primary btn-xs', '1', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('229', '219', '-0-218-219-', '2', '', '启用', 'Backend/Usermanage/Index/enable', '', '', 'btn btn-info btn-xs ajax-get', '2', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('230', '219', '-0-218-219-', '2', '', '禁用', 'Backend/Usermanage/Index/disable', '', '', 'btn btn-warning btn-xs ajax-get', '2', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('231', '0', '-0-', '0', '', '分类标签管理', '', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('232', '231', '-0-231-', '1', '分类标签管理', '标签管理', 'Backend/Catelabel/Label/index', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('233', '232', '-0-231-232-', '2', '', '禁用', 'Backend/Catelabel/Label/disable', '', '', 'btn btn-warning btn-xs ajax-get', '3', '5', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('234', '232', '-0-231-232-', '2', '', '启用', 'Backend/Catelabel/Label/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '4', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('235', '232', '-0-231-232-', '2', '', '修改', 'Backend/Catelabel/Label/edit', '', '', 'btn btn-success btn-xs', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('236', '232', '-0-231-232-', '2', '', '删除', 'Backend/Catelabel/Label/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('238', '231', '-0-231-', '1', '分类标签管理', '敏感词管理', 'Backend/Catelabel/Cate/index', '', '', '', '3', '0', '1', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('239', '0', '-0-', '0', '', '文章专题管理', '', '', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('240', '238', '-0-231-238-', '2', '', '禁用', 'Backend/Catelabel/Cate/disable', '', '', 'btn btn-warning btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('241', '238', '-0-231-238-', '2', '', '启用', 'Backend/Catelabel/Cate/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('242', '238', '-0-231-238-', '2', '', '修改', 'Backend/Catelabel/Cate/edit', '', '', 'btn btn-success btn-xs', '2', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('243', '238', '-0-231-238-', '2', '', '删除', 'Backend/Catelabel/Cate/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('244', '232', '-0-231-232-', '2', '', '添加标签', 'Backend/Catelabel/Label/add', '', '', 'btn btn-primary btn-xs', '1', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('245', '238', '-0-231-238-', '2', '', '添加敏感词', 'Backend/Catelabel/Cate/add', '', '', 'btn btn-primary btn-xs', '1', '4', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('246', '239', '-0-239-', '1', '文章专题管理', '文章管理', 'Backend/Article/Index/index', '', '', '', '3', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('248', '246', '-0-239-246-', '2', '', '禁用', 'Backend/Article/Index/disable', '', '', 'btn btn-warning btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('249', '246', '-0-239-246-', '2', '', '启用', 'Backend/Article/Index/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('250', '246', '-0-239-246-', '2', '', '删除', 'Backend/Article/Index/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('252', '219', '-0-218-219-', '2', '', '推荐', 'Backend/Usermanage/Index/is_recommend/recommend/1', '头部ajax使用', '', 'btn btn-info btn-xs ajax-get ', '1', '4', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('253', '219', '-0-218-219-', '2', '', '取消推荐', 'Backend/Usermanage/Index/is_recommend/recommend/0', '', '', 'btn btn-warning btn-xs ajax-get', '1', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('254', '232', '-0-231-232-', '2', '', '推荐标签', 'Backend/Catelabel/Label/is_recommend/recommend/1', '', '', 'btn btn-info btn-xs ajax-get', '1', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('255', '232', '-0-231-232-', '2', '', '取消推荐', 'Backend/Catelabel/Label/is_recommend/recommend/0', '', '', 'btn btn-primary btn-xs ajax-get', '1', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('256', '239', '-0-239-', '1', '文章专题管理', '评论管理', 'Backend/Article/Comment/index', '', '', '', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('257', '256', '-0-239-256-', '2', '', '删除', 'Backend/Article/Comment/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('258', '256', '-0-239-256-', '2', '', '通过审核', 'Backend/Article/Comment/is_audit/audit/1', '', '', 'btn btn-primary btn-xs ajax-get', '1', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('259', '256', '-0-239-256-', '2', '', '取消审核', 'Backend/Article/Comment/is_audit/audit/0', '', '', 'btn btn-warning btn-xs ajax-get', '1', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('260', '239', '-0-239-', '1', '文章专题管理', '举报管理', 'Backend/Article/Report/index', '', '', '', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('261', '260', '-0-239-260-', '2', '', '删除', 'Backend/Article/Report/deldata', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('262', '260', '-0-239-260-', '2', '', '禁用文章', 'backend/Article/Report/setstatus/status/2', '', '', 'btn btn-warning btn-xs ajax-post', '1', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('263', '260', '-0-239-260-', '2', '', '启用文章', 'backend/Article/Report/setstatus/status/1', '', '', 'btn btn-primary  btn-xs ajax-post', '1', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('265', '219', '-0-218-219-', '2', '', '移动用户组', '', '', '', 'btn btn-success  role btn-xs', '3', '5', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('266', '239', '-0-239-', '1', '文章专题管理', '专题管理', 'Backend/Article/Special/index', '', '', '', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('267', '266', '-0-239-266-', '2', '', '删除', 'Backend/Article/Special/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('268', '266', '-0-239-266-', '2', '', '禁用', 'Backend/Article/Special/disable', '', '', 'btn btn-warning btn-xs ajax-post', '3', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('269', '266', '-0-239-266-', '2', '', '启用', 'Backend/Article/Special/enable', '', '', 'btn btn-info btn-xs ajax-post', '3', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('270', '266', '-0-239-266-', '2', '', '添加专题', 'Backend/Article/Special/add', '', '', 'btn btn-primary btn-xs', '1', '4', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('271', '266', '-0-239-266-', '2', '', '修改专题', 'Backend/Article/Special/edit', '', '', 'btn btn-success  btn-xs', '2', '5', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('272', '218', '-0-218-', '1', '用户管理', '分组管理', 'Backend/Usermanage/Group/index', '', '', '', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('273', '272', '-0-218-272-', '2', '', '删除', 'Backend/Usermanage/Group/del', '', '', 'btn btn-danger btn-xs ajax-get confirm', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('274', '272', '-0-218-272-', '2', '', '添加分组', 'Backend/Usermanage/Group/add', '', '', 'btn btn-primary btn-xs', '1', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('275', '272', '-0-218-272-', '2', '', '修改', 'Backend/Usermanage/Group/edit', '', '', 'btn btn-success  btn-xs', '2', '5', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('277', '266', '-0-239-266-', '2', '', '查看', 'Backend/Article/Special/see', '', '', 'btn btn-info btn-xs', '2', '8', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('280', '272', '-0-218-272-', '2', '', '禁用', 'Backend/Usermanage/Group/disable', '', '', 'btn btn-warning btn-xs ajax-post', '3', '55', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('281', '272', '-0-218-272-', '2', '', '启用', 'Backend/Usermanage/Group/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '54', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('282', '219', '-0-218-219-', '2', '', '推荐', 'Backend/Usermanage/Index/is_recommend/recommend/1', '', '', 'btn btn-info btn-xs ajax-post is_recommend', '2', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('283', '232', '-0-231-232-', '2', '', '推荐标签', 'Backend/Catelabel/Label/is_recommend/recommend/1', '中部使用，js把两个按钮合在一起', '', 'btn btn-info btn-xs ajax-get is_recommend', '2', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('284', '256', '-0-239-256-', '2', '', '通过审核', 'Backend/Article/Comment/is_audit/audit/1', '中部使用，利用js把2个按钮合在一起', '', 'btn btn-primary btn-xs ajax-get is_audit', '2', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('287', '0', '-0-', '0', '', '帮助中心', '', 'PC端设置帮助问题和答案，意见反馈', '', '', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('288', '287', '-0-287-', '1', '帮助中心', '帮助问答', 'Backend/Help/Faq/index', '', '', '', '3', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('289', '288', '-0-287-288-', '2', '', '删除', 'Backend/Help/Faq/del', '', '', 'btn btn-danger  btn-xs ajax-get', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('290', '288', '-0-287-288-', '2', '', '启用', 'Backend/Help/Faq/enable', '', '', 'btn btn-info btn-xs ajax-get', '3', '3', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('291', '288', '-0-287-288-', '2', '', '禁用', 'Backend/Help/Faq/disable', '', '', 'btn btn-warning btn-xs ajax-get', '3', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('292', '288', '-0-287-288-', '2', '', '添加问答', 'Backend/Help/Faq/add', '', '', 'btn btn-primary  btn-xs', '1', '4', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('293', '288', '-0-287-288-', '2', '', '修改问答', 'Backend/Help/Faq/edit', '', '', 'btn btn-success btn-xs ', '2', '5', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('294', '287', '-0-287-', '1', '帮助中心', '意见反馈', 'Backend/Help/Feedback/index', '', '', '', '3', '2', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('295', '294', '-0-287-294-', '2', '', '删除', 'Backend/Help/Feedback/del', '', '', 'btn btn-danger  btn-xs ajax-get', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('297', '239', '-0-239-', '1', '文章专题管理', '轮播管理', 'Backend/Article/Carousel/index', '', '', '', '3', '1', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('298', '297', '-0-239-297-', '2', '', '添加', 'Backend/Article/Carousel/add', '', '', ' btn btn-primary btn-xs', '1', '9', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('299', '297', '-0-239-297-', '2', '', '禁用', 'Backend/Article/Carousel/able/hid/1', '', '', 'btn btn-warning btn-xs ajax-get', '1', '8', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('300', '297', '-0-239-297-', '2', '', '启用', 'Backend/Article/Carousel/able/hid/0', '', '', 'btn btn-info btn-xs ajax-get', '1', '7', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('301', '297', '-0-239-297-', '2', '', '删除', 'Backend/Article/Carousel/deldata', '', '', 'btn btn-danger btn-xs ajax-get', '3', '0', '0', '0', '0', '0');
INSERT INTO `sr_menu` VALUES ('302', '297', '-0-239-297-', '2', '', '修改', 'Backend/Article/Carousel/edit', '', '', 'btn btn-success btn-xs', '2', '3', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sr_message
-- ----------------------------
DROP TABLE IF EXISTS `sr_message`;
CREATE TABLE `sr_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `title` varchar(50) NOT NULL,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送用户ID',
  `content` text COMMENT '消息内容',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' 1：发送给前台所有用户 2：发送给普通用户  		3：发送给商家 0：发送给个人，可以包含后台用户',
  `is_to_home` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:后台发送给前台 2：前台用户给后台',
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='消息存储表';

-- ----------------------------
-- Records of sr_message
-- ----------------------------
INSERT INTO `sr_message` VALUES ('96', '关于今明两天下雨通知', '1', '<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost/zzy/code/Public/Plugins/ueditor/dialogs/attachment/fileTypeImages/icon_txt.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/zzy/code/Uploads/UserFile/File/1/20160406/5704717947e6c.txt\" title=\"密码.txt\">密码.txt</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost/zzy/code/Public/Plugins/ueditor/dialogs/attachment/fileTypeImages/icon_xls.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/zzy/code/Uploads/UserFile/File/1/20160406/570471794d26a.xls\" title=\"企业邮箱发放.xls\">企业邮箱发放.xls</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost/zzy/code/Public/Plugins/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/zzy/code/Uploads/UserFile/File/1/20160406/5704717953dda.zip\" title=\"二维码g.zip\">二维码g.zip</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost/zzy/code/Public/Plugins/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/zzy/code/Uploads/UserFile/File/1/20160406/570471795d443.png\" title=\"站内信.png\">站内信.png</a></p><p><br/></p>', '0', '0', '1459908987', '0', '1', '0');
INSERT INTO `sr_message` VALUES ('97', '回复：关于今明两天下雨通知', '1', '<p>好的这个事情我知道了</p>', '0', '0', '1459909201', '0', '1', '96');
INSERT INTO `sr_message` VALUES ('98', '回复：关于今明两天下雨通知', '1', '<p>这些信息都是用的</p>', '0', '0', '1459910153', '0', '1', '96');
INSERT INTO `sr_message` VALUES ('99', '回复：关于今明两天下雨通知', '1', '<p>就是这样的吊打</p>', '0', '0', '1459911058', '0', '1', '96');
INSERT INTO `sr_message` VALUES ('100', '我们都是这些测试的交流', '51', '<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://test.cnsunrun.com/zzypt/Public/Plugins/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/zzypt/Uploads/UserFile/File//20160413/570df0bd84683.jpg\" title=\"Desert.jpg\">Desert.jpg</a></p><p><br/></p>', '0', '0', '1460531395', '0', '2', '0');
INSERT INTO `sr_message` VALUES ('101', '用户的调整信息任务的价值观以及新年', '84', '<p>原标题：习近平举行仪式欢迎尼日利亚总统访华</p><p>　　央视网消息(新闻联播)：国家主席习近平12日下午在人民大会堂东门外广场举行仪式，欢迎尼日利亚联邦共和国总统穆罕马杜·布哈里对我国进行国事访问。</p><p>　　全国人大常委会副委员长陈昌智、国务委员杨洁篪、全国政协副主席罗富和等出席欢迎仪式。</p><p>　　陪同布哈里访华的有外交部长等。</p><p>　　军乐团奏尼中两国国歌。</p><p>　　鸣礼炮21响。</p><p>　　布哈里在习近平陪同下检阅中国人民解放军三军仪仗队。</p><p>　　两国元首回到检阅台观看仪仗队分列式。</p><p>　　随后，军乐团进行行进吹奏表演。</p><p>　　布哈里是应习近平的邀请对我国进行国事访问的。</p><p>　　原标题：习近平同尼日利亚总统举行会谈 两国元首决定共同推动中尼战略伙伴关系迈上</p><p><br/></p>', '0', '0', '1460531458', '0', '2', '0');
INSERT INTO `sr_message` VALUES ('102', '我们都是这些测试的交流', '51', '<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://test.cnsunrun.com/zzypt/Public/Plugins/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/zzypt/Uploads/UserFile/File//20160413/570df0bd84683.jpg\" title=\"Desert.jpg\">Desert.jpg</a></p><p><br/></p>', '0', '0', '1460531476', '0', '2', '0');
INSERT INTO `sr_message` VALUES ('103', '11111', '92', '<p>11111111</p>', '0', '1', '1460531946', '0', '2', '0');
INSERT INTO `sr_message` VALUES ('104', '1111111111111', '92', '<p>111111111111</p>', '0', '0', '1460532229', '0', '2', '0');
INSERT INTO `sr_message` VALUES ('105', '测试', '84', '<p>测试<br/></p>', '0', '0', '1460532315', '0', '2', '0');
INSERT INTO `sr_message` VALUES ('106', '测试', '84', '<p>测试<br/></p>', '0', '0', '1460532395', '0', '2', '0');
INSERT INTO `sr_message` VALUES ('107', '用户:133****0432发送私信', '84', '<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊AAAAAAAAAAAA<br/></p>', '0', '0', '1460537443', '0', '2', '0');
INSERT INTO `sr_message` VALUES ('108', '123', '1', '<p>123</p>', '0', '0', '1460543110', '2', '1', '0');
INSERT INTO `sr_message` VALUES ('109', '123', '1', '<p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; box-sizing: border-box; padding: 8px 0px; list-style: none; color: rgb(34, 34, 34); font-family: Arial, Lucida, Verdana, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; line-height: 28px;\">　　<span style=\"box-sizing: border-box; font-weight: 700;\">必要时组合jQuery和javascript原生代码</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; box-sizing: border-box; padding: 8px 0px; list-style: none; color: rgb(34, 34, 34); font-family: Arial, Lucida, Verdana, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; line-height: 28px;\">　　如上所述，jQuery就是javascript，这意味着用jQuery能做的事情，同样可以用原生代码来做。原生代码（或vanilla）的可读性和可维护性可能不如jQuery，而且代码更长。但也意味着更高效（通常更接近底层代码可读性越差，性能越高，例如：汇编，当然需要更强大的人才可以）。牢记没有任何框架能比原生代码更小，更轻，更高效（注：测试链接已失效，可上网搜索测试代码）。鉴于vanilla 和 jQuery之间的性能差异，我强烈建议吸收两人的精华，使用（可能的话）和jQuery等价的原生代码。</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; box-sizing: border-box; padding: 8px 0px; list-style: none; color: rgb(34, 34, 34); font-family: Arial, Lucida, Verdana, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; line-height: 28px;\">　　<span style=\"box-sizing: border-box; font-weight: 700;\">最后忠告</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; box-sizing: border-box; padding: 8px 0px; list-style: none; color: rgb(34, 34, 34); font-family: Arial, Lucida, Verdana, 微软雅黑, 宋体, Helvetica, sans-serif; font-size: 14px; line-height: 28px;\">　　最后，我记录这篇文章的目的是提高jQuery的性能和其他一些好的建议。如果你想深入的研究对这个话题你会发现很多乐趣。记住，jQuery并非不可或缺，仅是一种选择。思考为什么要使用它。DOM操作？ajax？模版？css动画？还是选择符引擎？或许javascript微型框架或jQuery的定制版是更好的选择。</p><p><br/></p>', '0', '0', '1460543143', '1', '1', '0');

-- ----------------------------
-- Table structure for sr_msg_status
-- ----------------------------
DROP TABLE IF EXISTS `sr_msg_status`;
CREATE TABLE `sr_msg_status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '消息ID',
  `to_member_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '收信用户ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '阅读状态:0未读,1已读,',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息状态表';

-- ----------------------------
-- Records of sr_msg_status
-- ----------------------------

-- ----------------------------
-- Table structure for sr_navigation
-- ----------------------------
DROP TABLE IF EXISTS `sr_navigation`;
CREATE TABLE `sr_navigation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `path` varchar(30) NOT NULL DEFAULT '-0-',
  `member_id` tinyint(2) DEFAULT NULL COMMENT '添加/修改人ID',
  `level` int(11) unsigned NOT NULL DEFAULT '1',
  `type` varchar(15) NOT NULL DEFAULT 'top' COMMENT 'top,bottom',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `target` varchar(10) NOT NULL DEFAULT '_self' COMMENT '_self,_blank',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT 'URL',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of sr_navigation
-- ----------------------------
INSERT INTO `sr_navigation` VALUES ('1', '0', '-0-', null, '0', 'top', '首页', '_self', '/', '0', '4294967295', '0', '1');
INSERT INTO `sr_navigation` VALUES ('2', '0', '-0-', '1', '0', 'top', '新闻资讯', '_blank', 'Home/News/index', '0', '1458192819', '0', '0');
INSERT INTO `sr_navigation` VALUES ('3', '0', '-0-', '1', '0', 'bottom', '新手指导', '_blank', '', '0', '1458194119', '0', '0');
INSERT INTO `sr_navigation` VALUES ('4', '3', '-0-3-', '1', '1', 'bottom', '疑问中心', '_self', '', '0', '1458194217', '0', '0');
INSERT INTO `sr_navigation` VALUES ('5', '3', '-0-3-', '1', '1', 'bottom', '新人必看', '_self', '', '0', '1458194267', '0', '0');
INSERT INTO `sr_navigation` VALUES ('6', '0', '-0-', '1', '1', 'top', '测试数据', '_self', '', '0', '1458194539', '1', '0');
INSERT INTO `sr_navigation` VALUES ('7', '0', '-0-', '1', '1', 'top', '产品简介', '_self', '', '0', '1458194612', '1', '1');
INSERT INTO `sr_navigation` VALUES ('8', '0', '-0-', '1', '1', 'top', '新品预定', '_self', '', '0', '1458194649', '1', '0');
INSERT INTO `sr_navigation` VALUES ('9', '0', '-0-', '1', '1', 'top', '测试', '_self', '', '0', '1458555281', '1', '0');
INSERT INTO `sr_navigation` VALUES ('10', '3', '-0-3-', '1', '1', 'bottom', '测试问题', '_self', '', '0', '1458555383', '0', '0');
INSERT INTO `sr_navigation` VALUES ('11', '0', '-0-', '1', '0', 'bottom', '测试', '_blank', '', '9', '1458555407', '1', '0');
INSERT INTO `sr_navigation` VALUES ('12', '3', '-0-3-', '1', '1', 'bottom', '测试', '_self', '', '0', '1458555419', '0', '0');
INSERT INTO `sr_navigation` VALUES ('13', '0', '-0-', '1', '1', 'top', '测试导航', '_self', '', '0', '1458561516', '0', '1');
INSERT INTO `sr_navigation` VALUES ('14', '0', '-0-', '1', '0', 'bottom', '测试导航', '_self', '', '0', '1458561535', '1', '0');
INSERT INTO `sr_navigation` VALUES ('15', '0', '-0-', '1', '1', 'top', '测试数据', '_self', '', '0', '1458561819', '0', '1');
INSERT INTO `sr_navigation` VALUES ('16', '0', '-0-', '1', '1', 'top', '测试数据2', '_self', '', '0', '1458561835', '0', '1');
INSERT INTO `sr_navigation` VALUES ('17', '0', '-0-', '1', '1', 'top', '测试数据3', '_self', '', '0', '1458561624', '0', '1');
INSERT INTO `sr_navigation` VALUES ('18', '0', '-0-', '1', '1', 'top', '测试数据', '_self', '', '0', '1458561972', '1', '0');
INSERT INTO `sr_navigation` VALUES ('19', '0', '-0-', '1', '1', 'top', '测试信息', '_self', '', '9', '1458565197', '1', '0');
INSERT INTO `sr_navigation` VALUES ('20', '0', '-0-', '1', '1', 'top', '测试信息', '_self', '', '0', '1458608078', '1', '0');
INSERT INTO `sr_navigation` VALUES ('21', '0', '-0-', '3', '1', 'top', '1', '_blank', '/Index/index', '1', '1458628546', '1', '0');
INSERT INTO `sr_navigation` VALUES ('22', '0', '-0-', '1', '1', 'top', '12', '_self', '', '0', '1458638691', '1', '1');
INSERT INTO `sr_navigation` VALUES ('23', '0', '-0-', '1', '1', 'top', '123', '_self', '', '0', '1458638720', '1', '0');
INSERT INTO `sr_navigation` VALUES ('24', '0', '-0-', '1', '1', 'top', '首页', '_self', 'Home/Index/index', '99999', '1458808853', '0', '0');
INSERT INTO `sr_navigation` VALUES ('25', '0', '-0-', '1', '1', 'top', '服务商库', '_self', 'Home/Shop/index', '9999', '1458808887', '0', '0');
INSERT INTO `sr_navigation` VALUES ('26', '0', '-0-', '1', '1', 'top', '秀吧', '_self', 'Home/Show/index', '999', '1458808921', '0', '0');
INSERT INTO `sr_navigation` VALUES ('27', '0', '-0-', '1', '1', 'top', '新闻资讯', '_self', '', '999', '1458808959', '1', '0');
INSERT INTO `sr_navigation` VALUES ('28', '0', '-0-', '1', '1', 'top', '帮助中心', '_self', 'Home/Help/index', '999', '1458809042', '0', '0');
INSERT INTO `sr_navigation` VALUES ('29', '3', '-0-3-', '2', '1', 'bottom', '帮助中心', '_self', '12', '12', '1458811268', '0', '0');
INSERT INTO `sr_navigation` VALUES ('30', '0', '-0-', '1', '0', 'bottom', '特色服务', '_self', '/Index/index', '999', '1458811295', '0', '0');
INSERT INTO `sr_navigation` VALUES ('31', '0', '-0-', '1', '0', 'bottom', '关于我们', '_self', '#', '99', '1458811349', '0', '0');
INSERT INTO `sr_navigation` VALUES ('32', '0', '-0-', '1', '0', 'bottom', '支付方式', '_self', '', '9', '1458811364', '0', '0');
INSERT INTO `sr_navigation` VALUES ('33', '29', '-0-29-', '1', '1', 'bottom', '新人入门', '_self', 'Home/Help/new', '0', '1459245764', '0', '0');
INSERT INTO `sr_navigation` VALUES ('34', '0', '-0-', '3', '1', 'top', '测试首页', '_self', 'Home/Index/index', '1', '1460094370', '0', '1');
INSERT INTO `sr_navigation` VALUES ('35', '0', '-0-', '3', '1', 'top', '测试首页', '_blank', 'Home/Index/index', '10', '1460094440', '1', '0');
INSERT INTO `sr_navigation` VALUES ('36', '0', '-0-', '3', '1', 'top', '测试标题', '_self', '/Index/index', '0', '1460098824', '1', '0');
INSERT INTO `sr_navigation` VALUES ('37', '3', '-0-3-', '2', '1', 'bottom', '雷达', '_self', '13', '1', '1460110066', '0', '1');

-- ----------------------------
-- Table structure for sr_notice_count
-- ----------------------------
DROP TABLE IF EXISTS `sr_notice_count`;
CREATE TABLE `sr_notice_count` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `other_message` mediumint(6) NOT NULL DEFAULT '0' COMMENT '用户的主页消息包括推荐,转载',
  `comment_message` mediumint(6) NOT NULL DEFAULT '0' COMMENT '评论的消息',
  `recommend_message` mediumint(6) NOT NULL DEFAULT '0' COMMENT '推荐的文章数量(可以不要)',
  `attention_message` mediumint(6) NOT NULL DEFAULT '0' COMMENT '关注消息',
  `like_message` mediumint(6) NOT NULL DEFAULT '0' COMMENT '喜欢数',
  KEY `atme` (`uid`,`other_message`) USING BTREE,
  KEY `comment` (`uid`,`comment_message`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知消息表';

-- ----------------------------
-- Records of sr_notice_count
-- ----------------------------
INSERT INTO `sr_notice_count` VALUES ('230', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('231', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('232', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('233', '1', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('234', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('235', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('236', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('237', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('238', '0', '0', '0', '0', '1');
INSERT INTO `sr_notice_count` VALUES ('239', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('240', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('241', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('242', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('243', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('244', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('245', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('246', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('247', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('248', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('249', '0', '2', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('250', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('251', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('252', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('253', '1', '0', '0', '0', '2');
INSERT INTO `sr_notice_count` VALUES ('256', '0', '0', '0', '2', '0');
INSERT INTO `sr_notice_count` VALUES ('257', '0', '0', '0', '3', '0');
INSERT INTO `sr_notice_count` VALUES ('258', '0', '0', '0', '1', '0');
INSERT INTO `sr_notice_count` VALUES ('259', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('260', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('261', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('262', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('263', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('264', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('265', '0', '0', '0', '1', '0');
INSERT INTO `sr_notice_count` VALUES ('266', '0', '0', '0', '1', '0');
INSERT INTO `sr_notice_count` VALUES ('267', '0', '0', '0', '1', '0');
INSERT INTO `sr_notice_count` VALUES ('268', '0', '0', '0', '1', '0');
INSERT INTO `sr_notice_count` VALUES ('269', '0', '0', '0', '2', '0');
INSERT INTO `sr_notice_count` VALUES ('270', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('271', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('272', '0', '0', '0', '0', '0');
INSERT INTO `sr_notice_count` VALUES ('273', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sr_purview
-- ----------------------------
DROP TABLE IF EXISTS `sr_purview`;
CREATE TABLE `sr_purview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '权限名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作链接(方法)',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除  0 ： 否 1 ：是',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用  0 ： 否 1 ： 是',
  PRIMARY KEY (`id`),
  KEY `rule` (`action`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台用户组操作功能表';

-- ----------------------------
-- Records of sr_purview
-- ----------------------------
INSERT INTO `sr_purview` VALUES ('1', '删除', 'operate_del_feed', '0', '0', '0');

-- ----------------------------
-- Table structure for sr_role
-- ----------------------------
DROP TABLE IF EXISTS `sr_role`;
CREATE TABLE `sr_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) NOT NULL DEFAULT '' COMMENT '组名',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `menu_ids` text COMMENT 'menu表ID，多个用英文逗号分隔',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '用户类型:1后台管理员,2前台用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户组权限信息表';

-- ----------------------------
-- Records of sr_role
-- ----------------------------
INSERT INTO `sr_role` VALUES ('1', '普通用户', '测试数据', null, '1458186033', '0', '0', '2');
INSERT INTO `sr_role` VALUES ('2', '商家用户', '测试数据1', null, '1458186048', '0', '0', '2');
INSERT INTO `sr_role` VALUES ('3', '用户一组', '测试', null, '1458220753', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('4', '商家用户', '测试数据', null, '1458302074', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('5', '超级管理员', '', '1,2,3,5,6,4,7,38,39,40,41,42,43,51,52,53,54,55,56,75,76,77,78,79,81,80,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,8,22,107,109,110,108,111,87,90,92,93,91,94,95,88,96,98,99,97,100,101,89,102,104,105,103,106,177,190,189,188,9,10,12,13,14,15,16,11,17,18,19,20,21,23,24,25,26,27,28,113,114,115,132,134,135,136,137,138,29,30,31,32,33,34,35,36,37,45,46,48,49,44,47,146,147,150,151,149,152,50,57,59,60,58,61,62,63,65,66,64,67,74,82,84,85,83,86,153,154,156,157,155,158,133,139,141,142,140,143,159,160,144,148,161,162', '0', '0', '0', '1');
INSERT INTO `sr_role` VALUES ('6', '用户组一', '', null, '1458616516', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('7', '用户组一', '3', null, '1458616520', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('8', '测试人员', '', '200,201,202,203,204,205,209,210,211,212,8,22,107,109,110,108,111,175,176,87,90,92,93,91,94,95,88,96,98,99,97,100,101,89,102,104,105,103,106,177,190,189,188,191,178,179,180,181,182,183,192,206,207,208,193,9,10,12,13,14,15,16,11,17,18,19,20,21,23,24,25,26,27,28,113,114,115,132,134,135,136,137,138,194,195,196,197,198,199,213,214,215,216,217,218,228,229,219,221,222,225,230,220,223,224,226,231,29,159,160,171,172,186,187,170,173,174,184,185,30,31,32,33,34,35,36,37,45,46,48,49,44,47,146,147,150,151,149,152,153,154,156,157,155,158,50,57,59,60,58,61,62,63,65,66,64,67,74,82,84,85,83,86,133,139,141,142,140,143,144,148,161,162', '0', '0', '0', '1');
INSERT INTO `sr_role` VALUES ('11', '测试用户', '', null, '1459166643', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('12', '测试用户组', '', null, '1459166950', '1', '1', '2');
INSERT INTO `sr_role` VALUES ('13', '', '', '1,2,3,5,6,4,7,38,39,40,41,42,43,51,52,53,54,55,56,75,76,77,78,79,80,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,163,165,166,167,168,169,164,200,201,202,203,204,205,8,22,107,109,110,108,111,175,176,87,90,92,93,91,94,95,88,96,98,99,97,100,101,89,102,104,105,103,106,177,190,189,188,191,178,179,180,181,182,183,192,193,9,10,12,13,14,15,16,11,17,18,19,20,21,23,24,25,26,27,28,113,114,115,132,134,135,136,137,138,194,195,196,197,198,199,29,159,160,171,172,186,187,170,173,174,184,185,30,31,32,33,34,35,36,37,45,46,48,49,44,47,146,147,150,151,149,152,50,57,62,63,65,66,64,67,59,60,58,61,74,82,84,85,83,86,153,154,156,157,155,158,133,139,141,142,140,143,144,148,161,162', '0', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('14', '', '', '1,38,39,40,41,42,43,51,52,53,54,55,56,75,76,77,78,79,80,200,201,202,203,204,205,209,210,211,212,8,22,107,109,110,108,111,87,90,92,93,91,94,95,88,96,98,99,97,100,101,89,102,104,105,103,106,177,190,189,188,191,178,179,180,181,182,183,192,206,207,208,193,9,10,12,13,14,15,16,11,17,18,19,20,21,23,24,25,26,27,28,113,114,115,132,134,135,136,137,138,194,195,196,197,198,199,213,214,215,216,217,218,228,229,219,221,222,225,230,220,223,224,226,231,29,159,160,30,31,32,33,34,35,36,37,45,46,48,49,44,47,146,147,150,151,149,152,153,154,156,157,155,158,50,57,59,60,58,61,62,63,65,66,64,67,74,82,84,85,83,86,133,139,141,142,140,143,144,148,161,162', '0', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('15', '', '', '38,39,40,41,42,43,51,52,53,54,55,56,75,76,77,78,79,80,200,201,202,203,204,205,209,210,211,212,8,22,107,109,110,108,111,87,90,92,93,91,94,95,88,96,98,99,97,100,101,89,102,104,105,103,106,177,190,189,188,191,178,179,180,181,182,183,192,206,207,208,193,9,10,12,13,14,15,16,11,17,18,19,20,21,23,24,25,26,27,28,113,114,115,132,134,135,136,137,138,194,195,196,197,198,199,213,214,215,216,217,218,228,229,219,221,222,225,230,220,223,224,226,231,29,159,160,171,172,186,187,170,173,174,184,185,30,31,32,33,34,35,36,37,45,46,48,49,44,47,146,147,150,151,149,152,153,154,156,157,155,158,50,57,59,60,58,61,62,63,65,66,64,67,74,82,84,85,83,86,133,139,141,142,140,143,144,148,161,162', '0', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('16', '', '', '1,38,39,40,41,42,43,51,52,53,54,55,56,75,76,77,78,79,80,209,210,211,212,8,22,107,109,110,108,111,87,90,92,93,91,94,95,88,96,98,99,97,100,101,89,102,104,105,103,106,9,10,12,13,14,15,16,11,17,18,19,20,21,23,24,25,26,27,28,113,114,115,132,134,135,136,137,138,29,159,160,30,31,32,33,34,35,36,37,45,46,48,49,44,47,146,147,150,151,149,152,153,154,156,157,155,158,50,57,59,60,58,61,62,63,65,66,64,67,74,82,84,85,83,86,133,139,141,142,140,143', '0', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('17', '', '', '38,39,40,41,42,43,51,52,53,54,55,56,75,76,77,78,79,80,163,165,166,167,168,169,200,201,202,203,204,205,209,210,211,212,8,22,107,109,110,108,111,87,90,92,93,91,94,95,88,96,98,99,97,100,101,89,102,104,105,103,106,177,190,189,188,191,178,179,180,181,182,183,192,206,207,208,193,9,10,12,13,14,15,16,11,17,18,19,20,21,23,24,25,26,27,28,113,114,115,132,134,135,136,137,138,194,195,196,197,198,199,213,214,215,216,217,218,228,229,219,221,222,225,230,220,223,224,226,231,29,159,160,171,172,186,187,170,173,174,184,185,30,31,32,33,34,35,36,37,45,46,48,49,44,47,146,147,150,151,149,152,153,154,156,157,155,158,50,57,59,60,58,61,62,63,65,66,64,67,74,82,84,85,83,86,133,139,141,142,140,143,144,148,161,162', '0', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('18', '雷达测试', '雷达 ', null, '1460101094', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('19', '雷达测试_1', '雷达', null, '1460101530', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('20', '雷达测试_2', '雷达', null, '1460101545', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('21', '测试', '', null, '1460102431', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('22', '雷达测试', '', null, '1460102439', '0', '1', '2');
INSERT INTO `sr_role` VALUES ('23', 'qq', '', null, '0', '0', '1', '1');

-- ----------------------------
-- Table structure for sr_search_keywords
-- ----------------------------
DROP TABLE IF EXISTS `sr_search_keywords`;
CREATE TABLE `sr_search_keywords` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT ' 1-产品  2-秀吧 3-店铺',
  `keywords` char(120) NOT NULL DEFAULT '' COMMENT '搜索关键词',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '计数',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='首页搜索关键词';

-- ----------------------------
-- Records of sr_search_keywords
-- ----------------------------
INSERT INTO `sr_search_keywords` VALUES ('32', '1', '首页', '1', '0');

-- ----------------------------
-- Table structure for sr_sensitive_words
-- ----------------------------
DROP TABLE IF EXISTS `sr_sensitive_words`;
CREATE TABLE `sr_sensitive_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL DEFAULT '' COMMENT '敏感词',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0：否  1： 是',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用  0：否 1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf16 COMMENT='敏感词表';

-- ----------------------------
-- Records of sr_sensitive_words
-- ----------------------------
INSERT INTO `sr_sensitive_words` VALUES ('1', 'hhh', '0', '0');
INSERT INTO `sr_sensitive_words` VALUES ('2', 'hh', '1', '0');
INSERT INTO `sr_sensitive_words` VALUES ('3', 'hhqq', '0', '0');
INSERT INTO `sr_sensitive_words` VALUES ('4', 'hh', '0', '0');
INSERT INTO `sr_sensitive_words` VALUES ('5', ';;;', '1', '0');
INSERT INTO `sr_sensitive_words` VALUES ('6', ';', '0', '0');
INSERT INTO `sr_sensitive_words` VALUES ('7', 'hh', '1', '0');

-- ----------------------------
-- Table structure for sr_seo_page
-- ----------------------------
DROP TABLE IF EXISTS `sr_seo_page`;
CREATE TABLE `sr_seo_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'SEO ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '页面标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `page_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO标题',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '页面url',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除:0否,1是',
  `is_hid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用:0否,1是',
  `addtime` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='默认SEO信息表';

-- ----------------------------
-- Records of sr_seo_page
-- ----------------------------
INSERT INTO `sr_seo_page` VALUES ('1', '我擦', '按存款及暗红色的  ', '发给回复个哈哈哈', 'caasd', 'backend/baces', '0', '1', '0', '1458989628');
INSERT INTO `sr_seo_page` VALUES ('2', '13', '阿斯达', '阿斯达', '完成', 'Backend/Base/SeoPage/addd', '0', '1', '0', '0');
INSERT INTO `sr_seo_page` VALUES ('3', '阿斯达', 'SEO', '阿斯达', '首页', 'Backend/Base/SeoPage/add', '0', '1', '0', '0');
INSERT INTO `sr_seo_page` VALUES ('4', '(⊙o⊙)…地方', '二哥', '阿斯达', ' 我鬼地方', 'Backend/Base/SeoPage/del', '0', '1', '0', '0');
INSERT INTO `sr_seo_page` VALUES ('5', '沃克-登录', '卧擦-登录', '登录页面', '登录', 'User/Public/login', '0', '1', '0', '0');
INSERT INTO `sr_seo_page` VALUES ('6', '首页', '首页', '首页', '小喇叭', 'Home/Index/index', '0', '0', '0', '0');
INSERT INTO `sr_seo_page` VALUES ('7', '帮助中心', '帮助中心', '', '帮助中心', 'Home/Help/Index', '0', '0', '0', '0');
INSERT INTO `sr_seo_page` VALUES ('8', '服务商库', '服务商库', '', '服务商库', 'Home/Shop/index', '0', '0', '0', '0');
INSERT INTO `sr_seo_page` VALUES ('9', '秀吧', '秀吧', '', '秀吧', 'Home/Show/index', '0', '0', '0', '0');
INSERT INTO `sr_seo_page` VALUES ('10', '新闻资讯', '新闻资讯', '', '新闻资讯', 'Home/News/index', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sr_set_message
-- ----------------------------
DROP TABLE IF EXISTS `sr_set_message`;
CREATE TABLE `sr_set_message` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户的id',
  `rule_id` varchar(50) NOT NULL DEFAULT '' COMMENT '需要消息通知的规则id  用英文的逗号分隔',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='站内通知设置表';

-- ----------------------------
-- Records of sr_set_message
-- ----------------------------

-- ----------------------------
-- Table structure for sr_sockent
-- ----------------------------
DROP TABLE IF EXISTS `sr_sockent`;
CREATE TABLE `sr_sockent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '登录用户id',
  `client_id` varchar(20) NOT NULL DEFAULT '' COMMENT '客服端返回的登录标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3911 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sr_sockent
-- ----------------------------
INSERT INTO `sr_sockent` VALUES ('3910', '249', '7f0000010b5700000757');

-- ----------------------------
-- Table structure for sr_special
-- ----------------------------
DROP TABLE IF EXISTS `sr_special`;
CREATE TABLE `sr_special` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL DEFAULT '' COMMENT '专题名称',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用 0：否 1：是',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0:否  1： 是',
  `talent_title` varchar(25) NOT NULL DEFAULT '' COMMENT '达人称号',
  `role_uid` varchar(225) NOT NULL DEFAULT '' COMMENT '权限的id用户英文逗号分隔     如果选择公开   为0',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:公开（全部） 2：部分人参与 3：自己参与',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '描述',
  `special_lable` text COMMENT '专题标签用英文逗号分隔',
  `group_id` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '所添加的分组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf16 COMMENT='专题列表';

-- ----------------------------
-- Records of sr_special
-- ----------------------------
INSERT INTO `sr_special` VALUES ('1', '活动专题', '0', '0', '活动专题', '0', '34', '2', '1465185960', '党政机关，企事业单位，活动专题，发布', '302,301,282,243,242,176,175,173,172,232,228,231,230,150,227,226,224,225,222,223,218,185,', '2,6');
INSERT INTO `sr_special` VALUES ('2', '开源技术', '0', '1', '开源技术', '0', '25', '1', '1465185537', '开源技术发布', '279,280,281,265,274,266,267,256,255,252,251,246,257,258,259,260,261,262,263,264,250,225,150,233,174,173,177,175,172,176,', '0');
INSERT INTO `sr_special` VALUES ('3', '技术达人', '0', '1', '技术达人', '0', '3', '2', '1465185583', '技术达人，达人技术分享。', '275,278,', '0');
INSERT INTO `sr_special` VALUES ('10', '开发经验', '0', '1', '', '0', '10', '1', '0', '开发者信息', '', '0');
INSERT INTO `sr_special` VALUES ('11', '开源江湖', '0', '1', '开源江湖', '251', '25', '3', '1465185853', '开源江湖，人在江湖，搞笑，让IT人轻松的', '275,277,276,202,162,269,271,272,273,268,270,150,', '0');
INSERT INTO `sr_special` VALUES ('21', '天气好', '0', '1', '', '80,81,82,', '23', '2', '1463022035', '', '228,247,', '3');
INSERT INTO `sr_special` VALUES ('22', '测试', '0', '1', '', '81,', '22', '2', '1463122481', '测试简介', '', '6');
INSERT INTO `sr_special` VALUES ('23', '光谷', '0', '1', '', '0', '7', '1', '1463125153', '方法', '174,173,172,', '0');
INSERT INTO `sr_special` VALUES ('24', '测试专题', '0', '1', '', '0', '24', '1', '1463129424', '', '', '0');
INSERT INTO `sr_special` VALUES ('25', 'ios', '0', '1', '213', '0', '11', '1', '1463553159', 'Description ', '212,218,', '0');
INSERT INTO `sr_special` VALUES ('26', 'ios2', '0', '1', '', '0', '26', '1', '1463129739', 'Description ', '', '0');
INSERT INTO `sr_special` VALUES ('44', '444444', '0', '1', '', '0', '44', '1', '1464771341', '', null, '0');
INSERT INTO `sr_special` VALUES ('45', '222', '0', '1', '', '0', '45', '1', '1464772158', '', null, '0');
INSERT INTO `sr_special` VALUES ('46', '测试分类', '0', '0', '', '0', '46', '1', '1465297439', '我的分类', '289,283,', '0');

-- ----------------------------
-- Table structure for sr_systle_message
-- ----------------------------
DROP TABLE IF EXISTS `sr_systle_message`;
CREATE TABLE `sr_systle_message` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '站内通知标题',
  `is_hid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用 0：否 1：是',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除  0：否 1：是',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '通知类型  1账号信息 2：推荐的文章  3： 话题',
  `table` varchar(25) NOT NULL DEFAULT '' COMMENT '消息所在的表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='站内通知详情表';

-- ----------------------------
-- Records of sr_systle_message
-- ----------------------------

-- ----------------------------
-- Table structure for sr_template
-- ----------------------------
DROP TABLE IF EXISTS `sr_template`;
CREATE TABLE `sr_template` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '模板名，使用英文，保证唯一性。格式建议：“类型_动作”，如“blog_add”或“credit_blog_add”',
  `alias` varchar(255) DEFAULT NULL COMMENT '模板别名，如“发表知识”',
  `title` text COMMENT '标题模板，使用“{”和“}”包含变量名，如“{actor}做了{action}”',
  `body` text COMMENT '内容模板，使用“{”和“}”包含变量名，如“{actor}做了{action}增加了{volume}个{credit_type}”',
  `lang` varchar(255) NOT NULL DEFAULT 'zh' COMMENT '语言，与全局语言包一致，如“en”、“zh”等，目前只支持“zh”',
  `type` varchar(255) DEFAULT NULL COMMENT '模板类型，如blog,credit等',
  `type2` varchar(255) DEFAULT NULL COMMENT '模板类型2，备用类型，可留空。如“credit_blog”等',
  `is_cache` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否使用默认的模板缓存系统进行缓存，0：否；1：是',
  `ctime` int(11) DEFAULT NULL COMMENT '模板建立时间戳',
  PRIMARY KEY (`tpl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of sr_template
-- ----------------------------

-- ----------------------------
-- Table structure for sr_template_record
-- ----------------------------
DROP TABLE IF EXISTS `sr_template_record`;
CREATE TABLE `sr_template_record` (
  `tpl_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '模板使用者UID',
  `tpl_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模板名',
  `tpl_alias` varchar(255) DEFAULT NULL COMMENT '模板别名',
  `type` varchar(255) DEFAULT NULL COMMENT '模板类型',
  `type2` varchar(255) DEFAULT NULL COMMENT '模板类型2',
  `data` text COMMENT '记录模板变量数据',
  `ctime` int(11) DEFAULT NULL COMMENT '模板调用时间戳',
  PRIMARY KEY (`tpl_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板记录表';

-- ----------------------------
-- Records of sr_template_record
-- ----------------------------
