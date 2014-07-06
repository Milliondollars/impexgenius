/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.14 : Database - impgen
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`impgen` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `impgen`;

/*Table structure for table `tbl_category` */

DROP TABLE IF EXISTS `tbl_category`;

CREATE TABLE `tbl_category` (
  `category_id` varchar(5) NOT NULL COMMENT 'unique id of the category',
  `category_name` varchar(100) NOT NULL COMMENT 'Name of the category',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_category` */

insert  into `tbl_category`(`category_id`,`category_name`) values ('CG001','Shampoos and Conditioners'),('CG002','Soaps '),('CG003','Perfumes and Deodourants'),('CG004','Mens Grooming'),('CG005','Hair Oils'),('CG006','Oral Care'),('CG007','Skin Care');

/*Table structure for table `tbl_dealer` */

DROP TABLE IF EXISTS `tbl_dealer`;

CREATE TABLE `tbl_dealer` (
  `dealer_id` varchar(5) NOT NULL,
  `dealer_name` varchar(100) NOT NULL,
  `dealer_addr` varchar(200) NOT NULL,
  `dealer_email` varchar(50) DEFAULT NULL,
  `dealer_phone` int(11) unsigned DEFAULT NULL,
  `dealer_misc` varchar(100) DEFAULT NULL,
  `dealer_type_id` char(1) NOT NULL,
  `dealer_ctry_code` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`dealer_id`),
  KEY `dealer_type_dealer_map` (`dealer_type_id`),
  CONSTRAINT `dealer_type_dealer_map` FOREIGN KEY (`dealer_type_id`) REFERENCES `tbl_dealer_type` (`dealer_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dealer` */

insert  into `tbl_dealer`(`dealer_id`,`dealer_name`,`dealer_addr`,`dealer_email`,`dealer_phone`,`dealer_misc`,`dealer_type_id`,`dealer_ctry_code`) values ('DL001','Mustafa','Syed Alwi Road','mustafa@mustafa.com',66665555,NULL,'A',65),('DL002','Karthik','Yishun','karthik@milliondollars.com',11112222,NULL,'B',65),('DL003','Sreeram','Bedok','sreeram@milliondollars.com',33334444,NULL,'S',65),('DL004','Shyamala','Tuticorin','shyamala@milliondollars.com',55555555,NULL,'A',91),('DL005','Mridula','Sengkang','mridula@milliondollars.com',66666666,NULL,'B',65),('DL006','Nithya','Sengkang','nithya@milliondollars.com',11111111,NULL,'S',65);

/*Table structure for table `tbl_dealer_type` */

DROP TABLE IF EXISTS `tbl_dealer_type`;

CREATE TABLE `tbl_dealer_type` (
  `dealer_type_id` char(1) NOT NULL,
  `dealer_type` varchar(10) NOT NULL,
  PRIMARY KEY (`dealer_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dealer_type` */

insert  into `tbl_dealer_type`(`dealer_type_id`,`dealer_type`) values ('A','Buyer/Sell'),('B','Buyer'),('S','Seller');

/*Table structure for table `tbl_prod_categ_map` */

DROP TABLE IF EXISTS `tbl_prod_categ_map`;

CREATE TABLE `tbl_prod_categ_map` (
  `product_id` varchar(5) NOT NULL,
  `category_id` varchar(5) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_constraint` (`category_id`),
  CONSTRAINT `category_constraint` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`Category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_constraint` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_prod_categ_map` */

insert  into `tbl_prod_categ_map`(`product_id`,`category_id`) values ('PD101','CG001'),('PD102','CG001'),('PD103','CG002'),('PD104','CG002'),('PD107','CG003'),('PD108','CG003'),('PD111','CG004'),('PD112','CG004'),('PD113','CG005'),('PD114','CG005'),('PD105','CG006'),('PD106','CG006'),('PD109','CG007'),('PD110','CG007');

/*Table structure for table `tbl_product` */

DROP TABLE IF EXISTS `tbl_product`;

CREATE TABLE `tbl_product` (
  `product_id` varchar(5) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_desc` varchar(200) DEFAULT NULL,
  `product_stock` int(10) unsigned DEFAULT NULL,
  `dealer_id` varchar(5) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `dealer_product_key` (`dealer_id`),
  CONSTRAINT `dealer_product_key` FOREIGN KEY (`dealer_id`) REFERENCES `tbl_dealer` (`dealer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_product` */

insert  into `tbl_product`(`product_id`,`product_name`,`product_desc`,`product_stock`,`dealer_id`) values ('PD101','Dove Anti Hair Fall Shampoo',NULL,NULL,'DL001'),('PD102','Dove Anti Hairfall Conditioner',NULL,NULL,'DL004'),('PD103','Himalaya Soap',NULL,NULL,'DL002'),('PD104','Hamam Soap',NULL,NULL,'DL003'),('PD105','Oral B toothpaste',NULL,NULL,'DL001'),('PD106','ORAL B Tooth Brush',NULL,NULL,'DL002'),('PD107','AXE Deos',NULL,NULL,'DL003'),('PD108','Impulse',NULL,NULL,'DL004'),('PD109','Vasaline Petro Jelly',NULL,NULL,'DL001'),('PD110','Nivea hydra cream\'',NULL,NULL,'DL002'),('PD111','Denim After Shave lotion',NULL,NULL,'DL003'),('PD112','Gillette Razor',NULL,NULL,'DL005'),('PD113','Ashwini Hair oil',NULL,NULL,'DL006'),('PD114','Parachute hair cream',NULL,NULL,'DL006');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
