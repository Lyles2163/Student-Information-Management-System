-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vue
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apps` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `userId` int DEFAULT NULL COMMENT '用户ID',
  `title` varchar(255) DEFAULT NULL COMMENT '应用标题',
  `description` text COMMENT '应用描述',
  `extra` text COMMENT '附加信息',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `apps_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apps`
--

INSERT INTO `apps` VALUES (1,1,'应用标题1','应用描述1','附加信息1');

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `userId` int DEFAULT NULL COMMENT '用户ID',
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `description` text COMMENT '文章描述',
  `extra` text COMMENT '附加信息',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` VALUES (1,1,'李阳的标题1','这里是李阳的第一个描述','李阳test附加信息1');

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `sender_id` int NOT NULL COMMENT '发送者ID (user表的外键)',
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送者用户名 (冗余数据)',
  `avatarUrl` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发送者头像URL (冗余数据)',
  `receiver_id` int DEFAULT NULL COMMENT '接收者ID，NULL表示群消息',
  `message` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息发送时间',
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='聊天消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--


--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `userId` int DEFAULT NULL COMMENT '用户ID',
  `title` varchar(255) DEFAULT NULL COMMENT '项目标题',
  `description` text COMMENT '项目描述',
  `extra` text COMMENT '附加信息',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户项目信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` VALUES (1,1,'项目标题1','项目描述1','附加信息1');

--
-- Table structure for table `sms_verification`
--

DROP TABLE IF EXISTS `sms_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_verification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  `expiry_time` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_verification`
--


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `age` int NOT NULL COMMENT '年龄',
  `userAccount` varchar(50) NOT NULL COMMENT '用户账号',
  `avatarUrl` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `gender` enum('男','女') NOT NULL COMMENT '性别',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userRole` int NOT NULL COMMENT '用户角色',
  `userPassword` varchar(255) NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userAccount` (`userAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

INSERT INTO `user` VALUES (1,'李阳',20,'Lyles2163','assets/media/classImg/李阳.jpg','男','2024-11-10 00:00:00',1,'123'),(2,'李婷风',19,'litingfeng123','assets/media/classImg/李婷风.jpg','男','2024-11-10 00:00:00',3,'123456'),(3,'张泰源',20,'zhangtaiyuan123','assets/media/classImg/张泰源.jpg','男','2024-11-10 00:00:00',4,'123456'),(4,'沈宥希',20,'shenyouxi123','assets/media/classImg/沈宥希.jpg','女','2024-11-10 00:00:00',5,'123456'),(5,'曹星',20,'caoxing123','assets/media/classImg/曹星.jpg','男','2024-11-10 00:00:00',6,'123456'),(6,'何晓宇',20,'hexiaoyu123','assets/media/classImg/何晓宇.jpg','女','2024-11-10 00:00:00',6,'123456'),(7,'周宇鑫',20,'zhouyuxin123','assets/media/classImg/周宇鑫.jpg','男','2024-11-10 00:00:00',7,'123456'),(8,'金广全',22,'jinguangquan123','assets/media/classImg/金广全.jpg','男','2024-11-10 00:00:00',8,'123456'),(9,'吴启源',22,'wuqiyuan123','assets/media/classImg/吴启源.jpg','男','2024-11-10 00:00:00',9,'123456'),(10,'杨俊杰',22,'yangjunjie123','assets/media/classImg/杨俊杰.jpg','男','2024-11-10 00:00:00',10,'123456'),(11,'罗伟豪',22,'luoweihao123','assets/media/classImg/罗伟豪.jpg','男','2024-11-10 00:00:00',11,'123456'),(12,'房顺',22,'fangshun123','assets/media/classImg/房顺.jpg','女','2024-11-10 00:00:00',12,'123456'),(13,'朱虹静',22,'zhuhongjing123','assets/media/classImg/朱虹静.jpg','女','2024-11-10 00:00:00',13,'123456'),(14,'蔡锦东',20,'caijindong123','assets/media/classImg/蔡锦东.jpg','男','2024-11-10 00:00:00',0,'123456'),(15,'蔡梓煜',20,'caiziyu123','assets/media/classImg/蔡梓煜.jpg','男','2024-11-10 00:00:00',0,'123456'),(16,'曾楚然',20,'zengchuran123','assets/media/classImg/曾楚然.jpg','男','2024-11-10 00:00:00',0,'123456'),(17,'曾海鑫',20,'zenghaixin123','assets/media/classImg/曾海鑫.jpg','男','2024-11-10 00:00:00',0,'123456'),(18,'陈建荣',20,'chenjianrong123','assets/media/classImg/陈建荣.jpg','男','2024-11-10 00:00:00',0,'123456'),(19,'陈玉颖',20,'chenyuying123','assets/media/classImg/陈玉颖.jpg','女','2024-11-10 00:00:00',0,'123456'),(20,'陈钰芸',20,'chenyuyun123','assets/media/classImg/陈钰芸.jpg','女','2024-11-10 00:00:00',0,'123456'),(21,'郭培健',20,'guopeijian123','assets/media/classImg/郭培健.jpg','男','2024-11-10 00:00:00',0,'123456'),(22,'黄宇轩',20,'huangyuxuan123','assets/media/classImg/黄宇轩.jpg','男','2024-11-10 00:00:00',0,'123456'),(23,'江泽宇',20,'jiangzeyu123','assets/media/classImg/江泽宇.jpg','男','2024-11-10 00:00:00',0,'123456'),(24,'李俊程',20,'lijingcheng123','assets/media/classImg/李俊程.jpg','男','2024-11-10 00:00:00',0,'123456'),(25,'李炜锐',20,'liweirui123','assets/media/classImg/李炜锐.jpg','男','2024-10-10 00:00:00',0,'123456'),(26,'李焱昊',20,'liyanhao123','assets/media/classImg/李焱昊.jpg','男','2024-10-10 00:00:00',0,'123456'),(27,'李政',20,'lizheng123','assets/media/classImg/李政.jpg','男','2024-10-10 00:00:00',0,'123456'),(28,'连宇',20,'lianyu123','assets/media/classImg/连宇.jpg','男','2024-10-10 00:00:00',0,'123456'),(29,'马舒琪',20,'mashuqi123','assets/media/classImg/马舒琪.jpg','女','2024-10-10 00:00:00',0,'123456'),(30,'杨倚豪',20,'yangyihao123','assets/media/classImg/杨倚豪.jpg','男','2024-10-10 00:00:00',0,'123456'),(31,'潘昱安',20,'panyuan123','assets/media/classImg/潘昱安.jpg','男','2024-10-10 00:00:00',0,'123456'),(32,'钱美珍',20,'qianmeizhen123','assets/media/classImg/钱美珍.jpg','女','2024-10-10 00:00:00',0,'123456'),(33,'阮炜邦',20,'ruanweibang123','assets/media/classImg/阮炜邦.jpg','男','2024-10-10 00:00:00',0,'123456'),(34,'苏振瑶',20,'suzhenyao123','assets/media/classImg/苏振瑶.jpg','女','2024-10-10 00:00:00',0,'123456'),(35,'唐光华',20,'tangguanghua123','assets/media/classImg/唐光华.jpg','男','2024-10-10 00:00:00',0,'123456'),(36,'唐家豪',20,'tangjiahao123','assets/media/classImg/唐家豪.jpg','男','2024-10-10 00:00:00',0,'123456'),(37,'翁裕杰',20,'wengyujie123','assets/media/classImg/翁裕杰.jpg','男','2024-10-10 00:00:00',0,'123456'),(38,'吴俊桦',20,'wujunhua123','assets/media/classImg/吴俊桦.jpg','男','2024-10-10 00:00:00',0,'123456'),(39,'吴培鑫',20,'wupeixin123','assets/media/classImg/吴培鑫.jpg','女','2024-10-10 00:00:00',0,'123456'),(40,'吴咏泽',20,'wuyongze123','assets/media/classImg/吴咏泽.jpg','男','2024-10-10 00:00:00',0,'123456'),(41,'肖立彬',20,'xiaolibin123','assets/media/classImg/肖立彬.jpg','男','2024-10-10 00:00:00',0,'123456'),(42,'许烘坚',20,'xuhongjian123','assets/media/classImg/许烘坚.jpg','男','2024-10-10 00:00:00',0,'123456'),(43,'薛宏超',20,'xuehongchao123','assets/media/classImg/薛宏超.jpg','男','2024-10-10 00:00:00',0,'123456'),(44,'张健聪',20,'zhangjiancong123','assets/media/classImg/张健聪.jpg','男','2024-10-10 00:00:00',0,'123456'),(45,'张凯强',20,'zhangkaichang123','assets/media/classImg/张凯强.jpg','男','2024-10-10 00:00:00',0,'123456'),(46,'张庆清',20,'zhangqingqing123','assets/media/classImg/张庆清.jpg','男','2024-10-10 00:00:00',0,'123456'),(47,'张小龙',20,'zhangxiaolong123','assets/media/classImg/张小龙.jpg','男','2024-10-10 00:00:00',0,'123456'),(48,'张耀元',20,'zhangyaoyuan123','assets/media/classImg/张耀元.jpg','男','2024-10-10 00:00:00',0,'123456'),(49,'庄璧君',20,'zhuangshengjun123','assets/media/classImg/庄璧君.jpg','女','2024-10-10 00:00:00',0,'123456'),(50,'卓奕森',20,'zhuoyisen123','assets/media/classImg/卓奕森.jpg','男','2024-10-10 00:00:00',0,'123456'),(51,'何圣华',20,'teacher001','assets/media/classImg/何圣华.jpg','男','2024-11-22 08:23:50',1,'123'),(52,'test',20,'test1','assets/media/classImg/test.jpg','男','2024-12-03 13:01:35',1,'123456'),(55,'test3',20,'test3','assets/media/classImg/test.jpg','男','2024-12-04 08:12:01',0,'123456'),(58,'user379548',20,'测试666','assets/media/classImg/test男.jpg','男','2024-12-19 17:14:59',1,'123456'),(59,'user492391',20,'MobileTest','assets/media/classImg/test男.jpg','男','2024-12-19 19:18:33',1,'123456'),(60,'user144070',20,'test1220','assets/media/classImg/test男.jpg','男','2024-12-20 11:32:19',0,'123'),(61,'user512360',20,'test1221','assets/media/classImg/test男.jpg','男','2024-12-20 11:53:49',0,'123'),(62,'user272802',20,'test1222','assets/media/classImg/test男.jpg','男','2024-12-20 11:55:18',0,'123'),(63,'user119586',20,'test1210','assets/media/classImg/test男.jpg','男','2024-12-21 09:05:55',0,'123456'),(64,'test666',20,'test666','assets/media/classImg/test.jpg','男','2024-12-23 08:56:03',1,'123'),(65,'user177220',18,'test777','assets/media/classImg/test女.jpg','女','2024-12-23 08:57:55',0,'123'),(66,'user708743',20,'test1226','assets/media/classImg/test女.jpg','男','2024-12-26 20:28:45',0,'123'),(67,'user962248',20,'test1227','assets/media/classImg/test女.jpg','男','2024-12-27 10:57:07',0,'123');

--
-- Table structure for table `user_dynamic`
--

DROP TABLE IF EXISTS `user_dynamic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dynamic` (
  `dynamicId` int NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `avatarUrl` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `imageUrls` text COMMENT '图片URLs（JSON格式）',
  PRIMARY KEY (`dynamicId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_dynamic_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户动态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dynamic`
--

INSERT INTO `user_dynamic` VALUES (39,2,'李婷风','李婷风的第一条动态','这是我的第一条动态，希望大家可以越来越好','assets/media/classImg/李婷风.jpg','2024-12-20 10:53:05','[\"http:\\/\\/localhost\\/backend\\/uploads\\/download.jpg\"]'),(40,1,'李阳','这是测试注册的图片','验证码是9083，朝阳班班，您的验证码是9083，请勿泄露。','assets/media/classImg/李阳.jpg','2024-12-21 09:16:48','[\"http:\\/\\/localhost\\/backend\\/uploads\\/register.jpg\"]'),(42,65,'user177220','我的一个活动','无','assets/media/classImg/test女.jpg','2024-12-23 08:59:50','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u52a0\\u6cb9.jpg\"]'),(43,1,'李阳','test1211','图片测试','assets/media/classImg/李阳.jpg','2024-12-24 09:30:25','[\"http:\\/\\/localhost\\/backend\\/uploads\\/loading4.gif\"]'),(44,2,'李婷风','test','test','assets/media/classImg/李婷风.jpg','2024-12-27 11:00:09','[\"http:\\/\\/localhost\\/backend\\/uploads\\/loading4.gif\"]');

--
-- Table structure for table `user_event`
--

DROP TABLE IF EXISTS `user_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_event` (
  `eventId` int NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `avatarUrl` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `startDate` datetime NOT NULL COMMENT '开始日期',
  `endDate` datetime NOT NULL COMMENT '结束日期',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `imageUrls` text COMMENT '图片URLs（JSON格式）',
  PRIMARY KEY (`eventId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_event_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_event`
--

INSERT INTO `user_event` VALUES (6,4,'沈宥希','学生职业规划大赛校赛决赛','各位同学上午好\n       为了促使大学生深入了解不同职业的内涵、发展前景、技能要求等，通过调研和分析职业环境，明晰自身兴趣与职业的适配度，从而精准定位职业方向。特协办此次广东机电职业技术学院全国大学生职业规划大赛校赛决赛\n\n表单报名时间⏰:2024年12月19日10:00-2024年12月19日23:00\n\n活动开始时间⏰:2024年12月19日19:00-22:00\n\n活动地点⛳:广东机电职业技术学院北校区职业培训楼一楼大礼堂\n\n奖励机制🎁:成功参与者可得技术技能2分\n\n请感兴趣的同学扫下方表单报名！👇🏻👇🏻👇🏻\n\n⚠️‼已报名的同学请勿重复报名‼️‼️‼️\n‼️参与人员需在12月19号18:50分按座位图找到对应学院位置入座\n‼️19:30未入场者，视为放弃参加','assets/media/classImg/沈宥希.jpg','2024-12-19 00:13:40','2024-12-20 00:13:44','2024-12-19 08:14:16','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u5fae\\u4fe1\\u56fe\\u7247_20241225081400.jpg\"]'),(7,4,'沈宥希','指尖艺术，创意无限','手工活动作为一种富有创意和乐趣的活动形式，其背景涵盖了多个层面的意义和价值。在当今快节奏的社会中，人们常常被各种压力和忙碌所困扰，手工活动提供了一个舒缓身心的空间。它让人们暂时放下日常的烦恼和焦虑，沉浸在手工制作的过程中，专注于每一个细节，感受内心的宁静与平和。\n活动主题：“指尖艺术，创意无限”\n1⃣报名时间：2024年12月17日8：00—12月17日23：00\n2⃣活动时间：2024年12月18日8：00—12月18日23：00\n3⃣ 活动要求\n1、参与活动的同学在规定时间内开始制作手工（手工题材不限）。在易喵喵发布手工作品照片，并截图。☄随后将发布的截图接龙填写至表单处☑（需要在截图里添加班级+姓名+学号）；\n2、图片提交时间为2024年12月18日23:00前上传；\n3、截图方式:易班APP主界面-我的-点击头像-点进帖子详细内容进行截图；\n4、提交方式以个人为单位提交至表单，须在规定时间内上交，报名了过时未交不给予发分。\n🌟🌟🌟活动福利\n参与奖：文艺体育模块积分➕1分/人','assets/media/classImg/沈宥希.jpg','2024-12-17 00:15:38','2024-12-18 00:15:45','2024-12-16 08:16:11','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u5fae\\u4fe1\\u56fe\\u7247_2024122508160122.jpg\"]'),(8,11,'罗伟豪','改革开放，载满希望','通过开展活动，为让同学们深入了解改革开放的历史背景、重大意义和英雄事迹，传承和弘扬伟大的改革开放精神，激发爱国热情，增强民族自豪感和使命感。改革开放不仅是一段历史，更是一种精神遗产。\n\n1⃣、活动主题\n“改革开放，载满希望”\n\n2⃣、主办单位\n广东机电职业技术学院计算机应用学院团委学生会\n\n3⃣、活动对象\n广东机电职业技术学院计算机应用学院全体学生\n\n4⃣、活动地点\n广东机电职业技术学院北校区\n\n5⃣、活动形式\n线上举行\n\n6⃣、活动内容\n\n（1）报名成功的同学需按要求到易班易喵喵发布一段改革开放、或者分享个人感悟等，发布时内容不少50字（2）发布完后需截图，由各班组织委员进行截图的收集。提交方式：各班组织委员将收集好的图片以压缩包的格式且命名为:专业班级“改革开放，满载希望”活动并于12月23日晚上21:00前发送到邮箱工作人员邮箱“15569230368@163.com”。\n\n注意⚠请在规定时间内按要求参与活动\n注意⚠不按要求提交作品者不予接收作品不予颁发学谱分','assets/media/classImg/沈宥希.jpg','2024-12-23 00:17:48','2024-12-23 00:17:51','2024-12-23 08:18:38','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u5fae\\u4fe1\\u56fe\\u7247_2024122508182633.png\"]'),(10,7,'周宇鑫','处家外','处家外，想通过此活动激发同学，勇敢表达对家人的思恋    \n1️⃣报名时间：2024年12月18日8：30—2024年12月18日23：30\n2️⃣活动时间：2024年12月19日8：30—2024年12月19日23：30 \n3️⃣在易班微社区发布想对家人说的一段话（五十字），默认发布区域为学院一计算机应用学院，板块为校园大杂烩(易班APP主界面-我的-点击头像-点进帖子详细内容进行截图)。\n🫵报名方式为报名学谱，提交方式为加入易班课群，在线作业中提交\n活动一切解释权归计算机应用学院团委学生会所有\n🌟🌟🌟活动福利\n参与奖：文艺体育模块积分➕1分/人','assets/media/classImg/周宇鑫.jpg','2024-12-18 12:38:54','2024-12-19 12:38:58','2024-12-18 20:40:31','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u5fae\\u4fe1\\u56fe\\u7247_2024122508182633.png\"]'),(11,7,'周宇鑫','烛光映照历史，留言祈愿和平','12月13日是南京大屠杀死难者国家公祭日，设立此纪念日旨在缅怀先烈引导大家认知传统、尊重传统、继承传统、弘扬传统，增进爱党、爱国、爱社会主义情感。 \n1️⃣ 活动主题：烛光映照历史，留言祈愿和平\n2️⃣ 报名时间：2024年12月12日8：30—2024年12月12日23：30\n3️⃣活动时间：2024年12月13日8：30—2024年12月13日23：30 \n4️⃣活动要求：参与活动的同学需在易班微社区上写下对南京大屠杀遇难同胞的缅怀话语或是对和平的期许或是自身立志维护和平、铭记历史的决心等内容并附上一张追思的烛光图。发布时需附#烛光映照历史，留言祈愿和平#标题；发布板块：计算机应用学院+校园大杂烩（易班APP主界面-我的-点击头像-点进帖子详细内容进行截图） \n5️⃣报名方式为报名学谱，提交方式为加入易班课群，在线作业中提交活动截图⚠️\n活动一切解释权归计算机应用学院团委学生会所有\n🌟🌟🌟活动福利\n参与奖：文艺体育模块积分➕1分/人','assets/media/classImg/周宇鑫.jpg','2024-12-12 12:41:23','2024-12-13 12:41:26','2024-12-12 20:41:33','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u5fae\\u4fe1\\u56fe\\u7247_2024122508182633.png\"]'),(12,4,'沈宥希','国家宪法，心中之重','宪法作为国家的根本大法，是治国安邦的总章程，具有至高无上的地位。开展《国家宪法，心中之重》征文活动具有重要而深远的意义。在当今社会，法治建设日益重要，宪法作为法治的基石，其重要性不言而喻。然而，对于许多人来说，宪法可能显得有些遥远和抽象。通过这次征文活动，我们希望能够拉近宪法与人们的距离，让更多的人深入了解宪法的内涵和意义。\n活动主题：“国家宪法，心中之重”\n1⃣报名时间：2024年12月13日8：00—12月13日23：00\n2⃣活动时间：2024年12月14日8：00—12月14日23：00\n3⃣ 活动要求\n1、参与活动的同学要提前了解并且掌握关于国家宪法的相关知识。在易班微社区发布国家宪法相关知识，100字以上。☄随后将发布的截图接龙填写至表单处☑（需要在截图里添加班级+姓名+学号）；\n2、图片提交时间为2024年12月14日23:00前上传；\n3、截图方式:易班APP主界面-我的-点击头像-点进帖子详细内容进行截图；\n4提交方式以个人为单位提交至表单，须在规定时间内上交，报名了过时未交不给予发分。\n🌟🌟🌟活动福利\n参与奖：文艺体育模块积分➕1分/人','assets/media/classImg/沈宥希.jpg','2024-12-13 12:42:24','2024-12-14 12:42:26','2024-12-12 20:42:51','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u5fae\\u4fe1\\u56fe\\u7247_2024122508182633.png\"]'),(13,4,'沈宥希','不忘曾经烽烟起，心中长鸣警钟声','2024年12月13日，是第十一个国家公祭日，是南京大屠杀87周年。南京大屠杀遇难同胞纪念馆上“遇难者300000”的字体，即便已经过去了87年，看到任然有着钻心刻骨的切肤之痛，我们怎敢遗忘这段黑暗的历史。国家公祭日，让我们在缅怀中涵养家国情怀，在悲痛中汲取前行力量。\n\n1️⃣活动主题\n“不忘曾经烽烟起，心中长鸣警钟声”\n\n2️⃣主办单位\n广东机电职业技术学院计算机应用学院团委学生会\n\n3️⃣活动对象\n广东机电职业技术学院计算机应用学院全体学生\n\n4️⃣活动形式\n线上举行\n\n5️⃣活动内容\n在易班app易喵喵上发布一张为在南京大屠杀中逝去同胞默哀的图片，并附上对先辈的缅怀之情。（图片需要人物入境，文字字数100字以上，截图需带班级+姓名+学号）\n\n6️⃣提交方式\n1.以班级为单位提交。压缩包命名：专业+班级（需绘制一张参与活动人员的Excel表格，最后将截图和Excel表格一起打包后压缩再提交）；\n2.由各班班长统一收集，收齐后于12月14日23:00前发送至工作人员邮箱:2020345510@qq.com \n\n注意⚠️请在规定时间内按要求参与活动\n⚠️不按要求提交作品者不予接收作品不予颁发学谱分\n⚠️成功参与者奖励文艺体育积分+1','assets/media/classImg/沈宥希.jpg','2024-12-14 12:42:24','2024-12-14 12:42:26','2024-12-12 20:43:43','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u5fae\\u4fe1\\u56fe\\u7247_2024122508182633.png\"]');

--
-- Table structure for table `user_homework`
--

DROP TABLE IF EXISTS `user_homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_homework` (
  `homeworkId` int NOT NULL AUTO_INCREMENT COMMENT '作业ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `avatarUrl` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `startDate` datetime NOT NULL COMMENT '开始日期',
  `endDate` datetime NOT NULL COMMENT '结束日期',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `imageUrls` text COMMENT '图片URLs（JSON格式）',
  PRIMARY KEY (`homeworkId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_homework_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户作业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_homework`
--

INSERT INTO `user_homework` VALUES (6,2,'李婷风','这是第1个作业','这是第1个作业，希望大家可以完成','assets/media/classImg/李婷风.jpg','2024-12-20 03:24:53','2024-12-21 03:24:56','2024-12-20 11:25:08','[\"http:\\/\\/localhost\\/backend\\/uploads\\/mysql.jpg\"]');

--
-- Table structure for table `user_notification`
--

DROP TABLE IF EXISTS `user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notification` (
  `notificationId` int NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `avatarUrl` varchar(255) DEFAULT NULL COMMENT '头像URL',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `imageUrls` text COMMENT '图片URLs（JSON格式）',
  PRIMARY KEY (`notificationId`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_notification_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户通知表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notification`
--

INSERT INTO `user_notification` VALUES (3,5,'曹星','通知1','88','assets/media/classImg/曹星.jpg','2024-12-07 17:36:46','[]'),(4,51,'何圣华','医保缴费','各位班主任，上午好：\n       关于医保缴费，麻烦各班主任再次通知本班同学，广州市医保延期至2025年2月28日，延迟缴费同学，待遇享受期仍为2025年1月1日-2025年12月31日。如有需要在学校参保的学生请班主任将学生的（班级、姓名、学号、身份证号码、手机号）汇总后，发给我','assets/media/classImg/何圣华.jpg','2024-12-25 08:31:20','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u5fae\\u4fe1\\u56fe\\u7247_2024122508310244.jpg\"]'),(5,51,'何圣华','学校满意度调查','现在学校随机抽查到这些同学，请这些同学的家长配合做学校满意度调查','assets/media/classImg/何圣华.jpg','2024-12-25 08:32:22','[\"http:\\/\\/localhost\\/backend\\/uploads\\/\\u5fae\\u4fe1\\u56fe\\u7247_2024122508321355.png\"]');

--
-- Table structure for table `userinformation`
--

DROP TABLE IF EXISTS `userinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinformation` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '个人信息ID',
  `userId` int DEFAULT NULL COMMENT '用户ID',
  `slogan` text COMMENT '个人签名',
  `jobTitle` varchar(100) DEFAULT NULL COMMENT '职位',
  `company` varchar(255) DEFAULT NULL COMMENT '公司',
  `location` varchar(100) DEFAULT NULL COMMENT '所在地',
  `dreamGoal` text COMMENT '梦想与目标',
  `articleCount` int DEFAULT '0' COMMENT '文章数量',
  `appCount` int DEFAULT '0' COMMENT '应用数量',
  `projectCount` int DEFAULT '0' COMMENT '项目数量',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `userinformation_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户个人信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinformation`
--

INSERT INTO `userinformation` VALUES (1,1,'加油每一天','无','广东机电','广州','活着就是胜利，挣钱只是 游戏，健康才是目的，快乐才是真谛',5,5,5),(2,2,'test','无','1','1','1',3,3,3),(3,5,'曹星','副班长','无','广东广州','暂无',0,0,0),(4,59,'无','无','无','广州','暂无',0,0,0),(5,65,'test','无','无','无','无',0,0,0);

--
-- Dumping routines for database 'vue'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-27 11:36:54
