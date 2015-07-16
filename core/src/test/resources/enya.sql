/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost
 Source Database       : enya

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : utf-8

 Date: 07/16/2015 13:29:17 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_applicationconfig`
-- ----------------------------
DROP TABLE IF EXISTS `t_applicationconfig`;
CREATE TABLE `t_applicationconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `systemKey` varchar(25) DEFAULT NULL,
  `systemValue` mediumtext,
  PRIMARY KEY (`id`),
  KEY `systemKey` (`systemKey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_appstore`
-- ----------------------------
DROP TABLE IF EXISTS `t_appstore`;
CREATE TABLE `t_appstore` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` varchar(128) DEFAULT NULL,
  `pacName` varchar(255) DEFAULT NULL,
  `pacPath` varchar(255) DEFAULT NULL,
  `pacUrl` varchar(255) DEFAULT NULL,
  `qrName` varchar(255) DEFAULT NULL,
  `qrPath` varchar(255) DEFAULT NULL,
  `qrUrl` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `plat` int(10) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_commend`
-- ----------------------------
DROP TABLE IF EXISTS `t_commend`;
CREATE TABLE `t_commend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `typeId` int(10) DEFAULT NULL,
  `itemId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`) USING BTREE,
  KEY `typeId` (`typeId`) USING BTREE,
  KEY `itemId` (`itemId`) USING BTREE,
  CONSTRAINT `t_commend_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `typeId` int(10) DEFAULT NULL,
  `itemId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `rank` int(10) DEFAULT NULL,
  `content` tinytext,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`) USING BTREE,
  KEY `typeId` (`typeId`) USING BTREE,
  KEY `itemId` (`itemId`) USING BTREE,
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(10) DEFAULT NULL,
  `keyValue` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_exhibitionhall`
-- ----------------------------
DROP TABLE IF EXISTS `t_exhibitionhall`;
CREATE TABLE `t_exhibitionhall` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `logo1Path` varchar(255) DEFAULT NULL,
  `logo1Name` varchar(255) DEFAULT NULL,
  `logo1Url` varchar(255) DEFAULT NULL,
  `logo2Path` varchar(255) DEFAULT NULL,
  `logo2Name` varchar(255) DEFAULT NULL,
  `logo2Url` varchar(255) DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `hot` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hot` (`hot`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_feature`
-- ----------------------------
DROP TABLE IF EXISTS `t_feature`;
CREATE TABLE `t_feature` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` tinytext,
  `displayName` varchar(255) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_rolefeature`
-- ----------------------------
DROP TABLE IF EXISTS `t_rolefeature`;
CREATE TABLE `t_rolefeature` (
  `roleId` bigint(20) DEFAULT NULL,
  `featureId` bigint(20) DEFAULT NULL,
  KEY `roleId` (`roleId`) USING BTREE,
  KEY `featureId` (`featureId`) USING BTREE,
  CONSTRAINT `t_rolefeature_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`),
  CONSTRAINT `t_rolefeature_ibfk_2` FOREIGN KEY (`featureId`) REFERENCES `t_feature` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `accountExpired` char(1) DEFAULT NULL,
  `accountLocked` char(1) DEFAULT NULL,
  `credentialsExpired` char(1) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `credits` double DEFAULT NULL,
  `portraitName` varchar(255) DEFAULT NULL,
  `portraitUrl` varchar(255) DEFAULT NULL,
  `portraitPath` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `t_userrole`;
CREATE TABLE `t_userrole` (
  `userId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  KEY `roleId` (`roleId`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `t_userrole_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_userrole_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
