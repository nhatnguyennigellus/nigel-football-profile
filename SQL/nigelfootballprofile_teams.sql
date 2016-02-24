
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
DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` varchar(7) NOT NULL,
  `coach` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `logoUrl` varchar(255) NOT NULL,
  `shortName` varchar(255) NOT NULL,
  `stadiumId` varchar(5) DEFAULT NULL,
  `teamType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_raiksisxwevy1mnwx88vo2ik0` (`stadiumId`),
  CONSTRAINT `FK_raiksisxwevy1mnwx88vo2ik0` FOREIGN KEY (`stadiumId`) REFERENCES `stadiums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` (`id`, `coach`, `fullName`, `logoUrl`, `shortName`, `stadiumId`, `teamType`) VALUES ('T000001','Joachim Loew','Germany','/resources/images/logoteam/ger.png','GER','S0001','TNATL'),('T000002','Pep Guardiola','FC Bayern Munich','/resources/images/logoteam/Bayern.png','FCB','S0000','TCLUB'),('T000003','Louis van Gaal','Manchester United FC','/resources/images/logoteam\\MU.png','MUN','S0006','TCLUB'),('T000004','Thomas Tuchel','Borussia Dortmund','/resources/images/logoteam\\Dortmund.png','BVB','S0007','TCLUB'),('T000005','Pal Dardai','Hertha Berlin','/resources/images/logoteam/nologo.png','BSC','S0001','TCLUB'),('T000006','Danny Blind','Netherlands','/resources/images/logoteam\\ned.png','NED','S0009','TNATL'),('T000007','Vicente del Bosque','Spain','/resources/images/logoteam\\esp.png','ESP','S0004','TNATL'),('T000008','Laurent Blanc','France','/resources/images/logoteam\\fra.png','FRA','S0010','TNATL'),('T000009','Roy Hodgson','England','/resources/images/logoteam\\eng.png','ENG','S0021','TNATL'),('T000010','Fernando Santos','Portugal','/resources/images/logoteam\\por.png','POR','S0020','TNATL'),('T000011','Marc Wilmots','Belgium','/resources/images/logoteam\\bel.png','BEL','S0017','TNATL'),('T000012','Antonio Conte','Italy','/resources/images/logoteam\\ita.png','ITA','S0002','TNATL'),('T000013','Fabio Capello','Russia','/resources/images/logoteam\\rus.png','RUS','S0023','TNATL'),('T000014','Vladimir Petkovic','Switzerland','/resources/images/logoteam\\sui.png','SUI','S0036','TNATL'),('T000015','Marcel Koller','Austria','/resources/images/logoteam\\aut.png','AUT','S0034','TNATL'),('T000016','Niko Kovac','Croatia','/resources/images/logoteam\\cro.png','CRO','S0024','TNATL'),('T000017','Mykhailo Fomenko','Ukraine','/resources/images/logoteam\\ukr.png','UKR','S0033','TNATL'),('T000018','Pavel Vrba','Czech Republic','/resources/images/logoteam\\cze.png','CZE','S0037','TNATL'),('T000019','Erik HamrÃÂ©n','Sweden','/resources/images/logoteam\\swe.png','SWE','S0035','TNATL'),('T000020','Adam Nawalka','Poland','/resources/images/logoteam\\pol.png','POL','S0039','TNATL'),('T000021','Victor Piturca','Romania','/resources/images/logoteam\\rou.png','ROU','S0025','TNATL'),('T000022','Jan Kozak','Slovakia','/resources/images/logoteam\\svk.png','SVK','S0026','TNATL'),('T000023','Bernd Storck','Hungary','/resources/images/logoteam\\hun.png','HUN','S0027','TNATL'),('T000024','Fatih Terim','Turkey','/resources/images/logoteam\\tur.png','TUR','S0028','TNATL'),('T000025','Martin O\'Neill','Republic of Ireland','/resources/images/logoteam\\irl.png','IRL','S0029','TNATL'),('T000026','Lars Lagerback & Heimir Hallgrimsson','Iceland','/resources/images/logoteam\\isl.png','ISL','S0040','TNATL'),('T000027','Chris Coleman','Wales','/resources/images/logoteam\\wal.png','WAL','S0030','TNATL'),('T000028','Gianni De Biasi','Albania','/resources/images/logoteam\\alb.png','ALB','S0031','TNATL'),('T000029','Michael O\'Neill','Northern Ireland','/resources/images/logoteam\\nir.png','NIR','S0032','TNATL');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

