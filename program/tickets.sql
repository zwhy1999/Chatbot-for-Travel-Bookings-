/*
 Navicat Premium Data Transfer

 Source Server         : datebase
 Source Server Type    : MySQL
 Source Server Version : 80400
 Source Host           : localhost:3306
 Source Schema         : tickets

 Target Server Type    : MySQL
 Target Server Version : 80400
 File Encoding         : 65001

 Date: 06/09/2024 14:23:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flights
-- ----------------------------
DROP TABLE IF EXISTS `flights`;
CREATE TABLE `flights`  (
  `FlightID` int NOT NULL AUTO_INCREMENT,
  `Departure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Date` date NOT NULL,
  `Price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `TicketsLeft` int NOT NULL DEFAULT 0,
  `Time` time NULL DEFAULT NULL,
  `Discount` int NULL DEFAULT NULL,
  PRIMARY KEY (`FlightID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flights
-- ----------------------------
INSERT INTO `flights` VALUES (1, 'New York', 'Los Angeles', '2024-05-15', 101.00, 384, '14:40:47', 71);
INSERT INTO `flights` VALUES (2, 'london', 'amsterdam', '2024-03-24', 158.00, 512, '09:53:39', 85);
INSERT INTO `flights` VALUES (3, 'london', 'amsterdam', '2024-03-01', 189.00, 308, '05:25:56', 10);
INSERT INTO `flights` VALUES (4, 'london', 'amsterdam', '2024-03-12', 173.00, 406, '21:28:44', 94);
INSERT INTO `flights` VALUES (5, 'london', 'amsterdam', '2024-03-01', 198.00, 506, '19:05:50', 41);
INSERT INTO `flights` VALUES (6, 'london', 'amsterdam', '2024-03-12', 174.00, 215, '07:03:01', 20);
INSERT INTO `flights` VALUES (7, 'london', 'rome', '2024-08-18', 178.00, 455, '01:57:34', 79);
INSERT INTO `flights` VALUES (8, 'london', 'Barcelona', '2024-04-03', 167.00, 539, '12:38:50', 36);
INSERT INTO `flights` VALUES (9, 'london', 'Barcelona', '2024-05-01', 102.00, 226, '09:21:26', 40);
INSERT INTO `flights` VALUES (10, 'london', 'Barcelona', '2024-06-18', 109.00, 415, '08:50:41', 92);
INSERT INTO `flights` VALUES (11, 'london', 'paris', '2024-04-06', 140.00, 279, '16:09:07', 39);
INSERT INTO `flights` VALUES (12, 'london', 'amsterdam', '2024-03-06', 173.00, 147, '06:13:33', 19);
INSERT INTO `flights` VALUES (13, 'london', 'amsterdam', '2024-03-15', 147.00, 241, '06:40:24', 79);
INSERT INTO `flights` VALUES (14, 'london', 'paris', '2024-08-25', 119.00, 146, '14:41:22', 38);
INSERT INTO `flights` VALUES (15, 'london', 'amsterdam', '2024-03-24', 154.00, 490, '05:25:38', 49);
INSERT INTO `flights` VALUES (16, 'london', 'paris', '2024-05-27', 116.00, 365, '07:04:06', 34);
INSERT INTO `flights` VALUES (17, 'london', 'amsterdam', '2024-03-24', 115.00, 261, '19:03:36', 20);
INSERT INTO `flights` VALUES (18, 'london', 'paris', '2024-06-18', 130.00, 99, '02:05:44', 99);
INSERT INTO `flights` VALUES (19, 'london', 'paris', '2024-04-03', 104.00, 152, '01:17:50', 33);
INSERT INTO `flights` VALUES (20, 'london', 'amsterdam', '2024-03-01', 130.00, 339, '00:12:00', 70);
INSERT INTO `flights` VALUES (21, 'london', 'paris', '2024-04-24', 141.00, 143, '21:06:29', 48);
INSERT INTO `flights` VALUES (22, 'london', 'amsterdam', '2024-03-09', 115.00, 598, '08:56:27', 31);
INSERT INTO `flights` VALUES (23, 'london', 'amsterdam', '2024-03-09', 151.00, 462, '05:22:47', 12);
INSERT INTO `flights` VALUES (24, 'london', 'paris', '2024-04-03', 112.00, 417, '00:04:34', 65);
INSERT INTO `flights` VALUES (25, 'london', 'amsterdam', '2024-03-24', 108.00, 102, '08:14:30', 91);
INSERT INTO `flights` VALUES (26, 'london', 'amsterdam', '2024-03-06', 103.00, 158, '16:58:48', 56);
INSERT INTO `flights` VALUES (27, 'london', 'amsterdam', '2024-03-12', 190.00, 385, '12:10:29', 9);
INSERT INTO `flights` VALUES (28, 'london', 'paris', '2024-05-15', 146.00, 352, '09:56:04', 75);
INSERT INTO `flights` VALUES (29, 'london', 'paris', '2024-06-03', 161.00, 505, '13:08:51', 49);
INSERT INTO `flights` VALUES (30, 'london', 'paris', '2024-05-01', 166.00, 374, '11:56:05', 21);
INSERT INTO `flights` VALUES (31, 'Barcelona', 'paris', '2024-03-18', 148.00, 255, '20:13:51', 54);
INSERT INTO `flights` VALUES (32, 'Barcelona', 'paris', '2024-04-12', 145.00, 551, '17:21:03', 10);
INSERT INTO `flights` VALUES (33, 'Barcelona', 'paris', '2024-06-12', 179.00, 393, '02:03:41', 86);
INSERT INTO `flights` VALUES (34, 'Barcelona', 'paris', '2024-04-09', 166.00, 214, '06:15:15', 99);
INSERT INTO `flights` VALUES (35, 'Barcelona', 'paris', '2024-06-24', 190.00, 290, '01:05:15', 38);
INSERT INTO `flights` VALUES (36, 'paris', 'Barcelona', '2024-03-21', 158.00, 208, '10:40:30', 92);
INSERT INTO `flights` VALUES (37, 'paris', 'london', '2024-08-24', 117.00, 571, '02:06:44', 46);
INSERT INTO `flights` VALUES (38, 'paris', 'london', '2024-06-27', 112.00, 134, '02:32:11', 55);
INSERT INTO `flights` VALUES (39, 'paris', 'Barcelona', '2024-03-03', 110.00, 357, '06:20:45', 34);
INSERT INTO `flights` VALUES (40, 'paris', 'New Delhi', '2024-03-24', 113.00, 284, '00:07:12', 3);
INSERT INTO `flights` VALUES (41, 'paris', 'Delhi', '2024-05-21', 134.00, 250, '05:33:45', 15);
INSERT INTO `flights` VALUES (42, 'paris', 'Delhi', '2024-05-27', 135.00, 299, '03:27:11', 65);
INSERT INTO `flights` VALUES (43, 'paris', 'Delhi', '2024-06-12', 172.00, 147, '00:34:39', 79);
INSERT INTO `flights` VALUES (44, 'paris', 'Rome', '2024-03-03', 157.00, 236, '16:31:41', 99);
INSERT INTO `flights` VALUES (45, 'paris', 'Delhi', '2024-06-27', 171.00, 141, '08:54:31', 58);
INSERT INTO `flights` VALUES (46, 'paris', 'Rome', '2024-03-12', 187.00, 396, '18:57:30', 90);
INSERT INTO `flights` VALUES (47, 'paris', 'Rome', '2024-03-18', 121.00, 462, '20:04:00', 79);
INSERT INTO `flights` VALUES (48, 'amsterdam', 'Delhi', '2024-06-03', 145.00, 522, '19:27:31', 25);
INSERT INTO `flights` VALUES (49, 'amsterdam', 'Delhi', '2024-04-18', 164.00, 125, '13:05:33', 86);
INSERT INTO `flights` VALUES (50, 'amsterdam', 'Delhi', '2024-06-27', 184.00, 459, '07:05:14', 54);
INSERT INTO `flights` VALUES (51, 'amsterdam', 'Delhi', '2024-05-12', 132.00, 320, '20:09:30', 13);
INSERT INTO `flights` VALUES (52, 'amsterdam', 'Delhi', '2024-06-01', 107.00, 127, '07:31:49', 3);
INSERT INTO `flights` VALUES (53, 'amsterdam', 'Delhi', '2024-05-12', 138.00, 571, '01:10:34', 74);
INSERT INTO `flights` VALUES (54, 'amsterdam', 'Delhi', '2024-04-12', 169.00, 381, '07:17:25', 63);
INSERT INTO `flights` VALUES (55, 'amsterdam', 'Delhi', '2024-04-27', 134.00, 588, '08:55:22', 90);
INSERT INTO `flights` VALUES (56, 'amsterdam', 'Rome', '2024-03-15', 165.00, 204, '22:44:35', 61);
INSERT INTO `flights` VALUES (57, 'amsterdam', 'Rome', '2024-03-18', 123.00, 153, '14:56:48', 33);
INSERT INTO `flights` VALUES (58, 'amsterdam', 'Delhi', '2024-04-24', 119.00, 553, '06:30:19', 83);
INSERT INTO `flights` VALUES (59, 'amsterdam', 'Delhi', '2024-05-09', 129.00, 210, '11:41:11', 14);
INSERT INTO `flights` VALUES (60, 'amsterdam', 'Delhi', '2024-06-21', 189.00, 288, '14:54:58', 22);
INSERT INTO `flights` VALUES (61, 'Milan', 'Delhi', '2024-06-03', 160.00, 214, '15:31:18', 68);
INSERT INTO `flights` VALUES (62, 'Milan', 'Rome', '2024-03-03', 133.00, 104, '08:51:35', 72);
INSERT INTO `flights` VALUES (63, 'Milan', 'Rome', '2024-03-06', 184.00, 280, '21:44:02', 57);
INSERT INTO `flights` VALUES (64, 'Milan', 'Delhi', '2024-05-24', 125.00, 489, '10:05:26', 68);
INSERT INTO `flights` VALUES (65, 'Milan', 'Delhi', '2024-05-12', 170.00, 509, '09:15:05', 70);
INSERT INTO `flights` VALUES (66, 'Milan', 'Rome', '2024-03-12', 180.00, 479, '15:59:08', 44);
INSERT INTO `flights` VALUES (67, 'Milan', 'Delhi', '2024-05-06', 189.00, 267, '04:10:26', 12);
INSERT INTO `flights` VALUES (68, 'Milan', 'Rome', '2024-03-21', 107.00, 299, '20:54:46', 24);
INSERT INTO `flights` VALUES (69, 'Milan', 'Delhi', '2024-05-09', 169.00, 595, '20:02:31', 86);
INSERT INTO `flights` VALUES (70, 'Barcelona', 'Delhi', '2024-06-27', 124.00, 479, '13:28:19', 58);
INSERT INTO `flights` VALUES (71, 'Barcelona', 'Rome', '2024-03-15', 115.00, 514, '07:14:04', 29);
INSERT INTO `flights` VALUES (72, 'Barcelona', 'Delhi', '2024-06-27', 101.00, 533, '19:45:21', 72);
INSERT INTO `flights` VALUES (73, 'Barcelona', 'Rome', '2024-03-12', 163.00, 523, '05:04:34', 73);
INSERT INTO `flights` VALUES (74, 'Barcelona', 'Rome', '2024-03-24', 112.00, 417, '14:06:50', 48);
INSERT INTO `flights` VALUES (75, 'Barcelona', 'Delhi', '2024-04-09', 170.00, 418, '07:20:26', 20);
INSERT INTO `flights` VALUES (76, 'Barcelona', 'Delhi', '2024-05-24', 118.00, 240, '18:21:39', 56);
INSERT INTO `flights` VALUES (77, 'Barcelona', 'Delhi', '2024-06-15', 180.00, 345, '21:46:59', 21);
INSERT INTO `flights` VALUES (78, 'Barcelona', 'Delhi', '2024-04-24', 147.00, 409, '05:49:59', 36);
INSERT INTO `flights` VALUES (79, 'Barcelona', 'Delhi', '2024-04-27', 196.00, 410, '11:48:56', 17);
INSERT INTO `flights` VALUES (80, 'Barcelona', 'Rome', '2024-03-01', 141.00, 225, '17:34:47', 74);
INSERT INTO `flights` VALUES (81, 'Barcelona', 'Delhi', '2024-06-01', 118.00, 294, '04:27:07', 19);
INSERT INTO `flights` VALUES (82, 'Banglore', 'Rome', '2024-03-18', 165.00, 195, '17:31:12', 72);
INSERT INTO `flights` VALUES (83, 'Banglore', 'Delhi', '2024-06-21', 173.00, 494, '02:14:41', 2);
INSERT INTO `flights` VALUES (84, 'Banglore', 'Delhi', '2024-06-09', 174.00, 289, '06:39:51', 94);
INSERT INTO `flights` VALUES (85, 'Banglore', 'Delhi', '2024-06-27', 153.00, 363, '02:35:13', 63);
INSERT INTO `flights` VALUES (86, 'Banglore', 'Rome', '2024-03-06', 144.00, 348, '16:56:33', 34);
INSERT INTO `flights` VALUES (87, 'Banglore', 'Rome', '2024-03-09', 161.00, 553, '04:57:08', 81);
INSERT INTO `flights` VALUES (88, 'Banglore', 'Delhi', '2024-04-09', 175.00, 126, '21:55:58', 1);
INSERT INTO `flights` VALUES (89, 'Banglore', 'Delhi', '2024-04-03', 192.00, 367, '22:48:26', 60);
INSERT INTO `flights` VALUES (90, 'Banglore', 'New Delhi', '2024-03-18', 137.00, 359, '00:14:16', 100);
INSERT INTO `flights` VALUES (91, 'Banglore', 'Delhi', '2024-04-09', 110.00, 595, '04:46:06', 17);
INSERT INTO `flights` VALUES (92, 'Banglore', 'Delhi', '2024-06-06', 136.00, 303, '23:07:39', 83);
INSERT INTO `flights` VALUES (93, 'Banglore', 'New Delhi', '2024-03-09', 152.00, 127, '05:20:00', 67);
INSERT INTO `flights` VALUES (94, 'Banglore', 'New Delhi', '2024-03-12', 156.00, 126, '05:17:01', 85);
INSERT INTO `flights` VALUES (95, 'Banglore', 'New Delhi', '2024-03-09', 124.00, 148, '10:25:06', 22);
INSERT INTO `flights` VALUES (96, 'Banglore', 'Delhi', '2024-04-18', 150.00, 266, '12:14:27', 56);
INSERT INTO `flights` VALUES (97, 'Banglore', 'Delhi', '2024-05-18', 180.00, 284, '05:56:59', 15);
INSERT INTO `flights` VALUES (98, 'Banglore', 'Delhi', '2024-04-12', 153.00, 525, '17:01:32', 5);
INSERT INTO `flights` VALUES (99, 'Banglore', 'New Delhi', '2024-03-03', 125.00, 177, '19:16:44', 80);
INSERT INTO `flights` VALUES (100, 'Banglore', 'Delhi', '2024-04-09', 165.00, 207, '21:19:07', 84);

-- ----------------------------
-- Table structure for order_history
-- ----------------------------
DROP TABLE IF EXISTS `order_history`;
CREATE TABLE `order_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `departure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_history
-- ----------------------------
INSERT INTO `order_history` VALUES (1, 'john', 'train', 'nottingham', 'london', '2024-08-25', 13.05, 'confirmed');
INSERT INTO `order_history` VALUES (2, 'john', 'flight', 'london', 'paris', '2024-08-25', 119.00, 'Confirmed');
INSERT INTO `order_history` VALUES (3, 'john', 'train', 'nottingham', 'london', '2024-08-25', 13.05, 'Confirmed');
INSERT INTO `order_history` VALUES (4, 'john', 'flight', 'london', 'paris', '2024-08-25', 119.00, 'Confirmed');
INSERT INTO `order_history` VALUES (5, 'john', 'train', 'nottingham', 'london', '2024-08-25', 13.05, 'Confirmed');
INSERT INTO `order_history` VALUES (6, 'john', 'flight', 'london', 'paris', '2024-08-25', 119.00, 'Confirmed');
INSERT INTO `order_history` VALUES (7, 'john', 'flight', 'london', 'paris', '2024-08-25', 119.00, 'Confirmed');
INSERT INTO `order_history` VALUES (8, 'john', 'flight', 'london', 'paris', '2024-08-25', 119.00, 'Confirmed');
INSERT INTO `order_history` VALUES (9, 'john', 'train', 'nottingham', 'london', '2024-08-25', 13.05, 'Confirmed');
INSERT INTO `order_history` VALUES (10, 'john', 'train', 'nottingham', 'london', '2024-08-25', 13.05, 'Confirmed');
INSERT INTO `order_history` VALUES (11, 'john', 'flight', 'london', 'paris', '2024-08-25', 119.00, 'Confirmed');
INSERT INTO `order_history` VALUES (12, 'john', 'flight', 'london', 'paris', '2024-05-27', 116.00, 'Confirmed');
INSERT INTO `order_history` VALUES (13, 'john', 'flight', 'london', 'rome', '2024-08-18', 178.00, 'Confirmed');
INSERT INTO `order_history` VALUES (14, 'we', 'train', 'nottingham', 'london', '2024-08-25', 13.05, 'Confirmed');
INSERT INTO `order_history` VALUES (15, 'we', 'flight', 'london', 'paris', '2024-08-25', 119.00, 'Confirmed');
INSERT INTO `order_history` VALUES (16, 'john', 'train', 'Hull', 'London', '2024-08-18', 18.83, 'Confirmed');
INSERT INTO `order_history` VALUES (17, 'john', 'train', 'Hull', 'London', '2024-08-18', 18.83, 'Confirmed');

-- ----------------------------
-- Table structure for trains
-- ----------------------------
DROP TABLE IF EXISTS `trains`;
CREATE TABLE `trains`  (
  `TrainID` int NOT NULL AUTO_INCREMENT,
  `Departure` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Destination` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Date` date NULL DEFAULT NULL,
  `Price` decimal(10, 2) NULL DEFAULT NULL,
  `TicketsLeft` int NULL DEFAULT NULL,
  PRIMARY KEY (`TrainID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trains
-- ----------------------------
INSERT INTO `trains` VALUES (1, 'Wolverhampton', 'Stoke-on-Trent', '2024-08-12', 88.70, 37);
INSERT INTO `trains` VALUES (2, 'Southampton', 'London', '2024-08-09', 99.91, 3);
INSERT INTO `trains` VALUES (3, 'Leicester', 'Newcastle', '2024-08-21', 10.42, 48);
INSERT INTO `trains` VALUES (4, 'Southampton', 'Bristol', '2024-08-17', 91.66, 2);
INSERT INTO `trains` VALUES (5, 'York', 'Hull', '2024-08-08', 74.14, 5);
INSERT INTO `trains` VALUES (6, 'London', 'Edinburgh', '2024-08-21', 84.22, 22);
INSERT INTO `trains` VALUES (7, 'Sheffield', 'Edinburgh', '2024-08-23', 51.87, 23);
INSERT INTO `trains` VALUES (8, 'Derby', 'Salford', '2024-08-13', 46.01, 15);
INSERT INTO `trains` VALUES (9, 'Glasgow', 'York', '2024-08-07', 44.26, 43);
INSERT INTO `trains` VALUES (10, 'Aberdeen', 'Cardiff', '2024-07-30', 26.53, 9);
INSERT INTO `trains` VALUES (11, 'Leicester', 'Glasgow', '2024-08-22', 83.39, 7);
INSERT INTO `trains` VALUES (12, 'London', 'Plymouth', '2024-08-26', 48.73, 3);
INSERT INTO `trains` VALUES (13, 'Salford', 'Sheffield', '2024-08-18', 97.03, 27);
INSERT INTO `trains` VALUES (14, 'Sheffield', 'Westminster', '2024-08-23', 66.72, 50);
INSERT INTO `trains` VALUES (15, 'Derby', 'Aberdeen', '2024-08-04', 14.51, 1);
INSERT INTO `trains` VALUES (16, 'Bristol', 'Hull', '2024-08-20', 21.90, 9);
INSERT INTO `trains` VALUES (17, 'Cardiff', 'Southampton', '2024-08-17', 99.11, 22);
INSERT INTO `trains` VALUES (18, 'Liverpool', 'Plymouth', '2024-08-02', 16.88, 30);
INSERT INTO `trains` VALUES (19, 'Brighton', 'Manchester', '2024-07-31', 61.09, 31);
INSERT INTO `trains` VALUES (20, 'Edinburgh', 'Aberdeen', '2024-08-23', 45.09, 19);
INSERT INTO `trains` VALUES (21, 'Edinburgh', 'Manchester', '2024-08-04', 86.93, 43);
INSERT INTO `trains` VALUES (22, 'Leeds', 'Hull', '2024-08-21', 80.95, 8);
INSERT INTO `trains` VALUES (23, 'Sheffield', 'Birmingham', '2024-08-25', 63.16, 42);
INSERT INTO `trains` VALUES (24, 'Hull', 'Westminster', '2024-08-06', 37.39, 23);
INSERT INTO `trains` VALUES (25, 'Brighton', 'Wolverhampton', '2024-08-10', 75.29, 25);
INSERT INTO `trains` VALUES (26, 'Aberdeen', 'Coventry', '2024-08-20', 15.97, 4);
INSERT INTO `trains` VALUES (27, 'Stoke-on-Trent', 'Hull', '2024-08-06', 11.15, 3);
INSERT INTO `trains` VALUES (28, 'Salford', 'Portsmouth', '2024-08-15', 68.56, 41);
INSERT INTO `trains` VALUES (29, 'Newcastle', 'Bristol', '2024-08-28', 67.51, 3);
INSERT INTO `trains` VALUES (30, 'Aberdeen', 'Peterborough', '2024-08-01', 11.15, 32);
INSERT INTO `trains` VALUES (31, 'Peterborough', 'Nottingham', '2024-08-22', 29.45, 24);
INSERT INTO `trains` VALUES (32, 'Swansea', 'Birmingham', '2024-08-06', 51.62, 17);
INSERT INTO `trains` VALUES (33, 'York', 'Hull', '2024-08-07', 15.72, 48);
INSERT INTO `trains` VALUES (34, 'Hull', 'London', '2024-08-18', 18.83, 32);
INSERT INTO `trains` VALUES (35, 'Derby', 'Cardiff', '2024-08-01', 20.87, 23);
INSERT INTO `trains` VALUES (36, 'London', 'Belfast', '2024-08-17', 74.98, 27);
INSERT INTO `trains` VALUES (37, 'Westminster', 'Stoke-on-Trent', '2024-08-19', 77.32, 25);
INSERT INTO `trains` VALUES (38, 'Wolverhampton', 'London', '2024-08-18', 56.36, 31);
INSERT INTO `trains` VALUES (39, 'nottingham', 'london', '2024-08-25', 13.05, 26);
INSERT INTO `trains` VALUES (40, 'Bristol', 'London', '2024-08-23', 60.24, 36);
INSERT INTO `trains` VALUES (41, 'Cardiff', 'Plymouth', '2024-08-12', 18.12, 1);
INSERT INTO `trains` VALUES (42, 'Leicester', 'Belfast', '2024-08-28', 94.82, 45);
INSERT INTO `trains` VALUES (43, 'Stoke-on-Trent', 'Westminster', '2024-08-20', 30.38, 40);
INSERT INTO `trains` VALUES (44, 'Glasgow', 'Belfast', '2024-08-26', 87.30, 43);
INSERT INTO `trains` VALUES (45, 'Stoke-on-Trent', 'Edinburgh', '2024-07-30', 36.07, 21);
INSERT INTO `trains` VALUES (46, 'Swansea', 'Sheffield', '2024-08-21', 51.87, 10);
INSERT INTO `trains` VALUES (47, 'Derby', 'Birmingham', '2024-07-30', 41.68, 29);
INSERT INTO `trains` VALUES (48, 'Peterborough', 'Derby', '2024-08-02', 61.89, 11);
INSERT INTO `trains` VALUES (49, 'Peterborough', 'Edinburgh', '2024-08-21', 60.68, 50);
INSERT INTO `trains` VALUES (50, 'Bristol', 'London', '2024-08-17', 12.52, 40);
INSERT INTO `trains` VALUES (51, 'Westminster', 'Portsmouth', '2024-07-30', 64.23, 50);
INSERT INTO `trains` VALUES (52, 'London', 'Edinburgh', '2024-08-28', 88.36, 32);
INSERT INTO `trains` VALUES (53, 'Belfast', 'Leicester', '2024-08-24', 17.58, 34);
INSERT INTO `trains` VALUES (54, 'Glasgow', 'Brighton', '2024-08-11', 78.29, 50);
INSERT INTO `trains` VALUES (55, 'Plymouth', 'Derby', '2024-08-15', 31.66, 32);
INSERT INTO `trains` VALUES (56, 'Glasgow', 'Westminster', '2024-08-09', 94.08, 41);
INSERT INTO `trains` VALUES (57, 'Leeds', 'Hull', '2024-08-04', 32.38, 41);
INSERT INTO `trains` VALUES (58, 'Aberdeen', 'Leicester', '2024-08-01', 83.62, 24);
INSERT INTO `trains` VALUES (59, 'Newcastle', 'Brighton', '2024-08-23', 25.17, 28);
INSERT INTO `trains` VALUES (60, 'Brighton', 'Glasgow', '2024-08-23', 19.27, 9);
INSERT INTO `trains` VALUES (61, 'Belfast', 'Stoke-on-Trent', '2024-08-12', 89.99, 37);
INSERT INTO `trains` VALUES (62, 'Bristol', 'London', '2024-08-02', 44.83, 13);
INSERT INTO `trains` VALUES (63, 'Stoke-on-Trent', 'Wolverhampton', '2024-08-21', 55.08, 31);
INSERT INTO `trains` VALUES (64, 'Cardiff', 'Bristol', '2024-08-20', 48.09, 19);
INSERT INTO `trains` VALUES (65, 'Cardiff', 'Brighton', '2024-08-02', 83.49, 18);
INSERT INTO `trains` VALUES (66, 'Aberdeen', 'Birmingham', '2024-08-09', 89.16, 7);
INSERT INTO `trains` VALUES (67, 'Cardiff', 'Brighton', '2024-08-04', 28.86, 32);
INSERT INTO `trains` VALUES (68, 'Sheffield', 'Newcastle', '2024-08-25', 62.69, 11);
INSERT INTO `trains` VALUES (69, 'Stoke-on-Trent', 'Sheffield', '2024-08-14', 91.44, 8);
INSERT INTO `trains` VALUES (70, 'Liverpool', 'Brighton', '2024-08-18', 25.15, 28);
INSERT INTO `trains` VALUES (71, 'Westminster', 'Newcastle', '2024-08-06', 31.24, 17);
INSERT INTO `trains` VALUES (72, 'Coventry', 'Belfast', '2024-08-11', 77.71, 39);
INSERT INTO `trains` VALUES (73, 'Newcastle', 'Southampton', '2024-08-07', 53.61, 32);
INSERT INTO `trains` VALUES (74, 'Bristol', 'Newcastle', '2024-08-16', 61.57, 2);
INSERT INTO `trains` VALUES (75, 'York', 'Manchester', '2024-08-03', 78.73, 42);
INSERT INTO `trains` VALUES (76, 'Glasgow', 'Southampton', '2024-08-09', 68.08, 35);
INSERT INTO `trains` VALUES (77, 'Salford', 'Edinburgh', '2024-08-09', 48.85, 37);
INSERT INTO `trains` VALUES (78, 'Leeds', 'Sheffield', '2024-08-20', 64.84, 38);
INSERT INTO `trains` VALUES (79, 'Plymouth', 'Sheffield', '2024-08-07', 49.05, 9);
INSERT INTO `trains` VALUES (80, 'Peterborough', 'Plymouth', '2024-08-25', 56.11, 16);
INSERT INTO `trains` VALUES (81, 'Swansea', 'Derby', '2024-08-17', 56.44, 47);
INSERT INTO `trains` VALUES (82, 'Cardiff', 'Nottingham', '2024-08-26', 74.75, 14);
INSERT INTO `trains` VALUES (83, 'Belfast', 'Aberdeen', '2024-08-19', 23.64, 36);
INSERT INTO `trains` VALUES (84, 'Sheffield', 'Peterborough', '2024-08-07', 86.58, 42);
INSERT INTO `trains` VALUES (85, 'Nottingham', 'Derby', '2024-07-30', 46.95, 41);
INSERT INTO `trains` VALUES (86, 'Westminster', 'Cardiff', '2024-08-24', 93.51, 7);
INSERT INTO `trains` VALUES (87, 'Glasgow', 'Brighton', '2024-08-05', 10.99, 47);
INSERT INTO `trains` VALUES (88, 'Hull', 'Manchester', '2024-08-27', 86.59, 37);
INSERT INTO `trains` VALUES (89, 'Belfast', 'Brighton', '2024-08-27', 98.90, 9);
INSERT INTO `trains` VALUES (90, 'Leicester', 'Westminster', '2024-07-30', 32.24, 39);
INSERT INTO `trains` VALUES (91, 'Portsmouth', 'Brighton', '2024-08-02', 71.34, 35);
INSERT INTO `trains` VALUES (92, 'london', 'Portsmouth', '2024-08-24', 46.53, 25);
INSERT INTO `trains` VALUES (93, 'Westminster', 'Plymouth', '2024-08-27', 36.79, 25);
INSERT INTO `trains` VALUES (94, 'Newcastle', 'Coventry', '2024-08-20', 56.08, 47);
INSERT INTO `trains` VALUES (95, 'Derby', 'Coventry', '2024-08-23', 48.95, 1);
INSERT INTO `trains` VALUES (96, 'Birmingham', 'Peterborough', '2024-08-02', 16.61, 20);
INSERT INTO `trains` VALUES (97, 'Plymouth', 'Newcastle', '2024-08-13', 81.07, 33);
INSERT INTO `trains` VALUES (98, 'Edinburgh', 'Swansea', '2024-08-03', 70.68, 49);
INSERT INTO `trains` VALUES (99, 'Coventry', 'Salford', '2024-08-27', 12.36, 40);
INSERT INTO `trains` VALUES (100, 'Manchester', 'Leicester', '2024-08-14', 56.32, 5);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `UserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PreferencesJSON` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UserName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('asdasd', '{\"departure\": \"\"}');
INSERT INTO `users` VALUES ('asdasf', '{\"departure\": \"\"}');
INSERT INTO `users` VALUES ('asfasf', '{\"departure\": \"\"}');
INSERT INTO `users` VALUES ('awdawd', '{\"departure\": \"\"}');
INSERT INTO `users` VALUES ('Guest', '{\"departure\": \"\"}');
INSERT INTO `users` VALUES ('jack', '{\"departure\": \"london\"}');
INSERT INTO `users` VALUES ('jackson', '{\"departure\": \"york\"}');
INSERT INTO `users` VALUES ('john', '{\"departure\": \"nottingham\"}');
INSERT INTO `users` VALUES ('mike', '{\"departure\": \"\"}');
INSERT INTO `users` VALUES ('tester1', '{\"departure\": \"london\"}');
INSERT INTO `users` VALUES ('tester10', '{\"departure\": \"london\"}');
INSERT INTO `users` VALUES ('tester11', '{\"departure\": \"london\"}');
INSERT INTO `users` VALUES ('tester12', '{\"departure\": \"york\"}');
INSERT INTO `users` VALUES ('tester13', '{\"departure\": \"nottingham\"}');
INSERT INTO `users` VALUES ('tester14', '{\"departure\": \"nottingham\"}');
INSERT INTO `users` VALUES ('tester2', '{\"departure\": \"nottingham\"}');
INSERT INTO `users` VALUES ('tester3', '{\"departure\": \"nottingham\"}');
INSERT INTO `users` VALUES ('tester4', '{\"departure\": \"london\"}');
INSERT INTO `users` VALUES ('tester5', '{\"departure\": \"york\"}');
INSERT INTO `users` VALUES ('tester6', '{\"departure\": \"york\"}');
INSERT INTO `users` VALUES ('tester7', '{\"departure\": \"london\"}');
INSERT INTO `users` VALUES ('tester8', '{\"departure\": \"york\"}');
INSERT INTO `users` VALUES ('tester9', '{\"departure\": \"york\"}');
INSERT INTO `users` VALUES ('we', '{\"departure\": \"\"}');
INSERT INTO `users` VALUES ('work', '{\"departure\": \"\"}');

SET FOREIGN_KEY_CHECKS = 1;
