-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add brands',7,'add_brands'),(26,'Can change brands',7,'change_brands'),(27,'Can delete brands',7,'delete_brands'),(28,'Can view brands',7,'view_brands'),(29,'Can add categories',8,'add_categories'),(30,'Can change categories',8,'change_categories'),(31,'Can delete categories',8,'delete_categories'),(32,'Can view categories',8,'view_categories'),(33,'Can add customers',9,'add_customers'),(34,'Can change customers',9,'change_customers'),(35,'Can delete customers',9,'delete_customers'),(36,'Can view customers',9,'view_customers'),(37,'Can add products',10,'add_products'),(38,'Can change products',10,'change_products'),(39,'Can delete products',10,'delete_products'),(40,'Can view products',10,'view_products'),(41,'Can add store',11,'add_store'),(42,'Can change store',11,'change_store'),(43,'Can delete store',11,'delete_store'),(44,'Can view store',11,'view_store'),(45,'Can add staffs',12,'add_staffs'),(46,'Can change staffs',12,'change_staffs'),(47,'Can delete staffs',12,'delete_staffs'),(48,'Can view staffs',12,'view_staffs'),(49,'Can add orders',13,'add_orders'),(50,'Can change orders',13,'change_orders'),(51,'Can delete orders',13,'delete_orders'),(52,'Can view orders',13,'view_orders'),(53,'Can add stocks',14,'add_stocks'),(54,'Can change stocks',14,'change_stocks'),(55,'Can delete stocks',14,'delete_stocks'),(56,'Can view stocks',14,'view_stocks'),(57,'Can add order items',15,'add_orderitems'),(58,'Can change order items',15,'change_orderitems'),(59,'Can delete order items',15,'delete_orderitems'),(60,'Can view order items',15,'view_orderitems');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$ctmJhbCDIZmxT04qVH2PGG$bSPm2e2R+IgP8x6MdxYOsgj4Ph6idMt7yNLNkb+VEF0=','2021-09-10 20:01:48.304720',1,'vishnu','','','vishnu@gmail.com',1,1,'2021-09-10 20:01:25.412341');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-09-10 20:05:43.105436','1','<Store 1  shopnix>',1,'[{\"added\": {}}]',11,1),(2,'2021-09-10 20:07:41.544890','2','<Store 2  Ecom Express>',1,'[{\"added\": {}}]',11,1),(3,'2021-09-10 20:10:13.492509','1','<Staffs 1  vishnu>',1,'[{\"added\": {}}]',12,1),(4,'2021-09-10 20:10:47.681697','2','<Staffs 2  kartik>',1,'[{\"added\": {}}]',12,1),(5,'2021-09-10 20:12:36.558231','1','<Categories 1  Apps & Games>',1,'[{\"added\": {}}]',8,1),(6,'2021-09-10 20:12:53.613311','2','<Categories 2  Beauty & Personal Care>',1,'[{\"added\": {}}]',8,1),(7,'2021-09-10 20:13:04.064853','3','<Categories 3  Books>',1,'[{\"added\": {}}]',8,1),(8,'2021-09-10 20:13:18.834405','4','<Categories 4  Movies & TV>',1,'[{\"added\": {}}]',8,1),(9,'2021-09-10 20:13:32.699499','5','<Categories 5  Video Games>',1,'[{\"added\": {}}]',8,1),(10,'2021-09-10 20:13:51.126115','6','<Categories 6  Computers>',1,'[{\"added\": {}}]',8,1),(11,'2021-09-10 20:15:36.265304','1','<Brands 1  Sony>',1,'[{\"added\": {}}]',7,1),(12,'2021-09-10 20:15:48.805318','2','<Brands 2  Lux>',1,'[{\"added\": {}}]',7,1),(13,'2021-09-10 20:16:03.166965','3','<Brands 3  Tata Group>',1,'[{\"added\": {}}]',7,1),(14,'2021-09-10 20:16:15.525191','4','<Brands 4  Colgate>',1,'[{\"added\": {}}]',7,1),(15,'2021-09-10 20:16:27.899349','5','<Brands 5  Amul>',1,'[{\"added\": {}}]',7,1),(16,'2021-09-10 20:16:41.955365','6','<Brands 6  Apple>',1,'[{\"added\": {}}]',7,1),(17,'2021-09-10 20:17:01.751597','7','<Brands 7  Fair & Lovely>',1,'[{\"added\": {}}]',7,1),(18,'2021-09-10 20:17:12.719294','8','<Brands 8  LG>',1,'[{\"added\": {}}]',7,1),(19,'2021-09-10 20:17:32.682679','9','<Brands 9  Peter England>',1,'[{\"added\": {}}]',7,1),(20,'2021-09-10 20:18:06.578342','10','<Brands 10  Jaguar>',1,'[{\"added\": {}}]',7,1),(21,'2021-09-10 20:19:48.735727','7','<Categories 7  Smart Phone>',1,'[{\"added\": {}}]',8,1),(22,'2021-09-10 20:19:51.657156','1','<Products 1  Apple iPhone 12 Pro Max>',1,'[{\"added\": {}}]',10,1),(23,'2021-09-10 20:21:21.620123','1','Customers object (1)',1,'[{\"added\": {}}]',9,1),(24,'2021-09-10 20:22:16.581415','1','<Orders 1>',1,'[{\"added\": {}}]',13,1),(25,'2021-09-11 09:01:12.317987','1','<Stocks <Store 1  shopnix> <Products 1  Apple iPhone 12 Pro Max>>',1,'[{\"added\": {}}]',14,1),(26,'2021-09-11 10:26:39.808800','1','<OrderItems 1 <Orders 1>>',1,'[{\"added\": {}}]',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'ecommerceApp','brands'),(8,'ecommerceApp','categories'),(9,'ecommerceApp','customers'),(15,'ecommerceApp','orderitems'),(13,'ecommerceApp','orders'),(10,'ecommerceApp','products'),(12,'ecommerceApp','staffs'),(14,'ecommerceApp','stocks'),(11,'ecommerceApp','store'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-09-10 19:46:35.387782'),(2,'auth','0001_initial','2021-09-10 19:46:36.653356'),(3,'admin','0001_initial','2021-09-10 19:46:36.867527'),(4,'admin','0002_logentry_remove_auto_add','2021-09-10 19:46:36.881884'),(5,'admin','0003_logentry_add_action_flag_choices','2021-09-10 19:46:36.895186'),(6,'contenttypes','0002_remove_content_type_name','2021-09-10 19:46:37.023336'),(7,'auth','0002_alter_permission_name_max_length','2021-09-10 19:46:37.114392'),(8,'auth','0003_alter_user_email_max_length','2021-09-10 19:46:37.151878'),(9,'auth','0004_alter_user_username_opts','2021-09-10 19:46:37.164911'),(10,'auth','0005_alter_user_last_login_null','2021-09-10 19:46:37.251326'),(11,'auth','0006_require_contenttypes_0002','2021-09-10 19:46:37.256862'),(12,'auth','0007_alter_validators_add_error_messages','2021-09-10 19:46:37.268835'),(13,'auth','0008_alter_user_username_max_length','2021-09-10 19:46:37.342995'),(14,'auth','0009_alter_user_last_name_max_length','2021-09-10 19:46:37.432619'),(15,'auth','0010_alter_group_name_max_length','2021-09-10 19:46:37.469082'),(16,'auth','0011_update_proxy_permissions','2021-09-10 19:46:37.483448'),(17,'auth','0012_alter_user_first_name_max_length','2021-09-10 19:46:37.638982'),(18,'ecommerceApp','0001_initial','2021-09-10 19:46:39.659297'),(19,'sessions','0001_initial','2021-09-10 19:46:39.756074'),(20,'ecommerceApp','0002_alter_staffs_manager_id','2021-09-10 20:10:07.181885');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('yjyjn6iwcxiq1edttdxviqd9gzd7m27h','.eJxVjEEOwiAQRe_C2hCgDAWX7j0DgZnBVg0kpV0Z765NutDtf-_9l4hpW6e4dV7iTOIstDj9bjnhg-sO6J7qrUlsdV3mLHdFHrTLayN-Xg7372BKffrWjjWORoELJilE9ASZLeaByDE4MOCLLxYHBVAKaYOgiAOMgwk5gBXvD-xrN94:1mOmia:znDyvwzNr-UhyDY9n2z2Pw-an-SKvtmRtFZgAJ22B_s','2021-09-24 20:01:48.312381');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerceApp_brands`
--

DROP TABLE IF EXISTS `ecommerceApp_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerceApp_brands` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerceApp_brands`
--

LOCK TABLES `ecommerceApp_brands` WRITE;
/*!40000 ALTER TABLE `ecommerceApp_brands` DISABLE KEYS */;
INSERT INTO `ecommerceApp_brands` VALUES (1,'Sony'),(2,'Lux'),(3,'Tata Group'),(4,'Colgate'),(5,'Amul'),(6,'Apple'),(7,'Fair & Lovely'),(8,'LG'),(9,'Peter England'),(10,'Jaguar');
/*!40000 ALTER TABLE `ecommerceApp_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerceApp_categories`
--

DROP TABLE IF EXISTS `ecommerceApp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerceApp_categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerceApp_categories`
--

LOCK TABLES `ecommerceApp_categories` WRITE;
/*!40000 ALTER TABLE `ecommerceApp_categories` DISABLE KEYS */;
INSERT INTO `ecommerceApp_categories` VALUES (1,'Apps & Games'),(2,'Beauty & Personal Care'),(3,'Books'),(4,'Movies & TV'),(5,'Video Games'),(6,'Computers'),(7,'Smart Phone');
/*!40000 ALTER TABLE `ecommerceApp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerceApp_customers`
--

DROP TABLE IF EXISTS `ecommerceApp_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerceApp_customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerceApp_customers`
--

LOCK TABLES `ecommerceApp_customers` WRITE;
/*!40000 ALTER TABLE `ecommerceApp_customers` DISABLE KEYS */;
INSERT INTO `ecommerceApp_customers` VALUES (1,'vtu','thuletiya','8795678907','vtu@gmail.com','kishan nagar','Gandhinagar','GU','382026');
/*!40000 ALTER TABLE `ecommerceApp_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerceApp_orderitems`
--

DROP TABLE IF EXISTS `ecommerceApp_orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerceApp_orderitems` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `list_price` double NOT NULL,
  `discount` double NOT NULL,
  `order_id_id` int NOT NULL,
  `product_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerceApp_orderitems_item_id_order_id_id_ae67d95f_uniq` (`item_id`,`order_id_id`),
  KEY `ecommerceApp_orderit_order_id_id_2ca473c6_fk_ecommerce` (`order_id_id`),
  KEY `ecommerceApp_orderit_product_id_id_5eee8e95_fk_ecommerce` (`product_id_id`),
  CONSTRAINT `ecommerceApp_orderit_order_id_id_2ca473c6_fk_ecommerce` FOREIGN KEY (`order_id_id`) REFERENCES `ecommerceApp_orders` (`order_id`),
  CONSTRAINT `ecommerceApp_orderit_product_id_id_5eee8e95_fk_ecommerce` FOREIGN KEY (`product_id_id`) REFERENCES `ecommerceApp_products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerceApp_orderitems`
--

LOCK TABLES `ecommerceApp_orderitems` WRITE;
/*!40000 ALTER TABLE `ecommerceApp_orderitems` DISABLE KEYS */;
INSERT INTO `ecommerceApp_orderitems` VALUES (1,1,20,500,20,1,1);
/*!40000 ALTER TABLE `ecommerceApp_orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerceApp_orders`
--

DROP TABLE IF EXISTS `ecommerceApp_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerceApp_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_status` varchar(15) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `required_date` datetime(6) NOT NULL,
  `shipped_date` datetime(6) NOT NULL,
  `customer_id_id` int NOT NULL,
  `staff_id_id` int NOT NULL,
  `store_id_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `ecommerceApp_orders_customer_id_id_bd3138c8_fk_ecommerce` (`customer_id_id`),
  KEY `ecommerceApp_orders_staff_id_id_aed1855f_fk_ecommerce` (`staff_id_id`),
  KEY `ecommerceApp_orders_store_id_id_f7f64b8a_fk_ecommerce` (`store_id_id`),
  CONSTRAINT `ecommerceApp_orders_customer_id_id_bd3138c8_fk_ecommerce` FOREIGN KEY (`customer_id_id`) REFERENCES `ecommerceApp_customers` (`customer_id`),
  CONSTRAINT `ecommerceApp_orders_staff_id_id_aed1855f_fk_ecommerce` FOREIGN KEY (`staff_id_id`) REFERENCES `ecommerceApp_staffs` (`staff_id`),
  CONSTRAINT `ecommerceApp_orders_store_id_id_f7f64b8a_fk_ecommerce` FOREIGN KEY (`store_id_id`) REFERENCES `ecommerceApp_store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerceApp_orders`
--

LOCK TABLES `ecommerceApp_orders` WRITE;
/*!40000 ALTER TABLE `ecommerceApp_orders` DISABLE KEYS */;
INSERT INTO `ecommerceApp_orders` VALUES (1,'Processing','2021-09-10 20:21:52.000000','2021-09-10 20:21:58.000000','2021-09-10 20:22:00.000000',1,1,1),(2,'Pending','2021-09-10 20:21:52.000000','2021-09-10 20:21:58.000000','2021-09-10 20:22:00.000000',1,1,2);
/*!40000 ALTER TABLE `ecommerceApp_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerceApp_products`
--

DROP TABLE IF EXISTS `ecommerceApp_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerceApp_products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `model_year` int NOT NULL,
  `list_price` double NOT NULL,
  `brand_id_id` int NOT NULL,
  `category_id_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `ecommerceApp_product_brand_id_id_d5272cd4_fk_ecommerce` (`brand_id_id`),
  KEY `ecommerceApp_product_category_id_id_1255b684_fk_ecommerce` (`category_id_id`),
  CONSTRAINT `ecommerceApp_product_brand_id_id_d5272cd4_fk_ecommerce` FOREIGN KEY (`brand_id_id`) REFERENCES `ecommerceApp_brands` (`brand_id`),
  CONSTRAINT `ecommerceApp_product_category_id_id_1255b684_fk_ecommerce` FOREIGN KEY (`category_id_id`) REFERENCES `ecommerceApp_categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerceApp_products`
--

LOCK TABLES `ecommerceApp_products` WRITE;
/*!40000 ALTER TABLE `ecommerceApp_products` DISABLE KEYS */;
INSERT INTO `ecommerceApp_products` VALUES (1,'Apple iPhone 12 Pro Max',2019,100000,6,7);
/*!40000 ALTER TABLE `ecommerceApp_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerceApp_staffs`
--

DROP TABLE IF EXISTS `ecommerceApp_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerceApp_staffs` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `active` varchar(255) NOT NULL,
  `manager_id_id` int DEFAULT NULL,
  `store_id_id` int NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `ecommerceApp_staffs_store_id_id_eeccb2e8_fk_ecommerce` (`store_id_id`),
  KEY `ecommerceApp_staffs_manager_id_id_573eb7b0_fk_ecommerce` (`manager_id_id`),
  CONSTRAINT `ecommerceApp_staffs_manager_id_id_573eb7b0_fk_ecommerce` FOREIGN KEY (`manager_id_id`) REFERENCES `ecommerceApp_staffs` (`staff_id`),
  CONSTRAINT `ecommerceApp_staffs_store_id_id_eeccb2e8_fk_ecommerce` FOREIGN KEY (`store_id_id`) REFERENCES `ecommerceApp_store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerceApp_staffs`
--

LOCK TABLES `ecommerceApp_staffs` WRITE;
/*!40000 ALTER TABLE `ecommerceApp_staffs` DISABLE KEYS */;
INSERT INTO `ecommerceApp_staffs` VALUES (1,'vishnu','thuletiya','vishnu@gmail.com','9512545108','yes',NULL,1),(2,'kartik','jain','kartik@gmail.com','01234567890','yes',NULL,2);
/*!40000 ALTER TABLE `ecommerceApp_staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerceApp_stocks`
--

DROP TABLE IF EXISTS `ecommerceApp_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerceApp_stocks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id_id` int NOT NULL,
  `store_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ecommerceApp_stocks_store_id_id_product_id_id_d8cb860e_uniq` (`store_id_id`,`product_id_id`),
  KEY `ecommerceApp_stocks_product_id_id_c8bb9d9f_fk_ecommerce` (`product_id_id`),
  CONSTRAINT `ecommerceApp_stocks_product_id_id_c8bb9d9f_fk_ecommerce` FOREIGN KEY (`product_id_id`) REFERENCES `ecommerceApp_products` (`product_id`),
  CONSTRAINT `ecommerceApp_stocks_store_id_id_782e30e7_fk_ecommerce` FOREIGN KEY (`store_id_id`) REFERENCES `ecommerceApp_store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerceApp_stocks`
--

LOCK TABLES `ecommerceApp_stocks` WRITE;
/*!40000 ALTER TABLE `ecommerceApp_stocks` DISABLE KEYS */;
INSERT INTO `ecommerceApp_stocks` VALUES (1,10,1,1);
/*!40000 ALTER TABLE `ecommerceApp_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerceApp_store`
--

DROP TABLE IF EXISTS `ecommerceApp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerceApp_store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerceApp_store`
--

LOCK TABLES `ecommerceApp_store` WRITE;
/*!40000 ALTER TABLE `ecommerceApp_store` DISABLE KEYS */;
INSERT INTO `ecommerceApp_store` VALUES (1,'shopnix','888 07 888 13','support@shopnix.in','South End Road','Bangalore','Bangalore','560030'),(2,'Ecom Express','011 3021 2000','EcomExpress@support.com','Patel Narayan Ready Layout','Bengaluru','Bengaluru','560095');
/*!40000 ALTER TABLE `ecommerceApp_store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-11 21:26:12
