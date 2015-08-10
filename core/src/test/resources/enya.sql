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

 Date: 07/28/2015 17:01:00 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_advert`
-- ----------------------------
DROP TABLE IF EXISTS `t_advert`;
CREATE TABLE `t_advert` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `picName` varchar(255) DEFAULT NULL,
  `picPath` varchar(255) DEFAULT NULL,
  `picUrl` varchar(255) DEFAULT NULL,
  `exhId` bigint(20) DEFAULT NULL,
  `mobileName` varchar(255) DEFAULT NULL,
  `mobilePath` varchar(255) DEFAULT NULL,
  `mobileUrl` varchar(255) DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhId` (`exhId`) USING BTREE,
  CONSTRAINT `t_advert_ibfk_1` FOREIGN KEY (`exhId`) REFERENCES `t_exhibition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_answer`
-- ----------------------------
DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `surveyId` bigint(20) DEFAULT NULL,
  `questionId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveyId` (`surveyId`) USING BTREE,
  KEY `questionId` (`questionId`) USING BTREE,
  CONSTRAINT `t_answer_ibfk_1` FOREIGN KEY (`surveyId`) REFERENCES `t_survey` (`id`),
  CONSTRAINT `t_answer_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `t_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

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
  `type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_emailconfig`
-- ----------------------------
DROP TABLE IF EXISTS `t_emailconfig`;
CREATE TABLE `t_emailconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `smtp` varchar(255) DEFAULT NULL,
  `port` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_exhdescription`
-- ----------------------------
DROP TABLE IF EXISTS `t_exhdescription`;
CREATE TABLE `t_exhdescription` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` mediumtext,
  `exhId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhId` (`exhId`) USING BTREE,
  CONSTRAINT `t_exhdescription_ibfk_1` FOREIGN KEY (`exhId`) REFERENCES `t_exhibition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_exhguide`
-- ----------------------------
DROP TABLE IF EXISTS `t_exhguide`;
CREATE TABLE `t_exhguide` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guide` mediumtext,
  `exhId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhId` (`exhId`) USING BTREE,
  CONSTRAINT `t_exhguide_ibfk_1` FOREIGN KEY (`exhId`) REFERENCES `t_exhibition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_exhguideto`
-- ----------------------------
DROP TABLE IF EXISTS `t_exhguideto`;
CREATE TABLE `t_exhguideto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guideTo` mediumtext,
  `exhId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhId` (`exhId`) USING BTREE,
  CONSTRAINT `t_exhguideto_ibfk_1` FOREIGN KEY (`exhId`) REFERENCES `t_exhibition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_exhibition`
-- ----------------------------
DROP TABLE IF EXISTS `t_exhibition`;
CREATE TABLE `t_exhibition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `hallId` bigint(20) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `picName` varchar(255) DEFAULT NULL,
  `picPath` varchar(255) DEFAULT NULL,
  `picUrl` varchar(255) DEFAULT NULL,
  `hot` char(1) DEFAULT NULL,
  `tradeIds` varchar(255) DEFAULT NULL,
  `tradeNames` varchar(512) DEFAULT NULL,
  `keywordIds` varchar(255) DEFAULT NULL,
  `keywordNames` varchar(512) DEFAULT NULL,
  `logoName` varchar(255) DEFAULT NULL,
  `logoPath` varchar(255) DEFAULT NULL,
  `logoUrl` varchar(255) DEFAULT NULL,
  `previewCount` int(10) DEFAULT '0',
  `shareCount` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hallId` (`hallId`) USING BTREE,
  CONSTRAINT `t_exhibition_ibfk_1` FOREIGN KEY (`hallId`) REFERENCES `t_exhibitionhall` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
  `previewCount` int(10) DEFAULT '0',
  `shareCount` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hot` (`hot`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_exhnews`
-- ----------------------------
DROP TABLE IF EXISTS `t_exhnews`;
CREATE TABLE `t_exhnews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) DEFAULT NULL,
  `exhId` bigint(20) DEFAULT NULL,
  `news` mediumtext,
  `createDate` datetime DEFAULT NULL,
  `keywordIds` varchar(255) DEFAULT NULL,
  `keywordNames` varchar(512) DEFAULT NULL,
  `previewCount` int(10) DEFAULT '0',
  `shareCount` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `exhId` (`exhId`) USING BTREE,
  CONSTRAINT `t_exhnews_ibfk_1` FOREIGN KEY (`exhId`) REFERENCES `t_exhibition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_exhservice`
-- ----------------------------
DROP TABLE IF EXISTS `t_exhservice`;
CREATE TABLE `t_exhservice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `content` mediumtext,
  `createDate` datetime DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_exhsponsor`
-- ----------------------------
DROP TABLE IF EXISTS `t_exhsponsor`;
CREATE TABLE `t_exhsponsor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sponsor` mediumtext,
  `exhId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhId` (`exhId`) USING BTREE,
  CONSTRAINT `t_exhsponsor_ibfk_1` FOREIGN KEY (`exhId`) REFERENCES `t_exhibition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_exhtravel`
-- ----------------------------
DROP TABLE IF EXISTS `t_exhtravel`;
CREATE TABLE `t_exhtravel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `travel` mediumtext,
  `exhId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exhId` (`exhId`) USING BTREE,
  CONSTRAINT `t_exhtravel_ibfk_1` FOREIGN KEY (`exhId`) REFERENCES `t_exhibition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
--  Table structure for `t_friendlink`
-- ----------------------------
DROP TABLE IF EXISTS `t_friendlink`;
CREATE TABLE `t_friendlink` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_homepage`
-- ----------------------------
DROP TABLE IF EXISTS `t_homepage`;
CREATE TABLE `t_homepage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `icp` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `facsimile` varchar(255) DEFAULT NULL,
  `logoName` varchar(255) DEFAULT NULL,
  `logoUrl` varchar(255) DEFAULT NULL,
  `logoPath` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_question`
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `surveyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveyId` (`surveyId`) USING BTREE,
  CONSTRAINT `t_question_ibfk_1` FOREIGN KEY (`surveyId`) REFERENCES `t_survey` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
--  Table structure for `t_survey`
-- ----------------------------
DROP TABLE IF EXISTS `t_survey`;
CREATE TABLE `t_survey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  CONSTRAINT `t_user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_usercomments`
-- ----------------------------
DROP TABLE IF EXISTS `t_usercomments`;
CREATE TABLE `t_usercomments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `content` mediumtext,
  `contract` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `reply` mediumtext,
  `lastUpdateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `t_usercomments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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

-- ----------------------------
--  Table structure for `t_usersuvey`
-- ----------------------------
DROP TABLE IF EXISTS `t_usersuvey`;
CREATE TABLE `t_usersuvey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `surveyId` bigint(20) DEFAULT NULL,
  `questionId` bigint(20) DEFAULT NULL,
  `answerId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `answerContent` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveyId` (`surveyId`) USING BTREE,
  KEY `questionId` (`questionId`) USING BTREE,
  KEY `answerId` (`answerId`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `t_usersuvey_ibfk_1` FOREIGN KEY (`surveyId`) REFERENCES `t_survey` (`id`),
  CONSTRAINT `t_usersuvey_ibfk_2` FOREIGN KEY (`questionId`) REFERENCES `t_question` (`id`),
  CONSTRAINT `t_usersuvey_ibfk_3` FOREIGN KEY (`answerId`) REFERENCES `t_answer` (`id`),
  CONSTRAINT `t_usersuvey_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
