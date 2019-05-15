/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.21-MariaDB : Database - gate
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gate` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gate`;

/*Table structure for table `access` */

DROP TABLE IF EXISTS `access`;

CREATE TABLE `access` (
  `access_id` int(11) NOT NULL,
  `gate_id` int(11) DEFAULT NULL,
  `user_id` char(14) DEFAULT NULL,
  `access_open` int(11) DEFAULT NULL,
  `access_close` int(11) DEFAULT NULL,
  PRIMARY KEY (`access_id`),
  KEY `access_user_id` (`user_id`),
  KEY `access_gate_id` (`gate_id`),
  CONSTRAINT `access_gate_id` FOREIGN KEY (`gate_id`) REFERENCES `gate` (`gate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `access_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `access` */

insert  into `access`(`access_id`,`gate_id`,`user_id`,`access_open`,`access_close`) values (0,1,'ayam',NULL,NULL),(1,1,'5115100166',6,20),(2,1,'ayam',1,5);

/*Table structure for table `gate` */

DROP TABLE IF EXISTS `gate`;

CREATE TABLE `gate` (
  `gate_id` int(11) NOT NULL,
  `gate_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`gate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gate` */

insert  into `gate`(`gate_id`,`gate_name`) values (0,'0'),(1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9'),(10,'10');

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `gate_id` int(11) DEFAULT NULL,
  `user_id` char(14) DEFAULT NULL,
  `log_opened` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_gate_id` (`gate_id`),
  KEY `log_user_id` (`user_id`),
  CONSTRAINT `log_gate_id` FOREIGN KEY (`gate_id`) REFERENCES `gate` (`gate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `log_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `log` */

insert  into `log`(`log_id`,`gate_id`,`user_id`,`log_opened`) values (1,0,'5115100166','----'),(2,10,'ayam','ayam'),(3,1,'5115100166','Wed May 15 2019 15:16:14 GMT+0700 (Western Indonesia Time)'),(4,1,'5115100166','Wed May 15 2019 15:17:02 GMT+0700 (Western Indonesia Time)'),(5,1,'5115100166','Wed May 15 2019 15:18:17 GMT+0700 (Western Indonesia Time)'),(6,1,'5115100166','Wed May 15 2019 15:23:02 GMT+0700 (Western Indonesia Time)');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` char(14) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `user_pass` varchar(64) DEFAULT NULL,
  `user_group` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`user_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_pass`,`user_group`) values ('5115100166','Ivan','5115100166','mahasiswa'),('admin','admin','admin','mahasiswa'),('ayam','ayam','ayam','mahasiswa'),('upin','upin','upin','mahasiswa');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
