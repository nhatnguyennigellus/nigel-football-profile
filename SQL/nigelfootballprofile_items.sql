
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
DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(45) NOT NULL,
  `description` varchar(100) NOT NULL,
  `language` varchar(3) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `item`, `description`, `language`, `type`) VALUES (1,'LCHMP','Champion','E','LEAGUE'),(2,'LCLDR','Champions League','E','LEAGUE'),(3,'LCLQL','Champions League Qualifiers','E','LEAGUE'),(4,'LELDR','Europa League','E','LEAGUE'),(5,'LELQL','Europa League Qualifiers','E','LEAGUE'),(6,'LNORM','Now Playing','E','LEAGUE'),(7,'LPOFF','Play-off','E','LEAGUE'),(8,'LRLGN','Relegation','E','LEAGUE'),(9,'TGRST','Group Stage','E','TOUR'),(10,'TELMD','Eliminated','E','TOUR'),(11,'TRO16','Round 1 of 16','E','TOUR'),(12,'T14FN','Quarter Final','E','TOUR'),(13,'T12FN','Semi Final','E','TOUR'),(14,'TFINL','Final','E','TOUR'),(15,'T3PLC','Third place','E','TOUR'),(16,'CRO64','Round 1 of 64','E','CUP'),(17,'CRO32','Round 1 of 32','E','CUP'),(18,'CRO16','Round 1 of 16','E','CUP'),(19,'C14FN','Quarter Final','E','CUP'),(20,'C12FN','Semi Final','E','CUP'),(21,'CFINL','Final','E','CUP'),(22,'ADDI','Add Item','E','WLOG'),(23,'UPDT','Update Item','E','WLOG'),(24,'SSCR','Submit score','E','WLOG'),(25,'IMPT','Import','E','WLOG'),(26,'SQLR','Submit Qualifiers','E','WLOG'),(27,'TCLUB','Club','E','TEAM'),(28,'TNATL','National Team','E','TEAM'),(29,'FTOUR','Tournament championship','E','CHAMP'),(30,'FLEAG','League championship','E','CHAMP'),(31,'FPOFF','Play-off champions','E','CHAMP'),(32,'GK','Goalkeeper','E','POS'),(33,'DF','Defender','E','POS'),(34,'MF','Midfielder','E','POS'),(35,'FW','Forward','E','POS'),(36,'CFINL','Finale','D','CUP'),(37,'CRO64','1. Hauptrunde','D','CUP'),(38,'CRO32','2. Hauptrunde','D','CUP'),(39,'CRO16','Achtelfinale','D','CUP'),(40,'C14FN','Viertelfinale','D','CUP'),(41,'C12FN','Halbfinale','D','CUP'),(42,'TOFFL','Tour Offline','E','TOUR'),(43,'COFFL','Cup Offline','E','CUP'),(44,'LOFFL','League Offline','E','LEAGUE'),(45,'LRD01','1. Spieltag','D','LEAGUE ROUND'),(46,'LRD02','2. Spieltag','D','LEAGUE ROUND'),(47,'LRD03','3. Spieltag','D','LEAGUE ROUND'),(48,'LRD04','4. Spieltag','D','LEAGUE ROUND'),(49,'LRD05','5. Spieltag','D','LEAGUE ROUND'),(50,'LRD06','6. Spieltag','D','LEAGUE ROUND'),(51,'LRD07','7. Spieltag','D','LEAGUE ROUND'),(52,'LRD08','8. Spieltag','D','LEAGUE ROUND'),(53,'LRD09','9. Spieltag','D','LEAGUE ROUND'),(54,'LRD10','10. Spieltag','D','LEAGUE ROUND'),(55,'LRD11','11. Spieltag','D','LEAGUE ROUND'),(56,'LRD12','12. Spieltag','D','LEAGUE ROUND'),(57,'LRD13','13. Spieltag','D','LEAGUE ROUND'),(58,'LRD14','14. Spieltag','D','LEAGUE ROUND'),(59,'LRD15','15. Spieltag','D','LEAGUE ROUND'),(60,'LRD16','16. Spieltag','D','LEAGUE ROUND'),(61,'LRD17','17. Spieltag','D','LEAGUE ROUND'),(62,'LRD18','18. Spieltag','D','LEAGUE ROUND'),(63,'LRD19','19. Spieltag','D','LEAGUE ROUND'),(64,'LRD20','20. Spieltag','D','LEAGUE ROUND'),(65,'LRD21','21. Spieltag','D','LEAGUE ROUND'),(66,'LRD22','22. Spieltag','D','LEAGUE ROUND'),(67,'LRD23','23. Spieltag','D','LEAGUE ROUND'),(68,'LRD24','24. Spieltag','D','LEAGUE ROUND'),(69,'LRD25','25. Spieltag','D','LEAGUE ROUND'),(70,'LRD26','26. Spieltag','D','LEAGUE ROUND'),(71,'LRD27','27. Spieltag','D','LEAGUE ROUND'),(72,'LRD28','28. Spieltag','D','LEAGUE ROUND'),(73,'LRD29','29. Spieltag','D','LEAGUE ROUND'),(74,'LRD30','30. Spieltag','D','LEAGUE ROUND'),(75,'LRD31','31. Spieltag','D','LEAGUE ROUND'),(76,'LRD32','32. Spieltag','D','LEAGUE ROUND'),(77,'LRD33','33. Spieltag','D','LEAGUE ROUND'),(78,'LRD34','34. Spieltag','D','LEAGUE ROUND'),(79,'TRGRA','Group Stage - Group A','E','TOUR ROUND'),(80,'TRGRB','Group Stage - Group B','E','TOUR ROUND'),(81,'TRGRC','Group Stage - Group C','E','TOUR ROUND'),(82,'TRGRD','Group Stage - Group D','E','TOUR ROUND'),(83,'TRGRE','Group Stage - Group E','E','TOUR ROUND'),(84,'TRGRF','Group Stage - Group F','E','TOUR ROUND'),(85,'TRGRG','Group Stage - Group G','E','TOUR ROUND'),(86,'TRGRH','Group Stage - Group H','E','TOUR ROUND'),(87,'TRR16','Round 1 of 16','E','TOUR ROUND'),(88,'TRQFN','Quarter Final','E','TOUR ROUND'),(89,'TRSFN','Semi Final','E','TOUR ROUND'),(90,'TRFNL','Final','E','TOUR ROUND'),(91,'TR3RD','Third Place','E','TOUR ROUND'),(92,'CRR64','1. Hauptrunde','D','CUP ROUND'),(93,'CRR32','2. Hauptrunde','D','CUP ROUND'),(94,'CRR16','Achtelfinale','D','CUP ROUND'),(95,'CRQFN','Viertelfinale','D','CUP ROUND'),(96,'CRSFN','Halbfinale','D','CUP ROUND'),(97,'CRFNL','Finale','D','CUP ROUND'),(98,'LCHMP','Meister','D','LEAGUE'),(99,'LCLDR','Champions-League','D','LEAGUE');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

