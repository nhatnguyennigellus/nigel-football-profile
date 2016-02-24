
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
DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `matchId` varchar(8) NOT NULL,
  `aggA` int(11) DEFAULT NULL,
  `aggB` int(11) DEFAULT NULL,
  `dateTime` datetime NOT NULL,
  `goalA` int(11) NOT NULL,
  `goalB` int(11) NOT NULL,
  `isPlayed` bit(1) NOT NULL,
  `round` varchar(255) NOT NULL,
  `champId` int(11) DEFAULT NULL,
  `stadiumId` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`matchId`),
  KEY `FK_10mkci7rchif7tpmap8uvcafd` (`champId`),
  KEY `FK_fybjh8yhwnv4hlr8b7b2box1m` (`stadiumId`),
  CONSTRAINT `FK_10mkci7rchif7tpmap8uvcafd` FOREIGN KEY (`champId`) REFERENCES `championships` (`champId`),
  CONSTRAINT `FK_fybjh8yhwnv4hlr8b7b2box1m` FOREIGN KEY (`stadiumId`) REFERENCES `stadiums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` (`matchId`, `aggA`, `aggB`, `dateTime`, `goalA`, `goalB`, `isPlayed`, `round`, `champId`, `stadiumId`) VALUES ('M0000000',0,0,'2016-06-11 21:00:00',2,0,'','TGRST',4,'S0010'),('M0000001',0,0,'2016-06-13 21:00:00',3,0,'','TGRST',4,'S0010'),('M0000002',0,0,'2016-06-12 18:00:00',0,0,'\0','TGRST',4,'S0017'),('M0000003',NULL,NULL,'2016-06-23 00:00:00',3,2,'','TRO16',4,'S0016'),('M0000004',NULL,NULL,'2016-06-25 00:00:00',1,0,'','TRO16',4,'S0010'),('M0000005',NULL,NULL,'2016-06-24 21:30:00',0,0,'\0','TRGRG',4,'S0013'),('M0000006',NULL,NULL,'2016-06-22 17:20:00',0,0,'\0','TRQFN',4,'S0015'),('M0000007',NULL,NULL,'2016-06-29 21:00:00',0,0,'\0','TRGRF',4,'S0010'),('M0000008',NULL,NULL,'2016-01-06 09:45:00',0,0,'\0','TRGRA',4,'S0015');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

