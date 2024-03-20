/*
Navicat MySQL Data Transfer

Source Server         : DatabaseJava
Source Server Version : 80036
Source Host           : localhost:3305
Source Database       : hospital_management_system

Target Server Type    : MYSQL
Target Server Version : 80036
File Encoding         : 65001

Date: 2024-02-28 21:36:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
`id`  int NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`user_id`  int NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
`id`  int NOT NULL AUTO_INCREMENT ,
`status`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`patient_id`  int NOT NULL ,
`slot_id`  int NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`slot_id`) REFERENCES `slot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `slot_id` (`slot_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

;

-- ----------------------------
-- Records of appointment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
`id`  int NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`rate_consultation`  decimal(10,0) NOT NULL ,
`specialization`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`user_id`  int NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

;

-- ----------------------------
-- Records of doctor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
`id`  int NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`dob`  date NOT NULL ,
`gender`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`address`  varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`user_id`  int NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

;

-- ----------------------------
-- Records of patient
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for slot
-- ----------------------------
DROP TABLE IF EXISTS `slot`;
CREATE TABLE `slot` (
`id`  int NOT NULL AUTO_INCREMENT ,
`date`  datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP ,
`time`  time NOT NULL ,
`status`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`doctor_id`  int NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
INDEX `doctor_id` (`doctor_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of slot
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`id`  int NOT NULL AUTO_INCREMENT ,
`username`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`email`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`password`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`role`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
`phone_number`  varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Auto increment value for slot
-- ----------------------------
ALTER TABLE `slot` AUTO_INCREMENT=1;
