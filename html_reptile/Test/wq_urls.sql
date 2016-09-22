/*
Navicat SQLite Data Transfer

Source Server         : pro_urls
Source Server Version : 30714
Source Host           : :0

Target Server Type    : SQLite
Target Server Version : 30714
File Encoding         : 65001

Date: 2016-04-08 18:11:36
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for wq_urls
-- ----------------------------
DROP TABLE IF EXISTS "main"."wq_urls";
CREATE TABLE "wq_urls" (
"hashCode"  INTEGER NOT NULL,
"url"  TEXT NOT NULL,
"add_time"  BigInt NOT NULL,
"status"  INTEGER NOT NULL,
"remark"  TEXT,
"descript"  TEXT,
"type"  INTEGER,
"z_index"  INTEGER NOT NULL DEFAULT 0
);

-- ----------------------------
-- Records of wq_urls
-- ----------------------------
