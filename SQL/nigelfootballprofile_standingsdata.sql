
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
DROP TABLE IF EXISTS `standingsdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standingsdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goalsAgainst` int(11) NOT NULL,
  `goalsDiff` int(11) NOT NULL,
  `draw` int(11) NOT NULL,
  `goalsFor` int(11) NOT NULL,
  `groupName` varchar(255) NOT NULL,
  `loss` int(11) NOT NULL,
  `played` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `season` varchar(255) NOT NULL,
  `win` int(11) NOT NULL,
  `champId` int(11) DEFAULT NULL,
  `teamId` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qi72x75k84gbcapyngggx8jsd` (`champId`),
  KEY `FK_kcd0xicyt6hoqkawgmeb9141s` (`teamId`),
  CONSTRAINT `FK_kcd0xicyt6hoqkawgmeb9141s` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`),
  CONSTRAINT `FK_qi72x75k84gbcapyngggx8jsd` FOREIGN KEY (`champId`) REFERENCES `championships` (`champId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `standingsdata` WRITE;
/*!40000 ALTER TABLE `standingsdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `standingsdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

