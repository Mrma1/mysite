/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.20 : Database - mysite
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mysite` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mysite`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add blog type',7,'add_blogtype'),(26,'Can change blog type',7,'change_blogtype'),(27,'Can delete blog type',7,'delete_blogtype'),(28,'Can view blog type',7,'view_blogtype'),(29,'Can add blog',8,'add_blog'),(30,'Can change blog',8,'change_blog'),(31,'Can delete blog',8,'delete_blog'),(32,'Can view blog',8,'view_blog'),(33,'Can add read num',9,'add_readnum'),(34,'Can change read num',9,'change_readnum'),(35,'Can delete read num',9,'delete_readnum'),(36,'Can view read num',9,'view_readnum'),(37,'Can add read detail',10,'add_readdetail'),(38,'Can change read detail',10,'change_readdetail'),(39,'Can delete read detail',10,'delete_readdetail'),(40,'Can view read detail',10,'view_readdetail'),(41,'Can add comment',11,'add_comment'),(42,'Can change comment',11,'change_comment'),(43,'Can delete comment',11,'delete_comment'),(44,'Can view comment',11,'view_comment');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$180000$uOcgxpdGt3CU$f9bzA9lTbM63XXaQREJHWlvtixiz4eoOY9bjojaxZOM=','2020-05-20 06:53:37.776000',1,'ma','','','',1,1,'2020-05-17 11:17:35.106000');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `blog_blog` */

DROP TABLE IF EXISTS `blog_blog`;

CREATE TABLE `blog_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_updated_time` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `blog_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_blog_author_id_8791af69_fk_auth_user_id` (`author_id`),
  KEY `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` (`blog_type_id`),
  CONSTRAINT `blog_blog_author_id_8791af69_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_blog_blog_type_id_de11bd65_fk_blog_blogtype_id` FOREIGN KEY (`blog_type_id`) REFERENCES `blog_blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blog_blog` */

insert  into `blog_blog`(`id`,`title`,`content`,`created_time`,`last_updated_time`,`author_id`,`blog_type_id`) values (1,'one','<p>asdasdasd</p>','2020-05-17 11:19:06.664000','2020-05-17 11:19:06.664000',1,1),(2,'asdasd','<p>asdasdasdas</p>','2020-05-17 11:19:12.516000','2020-05-17 11:19:12.516000',1,2),(3,'asdasda','<p>asdqweqwe</p>','2020-05-17 11:19:19.956000','2020-05-17 11:19:19.956000',1,2),(4,'asdasd','<p>asdasda</p>','2020-05-17 11:19:27.212000','2020-05-17 11:19:27.212000',1,2);

/*Table structure for table `blog_blogtype` */

DROP TABLE IF EXISTS `blog_blogtype`;

CREATE TABLE `blog_blogtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blog_blogtype` */

insert  into `blog_blogtype`(`id`,`blog_type`) values (1,'随笔'),(2,'django'),(3,'感悟');

/*Table structure for table `comment_comment` */

DROP TABLE IF EXISTS `comment_comment`;

CREATE TABLE `comment_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_comment_content_type_id_fbfb9793_fk_django_co` (`content_type_id`),
  KEY `comment_comment_user_id_6078e57b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_comment_content_type_id_fbfb9793_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comment_comment_user_id_6078e57b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `comment_comment` */

insert  into `comment_comment`(`id`,`object_id`,`content`,`comment_time`,`content_type_id`,`user_id`) values (1,4,'213','2020-05-20 07:20:08.302000',8,1),(2,4,'213','2020-05-20 07:22:09.840000',8,1),(3,4,'213','2020-05-20 07:31:51.655000',8,1),(4,4,'123','2020-05-20 07:31:54.817000',8,1),(5,3,'123','2020-05-20 07:37:16.084000',8,1),(6,4,'222222','2020-05-20 07:42:52.036000',8,1),(7,4,'12333333','2020-05-20 16:00:59.497000',8,1);

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2020-05-17 11:18:42.608000','1','随笔',1,'[{\"added\": {}}]',7,1),(2,'2020-05-17 11:18:46.111000','2','django',1,'[{\"added\": {}}]',7,1),(3,'2020-05-17 11:18:49.471000','3','感悟',1,'[{\"added\": {}}]',7,1),(4,'2020-05-17 11:19:06.666000','1','<Blogs%s> % self.title',1,'[{\"added\": {}}]',8,1),(5,'2020-05-17 11:19:12.518000','2','<Blogs%s> % self.title',1,'[{\"added\": {}}]',8,1),(6,'2020-05-17 11:19:19.958000','3','<Blogs%s> % self.title',1,'[{\"added\": {}}]',8,1),(7,'2020-05-17 11:19:27.214000','4','<Blogs%s> % self.title',1,'[{\"added\": {}}]',8,1),(8,'2020-05-17 11:28:31.525000','1','ReadDetail object (1)',1,'[{\"added\": {}}]',10,1),(9,'2020-05-18 11:12:51.021000','2','ReadDetail object (2)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(10,'2020-05-19 08:12:44.303000','4','ReadNum object (4)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',9,1),(11,'2020-05-19 08:12:47.958000','3','ReadNum object (3)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',9,1),(12,'2020-05-19 08:12:51.973000','1','ReadNum object (1)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',9,1),(13,'2020-05-19 08:13:02.259000','4','ReadDetail object (4)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(14,'2020-05-19 08:13:07.006000','2','ReadDetail object (2)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(15,'2020-05-19 08:13:18.126000','1','ReadDetail object (1)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(16,'2020-05-19 09:53:51.983000','5','ReadDetail object (5)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(17,'2020-05-19 09:55:00.384000','1','ReadDetail object (1)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(18,'2020-05-19 09:56:23.046000','6','ReadDetail object (6)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(19,'2020-05-19 09:58:21.480000','6','ReadDetail object (6)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(20,'2020-05-19 09:58:25.681000','5','ReadDetail object (5)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(21,'2020-05-19 09:58:30.760000','4','ReadDetail object (4)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(22,'2020-05-19 09:58:36.079000','1','ReadDetail object (1)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1),(23,'2020-05-19 09:58:49.832000','4','ReadNum object (4)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',9,1),(24,'2020-05-19 09:58:53.599000','3','ReadNum object (3)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',9,1),(25,'2020-05-19 09:58:57.231000','1','ReadNum object (1)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',9,1),(26,'2020-05-19 10:15:09.991000','7','ReadDetail object (7)',2,'[{\"changed\": {\"fields\": [\"Read num\"]}}]',10,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'blog','blog'),(7,'blog','blogtype'),(11,'comment','comment'),(5,'contenttypes','contenttype'),(10,'read_statist','readdetail'),(9,'read_statist','readnum'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2020-05-21 19:23:07.005107'),(2,'auth','0001_initial','2020-05-21 19:23:08.177291'),(3,'admin','0001_initial','2020-05-21 19:23:08.631612'),(4,'admin','0002_logentry_remove_auto_add','2020-05-21 19:23:08.661694'),(5,'contenttypes','0002_remove_content_type_name','2020-05-21 19:23:08.825162'),(6,'auth','0002_alter_permission_name_max_length','2020-05-21 19:23:08.937453'),(7,'auth','0003_alter_user_email_max_length','2020-05-21 19:23:08.975662'),(8,'auth','0004_alter_user_username_opts','2020-05-21 19:23:08.987790'),(9,'auth','0005_alter_user_last_login_null','2020-05-21 19:23:09.094105'),(10,'auth','0006_require_contenttypes_0002','2020-05-21 19:23:09.099120'),(11,'auth','0007_alter_validators_add_error_messages','2020-05-21 19:23:09.110115'),(12,'auth','0008_alter_user_username_max_length','2020-05-21 19:23:09.370667'),(13,'auth','0009_alter_user_last_name_max_length','2020-05-21 19:23:09.512574'),(14,'blog','0001_initial','2020-05-21 19:23:09.945318'),(15,'comment','0001_initial','2020-05-21 19:23:10.202392'),(16,'comment','0002_auto_20200521_1206','2020-05-21 19:23:10.218466'),(17,'read_statist','0001_initial','2020-05-21 19:23:10.368834'),(18,'read_statist','0002_readdetail','2020-05-21 19:23:10.537281'),(19,'sessions','0001_initial','2020-05-21 19:23:10.673644');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('0cgkof0jvmufs1wne7ci9yeyw0heq855','M2MyNWU1ZGUwZjliYTZlY2M5MTNiYTZkNmZlYWVhNDQxZjI5MDk4ZTp7fQ==','2020-06-03 06:25:54.561000'),('58uts6qj5bsfssxzyc3ntyvjjiuhirtj','NWQ1ZjQzMmJhNjI2Mzc4MzVmM2Y2NDJmMWM1ODBhMThmYmE4OTkwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMTYwODE1ZWUxYWNjN2Q3MWYwYjU2ZTU3NGNlNjkxZDYzZDVmYmUxIn0=','2020-06-01 11:12:06.442000'),('ayrlpuc90svtx3dekcx0n3blutizjk8r','NWQ1ZjQzMmJhNjI2Mzc4MzVmM2Y2NDJmMWM1ODBhMThmYmE4OTkwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMTYwODE1ZWUxYWNjN2Q3MWYwYjU2ZTU3NGNlNjkxZDYzZDVmYmUxIn0=','2020-06-03 06:53:37.782000'),('jgapkkgxyrre121npczghtnwyps2munn','NWQ1ZjQzMmJhNjI2Mzc4MzVmM2Y2NDJmMWM1ODBhMThmYmE4OTkwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMTYwODE1ZWUxYWNjN2Q3MWYwYjU2ZTU3NGNlNjkxZDYzZDVmYmUxIn0=','2020-05-31 11:17:56.680000'),('sf2bknmotnpllzy9lwd6j7fhiw5z088e','NWQ1ZjQzMmJhNjI2Mzc4MzVmM2Y2NDJmMWM1ODBhMThmYmE4OTkwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMTYwODE1ZWUxYWNjN2Q3MWYwYjU2ZTU3NGNlNjkxZDYzZDVmYmUxIn0=','2020-06-02 08:12:10.785000'),('tmv68vlb3reukljsyvfuawvu7174fxd7','NWQ1ZjQzMmJhNjI2Mzc4MzVmM2Y2NDJmMWM1ODBhMThmYmE4OTkwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMTYwODE1ZWUxYWNjN2Q3MWYwYjU2ZTU3NGNlNjkxZDYzZDVmYmUxIn0=','2020-06-02 09:52:25.040000');

/*Table structure for table `my_cache_table` */

DROP TABLE IF EXISTS `my_cache_table`;

CREATE TABLE `my_cache_table` (
  `cache_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  PRIMARY KEY (`cache_key`),
  KEY `my_cache_table_expires` (`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `my_cache_table` */

insert  into `my_cache_table`(`cache_key`,`value`,`expires`) values (':1:week_hot_data','gAWVfgoAAAAAAACMFmRqYW5nby5kYi5tb2RlbHMucXVlcnmUjAhRdWVyeVNldJSTlCmBlH2UKIwFbW9kZWyUjAtibG9nLm1vZGVsc5SMBEJsb2eUk5SMA19kYpROjAZfaGludHOUfZSMBXF1ZXJ5lIwaZGphbmdvLmRiLm1vZGVscy5zcWwucXVlcnmUjAVRdWVyeZSTlCmBlH2UKGgFaAiMDmFsaWFzX3JlZmNvdW50lH2UKIwJYmxvZ19ibG9nlEsEjBdyZWFkX3N0YXRpc3RfcmVhZGRldGFpbJRLA3WMCWFsaWFzX21hcJSMC2NvbGxlY3Rpb25zlIwLT3JkZXJlZERpY3SUk5QpUpQoaBSMI2RqYW5nby5kYi5tb2RlbHMuc3FsLmRhdGFzdHJ1Y3R1cmVzlIwJQmFzZVRhYmxllJOUKYGUfZQojAp0YWJsZV9uYW1llGgUjAt0YWJsZV9hbGlhc5RoFHViaBVoG4wESm9pbpSTlCmBlH2UKGggaBWMDHBhcmVudF9hbGlhc5RoFGghaBWMCWpvaW5fdHlwZZSMCklOTkVSIEpPSU6UjAlqb2luX2NvbHOUjAJpZJSMCW9iamVjdF9pZJSGlIWUjApqb2luX2ZpZWxklIwiZGphbmdvLmNvbnRyaWIuY29udGVudHR5cGVzLmZpZWxkc5SMCkdlbmVyaWNSZWyUk5QpgZR9lCiMBWZpZWxklIwXZGphbmdvLmRiLm1vZGVscy5maWVsZHOUjAtfbG9hZF9maWVsZJSTlIwEYmxvZ5RoB4wMcmVhZF9kZXRhaWxzlIeUUpRoBYwTcmVhZF9zdGF0aXN0Lm1vZGVsc5SMClJlYWREZXRhaWyUk5SMDHJlbGF0ZWRfbmFtZZSMASuUjBJyZWxhdGVkX3F1ZXJ5X25hbWWUTowQbGltaXRfY2hvaWNlc190b5R9lIwLcGFyZW50X2xpbmuUiYwJb25fZGVsZXRllIwZZGphbmdvLmRiLm1vZGVscy5kZWxldGlvbpSMCkRPX05PVEhJTkeUk5SMC3N5bW1ldHJpY2FslImMCG11bHRpcGxllIh1YowIbnVsbGFibGWUiIwRZmlsdGVyZWRfcmVsYXRpb26UTnVidYwQZXh0ZXJuYWxfYWxpYXNlc5SPlIwJdGFibGVfbWFwlH2UKGgUXZRoFGFoFV2UaBVhdYwMZGVmYXVsdF9jb2xzlImMEGRlZmF1bHRfb3JkZXJpbmeUiIwRc3RhbmRhcmRfb3JkZXJpbmeUiIwMdXNlZF9hbGlhc2VzlI+UjBBmaWx0ZXJfaXNfc3RpY2t5lImMCHN1YnF1ZXJ5lImMBnNlbGVjdJSMHGRqYW5nby5kYi5tb2RlbHMuZXhwcmVzc2lvbnOUjANDb2yUk5QpgZR9lCiMEV9jb25zdHJ1Y3Rvcl9hcmdzlGgUaDdoOGgHaCqHlFKUhpR9lIaUjAxvdXRwdXRfZmllbGSUaGKMBWFsaWFzlGgUjAZ0YXJnZXSUaGJ1YmhdKYGUfZQoaGBoFGg3aDhoB4wFdGl0bGWUh5RSlIaUfZSGlGhmaG1oZ2gUaGhobXVihpSMBXdoZXJllIwaZGphbmdvLmRiLm1vZGVscy5zcWwud2hlcmWUjAlXaGVyZU5vZGWUk5QpgZR9lCiMCGNoaWxkcmVulF2UKIwYZGphbmdvLmRiLm1vZGVscy5sb29rdXBzlIwITGVzc1RoYW6Uk5QpgZR9lCiMA2xoc5RoXSmBlH2UKGhgaBVoN4wMcmVhZF9zdGF0aXN0lGg9jARkYXRllIeUUpSGlH2UhpRoZmiFaGdoFWhoaIWMEmNvbnRhaW5zX2FnZ3JlZ2F0ZZSJdWKMA3Joc5SMCGRhdGV0aW1llIwEZGF0ZZSTlEMEB+QFFpSFlFKUjBRiaWxhdGVyYWxfdHJhbnNmb3Jtc5RdlGiJiXViaHqMEkdyZWF0ZXJUaGFuT3JFcXVhbJSTlCmBlH2UKGh/aIBoimiNQwQH5AUPlIWUUpRokV2UaImJdWJljAljb25uZWN0b3KUjANBTkSUjAduZWdhdGVklIloiYl1YowLd2hlcmVfY2xhc3OUaHWMCGdyb3VwX2J5lGheaGmGlIwIb3JkZXJfYnmUjA0tcmVhZF9udW1fc3VtlIWUjAhsb3dfbWFya5RLAIwJaGlnaF9tYXJrlEsHjAhkaXN0aW5jdJSJjA9kaXN0aW5jdF9maWVsZHOUKYwRc2VsZWN0X2Zvcl91cGRhdGWUiYwYc2VsZWN0X2Zvcl91cGRhdGVfbm93YWl0lImMHXNlbGVjdF9mb3JfdXBkYXRlX3NraXBfbG9ja2VklImMFHNlbGVjdF9mb3JfdXBkYXRlX29mlCmMDnNlbGVjdF9yZWxhdGVklImMCW1heF9kZXB0aJRLBYwNdmFsdWVzX3NlbGVjdJRoKmhrhpSMDF9hbm5vdGF0aW9uc5RoGSlSlIwMcmVhZF9udW1fc3VtlIwbZGphbmdvLmRiLm1vZGVscy5hZ2dyZWdhdGVzlIwDU3VtlJOUKYGUfZQoaGCMFnJlYWRfZGV0YWlsc19fcmVhZF9udW2UhZR9lIaUjAZmaWx0ZXKUTowSc291cmNlX2V4cHJlc3Npb25zlF2UaF0pgZR9lChoYGgVaDdogmg9jAhyZWFkX251bZSHlFKUhpR9lIaUaGZow2hnaBVoaGjDjBVfb3V0cHV0X2ZpZWxkX29yX25vbmWUaMNoiYl1YmGMBWV4dHJhlH2UjAppc19zdW1tYXJ5lIloZmjDdWJzjBZhbm5vdGF0aW9uX3NlbGVjdF9tYXNrlI+UKGiykIwYX2Fubm90YXRpb25fc2VsZWN0X2NhY2hllGgZKVKUaLJotnOMCmNvbWJpbmF0b3KUTowOY29tYmluYXRvcl9hbGyUiYwQY29tYmluZWRfcXVlcmllc5QpjAZfZXh0cmGUTowRZXh0cmFfc2VsZWN0X21hc2uUj5SME19leHRyYV9zZWxlY3RfY2FjaGWUTowMZXh0cmFfdGFibGVzlCmMDmV4dHJhX29yZGVyX2J5lCmMEGRlZmVycmVkX2xvYWRpbmeUKJGUiIaUjBNfZmlsdGVyZWRfcmVsYXRpb25zlH2UjA1fbG9va3VwX2pvaW5zlF2UKGgUaBVljApiYXNlX3RhYmxllGgUdWKMDV9yZXN1bHRfY2FjaGWUXZQofZQoaCpLBGhrjAZhc2Rhc2SUaLJLA3V9lChoKksDaGuMB2FzZGFzZGGUaLJLA3V9lChoKksBaGuMA29uZZRosksCdX2UKGgqSwJoa4wGYXNkYXNklGiySwJ1ZYwOX3N0aWNreV9maWx0ZXKUiYwKX2Zvcl93cml0ZZSJjBlfcHJlZmV0Y2hfcmVsYXRlZF9sb29rdXBzlCmMDl9wcmVmZXRjaF9kb25llImMFl9rbm93bl9yZWxhdGVkX29iamVjdHOUfZSMD19pdGVyYWJsZV9jbGFzc5RoAIwOVmFsdWVzSXRlcmFibGWUk5SMB19maWVsZHOUaCpoa4aUjA9fZGphbmdvX3ZlcnNpb26UjAMyLjCUdWIu','2020-05-22 11:07:06.000000');

/*Table structure for table `read_statist_readdetail` */

DROP TABLE IF EXISTS `read_statist_readdetail`;

CREATE TABLE `read_statist_readdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `read_num` int NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statist_readdet_content_type_id_7ff75e54_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statist_readdet_content_type_id_7ff75e54_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `read_statist_readdetail` */

insert  into `read_statist_readdetail`(`id`,`date`,`read_num`,`object_id`,`content_type_id`) values (1,'2020-05-17',1,1,8),(2,'2020-05-17',1,2,8),(3,'2020-05-18',1,4,8),(4,'2020-05-19',1,4,8),(5,'2020-05-19',1,2,8),(6,'2020-05-19',1,1,8),(7,'2020-05-19',2,3,8),(8,'2020-05-20',1,4,8),(9,'2020-05-20',1,3,8);

/*Table structure for table `read_statist_readnum` */

DROP TABLE IF EXISTS `read_statist_readnum`;

CREATE TABLE `read_statist_readnum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `read_num` int NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `read_statist_readnum_content_type_id_f0e278aa_fk_django_co` (`content_type_id`),
  CONSTRAINT `read_statist_readnum_content_type_id_f0e278aa_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `read_statist_readnum` */

insert  into `read_statist_readnum`(`id`,`read_num`,`object_id`,`content_type_id`) values (1,2,4,8),(2,3,3,8),(3,1,2,8),(4,1,1,8);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
