-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `brands_id_fk` FOREIGN KEY (`id`) REFERENCES `goods` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Брэнд производителя';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Ojas'),(2,'Salamander'),(3,'Dabur'),(4,'Aasha Dent'),(5,'Devi Yoga'),(6,'Himalaya Herbals'),(7,'AKO Yoga'),(8,'Foco'),(9,'Hem'),(10,'Fifty');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `buy_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Описание пожеланий',
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `buy_user_id_fk` (`user_id`),
  CONSTRAINT `buy_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Пожелания покупателя';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (1,'Quia quaerat consequatur tempore optio voluptas saepe. Quidem necessitatibus omnis quia et voluptatum. Consequuntur autem incidunt adipisci doloribus ut eum.',1,'1988-09-12 18:52:42','2001-05-16 14:19:19'),(2,'Blanditiis qui excepturi sed laudantium a repellendus natus laudantium. Doloribus quas aut omnis tempore vitae delectus. Officia inventore minus odio eligendi at autem mollitia. Distinctio iste consequatur quia placeat totam. Deserunt illum libero at',2,'1974-02-22 19:35:18','1977-05-03 12:27:39'),(3,'Ut perspiciatis amet nobis ea. Aut repellat pariatur autem. At ut aliquam ea aspernatur nemo.',3,'1994-08-22 17:24:43','1975-03-10 18:23:11'),(4,'Omnis aspernatur debitis autem deleniti alias velit nostrum. Rerum laborum nam laudantium nihil enim est. Ea natus laudantium explicabo deleniti.',4,'1975-01-08 05:41:57','2021-06-19 12:04:24'),(5,'At animi exercitationem aspernatur impedit id. Odio quasi dolorem veritatis quas. Non illo beatae tempora ipsa quae voluptatem. Non incidunt vitae officia alias.',5,'2018-12-05 19:02:40','2009-03-11 16:16:08'),(6,'Debitis quidem voluptatem rerum. Modi iusto officia qui aut natus voluptas dolores et. Ipsum quasi alias debitis.',6,'1973-04-21 03:52:28','1977-08-12 03:18:38'),(7,'Vel perspiciatis consequuntur perspiciatis consequatur. Voluptatem adipisci eveniet qui nesciunt animi.',7,'2010-04-11 09:34:27','2006-09-03 23:46:49'),(8,'Dicta perferendis id voluptatem dignissimos explicabo sed distinctio. Sapiente voluptatem dolor aut. Dignissimos quo vitae ipsam fugiat esse ea est. Qui laudantium enim eius inventore exercitationem dolorem harum assumenda.',8,'1990-04-09 09:46:23','1977-01-31 13:09:28'),(9,'Quis alias cumque libero iusto. Nihil magnam nobis sapiente.',9,'2004-05-01 22:46:18','2011-07-05 09:49:21'),(10,'Dolorem deserunt sed et est aut omnis. Porro ut cumque labore mollitia quas et nisi accusantium. Ab voluptatem molestiae aut quas. Provident suscipit rerum consequuntur.',10,'1979-05-01 13:47:43','1997-07-30 09:40:23');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_step`
--

DROP TABLE IF EXISTS `buy_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy_step` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `buy_id` int(10) unsigned DEFAULT NULL,
  `step_id` int(10) unsigned DEFAULT NULL,
  `date_step_beg` datetime DEFAULT current_timestamp(),
  `date_step_end` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `buy_step_1_fk` (`buy_id`),
  KEY `buy_step_2_fk` (`step_id`),
  CONSTRAINT `buy_step_1_fk` FOREIGN KEY (`buy_id`) REFERENCES `buy` (`id`),
  CONSTRAINT `buy_step_2_fk` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Этапы покупки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_step`
--

LOCK TABLES `buy_step` WRITE;
/*!40000 ALTER TABLE `buy_step` DISABLE KEYS */;
INSERT INTO `buy_step` VALUES (1,1,1,'1979-01-21 14:52:41','1983-01-22 19:48:01'),(2,2,2,'2016-09-06 05:51:15','2001-07-17 04:00:50'),(3,3,3,'1984-06-09 13:48:51','2009-07-31 16:00:38'),(4,4,4,'1976-07-19 16:51:36','2018-10-24 05:17:00'),(5,5,1,'2006-04-10 10:36:02','2006-04-04 03:08:24'),(6,6,2,'1994-12-06 01:06:03','1974-04-03 15:27:52'),(7,7,3,'1975-06-09 05:04:44','2005-02-20 14:29:19'),(8,8,4,'2000-06-22 03:47:25','1971-04-29 21:17:15'),(9,9,1,'2011-10-03 10:06:00','2002-03-29 17:47:34'),(10,10,2,'1993-06-12 00:01:33','1988-02-24 06:58:58');
/*!40000 ALTER TABLE `buy_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название категории',
  `short_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Короткое описание',
  `image_blob_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Идентификатор картинки категории',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Категории товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'7','Quasi eius est quaerat cum quidem repellendus. Similique aut autem dolorum vitae beatae temporibus ea. Repellat sunt earum libero qui rerum vel rem. Exercitationem eos magnam quo eligendi voluptas aut dolores.','http://lorempixel.com/600/400/','2017-12-17 10:30:28','2012-06-02 00:40:01'),(2,'5','Sit libero qui rerum quia assumenda minus nobis. Rerum et amet nam aut veniam.','http://lorempixel.com/600/400/','1977-05-05 14:50:33','1993-05-05 19:12:15'),(3,'8','Nesciunt vel nihil magni architecto rerum. Quia quos fugiat maiores veniam aliquid.','http://lorempixel.com/600/400/','2005-06-08 12:56:50','2012-12-22 17:08:14'),(4,'6','Culpa aut laudantium vel. Odio alias doloremque non qui autem quis. Quae ut doloribus quia quia. Earum ipsum iusto voluptatibus consequatur aut porro.','http://lorempixel.com/600/400/','1996-08-02 07:09:16','1973-06-06 12:46:12'),(5,'1','Id saepe a est sit. Modi beatae qui dolore et in. Voluptas distinctio eum earum qui numquam soluta facere. Odio ullam blanditiis deleniti adipisci perspiciatis. Non aut est aut sed soluta.','http://lorempixel.com/600/400/','1989-09-12 03:34:57','2013-12-13 00:39:17'),(6,'','Repellendus similique sint molestiae sunt voluptas fugit. Culpa aliquid et animi temporibus magni eos est. Aliquid eveniet quasi recusandae debitis nesciunt. Maxime dolores eum ipsam quas ut nihil aperiam.','http://lorempixel.com/600/400/','1984-12-20 12:13:47','1995-09-17 16:47:35'),(7,'8','Ipsam modi hic itaque et numquam iste qui. Delectus rerum nobis cumque rem sed. Et maiores excepturi aut voluptatibus corrupti et ut eos. Libero dolor aperiam omnis voluptatum fugiat veritatis numquam. Incidunt illum tempore perspiciatis quis facilis','http://lorempixel.com/600/400/','2013-01-08 10:22:37','2012-05-14 22:56:53'),(8,'3','Exercitationem eius eum laborum expedita sit aliquid ex. Laboriosam odio dolorem earum. Dolor eaque sed velit corporis et necessitatibus amet et. Est dolores maiores nihil doloremque sed qui. Rerum consequatur omnis corporis molestiae possimus quae p','http://lorempixel.com/600/400/','2002-06-04 09:30:56','1989-12-02 07:53:44'),(9,'1','Totam ut et nobis iure tenetur iusto. Quidem nostrum aut blanditiis quasi officia mollitia natus ut. Provident sint qui id qui vel consequatur ut.','http://lorempixel.com/600/400/','1996-12-23 23:33:06','1971-04-27 15:24:58'),(10,'2','Accusamus eligendi repellendus aliquid dolores quia dolore sequi. Earum et qui provident quia qui. Doloremque et dolore et doloribus dolor totam.','http://lorempixel.com/600/400/','1978-03-21 01:48:53','2001-12-12 12:07:23');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `country_id_fk` FOREIGN KEY (`id`) REFERENCES `goods` (`country_origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Страны производители';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'China'),(2,'Germany'),(3,'India'),(4,'Russia'),(5,'Poland'),(6,'England'),(7,'Bangladesh'),(8,'Thailand'),(9,'Vietnam'),(10,'USA');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `brand_id` int(10) unsigned DEFAULT NULL COMMENT 'Брэнд',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'Категория',
  `sub_category_id` int(10) unsigned DEFAULT NULL COMMENT 'Подкатегория',
  `price` decimal(8,2) DEFAULT NULL COMMENT 'Цена',
  `amount` int(11) DEFAULT NULL COMMENT 'Количество на складе',
  `storehouses_id` int(10) unsigned DEFAULT NULL COMMENT 'Склад',
  `country_origin_id` int(10) unsigned DEFAULT NULL COMMENT 'Страна производства',
  PRIMARY KEY (`id`),
  KEY `storehouses_id` (`storehouses_id`),
  KEY `country_origin_id` (`country_origin_id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товары';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'impedit',1,13,1,125996.96,40,9,8),(2,'qui',2,1,2,87300.68,13,4,15),(3,'iure',3,19,3,125760.30,26,7,3),(4,'rem',4,10,4,148905.13,36,2,13),(5,'quas',5,18,5,63783.33,7,18,3),(6,'est',6,13,6,85639.79,33,3,2),(7,'dolor',7,8,7,124482.74,5,10,5),(8,'nihil',8,5,8,36646.69,44,9,5),(9,'recusandae',9,4,9,61939.96,43,16,3),(10,'recusandae',10,8,10,131471.24,2,4,12);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `orders_user_id_fk` (`user_id`),
  CONSTRAINT `orders_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2015-03-01 09:28:18','1972-07-17 05:58:34'),(2,2,'1989-06-14 05:23:12','1991-02-04 08:25:32'),(3,3,'1979-03-05 18:12:49','2002-10-09 13:53:35'),(4,4,'1997-03-02 15:40:08','1988-12-30 00:16:53'),(5,5,'2009-01-16 19:59:22','2000-03-02 06:40:40'),(6,6,'2018-01-26 11:25:40','1976-09-21 17:20:31'),(7,7,'2004-11-18 01:34:34','1996-09-01 14:48:32'),(8,8,'2007-09-18 14:12:34','2002-11-02 11:48:35'),(9,9,'1994-10-25 08:28:01','1990-04-26 09:23:11'),(10,10,'1988-04-23 23:38:48','2010-03-19 22:16:55');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `orders_id_fk` (`order_id`),
  KEY `product_id_fk` (`product_id`),
  CONSTRAINT `orders_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Состав заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,1,22,'1995-04-18 18:14:00','1978-08-30 05:51:42'),(2,2,2,3,'2012-11-24 15:33:06','1980-08-13 02:35:19'),(3,3,3,32,'1998-10-18 21:36:02','1999-05-15 12:04:56'),(4,4,4,13,'1981-03-07 10:50:21','1974-10-15 16:51:55'),(5,5,5,41,'1973-10-26 21:49:52','2013-12-30 16:05:51'),(6,6,6,37,'1986-03-29 16:10:19','1981-12-20 23:54:43'),(7,7,7,36,'2017-08-11 07:38:32','2019-09-12 05:47:40'),(8,8,8,45,'1996-03-10 03:46:59','2007-10-21 21:45:56'),(9,9,9,26,'2006-03-04 22:35:01','2017-02-16 14:14:41'),(10,10,10,32,'1995-08-05 04:23:30','2016-10-14 06:59:10');
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Телефон',
  `gender` enum('m','f','n') COLLATE utf8mb4_unicode_ci DEFAULT 'n' COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `city` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `address_delivery` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Адрес доставки',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `profiles_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Профили';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Sophie','Moen','9060450412','m','1979-05-10','West Paige','55','269 Jerde Inlet Apt. 412\nWest Eladiostad, UT 86041-6261','1999-11-08 08:42:18','2020-08-14 15:39:50'),(2,'Albina','Lind','9358529384','m','2018-12-14','Margueriteport','51','172 Vito Corners Suite 044\nEast Candidoberg, MO 48648','1978-09-23 13:21:35','1980-01-16 09:30:56'),(3,'Samanta','Labadie','9336939848','n','1972-12-17','North Marilie','5','1655 Lue Harbor\nNorth Janae, AL 38548-7093','1993-03-30 16:30:42','1989-04-25 22:55:25'),(4,'Marcos','Maggio','9190069606','n','1999-07-15','Merrittshire','26','7156 Lucinda Expressway\nPort Claudeview, PA 33539-9450','1982-09-12 22:10:22','2017-11-09 01:03:37'),(5,'Brook','Kulas','9103710665','f','2017-07-16','Trentfort','92','41089 Kessler Parkways Suite 318\nRussfort, GA 28561-9181','1975-11-20 02:41:18','2003-11-11 23:55:10'),(6,'Thalia','Hane','9331895753','m','1978-02-26','Lake Gastonland','54','525 Candelario Mission\nLemketown, MA 53273','1996-02-24 19:14:40','2008-02-12 14:55:53'),(7,'Nelda','Leffler','9287365421','f','2011-07-01','New Fay','72','998 Wilmer Landing Apt. 399\nWest Juvenal, TX 47081-6669','1991-02-08 07:09:03','1998-02-22 02:16:25'),(8,'Hershel','Metz','9214971740','f','1972-07-09','Skylafurt','28','0084 Willard Prairie Suite 281\nLake Ward, AK 45773-8196','1972-04-24 07:37:26','1999-05-31 03:15:21'),(9,'Zack','Watsica','9368622053','f','2004-07-05','Robbberg','8','431 Pansy Branch\nMadelynnshire, FL 36217-3488','1974-12-06 21:43:22','1975-02-06 09:46:45'),(10,'Mary','Lindgren','9117186804','n','2017-03-13','Lake Patricktown','31','3500 Marley Parkways\nReynabury, AL 06573','2018-09-10 04:04:24','1978-02-09 13:58:54');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `step` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `step_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Список этапов покупки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` VALUES (1,'Payment'),(2,'Packing'),(3,'Transfer'),(4,'Delivery');
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_list`
--

DROP TABLE IF EXISTS `storehouses_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses_list` (
  `id` int(10) unsigned NOT NULL,
  `storehouse_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `storehouses_id_fk` FOREIGN KEY (`id`) REFERENCES `goods` (`storehouses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Список складов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_list`
--

LOCK TABLES `storehouses_list` WRITE;
/*!40000 ALTER TABLE `storehouses_list` DISABLE KEYS */;
INSERT INTO `storehouses_list` VALUES (2,'dignissimos'),(3,'ab'),(7,'rerum'),(9,'omnis'),(10,'temporibus');
/*!40000 ALTER TABLE `storehouses_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `storehouses_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `storehouses_products_fk` (`storehouses_id`),
  CONSTRAINT `storehouses_products_fk` FOREIGN KEY (`storehouses_id`) REFERENCES `storehouses_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,2,1,26,'1989-04-18 00:12:49','2013-07-04 01:17:48'),(2,3,2,22,'1990-10-19 19:35:37','2013-09-15 15:16:37'),(3,7,3,29,'1976-12-21 16:45:30','1999-06-29 11:46:33'),(4,9,4,14,'1991-07-09 19:31:01','2014-07-10 01:07:26'),(5,10,5,29,'1972-02-01 00:07:14','2019-02-13 18:58:26'),(6,2,6,3,'1972-06-27 17:40:46','2009-08-15 08:53:57'),(7,3,7,21,'2004-04-05 03:47:01','2016-05-08 15:07:57'),(8,7,8,8,'2019-12-14 09:00:19','2017-07-09 02:26:12'),(9,9,9,7,'2019-12-22 14:17:46','2016-08-08 13:19:21'),(10,10,10,4,'2002-02-03 08:15:08','1999-05-12 03:43:52');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categorys`
--

DROP TABLE IF EXISTS `sub_categorys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_categorys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `short_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Enter description' COMMENT 'Короткое описание',
  `catalog_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `index_of_catalog_id` (`catalog_id`),
  CONSTRAINT `catalog_id_fk` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Подкатегории товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categorys`
--

LOCK TABLES `sub_categorys` WRITE;
/*!40000 ALTER TABLE `sub_categorys` DISABLE KEYS */;
INSERT INTO `sub_categorys` VALUES (1,'pillows_platforms','Enter description',1,'2021-10-16 19:28:48','2021-10-16 19:28:48'),(2,'covers_bags','Enter description',2,'2021-10-16 19:28:48','2021-10-16 19:28:48'),(3,'bricks_blocks','Enter description',3,'2021-10-16 19:28:48','2021-10-16 19:28:48'),(4,'blanckets_plaids','Enter description',4,'2021-10-16 19:28:48','2021-10-16 19:28:48'),(5,'belts_ropes','Enter description',5,'2021-10-16 19:28:48','2021-10-16 19:28:48'),(6,'wood_goods_chairs','Enter description',6,'2021-10-16 19:28:48','2021-10-16 19:28:48'),(7,'equipments','Enter description',7,'2021-10-16 19:28:48','2021-10-16 19:28:48'),(8,'bolsters','Enter description',8,'2021-10-16 19:28:48','2021-10-16 19:28:48'),(9,'hammoks','Enter description',9,'2021-10-16 19:28:48','2021-10-16 19:28:48'),(10,'YOGA_MATS','Enter description',10,'2021-10-16 19:28:48','2021-10-16 19:28:48');
/*!40000 ALTER TABLE `sub_categorys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Логин пользователя',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Почта',
  `avatar_blob_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Аватар',
  `created_at` datetime DEFAULT current_timestamp() COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hardy31','russel98@example.net','http://lorempixel.com/640/480/','2017-08-07 04:52:37','1970-12-22 18:43:04'),(2,'verdie79','amelia.lemke@example.org','http://lorempixel.com/640/480/','1998-09-07 00:31:23','1982-01-17 23:07:20'),(3,'rodrigo28','shemar72@example.net','http://lorempixel.com/640/480/','2012-07-12 13:19:21','2005-02-25 09:43:05'),(4,'cbrakus','brenna.o\'connell@example.com','http://lorempixel.com/640/480/','2017-09-07 01:42:23','1991-12-26 04:12:22'),(5,'millie22','tfranecki@example.net','http://lorempixel.com/640/480/','2018-06-30 09:41:26','1996-04-21 07:02:32'),(6,'uklocko','tremblay.adrienne@example.com','http://lorempixel.com/640/480/','2020-04-13 10:18:19','2000-01-25 00:21:59'),(7,'carissa37','courtney19@example.net','http://lorempixel.com/640/480/','1993-04-24 12:47:45','1998-05-12 07:36:13'),(8,'marquardt.willie','walsh.hannah@example.net','http://lorempixel.com/640/480/','1990-07-19 20:07:14','2005-11-19 20:08:16'),(9,'lhuel','huels.efrain@example.org','http://lorempixel.com/640/480/','1974-09-22 20:32:34','1984-11-05 14:22:16'),(10,'nkautzer','kira61@example.org','http://lorempixel.com/640/480/','2009-09-17 03:37:15','2002-08-31 08:44:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-16 19:50:33
