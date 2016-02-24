
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
DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadiums` (
  `id` varchar(5) NOT NULL,
  `capacity` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `uefaName` varchar(255) NOT NULL,
  `cityId` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_261j38htwj8no4r4wf9ux5sng` (`cityId`),
  CONSTRAINT `FK_261j38htwj8no4r4wf9ux5sng` FOREIGN KEY (`cityId`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` (`id`, `capacity`, `name`, `uefaName`, `cityId`) VALUES ('S0000',71000,'Allianz Arena','Fußball-Arena-München','C0001'),('S0001',65000,'Olympiastadion','Olympiastadion','C0003'),('S0002',76000,'San Siro','San Siro','C0008'),('S0003',86000,'Camp Nou','Camp Nou','C0006'),('S0004',75000,'Santiago Bernabeu','Santiago Bernabeu','C0005'),('S0005',65000,'Emirates Stadium','Arsenal Stadium','C0011'),('S0006',71000,'Old Trafford','Old Trafford','C0002'),('S0007',92000,'Signal-Iduna-Park','BVB Stadion','C0012'),('S0008',51000,'Stadio San Paolo','Stadio San Paolo','C0007'),('S0009',72000,'Amsterdam ArenA','Amsterdam ArenA','C0016'),('S0010',81338,'Stade de France','Stade de France','C0017'),('S0011',67394,'Stade Vélodrome','Stade Vélodrome','C0018'),('S0012',59286,'Stade des Lumières','Stade des Lumières','C0019'),('S0013',50186,'Stade Pierre-Mauroy','Stade Pierre-Mauroy','C0020'),('S0014',42115,'Nouveau Stade de Bordeaux','Nouveau Stade de Bordeaux','C0021'),('S0015',47000,'Parc des Princes','Parc des Princes','C0026'),('S0016',41965,'Stade Geoffroy-Guichard','Stade Geoffroy-Guichard','C0025'),('S0017',35624,'Allianz Riviera','Allianz Riviera','C0024'),('S0018',38223,'Stade Bollaert-Delelis','Stade Bollaert-Delelis','C0023'),('S0019',33300,'Stadium Municipal','Stadium Municipal','C0022'),('S0020',57900,'Estádio do Dragão','Estádio do Dragão','C0000'),('S0021',100000,'Wembley Stadium','Wembley Stadium','C0011'),('S0022',70634,'Stadio Olimpico','Stadio Olimpico','C0004'),('S0023',78360,'Luzhniki Stadium','Luzhniki Stadium','C0014'),('S0024',35123,'Stadion Maksimir','Stadion Maksimir','C0015'),('S0025',55634,'Arena Națională','Arena Națională','C0041'),('S0026',19200,'Štadión Antona Malatinského','Štadión Antona Malatinského','C0034'),('S0027',22000,'Groupama Arena','Groupama Arena','C0035'),('S0028',17801,'Başakşehir Fatih Terim Stadium','Başakşehir Fatih Terim Stadium','C0036'),('S0029',51700,'Aviva Stadium','Aviva Stadium','C0042'),('S0030',33280,'Cardiff City Stadium','Cardiff City Stadium','C0038'),('S0031',12800,'Elbasan Arena','Elbasan Arena','C0039'),('S0032',20000,'Windsor Park','Windsor Park','C0040'),('S0033',70050,'NSC Olimpiyskiy','NSC Olimpiyskiy','C0030'),('S0034',50865,'Ernst-Happel-Stadion','Ernst-Happel-Stadion','C0029'),('S0035',50653,'Friends Arena','Friends Arena','C0032'),('S0036',26104,'Letzigrund','Letzigrund','C0028'),('S0037',19416,'Generali Arena','Generali Arena','C0031'),('S0038',41475,'Juventus Arena','Juventus Arena','C0027'),('S0039',58145,'Stadion Narodowy','Stadion Narodowy','C0033'),('S0040',9800,'Laugardalsvöllur','Laugardalsvöllur','C0037');
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

