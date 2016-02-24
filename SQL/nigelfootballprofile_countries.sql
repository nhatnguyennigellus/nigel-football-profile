
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
DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` varchar(5) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `shortName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `name`, `shortName`) VALUES ('L0000','Afghanistan','AFG'),('L0001','Albania','ALB'),('L0002','Algeria','ALG'),('L0003','American Samoa','ASA'),('L0004','Andorra','AND'),('L0005','Angola','ANG'),('L0006','Anguilla','AIA'),('L0007','Antigua & Barbuda','ATG'),('L0008','Argentina','ARG'),('L0009','Armenia','ARM'),('L0010','Australia','AUS'),('L0011','Austria','AUT'),('L0012','Azerbaijan','AZE'),('L0013','Bahamas','BAH'),('L0014','Bahrain','BHR'),('L0015','Bangladesh','BAN'),('L0016','Belarus','BLR'),('L0017','Belgium','BEL'),('L0018','Belize','BLZ'),('L0019','Benin','BEN'),('L0020','Bhutan','BHU'),('L0021','Bolivia','BOL'),('L0022','Bosnia & Herzegovina','BIH'),('L0023','Brazil','BRA'),('L0024','British Virgin Islands','VGB'),('L0025','Brunei Darussalam','BRU'),('L0026','Bulgaria','BUL'),('L0027','Burkina Faso','BFA'),('L0028','Cambodia','CAM'),('L0029','Cameroon','CMR'),('L0030','Canada','CAN'),('L0031','Central African Republic','CTA'),('L0032','Chile','CHI'),('L0033','China','CHN'),('L0034','Colombia','COL'),('L0035','Comoros','COM'),('L0036','Congo','CGO'),('L0037','Congo Democratic Republic','COD'),('L0038','Cook Islands','COK'),('L0039','Costa Rica','CRC'),('L0040','CÃ´te d\'Ivoire','CIV'),('L0041','Croatia','CRO'),('L0042','Cuba','CUB'),('L0043','Cyprus','CYP'),('L0044','Czech Republic','CZE'),('L0045','Denmark','DEN'),('L0046','Djibouti','DJI'),('L0047','Ecuador','ECU'),('L0048','East Timor','TLS'),('L0049','Egypt','EGY'),('L0050','El Salvador','SLV'),('L0051','England','ENG'),('L0052','Equatorial Guinea','EQG'),('L0053','Estonia','EST'),('L0054','Ethiopia','ETH'),('L0055','Fiji','FJI'),('L0056','Faroe Islands','FRO'),('L0057','Finland','FIN'),('L0058','France','FRA'),('L0059','Gabon','GBN'),('L0060','Gambia','GAM'),('L0061','Georgia','GEO'),('L0062','Germany','GER'),('L0063','Ghana','GHA'),('L0064','Greece','GRE'),('L0065','Grenada','GRN'),('L0066','Guam','GAM'),('L0067','Guinea','GUI'),('L0068','Guinea-Bissau','GNB'),('L0069','Guyana','GUY'),('L0070','Haiti','HAI'),('L0071','Honduras','HON'),('L0072','Hungary','HUN'),('L0073','Iceland','ISL'),('L0074','India','IND'),('L0075','Indonesia','INA'),('L0076','Iran','IRI'),('L0077','Iraq','IRQ'),('L0078','Republic of Ireland','IRE'),('L0079','Israel','ISR'),('L0080','Italy','ITA'),('L0081','Jamaica','JAM'),('L0082','Japan','JPN'),('L0083','Jordan','JOR'),('L0084','Kazakhstan','KAZ'),('L0085','Korea Republic','KOR'),('L0086','Kuwait','KUW'),('L0087','Kyrgyzstan','KGZ'),('L0088','Laos','LAO'),('L0089','Latvia','LVA'),('L0090','Lebanon','LIB'),('L0091','Lesotho','LES'),('L0092','Liberia','LBR'),('L0093','Libya','LBY'),('L0094','Liechtenstein','LIE'),('L0095','Lithuania','LTU'),('L0096','Luxembourg','LUX'),('L0097','Macedonia','MKD'),('L0098','Madagascar','MAD'),('L0099','Malawi','MWI'),('L0100','Malaysia','MAS'),('L0101','Mali','MLI'),('L0102','Malta','MLT'),('L0103','Mexico','MEX'),('L0104','Moldova','MDA'),('L0105','Montenegro','MNE'),('L0106','Montserrat','MSR'),('L0107','Mozambique','MOZ'),('L0108','Myanmar','MYA'),('L0109','Namibia','NAM'),('L0110','Nepal','NEP'),('L0111','Netherlands','NED'),('L0112','New Zealand','NZL'),('L0113','Nicaragua','NCA'),('L0114','Nigeria','NGA'),('L0115','Norway','NOR'),('L0116','Northern Ireland','NIR'),('L0117','Oman','OMA'),('L0118','Papua New Guinea','PNG'),('L0119','Paraguay','PAR'),('L0120','Peru','PER'),('L0121','Philippines','PHI'),('L0122','Poland','POL'),('L0123','Portugal','POR'),('L0124','Puerto Rico','PUR'),('L0125','Qatar','QAR'),('L0126','Romania','ROM'),('L0127','Russia','RUS'),('L0128','Rwanda','RWA'),('L0129','Samoa','SAM'),('L0130','San Marino','SMR'),('L0131','Saudi Arabia','KSA'),('L0132','Scotland','SCO'),('L0133','Senegal','SEN'),('L0134','Serbia','SRB'),('L0135','Seychelles','SEY'),('L0136','Singapore','SIN'),('L0137','Slovakia','SVK'),('L0138','Slovenia','SVN'),('L0139','Solomon Islands','SOL'),('L0140','South Africa','RSA'),('L0141','Spain','ESP'),('L0142','Sudan','SDN'),('L0143','Suriname','SUR'),('L0144','Swaziland','SWZ'),('L0145','Sweden','SWE'),('L0146','Switzerland','SUI'),('L0147','Syria','SYR'),('L0148','Chinese Taipei','TPE'),('L0149','Tajikistan','TJK'),('L0150','Tahiti','TAH'),('L0151','Thailand','THA'),('L0152','Togo','TOG'),('L0153','Tonga','TGA'),('L0154','Trinidad & Tobago','TRI'),('L0155','Tunisia','TUN'),('L0156','Turkey','TUR'),('L0157','Turkmenistan','TKM'),('L0158','Turks and Caicos Islands','TCA'),('L0159','Ukraine','UKR'),('L0160','United Arab Emirates','UAE'),('L0161','United States','USA'),('L0162','Uruguay','URU'),('L0163','Uzbekistan','UZB'),('L0164','Vanuatu','VAN'),('L0165','Venezuela','VEN'),('L0166','Vietnam','VIE'),('L0167','Wales','WAL'),('L0168','Yemen','YEM'),('L0169','Zimbabwe','ZIM'),('L0170','ï»¿Republic of Ireland','IRL');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

