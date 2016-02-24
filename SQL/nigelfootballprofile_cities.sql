
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
DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `countryId` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8atj3hwbl1latdtjmeeyvqilu` (`countryId`),
  CONSTRAINT `FK_8atj3hwbl1latdtjmeeyvqilu` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `name`, `countryId`) VALUES ('C0000','Porto','L0123'),('C0001','München','L0062'),('C0002','Manchester','L0051'),('C0003','Berlin','L0062'),('C0004','Rome','L0080'),('C0005','Madrid','L0141'),('C0006','Barcelona','L0141'),('C0007','Napoli','L0080'),('C0008','Milan','L0080'),('C0009','Ho Chi Minh City','L0166'),('C0010','Lisbon','L0123'),('C0011','London','L0051'),('C0012','Dortmund','L0062'),('C0013','Stuttgart','L0062'),('C0014','Moscow','L0127'),('C0015','Zagreb','L0041'),('C0016','Amsterdam','L0111'),('C0017','Saint-Denis','L0058'),('C0018','Marseille','L0058'),('C0019','Lyon','L0058'),('C0020','Lille','L0058'),('C0021','Bordeaux','L0058'),('C0022','Toulouse','L0058'),('C0023','Lens','L0058'),('C0024','Nice','L0058'),('C0025','Saint-Étienne','L0058'),('C0026','Paris','L0058'),('C0027','Turin','L0080'),('C0028','Zürich','L0146'),('C0029','Wien','L0011'),('C0030','Kyiv','L0159'),('C0031','Prague','L0044'),('C0032','Stockholm','L0145'),('C0033','Warsaw','L0122'),('C0034','Trnava','L0137'),('C0035','Budapest','L0072'),('C0036','Istanbul','L0156'),('C0037','Reykjavík','L0073'),('C0038','Cardiff','L0167'),('C0039','Elbasan','L0001'),('C0040','Belfast','L0116'),('C0041','Bucharest','L0126'),('C0042','Dublin','L0078');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

