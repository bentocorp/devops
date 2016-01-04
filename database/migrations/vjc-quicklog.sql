


# 2016-01-04

INSERT INTO `bento`.`settings` (`key`, `value`, `public`) VALUES ('pod_mode', '5', '1');


ALTER TABLE `bento`.`Order` 
CHANGE COLUMN `eta_min` `eta_min` SMALLINT NULL DEFAULT NULL ,
CHANGE COLUMN `eta_max` `eta_max` SMALLINT NULL DEFAULT NULL ;

ALTER TABLE `bento`.`OrderLog` 
CHANGE COLUMN `eta_min` `eta_min` SMALLINT NULL DEFAULT NULL ,
CHANGE COLUMN `eta_max` `eta_max` SMALLINT NULL DEFAULT NULL ;
