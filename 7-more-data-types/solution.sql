CREATE TABLE Band (
  ID int(10) unsigned NOT NULL AUTO_INCREMENT,
  Name varchar(40) DEFAULT NULL,
  YearFormed year(4) NOT NULL,
  IsTogether tinyint(1) NOT NULL DEFAULT '1',
  Genre enum('Rock','Alternative','Country','Funk','Grunge','Bluegrass') DEFAULT NULL,
  PRIMARY KEY (ID)
)
