--
-- Copyright 2024 HeavenZhi. All rights reserved.
-- Use of this source code is governed by a MIT style
-- license that can be found in the LICENSE file.
--

-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: whateat_cookbook
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  `create_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `version` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `is_del` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除: 0正常, 1删除',

  `sid` CHAR(36) NOT NULL COMMENT '菜系分类表唯一键',
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜系名称',
  `description` TEXT COMMENT '菜系描述',
  UNIQUE (`sid`),
  INDEX (`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜系分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

INSERT INTO `cuisine`(sid,name,description) VALUES ('1','鲁菜','口味咸鲜为主，讲究原料质地优良，以盐提鲜，以汤壮鲜，调味讲求咸鲜纯正，突出本味。咸鲜为主火候精湛，精于制汤，善烹海味。');
INSERT INTO `cuisine`(sid,name,description) VALUES ('2','川菜','口味麻辣为主，菜式多样，口味清鲜醇浓并重，以善用麻辣调味（鱼香、麻辣、辣子、陈皮、椒麻、怪味、酸辣诸味）。');
INSERT INTO `cuisine`(sid,name,description) VALUES ('3','苏菜','口味清淡为主，用料严谨，注重配色，讲究造型，四季有别。烹调技艺以炖、焖、煨著称；重视调汤，保持原汁，口味平和。善用蔬菜。其中淮扬菜，讲究选料和刀工，擅长制汤；苏南菜口味偏甜，注重制酱油，善用香糟、黄酒调味。');
INSERT INTO `cuisine`(sid,name,description) VALUES ('4','粤菜','口味鲜香为主，选料精细，清而不淡，鲜而不俗，嫩而不生，油而不腻。擅长小炒，要求掌握火候和油温恰到好处。还兼容许多西菜做法，讲究菜的气势、档次。');
INSERT INTO `cuisine`(sid,name,description) VALUES ('5','浙菜','口味清淡为主，菜式小巧玲珑，清俊逸秀，菜品鲜美滑嫩，脆软清爽。运用香糟、黄酒调味。烹调技法丰富，尤为在烹制海鲜河鲜有其独到之处。口味注重清鲜脆嫩，保持原料的本色和真味。菜品形态讲究，精巧细腻，清秀雅丽。其中北部口味偏甜，西部口味偏辣，东南部口味偏咸。');
INSERT INTO `cuisine`(sid,name,description) VALUES ('6','闽菜','口味鲜香为主，尤以“香”、“味”见长，其清鲜、和醇、荤香、不腻的风格。三大特色，一长于红糟调味，二长于制汤，三长于使用糖醋。');
INSERT INTO `cuisine`(sid,name,description) VALUES ('7','湘菜','口味香辣为主，品种繁多。色泽上油重色浓，讲求实惠；香辣、香鲜、软嫩。重视原料互相搭配，滋味互相渗透。湘菜调味尤重香辣。相对而言，湘菜的煨功夫更胜一筹，几乎达到炉火纯青的地步。煨，在色泽变化上可分为红煨、白煨，在调味方面有清汤煨、浓汤煨和奶汤煨。小火慢炖，原汁原味。');
INSERT INTO `cuisine`(sid,name,description) VALUES ('8','徽菜','口味鲜辣为主，擅长烧、炖、蒸，而爆、炒菜少，重油、重色，重火功。重火工是历来的，其独到之处集中体现于擅长烧、炖、熏、蒸类的功夫菜上，不同菜肴使用不同的控火技术，形成酥、嫩、香、鲜独特风味，其中最能体现徽式特色的是滑烧、清炖和生熏法。');

--
-- Table structure for table `dishes_type`
--

DROP TABLE IF EXISTS `dishes_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes_type` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  `create_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `version` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `is_del` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除: 0正常, 1删除',

  `sid` CHAR(36) NOT NULL COMMENT '菜品分类表唯一键',
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜品分类名',
  `description` TEXT COMMENT '菜品分类描述',
  UNIQUE (`sid`),
  INDEX (`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes_type`
--

INSERT INTO `dishes_type`(sid,name,description) VALUES ('1','腌菜','腌制是肉、鱼、蔬菜等食物加盐和其他作料进行保藏的一种加工方法，该方法可以防止有害微生物的生长，延长食物贮存期。\r\n蔬菜腌制是一种历史悠久的蔬菜加工方法,由于加工方法简单、成本低廉、容易保存、产品具有独特的色、香、味,为其他加工品所不能代替,所以蔬菜腌制品深受消费者欢迎。\r\n腌制蔬菜可以使用多种原料,常用的有白萝卜、胡萝卜、黄瓜、莴笋、蒜苔、莲花白、辣椒等。我国各地传统的蔬菜腌制品有上海雪里蕻、重庆涪陵的榨菜、广东酸笋、云南大头菜、常州香甜萝卜干等。在国外，日本的酱菜、韩国的泡菜等也久负盛誉。\r\n目前，我国大规模、工业化生产腌制蔬菜一般都采用高盐胚、长时间的腌渍工艺，然后采取低盐化处理的方法制成各种成品。蔬菜腌制的机理主要是利用食盐的高渗透压作用、微生物的发酵作用和蛋白质的水解作用，以及其它一系列的生物化学变化，最终使腌制品得以保存，并具有独特的色、香、味。腌菜制品发酵一般以乳酸发酵为主并伴有少量的酒精发酵和微量的醋酸发酵。在蔬菜腌制品中，味感物质主要是氨基酸和有机酸两大类；香味物质则很复杂，通常都是多种挥发性和半挥发性的物质。');
INSERT INTO `dishes_type`(sid,name,description) VALUES ('2','卤菜','卤菜是烹饪学上凉食菜肴的通称，是各地区耳熟能详的家常菜。卤菜共分为红卤系列、盐焗系列、麻辣系列、泡椒系列、烤鸭系列、酱香系列、五香系列、海鲜系列、凉拌系列等'9'大系列。\r\n它经过腌制、风晒、煮焖或卤制后，经刀工处理，简单包装，即可食用，特点是干香、脆嫩、酥烂、爽滑、无汤、不腻、色泽光亮、食用方便、便于携带，备受人们的喜爱。\r\n中国卤菜源远流长，种类繁多，风味各异，一直以它独有的形式在不断的超越与发展，在粤菜、湘菜、徽菜、川菜当中都有非常大的影响力，而且不论城市乡间，放眼酒楼饭店、街边小巷随处可见其踪迹。');
INSERT INTO `dishes_type`(sid,name,description) VALUES ('3','凉拌菜','凉拌菜，是将初步加工和焯水处理后的原料，经过添加红油、酱油、蒜粒等配料制作而成的菜肴。根据红油的分类一般可分为香辣、麻辣、五香三大类。\r\n凉拌菜其历史文化却深远得多，可追溯到周朝和先秦时期。每一道凉菜，吃的不仅仅是食物的本身，调味料才是灵魂所在。糖、香油、醋、盐、辣椒油等调味的多或少，赋予了每一道凉菜不同的味道。吃前将各种食材连同酱汁拌均匀，酸、辣、甜、麻香味儿在口腔中散发开来，醒胃又养生。');
INSERT INTO `dishes_type`(sid,name,description) VALUES ('4','煎菜','煎是先把锅烧热，用少量的油刷一下锅底，然后把加工成型（一般为扁型）的原料放入锅中，用少量的油煎制成熟的一种烹饪方法.一般是先煎一面，再煎另一面，煎时要不停地晃动锅子，使原料受热均匀，色泽一致。');
INSERT INTO `dishes_type`(sid,name,description) VALUES ('5','炒菜','中国菜的常用制作方法，是中国家庭日常最广泛使用的一种烹饪方法，将一种或几种菜在锅中炒熟的过程，它主要是以锅中的油温为载体，将切好的菜品用中旺火在较短时间内加热成熟的一种烹饪方法。 通常放油若干，加入佐料，再将菜品放入锅中，用中旺火在较短时间内加热成熟，中间使用特制工具“锅铲”不断翻动，直到菜被炒熟！锅铲的翻动过程也正是炒的过程，翻动的目的是使菜品受热、佐料以及各种菜品在炒制过程中析出的汁水在整锅菜中均匀分布。\r\n其中，火候的掌握、翻动节奏以及调味料的加入种类和次序，为最终炒制是否成功的关键！由此，炒菜如不加具体菜名时可独立为动词！如：我炒菜去！');
INSERT INTO `dishes_type`(sid,name,description) VALUES ('6','油炸菜','炸，是将原料挂糊(上浆)或不挂糊(不上浆)，放在不同温度的多量油锅中来加热成熟的烹饪技法。在炸原料时，油量要多于主料，是主料的'2'～'3'倍，有时甚至更多。油量大，炸得快，而且成菜效果好。常见的方法有清炸、干炸、软炸、松炸、酥炸、脆炸、泼炸、浸炸、卷炸等。虽说方法多多，但常用的还是前几种。');
INSERT INTO `dishes_type`(sid,name,description) VALUES ('7','烧菜','烧是先将主料进行一次或两次以上的热处理之后，加入汤（或水）和调料，先用大火烧开，再改用小火慢烧至或酥烂（肉类，海味），或软嫩（鱼类，豆腐），或鲜嫩（蔬菜）的一种烹调方法.由于烧菜的口味，色泽和汤汁多寡的不同，它又分为红烧，白烧，干烧，酱烧，葱烧，辣烧等许多种。');
INSERT INTO `dishes_type`(sid,name,description) VALUES ('8','炖菜','炖和烧相似，所不同的是，炖制菜的汤汁比烧菜的多.炖先用葱，姜炝锅，再冲入汤或水，烧开后下主料，先大火烧开，再小火慢炖.炖菜的主料要求软烂，一般是咸鲜味。');
INSERT INTO `dishes_type`(sid,name,description) VALUES ('9','水煮菜','水煮是指将原料放入水中加热，直至煮熟。');

--
-- Table structure for table `cookbook`
--

DROP TABLE IF EXISTS `cookbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cookbook` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  `create_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `version` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `is_del` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除: 0正常, 1删除',

  `sid` CHAR(36) NOT NULL COMMENT '菜谱表唯一键',
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '菜名',
  `image_address` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '菜谱图片地址',
  `is_meat` BOOLEAN NOT NULL DEFAULT FALSE COMMENT '是否为荤菜',
  `feature` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '该菜品特色',
  `cooking_methods` TEXT COMMENT '具体烹饪方法总览',
  `process_difficulty` DECIMAL(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材处理过程分值,加分越多处理越麻烦,加分越少处理越简单',
  `health` DECIMAL(10,1) NOT NULL DEFAULT '0.0' COMMENT '食材的清淡程度分值,加分越多越重口味,加分越少越清淡',
  `cuisine_sid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'cuisine表的sid外键',
  `dt_sid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'dishes_type表的sid外键',
  `user_sid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'User模块的user表的sid外键',
  UNIQUE (`sid`),
  INDEX (`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜谱表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookbook`
--

--
-- Table structure for table `cookbook_ingredient`
--

DROP TABLE IF EXISTS `cookbook_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cookbook_ingredient` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  `create_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `version` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `is_del` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除: 0正常, 1删除',

  `sid` CHAR(36) NOT NULL COMMENT '菜谱和食材对照表唯一键',
  `quantity` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '食材用量',
  `c_sid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'cookbook表的sid外键',
  `i_sid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'Ingredient模块的ingredient表的sid外键',
  UNIQUE (`sid`),
  INDEX (`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜谱详情和食材对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookbook_ingredient`
--

--
-- Table structure for table `cooking_health`
--

DROP TABLE IF EXISTS `cooking_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cooking_health` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  `create_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `version` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `is_del` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除: 0正常, 1删除',

  `sid` CHAR(36) NOT NULL COMMENT '烹饪难度和健康程度打分表唯一键',
  `name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '烹饪方法',
  `process_difficulty` DECIMAL(10,1) NOT NULL DEFAULT '0.0' COMMENT '加分的分值,加分越多代表操作越复杂,加分越少代表操作越简单',
  `health` DECIMAL(10,1) NOT NULL DEFAULT '0.0' COMMENT '加分的分值,加分越多代表过程越不清淡,加分越少代表过程越清淡',
  UNIQUE (`sid`),
  INDEX (`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='烹饪难度和健康程度打分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooking_health`
--

INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('1','浸泡',0.1,0.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('2','洗净',0.2,0.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('3','去皮',2.5,0.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('4','切块',1.0,0.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('5','切条',4.0,0.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('6','切片',5.5,0.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('7','切丁',6.5,0.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('8','切丝',7.5,0.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('9','切末',10.0,0.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('10','腌制(码味,码料)',3.5,0.5);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('11','煮',1.5,1.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('12','蒸',2.0,0.5);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('13','炖',3.0,2.5);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('14','烧',3.0,3.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('15','煎',5.0,3.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('16','炒',6.0,3.5);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('17','炸',15.0,3.0);
INSERT INTO `cooking_health`(sid,name,process_difficulty,health) VALUES ('18','烤',18.0,3.0);

--
-- Table structure for table `cookbook_cooking`
--

DROP TABLE IF EXISTS `cookbook_cooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cookbook_cooking` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  `create_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` VARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `version` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `is_del` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除: 0正常, 1删除',

  `sid` CHAR(36) NOT NULL COMMENT '菜品详情和操作流程对应表唯一键',
  `image_address` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '菜谱制作步骤图片地址',
  `description` TEXT COMMENT '食材处理描述',
  `c_sid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'cookbook表的sid外键',
  `ch_sid` CHAR(36) NOT NULL DEFAULT '' COMMENT 'cooking_health表的sid外键',
  UNIQUE (`sid`),
  INDEX (`is_del`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜谱详情和操作流程对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookbook_cooking`
--


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-23 15:29:12
