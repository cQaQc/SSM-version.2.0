/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : Library

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 27/09/2022 21:35:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `adminId` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `pwd` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of admins
-- ----------------------------
BEGIN;
INSERT INTO `admins` (`adminId`, `name`, `pwd`) VALUES ('1', '铁头小宝', '123456');
COMMIT;

-- ----------------------------
-- Table structure for bookes
-- ----------------------------
DROP TABLE IF EXISTS `bookes`;
CREATE TABLE `bookes` (
  `bookID` int DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `bookCounts` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `detail` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `bookName` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of bookes
-- ----------------------------
BEGIN;
INSERT INTO `bookes` (`bookID`, `author`, `bookCounts`, `detail`, `bookName`) VALUES (NULL, '铁头小宝', '1234567', '卑微仔', '卑微的小柯');
INSERT INTO `bookes` (`bookID`, `author`, `bookCounts`, `detail`, `bookName`) VALUES (NULL, '铁头小宝', '7654321', '窝嫩爹', '牛皮的小强');
COMMIT;

-- ----------------------------
-- Table structure for lendhistory
-- ----------------------------
DROP TABLE IF EXISTS `lendhistory`;
CREATE TABLE `lendhistory` (
  `id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `bookID` int DEFAULT NULL,
  `bookName` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `lendTime` datetime DEFAULT NULL,
  `backTime` datetime DEFAULT NULL,
  `count` int DEFAULT NULL,
  `state` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of lendhistory
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `id` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `sno` int DEFAULT NULL,
  `pwd` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `major` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `birth` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of reader
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
