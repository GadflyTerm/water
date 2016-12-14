-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: s.mywoka.com    Database: water
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `st_addvcd_d`
--

DROP TABLE IF EXISTS `st_addvcd_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_addvcd_d` (
  `ADDVCD` varchar(6) CHARACTER SET utf8 NOT NULL,
  `ADDVNM` varchar(50) CHARACTER SET utf8 NOT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ADDVCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_addvcd_d`
--

LOCK TABLES `st_addvcd_d` WRITE;
/*!40000 ALTER TABLE `st_addvcd_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_addvcd_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_astrotd_f`
--

DROP TABLE IF EXISTS `st_astrotd_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_astrotd_f` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `YMDH` datetime NOT NULL,
  `TDZ` decimal(9,3) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`YMDH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_astrotd_f`
--

LOCK TABLES `st_astrotd_f` WRITE;
/*!40000 ALTER TABLE `st_astrotd_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_astrotd_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_dayev_r`
--

DROP TABLE IF EXISTS `st_dayev_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_dayev_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `EPTP` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `DYE` decimal(7,1) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_dayev_r`
--

LOCK TABLES `st_dayev_r` WRITE;
/*!40000 ALTER TABLE `st_dayev_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_dayev_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_ennmcd_d`
--

DROP TABLE IF EXISTS `st_ennmcd_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_ennmcd_d` (
  `ENNMCD` varchar(12) CHARACTER SET utf8 NOT NULL,
  `BSNM` varchar(30) CHARACTER SET utf8 NOT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ENNMCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_ennmcd_d`
--

LOCK TABLES `st_ennmcd_d` WRITE;
/*!40000 ALTER TABLE `st_ennmcd_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_ennmcd_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_estat_r`
--

DROP TABLE IF EXISTS `st_estat_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_estat_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `ACCE` decimal(8,1) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_estat_r`
--

LOCK TABLES `st_estat_r` WRITE;
/*!40000 ALTER TABLE `st_estat_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_estat_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_euntlang_d`
--

DROP TABLE IF EXISTS `st_euntlang_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_euntlang_d` (
  `FLID` varchar(20) CHARACTER SET utf8 NOT NULL,
  `EUCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `NTLANG` varchar(200) CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`FLID`,`EUCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_euntlang_d`
--

LOCK TABLES `st_euntlang_d` WRITE;
/*!40000 ALTER TABLE `st_euntlang_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_euntlang_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_ffrar_b`
--

DROP TABLE IF EXISTS `st_ffrar_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_ffrar_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TPCYR` decimal(6,0) NOT NULL,
  `RCINT` decimal(7,0) NOT NULL,
  `Q` decimal(11,3) DEFAULT NULL,
  `Z` decimal(9,3) DEFAULT NULL,
  `W1` decimal(13,4) DEFAULT NULL,
  `W3` decimal(13,4) DEFAULT NULL,
  `W5` decimal(13,4) DEFAULT NULL,
  `W7` decimal(13,4) DEFAULT NULL,
  `W10` decimal(13,4) DEFAULT NULL,
  `W15` decimal(13,4) DEFAULT NULL,
  `W30` decimal(13,4) DEFAULT NULL,
  `W60` decimal(13,4) DEFAULT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TPCYR`,`RCINT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_ffrar_b`
--

LOCK TABLES `st_ffrar_b` WRITE;
/*!40000 ALTER TABLE `st_ffrar_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_ffrar_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_field_d`
--

DROP TABLE IF EXISTS `st_field_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_field_d` (
  `TABID` varchar(20) CHARACTER SET utf8 NOT NULL,
  `FLID` varchar(20) CHARACTER SET utf8 NOT NULL,
  `FLSID` decimal(4,0) NOT NULL,
  `FLCN` varchar(40) CHARACTER SET utf8 NOT NULL,
  `FLEN` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `FLTL` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `NLAT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `UNNM` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `FCHSC` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `EUFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `PKAT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`TABID`,`FLID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_field_d`
--

LOCK TABLES `st_field_d` WRITE;
/*!40000 ALTER TABLE `st_field_d` DISABLE KEYS */;
INSERT INTO `st_field_d` VALUES ('ST_ADDVCD_D         ','ADDVCD              ',1,'行政区划码','administration division code','CHAR(6)','N','','                    ',' ','1','2016-11-11 11:00:41'),('ST_ADDVCD_D         ','ADDVNM              ',2,'行政区划名','name of administrative division','VARCHAR(50)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_ADDVCD_D         ','COMMENTS            ',3,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_ADDVCD_D         ','MODITIME            ',4,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_ASTROTD_F        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_ASTROTD_F        ','TDZ                 ',3,'预报天文潮位','tidal level','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_ASTROTD_F        ','YMDH                ',2,'发生时间','time of occurrence ','DATETIME','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_DAYEV_R          ','DYE                 ',4,'日蒸发量','daily evaporation','NUMERIC(5,1)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_DAYEV_R          ','EPTP                ',3,'蒸发器类型','evaporation pan type','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_DAYEV_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_DAYEV_R          ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_ENNMCD_D         ','BSNM                ',2,'水系名称','basin name','VARCHAR(30)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_ENNMCD_D         ','COMMENTS            ',3,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_ENNMCD_D         ','ENNMCD              ',1,'河流名称代码','code for rivers name of china','CHAR(12)','N','','                    ',' ','1','2016-11-11 11:00:41'),('ST_ENNMCD_D         ','MODITIME            ',4,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_ESTAT_R          ','ACCE                ',4,'累计蒸发量','accumulative evaporation','NUMERIC(6,1)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_ESTAT_R          ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_ESTAT_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_ESTAT_R          ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_EUNTLANG_D       ','EUCD                ',2,'枚举代码','enumeration code ','VARCHAR(10)','N','','                    ',' ','2','2016-11-11 11:00:41'),('ST_EUNTLANG_D       ','FLID                ',1,'字段标识','field identify','VARCHAR(20)','N','','                    ',' ','1','2016-11-11 11:00:41'),('ST_EUNTLANG_D       ','MODITIME            ',4,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_EUNTLANG_D       ','NTLANG              ',3,'自然语言','nature language','VARCHAR(200)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FFRAR_B          ','COMMENTS            ',14,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','MODITIME            ',15,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','Q                   ',4,'流量','discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','RCINT               ',3,'重现期','recurrence interval','NUMERIC(5)','N','年','                    ',' ','3','2016-11-11 11:00:38'),('ST_FFRAR_B          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_FFRAR_B          ','TPCYR               ',2,'典型年','typical year','NUMERIC(4)','N','','                    ',' ','2','2016-11-11 11:00:38'),('ST_FFRAR_B          ','W1                  ',6,'一日洪量','1-day flood volume','NUMERIC(11,4)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','W10                 ',10,'十日洪量','10-days flood volume','NUMERIC(11,4)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','W15                 ',11,'十五日洪量','15-days flood volume','NUMERIC(11,4)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','W3                  ',7,'三日洪量','3-days flood volume','NUMERIC(11,4)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','W30                 ',12,'三十日洪量','30-days flood volume','NUMERIC(11,4)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','W5                  ',8,'五日洪量','5-days flood volume','NUMERIC(11,4)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','W60                 ',13,'六十日洪量','60-days flood volume','NUMERIC(11,4)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','W7                  ',9,'七日洪量','7-days flood volume','NUMERIC(11,4)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FFRAR_B          ','Z                   ',5,'水位','stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FIELD_D          ','EUFL                ',10,'枚举标示','enumeration flag','CHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FIELD_D          ','FCHSC               ',9,'取值范围','fetching scale','CHAR(20)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FIELD_D          ','FLCN                ',4,'字段中文名','chinese name of field','VARCHAR(40)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FIELD_D          ','FLEN                ',5,'字段英文名','english name of field','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FIELD_D          ','FLID                ',2,'字段标识','field identify','CHAR(20)','N','','                    ',' ','2','2016-11-11 11:00:41'),('ST_FIELD_D          ','FLSID               ',3,'字段序号','field id','NUMERIC(2)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FIELD_D          ','FLTL                ',6,'字段类型及长度','field type and length','VARCHAR(20)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FIELD_D          ','MODITIME            ',12,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FIELD_D          ','NLAT                ',7,'空值属性','null attribute','CHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FIELD_D          ','PKAT                ',11,'主键属性','primary key attribute','CHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FIELD_D          ','TABID               ',1,'表标识','table identifying','CHAR(20)','N','','                    ',' ','1','2016-11-11 11:00:41'),('ST_FIELD_D          ','UNNM                ',8,'计量单位名称','unit name','VARCHAR(30)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_FORECASTC_F      ','COMMENTS            ',7,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_FORECASTC_F      ','FYMDH               ',4,'依据时间','time of forecasting','DATETIME','N','','                    ',' ','4','2016-11-11 11:00:40'),('ST_FORECASTC_F      ','IYMDH               ',5,'发布时间','time of forecast releasing','DATETIME','N','','                    ',' ','5','2016-11-11 11:00:40'),('ST_FORECASTC_F      ','PLCD                ',3,'方案代码','plan code','CHAR(20)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_FORECASTC_F      ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_FORECASTC_F      ','UNITNAME            ',2,'预报单位','unit name ','CHAR(30)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_FORECASTC_F      ','WNSTATUS            ',6,'告警状态','warning status','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:40'),('ST_FORECAST_F       ','FYMDH               ',4,'依据时间','time of forecasting','DATETIME','N','','                    ',' ','4','2016-11-11 11:00:40'),('ST_FORECAST_F       ','IYMDH               ',5,'发布时间','time of forecast releasing','DATETIME','N','','                    ',' ','5','2016-11-11 11:00:40'),('ST_FORECAST_F       ','PLCD                ',3,'方案代码','plan code','CHAR(20)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_FORECAST_F       ','Q                   ',8,'预报流量','discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_FORECAST_F       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_FORECAST_F       ','UNITNAME            ',2,'预报单位','unit name ','CHAR(30)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_FORECAST_F       ','YMDH                ',6,'发生时间','time of occurrence ','DATETIME','N','','                    ',' ','6','2016-11-11 11:00:40'),('ST_FORECAST_F       ','Z                   ',7,'预报水位','stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_FRAPAR_B         ','AVRG                ',4,'平均值','average value','NUMERIC(11,4)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','BGYR                ',7,'开始年份','beginning year','NUMERIC(4)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','COMMENTS            ',10,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','CS                  ',6,'偏差系数','skewness coefficient','NUMERIC(5,3)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','CV                  ',5,'离差系数','variation coefficient','NUMERIC(5,3)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','EDYR                ',8,'结束年份','end year','NUMERIC(4)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','MODITIME            ',11,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','SPNUM               ',9,'样本数量','number of samples','NUMERIC(4)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','TPCYR               ',2,'典型年','typical year','NUMERIC(4)','N','','                    ',' ','2','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','VARTP               ',3,'统计变量类别','statistical variable type','CHAR(3)','N','','                    ','1','3','2016-11-11 11:00:38'),('ST_FSDR_B           ','AVTRTM              ',8,'平均传播时间','average travel time','NUMERIC(5,2)',' ','小时','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FSDR_B           ','DWSTCD              ',2,'下游站码','code of downstream station','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:38'),('ST_FSDR_B           ','MNTRTM              ',6,'最小传播时间','minimal travel time','NUMERIC(5,2)',' ','小时','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FSDR_B           ','MODITIME            ',9,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FSDR_B           ','MXTRTM              ',7,'最大传播时间','maximum travel time','NUMERIC(5,2)',' ','小时','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FSDR_B           ','QMGN                ',5,'流量量级','discharge magnitude','NUMERIC(5)','N','立方米每秒','                    ',' ','3','2016-11-11 11:00:38'),('ST_FSDR_B           ','RCHLEN              ',3,'河段长','reach length','NUMERIC(3)',' ','公里','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FSDR_B           ','SFTQ                ',4,'安全泄量','safety discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_FSDR_B           ','UPSTCD              ',1,'上游站码','code of upstream station','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_GATE_R           ','EQPNO               ',5,'设备编号','equipment number','CHAR(2)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GATE_R           ','EQPTP               ',4,'设备类别','type of equipment','CHAR(2)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_GATE_R           ','EXKEY               ',3,'扩展关键字','extend keywords','CHAR(1)','N','',' @、A到Z            ',' ','3','2016-11-11 11:00:39'),('ST_GATE_R           ','GTOPHGT             ',7,'开启高度','height of openning gate above ground','NUMERIC(5,2)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GATE_R           ','GTOPNUM             ',6,'开启孔数','number of gates openned','NUMERIC(3)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GATE_R           ','GTQ                 ',8,'过闸流量','gate discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GATE_R           ','MSQMT               ',9,'测流方法','method of flow measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_GATE_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_GATE_R           ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_GRWAV_R          ','AVGWBD              ',4,'平均地下水埋深','average buried depth of groundwater ','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GRWAV_R          ','AVGWTMP             ',6,'平均地下水水温','average groundwater temperature','NUMERIC(3,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GRWAV_R          ','AVSPQ               ',5,'平均泉涌流量','average discharge of spring','NUMERIC(7,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GRWAV_R          ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_GRWAV_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_GRWAV_R          ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_GRWEVS_R         ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MNBD                ',5,'最小埋深','minimum buried depth of groundwater ','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MNBDTM              ',11,'最小埋深出现时间','occuring time of minimum buried depth of groundwater ','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MNGWTMP             ',9,'最低地下水水温','minimum groundwater temperature','NUMERIC(4,2)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MNGWTMPTM           ',15,'最低地下水水温出现时间','occuring time of minimum groundwater temperature ','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MNSPQ               ',7,'最小泉涌量','minimum discharge of spring','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MNSPQTM             ',13,'最小泉涌流量出现时间','occuring time of minimum spring discharge ','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MXBD                ',4,'最大埋深','maximum buried depth of groundwater ','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MXBDTM              ',10,'最大埋深出现时间','occuring time of maximum buried depth of groundwater ','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MXGWTMP             ',8,'最高地下水水温','maximum groundwater temperature','NUMERIC(4,2)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MXGWTMPTM           ',14,'最高地下水水温出现时间','occuring time of maximum groundwater temperature ','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MXSPQ               ',6,'最大泉涌流量','maximum discharge of spring','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','MXSPQTM             ',12,'最大泉涌流量出现时间','occuring time of maximum spring discharge ','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_GRWEVS_R         ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:40'),('ST_GRW_R            ','GWBD                ',3,'地下水埋深','buried depth of groundwater surface ','NUMERIC(6,2)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GRW_R            ','GWBDRMK             ',4,'地下水埋深注解','remark to buried depth of groundwater surface','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_GRW_R            ','GWPTN               ',7,'地下水水势','water potential of groundwater','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_GRW_R            ','GWTMP               ',6,'地下水水温','water temperature of groundwater','NUMERIC(4,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GRW_R            ','SPQ                 ',5,'泉涌水流量','spring discharge  ','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_GRW_R            ','SPQMMT              ',8,'泉涌水流量测法','method of spring discharge measurement ','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_GRW_R            ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_GRW_R            ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_HAIL_R           ','HLDR                ',4,'降雹历时','hail duration','NUMERIC(5,2)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_HAIL_R           ','HPD                 ',3,'雹粒直径','diameter of hail particle','NUMERIC(3)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_HAIL_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_HAIL_R           ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_ICEFR_F          ','EXKEY               ',7,'扩展关键字','extend keywords','CHAR(1)','N','',' @、A到Z            ',' ','7','2016-11-11 11:00:40'),('ST_ICEFR_F          ','FICD                ',8,'预报冰情现象号','forecasting ice code ','CHAR(2)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_ICEFR_F          ','FIQ                 ',13,'预报冰流量','forecasting ice discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_ICEFR_F          ','FIRPSTN             ',9,'预报冰情位置','position of forecasting ice regime ','CHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_ICEFR_F          ','FITHK               ',11,'预报冰厚','forecasting ice thickness','NUMERIC(4,1)',' ','厘米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_ICEFR_F          ','FRLDSTN             ',10,'预报相对距离','forecasting relative distance ','NUMERIC(3,1)',' ','公里','                    ',' ',' ','2016-11-11 11:00:40'),('ST_ICEFR_F          ','FYMDH               ',4,'依据时间','time of forecasting','DATETIME','N','','                    ',' ','4','2016-11-11 11:00:40'),('ST_ICEFR_F          ','IQPROP              ',14,'冰流量性质','property of ice discharge','CHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_ICEFR_F          ','ITHKCD              ',12,'冰厚种类码','code for type of ice thickness','CHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_ICEFR_F          ','IYMDH               ',5,'发布时间','time of forecast releasing','DATETIME','N','','                    ',' ','5','2016-11-11 11:00:40'),('ST_ICEFR_F          ','PLCD                ',3,'方案代码','plan code','CHAR(20)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_ICEFR_F          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_ICEFR_F          ','UNITNAME            ',2,'预报单位','unit name ','CHAR(30)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_ICEFR_F          ','YMDH                ',6,'发生时间','time of occurrence ','DATETIME','N','','                    ',' ','6','2016-11-11 11:00:40'),('ST_INSTCD_B         ','INSTCD              ',1,'单位代码','institute code ','CHAR(10)','N','','                    ','1','1','2016-11-11 11:00:39'),('ST_INSTCD_B         ','INSTNM              ',2,'单位名称','name of institute','CHAR(60)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_INSTCD_B         ','LOCALITY            ',3,'交换管理单位','locality','CHAR(10)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_INSTCD_B         ','MODITIME            ',4,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_INSTCD_E         ','EXCIP               ',4,'IP地址','exchange of ip address ','VARCHAR(39)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_INSTCD_E         ','EXCPORT             ',5,'端口号','exchange port','NUMERIC(5)','N','','80～10000           ',' ',' ','2016-11-11 11:00:41'),('ST_INSTCD_E         ','EXCSRV              ',6,'服务名','exchange of server name','VARCHAR(32)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_INSTCD_E         ','EXCTYPE             ',3,'交换类型','exchange type','VARCHAR(1)','N','','                    ','1',' ','2016-11-11 11:00:41'),('ST_INSTCD_E         ','INSTCD              ',1,'单位代码','institute code ','VARCHAR(10)','N','','                    ',' ','1','2016-11-11 11:00:41'),('ST_INSTCD_E         ','INSTNM              ',2,'单位名称','name of institute','VARCHAR(40)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_INSTCD_E         ','ISSTARTS            ',10,'启动交换','start exchange','VARCHAR(1)','N','','                    ','1',' ','2016-11-11 11:00:41'),('ST_INSTCD_E         ','MODITIME            ',11,'时间戳','modification timestamp','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_INSTCD_E         ','PASSWORD            ',8,'手工上传密码','password of manual uploading','VARCHAR(32)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_INSTCD_E         ','TRFL                ',9,'转发标志','transferring flag','CHAR(4)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_INSTCD_E         ','WEBURL              ',7,'手工上传网址','url of manual uploading','VARCHAR(50)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_NETSTAT_E        ','CHANGETIME          ',2,'变化时间','CHANGETIME','DATETIME','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_NETSTAT_E        ','INSTCD              ',1,'单位代码','INSTCD','VARCHAR(10)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_NETSTAT_E        ','NETSTATUS           ',4,'网络状态','NETSTATUS','VARCHAR(2)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_NETSTAT_E        ','NETTYPE             ',3,'网络类型','NETTYPE','VARCHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_PDDMYAV_S        ','BGYR                ',5,'开始年份','beginning year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDDMYAV_S        ','COMMENTS            ',8,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDDMYAV_S        ','DAY                 ',3,'日期','day','NUMERIC(2)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_PDDMYAV_S        ','EDYR                ',6,'结束年份','end year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDDMYAV_S        ','MNTH                ',2,'月份','month','NUMERIC(2)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_PDDMYAV_S        ','MODITIME            ',9,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDDMYAV_S        ','MYDAVP              ',4,'多年平均日降水量','multi-year-averaged values of daily precipitation','NUMERIC(5,1)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDDMYAV_S        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_PDDMYAV_S        ','STTYRNUM            ',7,'统计年数','count of statistical years','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDMMYAV_S        ','BGYR                ',9,'开始年份','beginning year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDMMYAV_S        ','COMMENTS            ',12,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDMMYAV_S        ','EDYR                ',10,'结束年份','end year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDMMYAV_S        ','MNTH                ',2,'月份','month','NUMERIC(2)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_PDMMYAV_S        ','MODITIME            ',13,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDMMYAV_S        ','MYMAVP              ',4,'多年平均旬月降水量','multi-year-averaged values of precipitation on 10-day or month','NUMERIC(5,1)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDMMYAV_S        ','PRDTP               ',3,'旬月标示','period type of 10-day or month ','NUMERIC(1)','N','','                    ','1','3','2016-11-11 11:00:40'),('ST_PDMMYAV_S        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_PDMMYAV_S        ','STTYRNUM            ',11,'统计年数','count of statistical years','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDMMYSQ_S        ','ACCP                ',5,'累计降水量','accumulative precipitation','NUMERIC(5,1)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDMMYSQ_S        ','MNTH                ',3,'月份','month','NUMERIC(2)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_PDMMYSQ_S        ','MODITIME            ',6,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PDMMYSQ_S        ','PRDTP               ',4,'旬月标示','period type of 10-day or month ','NUMERIC(1)','N','','                    ','1','4','2016-11-11 11:00:40'),('ST_PDMMYSQ_S        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_PDMMYSQ_S        ','YR                  ',2,'年份','year','NUMERIC(4)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_PMEVS_R          ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_PMEVS_R          ','MNDNQ               ',11,'最小排水流量','minimum draining discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','MNDNQTM             ',19,'最小排水流量出现时间','occuring time of minimum draining discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','MNPPQ               ',9,'最小引水流量','minimum pumping discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','MNPPQTM             ',17,'最小引水流量出现时间','occuring time of minimum pumping discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','MXDNQ               ',10,'最大排水流量','maximum draining discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','MXDNQTM             ',18,'最大排水流量出现时间','occuring time of maximum draining discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','MXPPQ               ',8,'最大引水流量','maximum pumping discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','MXPPQTM             ',16,'最大引水流量出现时间','occuring time of maximum pumping discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','PPDWHTZ             ',6,'站下最高水位','highest stage in downstream of pumping station','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','PPDWHTZTM           ',14,'站下最高水位出现时间','occuring time of highest stage in downstream of pumping station','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','PPDWLTZ             ',7,'站下最低水位','lowest stage in downstream of pumping station','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','PPDWLTZTM           ',15,'站下最低水位出现时间','occuring time of lowest stage in downstream of pumping station','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','PPUPHTZ             ',4,'站上最高水位','highest stage in upstream of pumping station','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','PPUPHTZTM           ',12,'站上最高水位出现时间','occuring time of highest stage in upstream of pumping station','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','PPUPLTZ             ',5,'站上最低水位','lowest stage in upstream of pumping station','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','PPUPLTZTM           ',13,'站上最低水位出现时间','occuring time of lowest stage in upstream of pumping station','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_PMEVS_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_PMEVS_R          ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:40'),('ST_PPTN_R           ','DRP                 ',3,'时段降水量','precipitation in a period of time','NUMERIC(5,1)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PPTN_R           ','DYP                 ',6,'日降水量','daily precipitation','NUMERIC(5,1)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PPTN_R           ','INTV                ',4,'时段长','interval','NUMERIC(5,2)',' ','小时','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PPTN_R           ','PDR                 ',5,'降水历时','precipitation duration','NUMERIC(5,2)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PPTN_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_PPTN_R           ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_PPTN_R           ','WTH                 ',7,'天气状况','weather','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_PSTAT_R          ','ACCP                ',4,'累计降水量','accumulative precipitation','NUMERIC(6,1)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PSTAT_R          ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_PSTAT_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_PSTAT_R          ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_PUMP_R           ','MSQMT               ',11,'测流方法','method of flow measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','OMCN                ',5,'开机台数','the number of operating machines in pumping station','NUMERIC(3)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','OMPWR               ',6,'开机功率','sum of power in operation of pumping station','NUMERIC(5)',' ','千瓦','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','PDCHCD              ',12,'引排特征码','code for indicating pumping & draining','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','PMPQ                ',7,'抽水流量','pumping discharge','NUMERIC(7,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','PPDWWPTN            ',10,'站下水势','water potential in downstream of pumping station','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','PPDWZ               ',4,'站下水位','stage in downstream of pumping station','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','PPUPWPTN            ',9,'站上水势','water potential in upstream of pumping station','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','PPUPZ               ',3,'站上水位','stage in upstream of pumping station','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','PPWCHRCD            ',8,'站水特征码','code for characteristics of flow in pumping station','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_PUMP_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_PUMP_R           ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_QLICEINF_R       ','EXKEY               ',3,'扩展关键字','extend keywords','CHAR(1)','N','',' @、A到Z            ',' ','3','2016-11-11 11:00:39'),('ST_QLICEINF_R       ','IOSNDP              ',8,'冰上雪深','snow depth on ice','NUMERIC(2)',' ','厘米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QLICEINF_R       ','IUDFSTHK            ',9,'冰下冰花厚','thickness of frazil slush under ice','NUMERIC(2)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QLICEINF_R       ','QLTICD              ',4,'定性冰情号','qualitative ice code','CHAR(2)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_QLICEINF_R       ','QLTITHK             ',7,'定性冰厚','qualitative ice thickness','NUMERIC(4,1)',' ','厘米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QLICEINF_R       ','RLDSTN              ',6,'相对距离','relative distance to hydrometric station','NUMERIC(3,1)',' ','公里','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QLICEINF_R       ','RLPSTN              ',5,'相对位置','relative position','CHAR(4)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_QLICEINF_R       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_QLICEINF_R       ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','BDITHK              ',9,'岸冰厚度','thickness of border ice','NUMERIC(4,1)',' ','厘米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','BRKPROP             ',16,'解冻性质','property of ice break-up','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','DIPCK               ',17,'流冰堆积','drifting ice pack','NUMERIC(1)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','DITHK               ',11,'流冰厚度','thickness of drifting ice','NUMERIC(4,1)',' ','厘米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','ELTY                ',23,'高程类型','type of elevation','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','EXKEY               ',3,'扩展关键字','extend keywords','CHAR(1)','N','',' @、A到Z            ',' ','3','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','FRZPROP             ',15,'封冻性质','property of freeze-up','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','IDAMGRW             ',18,'冰坝发展','ice dam growing','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','IDAMHGT             ',19,'冰坝高度','height of ice dam','NUMERIC(3,1)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','IDAMUPWPTN          ',22,'冰坝上游水势','water potential in upstream of ice dam','CHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','IDAMUPZ             ',21,'冰坝上游水位','stage in upstream of ice dam','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','IDAMWD              ',20,'冰坝宽度','width of ice dam','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','IQ                  ',14,'冰流量','ice discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','IQPROP              ',24,'冰流量性质','property of ice discharge','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','IRCON               ',10,'流冰密度','ice run concentration','NUMERIC(1)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','LBDIWD              ',7,'左岸冰宽','left border ice width','NUMERIC(1)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','MXIA                ',12,'最大冰块面积','maximum area of ice','NUMERIC(4)',' ','平方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','MXIV                ',13,'最大冰块流速','maximum velocity of ice','NUMERIC(3,1)',' ','米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','QNTICD              ',4,'定量冰情号','quantitative ice code','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','RBDIWD              ',8,'右岸冰宽','right border ice width','NUMERIC(1)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','RLDSTN              ',6,'相对距离','relative distance to hydrometric station','NUMERIC(3,1)',' ','公里','                    ',' ',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','RLPSTN              ',5,'相对位置','relative position','CHAR(4)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_QTICEINF_R       ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_RECVFILE_E       ','INSTCD              ',2,'单位代码','INSTCD','VARCHAR(10)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVFILE_E       ','MODITIME            ',8,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVFILE_E       ','RECVSTATUS          ',4,'接收状态','RECVSTATUS','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVFILE_E       ','RECVTM              ',6,'接收时间','RECVTM','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVFILE_E       ','RECVTYPE            ',3,'接收类型','RECVTYPE','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVFILE_E       ','RFILENAME           ',5,'接收文件名','RFILENAME','VARCHAR(200)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVFILE_E       ','RFNUM               ',1,'接收文件编号','RFNUM','NUMERIC(18,0)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_RECVINF_E        ','ERRINF              ',13,'错误信息','ERRINF','VARCHAR(4000)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','EXCINF              ',10,'交换信息','EXCINF','VARCHAR(4000)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','EXCKEY              ',8,'扩展关键字','EXCKEY','VARCHAR(200)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','INSTCD              ',3,'单位代码','INSTCD','VARCHAR(10)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','INSTOSTATUS         ',11,'入库状态','INSTOSTATUS','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','INSTOTM             ',12,'入库时间','INSTOTM','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','MANUALTM            ',14,'人工处理时间','MANUALTM','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','MODITIME            ',16,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','OPERATION           ',9,'操作类型','OPERATION','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','RFNUM               ',2,'接收文件编号','RFNUM','NUMERIC(18,0)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','RLSH                ',1,'接收流水号','RLSH','NUMERIC(18,0)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_RECVINF_E        ','SLSH                ',4,'发送流水号','SLSH','NUMERIC(18,0)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','STAT                ',15,'统计标记','STAT','VARCHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','STCD                ',5,'测站编码','STCD','VARCHAR(8)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','TABID               ',6,'表标识','TABID','VARCHAR(30)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVINF_E        ','TM                  ',7,'数据时间','TM','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','COUNTB60            ',10,'30至60分钟信息量','COUNTB60','NUMERIC(9,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','COUNTDAY            ',2,'统计日期','COUNTDAY','DATETIME','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','COUNTL30            ',9,'30分钟内信息量','COUNTL30','NUMERIC(9,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','COUNTT60            ',11,'大于60分钟信息量','COUNTT60','NUMERIC(9,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','FRGRD               ',4,'报汛等级','FRGRD','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','INFNUM              ',8,'信息量','INFNUM','NUMERIC(9,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','INFTYPE             ',6,'信息类型','INFTYPE','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','INSTCD              ',1,'单位代码','INSTCD','VARCHAR(10)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','MODITIME            ',12,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','OPERATION           ',5,'操作类型','OPERATION','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','STCDNUM             ',7,'测站数量','STCDNUM','NUMERIC(6,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RECVSTAT_E       ','STTDRCD             ',3,'统计时段标志','STTDRCD','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_REGLAT_F         ','FYMDH               ',4,'依据时间','time of forecasting','DATETIME','N','','                    ',' ','4','2016-11-11 11:00:40'),('ST_REGLAT_F         ','IYMDH               ',5,'发布时间','time of forecast releasing','DATETIME','N','','                    ',' ','5','2016-11-11 11:00:40'),('ST_REGLAT_F         ','OTQ                 ',9,'预报出流','reservoir outflow discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_REGLAT_F         ','PLCD                ',3,'方案代码','plan code','CHAR(20)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_REGLAT_F         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_REGLAT_F         ','UNITNAME            ',2,'预报单位','unit name ','CHAR(30)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_REGLAT_F         ','W                   ',8,'预报蓄水量','reservoir storage','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_REGLAT_F         ','YMDH                ',6,'发生时间','time of occurrence ','DATETIME','N','','                    ',' ','6','2016-11-11 11:00:40'),('ST_REGLAT_F         ','Z                   ',7,'预报水位','stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RIVER_R          ','FLWCHRCD            ',8,'河水特征码','code for characteristics of flow','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_RIVER_R          ','MSAMT               ',11,'测积方法','method of area measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_RIVER_R          ','MSQMT               ',10,'测流方法','method of flow measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_RIVER_R          ','MSVMT               ',12,'测速方法','method of velocity measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_RIVER_R          ','Q                   ',4,'流量','discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RIVER_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_RIVER_R          ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_RIVER_R          ','WPTN                ',9,'水势','water potential','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_RIVER_R          ','XSA                 ',5,'断面过水面积','wetted cross-section area','NUMERIC(9,3)',' ','平方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RIVER_R          ','XSAVV               ',6,'断面平均流速','mean velocity in cross-section','NUMERIC(5,3)',' ','米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RIVER_R          ','XSMXV               ',7,'断面最大流速','maximum velocity in cross-section','NUMERIC(5,3)',' ','米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RIVER_R          ','Z                   ',3,'水位','stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVRAV_R         ','AVINQ               ',5,'平均入流量','average inflow discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVRAV_R         ','AVOTQ               ',6,'平均出流量','average outflow discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVRAV_R         ','AVRZ                ',4,'平均库水位','average stage in reservoir region','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVRAV_R         ','AVW                 ',7,'平均蓄水量','average reservoir storage','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVRAV_R         ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_RSVRAV_R         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_RSVRAV_R         ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_RSVREVS_R        ','HTRZ                ',4,'最高库水位','highest stage in reservoir region','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVREVS_R        ','HTRZTM              ',12,'最高库水位出现时间','occurring time of highest stage in reservoir region','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_RSVREVS_R        ','LTRZ                ',5,'最低库水位','lowest stage in reservoir region','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVREVS_R        ','LTRZTM              ',13,'最低库水位出现时间','occurring time of lowest stage in reservoir region','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MNINQ               ',7,'最小入库流量','minimum inflow discharge of reservoir','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVREVS_R        ','MNINQTM             ',15,'最小入库流量出现时间','occuring time of minimum inflow discharge of reservoir','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MNOTQ               ',9,'最小出库流量','minimum outflow discharge of reservoir','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MNOTQTM             ',17,'最小出库流量出现时间','occuring time of minimum outflow discharge of reservoir','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MNW                 ',11,'最小蓄水量','minimum reservoir storage','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MNWTM               ',19,'最小蓄水量出现时间','occuring time of minimum reservoir storage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MXINQ               ',6,'最大入库流量','maximum inflow discharge of reservoir','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVREVS_R        ','MXINQTM             ',14,'最大入库流量出现时间','occurring time of maximum inflow discharge of reservoir','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MXOTQ               ',8,'最大出库流量','maximum outflow discharge of reservoir','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MXOTQTM             ',16,'最大出库流量出现时间','occuring time of maximum outflow discharge of reservoir','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MXW                 ',10,'最大蓄水量','maximum reservoir storage','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','MXWTM               ',18,'最大蓄水量出现时间','occuring time of maximum reservoir storage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RSVREVS_R        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_RSVREVS_R        ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_RSVRFCCH_B       ','ACTCP               ',11,'兴利库容','active reservoir capacity','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','ACTZ                ',8,'正常蓄水位','active reservoir stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','CKFLZ               ',4,'校核洪水位','check flood stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','DAMEL               ',3,'坝顶高程','elevation of dam crest','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','DDCP                ',12,'死库容','dead reservoir capacity','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','DDZ                 ',7,'死水位','dead pool stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','DSFLZ               ',5,'设计洪水位','design flood stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','FLDCP               ',10,'防洪库容','flood-control reservoir capacity','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HHRZ                ',13,'历史最高库水位','historical highest stage in reservoir region','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HHRZTM              ',15,'历史最高库水位（蓄水量）出现时间','occuring time of historical highest stage（reservoir storage） in reservoir region','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HLRZ                ',21,'历史最低库水位','historical lowest stage in reservoir region','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HLRZTM              ',22,'历史最低库水位出现时间','occuring time of historical lowest stage in reservoir region','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HMNINQ              ',23,'历史最小日均入流','historical minimum inflow discharge of reservoir','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HMNINQTM            ',24,'历史最小日均入流出现时间','occuring time of historical minimum inflow discharge of reservoir','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HMXINQ              ',16,'历史最大入流','historical maximum inflow discharge of reservoir','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HMXINQTM            ',18,'历史最大入流出现时间','occuring time of historical maximum inflow discharge of reservoir','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HMXOTQ              ',19,'历史最大出流','historical maximum outflow discharge of reservoir','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HMXOTQTM            ',20,'历史最大出流出现时间','occuring time of historical maximum outflow discharge of reservoir','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','HMXW                ',14,'历史最大蓄水量','historical maximum reservoir storage','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','LAZ                 ',25,'旱限水位','alarm value of low stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','MODITIME            ',27,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','NORMZ               ',6,'防洪高水位','normal top stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','RSTDR               ',17,'历史最大入流时段长','duration of historical maximum inflow discharge of reservoir','NUMERIC(5,2)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','RSVRTP              ',2,'水库类型','reservoir type','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','SFQ                 ',26,'启动预报流量标准','start standard of discharge forecasting','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','TTCP                ',9,'总库容','total reservoir capacity','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFSR_B        ','BGMD                ',2,'开始月日','beginning month & day','CHAR(4)','N','','                    ',' ','2','2016-11-11 11:00:38'),('ST_RSVRFSR_B        ','EDMD                ',3,'结束月日','end month & day','CHAR(4)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFSR_B        ','FSLTDW              ',5,'汛限库容','limitted reservoir storage in flood-season','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFSR_B        ','FSLTDZ              ',4,'汛限水位','limitted stage in flood-season','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFSR_B        ','FSTP                ',6,'汛期类别','flood-season type','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_RSVRFSR_B        ','MODITIME            ',7,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRFSR_B        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_RSVRMYAV_S       ','BGYR                ',5,'开始年份','beginning year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RSVRMYAV_S       ','COMMENTS            ',8,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RSVRMYAV_S       ','DAY                 ',3,'日期','day','NUMERIC(2)','N','','                    ',' ','3','2016-11-11 11:00:41'),('ST_RSVRMYAV_S       ','EDYR                ',6,'结束年份','end year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RSVRMYAV_S       ','MNTH                ',2,'月份','month','NUMERIC(2)','N','','                    ',' ','2','2016-11-11 11:00:41'),('ST_RSVRMYAV_S       ','MODITIME            ',9,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RSVRMYAV_S       ','MYDAVW              ',4,'多年日平均蓄水量','multi-year-averaged values of daily reservoir storage','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RSVRMYAV_S       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:41'),('ST_RSVRMYAV_S       ','STTYRNUM            ',7,'统计年数','count of statistical years','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RSVRSTRL_B       ','IOMRK               ',3,'入出库标志','marker of reservoir inflow/outflow','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:38'),('ST_RSVRSTRL_B       ','MODITIME            ',4,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RSVRSTRL_B       ','RLSTCD              ',2,'关联站码','relating station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:38'),('ST_RSVRSTRL_B       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_RSVR_R           ','BLRZ                ',6,'库下水位','stage below the reservoir region','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVR_R           ','INQ                 ',4,'入库流量','reservoir inflow discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVR_R           ','INQDR               ',10,'入流时段长','duration of reservoir inflow','NUMERIC(5,2)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVR_R           ','MSQMT               ',11,'测流方法','method of flow measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_RSVR_R           ','OTQ                 ',7,'出库流量','reservoir outflow discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVR_R           ','RWCHRCD             ',8,'库水特征码','code for characteristics of reservoir flow','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_RSVR_R           ','RWPTN               ',9,'库水水势','water potential of reservoir','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_RSVR_R           ','RZ                  ',3,'库上水位','stage in reservoir region','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RSVR_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_RSVR_R           ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_RSVR_R           ','W                   ',5,'蓄水量','reservoir storage','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVAV_R           ','AVQ                 ',5,'平均流量','average discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVAV_R           ','AVZ                 ',4,'平均水位','average stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVAV_R           ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_RVAV_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_RVAV_R           ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_RVDAYMYAV_S      ','BGYR                ',6,'开始年份','beginning year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDAYMYAV_S      ','COMMENTS            ',9,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDAYMYAV_S      ','DAY                 ',3,'日期','day','NUMERIC(2)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_RVDAYMYAV_S      ','EDYR                ',7,'结束年份','end year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDAYMYAV_S      ','MNTH                ',2,'月份','month','NUMERIC(2)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_RVDAYMYAV_S      ','MODITIME            ',10,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDAYMYAV_S      ','MYDAVQ              ',5,'多年日平均流量','multi-year-averaged values of daily discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDAYMYAV_S      ','MYDAVZ              ',4,'多年日平均水位','multi-years-averaged values of daily stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDAYMYAV_S      ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_RVDAYMYAV_S      ','STTYRNUM            ',8,'统计年数','count of statistical years','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','HTZ                 ',5,'最高水位','highest stage','NUMERIC(7,3)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','HTZTM               ',6,'最高水位出现时间','occurring time of highest stage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','LTZ                 ',9,'最低水位','lowerest stage','NUMERIC(7,3)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','LTZTM               ',10,'最低水位出现时间','occurring time of lowest stage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','MNQ                 ',11,'最小流量','minimum discharge','NUMERIC(9,3)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','MNQTM               ',12,'最小流量出现时间','occurring time of minimum discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','MNTH                ',3,'月份','month','NUMERIC(2)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','MODITIME            ',13,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','MXQ                 ',7,'最大流量','maxmum discharge','NUMERIC(9,3)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','MXQTM               ',8,'最大流量出现时间','occurring time of maxmum discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','PRDTP               ',4,'旬月标示','period type of 10-day or month ','NUMERIC(1)','N','','                    ','1','4','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_RVDMEVSQ_S       ','YR                  ',2,'年份','year','NUMERIC(4)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','BGYR                ',6,'开始年份','beginning year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','COMMENTS            ',9,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','EDYR                ',7,'结束年份','end year','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','MNTH                ',2,'月份','month','NUMERIC(2)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','MODITIME            ',10,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','MYMAVQ              ',5,'多年旬月平均流量','multi-year-averaged values of discharge on 10-day or month','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','MYMAVZ              ',4,'多年旬月平均水位','multi-year-averaged values of stage on 10-day or month ','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','PRDTP               ',3,'旬月标示','period type of 10-day or month ','NUMERIC(1)','N','','                    ','1','3','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_RVDMMYAV_S       ','STTYRNUM            ',8,'统计年数','count of statistical years','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYSQ_S       ','AVQ                 ',6,'旬月平均流量','average discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYSQ_S       ','AVZ                 ',5,'旬月平均水位','average stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYSQ_S       ','MNTH                ',3,'月份','month','NUMERIC(2)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_RVDMMYSQ_S       ','MODITIME            ',7,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_RVDMMYSQ_S       ','PRDTP               ',4,'旬月标示','period type of 10-day or month ','NUMERIC(1)','N','','                    ','1','4','2016-11-11 11:00:40'),('ST_RVDMMYSQ_S       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_RVDMMYSQ_S       ','YR                  ',2,'年份','year','NUMERIC(4)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_RVEVS_R          ','HTZ                 ',4,'最高水位','highest stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVEVS_R          ','HTZTM               ',8,'最高水位出现时间','occurring time of highest stage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVEVS_R          ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_RVEVS_R          ','LTZ                 ',5,'最低水位','lowerest stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVEVS_R          ','LTZTM               ',9,'最低水位出现时间','occurring time of lowest stage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVEVS_R          ','MNQ                 ',7,'最小流量','minimum discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVEVS_R          ','MNQTM               ',11,'最小流量出现时间','occurring time of minimum discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVEVS_R          ','MXQ                 ',6,'最大流量','maxmum discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVEVS_R          ','MXQTM               ',10,'最大流量出现时间','occurring time of maxmum discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVEVS_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_RVEVS_R          ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_RVFCCH_B         ','FLPQ                ',8,'平滩流量','floodplain discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','GRQ                 ',7,'保证流量','guaranteed discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','GRZ                 ',6,'保证水位','guaranteed stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','HLZ                 ',21,'历史最低水位','historical lowest stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','HLZTM               ',22,'历史最低水位出现时间','occuring time of historical lowest stage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','HMNQ                ',23,'历史最小流量','historical minimum discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','HMNQTM              ',24,'历史最小流量出现时间','occuring time of historical minimum discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','HMXAVV              ',19,'历史最大断面平均流速','historical maximum average velocity in measuring cross-section','NUMERIC(9,3)',' ','米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','HMXAVVTM            ',20,'历史最大断面平均流速出现时间','occuring time of historical maximum average velocity in measuring cross-section','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','HMXS                ',17,'历史最大含沙量','historical maximum sediment concentration','NUMERIC(9,3)',' ','千克每立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','HMXSTM              ',18,'历史最大含沙量出现时间','occuring time of historical maximum sediment concentration','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','IVHZ                ',11,'调查最高水位','investigated highest stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','IVHZTM              ',12,'调查最高水位出现时间','occuring time of investigated highest stage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','IVMXQ               ',15,'调查最大流量','investigated maximum discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','IVMXQTM             ',16,'调查最大流量出现时间','occuring time of investigated maximum discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','LAQ                 ',28,'枯警流量','alarm value of little discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','LAZ                 ',27,'枯警水位','alarm value of low stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','LDKEL               ',2,'左堤高程','elevation of left dike','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','MODITIME            ',31,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','OBHTZ               ',9,'实测最高水位','observed highest stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','OBHTZTM             ',10,'实测最高水位出现时间','occuring time of observed highest stage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','OBMXQ               ',13,'实测最大流量','observed maximum discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','OBMXQTM             ',14,'实测最大流量出现时间','occuring time of observed maximum discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','RDKEL               ',3,'右堤高程','elevation of right dike','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','SFQ                 ',30,'启动预报流量标准','start standard of discharge forecasting','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','SFZ                 ',29,'启动预报水位标准','start standard of stage forecasting ','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','TAQ                 ',26,'大流量告警值','alarm value of large discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','TAZ                 ',25,'高水位告警值','alarm value of high stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','WRQ                 ',5,'警戒流量','warning discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','WRZ                 ',4,'警戒水位','warning stage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_RVSECT_B         ','BGBK                ',3,'起测岸别','beginning bank','CHAR(1)','N','','                    ','1',' ','2016-11-11 11:00:39'),('ST_RVSECT_B         ','COMMENTS            ',7,'备注','comments','CHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVSECT_B         ','DI                  ',5,'起点距','distance from initial point','NUMERIC(8,3)','N','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVSECT_B         ','MODITIME            ',8,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVSECT_B         ','MSTM                ',2,'施测时间','measuring time','DATETIME','N','','                    ',' ','2','2016-11-11 11:00:38'),('ST_RVSECT_B         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_RVSECT_B         ','VTNO                ',4,'垂线号','order of typical verticals','NUMERIC(4)','N','','                    ',' ','3','2016-11-11 11:00:39'),('ST_RVSECT_B         ','ZB                  ',6,'河底高程','elevation of river bed','NUMERIC(8,3)','N','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_RVYEVSQ_S        ','HTZ                 ',3,'最高水位','highest stage','NUMERIC(7,3)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RVYEVSQ_S        ','HTZTM               ',4,'最高水位出现时间','occurring time of highest stage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RVYEVSQ_S        ','LTZ                 ',7,'最低水位','lowerest stage','NUMERIC(7,3)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RVYEVSQ_S        ','LTZTM               ',8,'最低水位出现时间','occurring time of lowest stage','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RVYEVSQ_S        ','MNQ                 ',9,'最小流量','minimum discharge','NUMERIC(9,3)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RVYEVSQ_S        ','MNQTM               ',10,'最小流量出现时间','occurring time of minimum discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RVYEVSQ_S        ','MODITIME            ',11,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RVYEVSQ_S        ','MXQ                 ',5,'最大流量','maxmum discharge','NUMERIC(9,3)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RVYEVSQ_S        ','MXQTM               ',6,'最大流量出现时间','occurring time of maxmum discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_RVYEVSQ_S        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_RVYEVSQ_S        ','YR                  ',2,'年份','year','NUMERIC(4)','N','','                    ',' ','2','2016-11-11 11:00:41'),('ST_SEDFR_F          ','FS                  ',7,'预报含沙量','forecasting sediment concentration','NUMERIC(9,3)',' ','千克每立方米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_SEDFR_F          ','FYMDH               ',4,'依据时间','time of forecasting','DATETIME','N','','                    ',' ','4','2016-11-11 11:00:40'),('ST_SEDFR_F          ','IYMDH               ',5,'发布时间','time of forecast releasing','DATETIME','N','','                    ',' ','5','2016-11-11 11:00:40'),('ST_SEDFR_F          ','PLCD                ',3,'方案代码','plan code','CHAR(20)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_SEDFR_F          ','SCHRCD              ',8,'含沙特征码','code for characteristics of sediment concentration','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:40'),('ST_SEDFR_F          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_SEDFR_F          ','UNITNAME            ',2,'预报单位','unit name ','CHAR(30)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_SEDFR_F          ','YMDH                ',6,'发生时间','time of occurrence ','DATETIME','N','','                    ',' ','6','2016-11-11 11:00:40'),('ST_SEDRF_R          ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_SEDRF_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_SEDRF_R          ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_SEDRF_R          ','STW                 ',5,'输沙总量','total sediment runoff','NUMERIC(11,3)',' ','万吨','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SEDRF_R          ','WRNF                ',4,'输水总量','total water runoff','NUMERIC(11,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SED_R            ','S                   ',3,'含沙量','sediment concentration','NUMERIC(9,3)',' ','千克每立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SED_R            ','SCHRCD              ',4,'含沙量特征码','code for characteristics of sediment concentration','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_SED_R            ','SMT                 ',5,'含沙量测法','method of sediment concentration measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_SED_R            ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_SED_R            ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_SENDDO_E         ','EXCINF              ',7,'交换信息','EXCINF','VARCHAR(4000)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDDO_E         ','EXCKEY              ',5,'扩展关键字','EXCKEY','VARCHAR(200)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDDO_E         ','MODITIME            ',8,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDDO_E         ','OPERATION           ',6,'操作类型','OPERATION','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDDO_E         ','SLSH                ',1,'发送流水号','SLSH','NUMERIC(18,0)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDDO_E         ','STCD                ',2,'测站编码','STCD','VARCHAR(8)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDDO_E         ','TABID               ',3,'表标识','TABID','VARCHAR(30)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDDO_E         ','TM                  ',4,'数据时间','TM','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDFILE_E       ','ERRLINE             ',8,'错误行号','ERRLINE','NUMERIC(18,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDFILE_E       ','INSTCD              ',2,'单位代码','INSTCD','VARCHAR(10)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDFILE_E       ','MODITIME            ',9,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDFILE_E       ','SENDCOUNT           ',7,'发送次数','SENDCOUNT','NUMERIC(18,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDFILE_E       ','SENDSTATUS          ',4,'发送状态','SENDSTATUS','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDFILE_E       ','SENDTM              ',6,'发送时间','SENDTM','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDFILE_E       ','SENDTYPE            ',3,'发送类型','SENDTYPE','VARCHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDFILE_E       ','SFILENAME           ',5,'发送文件名','SFILENAME','VARCHAR(32)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDFILE_E       ','SFNUM               ',1,'发送文件编号','SFNUM','NUMERIC(18,0)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','COUNTB60            ',10,'30至60分钟信息量','COUNTB60','NUMERIC(9,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','COUNTDAY            ',2,'统计日期','COUNTDAY','DATETIME','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','COUNTL30            ',9,'30分钟内信息量','COUNTL30','NUMERIC(9,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','COUNTT60            ',11,'大于60分钟信息量','COUNTT60','NUMERIC(9,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','FRGRD               ',4,'报汛等级','FRGRD','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','INFNUM              ',8,'信息量','INFNUM','NUMERIC(9,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','INFTYPE             ',6,'信息类型','INFTYPE','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','INSTCD              ',1,'单位代码','INSTCD','VARCHAR(10)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','MODITIME            ',12,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','OPERATION           ',5,'操作类型','OPERATION','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','STCDNUM             ',7,'测站数量','STCDNUM','NUMERIC(6,0)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDSTAT_E       ','STTDRCD             ',3,'统计时段标志','STTDRCD','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDTO_E         ','INSTCD              ',1,'单位代码','INSTCD','VARCHAR(10)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDTO_E         ','MODITIME            ',7,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDTO_E         ','SENDSTATUS          ',5,'发送状态','SENDSTATUS','VARCHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDTO_E         ','SFNUM               ',3,'发送文件编号','SFNUM','NUMERIC(18,0)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDTO_E         ','SLSH                ',2,'发送流水号','SLSH','NUMERIC(18,0)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDTO_E         ','STAT                ',6,'统计标记','STAT','VARCHAR(1)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDTO_E         ','TM                  ',4,'数据时间','TM','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDWAIT_E       ','EXCINF              ',7,'交换信息','EXCINF','VARCHAR(4000)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDWAIT_E       ','EXCKEY              ',5,'扩展关键字','EXCKEY','VARCHAR(200)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDWAIT_E       ','MODITIME            ',9,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDWAIT_E       ','OPERATION           ',6,'操作类型','OPERATION','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDWAIT_E       ','POLLSTATUS          ',8,'轮询状态','POLLSTATUS','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDWAIT_E       ','SLSH                ',1,'发送流水号','SLSH','NUMERIC(18,0)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SENDWAIT_E       ','STCD                ',2,'测站编码','STCD','VARCHAR(8)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDWAIT_E       ','TABID               ',3,'表标识','TABID','VARCHAR(30)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SENDWAIT_E       ','TM                  ',4,'数据时间','TM','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SNOW_R           ','SNOWDEN             ',4,'积雪密度','snow density','NUMERIC(3,2)',' ','克每立方厘米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SNOW_R           ','SNOWDEP             ',3,'积雪深度','snow depth','NUMERIC(3)',' ','厘米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SNOW_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_SNOW_R           ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_SOILCH_B         ','COMMENTS            ',11,'备注','comments','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','DSD                 ',6,'土壤干容重','dry soil sensity ','NUMERIC(4,2)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','FDCP                ',9,'田间持水量','field capacity ','NUMERIC(4,2)',' ','%','                    ',' ',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','MODITIME            ',12,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','SFBR                ',4,'土壤结构','soil fabric ','CHAR(20)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','SHWC                ',8,'饱和含水量','soil hygroscopic water content ','NUMERIC(4,2)',' ','%','                    ',' ',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','SLTP                ',2,'土壤类别','soil type','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','SLTX                ',3,'土壤质地','soil texture','CHAR(2)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','SPOR                ',7,'土壤孔隙度','soil porosity ','NUMERIC(4,2)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','SSPG                ',5,'土壤比重','soil specific gravity ','NUMERIC(4,2)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_SOILCH_B         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_SOILCH_B         ','WLCP                ',10,'凋萎含水量','wilting capacity','NUMERIC(4,2)',' ','%','                    ',' ',' ','2016-11-11 11:00:38'),('ST_SOIL_R           ','CRPGRWPRD           ',14,'作物生长期','period of crop growth','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','CRPTY               ',13,'作物种类','crop type','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','EXKEY               ',3,'扩展关键字','extend keywords','CHAR(1)','N','',' @、A到Z            ',' ','3','2016-11-11 11:00:39'),('ST_SOIL_R           ','HITRSN              ',15,'作物水分状态','crop moisture content status','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','SLM10               ',6,'10cm深度含水量','soil moisture content at point 10cm below ground','NUMERIC(4,1)',' ','%','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','SLM100              ',12,'100cm深度含水量','soil moisture content at point 100cm below ground','NUMERIC(4,1)',' ','%','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','SLM20               ',7,'20cm深度含水量','soil moisture content at point 20cm below ground','NUMERIC(4,1)',' ','%','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','SLM30               ',8,'30cm深度含水量','soil moisture content at point 30cm below ground','NUMERIC(4,1)',' ','%','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','SLM40               ',9,'40cm深度含水量','soil moisture content at point 40cm below ground','NUMERIC(4,1)',' ','%','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','SLM60               ',10,'60cm深度含水量','soil moisture content at point 60cm below ground','NUMERIC(4,1)',' ','%','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','SLM80               ',11,'80cm深度含水量','soil moisture content at point 80cm below ground','NUMERIC(4,1)',' ','%','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','SLMMMT              ',16,'土壤含水量测法','method of soil moisture content measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','SRLSLM              ',5,'表层含水量','soil moisture content in surface layer','NUMERIC(4,1)',' ','%','                    ',' ',' ','2016-11-11 11:00:39'),('ST_SOIL_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_SOIL_R           ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_SOIL_R           ','VTAVSLM             ',4,'垂线平均含水量','vertical averaged soil moisture content','NUMERIC(4,1)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_STBPRP_B         ','ADDVCD              ',9,'行政区划码','administration division code','CHAR(6)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','ADMAUTH             ',18,'信息管理单位','administering authority','CHAR(20)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','ATCUNIT             ',17,'隶属行业单位','attached unit','CHAR(20)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','BGFRYM              ',16,'始报年月','beginning year and month of flood-reporting','CHAR(6)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','BSNM                ',5,'流域名称','basin name','CHAR(30)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','COMMENTS            ',26,'备注','comments','VARCHAR(200)',' ','','不超过100个汉字     ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','DRNA                ',23,'集水面积','drainage area','NUMERIC(7)',' ','平方公里','计至整数位          ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','DSTRVM              ',22,'至河口距离','distance to river mouth','NUMERIC(6,1)',' ','公里','保留一位小数        ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','DTMEL               ',11,'基面高程','datum elevation','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','DTMNM               ',10,'基面名称','datum name','CHAR(16)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','DTPR                ',12,'基面修正值','modifying datum','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','ESSTYM              ',15,'建站年月','year and month of establish station','CHAR(6)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','FRGRD               ',14,'报汛等级','grade of flood-reporting','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','HNNM                ',4,'水系名称','hydrographic net name','CHAR(30)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','LGTD                ',6,'经度','east longitude','NUMERIC(10,6)',' ','度','保留6位小数         ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','LOCALITY            ',19,'交换管理单位','locality','CHAR(10)','N','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','LTTD                ',7,'纬度','north latitude','NUMERIC(10,6)',' ','度','保留6位小数         ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','MODITIME            ',27,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','PHCD                ',24,'拼音码','phonetic code','CHAR(6)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','RVNM                ',3,'河流名称','river name','CHAR(30)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','STAZT               ',21,'测站方位','station direction','NUMERIC(3)',' ','度','45度步长取值        ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','STBK                ',20,'测站岸别','station bank','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_STBPRP_B         ','STLC                ',8,'站址','station location','CHAR(50)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','STNM                ',2,'测站名称','station name','CHAR(30)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','STTP                ',13,'站类','station type','CHAR(2)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STBPRP_B         ','USFL                ',25,'启用标志','used flag','CHAR(1)',' ','','“0”和“1”        ','1',' ','2016-11-11 11:00:38'),('ST_STCD_E           ','INSTCD              ',1,'单位代码','institute code ','VARCHAR(10)','N','','                    ',' ','1','2016-11-11 11:00:41'),('ST_STCD_E           ','MODITIME            ',4,'时间戳','modification timestamp','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_STCD_E           ','SCFL                ',3,'发送控制标志','send information control flag','CHAR(4)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_STCD_E           ','STCD                ',2,'测站编码','station code','VARCHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:41'),('ST_STORM_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_STORM_R          ','STRMDR              ',3,'暴雨历时','storm duration','NUMERIC(5,2)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_STORM_R          ','STRMP               ',4,'暴雨量','storm precipitation','NUMERIC(4,1)',' ','毫米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_STORM_R          ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_STORM_R          ','WTH                 ',5,'天气状况','weather','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_STSMCNT_E        ','COUNTDAY            ',3,'统计日期','COUNTDAY','DATETIME','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_STSMCNT_E        ','DCNT                ',9,'删除信息量','DCNT','NUMERIC(9,0)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_STSMCNT_E        ','FRGRD               ',6,'报汛等级','FRGRD','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_STSMCNT_E        ','ICNT                ',7,'插入信息量','ICNT','NUMERIC(9,0)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_STSMCNT_E        ','INFSTATUS           ',4,'信息状态','INFSTATUS','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_STSMCNT_E        ','INFTYPE             ',5,'信息类型','INFTYPE','VARCHAR(1)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_STSMCNT_E        ','INSTCD              ',1,'单位代码','INSTCD','VARCHAR(10)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_STSMCNT_E        ','MODITIME            ',10,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_STSMCNT_E        ','STCD                ',2,'测站编码','STCD','VARCHAR(8)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_STSMCNT_E        ','UCNT                ',8,'更新信息量','UCNT','NUMERIC(9,0)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_STSMTASK_B       ','DAMFL               ',9,'闸门启闭标志','gates operation flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','DFRTMS              ',2,'报汛段次','times of daily flood - reporting','NUMERIC(2)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','DRNFL               ',15,'排水量标志','flag of water drained volume','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','EFL                 ',4,'蒸发量标志','evaporation flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','GRWFL               ',17,'地下水标志','groundwater flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','ICEFL               ',13,'冰情标志','ice flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','INQFL               ',8,'入库流量标志','reservoir inflow discharge flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','MODITIME            ',22,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','MPHONE              ',20,'移动电话号码','mobile telephone','CHAR(11)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','OFFICER             ',19,'测站联系人','station officer','CHAR(12)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','OTQFL               ',10,'出库流量标志','reservoir outflow discharge flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','PFL                 ',3,'降水量标志','precipitation flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','PPFL                ',14,'引水量标志','flag of water pumped volume','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','QFL                 ',6,'流量标志','discharge flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','SEDFL               ',12,'泥沙标志','sediment flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','SOILFL              ',16,'墒情标志','soil moisture flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','SPHONE              ',21,'固定电话号码','station telephone','CHAR(12)','N','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','STATFL              ',18,'旬月统计标志','flag of statistics on 10-day or month','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','WDWVFL              ',11,'风浪标志','wind & wave flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','WFL                 ',7,'蓄水量标志','reservoir storage flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','ZFL                 ',5,'水位标志','stage flag','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:38'),('ST_SYNCSET_E        ','SYSNAME             ',1,'配置名','SYSNAME','VARCHAR(32)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SYNCSET_E        ','SYSVALUE            ',2,'配置值','SYSVALUE','VARCHAR(200)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SYSLOG_E         ','LOGCONTENT          ',3,'日志内容','LOGCONTENT','VARCHAR(512)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SYSLOG_E         ','LOGLSH              ',1,'日志流水号','LOGLSH','NUMERIC(18,0)','N','','                    ',' ','Y','2016-11-11 11:00:41'),('ST_SYSLOG_E         ','LOGTYPE             ',2,'日志类型','LOGTYPE','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_SYSLOG_E         ','MODITIME            ',4,'时间戳','MODITIME','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_TABLE_D          ','EXCHFL              ',5,'交换标示','exchange flag','CHAR(1)','N','','                    ','1',' ','2016-11-11 11:00:41'),('ST_TABLE_D          ','MODITIME            ',6,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_TABLE_D          ','TABCN               ',3,'表中文名','chinese name of the table','VARCHAR(30)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_TABLE_D          ','TABEN               ',4,'表英文名','english name of the table','VARCHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_TABLE_D          ','TABID               ',1,'表标识','table identifying','CHAR(20)','N','','                    ',' ','1','2016-11-11 11:00:41'),('ST_TABLE_D          ','TABNO               ',2,'表编号','serial number of the table','CHAR(11)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_TABLE_E          ','INSTCD              ',1,'单位代码','institute code ','VARCHAR(10)','N','','                    ',' ','1','2016-11-11 11:00:41'),('ST_TABLE_E          ','ISSTARTS            ',3,'启动交换','start exchange','VARCHAR(1)','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_TABLE_E          ','MODITIME            ',4,'时间戳','modification timestamp','DATETIME','N','','                    ',' ',' ','2016-11-11 11:00:41'),('ST_TABLE_E          ','TABID               ',2,'表标识','table identifying','VARCHAR(20)','N','','                    ',' ','2','2016-11-11 11:00:41'),('ST_TDFR_F           ','FYMDH               ',4,'预报时间','time of forecasting','DATETIME','N','','                    ',' ','4','2016-11-11 11:00:40'),('ST_TDFR_F           ','HLTDMK              ',9,'高低潮标志','marker of high/low tide','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:40'),('ST_TDFR_F           ','IYMDH               ',5,'发布时间','time of forecast releasing','DATETIME','N','','                    ',' ','5','2016-11-11 11:00:40'),('ST_TDFR_F           ','PLCD                ',3,'方案代码','plan code','CHAR(20)','N','','                    ',' ','3','2016-11-11 11:00:40'),('ST_TDFR_F           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_TDFR_F           ','STRMSRG             ',8,'预报增水','stream multiplied storage','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TDFR_F           ','TDZ                 ',7,'预报潮位','tidal level','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TDFR_F           ','UNITNAME            ',2,'预报单位','unit name ','CHAR(30)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_TDFR_F           ','YMDH                ',6,'发生时间','time of occurrence ','DATETIME','N','','                    ',' ','6','2016-11-11 11:00:40'),('ST_TIDEAV_R         ','AVHTDZ              ',4,'平均高潮位','average level of high tide','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_TIDEAV_R         ','AVLTDZ              ',5,'平均低潮位','average level of low tide','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_TIDEAV_R         ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_TIDEAV_R         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_TIDEAV_R         ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_TIDEEVS_R        ','HTTDZ               ',4,'最高潮水位','highest tidal level','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TIDEEVS_R        ','HTTDZTM             ',7,'最高潮位出现时间','occurring time of highest tidal level','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TIDEEVS_R        ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_TIDEEVS_R        ','LTTDZ               ',5,'最低潮水位','lowest tidal level','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TIDEEVS_R        ','LTTDZTM             ',8,'最低潮位出现时间','occuring time of lowest tidal level','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TIDEEVS_R        ','MXWNDV              ',6,'最大风速','maximum wind velocity','NUMERIC(4,1)',' ','米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TIDEEVS_R        ','MXWNDVTM            ',9,'最大风速出现时间','occuring time of maximum wind velocity','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TIDEEVS_R        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_TIDEEVS_R        ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:40'),('ST_TIDE_R           ','AIRP                ',4,'气压','atmospheric pressure','NUMERIC(5)',' ','百帕','                    ',' ',' ','2016-11-11 11:00:39'),('ST_TIDE_R           ','HLTDMK              ',7,'高低潮标志','marker of high/low tide','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_TIDE_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_TIDE_R           ','TDCHRCD             ',5,'潮水特征码','code for chracteristics of tidal current','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_TIDE_R           ','TDPTN               ',6,'潮势','tidal potential','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_TIDE_R           ','TDZ                 ',3,'潮位','tidal level','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_TIDE_R           ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_TMPAV_R          ','AVATMP              ',4,'平均气温','average air temperature','NUMERIC(3,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:39'),('ST_TMPAV_R          ','AVWTMP              ',5,'平均水温','average water temperature','NUMERIC(3,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:39'),('ST_TMPAV_R          ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_TMPAV_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_TMPAV_R          ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_TMPEVS_R         ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','MNATMP              ',5,'最低气温','minimum air temperature','NUMERIC(3,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','MNATMPTM            ',9,'最低气温出现时间','occuring time of minimum air temperature','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','MNWTMP              ',7,'最低水温','minimum water temperature','NUMERIC(3,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','MNWTMPTM            ',11,'最低水温出现时间','occuring time of minimum water temperature','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','MXATMP              ',4,'最高气温','maximum air temperature','NUMERIC(3,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','MXATMPTM            ',8,'最高气温出现时间','occuring time of maximum air temperature','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','MXWTMP              ',6,'最高水温','maximum water temperature','NUMERIC(3,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','MXWTMPTM            ',10,'最高水温出现时间','occuring time of maximum water temperature','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_TMPEVS_R         ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:40'),('ST_TMP_R            ','ATMP                ',3,'气温','air temperature','NUMERIC(3,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:39'),('ST_TMP_R            ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_TMP_R            ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_TMP_R            ','WTMP                ',4,'水温','water temperature','NUMERIC(3,1)',' ','摄氏度','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WASAV_R          ','AVDWZ               ',5,'平均闸下水位','average stage in sluice downstream','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WASAV_R          ','AVGTQ               ',6,'平均过闸流量','average gate discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WASAV_R          ','AVUPZ               ',4,'平均闸上水位','average stage in sluice upstream','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WASAV_R          ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_WASAV_R          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_WASAV_R          ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_WASEVS_R         ','HTDWZ               ',8,'最高闸下水位','highest stage in sluice downstream','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','HTDWZTM             ',14,'最高闸下水位出现时间','occuring time of highest stage in sluice downstream','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','HTUPZ               ',4,'最高闸上水位','highest stage in sluice upstream','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','HTUPZTM             ',10,'最高闸上水位出现时间','occuring time of highest stage in sluice upstream','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:40'),('ST_WASEVS_R         ','LTDWZ               ',9,'最低闸下水位','lowest stage in sluice downstream','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','LTDWZTM             ',15,'最低闸下水位出现时间','occuring time of lowest stage in sluice downstream','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','LTUPZ               ',5,'最低闸上水位','lowest stage in sluice upstream','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','LTUPZTM             ',11,'最低闸上水位出现时间','occuring time of lowest stage in sluice upstream','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','MNGTQ               ',7,'最小过闸流量','minimum gate discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','MNGTQTM             ',13,'最小过闸流量出现时间','occuring time of minimun gate discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','MXGTQ               ',6,'最大过闸流量','maximum gate discharge','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','MXGTQTM             ',12,'最大过闸流量出现时间','occuring time of maximun gate discharge','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:40'),('ST_WASEVS_R         ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:40'),('ST_WASEVS_R         ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:40'),('ST_WASRL_B          ','MODITIME            ',4,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_WASRL_B          ','RLMRK               ',3,'关系标志','marker of relationship of weir (sluice) stations','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:38'),('ST_WASRL_B          ','RLSTCD              ',2,'关联站码','relating station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:38'),('ST_WASRL_B          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_WAS_R            ','DWZ                 ',4,'闸下水位','stage in sluice downstream','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WAS_R            ','MSQMT               ',9,'测流方法','method of flow measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_WAS_R            ','SDWWPTN             ',8,'闸下水势','water potential in sluice downstream','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_WAS_R            ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_WAS_R            ','SUPWPTN             ',7,'闸上水势','water potential in sluice upstream','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_WAS_R            ','SWCHRCD             ',6,'闸水特征码','code for characteristics of flow in upstream of sluice','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_WAS_R            ','TGTQ                ',5,'总过闸流量','total outflow discharges in sluice','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WAS_R            ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_WAS_R            ','UPZ                 ',3,'闸上水位','stage in sluice upstream','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WDPSTAT_R        ','ACCDW               ',8,'累计排水量','accumulative volume of  water drained','NUMERIC(11,3)',' ','万立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WDPSTAT_R        ','ACCPW               ',5,'累计引水量','accumulative volume of water pumped','NUMERIC(11,3)',' ','万立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WDPSTAT_R        ','DRNHRS              ',9,'排水时数','hours of draining','NUMERIC(6,2)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WDPSTAT_R        ','DRNTMS              ',7,'排水次数','times of drainage','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WDPSTAT_R        ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_WDPSTAT_R        ','PPHRS               ',6,'引水时数','hours of pumping','NUMERIC(6,2)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WDPSTAT_R        ','PPTMS               ',4,'引水次数','times of pumping','NUMERIC(4)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WDPSTAT_R        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_WDPSTAT_R        ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_WDWV_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_WDWV_R           ','TM                  ',2,'时间','time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_WDWV_R           ','WNDDIR              ',5,'风向','wind direction','CHAR(2)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_WDWV_R           ','WNDPWR              ',4,'风力','wind power','NUMERIC(2)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_WDWV_R           ','WNDV                ',3,'风速','wind velocity','NUMERIC(4,1)',' ','米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WDWV_R           ','WVHGT               ',6,'浪高','wave height','NUMERIC(4)',' ','厘米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WGRWSTAT_R       ','ACCGDW              ',4,'累计开采量','accumulative volume of groundwater exploited','NUMERIC(5)',' ','万立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WGRWSTAT_R       ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_WGRWSTAT_R       ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_WGRWSTAT_R       ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_WGRW_R           ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_WGRW_R           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_WGRW_R           ','STTDRCD             ',3,'统计时段标志','code of statistical duration','CHAR(1)','N','','                    ','1','3','2016-11-11 11:00:39'),('ST_WGRW_R           ','WLMIN               ',4,'水井开采量','mining of well','NUMERIC(11,4)',' ','万立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WGRW_R           ','WLMINMT             ',5,'水井开采量测法','method of well mining measurement','CHAR(1)',' ','','                    ','1',' ','2016-11-11 11:00:39'),('ST_WSPAVSD_R        ','DRAVQ               ',5,'时段平均流量','average discharge in a period of time','NUMERIC(9,3)',' ','立方米每秒','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WSPAVSD_R        ','DRAVZ               ',4,'时段平均水位','average stage in a period of time','NUMERIC(7,3)',' ','米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WSPAVSD_R        ','DRDW                ',7,'时段排水量','volume of water drained in a period of time','NUMERIC(11,3)',' ','立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WSPAVSD_R        ','DRPW                ',6,'时段引水量','volume of water pumped in a period of time','NUMERIC(11,3)',' ','立方米','                    ',' ',' ','2016-11-11 11:00:39'),('ST_WSPAVSD_R        ','IDTM                ',2,'标志时间','identifying time','DATETIME','N','','                    ',' ','1','2016-11-11 11:00:39'),('ST_WSPAVSD_R        ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','2','2016-11-11 11:00:39'),('ST_WSPAVSD_R        ','STTDR               ',3,'统计时段长','statistical duration','NUMERIC(5,2)',' ','','                    ',' ',' ','2016-11-11 11:00:39'),('ST_ZQRL_B           ','BGTM                ',3,'启用时间','beginning time','DATETIME','N','','                    ',' ','3','2016-11-11 11:00:38'),('ST_ZQRL_B           ','COMMENTS            ',7,'备注','comments','CHAR(200)',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_ZQRL_B           ','LNNM                ',2,'曲线名称','line name','CHAR(30)','N','','                    ',' ','2','2016-11-11 11:00:38'),('ST_ZQRL_B           ','MODITIME            ',8,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_ZQRL_B           ','PTNO                ',4,'点序号','order of curve point','NUMERIC(4)','N','','                    ',' ','4','2016-11-11 11:00:38'),('ST_ZQRL_B           ','Q                   ',6,'流量','discharge','NUMERIC(9,3)','N','立方米每秒','                    ',' ',' ','2016-11-11 11:00:38'),('ST_ZQRL_B           ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_ZQRL_B           ','Z                   ',5,'水位','stage','NUMERIC(7,3)','N','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_ZVARL_B          ','MODITIME            ',7,'时间戳','modification timestamp','DATETIME',' ','','                    ',' ',' ','2016-11-11 11:00:38'),('ST_ZVARL_B          ','MSTM                ',2,'施测时间','measuring time','DATETIME','N','','                    ',' ','2','2016-11-11 11:00:38'),('ST_ZVARL_B          ','PTNO                ',3,'点序号','order of curve point','NUMERIC(4)','N','','                    ',' ','3','2016-11-11 11:00:38'),('ST_ZVARL_B          ','RZ                  ',4,'库水位','stage in reservoir region','NUMERIC(7,3)','N','米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_ZVARL_B          ','STCD                ',1,'测站编码','station code','CHAR(8)','N','','                    ',' ','1','2016-11-11 11:00:38'),('ST_ZVARL_B          ','W                   ',5,'蓄水量','reservoir storage','NUMERIC(9,3)',' ','百万立方米','                    ',' ',' ','2016-11-11 11:00:38'),('ST_ZVARL_B          ','WSFA                ',6,'水面面积','water surface area','NUMERIC(7)',' ','平方公里','                    ',' ',' ','2016-11-11 11:00:38');
/*!40000 ALTER TABLE `st_field_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_forecast_f`
--

DROP TABLE IF EXISTS `st_forecast_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_forecast_f` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `UNITNAME` varchar(30) CHARACTER SET utf8 NOT NULL,
  `PLCD` varchar(20) CHARACTER SET utf8 NOT NULL,
  `FYMDH` datetime NOT NULL,
  `IYMDH` datetime NOT NULL,
  `YMDH` datetime NOT NULL,
  `Z` decimal(9,3) DEFAULT NULL,
  `Q` decimal(11,3) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`UNITNAME`,`PLCD`,`FYMDH`,`IYMDH`,`YMDH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_forecast_f`
--

LOCK TABLES `st_forecast_f` WRITE;
/*!40000 ALTER TABLE `st_forecast_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_forecast_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_forecastc_f`
--

DROP TABLE IF EXISTS `st_forecastc_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_forecastc_f` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `UNITNAME` varchar(30) CHARACTER SET utf8 NOT NULL,
  `PLCD` varchar(20) CHARACTER SET utf8 NOT NULL,
  `FYMDH` datetime NOT NULL,
  `IYMDH` datetime NOT NULL,
  `WNSTATUS` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`UNITNAME`,`PLCD`,`FYMDH`,`IYMDH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_forecastc_f`
--

LOCK TABLES `st_forecastc_f` WRITE;
/*!40000 ALTER TABLE `st_forecastc_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_forecastc_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_frapar_b`
--

DROP TABLE IF EXISTS `st_frapar_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_frapar_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TPCYR` decimal(6,0) NOT NULL,
  `VARTP` varchar(3) CHARACTER SET utf8 NOT NULL,
  `AVRG` decimal(13,4) NOT NULL,
  `CV` decimal(7,3) NOT NULL,
  `CS` decimal(7,3) NOT NULL,
  `BGYR` decimal(6,0) NOT NULL,
  `EDYR` decimal(6,0) NOT NULL,
  `SPNUM` decimal(6,0) NOT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TPCYR`,`VARTP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_frapar_b`
--

LOCK TABLES `st_frapar_b` WRITE;
/*!40000 ALTER TABLE `st_frapar_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_frapar_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_fsdr_b`
--

DROP TABLE IF EXISTS `st_fsdr_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_fsdr_b` (
  `UPSTCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `DWSTCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `RCHLEN` decimal(5,0) DEFAULT NULL,
  `SFTQ` decimal(11,3) DEFAULT NULL,
  `QMGN` decimal(7,0) NOT NULL,
  `MNTRTM` decimal(7,2) DEFAULT NULL,
  `MXTRTM` decimal(7,2) DEFAULT NULL,
  `AVTRTM` decimal(7,2) DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`UPSTCD`,`DWSTCD`,`QMGN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_fsdr_b`
--

LOCK TABLES `st_fsdr_b` WRITE;
/*!40000 ALTER TABLE `st_fsdr_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_fsdr_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_gate_r`
--

DROP TABLE IF EXISTS `st_gate_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_gate_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `EXKEY` varchar(1) CHARACTER SET utf8 NOT NULL,
  `EQPTP` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `EQPNO` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `GTOPNUM` decimal(5,0) DEFAULT NULL,
  `GTOPHGT` decimal(7,2) DEFAULT NULL,
  `GTQ` decimal(11,3) DEFAULT NULL,
  `MSQMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`,`EXKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_gate_r`
--

LOCK TABLES `st_gate_r` WRITE;
/*!40000 ALTER TABLE `st_gate_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_gate_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_grw_r`
--

DROP TABLE IF EXISTS `st_grw_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_grw_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `GWBD` decimal(8,2) DEFAULT NULL,
  `GWBDRMK` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SPQ` decimal(11,3) DEFAULT NULL,
  `GWTMP` decimal(6,1) DEFAULT NULL,
  `GWPTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SPQMMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_grw_r`
--

LOCK TABLES `st_grw_r` WRITE;
/*!40000 ALTER TABLE `st_grw_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_grw_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_grwav_r`
--

DROP TABLE IF EXISTS `st_grwav_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_grwav_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `AVGWBD` decimal(9,3) DEFAULT NULL,
  `AVSPQ` decimal(9,3) DEFAULT NULL,
  `AVGWTMP` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_grwav_r`
--

LOCK TABLES `st_grwav_r` WRITE;
/*!40000 ALTER TABLE `st_grwav_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_grwav_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_grwevs_r`
--

DROP TABLE IF EXISTS `st_grwevs_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_grwevs_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `MXBD` decimal(9,3) DEFAULT NULL,
  `MNBD` decimal(9,3) DEFAULT NULL,
  `MXSPQ` decimal(11,3) DEFAULT NULL,
  `MNSPQ` decimal(11,3) DEFAULT NULL,
  `MXGWTMP` decimal(6,2) DEFAULT NULL,
  `MNGWTMP` decimal(6,2) DEFAULT NULL,
  `MXBDTM` datetime DEFAULT NULL,
  `MNBDTM` datetime DEFAULT NULL,
  `MXSPQTM` datetime DEFAULT NULL,
  `MNSPQTM` datetime DEFAULT NULL,
  `MXGWTMPTM` datetime DEFAULT NULL,
  `MNGWTMPTM` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_grwevs_r`
--

LOCK TABLES `st_grwevs_r` WRITE;
/*!40000 ALTER TABLE `st_grwevs_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_grwevs_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_hail_r`
--

DROP TABLE IF EXISTS `st_hail_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_hail_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `HPD` decimal(5,0) DEFAULT NULL,
  `HLDR` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_hail_r`
--

LOCK TABLES `st_hail_r` WRITE;
/*!40000 ALTER TABLE `st_hail_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_hail_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_icefr_f`
--

DROP TABLE IF EXISTS `st_icefr_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_icefr_f` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `UNITNAME` varchar(30) CHARACTER SET utf8 NOT NULL,
  `PLCD` varchar(20) CHARACTER SET utf8 NOT NULL,
  `FYMDH` datetime NOT NULL,
  `IYMDH` datetime NOT NULL,
  `YMDH` datetime NOT NULL,
  `EXKEY` varchar(1) CHARACTER SET utf8 NOT NULL,
  `FICD` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `FIRPSTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `FRLDSTN` decimal(5,1) DEFAULT NULL,
  `FITHK` decimal(6,1) DEFAULT NULL,
  `ITHKCD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `FIQ` decimal(11,3) DEFAULT NULL,
  `IQPROP` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`UNITNAME`,`PLCD`,`FYMDH`,`IYMDH`,`YMDH`,`EXKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_icefr_f`
--

LOCK TABLES `st_icefr_f` WRITE;
/*!40000 ALTER TABLE `st_icefr_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_icefr_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_instcd_b`
--

DROP TABLE IF EXISTS `st_instcd_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_instcd_b` (
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `INSTNM` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `LOCALITY` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`INSTCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_instcd_b`
--

LOCK TABLES `st_instcd_b` WRITE;
/*!40000 ALTER TABLE `st_instcd_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_instcd_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_instcd_e`
--

DROP TABLE IF EXISTS `st_instcd_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_instcd_e` (
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `INSTNM` varchar(40) CHARACTER SET utf8 NOT NULL,
  `EXCTYPE` varchar(1) CHARACTER SET utf8 NOT NULL,
  `EXCIP` varchar(39) CHARACTER SET utf8 NOT NULL,
  `EXCPORT` decimal(7,0) NOT NULL,
  `EXCSRV` varchar(32) CHARACTER SET utf8 NOT NULL,
  `WEBURL` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PASSWORD` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `TRFL` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `ISSTARTS` varchar(1) CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`INSTCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_instcd_e`
--

LOCK TABLES `st_instcd_e` WRITE;
/*!40000 ALTER TABLE `st_instcd_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_instcd_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_netstat_e`
--

DROP TABLE IF EXISTS `st_netstat_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_netstat_e` (
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `CHANGETIME` datetime NOT NULL,
  `NETTYPE` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `NETSTATUS` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`INSTCD`,`CHANGETIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_netstat_e`
--

LOCK TABLES `st_netstat_e` WRITE;
/*!40000 ALTER TABLE `st_netstat_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_netstat_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_pddmyav_s`
--

DROP TABLE IF EXISTS `st_pddmyav_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_pddmyav_s` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `MNTH` decimal(4,0) NOT NULL,
  `DAY` decimal(4,0) NOT NULL,
  `MYDAVP` decimal(7,1) DEFAULT NULL,
  `BGYR` decimal(6,0) DEFAULT NULL,
  `EDYR` decimal(6,0) DEFAULT NULL,
  `STTYRNUM` decimal(6,0) DEFAULT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`MNTH`,`DAY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_pddmyav_s`
--

LOCK TABLES `st_pddmyav_s` WRITE;
/*!40000 ALTER TABLE `st_pddmyav_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_pddmyav_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_pdmmyav_s`
--

DROP TABLE IF EXISTS `st_pdmmyav_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_pdmmyav_s` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `MNTH` decimal(4,0) NOT NULL,
  `PRDTP` decimal(3,0) NOT NULL,
  `MYMAVP` decimal(7,1) DEFAULT NULL,
  `BGYR` decimal(6,0) DEFAULT NULL,
  `EDYR` decimal(6,0) DEFAULT NULL,
  `STTYRNUM` decimal(6,0) DEFAULT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`MNTH`,`PRDTP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_pdmmyav_s`
--

LOCK TABLES `st_pdmmyav_s` WRITE;
/*!40000 ALTER TABLE `st_pdmmyav_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_pdmmyav_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_pdmmysq_s`
--

DROP TABLE IF EXISTS `st_pdmmysq_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_pdmmysq_s` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `YR` decimal(6,0) NOT NULL,
  `MNTH` decimal(4,0) NOT NULL,
  `PRDTP` decimal(3,0) NOT NULL,
  `ACCP` decimal(7,1) DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`YR`,`MNTH`,`PRDTP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_pdmmysq_s`
--

LOCK TABLES `st_pdmmysq_s` WRITE;
/*!40000 ALTER TABLE `st_pdmmysq_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_pdmmysq_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_pmevs_r`
--

DROP TABLE IF EXISTS `st_pmevs_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_pmevs_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `PPUPHTZ` decimal(9,3) DEFAULT NULL,
  `PPUPLTZ` decimal(9,3) DEFAULT NULL,
  `PPDWHTZ` decimal(9,3) DEFAULT NULL,
  `PPDWLTZ` decimal(9,3) DEFAULT NULL,
  `MXPPQ` decimal(11,3) DEFAULT NULL,
  `MNPPQ` decimal(11,3) DEFAULT NULL,
  `MXDNQ` decimal(11,3) DEFAULT NULL,
  `MNDNQ` decimal(11,3) DEFAULT NULL,
  `PPUPHTZTM` datetime DEFAULT NULL,
  `PPUPLTZTM` datetime DEFAULT NULL,
  `PPDWHTZTM` datetime DEFAULT NULL,
  `PPDWLTZTM` datetime DEFAULT NULL,
  `MXPPQTM` datetime DEFAULT NULL,
  `MNPPQTM` datetime DEFAULT NULL,
  `MXDNQTM` datetime DEFAULT NULL,
  `MNDNQTM` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_pmevs_r`
--

LOCK TABLES `st_pmevs_r` WRITE;
/*!40000 ALTER TABLE `st_pmevs_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_pmevs_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_pptn_r`
--

DROP TABLE IF EXISTS `st_pptn_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_pptn_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `DRP` decimal(7,1) DEFAULT NULL,
  `INTV` decimal(7,2) DEFAULT NULL,
  `PDR` decimal(7,2) DEFAULT NULL,
  `DYP` decimal(7,1) DEFAULT NULL,
  `WTH` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_pptn_r`
--

LOCK TABLES `st_pptn_r` WRITE;
/*!40000 ALTER TABLE `st_pptn_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_pptn_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_pstat_r`
--

DROP TABLE IF EXISTS `st_pstat_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_pstat_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `ACCP` decimal(8,1) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_pstat_r`
--

LOCK TABLES `st_pstat_r` WRITE;
/*!40000 ALTER TABLE `st_pstat_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_pstat_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_pump_r`
--

DROP TABLE IF EXISTS `st_pump_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_pump_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `PPUPZ` decimal(9,3) DEFAULT NULL,
  `PPDWZ` decimal(9,3) DEFAULT NULL,
  `OMCN` decimal(5,0) DEFAULT NULL,
  `OMPWR` decimal(7,0) DEFAULT NULL,
  `PMPQ` decimal(9,3) DEFAULT NULL,
  `PPWCHRCD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `PPUPWPTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `PPDWWPTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `MSQMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `PDCHCD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_pump_r`
--

LOCK TABLES `st_pump_r` WRITE;
/*!40000 ALTER TABLE `st_pump_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_pump_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_qliceinf_r`
--

DROP TABLE IF EXISTS `st_qliceinf_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_qliceinf_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `EXKEY` varchar(1) CHARACTER SET utf8 NOT NULL,
  `QLTICD` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `RLPSTN` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `RLDSTN` decimal(5,1) DEFAULT NULL,
  `QLTITHK` decimal(6,1) DEFAULT NULL,
  `IOSNDP` decimal(4,0) DEFAULT NULL,
  `IUDFSTHK` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`,`EXKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_qliceinf_r`
--

LOCK TABLES `st_qliceinf_r` WRITE;
/*!40000 ALTER TABLE `st_qliceinf_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_qliceinf_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_qticeinf_r`
--

DROP TABLE IF EXISTS `st_qticeinf_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_qticeinf_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `EXKEY` varchar(1) CHARACTER SET utf8 NOT NULL,
  `QNTICD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `RLPSTN` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `RLDSTN` decimal(5,1) DEFAULT NULL,
  `LBDIWD` decimal(3,0) DEFAULT NULL,
  `RBDIWD` decimal(3,0) DEFAULT NULL,
  `BDITHK` decimal(6,1) DEFAULT NULL,
  `IRCON` decimal(3,0) DEFAULT NULL,
  `DITHK` decimal(6,1) DEFAULT NULL,
  `MXIA` decimal(6,0) DEFAULT NULL,
  `MXIV` decimal(5,1) DEFAULT NULL,
  `IQ` decimal(11,3) DEFAULT NULL,
  `FRZPROP` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `BRKPROP` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `DIPCK` decimal(3,0) DEFAULT NULL,
  `IDAMGRW` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `IDAMHGT` decimal(5,1) DEFAULT NULL,
  `IDAMWD` decimal(9,3) DEFAULT NULL,
  `IDAMUPZ` decimal(9,3) DEFAULT NULL,
  `IDAMUPWPTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `ELTY` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `IQPROP` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`,`EXKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_qticeinf_r`
--

LOCK TABLES `st_qticeinf_r` WRITE;
/*!40000 ALTER TABLE `st_qticeinf_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_qticeinf_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_recvfile_e`
--

DROP TABLE IF EXISTS `st_recvfile_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_recvfile_e` (
  `RFNUM` decimal(20,0) NOT NULL,
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `RECVTYPE` varchar(1) CHARACTER SET utf8 NOT NULL,
  `RECVSTATUS` varchar(1) CHARACTER SET utf8 NOT NULL,
  `RFILENAME` varchar(200) CHARACTER SET utf8 NOT NULL,
  `RECVTM` datetime NOT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`RFNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_recvfile_e`
--

LOCK TABLES `st_recvfile_e` WRITE;
/*!40000 ALTER TABLE `st_recvfile_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_recvfile_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_recvinf_e`
--

DROP TABLE IF EXISTS `st_recvinf_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_recvinf_e` (
  `RLSH` decimal(20,0) NOT NULL,
  `RFNUM` decimal(20,0) NOT NULL,
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `SLSH` decimal(20,0) NOT NULL,
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TABID` varchar(30) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `EXCKEY` varchar(200) CHARACTER SET utf8 NOT NULL,
  `OPERATION` varchar(1) CHARACTER SET utf8 NOT NULL,
  `EXCINF` text CHARACTER SET utf8 NOT NULL,
  `INSTOSTATUS` varchar(1) CHARACTER SET utf8 NOT NULL,
  `INSTOTM` datetime DEFAULT NULL,
  `ERRINF` text CHARACTER SET utf8,
  `MANUALTM` datetime DEFAULT NULL,
  `STAT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`RLSH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_recvinf_e`
--

LOCK TABLES `st_recvinf_e` WRITE;
/*!40000 ALTER TABLE `st_recvinf_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_recvinf_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_recvstat_e`
--

DROP TABLE IF EXISTS `st_recvstat_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_recvstat_e` (
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `COUNTDAY` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `FRGRD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `OPERATION` varchar(1) CHARACTER SET utf8 NOT NULL,
  `INFTYPE` varchar(1) CHARACTER SET utf8 NOT NULL,
  `STCDNUM` decimal(8,0) DEFAULT NULL,
  `INFNUM` decimal(11,0) DEFAULT NULL,
  `COUNTL30` decimal(11,0) DEFAULT NULL,
  `COUNTB60` decimal(11,0) DEFAULT NULL,
  `COUNTT60` decimal(11,0) DEFAULT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`INSTCD`,`COUNTDAY`,`STTDRCD`,`FRGRD`,`OPERATION`,`INFTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_recvstat_e`
--

LOCK TABLES `st_recvstat_e` WRITE;
/*!40000 ALTER TABLE `st_recvstat_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_recvstat_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_reglat_f`
--

DROP TABLE IF EXISTS `st_reglat_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_reglat_f` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `UNITNAME` varchar(30) CHARACTER SET utf8 NOT NULL,
  `PLCD` varchar(20) CHARACTER SET utf8 NOT NULL,
  `FYMDH` datetime NOT NULL,
  `IYMDH` datetime NOT NULL,
  `YMDH` datetime NOT NULL,
  `Z` decimal(9,3) DEFAULT NULL,
  `W` decimal(11,3) DEFAULT NULL,
  `OTQ` decimal(11,3) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`UNITNAME`,`PLCD`,`FYMDH`,`IYMDH`,`YMDH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_reglat_f`
--

LOCK TABLES `st_reglat_f` WRITE;
/*!40000 ALTER TABLE `st_reglat_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_reglat_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_river_r`
--

DROP TABLE IF EXISTS `st_river_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_river_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `Z` decimal(9,3) DEFAULT NULL,
  `Q` decimal(11,3) DEFAULT NULL,
  `XSA` decimal(11,3) DEFAULT NULL,
  `XSAVV` decimal(7,3) DEFAULT NULL,
  `XSMXV` decimal(7,3) DEFAULT NULL,
  `FLWCHRCD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `WPTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `MSQMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `MSAMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `MSVMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_river_r`
--

LOCK TABLES `st_river_r` WRITE;
/*!40000 ALTER TABLE `st_river_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_river_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rsvr_r`
--

DROP TABLE IF EXISTS `st_rsvr_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rsvr_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `RZ` decimal(9,3) DEFAULT NULL,
  `INQ` decimal(11,3) DEFAULT NULL,
  `W` decimal(11,3) DEFAULT NULL,
  `BLRZ` decimal(9,3) DEFAULT NULL,
  `OTQ` decimal(11,3) DEFAULT NULL,
  `RWCHRCD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `RWPTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `INQDR` decimal(7,2) DEFAULT NULL,
  `MSQMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rsvr_r`
--

LOCK TABLES `st_rsvr_r` WRITE;
/*!40000 ALTER TABLE `st_rsvr_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rsvr_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rsvrav_r`
--

DROP TABLE IF EXISTS `st_rsvrav_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rsvrav_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `AVRZ` decimal(9,3) DEFAULT NULL,
  `AVINQ` decimal(11,3) DEFAULT NULL,
  `AVOTQ` decimal(11,3) DEFAULT NULL,
  `AVW` decimal(11,3) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rsvrav_r`
--

LOCK TABLES `st_rsvrav_r` WRITE;
/*!40000 ALTER TABLE `st_rsvrav_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rsvrav_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rsvrevs_r`
--

DROP TABLE IF EXISTS `st_rsvrevs_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rsvrevs_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `HTRZ` decimal(9,3) DEFAULT NULL,
  `LTRZ` decimal(9,3) DEFAULT NULL,
  `MXINQ` decimal(11,3) DEFAULT NULL,
  `MNINQ` decimal(11,3) DEFAULT NULL,
  `MXOTQ` decimal(11,3) DEFAULT NULL,
  `MNOTQ` decimal(11,3) DEFAULT NULL,
  `MXW` decimal(11,3) DEFAULT NULL,
  `MNW` decimal(11,3) DEFAULT NULL,
  `HTRZTM` datetime DEFAULT NULL,
  `LTRZTM` datetime DEFAULT NULL,
  `MXINQTM` datetime DEFAULT NULL,
  `MNINQTM` datetime DEFAULT NULL,
  `MXOTQTM` datetime DEFAULT NULL,
  `MNOTQTM` datetime DEFAULT NULL,
  `MXWTM` datetime DEFAULT NULL,
  `MNWTM` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rsvrevs_r`
--

LOCK TABLES `st_rsvrevs_r` WRITE;
/*!40000 ALTER TABLE `st_rsvrevs_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rsvrevs_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rsvrfcch_b`
--

DROP TABLE IF EXISTS `st_rsvrfcch_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rsvrfcch_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `RSVRTP` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `DAMEL` decimal(9,3) DEFAULT NULL,
  `CKFLZ` decimal(9,3) DEFAULT NULL,
  `DSFLZ` decimal(9,3) DEFAULT NULL,
  `NORMZ` decimal(9,3) DEFAULT NULL,
  `DDZ` decimal(9,3) DEFAULT NULL,
  `ACTZ` decimal(9,3) DEFAULT NULL,
  `TTCP` decimal(11,3) DEFAULT NULL,
  `FLDCP` decimal(11,3) DEFAULT NULL,
  `ACTCP` decimal(11,3) DEFAULT NULL,
  `DDCP` decimal(11,3) DEFAULT NULL,
  `HHRZ` decimal(9,3) DEFAULT NULL,
  `HMXW` decimal(11,3) DEFAULT NULL,
  `HHRZTM` datetime DEFAULT NULL,
  `HMXINQ` decimal(11,3) DEFAULT NULL,
  `RSTDR` decimal(7,2) DEFAULT NULL,
  `HMXINQTM` datetime DEFAULT NULL,
  `HMXOTQ` decimal(11,3) DEFAULT NULL,
  `HMXOTQTM` datetime DEFAULT NULL,
  `HLRZ` decimal(9,3) DEFAULT NULL,
  `HLRZTM` datetime DEFAULT NULL,
  `HMNINQ` decimal(11,3) DEFAULT NULL,
  `HMNINQTM` datetime DEFAULT NULL,
  `LAZ` decimal(9,3) DEFAULT NULL,
  `SFQ` decimal(11,3) DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rsvrfcch_b`
--

LOCK TABLES `st_rsvrfcch_b` WRITE;
/*!40000 ALTER TABLE `st_rsvrfcch_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rsvrfcch_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rsvrfsr_b`
--

DROP TABLE IF EXISTS `st_rsvrfsr_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rsvrfsr_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `BGMD` varchar(4) CHARACTER SET utf8 NOT NULL,
  `EDMD` varchar(4) CHARACTER SET utf8 NOT NULL,
  `FSLTDZ` decimal(9,3) DEFAULT NULL,
  `FSLTDW` decimal(11,3) DEFAULT NULL,
  `FSTP` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`BGMD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rsvrfsr_b`
--

LOCK TABLES `st_rsvrfsr_b` WRITE;
/*!40000 ALTER TABLE `st_rsvrfsr_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rsvrfsr_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rsvrmyav_s`
--

DROP TABLE IF EXISTS `st_rsvrmyav_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rsvrmyav_s` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `MNTH` decimal(4,0) NOT NULL,
  `DAY` decimal(4,0) NOT NULL,
  `MYDAVW` decimal(11,3) DEFAULT NULL,
  `BGYR` decimal(6,0) DEFAULT NULL,
  `EDYR` decimal(6,0) DEFAULT NULL,
  `STTYRNUM` decimal(6,0) DEFAULT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`MNTH`,`DAY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rsvrmyav_s`
--

LOCK TABLES `st_rsvrmyav_s` WRITE;
/*!40000 ALTER TABLE `st_rsvrmyav_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rsvrmyav_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rsvrstrl_b`
--

DROP TABLE IF EXISTS `st_rsvrstrl_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rsvrstrl_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `RLSTCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IOMRK` varchar(1) CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`RLSTCD`,`IOMRK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rsvrstrl_b`
--

LOCK TABLES `st_rsvrstrl_b` WRITE;
/*!40000 ALTER TABLE `st_rsvrstrl_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rsvrstrl_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rvav_r`
--

DROP TABLE IF EXISTS `st_rvav_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rvav_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `AVZ` decimal(9,3) DEFAULT NULL,
  `AVQ` decimal(11,3) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rvav_r`
--

LOCK TABLES `st_rvav_r` WRITE;
/*!40000 ALTER TABLE `st_rvav_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rvav_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rvdaymyav_s`
--

DROP TABLE IF EXISTS `st_rvdaymyav_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rvdaymyav_s` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `MNTH` decimal(4,0) NOT NULL,
  `DAY` decimal(4,0) NOT NULL,
  `MYDAVZ` decimal(9,3) DEFAULT NULL,
  `MYDAVQ` decimal(11,3) DEFAULT NULL,
  `BGYR` decimal(6,0) DEFAULT NULL,
  `EDYR` decimal(6,0) DEFAULT NULL,
  `STTYRNUM` decimal(6,0) DEFAULT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`MNTH`,`DAY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rvdaymyav_s`
--

LOCK TABLES `st_rvdaymyav_s` WRITE;
/*!40000 ALTER TABLE `st_rvdaymyav_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rvdaymyav_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rvdmevsq_s`
--

DROP TABLE IF EXISTS `st_rvdmevsq_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rvdmevsq_s` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `YR` decimal(6,0) NOT NULL,
  `MNTH` decimal(4,0) NOT NULL,
  `PRDTP` decimal(3,0) NOT NULL,
  `HTZ` decimal(9,3) DEFAULT NULL,
  `HTZTM` datetime DEFAULT NULL,
  `MXQ` decimal(11,3) DEFAULT NULL,
  `MXQTM` datetime DEFAULT NULL,
  `LTZ` decimal(9,3) DEFAULT NULL,
  `LTZTM` datetime DEFAULT NULL,
  `MNQ` decimal(11,3) DEFAULT NULL,
  `MNQTM` datetime DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`YR`,`MNTH`,`PRDTP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rvdmevsq_s`
--

LOCK TABLES `st_rvdmevsq_s` WRITE;
/*!40000 ALTER TABLE `st_rvdmevsq_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rvdmevsq_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rvdmmyav_s`
--

DROP TABLE IF EXISTS `st_rvdmmyav_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rvdmmyav_s` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `MNTH` decimal(4,0) NOT NULL,
  `PRDTP` decimal(3,0) NOT NULL,
  `MYMAVZ` decimal(9,3) DEFAULT NULL,
  `MYMAVQ` decimal(11,3) DEFAULT NULL,
  `BGYR` decimal(6,0) DEFAULT NULL,
  `EDYR` decimal(6,0) DEFAULT NULL,
  `STTYRNUM` decimal(6,0) DEFAULT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`MNTH`,`PRDTP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rvdmmyav_s`
--

LOCK TABLES `st_rvdmmyav_s` WRITE;
/*!40000 ALTER TABLE `st_rvdmmyav_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rvdmmyav_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rvdmmysq_s`
--

DROP TABLE IF EXISTS `st_rvdmmysq_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rvdmmysq_s` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `YR` decimal(6,0) NOT NULL,
  `MNTH` decimal(4,0) NOT NULL,
  `PRDTP` decimal(3,0) NOT NULL,
  `AVZ` decimal(9,3) DEFAULT NULL,
  `AVQ` decimal(11,3) DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`YR`,`MNTH`,`PRDTP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rvdmmysq_s`
--

LOCK TABLES `st_rvdmmysq_s` WRITE;
/*!40000 ALTER TABLE `st_rvdmmysq_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rvdmmysq_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rvevs_r`
--

DROP TABLE IF EXISTS `st_rvevs_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rvevs_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `HTZ` decimal(9,3) DEFAULT NULL,
  `LTZ` decimal(9,3) DEFAULT NULL,
  `MXQ` decimal(11,3) DEFAULT NULL,
  `MNQ` decimal(11,3) DEFAULT NULL,
  `HTZTM` datetime DEFAULT NULL,
  `LTZTM` datetime DEFAULT NULL,
  `MXQTM` datetime DEFAULT NULL,
  `MNQTM` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rvevs_r`
--

LOCK TABLES `st_rvevs_r` WRITE;
/*!40000 ALTER TABLE `st_rvevs_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rvevs_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rvfcch_b`
--

DROP TABLE IF EXISTS `st_rvfcch_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rvfcch_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `LDKEL` decimal(9,3) DEFAULT NULL,
  `RDKEL` decimal(9,3) DEFAULT NULL,
  `WRZ` decimal(9,3) DEFAULT NULL,
  `WRQ` decimal(11,3) DEFAULT NULL,
  `GRZ` decimal(9,3) DEFAULT NULL,
  `GRQ` decimal(11,3) DEFAULT NULL,
  `FLPQ` decimal(11,3) DEFAULT NULL,
  `OBHTZ` decimal(9,3) DEFAULT NULL,
  `OBHTZTM` datetime DEFAULT NULL,
  `IVHZ` decimal(9,3) DEFAULT NULL,
  `IVHZTM` datetime DEFAULT NULL,
  `OBMXQ` decimal(11,3) DEFAULT NULL,
  `OBMXQTM` datetime DEFAULT NULL,
  `IVMXQ` decimal(11,3) DEFAULT NULL,
  `IVMXQTM` datetime DEFAULT NULL,
  `HMXS` decimal(11,3) DEFAULT NULL,
  `HMXSTM` datetime DEFAULT NULL,
  `HMXAVV` decimal(11,3) DEFAULT NULL,
  `HMXAVVTM` datetime DEFAULT NULL,
  `HLZ` decimal(9,3) DEFAULT NULL,
  `HLZTM` datetime DEFAULT NULL,
  `HMNQ` decimal(11,3) DEFAULT NULL,
  `HMNQTM` datetime DEFAULT NULL,
  `TAZ` decimal(9,3) DEFAULT NULL,
  `TAQ` decimal(11,3) DEFAULT NULL,
  `LAZ` decimal(9,3) DEFAULT NULL,
  `LAQ` decimal(11,3) DEFAULT NULL,
  `SFZ` decimal(9,3) DEFAULT NULL,
  `SFQ` decimal(11,3) DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rvfcch_b`
--

LOCK TABLES `st_rvfcch_b` WRITE;
/*!40000 ALTER TABLE `st_rvfcch_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rvfcch_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rvsect_b`
--

DROP TABLE IF EXISTS `st_rvsect_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rvsect_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `MSTM` datetime NOT NULL,
  `BGBK` varchar(1) CHARACTER SET utf8 NOT NULL,
  `VTNO` decimal(6,0) NOT NULL,
  `DI` decimal(10,3) NOT NULL,
  `ZB` decimal(10,3) NOT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`MSTM`,`VTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rvsect_b`
--

LOCK TABLES `st_rvsect_b` WRITE;
/*!40000 ALTER TABLE `st_rvsect_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rvsect_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_rvyevsq_s`
--

DROP TABLE IF EXISTS `st_rvyevsq_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_rvyevsq_s` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `YR` decimal(6,0) NOT NULL,
  `HTZ` decimal(9,3) DEFAULT NULL,
  `HTZTM` datetime DEFAULT NULL,
  `MXQ` decimal(11,3) DEFAULT NULL,
  `MXQTM` datetime DEFAULT NULL,
  `LTZ` decimal(9,3) DEFAULT NULL,
  `LTZTM` datetime DEFAULT NULL,
  `MNQ` decimal(11,3) DEFAULT NULL,
  `MNQTM` datetime DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`YR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_rvyevsq_s`
--

LOCK TABLES `st_rvyevsq_s` WRITE;
/*!40000 ALTER TABLE `st_rvyevsq_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_rvyevsq_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_sed_r`
--

DROP TABLE IF EXISTS `st_sed_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_sed_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `S` decimal(11,3) DEFAULT NULL,
  `SCHRCD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_sed_r`
--

LOCK TABLES `st_sed_r` WRITE;
/*!40000 ALTER TABLE `st_sed_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_sed_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_sedfr_f`
--

DROP TABLE IF EXISTS `st_sedfr_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_sedfr_f` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `UNITNAME` varchar(30) CHARACTER SET utf8 NOT NULL,
  `PLCD` varchar(20) CHARACTER SET utf8 NOT NULL,
  `FYMDH` datetime NOT NULL,
  `IYMDH` datetime NOT NULL,
  `YMDH` datetime NOT NULL,
  `FS` decimal(11,3) DEFAULT NULL,
  `SCHRCD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`UNITNAME`,`PLCD`,`FYMDH`,`IYMDH`,`YMDH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_sedfr_f`
--

LOCK TABLES `st_sedfr_f` WRITE;
/*!40000 ALTER TABLE `st_sedfr_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_sedfr_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_sedrf_r`
--

DROP TABLE IF EXISTS `st_sedrf_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_sedrf_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `WRNF` decimal(13,3) DEFAULT NULL,
  `STW` decimal(13,3) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_sedrf_r`
--

LOCK TABLES `st_sedrf_r` WRITE;
/*!40000 ALTER TABLE `st_sedrf_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_sedrf_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_senddo_e`
--

DROP TABLE IF EXISTS `st_senddo_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_senddo_e` (
  `SLSH` decimal(20,0) NOT NULL,
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TABID` varchar(30) CHARACTER SET utf8 NOT NULL,
  `TM` datetime DEFAULT NULL,
  `EXCKEY` varchar(200) CHARACTER SET utf8 NOT NULL,
  `OPERATION` varchar(1) CHARACTER SET utf8 NOT NULL,
  `EXCINF` text CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`SLSH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_senddo_e`
--

LOCK TABLES `st_senddo_e` WRITE;
/*!40000 ALTER TABLE `st_senddo_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_senddo_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_sendfile_e`
--

DROP TABLE IF EXISTS `st_sendfile_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_sendfile_e` (
  `SFNUM` decimal(20,0) NOT NULL,
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `SENDTYPE` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SENDSTATUS` varchar(1) CHARACTER SET utf8 NOT NULL,
  `SFILENAME` varchar(32) CHARACTER SET utf8 NOT NULL,
  `SENDTM` datetime DEFAULT NULL,
  `SENDCOUNT` decimal(20,0) DEFAULT NULL,
  `ERRLINE` decimal(20,0) DEFAULT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`SFNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_sendfile_e`
--

LOCK TABLES `st_sendfile_e` WRITE;
/*!40000 ALTER TABLE `st_sendfile_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_sendfile_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_sendstat_e`
--

DROP TABLE IF EXISTS `st_sendstat_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_sendstat_e` (
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `COUNTDAY` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `FRGRD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `OPERATION` varchar(1) CHARACTER SET utf8 NOT NULL,
  `INFTYPE` varchar(1) CHARACTER SET utf8 NOT NULL,
  `STCDNUM` decimal(8,0) DEFAULT NULL,
  `INFNUM` decimal(11,0) DEFAULT NULL,
  `COUNTL30` decimal(11,0) DEFAULT NULL,
  `COUNTB60` decimal(11,0) DEFAULT NULL,
  `COUNTT60` decimal(11,0) DEFAULT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`INSTCD`,`COUNTDAY`,`STTDRCD`,`FRGRD`,`OPERATION`,`INFTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_sendstat_e`
--

LOCK TABLES `st_sendstat_e` WRITE;
/*!40000 ALTER TABLE `st_sendstat_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_sendstat_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_sendto_e`
--

DROP TABLE IF EXISTS `st_sendto_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_sendto_e` (
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `SLSH` decimal(20,0) NOT NULL,
  `SFNUM` decimal(20,0) NOT NULL,
  `TM` datetime DEFAULT NULL,
  `SENDSTATUS` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `STAT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`INSTCD`,`SLSH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_sendto_e`
--

LOCK TABLES `st_sendto_e` WRITE;
/*!40000 ALTER TABLE `st_sendto_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_sendto_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_sendwait_e`
--

DROP TABLE IF EXISTS `st_sendwait_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_sendwait_e` (
  `SLSH` decimal(20,0) NOT NULL,
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TABID` varchar(30) CHARACTER SET utf8 NOT NULL,
  `TM` datetime DEFAULT NULL,
  `EXCKEY` varchar(200) CHARACTER SET utf8 NOT NULL,
  `OPERATION` varchar(1) CHARACTER SET utf8 NOT NULL,
  `EXCINF` text CHARACTER SET utf8 NOT NULL,
  `POLLSTATUS` varchar(1) CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`SLSH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_sendwait_e`
--

LOCK TABLES `st_sendwait_e` WRITE;
/*!40000 ALTER TABLE `st_sendwait_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_sendwait_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_snow_r`
--

DROP TABLE IF EXISTS `st_snow_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_snow_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `SNOWDEP` decimal(5,0) DEFAULT NULL,
  `SNOWDEN` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_snow_r`
--

LOCK TABLES `st_snow_r` WRITE;
/*!40000 ALTER TABLE `st_snow_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_snow_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_soil_r`
--

DROP TABLE IF EXISTS `st_soil_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_soil_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `EXKEY` varchar(1) CHARACTER SET utf8 NOT NULL,
  `VTAVSLM` decimal(6,1) DEFAULT NULL,
  `SRLSLM` decimal(6,1) DEFAULT NULL,
  `SLM10` decimal(6,1) DEFAULT NULL,
  `SLM20` decimal(6,1) DEFAULT NULL,
  `SLM30` decimal(6,1) DEFAULT NULL,
  `SLM40` decimal(6,1) DEFAULT NULL,
  `SLM60` decimal(6,1) DEFAULT NULL,
  `SLM80` decimal(6,1) DEFAULT NULL,
  `SLM100` decimal(6,1) DEFAULT NULL,
  `CRPTY` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `CRPGRWPRD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `HITRSN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SLMMMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`,`EXKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_soil_r`
--

LOCK TABLES `st_soil_r` WRITE;
/*!40000 ALTER TABLE `st_soil_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_soil_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_soilch_b`
--

DROP TABLE IF EXISTS `st_soilch_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_soilch_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `SLTP` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SLTX` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `SFBR` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `SSPG` decimal(6,2) DEFAULT NULL,
  `DSD` decimal(6,2) DEFAULT NULL,
  `SPOR` decimal(6,2) DEFAULT NULL,
  `SHWC` decimal(6,2) DEFAULT NULL,
  `FDCP` decimal(6,2) DEFAULT NULL,
  `WLCP` decimal(6,2) DEFAULT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_soilch_b`
--

LOCK TABLES `st_soilch_b` WRITE;
/*!40000 ALTER TABLE `st_soilch_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_soilch_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_stbprp_b`
--

DROP TABLE IF EXISTS `st_stbprp_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_stbprp_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `STNM` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `RVNM` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `HNNM` varchar(30) CHARACTER SET utf8 NOT NULL,
  `BSNM` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `LGTD` decimal(12,6) DEFAULT NULL,
  `LTTD` decimal(12,6) DEFAULT NULL,
  `STLC` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ADDVCD` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `DTMNM` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `DTMEL` decimal(9,3) DEFAULT NULL,
  `DTPR` decimal(9,3) DEFAULT NULL,
  `STTP` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `FRGRD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `ESSTYM` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `BGFRYM` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `ATCUNIT` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ADMAUTH` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `LOCALITY` varchar(10) CHARACTER SET utf8 NOT NULL,
  `STBK` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `STAZT` decimal(5,0) DEFAULT NULL,
  `DSTRVM` decimal(8,1) DEFAULT NULL,
  `DRNA` decimal(9,0) DEFAULT NULL,
  `PHCD` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `USFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`STCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_stbprp_b`
--

LOCK TABLES `st_stbprp_b` WRITE;
/*!40000 ALTER TABLE `st_stbprp_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_stbprp_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_stcd_e`
--

DROP TABLE IF EXISTS `st_stcd_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_stcd_e` (
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `SCFL` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`INSTCD`,`STCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_stcd_e`
--

LOCK TABLES `st_stcd_e` WRITE;
/*!40000 ALTER TABLE `st_stcd_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_stcd_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_storm_r`
--

DROP TABLE IF EXISTS `st_storm_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_storm_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `STRMDR` decimal(7,2) DEFAULT NULL,
  `STRMP` decimal(6,1) DEFAULT NULL,
  `WTH` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_storm_r`
--

LOCK TABLES `st_storm_r` WRITE;
/*!40000 ALTER TABLE `st_storm_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_storm_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_stsmcnt_e`
--

DROP TABLE IF EXISTS `st_stsmcnt_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_stsmcnt_e` (
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `COUNTDAY` datetime NOT NULL,
  `INFSTATUS` varchar(1) CHARACTER SET utf8 NOT NULL,
  `INFTYPE` varchar(1) CHARACTER SET utf8 NOT NULL,
  `FRGRD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `ICNT` decimal(11,0) NOT NULL,
  `UCNT` decimal(11,0) NOT NULL,
  `DCNT` decimal(11,0) NOT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`INSTCD`,`STCD`,`COUNTDAY`,`INFSTATUS`,`INFTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_stsmcnt_e`
--

LOCK TABLES `st_stsmcnt_e` WRITE;
/*!40000 ALTER TABLE `st_stsmcnt_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_stsmcnt_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_stsmtask_b`
--

DROP TABLE IF EXISTS `st_stsmtask_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_stsmtask_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `DFRTMS` decimal(4,0) DEFAULT NULL,
  `PFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `EFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `ZFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `QFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `WFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `INQFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `DAMFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `OTQFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `WDWVFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SEDFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `ICEFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `PPFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `DRNFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SOILFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `GRWFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `STATFL` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `OFFICER` varchar(12) CHARACTER SET utf8 NOT NULL,
  `MPHONE` varchar(11) CHARACTER SET utf8 NOT NULL,
  `SPHONE` varchar(12) CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_stsmtask_b`
--

LOCK TABLES `st_stsmtask_b` WRITE;
/*!40000 ALTER TABLE `st_stsmtask_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_stsmtask_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_syncset_e`
--

DROP TABLE IF EXISTS `st_syncset_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_syncset_e` (
  `SYSNAME` varchar(32) CHARACTER SET utf8 NOT NULL,
  `SYSVALUE` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`SYSNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_syncset_e`
--

LOCK TABLES `st_syncset_e` WRITE;
/*!40000 ALTER TABLE `st_syncset_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_syncset_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_syslog_e`
--

DROP TABLE IF EXISTS `st_syslog_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_syslog_e` (
  `LOGLSH` decimal(20,0) NOT NULL,
  `LOGTYPE` varchar(1) CHARACTER SET utf8 NOT NULL,
  `LOGCONTENT` text CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`LOGLSH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_syslog_e`
--

LOCK TABLES `st_syslog_e` WRITE;
/*!40000 ALTER TABLE `st_syslog_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_syslog_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_table_d`
--

DROP TABLE IF EXISTS `st_table_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_table_d` (
  `TABID` varchar(20) CHARACTER SET utf8 NOT NULL,
  `TABNO` varchar(11) CHARACTER SET utf8 NOT NULL,
  `TABCN` varchar(30) CHARACTER SET utf8 NOT NULL,
  `TABEN` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `EXCHFL` varchar(1) CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`TABID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_table_d`
--

LOCK TABLES `st_table_d` WRITE;
/*!40000 ALTER TABLE `st_table_d` DISABLE KEYS */;
INSERT INTO `st_table_d` VALUES ('ST_ADDVCD_D         ','ST_006_0004','行政区域代码表','code for administrative division','0','2016-11-11 11:00:38'),('ST_ASTROTD_F        ','ST_003_0005','天文潮预报成果表','hydrologic forecasting result of astronomical tide','1','2016-11-11 11:00:38'),('ST_DAYEV_R          ','ST_002_0004','日蒸发量表','daily evaporation ','1','2016-11-11 11:00:38'),('ST_ENNMCD_D         ','ST_006_0005','中国河流名称代码表','code for rivers name of china ','0','2016-11-11 11:00:38'),('ST_ESTAT_R          ','ST_002_0027','蒸发量统计表','statistics of evaporation ','1','2016-11-11 11:00:38'),('ST_EUNTLANG_D       ','ST_006_0003','枚举代码与自然语言对照表','compare of enumeration code & nature language ','0','2016-11-11 11:00:38'),('ST_FFRAR_B          ','ST_001_0013','洪水频率分析成果表','flood frequency of analysis findings','1','2016-11-11 11:00:38'),('ST_FIELD_D          ','ST_006_0002','字段属性信息表','field information ','0','2016-11-11 11:00:38'),('ST_FORECASTC_F      ','ST_003_0001','水情预报成果注释表','comments of hydrologic forecasting result ','1','2016-11-11 11:00:38'),('ST_FORECAST_F       ','ST_003_0002','水情预报成果表','hydrologic forecasting result ','1','2016-11-11 11:00:38'),('ST_FRAPAR_B         ','ST_001_0012','洪水频率分析参数表','flood frequency of analysis parameters','1','2016-11-11 11:00:38'),('ST_FSDR_B           ','ST_001_0009','洪水传播时间表','spread duration of flood','1','2016-11-11 11:00:37'),('ST_GATE_R           ','ST_002_0008','闸门启闭情况表','information of gates opening','1','2016-11-11 11:00:38'),('ST_GRWAV_R          ','ST_002_0026','地下水情多日均值表','multi-days-averaged values of hydrologic information of groundwater ','1','2016-11-11 11:00:38'),('ST_GRWEVS_R         ','ST_002_0038','地下水水情极值表','extreme-values series of groundwater','1','2016-11-11 11:00:38'),('ST_GRW_R            ','ST_002_0017','地下水情表','hydrologic information of groundwater ','1','2016-11-11 11:00:38'),('ST_HAIL_R           ','ST_002_0003','冰雹表','hydrologic information of hail','1','2016-11-11 11:00:38'),('ST_ICEFR_F          ','ST_003_0007','冰情预报表','hydrologic forecasting result of ices ','1','2016-11-11 11:00:38'),('ST_INSTCD_B         ','ST_001_0015','单位名称编码表','codes for institutes releasing information','0','2016-11-11 11:00:38'),('ST_INSTCD_E         ','ST_005_0001','交换单位信息表','exchange institutes ','0','2016-11-11 11:00:38'),('ST_NETSTAT_E        ','ST_005_0013','网络状态统计表','ST_NETSTAT_E','0','2016-11-11 11:00:38'),('ST_PDDMYAV_S        ','ST_004_0001','日降水量均值表','statistics of multi-year daily precipitation','1','2016-11-11 11:00:38'),('ST_PDMMYAV_S        ','ST_004_0003','旬月降水量均值表','statistics of multi-year precipitation on 10-day or month ','1','2016-11-11 11:00:38'),('ST_PDMMYSQ_S        ','ST_004_0002','旬月降水量系列表','multi-year precipitation on 10-day or month sequence','1','2016-11-11 11:00:38'),('ST_PMEVS_R          ','ST_002_0035','泵站水情极值表','extreme-values series of pumping stations ','1','2016-11-11 11:00:38'),('ST_PPTN_R           ','ST_002_0001','降水量表','hydrologic information of precipitation ','1','2016-11-11 11:00:38'),('ST_PSTAT_R          ','ST_002_0028','降水量统计表','statistics of precipitation ','1','2016-11-11 11:00:38'),('ST_PUMP_R           ','ST_002_0009','泵站水情表','hydrologic information of pumping stations','1','2016-11-11 11:00:38'),('ST_QLICEINF_R       ','ST_002_0014','定性冰情表','quanlitative information of ice ','1','2016-11-11 11:00:38'),('ST_QTICEINF_R       ','ST_002_0015','定量冰情表','quantitative information of ice ','1','2016-11-11 11:00:38'),('ST_RECVFILE_E       ','ST_005_0009','接收文件信息表','ST_RECVFILE_E','0','2016-11-11 11:00:38'),('ST_RECVINF_E        ','ST_005_0010','接收信息记录表','ST_RECVINF_E','0','2016-11-11 11:00:38'),('ST_RECVSTAT_E       ','ST_005_0011','接收信息统计表','ST_RECVSTAT_E','0','2016-11-11 11:00:38'),('ST_REGLAT_F         ','ST_003_0003','调度预报成果表','regulation forecasting result ','1','2016-11-11 11:00:38'),('ST_RIVER_R          ','ST_002_0005','河道水情表','hydrologic information of rivers','1','2016-11-11 11:00:38'),('ST_RSVRAV_R         ','ST_002_0022','水库水情多日均值表','multi-day-averaged values of hydrologic information of reservoirs ','1','2016-11-11 11:00:38'),('ST_RSVREVS_R        ','ST_002_0033','水库水情极值表','extreme-values series of reservoirs ','1','2016-11-11 11:00:38'),('ST_RSVRFCCH_B       ','ST_001_0006','库（湖）站防洪指标表','flood control characteristics of reservoirs (lakes) ','1','2016-11-11 11:00:37'),('ST_RSVRFSR_B        ','ST_001_0007','库（湖）站汛限水位表','reservoir (lakes) regulation in flood season','1','2016-11-11 11:00:37'),('ST_RSVRMYAV_S       ','ST_004_0009','库（湖）蓄水量多年日平均统计表','statistics of multi-year-averaged values of daily reservoir (lakes) ','1','2016-11-11 11:00:38'),('ST_RSVRSTRL_B       ','ST_001_0003','库（湖）站关系表','relationship of reservoirs (lakes) and stations ','1','2016-11-11 11:00:37'),('ST_RSVR_R           ','ST_002_0006','水库水情表','hydrologic information of reservoirs','1','2016-11-11 11:00:38'),('ST_RVAV_R           ','ST_002_0021','河道水情多日均值表','multi-day-averaged values of hydrologic information of rivers ','1','2016-11-11 11:00:38'),('ST_RVDAYMYAV_S      ','ST_004_0004','水位流量多年日平均统计表','statistics of multi-year-averaged values of daily stage & discharge ','1','2016-11-11 11:00:38'),('ST_RVDMEVSQ_S       ','ST_004_0007','水位流量旬月极值系列表','extreme values of stage & discharge on 10-day or month sequence ','1','2016-11-11 11:00:38'),('ST_RVDMMYAV_S       ','ST_004_0006','水位流量多年旬月平均统计表','statistics of multi-year-averaged values of stage & discharge on 10-day or month','1','2016-11-11 11:00:38'),('ST_RVDMMYSQ_S       ','ST_004_0005','水位流量旬月均值系列表','averaged values of stage & discharge on 10-day or month sequence','1','2016-11-11 11:00:38'),('ST_RVEVS_R          ','ST_002_0032','河道水情极值表','extreme-values series of rivers ','1','2016-11-11 11:00:38'),('ST_RVFCCH_B         ','ST_001_0005','河道站防洪指标表','flood control characteristics of river stations ','1','2016-11-11 11:00:37'),('ST_RVSECT_B         ','ST_001_0014','大断面测验成果表','results of cross-section measurement','1','2016-11-11 11:00:38'),('ST_RVYEVSQ_S        ','ST_004_0008','水位流量年极值系列表','annual extreme values of stage & discharge sequence ','1','2016-11-11 11:00:38'),('ST_SEDFR_F          ','ST_003_0006','含沙量预报表','hydrologic forecasting result of sediment ','1','2016-11-11 11:00:38'),('ST_SEDRF_R          ','ST_002_0030','输沙输水总量表','total runoffs of sediment & water ','1','2016-11-11 11:00:38'),('ST_SED_R            ','ST_002_0012','含沙量表','information of sediment concentration ','1','2016-11-11 11:00:38'),('ST_SENDDO_E         ','ST_005_0005','已处理信息记录表','ST_SENDDO_E','0','2016-11-11 11:00:38'),('ST_SENDFILE_E       ','ST_005_0006','发送文件信息表','ST_SENDFILE_E','0','2016-11-11 11:00:38'),('ST_SENDSTAT_E       ','ST_005_0008','发送信息统计表','ST_SENDSTAT_E','0','2016-11-11 11:00:38'),('ST_SENDTO_E         ','ST_005_0007','信息配发记录表','ST_SENDTO_E','0','2016-11-11 11:00:38'),('ST_SENDWAIT_E       ','ST_005_0004','待发送信息记录表','ST_SENDWAIT_E','0','2016-11-11 11:00:38'),('ST_SNOW_R           ','ST_002_0002','降雪表','hydrologic information of snow','1','2016-11-11 11:00:38'),('ST_SOILCH_B         ','ST_001_0008','土壤墒情特征值表','characteristics of soil moisture','1','2016-11-11 11:00:37'),('ST_SOIL_R           ','ST_002_0016','土壤墒情表','information of soil moisture','1','2016-11-11 11:00:38'),('ST_STBPRP_B         ','ST_001_0001','测站基本属性表','station basic properties','1','2016-11-11 11:00:37'),('ST_STCD_E           ','ST_005_0002','交换测站信息表','exchange station','0','2016-11-11 11:00:38'),('ST_STORM_R          ','ST_002_0019','暴雨加报表','extra hydrologic information of storm ','1','2016-11-11 11:00:38'),('ST_STSMCNT_E        ','ST_005_0012','测站报送信息统计表','ST_STSMCNT_E','0','2016-11-11 11:00:38'),('ST_STSMTASK_B       ','ST_001_0002','测站报送任务表','station submitted task','1','2016-11-11 11:00:37'),('ST_SYNCSET_E        ','ST_005_0014','系统配置信息表','ST_SYNCSET_E','0','2016-11-11 11:00:38'),('ST_SYSLOG_E         ','ST_005_0015','系统日志表','ST_SYSLOG_E','0','2016-11-11 11:00:38'),('ST_TABLE_D          ','ST_006_0001','表属性信息表','table information ','0','2016-11-11 11:00:38'),('ST_TABLE_E          ','ST_005_0003','交换表单信息表','exchange table','0','2016-11-11 11:00:38'),('ST_TDFR_F           ','ST_003_0004','潮位预报成果表','hydrologic forecasting result of tides','1','2016-11-11 11:00:38'),('ST_TIDEAV_R         ','ST_002_0024','潮汐水情多日均值表','multi-day-averaged values of hydrologic information of tides','1','2016-11-11 11:00:38'),('ST_TIDEEVS_R        ','ST_002_0036','潮汐水情极值表','extreme-values series of tides','1','2016-11-11 11:00:38'),('ST_TIDE_R           ','ST_002_0010','潮汐水情表','hydrologic information of tides ','1','2016-11-11 11:00:38'),('ST_TMPAV_R          ','ST_002_0025','气温水温多日均值表','multi-day-averaged values of temperatures of air and water','1','2016-11-11 11:00:38'),('ST_TMPEVS_R         ','ST_002_0037','气温水温极值表','extreme-values series of water & air temperatures ','1','2016-11-11 11:00:38'),('ST_TMP_R            ','ST_002_0013','气温水温表','information of water & air temperatures ','1','2016-11-11 11:00:38'),('ST_WASAV_R          ','ST_002_0023','堰闸(泵)水情多日均值表','multi-day-averaged values of hydrologic information of weirs & sluices','1','2016-11-11 11:00:38'),('ST_WASEVS_R         ','ST_002_0034','堰闸水情极值表','extreme-values series of weirs & sluices','1','2016-11-11 11:00:38'),('ST_WASRL_B          ','ST_001_0004','堰闸站关系表','relationship of weir and sluice stations','1','2016-11-11 11:00:37'),('ST_WAS_R            ','ST_002_0007','堰闸水情表','hydrologic information of weirs & sluices ','1','2016-11-11 11:00:38'),('ST_WDPSTAT_R        ','ST_002_0029','引排水量统计表','statistics of water volumes of drainage & pump','1','2016-11-11 11:00:38'),('ST_WDWV_R           ','ST_002_0011','风浪信息表','information of wind & wave','1','2016-11-11 11:00:38'),('ST_WGRWSTAT_R       ','ST_002_0031','地下水开采量统计表','statistics of volume of groundwater exploited ','1','2016-11-11 11:00:38'),('ST_WGRW_R           ','ST_002_0018','地下水开采量表','volume of groundwater exploited ','1','2016-11-11 11:00:38'),('ST_WSPAVSD_R        ','ST_002_0020','堰闸(泵)站时段均值表','average values of weir & sluice (pumping) stations in short duration','1','2016-11-11 11:00:38'),('ST_ZQRL_B           ','ST_001_0010','水位流量关系曲线表','stage-discharge relation','1','2016-11-11 11:00:37'),('ST_ZVARL_B          ','ST_001_0011','库（湖）容曲线表','stage-capacity-area curves','1','2016-11-11 11:00:38');
/*!40000 ALTER TABLE `st_table_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_table_e`
--

DROP TABLE IF EXISTS `st_table_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_table_e` (
  `INSTCD` varchar(10) CHARACTER SET utf8 NOT NULL,
  `TABID` varchar(20) CHARACTER SET utf8 NOT NULL,
  `ISSTARTS` varchar(1) CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime NOT NULL,
  PRIMARY KEY (`INSTCD`,`TABID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_table_e`
--

LOCK TABLES `st_table_e` WRITE;
/*!40000 ALTER TABLE `st_table_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_table_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tdfr_f`
--

DROP TABLE IF EXISTS `st_tdfr_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_tdfr_f` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `UNITNAME` varchar(30) CHARACTER SET utf8 NOT NULL,
  `PLCD` varchar(20) CHARACTER SET utf8 NOT NULL,
  `FYMDH` datetime NOT NULL,
  `IYMDH` datetime NOT NULL,
  `YMDH` datetime NOT NULL,
  `TDZ` decimal(9,3) DEFAULT NULL,
  `STRMSRG` decimal(9,3) DEFAULT NULL,
  `HLTDMK` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`UNITNAME`,`PLCD`,`FYMDH`,`IYMDH`,`YMDH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tdfr_f`
--

LOCK TABLES `st_tdfr_f` WRITE;
/*!40000 ALTER TABLE `st_tdfr_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_tdfr_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tide_r`
--

DROP TABLE IF EXISTS `st_tide_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_tide_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `TDZ` decimal(9,3) DEFAULT NULL,
  `AIRP` decimal(7,0) DEFAULT NULL,
  `TDCHRCD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `TDPTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `HLTDMK` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tide_r`
--

LOCK TABLES `st_tide_r` WRITE;
/*!40000 ALTER TABLE `st_tide_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_tide_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tideav_r`
--

DROP TABLE IF EXISTS `st_tideav_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_tideav_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `AVHTDZ` decimal(9,3) DEFAULT NULL,
  `AVLTDZ` decimal(9,3) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tideav_r`
--

LOCK TABLES `st_tideav_r` WRITE;
/*!40000 ALTER TABLE `st_tideav_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_tideav_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tideevs_r`
--

DROP TABLE IF EXISTS `st_tideevs_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_tideevs_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `HTTDZ` decimal(9,3) DEFAULT NULL,
  `LTTDZ` decimal(9,3) DEFAULT NULL,
  `MXWNDV` decimal(6,1) DEFAULT NULL,
  `HTTDZTM` datetime DEFAULT NULL,
  `LTTDZTM` datetime DEFAULT NULL,
  `MXWNDVTM` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tideevs_r`
--

LOCK TABLES `st_tideevs_r` WRITE;
/*!40000 ALTER TABLE `st_tideevs_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_tideevs_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tmp_r`
--

DROP TABLE IF EXISTS `st_tmp_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_tmp_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `ATMP` decimal(5,1) DEFAULT NULL,
  `WTMP` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tmp_r`
--

LOCK TABLES `st_tmp_r` WRITE;
/*!40000 ALTER TABLE `st_tmp_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_tmp_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tmpav_r`
--

DROP TABLE IF EXISTS `st_tmpav_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_tmpav_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `AVATMP` decimal(5,1) DEFAULT NULL,
  `AVWTMP` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tmpav_r`
--

LOCK TABLES `st_tmpav_r` WRITE;
/*!40000 ALTER TABLE `st_tmpav_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_tmpav_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_tmpevs_r`
--

DROP TABLE IF EXISTS `st_tmpevs_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_tmpevs_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `MXATMP` decimal(5,1) DEFAULT NULL,
  `MNATMP` decimal(5,1) DEFAULT NULL,
  `MXWTMP` decimal(5,1) DEFAULT NULL,
  `MNWTMP` decimal(5,1) DEFAULT NULL,
  `MXATMPTM` datetime DEFAULT NULL,
  `MNATMPTM` datetime DEFAULT NULL,
  `MXWTMPTM` datetime DEFAULT NULL,
  `MNWTMPTM` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_tmpevs_r`
--

LOCK TABLES `st_tmpevs_r` WRITE;
/*!40000 ALTER TABLE `st_tmpevs_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_tmpevs_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_was_r`
--

DROP TABLE IF EXISTS `st_was_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_was_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `UPZ` decimal(9,3) DEFAULT NULL,
  `DWZ` decimal(9,3) DEFAULT NULL,
  `TGTQ` decimal(11,3) DEFAULT NULL,
  `SWCHRCD` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SUPWPTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `SDWWPTN` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `MSQMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_was_r`
--

LOCK TABLES `st_was_r` WRITE;
/*!40000 ALTER TABLE `st_was_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_was_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_wasav_r`
--

DROP TABLE IF EXISTS `st_wasav_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_wasav_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `AVUPZ` decimal(9,3) DEFAULT NULL,
  `AVDWZ` decimal(9,3) DEFAULT NULL,
  `AVGTQ` decimal(11,3) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_wasav_r`
--

LOCK TABLES `st_wasav_r` WRITE;
/*!40000 ALTER TABLE `st_wasav_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_wasav_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_wasevs_r`
--

DROP TABLE IF EXISTS `st_wasevs_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_wasevs_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `HTUPZ` decimal(9,3) DEFAULT NULL,
  `LTUPZ` decimal(9,3) DEFAULT NULL,
  `MXGTQ` decimal(11,3) DEFAULT NULL,
  `MNGTQ` decimal(11,3) DEFAULT NULL,
  `HTDWZ` decimal(9,3) DEFAULT NULL,
  `LTDWZ` decimal(9,3) DEFAULT NULL,
  `HTUPZTM` datetime DEFAULT NULL,
  `LTUPZTM` datetime DEFAULT NULL,
  `MXGTQTM` datetime DEFAULT NULL,
  `MNGTQTM` datetime DEFAULT NULL,
  `HTDWZTM` datetime DEFAULT NULL,
  `LTDWZTM` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_wasevs_r`
--

LOCK TABLES `st_wasevs_r` WRITE;
/*!40000 ALTER TABLE `st_wasevs_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_wasevs_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_wasrl_b`
--

DROP TABLE IF EXISTS `st_wasrl_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_wasrl_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `RLSTCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `RLMRK` varchar(1) CHARACTER SET utf8 NOT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`RLSTCD`,`RLMRK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_wasrl_b`
--

LOCK TABLES `st_wasrl_b` WRITE;
/*!40000 ALTER TABLE `st_wasrl_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_wasrl_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_wdpstat_r`
--

DROP TABLE IF EXISTS `st_wdpstat_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_wdpstat_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `PPTMS` decimal(6,0) DEFAULT NULL,
  `ACCPW` decimal(13,3) DEFAULT NULL,
  `PPHRS` decimal(8,2) DEFAULT NULL,
  `DRNTMS` decimal(6,0) DEFAULT NULL,
  `ACCDW` decimal(13,3) DEFAULT NULL,
  `DRNHRS` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_wdpstat_r`
--

LOCK TABLES `st_wdpstat_r` WRITE;
/*!40000 ALTER TABLE `st_wdpstat_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_wdpstat_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_wdwv_r`
--

DROP TABLE IF EXISTS `st_wdwv_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_wdwv_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `TM` datetime NOT NULL,
  `WNDV` decimal(6,1) DEFAULT NULL,
  `WNDPWR` decimal(4,0) DEFAULT NULL,
  `WNDDIR` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `WVHGT` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`TM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_wdwv_r`
--

LOCK TABLES `st_wdwv_r` WRITE;
/*!40000 ALTER TABLE `st_wdwv_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_wdwv_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_wgrw_r`
--

DROP TABLE IF EXISTS `st_wgrw_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_wgrw_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `WLMIN` decimal(13,4) DEFAULT NULL,
  `WLMINMT` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_wgrw_r`
--

LOCK TABLES `st_wgrw_r` WRITE;
/*!40000 ALTER TABLE `st_wgrw_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_wgrw_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_wgrwstat_r`
--

DROP TABLE IF EXISTS `st_wgrwstat_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_wgrwstat_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDRCD` varchar(1) CHARACTER SET utf8 NOT NULL,
  `ACCGDW` decimal(7,0) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`,`STTDRCD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_wgrwstat_r`
--

LOCK TABLES `st_wgrwstat_r` WRITE;
/*!40000 ALTER TABLE `st_wgrwstat_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_wgrwstat_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_wspavsd_r`
--

DROP TABLE IF EXISTS `st_wspavsd_r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_wspavsd_r` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `IDTM` datetime NOT NULL,
  `STTDR` decimal(7,2) DEFAULT NULL,
  `DRAVZ` decimal(9,3) DEFAULT NULL,
  `DRAVQ` decimal(11,3) DEFAULT NULL,
  `DRPW` decimal(13,3) DEFAULT NULL,
  `DRDW` decimal(13,3) DEFAULT NULL,
  PRIMARY KEY (`STCD`,`IDTM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_wspavsd_r`
--

LOCK TABLES `st_wspavsd_r` WRITE;
/*!40000 ALTER TABLE `st_wspavsd_r` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_wspavsd_r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_zqrl_b`
--

DROP TABLE IF EXISTS `st_zqrl_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_zqrl_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `LNNM` varchar(30) CHARACTER SET utf8 NOT NULL,
  `BGTM` datetime NOT NULL,
  `PTNO` decimal(6,0) NOT NULL,
  `Z` decimal(9,3) NOT NULL,
  `Q` decimal(11,3) NOT NULL,
  `COMMENTS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`LNNM`,`BGTM`,`PTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_zqrl_b`
--

LOCK TABLES `st_zqrl_b` WRITE;
/*!40000 ALTER TABLE `st_zqrl_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_zqrl_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_zvarl_b`
--

DROP TABLE IF EXISTS `st_zvarl_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_zvarl_b` (
  `STCD` varchar(8) CHARACTER SET utf8 NOT NULL,
  `MSTM` datetime NOT NULL,
  `PTNO` decimal(6,0) NOT NULL,
  `RZ` decimal(9,3) NOT NULL,
  `W` decimal(11,3) DEFAULT NULL,
  `WSFA` decimal(9,0) DEFAULT NULL,
  `MODITIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STCD`,`MSTM`,`PTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_zvarl_b`
--

LOCK TABLES `st_zvarl_b` WRITE;
/*!40000 ALTER TABLE `st_zvarl_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_zvarl_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'water'
--

--
-- Dumping routines for database 'water'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25  9:29:01
