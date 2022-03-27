/*
SQLyog Ultimate v10.42 
MySQL - 5.5.34 : Database - cargo_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `cargo_db`;

/*Table structure for table `tm_agent` */

DROP TABLE IF EXISTS `tm_agent`;

CREATE TABLE `tm_agent` (
  `ckdagent` varchar(30) NOT NULL,
  `vnmagent` varchar(200) DEFAULT NULL,
  `valamat` text,
  `ckdnegara` varchar(3) DEFAULT NULL,
  `ckdkota` varchar(10) DEFAULT NULL,
  `ckodepos` varchar(10) DEFAULT NULL,
  `ctelp` varchar(20) DEFAULT NULL,
  `cfax` varchar(20) DEFAULT NULL,
  `cemail` varchar(200) DEFAULT NULL,
  `cwebsite` varchar(200) DEFAULT NULL,
  `ckontak` varchar(200) DEFAULT NULL,
  `cleveltarif` int(11) DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdagent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_agent` */

insert  into `tm_agent`(`ckdagent`,`vnmagent`,`valamat`,`ckdnegara`,`ckdkota`,`ckodepos`,`ctelp`,`cfax`,`cemail`,`cwebsite`,`ckontak`,`cleveltarif`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('00002/AGN-JKT/11/14','RIDWAN','pamulang','IDR','JKT','','','','','','',1,NULL,'ADMIN','2014-11-08 23:09:48','ADMIN','2014-11-13 00:29:16');

/*Table structure for table `tm_bandara` */

DROP TABLE IF EXISTS `tm_bandara`;

CREATE TABLE `tm_bandara` (
  `ckdbandara` varchar(5) NOT NULL,
  `vnmbandara` varchar(200) DEFAULT NULL,
  `ckdnegara` varchar(3) DEFAULT NULL,
  `ckdkota` varchar(10) DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdbandara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_bandara` */

insert  into `tm_bandara`(`ckdbandara`,`vnmbandara`,`ckdnegara`,`ckdkota`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('CGK','CENGKARENG','IDR','JKT',NULL,'ADMIN','2014-11-08 01:18:35','ADMIN','2014-11-08 01:18:35');

/*Table structure for table `tm_biayaadd` */

DROP TABLE IF EXISTS `tm_biayaadd`;

CREATE TABLE `tm_biayaadd` (
  `ckdcurrency` varchar(3) NOT NULL,
  `vbiayaadmsmu` double DEFAULT NULL,
  `vbiayalain` double DEFAULT NULL,
  `vppn` double DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdcurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_biayaadd` */

insert  into `tm_biayaadd`(`ckdcurrency`,`vbiayaadmsmu`,`vbiayalain`,`vppn`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('IDR',10000,50000,10,NULL,'ADMIN','2014-11-09 00:36:54','ADMIN','2014-11-20 23:27:51'),('USD',1,5,10,NULL,'ADMIN','2014-11-09 00:40:23','ADMIN','2014-11-09 00:40:23');

/*Table structure for table `tm_bulan` */

DROP TABLE IF EXISTS `tm_bulan`;

CREATE TABLE `tm_bulan` (
  `cbulan` int(11) DEFAULT NULL,
  `cbulanstr` varchar(2) DEFAULT NULL,
  `vnmbulan` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_bulan` */

insert  into `tm_bulan`(`cbulan`,`cbulanstr`,`vnmbulan`) values (1,'01','January'),(2,'02','February'),(3,'03','March'),(4,'04','April'),(5,'05','May'),(6,'06','June'),(7,'07','July'),(8,'08','August'),(9,'09','September'),(10,'10','October'),(11,'11','November'),(12,'12','December');

/*Table structure for table `tm_currency` */

DROP TABLE IF EXISTS `tm_currency`;

CREATE TABLE `tm_currency` (
  `ckdcurrency` varchar(3) NOT NULL,
  `vnmcurrency` varchar(50) DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdcurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_currency` */

insert  into `tm_currency`(`ckdcurrency`,`vnmcurrency`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('IDR','RUPIAH',NULL,'ADMIN','2014-11-08 22:43:18','ADMIN','2014-11-08 22:43:18'),('USD','US DOLLAR',NULL,'ADMIN','2014-11-08 22:44:13','ADMIN','2014-11-08 22:44:13');

/*Table structure for table `tm_dept` */

DROP TABLE IF EXISTS `tm_dept`;

CREATE TABLE `tm_dept` (
  `cKdDept` varchar(3) NOT NULL,
  `vNmDept` varchar(50) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cKdDept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_dept` */

insert  into `tm_dept`(`cKdDept`,`vNmDept`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('MIS','MIS','admin','2014-06-16 10:06:48','admin','2014-06-16 10:06:48');

/*Table structure for table `tm_entity` */

DROP TABLE IF EXISTS `tm_entity`;

CREATE TABLE `tm_entity` (
  `ckdentity` varchar(3) NOT NULL,
  `vnmentity` varchar(100) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdentity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_entity` */

/*Table structure for table `tm_jenissetor` */

DROP TABLE IF EXISTS `tm_jenissetor`;

CREATE TABLE `tm_jenissetor` (
  `ckdjenissetor` varchar(3) NOT NULL,
  `vnmjenissetor` varchar(100) DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdjenissetor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_jenissetor` */

insert  into `tm_jenissetor`(`ckdjenissetor`,`vnmjenissetor`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('TN','TUNAI',NULL,'ADMIN','2014-11-08 22:33:08','ADMIN','2014-11-08 22:33:08'),('TR','TRANSFER',NULL,'ADMIN','2014-11-08 22:33:35','ADMIN','2014-11-08 22:33:35');

/*Table structure for table `tm_komoditi` */

DROP TABLE IF EXISTS `tm_komoditi`;

CREATE TABLE `tm_komoditi` (
  `ckdkomoditi` varchar(3) NOT NULL,
  `vnmkomoditi` varchar(100) DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdkomoditi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_komoditi` */

insert  into `tm_komoditi`(`ckdkomoditi`,`vnmkomoditi`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('GNR','GENERAL',NULL,'ADMIN','2014-11-08 23:03:20','ADMIN','2014-11-08 23:03:20');

/*Table structure for table `tm_kota` */

DROP TABLE IF EXISTS `tm_kota`;

CREATE TABLE `tm_kota` (
  `ckdkota` varchar(10) NOT NULL,
  `vnmkota` varchar(100) DEFAULT NULL,
  `vnmprovisi` varchar(100) DEFAULT NULL,
  `ckdnegara` varchar(3) DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdkota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_kota` */

insert  into `tm_kota`(`ckdkota`,`vnmkota`,`vnmprovisi`,`ckdnegara`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('JKT','JAKARTA','DKI JAKARTA','IDR',NULL,'ADMIN','2014-11-06 22:56:42','ADMIN','2014-11-06 22:56:42'),('SBY','SURABAYA','JAWA TIMUR','IDR',NULL,'ADMIN','2014-11-07 22:29:25','ADMIN','2014-11-07 22:29:25'),('SMG','SEMARANG','JAWA TENGAH','IDR',NULL,'ADMIN','2014-11-07 22:32:31','ADMIN','2014-11-07 22:32:31');

/*Table structure for table `tm_negara` */

DROP TABLE IF EXISTS `tm_negara`;

CREATE TABLE `tm_negara` (
  `ckdnegara` varchar(3) NOT NULL,
  `vnmnegara` varchar(100) DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdnegara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_negara` */

insert  into `tm_negara`(`ckdnegara`,`vnmnegara`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('IDR','INDONESIA',NULL,'ADMIN','2014-11-06 22:32:37','ADMIN','2014-11-06 22:32:37');

/*Table structure for table `tm_param` */

DROP TABLE IF EXISTS `tm_param`;

CREATE TABLE `tm_param` (
  `cmindeposit` double DEFAULT '0',
  `cmaxdeposit` double DEFAULT '0',
  `calertdeposit` double DEFAULT '0',
  `clevel1` varchar(100) DEFAULT NULL,
  `clevel2` varchar(100) DEFAULT NULL,
  `clevel3` varchar(100) DEFAULT NULL,
  `clevel4` varchar(100) DEFAULT NULL,
  `clabel` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_param` */

insert  into `tm_param`(`cmindeposit`,`cmaxdeposit`,`calertdeposit`,`clevel1`,`clevel2`,`clevel3`,`clevel4`,`clabel`) values (1000000,5000000,500000,'Level 1','Level 2','Level 3','Level 4','test');

/*Table structure for table `tm_penerbangan` */

DROP TABLE IF EXISTS `tm_penerbangan`;

CREATE TABLE `tm_penerbangan` (
  `cnopenerbangan` varchar(10) NOT NULL,
  `ckdnegaraasal` varchar(3) DEFAULT NULL,
  `ckdkotaasal` varchar(10) DEFAULT NULL,
  `ckdnegaratujuan` varchar(3) DEFAULT NULL,
  `ckdkotatujuan` varchar(10) DEFAULT NULL,
  `cjametd` time DEFAULT NULL,
  `cjameta` time DEFAULT NULL,
  `ckuotakg` float DEFAULT NULL,
  `ckuotakoli` float DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cnopenerbangan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_penerbangan` */

insert  into `tm_penerbangan`(`cnopenerbangan`,`ckdnegaraasal`,`ckdkotaasal`,`ckdnegaratujuan`,`ckdkotatujuan`,`cjametd`,`cjameta`,`ckuotakg`,`ckuotakoli`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('GA123','IDR','JKT','IDR','SBY','11:25:30','11:25:30',4000,2000,NULL,'ADMIN','2014-11-08 01:40:24','ADMIN','2014-11-24 11:23:33'),('GA456','IDR','JKT','IDR','SBY',NULL,NULL,1000,2000,NULL,'ADMIN','2014-11-12 16:46:07','ADMIN','2014-11-12 16:46:07'),('GA789','IDR','JKT','IDR','SMG','11:25:15','11:25:15',10,10,NULL,'ADMIN','2014-11-24 11:24:29','ADMIN','2014-11-24 11:24:29');

/*Table structure for table `tm_tarifbiaya` */

DROP TABLE IF EXISTS `tm_tarifbiaya`;

CREATE TABLE `tm_tarifbiaya` (
  `ckdtarif` varchar(15) NOT NULL,
  `ckdcurrency` varchar(3) DEFAULT NULL,
  `ckdnegaraasal` varchar(3) DEFAULT NULL,
  `ckdkotaasal` varchar(10) DEFAULT NULL,
  `ckdnegaratujuan` varchar(3) DEFAULT NULL,
  `ckdkotatujuan` varchar(10) DEFAULT NULL,
  `vtarifdasarkg` double DEFAULT NULL,
  `vtarifdasarkoli` double DEFAULT NULL,
  `vtariflev1kg` double DEFAULT NULL,
  `vqtylevlrag1kg` float DEFAULT NULL,
  `vhrglev1rag1kg` double DEFAULT NULL,
  `vqtylevlrag2kg` float DEFAULT NULL,
  `vhrglev1rag2kg` double DEFAULT NULL,
  `vqtylevlrag3kg` float DEFAULT NULL,
  `vhrglev1rag3kg` double DEFAULT NULL,
  `vtariflev1koli` double DEFAULT NULL,
  `vqtylevlrag1koli` float DEFAULT NULL,
  `vhrglev1rag1koli` double DEFAULT NULL,
  `vqtylevlrag2koli` float DEFAULT NULL,
  `vhrglev1rag2koli` double DEFAULT NULL,
  `vqtylevlrag3koli` float DEFAULT NULL,
  `vhrglev1rag3koli` double DEFAULT NULL,
  `vtariflev2kg` double DEFAULT NULL,
  `vqtylev2rag1kg` float DEFAULT NULL,
  `vhrglev2rag1kg` double DEFAULT NULL,
  `vqtylev2rag2kg` float DEFAULT NULL,
  `vhrglev2rag2kg` double DEFAULT NULL,
  `vqtylev2rag3kg` float DEFAULT NULL,
  `vhrglev2rag3kg` double DEFAULT NULL,
  `vtariflev2koli` double DEFAULT NULL,
  `vqtylev2rag1koli` float DEFAULT NULL,
  `vhrglev2rag1koli` double DEFAULT NULL,
  `vqtylev2rag2koli` float DEFAULT NULL,
  `vhrglev2rag2koli` double DEFAULT NULL,
  `vqtylev2rag3koli` float DEFAULT NULL,
  `vhrglev2rag3koli` double DEFAULT NULL,
  `vtariflev3kg` double DEFAULT NULL,
  `vqtylev3rag1kg` float DEFAULT NULL,
  `vhrglev3rag1kg` double DEFAULT NULL,
  `vqtylev3rag2kg` float DEFAULT NULL,
  `vhrglev3rag2kg` double DEFAULT NULL,
  `vqtylev3rag3kg` float DEFAULT NULL,
  `vhrglev3rag3kg` double DEFAULT NULL,
  `vtariflev3koli` double DEFAULT NULL,
  `vqtylev3rag1koli` float DEFAULT NULL,
  `vhrglev3rag1koli` double DEFAULT NULL,
  `vqtylev3rag2koli` float DEFAULT NULL,
  `vhrglev3rag2koli` double DEFAULT NULL,
  `vqtylev3rag3koli` float DEFAULT NULL,
  `vhrglev3rag3koli` double DEFAULT NULL,
  `vtariflev4kg` double DEFAULT NULL,
  `vqtylev4rag1kg` float DEFAULT NULL,
  `vhrglev4rag1kg` double DEFAULT NULL,
  `vqtylev4rag2kg` float DEFAULT NULL,
  `vhrglev4rag2kg` double DEFAULT NULL,
  `vqtylev4rag3kg` float DEFAULT NULL,
  `vhrglev4rag3kg` double DEFAULT NULL,
  `vtariflev4koli` double DEFAULT NULL,
  `vqtylev4rag1koli` float DEFAULT NULL,
  `vhrglev4rag1koli` double DEFAULT NULL,
  `vqtylev4rag2koli` float DEFAULT NULL,
  `vhrglev4rag2koli` double DEFAULT NULL,
  `vqtylev4rag3koli` float DEFAULT NULL,
  `vhrglev4rag3koli` double DEFAULT NULL,
  `vfuelsurcharge` double DEFAULT NULL,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`ckdtarif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tm_tarifbiaya` */

insert  into `tm_tarifbiaya`(`ckdtarif`,`ckdcurrency`,`ckdnegaraasal`,`ckdkotaasal`,`ckdnegaratujuan`,`ckdkotatujuan`,`vtarifdasarkg`,`vtarifdasarkoli`,`vtariflev1kg`,`vqtylevlrag1kg`,`vhrglev1rag1kg`,`vqtylevlrag2kg`,`vhrglev1rag2kg`,`vqtylevlrag3kg`,`vhrglev1rag3kg`,`vtariflev1koli`,`vqtylevlrag1koli`,`vhrglev1rag1koli`,`vqtylevlrag2koli`,`vhrglev1rag2koli`,`vqtylevlrag3koli`,`vhrglev1rag3koli`,`vtariflev2kg`,`vqtylev2rag1kg`,`vhrglev2rag1kg`,`vqtylev2rag2kg`,`vhrglev2rag2kg`,`vqtylev2rag3kg`,`vhrglev2rag3kg`,`vtariflev2koli`,`vqtylev2rag1koli`,`vhrglev2rag1koli`,`vqtylev2rag2koli`,`vhrglev2rag2koli`,`vqtylev2rag3koli`,`vhrglev2rag3koli`,`vtariflev3kg`,`vqtylev3rag1kg`,`vhrglev3rag1kg`,`vqtylev3rag2kg`,`vhrglev3rag2kg`,`vqtylev3rag3kg`,`vhrglev3rag3kg`,`vtariflev3koli`,`vqtylev3rag1koli`,`vhrglev3rag1koli`,`vqtylev3rag2koli`,`vhrglev3rag2koli`,`vqtylev3rag3koli`,`vhrglev3rag3koli`,`vtariflev4kg`,`vqtylev4rag1kg`,`vhrglev4rag1kg`,`vqtylev4rag2kg`,`vhrglev4rag2kg`,`vqtylev4rag3kg`,`vhrglev4rag3kg`,`vtariflev4koli`,`vqtylev4rag1koli`,`vhrglev4rag1koli`,`vqtylev4rag2koli`,`vhrglev4rag2koli`,`vqtylev4rag3koli`,`vhrglev4rag3koli`,`vfuelsurcharge`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('JKTSBY','IDR','IDR','JKT','IDR','SBY',1000,2000,3000,50,3500,100,4000,150,4500,4000,50,4500,100,5000,150,5500,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5000,NULL,'ADMIN','2014-11-09 15:54:02','ADMIN','2014-11-13 00:31:36'),('JKTSMG','IDR','IDR','JKT','IDR','SMG',1000,1000,1000,1,1,2,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,44,4,4,4,4,4,444,44,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,300,NULL,'ADMIN','2014-11-12 15:18:11','ADMIN','2014-11-12 15:18:11');

/*Table structure for table `tr_invoice` */

DROP TABLE IF EXISTS `tr_invoice`;

CREATE TABLE `tr_invoice` (
  `cinv` int(11) NOT NULL AUTO_INCREMENT,
  `cnoinv` varchar(30) NOT NULL,
  `dtglinv` datetime DEFAULT NULL,
  `ckdagent` varchar(30) DEFAULT NULL,
  `dtglawal` datetime DEFAULT NULL,
  `dtglakhir` datetime DEFAULT NULL,
  `ckdcurrency` varchar(3) DEFAULT NULL,
  `cjmlsmu` int(11) DEFAULT NULL,
  `vtotalinv` double DEFAULT NULL,
  `vketerangan` text,
  `cstatus` varchar(1) DEFAULT 'O',
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cinv`,`cnoinv`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tr_invoice` */

insert  into `tr_invoice`(`cinv`,`cnoinv`,`dtglinv`,`ckdagent`,`dtglawal`,`dtglakhir`,`ckdcurrency`,`cjmlsmu`,`vtotalinv`,`vketerangan`,`cstatus`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values (7,'00011/INV-JKT/11/14','2014-11-16 00:00:00','00002/AGN-JKT/11/14','2014-11-01 00:00:00','2014-11-30 00:00:00','IDR',3,129016.5,'PENGIRIMAN CARGO PERIODE 01/11/2014 s.d 30/11/2014','O',NULL,'ADMIN','2014-11-16 09:45:33','ADMIN','2014-11-16 14:33:12'),(8,'00012/INV-JKT/11/14','2014-11-16 00:00:00','00002/AGN-JKT/11/14','2014-11-01 00:00:00','2014-11-30 00:00:00','IDR',1,246505.5,'ssss','O',NULL,'ADMIN','2014-11-16 15:28:23','ADMIN','2014-11-16 15:28:23');

/*Table structure for table `tr_muatanudara` */

DROP TABLE IF EXISTS `tr_muatanudara`;

CREATE TABLE `tr_muatanudara` (
  `cidmuatan` int(11) NOT NULL AUTO_INCREMENT,
  `cnomuatan` varchar(30) DEFAULT NULL,
  `dtglmuatan` datetime DEFAULT NULL,
  `ckdcurrency` varchar(3) DEFAULT NULL,
  `ckdagent` varchar(30) DEFAULT NULL,
  `vsaldoagent` double DEFAULT NULL,
  `ckdkotaasal` varchar(10) DEFAULT NULL,
  `ckdnegaratujuan` varchar(3) DEFAULT NULL,
  `ckdkotatujuan` varchar(10) DEFAULT NULL,
  `ckdnegaratransit` varchar(3) DEFAULT NULL,
  `ckdkotatransit` varchar(10) DEFAULT NULL,
  `cnopenerbangan` varchar(10) DEFAULT NULL,
  `dtglterbang` datetime DEFAULT NULL,
  `csisakg` float DEFAULT NULL,
  `csisakoli` float DEFAULT NULL,
  `ckdkomoditi` varchar(3) DEFAULT NULL,
  `cjmlcargo` float DEFAULT NULL,
  `cjmlberat` float DEFAULT NULL,
  `cjmlkoli` float DEFAULT NULL,
  `vtarifperkg` double DEFAULT NULL,
  `vtarifperkoli` double DEFAULT NULL,
  `vfuelsurcharge` double DEFAULT NULL,
  `vbiayaadmsmu` double DEFAULT NULL,
  `vbiayalain` double DEFAULT NULL,
  `vppnpers` float DEFAULT NULL,
  `vppn` double DEFAULT NULL,
  `vgrandtotal` double DEFAULT NULL,
  `cinv` int(11) DEFAULT NULL,
  `cnoinv` varchar(30) DEFAULT NULL,
  `dtglinv` datetime DEFAULT NULL,
  `cstatus` varchar(1) DEFAULT 'O',
  `bposted` varchar(1) DEFAULT '0',
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cidmuatan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tr_muatanudara` */

insert  into `tr_muatanudara`(`cidmuatan`,`cnomuatan`,`dtglmuatan`,`ckdcurrency`,`ckdagent`,`vsaldoagent`,`ckdkotaasal`,`ckdnegaratujuan`,`ckdkotatujuan`,`ckdnegaratransit`,`ckdkotatransit`,`cnopenerbangan`,`dtglterbang`,`csisakg`,`csisakoli`,`ckdkomoditi`,`cjmlcargo`,`cjmlberat`,`cjmlkoli`,`vtarifperkg`,`vtarifperkoli`,`vfuelsurcharge`,`vbiayaadmsmu`,`vbiayalain`,`vppnpers`,`vppn`,`vgrandtotal`,`cinv`,`cnoinv`,`dtglinv`,`cstatus`,`bposted`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values (5,'00010/SMU-JKT/11/14','2014-11-13 00:00:00','IDR','00002/AGN-JKT/11/14',5000000,'JKT','IDR','SBY','IDR','SMG','GA123','2014-11-13 00:00:00',1000,2000,'GNR',5,10,0,3000,4000,5000,10000,5,10,3500.5,48505.5,7,'00011/INV-JKT/11/14','2014-11-16 00:00:00','O','0',NULL,'ADMIN','2014-11-13 01:01:41','ADMIN','2014-11-14 16:03:15'),(6,'00011/SMU-JKT/11/14','2014-11-14 00:00:00','IDR','00002/AGN-JKT/11/14',4954985,'JKT','IDR','SBY','','','GA456','2014-11-14 00:00:00',1000,2000,'',1,5,0,3000,4000,5000,10000,5,10,2000.5,32005.5,7,'00011/INV-JKT/11/14','2014-11-16 00:00:00','F','0',NULL,'ADMIN','2014-11-13 01:04:56','ADMIN','2014-11-14 16:03:04'),(7,'00012/SMU-JKT/11/14','2014-11-14 00:00:00','IDR','00002/AGN-JKT/11/14',5575030,'JKT','IDR','SBY','','','GA123','2014-11-14 00:00:00',1000,2000,'GNR',3,10,0,3000,4000,5000,10000,5,10,3500.5,48505.5,7,'00011/INV-JKT/11/14','2014-11-16 00:00:00','O','0',NULL,'ADMIN','2014-11-14 15:58:58','ADMIN','2014-11-14 16:02:37'),(8,'00013/SMU-JKT/11/14','2014-11-16 00:00:00','IDR','00002/AGN-JKT/11/14',5729016.5,'JKT','IDR','SBY','IDR','SMG','GA123','2014-11-16 00:00:00',1000,2000,'GNR',8,60,0,3500,4500,5000,10000,5,10,21500.5,246505.5,8,'00012/INV-JKT/11/14','2014-11-16 00:00:00','O','0',NULL,'ADMIN','2014-11-16 14:36:00','ADMIN','2014-11-16 14:36:00');

/*Table structure for table `tr_saldo` */

DROP TABLE IF EXISTS `tr_saldo`;

CREATE TABLE `tr_saldo` (
  `ckdagent` varchar(30) NOT NULL,
  `cperiodethn` varchar(4) NOT NULL,
  `cperiodebln` varchar(2) NOT NULL,
  `ckdcurrency` varchar(3) DEFAULT NULL,
  `vsaldoawal` double DEFAULT NULL,
  `vsaldoin` double DEFAULT NULL,
  `vsaldoout` double DEFAULT NULL,
  `vsaldoakhir` double DEFAULT NULL,
  `dtglposted` datetime DEFAULT NULL,
  `cpostedby` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ckdagent`,`cperiodethn`,`cperiodebln`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tr_saldo` */

insert  into `tr_saldo`(`ckdagent`,`cperiodethn`,`cperiodebln`,`ckdcurrency`,`vsaldoawal`,`vsaldoin`,`vsaldoout`,`vsaldoakhir`,`dtglposted`,`cpostedby`) values ('00002/AGN-JKT/11/14','2014','10','IDR',0,100000,0,100000,NULL,NULL);

/*Table structure for table `tr_setoranagent` */

DROP TABLE IF EXISTS `tr_setoranagent`;

CREATE TABLE `tr_setoranagent` (
  `cnosetoran` varchar(30) NOT NULL,
  `dtglsetoran` datetime DEFAULT NULL,
  `ckdagent` varchar(30) DEFAULT NULL,
  `ckdcurrency` varchar(3) DEFAULT NULL,
  `vjmlsetoran` double DEFAULT NULL,
  `ckdjenissetor` varchar(3) DEFAULT NULL,
  `vketerangan` text,
  `ckdentity` varchar(3) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cnosetoran`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tr_setoranagent` */

insert  into `tr_setoranagent`(`cnosetoran`,`dtglsetoran`,`ckdagent`,`ckdcurrency`,`vjmlsetoran`,`ckdjenissetor`,`vketerangan`,`ckdentity`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values ('00012/SET-JKT/11/14','2014-11-15 00:00:00','00002/AGN-JKT/11/14','IDR',5000000,'TN','TEST',NULL,'ADMIN','2014-11-09 01:18:43','ADMIN','2014-11-12 00:57:06'),('00013/SET-JKT/11/14','2014-11-03 00:00:00','00002/AGN-JKT/11/14','IDR',500000,'TN','testt',NULL,'ADMIN','2014-11-13 15:47:00','ADMIN','2014-11-13 15:47:00'),('00014/SET-JKT/11/14','2014-11-15 00:00:00','00002/AGN-JKT/11/14','IDR',100000,'TN','',NULL,'ADMIN','2014-11-15 12:12:08','ADMIN','2014-11-16 14:34:49');

/*Table structure for table `tsm_groupuser` */

DROP TABLE IF EXISTS `tsm_groupuser`;

CREATE TABLE `tsm_groupuser` (
  `cKdGroupUser` int(11) NOT NULL AUTO_INCREMENT,
  `vNmGroupUser` varchar(50) DEFAULT NULL,
  `cAktif` char(1) DEFAULT NULL,
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cKdGroupUser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tsm_groupuser` */

insert  into `tsm_groupuser`(`cKdGroupUser`,`vNmGroupUser`,`cAktif`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values (1,'Admin','1','ADMIN','2014-10-08 15:27:09','ADMIN','2014-10-08 15:27:09'),(2,'User','1','ADMIN','2014-10-09 15:13:56','ADMIN','2014-10-09 15:13:56');

/*Table structure for table `tsm_logged` */

DROP TABLE IF EXISTS `tsm_logged`;

CREATE TABLE `tsm_logged` (
  `dTgl` datetime DEFAULT NULL,
  `fip` varchar(20) DEFAULT NULL,
  `cUserName` varchar(30) DEFAULT NULL,
  `csession_id` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tsm_logged` */

insert  into `tsm_logged`(`dTgl`,`fip`,`cUserName`,`csession_id`) values ('2014-11-05 15:46:48','127.0.0.1','admin','a9b94e05f0aa610fb71f1d3c37ca307b'),('2014-11-06 09:49:00','127.0.0.1','admin','9670e29f4e8303267060106eed52a39a'),('2014-11-06 21:00:17','127.0.0.1','admin','080c0ed7dc3fe976a30b73a88286627d'),('2014-11-07 09:05:00','127.0.0.1','admin','9616e26628dc89bf0efed8210964eb4a'),('2014-11-07 09:08:45','192.168.10.217','admin','c21b6f29dc1acf4258941c2b1429d9bc'),('2014-11-07 09:11:22','192.168.10.217','admin','f66a3f8cb39525e062fd7cdc5f3a2a82'),('2014-11-07 10:09:09','192.168.10.217','admin','04084f2fe944ce63e47b4adaf74edfb6'),('2014-11-07 16:23:01','192.168.10.217','admin','b481da9a95c740f026757e3414ac44c3'),('2014-11-07 17:05:12','127.0.0.1','admin','cbf85daccdc6e559e9aa4bc3423e1f1d'),('2014-11-07 17:12:34','192.168.10.217','admin','d2489ce92107726c272da4cbf3957f09'),('2014-11-07 21:06:00','127.0.0.1','admin','b8dc662856fa8e9ccfe8f8879bbcb080'),('2014-11-07 22:31:18','192.168.24.104','admin','5d5436094b21389c4c3688a7abe2e2f9'),('2014-11-07 22:35:23','127.0.0.1','admin','0bbd827f53e0b849197cc94d25526430'),('2014-11-08 08:07:58','192.168.24.104','admin','9a2818af3aa9bc17f7d9f0672c0f0c06'),('2014-11-08 08:10:36','127.0.0.1','admin','9407ae68e6f4bfa8789f68b6483f483e'),('2014-11-08 10:40:07','127.0.0.1','admin','934166f9f8351cc29ba591e9b2abcc2c'),('2014-11-08 15:24:23','192.168.1.17','admin','3dd226a278e10b4af6386951602e6061'),('2014-11-08 22:31:53','127.0.0.1','admin','ce1baa8bf17609867c86c85f7f5cf206'),('2014-11-09 12:02:41','127.0.0.1','admin','c46d14483182f2e8a4941ab0ac7cdad9'),('2014-11-10 09:59:34','127.0.0.1','admin','0014ee4486d84d9736c7c6e97885144d'),('2014-11-05 13:06:21','127.0.0.1','admin','c91349b8d7cc5da6c34c17235a9be960'),('2014-11-11 22:22:44','127.0.0.1','admin','a0574ae0ba3ca2d32a1e8ffac3f52ca5'),('2014-11-12 13:45:08','127.0.0.1','admin','a1733120bb5c390ad804fc40b72f5eb0'),('2014-11-12 17:20:47','127.0.0.1','admin','4699c348d0cd52c07681dce886df8c77'),('2014-11-12 21:39:58','127.0.0.1','admin','0ae458cb1e12069f794ba85f8a5e78ac'),('2014-11-13 14:25:03','127.0.0.1','admin','4405a9d90051c3b7a4314d9a5d63f11e'),('2014-11-13 23:46:02','127.0.0.1','admin','8e51f24696caa1950a30ea2aa175c974'),('2014-11-14 08:50:20','127.0.0.1','admin','5a84299d8a4f08b10f0599a5bcfae3be'),('2014-11-14 14:35:23','127.0.0.1','admin','a4aa781bda60f7e364fea9596acd7fa9'),('2014-11-14 23:54:55','127.0.0.1','admin','bf631e6dfc2a33fd767b25a37c569c6d'),('2014-11-15 10:33:51','127.0.0.1','admin','66a896e3e55cbd8bf2998578743ff65f'),('2014-11-17 00:24:27','127.0.0.1','admin','bf83ef9b3507076c44799f6aee54cb19'),('2014-11-17 23:40:40','127.0.0.1','admin','016ea9c5eecddc1728e114a4bd5b4fdd'),('2014-11-17 23:45:22','127.0.0.1','admin','8f5be92d54613fe428593653c4be37c4'),('2014-11-17 23:49:26','127.0.0.1','admin','e66f330d1a28d4c55950ee37c7c61254'),('2014-11-17 23:50:57','127.0.0.1','admin','62798784ef1ded6e63bba2439aa0d109'),('2014-11-17 23:53:05','127.0.0.1','admin','902cab267c3affc7b588749067d3eb44'),('2014-11-18 22:30:11','127.0.0.1','admin','55f7bc4003e157acd102361211ef8cc8'),('2014-11-18 23:09:17','127.0.0.1','admin','4a1bbf8224abbd20e27cd2ed2f203d4b'),('2014-11-19 00:33:17','127.0.0.1','admin','b24e692106015c641c97e4fd8a6871ff'),('2014-11-19 00:35:17','127.0.0.1','admin','4ef5f79329b43b6a31d8550709eeb118'),('2014-11-19 16:20:02','127.0.0.1','admin','be92e0f01973cc6d773284dd940449ac'),('2014-11-19 21:13:33','127.0.0.1','admin','ae5d22a562b9acf41b65c022e7072e24'),('2014-11-19 22:14:32','127.0.0.1','admin','c12e5aeef52df5df67d03ae104bebb04'),('2014-11-19 22:53:53','127.0.0.1','admin','e94fcaa18ead69e0cea07ea279a275e3'),('2014-11-20 00:32:12','127.0.0.1','admin','81d70ab1dbbef56bf54c0b4276be098c'),('2014-11-20 00:38:29','127.0.0.1','admin','baec734ff95495c0a55dad923af5f4f7'),('2014-11-20 09:04:18','127.0.0.1','admin','77ac1b00c458f2c11b22302aa690c5c1'),('2014-11-20 09:43:04','127.0.0.1','admin','c66b99a7dbaf5115acad9f6b2cd3f788'),('2014-11-20 10:33:33','127.0.0.1','admin','b4101b42e45d89f9475f5343308c8217'),('2014-11-20 11:03:36','127.0.0.1','admin','dea04cc6c7fb8dec190399bc2ef9df9c'),('2014-11-20 15:00:57','127.0.0.1','admin','5b886d78bd5c16c59454df4f1f3c7607'),('2014-11-20 16:32:46','127.0.0.1','admin','b7515f6e5417bb509661f097dd03749d'),('2014-11-20 21:38:35','127.0.0.1','admin','8e220197b8e1ebed058a327aaa3ee67a'),('2014-11-20 21:39:08','127.0.0.1','admin','3bafd294bf9dd5a82a429c36188bcb82'),('2014-11-20 21:45:11','127.0.0.1','admin','db6bc4031e6fa61ed4a8d32e73d238f2'),('2014-11-20 23:44:23','127.0.0.1','admin','451c68f2a67b779a4c774323d4470eb2'),('2014-11-21 15:11:15','127.0.0.1','admin','1d92a06edc91be42c45f6b99e2ee8dbd'),('2014-11-21 21:22:56','127.0.0.1','admin','17daf8877a6f827f7a8fa13922e74160'),('2014-11-21 23:03:35','127.0.0.1','admin','3057a1b598ca05672ed55c62b1695bd3'),('2014-11-23 01:52:23','127.0.0.1','admin','b8453458ae0639f4e38f6222d3655a4f'),('2014-11-24 10:28:02','127.0.0.1','admin','193983d9f83b98ef31fe25a163b32d9b'),('2014-11-30 13:39:51','127.0.0.1','admin','c1cfe0c7e3b05e2fe1adbecfc9b90086'),('2014-11-30 13:55:44','127.0.0.1','admin','47e5f1254c6c3e8b81e0c2bd6eaff0ae'),('2015-01-13 15:07:00','127.0.0.1','admin','3d89be6ca1efd00ab8c6b80274e0ca59'),('2015-01-13 23:54:15','127.0.0.1','admin','bde0caecebca11b48a05403610e95f69'),('2015-01-16 23:07:31','127.0.0.1','admin','7db1bf94788f8f6ee50184e42ea68c22'),('2015-02-13 00:10:04','127.0.0.1','admin','9536e165fe238d6c1b77ed7abce0ad68'),('2015-03-15 15:28:45','::1','admin','051c80356fbe9682d1b8d110fe913630'),('2015-03-29 12:23:11','::1','admin','f24d2bff3950eeb838618bffbcaca3ae'),('2015-03-29 19:52:21','::1','admin','73ca751d6bd89acd6de77112a059892d'),('2015-08-09 16:16:38','127.0.0.1','admin','4b1913c6bc75e4ba016aac36c69f1353'),('2015-11-30 20:38:23','127.0.0.1','admin','19672b8dc24e43ddc6c583ff2f60e875'),('2016-05-06 16:27:11','::1','admin','175ef3fa8aeff1aa583aa800ef30f28a');

/*Table structure for table `tsm_menu` */

DROP TABLE IF EXISTS `tsm_menu`;

CREATE TABLE `tsm_menu` (
  `fmenu` varchar(3) NOT NULL,
  `fparent` varchar(3) DEFAULT NULL,
  `fcaption` varchar(50) DEFAULT NULL,
  `fhandler` varchar(150) DEFAULT NULL,
  `ficon` varchar(100) DEFAULT NULL,
  `fnoedit` char(1) DEFAULT NULL,
  `fpublic` char(1) DEFAULT NULL,
  `forder` int(11) DEFAULT NULL,
  PRIMARY KEY (`fmenu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tsm_menu` */

insert  into `tsm_menu`(`fmenu`,`fparent`,`fcaption`,`fhandler`,`ficon`,`fnoedit`,`fpublic`,`forder`) values ('000',NULL,'Home','index.php',NULL,'1','1',0),('100',NULL,'System Manager',NULL,'fa fa-user','0','0',0),('101','100','User Group','user.group',NULL,'0','0',0),('102','100','Privileges','user.priv',NULL,'0','0',0),('103','100','User','user.user',NULL,'0','0',0),('200',NULL,'Master Data',NULL,'fa fa-user','0','0',0),('201','200','Negara','master.negara',NULL,'0','0',0),('202','200','Kota','master.kota',NULL,'0','0',0),('203','200','Data Pelanggan','master.agent',NULL,'0','0',0),('204','200','Bandar Udara',NULL,NULL,'0','0',0),('205','200','Data Penerbangan',NULL,NULL,'0','0',0),('206','200','Tarif Dan Biaya','master.tarif',NULL,'0','0',0),('207','200','Biaya Tambahan',NULL,NULL,'0','0',0),('300',NULL,'Transaction',NULL,'fa fa-user','0','0',0),('301','300','Setoran Pelanggan',NULL,NULL,'0','0',0),('302','300','Surat Muatan Udara',NULL,NULL,'0','0',0),('400',NULL,'Report',NULL,'fa fa-user','0','0',0),('401','400','Saldo Pelanggan',NULL,NULL,'0','0',0),('402','400','Invoice',NULL,NULL,'0','0',0),('403','400','Rincian Penjualan',NULL,NULL,'0','0',0),('404','400','Rekapitulasi Pemakaian SMU',NULL,NULL,'0','0',0),('405','400','Rincian Penjualan SMU',NULL,NULL,'0','0',0);

/*Table structure for table `tsm_priv` */

DROP TABLE IF EXISTS `tsm_priv`;

CREATE TABLE `tsm_priv` (
  `cKdGroupUser` int(11) NOT NULL,
  `cKdModuleId` varchar(5) NOT NULL,
  `cView` varchar(1) DEFAULT NULL,
  `cAdd` varchar(1) DEFAULT NULL,
  `cEdit` varchar(1) DEFAULT NULL,
  `cHapus` varchar(1) DEFAULT NULL,
  `cSubItem` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`cKdGroupUser`,`cKdModuleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tsm_priv` */

insert  into `tsm_priv`(`cKdGroupUser`,`cKdModuleId`,`cView`,`cAdd`,`cEdit`,`cHapus`,`cSubItem`) values (1,'100','1',NULL,NULL,NULL,NULL),(1,'101','1',NULL,NULL,NULL,NULL),(1,'102','1',NULL,NULL,NULL,NULL),(1,'103','1',NULL,NULL,NULL,NULL),(1,'200','1',NULL,NULL,NULL,NULL),(1,'201','1',NULL,NULL,NULL,NULL),(1,'202','1',NULL,NULL,NULL,NULL),(1,'203','1',NULL,NULL,NULL,NULL),(1,'204','1',NULL,NULL,NULL,NULL),(1,'205','1',NULL,NULL,NULL,NULL),(1,'206','1',NULL,NULL,NULL,NULL),(1,'207','1',NULL,NULL,NULL,NULL),(1,'300','1',NULL,NULL,NULL,NULL),(1,'301','1',NULL,NULL,NULL,NULL),(1,'302','1',NULL,NULL,NULL,NULL),(1,'400','1',NULL,NULL,NULL,NULL),(1,'401','1',NULL,NULL,NULL,NULL),(1,'402','1',NULL,NULL,NULL,NULL),(1,'403','1',NULL,NULL,NULL,NULL),(1,'404','1',NULL,NULL,NULL,NULL),(1,'405','1',NULL,NULL,NULL,NULL);

/*Table structure for table `tsm_transno` */

DROP TABLE IF EXISTS `tsm_transno`;

CREATE TABLE `tsm_transno` (
  `cKdEntity` varchar(3) DEFAULT NULL,
  `cIdTrans` varchar(10) DEFAULT NULL,
  `cCount` int(11) DEFAULT NULL,
  `cKodeDok` varchar(20) DEFAULT NULL,
  `cBulan` varchar(2) DEFAULT NULL,
  `cTahun` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tsm_transno` */

insert  into `tsm_transno`(`cKdEntity`,`cIdTrans`,`cCount`,`cKodeDok`,`cBulan`,`cTahun`) values ('000','AGN',3,'JKT','11','2014'),('000','SET',31,'JKT','11','2014'),('000','SMU',13,'JKT','11','2014'),('000','INV',12,'JKT','11','2014');

/*Table structure for table `tsm_user` */

DROP TABLE IF EXISTS `tsm_user`;

CREATE TABLE `tsm_user` (
  `cIdUser` int(11) NOT NULL AUTO_INCREMENT,
  `cUserName` varchar(30) DEFAULT NULL,
  `cPassword` varchar(50) DEFAULT NULL,
  `cKdGroupUser` int(11) DEFAULT NULL,
  `cNamaLengkap` varchar(150) DEFAULT NULL,
  `dLastLogin` datetime DEFAULT NULL,
  `cKdDept` varchar(3) DEFAULT NULL,
  `cAktif` varchar(1) DEFAULT '1',
  `cSuper` varchar(1) DEFAULT '0',
  `cUserEntry` varchar(30) DEFAULT NULL,
  `cDateEntry` datetime DEFAULT NULL,
  `cUserEdit` varchar(30) DEFAULT NULL,
  `cDateEdit` datetime DEFAULT NULL,
  PRIMARY KEY (`cIdUser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tsm_user` */

insert  into `tsm_user`(`cIdUser`,`cUserName`,`cPassword`,`cKdGroupUser`,`cNamaLengkap`,`dLastLogin`,`cKdDept`,`cAktif`,`cSuper`,`cUserEntry`,`cDateEntry`,`cUserEdit`,`cDateEdit`) values (1,'admin','sbc1RA3OJTr0hGhr1YKpbcT4D8tYpuraC6qq99ba9E8=',1,'Administrator','2016-05-06 16:27:11','MIS','1','1',NULL,NULL,'ADMIN','2014-10-10 11:10:36');

/* Procedure structure for procedure `sp_rpt_penjualan_smu` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_rpt_penjualan_smu` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rpt_penjualan_smu`(kdcurr VARCHAR(3), bln VARCHAR(2), thn VARCHAR(4), cnoterbang VARCHAR(10))
BEGIN
SELECT mu.cnomuatan, mu.dtglmuatan, mu.ckdagent, agen.vnmagent, mu.cnopenerbangan, asal.vnmkota AS vnmkotaasal, tuj.vnmkota AS vnmkotatuj,
mu.cjmlberat,mu.cjmlkoli,mu.vtarifperkg,mu.vtarifperkoli,
IF(mu.cjmlberat>0,mu.vtarifperkg,mu.vtarifperkoli) AS vtarif, mu.vppn,
((mu.cjmlberat*mu.vtarifperkg)+(mu.cjmlkoli*mu.vtarifperkoli))+mu.vfuelsurcharge+mu.vbiayalain AS vasagreed, 
mu.vbiayaadmsmu, mu.vgrandtotal
FROM tr_muatanudara mu
LEFT JOIN tm_agent agen ON agen.ckdagent = mu.ckdagent
LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal
LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saldo_agent` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saldo_agent` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saldo_agent`( kdagent varchar(30), kdcurr varchar(3), bln varchar(2), thn varchar(4))
begin
  DECLARE PrevPeriodeThn VARCHAR(4);
  DECLARE PrevPeriodeBln VARCHAR(2);
  DECLARE idxTahun integer;
  DECLARE idxBulan integer;
  DECLARE saldoawal DECIMAL(18,2);
  SET idxTahun = (select CAST(thn AS UNSIGNED));
  SET idxBulan = (SELECT CAST(bln AS UNSIGNED));
  SET idxBulan = idxBulan-1;
  IF(idxBulan<=0) then
    SET idxBulan = 12;
    SET idxTahun = idxTahun-1;    
  END if;
  SET PrevPeriodeThn = (SELECT CAST(idxTahun AS CHAR(4)));
  SET PrevPeriodeBln = (select RIGHT(concat('0',CAST(idxBulan AS CHAR(2))),2));
  SET saldoawal = (SELECT vsaldoakhir  FROM tr_saldo WHERE ckdagent = kdagent AND ckdcurrency = kdcurr AND cperiodethn = PrevPeriodeThn AND cperiodebln = PrevPeriodeBln);
  SET saldoawal = (select coalesce(saldoawal,0));
  
  DROP TEMPORARY TABLE IF EXISTS tbl_saldo;
  CREATE TEMPORARY TABLE IF NOT EXISTS tbl_saldo (
    cid varchar(5) DEFAULT NULL,
    ckdagent VARCHAR(30) DEFAULT NULL,
    cnotrans VARCHAR(30) DEFAULT NULL,
    dtgltrans datetime DEFAULT NULL,
    ckdcurrency VARCHAR(3) DEFAULT NULL,
    vin DOUBLE DEFAULT NULL,
    vout DOUBLE DEFAULT NULL
  );
  
  INSERT INTO tbl_saldo 
  SELECT 'SA' AS cid, kdagent AS ckdagent, null AS cnotrans, NULL AS dtgltrans, kdcurr AS ckdcurrency, saldoawal AS vin, 0 AS vout;
  INSERT INTO tbl_saldo 
  SELECT cid,ckdagent,cnotrans,dtgltrans,ckdcurrency, IF(cId="IN",vjumlah,0) AS vin, IF(cId="OUT",vjumlah,0) AS vout FROM vw_kartu_pelanggan_list WHERE ckdagent = kdagent AND ckdcurrency = kdcurr AND year(dtgltrans) = thn AND month(dtgltrans) = bln;
  
  DROP TEMPORARY TABLE IF EXISTS tbl_saldo_agent;
  CREATE TEMPORARY TABLE IF NOT EXISTS tbl_saldo_agent (
    cid VARCHAR(5) DEFAULT NULL,
    ckdagent VARCHAR(30) DEFAULT NULL,
    cnotrans VARCHAR(30) DEFAULT NULL,
    dtgltrans DATETIME DEFAULT NULL,
    ckdcurrency VARCHAR(3) DEFAULT NULL,
    vin DOUBLE DEFAULT NULL,
    vout DOUBLE DEFAULT NULL,
    vsaldo DOUBLE DEFAULT NULL
  );
  
  set @sal:=0;  
  INSERT INTO tbl_saldo_agent   
  SELECT cid,ckdagent,cnotrans, dtgltrans,ckdcurrency, @in:=vin AS vin, @out:=vout AS vout, @sal:=@sal+@in-@out AS vsaldo 
  FROM tbl_saldo sal;
  select sa.cid, sa.ckdagent, IF(sa.cId="SA","SALDO AWAL",sa.cnotrans) as cnotrans, sa.dtgltrans, sa.ckdcurrency,
  mu.cnopenerbangan, asal.vnmkota as vnmkotaasal, tuj.vnmkota AS vnmkotatuj,
  mu.cjmlberat,mu.cjmlkoli,mu.vtarifperkg,mu.vtarifperkoli,mu.vbiayaadmsmu,
  IF(mu.cjmlberat>0,mu.vtarifperkg,mu.vtarifperkoli) as vtarif,
  mu.vppn,
  ((mu.cjmlberat*mu.vtarifperkg)+(mu.cjmlkoli*mu.vtarifperkoli))+mu.vfuelsurcharge+mu.vbiayalain as vasagreed,
  sa.vin, sa.vout, sa.vsaldo 
  from tbl_saldo_agent sa
  left join tr_muatanudara mu ON mu.cnomuatan = sa.cnotrans
  LEFT JOIN tm_kota asal ON asal.ckdkota = mu.ckdkotaasal
  LEFT JOIN tm_kota tuj ON tuj.ckdkota = mu.ckdkotatujuan; 
/*  
  set @sal:=0;  
  SELECT 'SA' AS cid, kdagent AS ckdagent, null AS cnotrans, NULL AS dtgltrans, kdcurr AS ckdcurrency, 0 AS vin, 0 AS vout, @sal:=saldoawal AS vsaldo 
  UNION ALL
  SELECT cid,ckdagent,cnotrans, dtgltrans,ckdcurrency, @in:=IF(cId="IN",vjumlah,0) AS vin, @out:=IF(cId="OUT",vjumlah,0) AS vout, @sal:=@sal+@in-@out AS vsaldo 
  FROM vw_kartu_pelanggan_list;
*/
END */$$
DELIMITER ;

/*Table structure for table `vw_kartu_pelanggan` */

DROP TABLE IF EXISTS `vw_kartu_pelanggan`;

/*!50001 DROP VIEW IF EXISTS `vw_kartu_pelanggan` */;
/*!50001 DROP TABLE IF EXISTS `vw_kartu_pelanggan` */;

/*!50001 CREATE TABLE  `vw_kartu_pelanggan`(
 `cId` varchar(3) ,
 `ckdagent` varchar(30) ,
 `cnotrans` varchar(30) ,
 `dtgltrans` datetime ,
 `ckdcurrency` varchar(3) ,
 `vjumlah` double 
)*/;

/*Table structure for table `vw_kartu_pelanggan_list` */

DROP TABLE IF EXISTS `vw_kartu_pelanggan_list`;

/*!50001 DROP VIEW IF EXISTS `vw_kartu_pelanggan_list` */;
/*!50001 DROP TABLE IF EXISTS `vw_kartu_pelanggan_list` */;

/*!50001 CREATE TABLE  `vw_kartu_pelanggan_list`(
 `cId` varchar(3) ,
 `ckdagent` varchar(30) ,
 `cnotrans` varchar(30) ,
 `dtgltrans` datetime ,
 `ckdcurrency` varchar(3) ,
 `vjumlah` double 
)*/;

/*View structure for view vw_kartu_pelanggan */

/*!50001 DROP TABLE IF EXISTS `vw_kartu_pelanggan` */;
/*!50001 DROP VIEW IF EXISTS `vw_kartu_pelanggan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_kartu_pelanggan` AS select 'IN' AS `cId`,`tr_setoranagent`.`ckdagent` AS `ckdagent`,`tr_setoranagent`.`cnosetoran` AS `cnotrans`,`tr_setoranagent`.`dtglsetoran` AS `dtgltrans`,`tr_setoranagent`.`ckdcurrency` AS `ckdcurrency`,`tr_setoranagent`.`vjmlsetoran` AS `vjumlah` from `tr_setoranagent` union all select 'OUT' AS `cId`,`tr_muatanudara`.`ckdagent` AS `ckdagent`,`tr_muatanudara`.`cnomuatan` AS `cnotrans`,`tr_muatanudara`.`dtglmuatan` AS `dtglmuatan`,`tr_muatanudara`.`ckdcurrency` AS `ckdcurrency`,`tr_muatanudara`.`vgrandtotal` AS `vgrandtotal` from `tr_muatanudara` */;

/*View structure for view vw_kartu_pelanggan_list */

/*!50001 DROP TABLE IF EXISTS `vw_kartu_pelanggan_list` */;
/*!50001 DROP VIEW IF EXISTS `vw_kartu_pelanggan_list` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_kartu_pelanggan_list` AS select `vw_kartu_pelanggan`.`cId` AS `cId`,`vw_kartu_pelanggan`.`ckdagent` AS `ckdagent`,`vw_kartu_pelanggan`.`cnotrans` AS `cnotrans`,`vw_kartu_pelanggan`.`dtgltrans` AS `dtgltrans`,`vw_kartu_pelanggan`.`ckdcurrency` AS `ckdcurrency`,`vw_kartu_pelanggan`.`vjumlah` AS `vjumlah` from `vw_kartu_pelanggan` order by `vw_kartu_pelanggan`.`dtgltrans`,`vw_kartu_pelanggan`.`cId` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
