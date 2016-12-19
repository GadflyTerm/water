/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost
 Source Database       : mustach

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : utf-8

 Date: 12/17/2016 11:56:38 AM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `onethink_action`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action`;
CREATE TABLE `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
--  Records of `onethink_action`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220'), ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180'), ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646'), ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726'), ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551'), ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988'), ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057'), ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963'), ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301'), ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392'), ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action_log`;
CREATE TABLE `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
--  Records of `onethink_action_log`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_action_log` VALUES ('1', '1', '1', '2130706433', 'member', '1', 'Administrator在2016-12-08 16:52登录了后台', '1', '1481187172'), ('2', '8', '1', '2130706433', 'attribute', '33', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481187668'), ('3', '8', '1', '2130706433', 'attribute', '34', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481187668'), ('4', '8', '1', '2130706433', 'attribute', '35', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481187668'), ('5', '8', '1', '2130706433', 'attribute', '36', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481187668'), ('6', '8', '1', '2130706433', 'attribute', '37', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481187668'), ('7', '8', '1', '2130706433', 'attribute', '38', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481187668'), ('8', '8', '1', '2130706433', 'attribute', '39', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481187668'), ('9', '8', '1', '2130706433', 'attribute', '40', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481187668'), ('10', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481188033'), ('11', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481188299'), ('12', '8', '1', '2130706433', 'attribute', '34', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481188318'), ('13', '8', '1', '2130706433', 'attribute', '34', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481188351'), ('14', '8', '1', '2130706433', 'attribute', '40', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481188394'), ('15', '8', '1', '2130706433', 'attribute', '39', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481188408'), ('16', '8', '1', '2130706433', 'attribute', '37', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481188479'), ('17', '8', '1', '2130706433', 'attribute', '36', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481188490'), ('18', '8', '1', '2130706433', 'attribute', '35', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481188516'), ('19', '8', '1', '2130706433', 'attribute', '33', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481188534'), ('20', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481188780'), ('21', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481188795'), ('22', '10', '1', '2130706433', 'Menu', '123', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481188865'), ('23', '10', '1', '2130706433', 'Menu', '124', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481188912'), ('24', '10', '1', '2130706433', 'Menu', '125', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481189343'), ('25', '10', '1', '2130706433', 'Menu', '126', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481189386'), ('26', '10', '1', '2130706433', 'Menu', '127', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481189446'), ('27', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481189737'), ('28', '10', '1', '2130706433', 'Menu', '128', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481189820'), ('29', '6', '1', '2130706433', 'config', '38', '操作url：/index.php?s=/admin/config/edit.html', '1', '1481190127'), ('30', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481191055'), ('31', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481191074'), ('32', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481191108'), ('33', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481191197'), ('34', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481191252'), ('35', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481194343'), ('36', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481194710'), ('37', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481194791'), ('38', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481194940'), ('39', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481195019'), ('40', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481195091'), ('41', '8', '1', '2130706433', 'attribute', '40', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481195163'), ('42', '8', '1', '2130706433', 'attribute', '40', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481195292'), ('43', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481195982'), ('44', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481196128'), ('45', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481196165'), ('46', '7', '1', '2130706433', 'model', '4', '操作url：/index.php?s=/admin/model/update.html', '1', '1481196215'), ('47', '8', '1', '2130706433', 'attribute', '41', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('48', '8', '1', '2130706433', 'attribute', '42', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('49', '8', '1', '2130706433', 'attribute', '43', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('50', '8', '1', '2130706433', 'attribute', '44', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('51', '8', '1', '2130706433', 'attribute', '45', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('52', '8', '1', '2130706433', 'attribute', '46', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('53', '8', '1', '2130706433', 'attribute', '47', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('54', '8', '1', '2130706433', 'attribute', '48', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('55', '8', '1', '2130706433', 'attribute', '49', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('56', '8', '1', '2130706433', 'attribute', '50', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('57', '8', '1', '2130706433', 'attribute', '51', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('58', '8', '1', '2130706433', 'attribute', '52', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('59', '8', '1', '2130706433', 'attribute', '53', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('60', '8', '1', '2130706433', 'attribute', '54', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('61', '8', '1', '2130706433', 'attribute', '55', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('62', '8', '1', '2130706433', 'attribute', '56', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('63', '8', '1', '2130706433', 'attribute', '57', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('64', '8', '1', '2130706433', 'attribute', '58', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('65', '8', '1', '2130706433', 'attribute', '59', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('66', '8', '1', '2130706433', 'attribute', '60', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('67', '8', '1', '2130706433', 'attribute', '61', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('68', '8', '1', '2130706433', 'attribute', '62', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('69', '8', '1', '2130706433', 'attribute', '63', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('70', '8', '1', '2130706433', 'attribute', '64', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('71', '8', '1', '2130706433', 'attribute', '65', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('72', '8', '1', '2130706433', 'attribute', '66', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('73', '8', '1', '2130706433', 'attribute', '67', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('74', '8', '1', '2130706433', 'attribute', '68', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('75', '8', '1', '2130706433', 'attribute', '69', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('76', '8', '1', '2130706433', 'attribute', '70', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('77', '8', '1', '2130706433', 'attribute', '71', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('78', '8', '1', '2130706433', 'attribute', '72', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('79', '8', '1', '2130706433', 'attribute', '73', '操作url：/index.php?s=/admin/model/generate.html', '1', '1481206882'), ('80', '7', '1', '2130706433', 'model', '5', '操作url：/index.php?s=/admin/model/update.html', '1', '1481207344'), ('81', '7', '1', '2130706433', 'model', '5', '操作url：/index.php?s=/admin/model/update.html', '1', '1481207439'), ('82', '7', '1', '2130706433', 'model', '5', '操作url：/index.php?s=/admin/model/update.html', '1', '1481207490'), ('83', '8', '1', '2130706433', 'attribute', '71', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207555'), ('84', '8', '1', '2130706433', 'attribute', '70', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207567'), ('85', '8', '1', '2130706433', 'attribute', '69', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207576'), ('86', '8', '1', '2130706433', 'attribute', '68', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207587'), ('87', '8', '1', '2130706433', 'attribute', '67', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207605'), ('88', '8', '1', '2130706433', 'attribute', '66', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207617'), ('89', '8', '1', '2130706433', 'attribute', '65', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207629'), ('90', '8', '1', '2130706433', 'attribute', '64', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207639'), ('91', '8', '1', '2130706433', 'attribute', '63', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207652'), ('92', '8', '1', '2130706433', 'attribute', '62', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207663'), ('93', '8', '1', '2130706433', 'attribute', '61', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207679'), ('94', '8', '1', '2130706433', 'attribute', '60', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207690'), ('95', '8', '1', '2130706433', 'attribute', '59', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207699'), ('96', '8', '1', '2130706433', 'attribute', '58', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207712'), ('97', '8', '1', '2130706433', 'attribute', '57', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207722'), ('98', '8', '1', '2130706433', 'attribute', '56', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207733'), ('99', '8', '1', '2130706433', 'attribute', '55', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207742'), ('100', '8', '1', '2130706433', 'attribute', '54', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207751'), ('101', '8', '1', '2130706433', 'attribute', '53', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207770'), ('102', '8', '1', '2130706433', 'attribute', '51', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207782'), ('103', '8', '1', '2130706433', 'attribute', '50', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207792'), ('104', '8', '1', '2130706433', 'attribute', '49', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207802'), ('105', '8', '1', '2130706433', 'attribute', '48', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207822'), ('106', '8', '1', '2130706433', 'attribute', '47', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207833'), ('107', '8', '1', '2130706433', 'attribute', '45', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207845'), ('108', '8', '1', '2130706433', 'attribute', '43', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207868'), ('109', '8', '1', '2130706433', 'attribute', '44', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207882'), ('110', '8', '1', '2130706433', 'attribute', '46', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207894'), ('111', '8', '1', '2130706433', 'attribute', '72', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481207970'), ('112', '8', '1', '2130706433', 'attribute', '73', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1481208007'), ('113', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481208058'), ('114', '10', '1', '2130706433', 'Menu', '1', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481208068'), ('115', '10', '1', '2130706433', 'Menu', '129', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481208871'), ('116', '10', '1', '2130706433', 'Menu', '129', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481208971'), ('117', '10', '1', '2130706433', 'Menu', '129', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481209159'), ('118', '10', '1', '2130706433', 'Menu', '130', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481209331'), ('119', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php?s=/admin/menu/del/id/129.html', '1', '1481209398'), ('120', '10', '1', '2130706433', 'Menu', '130', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481209432'), ('121', '10', '1', '2130706433', 'Menu', '125', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481209499'), ('122', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481209514'), ('123', '10', '1', '2130706433', 'Menu', '123', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481209530'), ('124', '10', '1', '2130706433', 'Menu', '128', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1481209543'), ('125', '10', '1', '2130706433', 'Menu', '131', '操作url：/index.php?s=/admin/menu/add.html', '1', '1481209620'), ('126', '1', '1', '2130706433', 'member', '1', 'Administrator在2016-12-11 11:02登录了后台', '1', '1481425321');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_addons`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_addons`;
CREATE TABLE `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
--  Records of `onethink_addons`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0'), ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0'), ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0'), ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0'), ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0'), ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1'), ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attachment`;
CREATE TABLE `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
--  Table structure for `onethink_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attribute`;
CREATE TABLE `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
--  Records of `onethink_attribute`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', ''), ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', ''), ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', ''), ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', ''), ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', ''), ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', ''), ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', ''), ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', ''), ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', ''), ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', ''), ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', ''), ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', ''), ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function'), ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function'), ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function'), ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', ''), ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', ''), ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', ''), ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', ''), ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', ''), ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', ''), ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', ''), ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', ''), ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', ''), ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', ''), ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', ''), ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function'), ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', ''), ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', ''), ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', ''), ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', ''), ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', ''), ('33', 'title', '广告标题', 'varchar(50) NULL ', 'string', '', '', '1', '', '4', '1', '1', '1481188534', '1481187668', '', '0', '', 'regex', '', '0', 'function'), ('34', 'pid', '上传广告图片', 'int(11) NOT NULL ', 'picture', '', '', '1', '', '4', '1', '1', '1481188351', '1481187668', '', '0', '', 'regex', '', '0', 'function'), ('35', 'images', '广告图片', 'varchar(250) NULL ', 'string', '', '', '0', '', '4', '0', '1', '1481188516', '1481187668', '', '0', '', 'regex', '', '0', 'function'), ('36', 'url', '广告链接', 'varchar(250) NOT NULL ', 'string', '', '', '1', '', '4', '1', '1', '1481188490', '1481187668', '', '0', '', 'regex', '', '0', 'function'), ('37', 'displaygroup', '广告分组', 'smallint(4) NULL ', 'checkbox', '0', '', '1', '0:所有用户\r\n1:未注册用户\r\n2:仅注册用户\r\n3:实名认证的普通用户\r\n4:工程师用户', '4', '0', '1', '1481188479', '1481187668', '', '0', '', 'regex', '', '0', 'function'), ('38', 'displaymodel', '广告模型，默认：All-->所有模型，其它指定模型', 'varchar(20) NULL ', 'string', 'All', '', '1', '', '4', '0', '1', '1481187668', '1481187668', '', '0', '', '', '', '0', ''), ('39', 'displayorder', '广告排序', 'int(11) NULL ', 'num', '0', '', '1', '', '4', '0', '1', '1481188409', '1481187668', '', '0', '', 'regex', '', '0', 'function'), ('40', 'status', '广告状态', 'smallint(4) NULL ', 'select', '1', '', '1', '1:开启\r\n0:关闭', '4', '1', '1', '1481195292', '1481187668', '', '0', '', 'regex', '', '0', 'function'), ('41', 'uuid', '用户UUID', 'varchar(36) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1481206882', '1481206882', '', '0', '', '', '', '0', ''), ('42', 'nickname', '用户昵称', 'varchar(45) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1481206882', '1481206882', '', '0', '', '', '', '0', ''), ('43', 'headimg', '用户头像', 'varchar(45) NULL ', 'picture', '', '', '1', '', '5', '0', '1', '1481207868', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('44', 'mobile', '手机号码', 'varchar(11) NOT NULL ', 'string', '', '', '1', '', '5', '1', '1', '1481207882', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('45', 'password', '用户密码', 'varchar(41) NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207845', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('46', 'clear_password', '明文密码', 'varchar(32) NOT NULL ', 'string', '', '', '1', '', '5', '1', '1', '1481207894', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('47', 'is_bindweixin', '是否绑定微信：: 0-->未绑定, 1-->已绑定', 'tinyint(4) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207833', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('48', 'is_bindweibo', '是否绑定微博：0—>未绑定, 1-->已绑定', 'tinyint(4) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207822', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('49', 'is_bindqq', '是否绑定QQ：0—>未绑定, 1-->已绑定', 'tinyint(4) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207802', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('50', 'is_realname', '是否通过实名认证：0-->未通过, 1-->已提交, 2-->已审核', 'tinyint(4) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207793', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('51', 'is_engineer', '是否认证工程师：0-->未认证, 1-->已提交, 2-->已认证', 'tinyint(4) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207782', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('52', 'register_recip', '用户注册时IP', 'varchar(15) NULL ', 'string', '', '', '1', '', '5', '0', '1', '1481206882', '1481206882', '', '0', '', '', '', '0', ''), ('53', 'register_dateline', '用户注册时间截', 'int(11) NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207770', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('54', 'login_recip', '最后一次登录IP', 'varchar(15) NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207751', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('55', 'login_dateline', '最后一次登录时间截', 'int(11) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207742', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('56', 'weixin_recip', '绑定微信时的IP', 'varchar(15) NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207733', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('57', 'weixin_dateline', '绑定微信时间截', 'int(11) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207722', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('58', 'weibo_recip', '绑定微博时的IP', 'varchar(15) NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207712', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('59', 'weibo_recid', '绑定微博时间截', 'int(11) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207699', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('60', 'qq_recip', '绑定QQ时的IP', 'varchar(15) NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207690', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('61', 'qq_dateline', '绑定QQ时间截', 'int(11) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207679', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('62', 'realname_apply', '实名认证申请时间截', 'int(11) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207663', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('63', 'realname_dateline', '实名认证审核时间截', 'int(11) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207652', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('64', 'engineer_apply', '工程师身份申请时间截', 'int(11) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207639', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('65', 'engineer_dateline', '工程师身份审核时间截', 'int(11) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207629', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('66', 'last_changes', '最后一次变更类型', 'varchar(45) NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207617', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('67', 'last_recip', '最后一次操作者ip', 'varchar(15) NOT NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207605', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('68', 'last_related', '最后一次变更关联数据表名', 'varchar(45) NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207587', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('69', 'last_pk', '最后一次变更数据表主键', 'int(11) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207576', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('70', 'last_info', '最后一次变更说明', 'text NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207567', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('71', 'last_remark', '其他备注, 用于审核说明', 'text NULL ', 'string', '', '', '0', '', '5', '0', '1', '1481207555', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('72', 'state', '用户状态: 0-->注册成功, 1-->实名已申请, 2-->审核成功可正常操作', 'tinyint(4) NULL ', 'string', '0', '', '0', '', '5', '0', '1', '1481207970', '1481206882', '', '0', '', 'regex', '', '0', 'function'), ('73', 'status', '用户启用状态', 'tinyint(4) NULL ', 'select', '1', '0-->禁用， 1-->启用', '1', '0:禁用\r\n1:启用', '5', '0', '1', '1481208007', '1481206882', '', '0', '', 'regex', '', '0', 'function');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_extend`;
CREATE TABLE `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
--  Records of `onethink_auth_extend`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '1'), ('1', '1', '2'), ('1', '2', '1'), ('1', '2', '2'), ('1', '3', '1'), ('1', '3', '2'), ('1', '4', '1'), ('1', '37', '1');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group`;
CREATE TABLE `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `onethink_auth_group`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'), ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `onethink_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_rule`;
CREATE TABLE `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `onethink_auth_rule`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', ''), ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', ''), ('3', 'admin', '2', 'Admin/User/index', '用户', '1', ''), ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', ''), ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', ''), ('7', 'admin', '1', 'Admin/article/add', '新增', '1', ''), ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', ''), ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', ''), ('10', 'admin', '1', 'Admin/article/update', '保存', '1', ''), ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', ''), ('12', 'admin', '1', 'Admin/article/move', '移动', '1', ''), ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', ''), ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', ''), ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', ''), ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', ''), ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', ''), ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', ''), ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', ''), ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', ''), ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', ''), ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', ''), ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', ''), ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', ''), ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', ''), ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', ''), ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', ''), ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', ''), ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', ''), ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', ''), ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', ''), ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', ''), ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', ''), ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', ''), ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', ''), ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', ''), ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', ''), ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', ''), ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', ''), ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', ''), ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', ''), ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', ''), ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', ''), ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', ''), ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', ''), ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', ''), ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', ''), ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', ''), ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', ''), ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', ''), ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', ''), ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', ''), ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', ''), ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', ''), ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', ''), ('56', 'admin', '1', 'Admin/model/add', '新增', '1', ''), ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', ''), ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', ''), ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', ''), ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', ''), ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', ''), ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', ''), ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', ''), ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', ''), ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', ''), ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', ''), ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', ''), ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', ''), ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', ''), ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', ''), ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', ''), ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', ''), ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', ''), ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', ''), ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', ''), ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', ''), ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', ''), ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', ''), ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', ''), ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', ''), ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', ''), ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', ''), ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', ''), ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', ''), ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', ''), ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', ''), ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', ''), ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', ''), ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', ''), ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', ''), ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', ''), ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', ''), ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', ''), ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', ''), ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', ''), ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', ''), ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', ''), ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', ''), ('101', 'admin', '1', 'Admin/other', '其他', '-1', ''), ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', ''), ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', ''), ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', ''), ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', ''), ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', ''), ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', ''), ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', ''), ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', ''), ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', ''), ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', ''), ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', ''), ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', ''), ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', ''), ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', ''), ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', ''), ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', ''), ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', ''), ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', ''), ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', ''), ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', ''), ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', ''), ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', ''), ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', ''), ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', ''), ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', ''), ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', ''), ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', ''), ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', ''), ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', ''), ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', ''), ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', ''), ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', ''), ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', ''), ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', ''), ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', ''), ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', ''), ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', ''), ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', ''), ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', ''), ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', ''), ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', ''), ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', ''), ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', ''), ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', ''), ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', ''), ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', ''), ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', ''), ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', ''), ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', ''), ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', ''), ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', ''), ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', ''), ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', ''), ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', ''), ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', ''), ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', ''), ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', ''), ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', ''), ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', ''), ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', ''), ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', ''), ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', ''), ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', ''), ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', ''), ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', ''), ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', ''), ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', ''), ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', ''), ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', ''), ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', ''), ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', ''), ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', ''), ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', ''), ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', ''), ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', ''), ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', ''), ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', ''), ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', ''), ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', ''), ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', ''), ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', ''), ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', ''), ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', ''), ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', ''), ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', ''), ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', ''), ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', ''), ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', ''), ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', ''), ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', ''), ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', ''), ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', ''), ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', ''), ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', ''), ('195', 'admin', '2', 'Admin/other', '其他', '1', ''), ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', ''), ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', ''), ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', ''), ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', ''), ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', ''), ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', ''), ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', ''), ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', ''), ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', ''), ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', ''), ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', ''), ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', ''), ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', ''), ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', ''), ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', ''), ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', ''), ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', ''), ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', ''), ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', ''), ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_category`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_category`;
CREATE TABLE `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
--  Records of `onethink_category`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0'), ('2', 'default_blog', '默认分类', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1386839751', '1', '31');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_channel`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_channel`;
CREATE TABLE `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `onethink_channel`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0'), ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0'), ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_config`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_config`;
CREATE TABLE `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `onethink_config`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '0'), ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '1'), ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8'), ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1'), ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2'), ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9'), ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3'), ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4'), ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10'), ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4'), ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6'), ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8'), ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1'), ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2'), ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10'), ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3'), ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3'), ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5'), ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7'), ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9'), ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10'), ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11'), ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0'), ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0'), ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0'), ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12'), ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1'), ('38', 'PICTURE_UPLOAD_URL', '1', '上传图片所在域名', '1', '', '上传图片所在域名', '1481190105', '1481190127', '1', 'http://mustach.cn', '0');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_document`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document`;
CREATE TABLE `onethink_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
--  Records of `onethink_document`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_document` VALUES ('1', '1', '', 'OneThink1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1387260660', '1387263112', '1'), ('2', '1', '', 'ddsgsdgdgsdg', '2', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1481187238', '1481187238', '1');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_document_article`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_article`;
CREATE TABLE `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
--  Records of `onethink_document_article`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0'), ('2', '0', 'dgsdgsdgsdgsdgsdgsdgs', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_document_download`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_download`;
CREATE TABLE `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
--  Table structure for `onethink_file`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_file`;
CREATE TABLE `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
--  Table structure for `onethink_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_hooks`;
CREATE TABLE `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `onethink_hooks`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', ''), ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop'), ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment'), ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment'), ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', ''), ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment'), ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor'), ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin'), ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam'), ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor'), ('16', 'app_begin', '应用开始', '2', '1384481614', '');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_member`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_member`;
CREATE TABLE `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
--  Records of `onethink_member`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_member` VALUES ('1', 'Administrator', '0', '0000-00-00', '', '20', '3', '0', '1481187153', '2130706433', '1481425321', '1');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_menu`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_menu`;
CREATE TABLE `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `onethink_menu`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_menu` VALUES ('1', '首页', '0', '0', 'Index/index', '0', '', '', '0'), ('2', '内容', '0', '2', 'Article/mydocument', '0', '', '', '0'), ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0'), ('4', '新增', '3', '0', 'article/add', '0', '', '', '0'), ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0'), ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0'), ('7', '保存', '3', '0', 'article/update', '0', '', '', '0'), ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0'), ('9', '移动', '3', '0', 'article/move', '0', '', '', '0'), ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0'), ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0'), ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0'), ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0'), ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0'), ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0'), ('16', '用户', '0', '3', 'User/index', '0', '', '', '0'), ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0'), ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0'), ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0'), ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0'), ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0'), ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0'), ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0'), ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0'), ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0'), ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0'), ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0'), ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0'), ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0'), ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0'), ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0'), ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0'), ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0'), ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0'), ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0'), ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0'), ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0'), ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0'), ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0'), ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0'), ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0'), ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0'), ('43', '扩展', '0', '7', 'Addons/index', '0', '', '', '0'), ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0'), ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0'), ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0'), ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0'), ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0'), ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0'), ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0'), ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0'), ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0'), ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0'), ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0'), ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0'), ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0'), ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0'), ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0'), ('59', '新增', '58', '0', 'model/add', '0', '', '', '0'), ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0'), ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0'), ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0'), ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0'), ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0'), ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0'), ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0'), ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0'), ('68', '系统', '0', '4', 'Config/group', '0', '', '', '0'), ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0'), ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0'), ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0'), ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0'), ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0'), ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0'), ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0'), ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0'), ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0'), ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0'), ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0'), ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0'), ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0'), ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0'), ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0'), ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0'), ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0'), ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0'), ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0'), ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0'), ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0'), ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0'), ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0'), ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0'), ('93', '其他', '0', '5', 'other', '1', '', '', '0'), ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0'), ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0'), ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0'), ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0'), ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0'), ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0'), ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0'), ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0'), ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0'), ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0'), ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0'), ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0'), ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0'), ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0'), ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0'), ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0'), ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0'), ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0'), ('122', 'APP管理', '0', '1', 'Adverts/lists', '0', '', '', '0'), ('123', '广告管理', '122', '0', 'Adverts/lists', '0', '', 'APP管理', '0'), ('124', '分类管理', '122', '0', 'categray/lists', '0', '', 'APP管理', '0'), ('125', '用户管理', '122', '0', 'Users/lists', '0', '', 'APP管理', '0'), ('126', '实名认证', '122', '0', 'realname/lists', '0', '', 'APP管理', '0'), ('127', '工程师认证', '122', '0', 'engineer/lists', '0', '', 'APP管理', '0'), ('128', '新增广告', '123', '0', 'Adverts/add', '0', '', '广告管理', '0'), ('130', '新增APP用户', '125', '0', 'Users/add', '0', '', '用户管理', '0'), ('131', '编辑广告', '123', '0', 'Adverts/edit', '0', '', '广告管理', '0');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_model`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_model`;
CREATE TABLE `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
--  Records of `onethink_model`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM'), ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM'), ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM'), ('4', 'mustach_adverts', '广告管理', '0', '', '1', '{\"1\":[\"33\",\"34\",\"36\",\"37\",\"38\",\"39\",\"40\"]}', '1:基础', '', '', '', '', 'title:广告标题\r\nurl:广告链接\r\nimages:广告图片链接\r\ndisplayorder:顺序\r\nstatus:状态:[STATUS]&id=[id]|status_lable\r\nid:操作:[EDIT]&id=[id]|编辑', '10', '', '', '1481187668', '1481196215', '1', 'MyISAM'), ('5', 'mustach_user', 'APP用户管理', '0', '', '1', '{\"1\":[\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\",\"49\",\"50\",\"51\",\"52\",\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"68\",\"69\",\"70\",\"71\",\"72\",\"73\"]}', '1:基础', '', '', '', '', 'id:UID\r\nmobile:手机号码\r\nnickname:用户昵称\r\nregister_dateline:用户注册时间\r\nregister_recip:用户注册IP\r\nis_realname:实名认证\r\nis_engineer:工程师\r\nstatus:状态:[STATUS]?id=[id]|status_lable\r\nid:操作:[EDIT]?id=[id]', '10', '', '', '1481206882', '1481207490', '1', 'MyISAM');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_mustach_adverts`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_mustach_adverts`;
CREATE TABLE `onethink_mustach_adverts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '广告标题',
  `pid` int(11) NOT NULL COMMENT '上传广告图片',
  `images` varchar(250) DEFAULT NULL COMMENT '广告图片',
  `url` varchar(250) NOT NULL COMMENT '广告链接',
  `displaygroup` smallint(4) DEFAULT '0' COMMENT '广告分组',
  `displaymodel` varchar(20) DEFAULT 'All' COMMENT '广告模型，默认：All-->所有模型，其它指定模型',
  `displayorder` int(11) DEFAULT '0' COMMENT '广告排序',
  `status` smallint(4) DEFAULT '1' COMMENT '广告状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
--  Records of `onethink_mustach_adverts`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_mustach_adverts` VALUES ('2', 'hjgjhjjftfghfghgfhf', '1', 'http://mustach.cn/Uploads/Picture/2016-12-08/58492bad4ac7c.png', 'http://mustach.cn/index.php?s=/admin/adverts/add/model/4.html', null, '', '0', '1'), ('3', '身份证动工等死等', '3', 'http://mustach.cn/Uploads/Picture/2016-12-08/58495e71d4e97.jpg', 'http://mustach.cn/index.php?s=/admin/adverts/add/model/4.html', null, '', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_mustach_engineer`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_mustach_engineer`;
CREATE TABLE `onethink_mustach_engineer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'APP用户id',
  `certificate` text NOT NULL COMMENT '资质证书JSON数据， {[url: "证书1地址", title: "证书1说明"],[url: "证书2地址", title: "证书2说明"]}',
  `apply_recip` varchar(15) DEFAULT NULL COMMENT '申请认证操作者ip',
  `review_recip` varchar(15) DEFAULT NULL COMMENT '系统审核操作者ip',
  `cause` text COMMENT '审核失败原因',
  `status` smallint(6) DEFAULT '0' COMMENT '认证状态: 0:提交认证-->等待等待审核，1:审核失败-->等待用户重新提交认证材料, 2-->审核认证完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP工程师认证表';

-- ----------------------------
--  Table structure for `onethink_mustach_jpush`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_mustach_jpush`;
CREATE TABLE `onethink_mustach_jpush` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_id` varchar(64) NOT NULL COMMENT '极光推送用户RegistrationID',
  `openid` varchar(100) DEFAULT NULL COMMENT '用户微信OpenID',
  `mobile` varchar(11) DEFAULT NULL COMMENT '接收手机号码',
  `platform` varchar(20) NOT NULL COMMENT '客户手机操作系统',
  `model` varchar(20) NOT NULL COMMENT '用户手机型号',
  `version` varchar(20) NOT NULL COMMENT '手机操作系统版本',
  `app_version` varchar(20) NOT NULL COMMENT '手机APP版本',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `last_login` int(11) DEFAULT NULL COMMENT '用户最后登录时间',
  `dateline` int(11) NOT NULL COMMENT '用户第一次加载时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推送用户表';

-- ----------------------------
--  Table structure for `onethink_mustach_log`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_mustach_log`;
CREATE TABLE `onethink_mustach_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `related` varchar(15) DEFAULT 'user' COMMENT '关联表:wexin/user/order/withdraw等,如果没有则为NULL',
  `related_pk` int(11) NOT NULL COMMENT '关联表id或主键',
  `changes` varchar(20) DEFAULT NULL COMMENT '影响资金类型',
  `affect` decimal(11,2) DEFAULT '0.00' COMMENT '影响资金金额',
  `amount` decimal(11,2) DEFAULT '0.00' COMMENT '可用额度',
  `credits` int(11) DEFAULT '0' COMMENT '可用会员积分',
  `info` text NOT NULL COMMENT '日志说明',
  `recip` varchar(15) NOT NULL COMMENT '操作者ip',
  `remark` text COMMENT '其他备注, 用于审核说明/充值体现说明等',
  `checkuid` int(11) DEFAULT '0' COMMENT '处理人uid',
  `checkip` varchar(15) DEFAULT '0.0.0.0' COMMENT '处理人ip',
  `dateline` int(11) NOT NULL COMMENT '数据变动时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='APP用户系统日志记录表';

-- ----------------------------
--  Table structure for `onethink_mustach_realname`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_mustach_realname`;
CREATE TABLE `onethink_mustach_realname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT 'APP用户id',
  `realname` varchar(20) NOT NULL COMMENT '真实姓名',
  `idcard` varchar(18) NOT NULL COMMENT '身份证号码',
  `birthday` date DEFAULT NULL COMMENT '出生年月日',
  `gender` varchar(6) DEFAULT NULL COMMENT '性别',
  `nation` varchar(20) NOT NULL COMMENT '民族',
  `address` varchar(100) NOT NULL COMMENT '地址',
  `headimg` text NOT NULL COMMENT '身份证头像',
  `idcard_url_1` text NOT NULL COMMENT '身份证正面图片地址',
  `idcard_url_2` text NOT NULL COMMENT '身份证背面图片地址',
  `apply_recip` varchar(15) DEFAULT NULL COMMENT '申请认证操作者ip',
  `review_recip` varchar(15) DEFAULT NULL COMMENT '系统审核操作者ip',
  `cause` text COMMENT '审核失败原因',
  `status` smallint(6) DEFAULT '0' COMMENT '认证状态: 0:提交认证-->等待等待审核，1:审核失败-->等待用户重新提交认证材料, 2-->审核认证完成',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idcard` (`idcard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP用户实名认证表';

-- ----------------------------
--  Table structure for `onethink_mustach_sms_log`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_mustach_sms_log`;
CREATE TABLE `onethink_mustach_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户uid',
  `uuid` varchar(32) DEFAULT NULL COMMENT 'APP端用户UUID',
  `mobile` varchar(11) NOT NULL COMMENT '接收手机号码',
  `sms_type` varchar(20) DEFAULT 'Code' COMMENT '短信类型：（Code）验证码或（Temp）模板短信',
  `actions` varchar(20) DEFAULT 'register' COMMENT '用户操作类型',
  `code` varchar(20) DEFAULT NULL COMMENT '短信验证码或者模板短信ID',
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建的日期时间',
  `dateline` int(11) NOT NULL COMMENT '记录创建的时间截',
  `res_code` int(11) NOT NULL COMMENT '发送返回代码',
  `res_message` varchar(200) DEFAULT NULL COMMENT '响应信息',
  `identifier` text COMMENT '随机短信标识',
  `create_at` int(11) DEFAULT NULL COMMENT '短信下发的Unix时间戳',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信发送日志';

-- ----------------------------
--  Table structure for `onethink_mustach_user`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_mustach_user`;
CREATE TABLE `onethink_mustach_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `uuid` varchar(36) DEFAULT NULL COMMENT '用户UUID',
  `nickname` varchar(45) DEFAULT NULL COMMENT '用户昵称',
  `headimg` varchar(45) DEFAULT NULL COMMENT '用户头像',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `password` varchar(41) DEFAULT NULL COMMENT '用户密码',
  `clear_password` varchar(32) NOT NULL COMMENT '明文密码',
  `is_bindweixin` tinyint(4) DEFAULT '0' COMMENT '是否绑定微信：: 0-->未绑定, 1-->已绑定',
  `is_bindweibo` tinyint(4) DEFAULT '0' COMMENT '是否绑定微博：0—>未绑定, 1-->已绑定',
  `is_bindqq` tinyint(4) DEFAULT '0' COMMENT '是否绑定QQ：0—>未绑定, 1-->已绑定',
  `is_realname` tinyint(4) DEFAULT '0' COMMENT '是否通过实名认证：0-->未通过, 1-->已提交, 2-->已审核',
  `is_engineer` tinyint(4) DEFAULT '0' COMMENT '是否认证工程师：0-->未认证, 1-->已提交, 2-->已认证',
  `register_recip` varchar(15) DEFAULT NULL COMMENT '用户注册时IP',
  `register_dateline` int(11) DEFAULT NULL COMMENT '用户注册时间截',
  `login_recip` varchar(15) DEFAULT NULL COMMENT '最后一次登录IP',
  `login_dateline` int(11) DEFAULT '0' COMMENT '最后一次登录时间截',
  `weixin_recip` varchar(15) DEFAULT NULL COMMENT '绑定微信时的IP',
  `weixin_dateline` int(11) DEFAULT '0' COMMENT '绑定微信时间截',
  `weibo_recip` varchar(15) DEFAULT NULL COMMENT '绑定微博时的IP',
  `weibo_recid` int(11) DEFAULT '0' COMMENT '绑定微博时间截',
  `qq_recip` varchar(15) DEFAULT NULL COMMENT '绑定QQ时的IP',
  `qq_dateline` int(11) DEFAULT '0' COMMENT '绑定QQ时间截',
  `realname_apply` int(11) DEFAULT '0' COMMENT '实名认证申请时间截',
  `realname_dateline` int(11) DEFAULT '0' COMMENT '实名认证审核时间截',
  `engineer_apply` int(11) DEFAULT '0' COMMENT '工程师身份申请时间截',
  `engineer_dateline` int(11) DEFAULT '0' COMMENT '工程师身份审核时间截',
  `last_changes` varchar(45) DEFAULT NULL COMMENT '最后一次变更类型',
  `last_recip` varchar(15) NOT NULL COMMENT '最后一次操作者ip',
  `last_related` varchar(45) DEFAULT NULL COMMENT '最后一次变更关联数据表名',
  `last_pk` int(11) DEFAULT '0' COMMENT '最后一次变更数据表主键',
  `last_info` text COMMENT '最后一次变更说明',
  `last_remark` text COMMENT '其他备注, 用于审核说明',
  `state` tinyint(4) DEFAULT '0' COMMENT '用户状态: 0-->注册成功, 1-->实名已申请, 2-->审核成功可正常操作',
  `status` tinyint(4) DEFAULT '1' COMMENT '用户启用状态',
  PRIMARY KEY (`id`,`mobile`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP用户信息表';

-- ----------------------------
--  Table structure for `onethink_mustach_weixin`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_mustach_weixin`;
CREATE TABLE `onethink_mustach_weixin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT 'APP用户id',
  `weixin` varchar(20) DEFAULT 'wkapp' COMMENT '关注微信号, wkshop(哇咔商家), waka(乐享哇咔), wkapp(哇咔APP, 默认)',
  `openid` varchar(100) NOT NULL COMMENT '用户微信OpenID',
  `nickname` varchar(200) NOT NULL COMMENT '用户昵称',
  `sex` tinyint(1) NOT NULL COMMENT '性别',
  `language` varchar(20) DEFAULT NULL COMMENT '语言',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `country` varchar(20) DEFAULT NULL COMMENT '国家',
  `headimgurl` text NOT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `privilege` text COMMENT '用户特权信息',
  `subscribe_time` int(11) DEFAULT '0' COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `unsubscribe_time` int(11) DEFAULT '0' COMMENT '用户取消关注时间，为时间戳。如果用户曾多次用户取消，则取最后用户取消时间',
  `recip` varchar(15) NOT NULL COMMENT '操作者ip',
  `status` smallint(6) DEFAULT '1' COMMENT '用户关注状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户关注信息表';

-- ----------------------------
--  Table structure for `onethink_picture`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_picture`;
CREATE TABLE `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `onethink_picture`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_picture` VALUES ('1', '/Uploads/Picture/2016-12-08/58492bad4ac7c.png', 'http://mustach.cn/Uploads/Picture/2016-12-08/58492bad4ac7c.png', '7b31ed32b3f59199a5c6dadbf3dfd685', 'c0908758a30250348be14814fd857fea4d0a8320', '1', '1481190317'), ('2', '/Uploads/Picture/2016-12-08/58492d8f49e65.png', 'http://mustach.cn/Uploads/Picture/2016-12-08/58492d8f49e65.png', 'd610ca10ec3c881090b27332ba7a7668', '4022fbb8343ebc02ca4cec4abb0dc3f95bc52c60', '1', '1481190799'), ('3', '/Uploads/Picture/2016-12-08/58495e71d4e97.jpg', 'http://mustach.cn/Uploads/Picture/2016-12-08/58495e71d4e97.jpg', '2716954bcdf6be269a8b2cdce10a165b', 'd460c361b0b82fe70286ee51de053ac193466d1e', '1', '1481203313');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_ucenter_admin`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_admin`;
CREATE TABLE `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
--  Table structure for `onethink_ucenter_app`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_app`;
CREATE TABLE `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
--  Table structure for `onethink_ucenter_member`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_member`;
CREATE TABLE `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Records of `onethink_ucenter_member`
-- ----------------------------
BEGIN;
INSERT INTO `onethink_ucenter_member` VALUES ('1', 'Administrator', 'aea5a4da59dace1c250d171118848e0e', 'admin@mustach.cn', '', '1481187153', '2130706433', '1481425321', '2130706433', '1481187153', '1');
COMMIT;

-- ----------------------------
--  Table structure for `onethink_ucenter_setting`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_setting`;
CREATE TABLE `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
--  Table structure for `onethink_url`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_url`;
CREATE TABLE `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
--  Table structure for `onethink_userdata`
-- ----------------------------
DROP TABLE IF EXISTS `onethink_userdata`;
CREATE TABLE `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Triggers structure for table onethink_mustach_adverts
-- ----------------------------
DROP TRIGGER IF EXISTS `onethink_mustach_adverts_BEFORE_INSERT`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_adverts_BEFORE_INSERT` BEFORE INSERT ON `onethink_mustach_adverts` FOR EACH ROW BEGIN
	SET NEW.images = (SELECT `url` FROM `onethink_picture` WHERE `id` = NEW.pid);
END
 ;;
delimiter ;

delimiter ;;
-- ----------------------------
--  Triggers structure for table onethink_mustach_engineer
-- ----------------------------
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_engineer_AFTER_INSERT`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_engineer_AFTER_INSERT` AFTER INSERT ON `onethink_mustach_engineer` FOR EACH ROW BEGIN
	UPDATE `onethink_mustach_user` SET `last_changes` = 'engineerApply', `last_pk` = NEW.id WHERE `id` = NEW.uid;
END
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_engineer_BEFORE_UPDATE`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_engineer_BEFORE_UPDATE` BEFORE UPDATE ON `onethink_mustach_engineer` FOR EACH ROW BEGIN
	CASE NEW.status
		WHEN '1' THEN
			UPDATE `onethink_mustach_user` SET `last_changes` = 'engineerFail', `last_remark`=NEW.cause, `last_pk` = NEW.id WHERE `id` = NEW.uid;
		WHEN '2' THEN
			UPDATE `onethink_mustach_user` SET `last_changes`='engineerSuccess', `last_pk`=NEW.id WHERE `id`=NEW.uid;
		ELSE
			SET @other = 'other';
	END CASE;
END
 ;;
delimiter ;

delimiter ;;
-- ----------------------------
--  Triggers structure for table onethink_mustach_realname
-- ----------------------------
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_realname_BEFORE_INSERT`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_realname_BEFORE_INSERT` BEFORE INSERT ON `onethink_mustach_realname` FOR EACH ROW BEGIN
	SET NEW.birthday = CONCAT(substring(NEW.idcard, 7, 4), '-', substring(NEW.idcard, 11, 2), '-', substring(NEW.idcard, 13, 2));
	SET NEW.gender = IF((substring(NEW.idcard, 17, 1)%2 = 1), 'male', 'female');
END
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_realname_AFTER_INSERT`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_realname_AFTER_INSERT` AFTER INSERT ON `onethink_mustach_realname` FOR EACH ROW BEGIN
	UPDATE `onethink_mustach_user` SET `last_changes` = 'realnameApply', `last_pk` = NEW.id WHERE `id` = NEW.uid;
END
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_realname_BEFORE_UPDATE`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_realname_BEFORE_UPDATE` BEFORE UPDATE ON `onethink_mustach_realname` FOR EACH ROW BEGIN
	CASE NEW.status
		WHEN '1' THEN
			UPDATE `onethink_mustach_user` SET `last_changes` = 'realnameFail', `last_remark`=NEW.cause, `last_pk` = NEW.id WHERE `id` = NEW.uid;
		WHEN '2' THEN
			UPDATE `onethink_mustach_user` SET `last_changes`='realnameSuccess', `last_pk`=NEW.id WHERE `id`=NEW.uid;
		ELSE
			SET @other = 'other';
	END CASE;
END
 ;;
delimiter ;

delimiter ;;
-- ----------------------------
--  Triggers structure for table onethink_mustach_user
-- ----------------------------
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_user_BEFORE_INSERT`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_user_BEFORE_INSERT` BEFORE INSERT ON `onethink_mustach_user` FOR EACH ROW BEGIN
	/* INSERT `mustach_user` (`uuid`, `mobile`, `clear_password`, `last_recip`) VALUES ('uuid', 'mobile', 'clear_password', `last_recip'); */
	SET NEW.password = password(NEW.clear_password);
	SET NEW.register_dateline = UNIX_TIMESTAMP(now());
	SET NEW.register_recip = NEW.last_recip;
	SET NEW.last_related = 'user';
	SET NEW.last_changes = 'register';
	SET NEW.last_info = CONCAT('新用户【', NEW.mobile, '】成功注册成为用户!');
END
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_user_AFTER_INSERT`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_user_AFTER_INSERT` AFTER INSERT ON `onethink_mustach_user` FOR EACH ROW BEGIN
INSERT `onethink_mustach_log` (uid, related, related_pk, changes, info, recip, dateline)
	VALUES (NEW.id, NEW.last_related, NEW.id, NEW.last_changes, NEW.last_info, NEW.last_recip, NEW.register_dateline);
END
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_user_BEFORE_UPDATE`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_user_BEFORE_UPDATE` BEFORE UPDATE ON `onethink_mustach_user` FOR EACH ROW BEGIN
	CASE NEW.last_changes
		WHEN 'setHeadimg' THEN
			SET NEW.last_related = 'user';
			SET NEW.last_pk = NEW.id;
			SET NEW.last_info = 'APP 用户自定义头像操作！';
		WHEN 'changePassword' THEN
			SET NEW.last_related = 'user';
			SET NEW.last_pk = NEW.id;
			SET NEW.password = password(NEW.clear_password);
			SET NEW.last_info = 'APP 用户变更登录密码操作！';
		WHEN 'changeMobile' THEN
			SET NEW.last_related = 'user';
			SET NEW.last_pk = NEW.id;
			SET NEW.last_info = 'APP 用户变更手机号码操作！';
		WHEN 'loginSystem' THEN
			SET NEW.last_related = 'user';
			SET NEW.last_pk = NEW.id;
			SET NEW.last_info = '用户登录APP系统操作!';
		WHEN 'logoutSystem' THEN
			SET NEW.uuid = null;
			SET NEW.last_related = 'user';
			SET NEW.last_pk = NEW.id;
			SET NEW.last_info = '用户退出APP系统操作!';
		WHEN 'changeStatus' THEN
			SET NEW.uuid = null;
			SET NEW.last_related = 'user';
			SET NEW.last_pk = NEW.id;
			CASE NEW.status
				WHEN 0 THEN
					SET NEW.last_info = '变更用户状态为禁用操作成功！';
				WHEN 1 THEN
					SET NEW.last_info = '变更用户状态为启用操作成功！';
				ELSE
					SET NEW.last_info = '变更用户状态的其它操作！';
			END CASE;
		WHEN 'realnameApply' THEN
			/*由mustach_realname数据表 INSERT 时触发，触发语句：update mustach_user SET last_changes = 'realnameApply', last_pk = '实名表id' WHERE id = 'UID';*/
			SET NEW.is_realname = 1;
			SET NEW.state = 1;
			SET NEW.realname_apply = UNIX_TIMESTAMP(now());
			SET NEW.last_related = 'realname';
			SET NEW.last_info = '用户提交实名认证申请!';
		WHEN 'realnameSuccess' THEN
			/*由mustach_realname数据表 UPDATE 时触发，触发语句：update mustach_user SET last_changes = 'realnameSuccess', last_pk = '实名表id' WHERE id = 'UID';*/
			SET NEW.is_realname = 2;
			SET NEW.state = 2;
			SET NEW.realname_dateline = UNIX_TIMESTAMP(now());
			SET NEW.last_related = 'realname';
			SET NEW.last_info = '系统对用户提交的实名认证申请进行审核, 审核结果: 审核通过!';
		WHEN 'realnameFail' THEN
			/*由mustach_realname数据表 UPDATE 时触发，触发语句：update mustach_user SET last_changes = 'realnameFail', last_pk = '实名表id', last_remark = '审核失败原因' WHERE id = 'UID';*/
			SET NEW.is_realname = 0;
			SET NEW.state = 0;
			SET NEW.last_related = 'realname';
			SET NEW.last_info = CONCAT('系统对用户提交的实名认证申请进行审核, 审核结果:审核失败! 原因: ', NEW.last_remark);
		WHEN 'engineerApply' THEN
			/*由mustach_engineer数据表 INSERT 时触发，触发语句：update mustach_user SET last_changes = 'engineerApply', last_pk = '工程师表id' WHERE id = 'UID';*/
			SET NEW.is_realname = 1;
			SET NEW.engineer_apply = UNIX_TIMESTAMP(now());
			SET NEW.last_related = 'engineer';
			SET NEW.last_info = '用户工程师资质申请!';
		WHEN 'engineerSuccess' THEN
			/*由mustach_engineer数据表 UPDATE 时触发，触发语句：update mustach_user SET last_changes = 'engineerSuccess', last_pk = '工程师表id' WHERE id = 'UID';*/
			SET NEW.is_engineer = 2;
			SET NEW.engineer_dateline = UNIX_TIMESTAMP(now());
			SET NEW.last_related = 'engineer';
			SET NEW.last_info = '系统对用户提交的工程师资质申请进行审核, 审核结果: 审核通过!';
		WHEN 'engineerFail' THEN
			/*由mustach_engineer数据表 UPDATE 时触发，触发语句：update mustach_user SET last_changes = 'engineerFail', last_pk = '工程师表id', last_remark = '审核失败原因' WHERE id = 'UID';*/
			SET NEW.is_engineer = 0;
			SET NEW.last_related = 'engineer';
			SET NEW.last_info = CONCAT('系统对用户提交的工程师资质申请进行审核, 审核结果:审核失败! 原因: ', NEW.last_remark);
		WHEN 'bindWeixin' THEN
			/*由mustach_weixin数据表 INSERT 时触发，触发语句：update mustach_user SET last_changes = 'bindWeixin', last_recip` = '绑定IP', last_info = '绑定说明'，last_pk = '微信表id' WHERE id = 'UID';*/
			SET NEW.is_bindweixin = 1;
			SET NEW.last_related = 'weixin';
			SET NEW.weixin_recip = NEW.last_recip;
			SET NEW.weixin_dateline = UNIX_TIMESTAMP(now());
	END CASE;
	INSERT `onethink_mustach_log` (uid, related, related_pk, changes, info, recip, dateline)
	VALUES (NEW.id, NEW.last_related, NEW.last_pk, NEW.last_changes, NEW.last_info, NEW.last_recip, UNIX_TIMESTAMP(now()));
END
 ;;
delimiter ;

delimiter ;;
-- ----------------------------
--  Triggers structure for table onethink_mustach_weixin
-- ----------------------------
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_weixin_BEFORE_INSERT`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_weixin_BEFORE_INSERT` BEFORE INSERT ON `onethink_mustach_weixin` FOR EACH ROW BEGIN
	SET NEW.subscribe_time = UNIX_TIMESTAMP(now());
END
 ;;
delimiter ;
DROP TRIGGER IF EXISTS `onethink_mustach_weixin_AFTER_INSERT`;
delimiter ;;
CREATE TRIGGER `onethink_mustach_weixin_AFTER_INSERT` AFTER INSERT ON `onethink_mustach_weixin` FOR EACH ROW BEGIN
	SET @info = CONCAT('微信用户「', NEW.nickname, '」关注绑定微信服务号! ');
	UPDATE `onethink_mustach_user` SET `last_changes` = 'bindWeixin', `last_recip` = NEW.recip, `last_pk` = NEW.id, `last_info` = @info WHERE `id` = NEW.uid;
END
 ;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
