

# The following have been run on ALL

# 1
ALTER TABLE `bento`.`Order` 
ADD COLUMN `is_oa` TINYINT NULL DEFAULT 0 AFTER `eta_max`,
ADD COLUMN `oa_window_start` TIME NULL DEFAULT NULL AFTER `is_oa`,
ADD COLUMN `oa_window_end` TIME NULL DEFAULT NULL AFTER `oa_window_start`;

ALTER TABLE `bento`.`OrderLog` 
ADD COLUMN `is_oa` TINYINT NULL DEFAULT 0 AFTER `eta_max`,
ADD COLUMN `oa_window_start` TIME NULL DEFAULT NULL AFTER `is_oa`,
ADD COLUMN `oa_window_end` TIME NULL DEFAULT NULL AFTER `oa_window_start`;


# 2
ALTER TABLE `bento`.`Order` 
DROP COLUMN `is_oa`,
CHANGE COLUMN `oa_window_start` `delivery_window_start` DATETIME NULL DEFAULT NULL ,
CHANGE COLUMN `oa_window_end` `delivery_window_end` DATETIME NULL DEFAULT NULL ,
ADD COLUMN `order_type` TINYINT NULL DEFAULT 1 COMMENT '1:ondemand; 2:orderahead' AFTER `eta_max`,
ADD COLUMN `delivery_timezone` VARCHAR(45) NULL DEFAULT NULL AFTER `delivery_window_end`,
ADD COLUMN `delivery_fk_Kitchen` VARCHAR(45) NULL DEFAULT NULL AFTER `delivery_timezone`,
ADD COLUMN `fk_OrderAheadZone` VARCHAR(45) NULL DEFAULT NULL AFTER `delivery_fk_Kitchen`,
ADD COLUMN `fk_Menu` VARCHAR(45) CHARACTER SET 'dec8' COLLATE 'dec8_bin' NULL DEFAULT NULL COMMENT 'Typically associated with order ahead.' AFTER `fk_OrderAheadZone`;

ALTER TABLE `bento`.`OrderLog` 
DROP COLUMN `is_oa`,
CHANGE COLUMN `oa_window_start` `delivery_window_start` DATETIME NULL DEFAULT NULL ,
CHANGE COLUMN `oa_window_end` `delivery_window_end` DATETIME NULL DEFAULT NULL ,
ADD COLUMN `order_type` TINYINT NULL DEFAULT 1 COMMENT '1:ondemand; 2:orderahead' AFTER `eta_max`,
ADD COLUMN `delivery_timezone` VARCHAR(45) NULL DEFAULT NULL AFTER `delivery_window_end`,
ADD COLUMN `delivery_fk_Kitchen` VARCHAR(45) NULL DEFAULT NULL AFTER `delivery_timezone`,
ADD COLUMN `fk_OrderAheadZone` VARCHAR(45) NULL DEFAULT NULL AFTER `delivery_fk_Kitchen`,
ADD COLUMN `fk_Menu` VARCHAR(45) CHARACTER SET 'dec8' COLLATE 'dec8_bin' NULL DEFAULT NULL COMMENT 'Typically associated with order ahead.' AFTER `fk_OrderAheadZone`;


# 3
ALTER TABLE `bento`.`Order` 
CHANGE COLUMN `delivery_fk_Kitchen` `fk_Kitchen` INT NULL DEFAULT NULL COMMENT 'Typically associated with order-ahead and/or delivery.' ,
CHANGE COLUMN `fk_OrderAheadZone` `fk_OrderAheadZone` INT NULL DEFAULT NULL ,
CHANGE COLUMN `fk_Menu` `fk_Menu` INT NULL DEFAULT NULL COMMENT 'Typically associated with order-ahead and/or delivery.' ;

ALTER TABLE `bento`.`OrderLog` 
CHANGE COLUMN `delivery_fk_Kitchen` `fk_Kitchen` INT NULL DEFAULT NULL COMMENT 'Typically associated with order-ahead and/or delivery.' ,
CHANGE COLUMN `fk_OrderAheadZone` `fk_OrderAheadZone` INT NULL DEFAULT NULL ,
CHANGE COLUMN `fk_Menu` `fk_Menu` INT NULL DEFAULT NULL COMMENT 'Typically associated with order-ahead and/or delivery.' ;


# 4
ALTER TABLE `bento`.`Order` 
CHANGE COLUMN `eta_min` `eta_min` SMALLINT(6) NULL DEFAULT NULL COMMENT 'For on-demand.' ,
CHANGE COLUMN `eta_max` `eta_max` SMALLINT(6) NULL DEFAULT NULL COMMENT 'For on-demand.' ,
CHANGE COLUMN `delivery_window_start` `scheduled_window_start` DATETIME NULL DEFAULT NULL COMMENT 'A scheduled delivery.' ,
CHANGE COLUMN `delivery_window_end` `scheduled_window_end` DATETIME NULL DEFAULT NULL COMMENT 'A scheduled delivery.' ,
CHANGE COLUMN `delivery_timezone` `scheduled_timezone` VARCHAR(45) NULL DEFAULT NULL COMMENT 'A scheduled delivery.' ,
CHANGE COLUMN `fk_Kitchen` `fk_Kitchen` INT(11) NULL DEFAULT NULL COMMENT 'Typically associated with order-ahead and/or scheduled delivery.' ,
CHANGE COLUMN `fk_Menu` `fk_Menu` INT(11) NULL DEFAULT NULL COMMENT 'Typically associated with order-ahead and/or scheduled delivery.' ;

ALTER TABLE `bento`.`OrderLog` 
CHANGE COLUMN `eta_min` `eta_min` SMALLINT(6) NULL DEFAULT NULL COMMENT 'For on-demand.' ,
CHANGE COLUMN `eta_max` `eta_max` SMALLINT(6) NULL DEFAULT NULL COMMENT 'For on-demand.' ,
CHANGE COLUMN `delivery_window_start` `scheduled_window_start` DATETIME NULL DEFAULT NULL COMMENT 'A scheduled delivery.' ,
CHANGE COLUMN `delivery_window_end` `scheduled_window_end` DATETIME NULL DEFAULT NULL COMMENT 'A scheduled delivery.' ,
CHANGE COLUMN `delivery_timezone` `scheduled_timezone` VARCHAR(45) NULL DEFAULT NULL COMMENT 'A scheduled delivery.' ,
CHANGE COLUMN `fk_Kitchen` `fk_Kitchen` INT(11) NULL DEFAULT NULL COMMENT 'Typically associated with order-ahead and/or scheduled delivery.' ,
CHANGE COLUMN `fk_Menu` `fk_Menu` INT(11) NULL DEFAULT NULL COMMENT 'Typically associated with order-ahead and/or scheduled delivery.' ;

# 5
ALTER TABLE `bento`.`Order` 
ADD COLUMN `for_date` DATE NULL DEFAULT NULL AFTER `order_type`;

ALTER TABLE `bento`.`OrderLog` 
ADD COLUMN `for_date` DATE NULL DEFAULT NULL AFTER `order_type`;



# All have been run on dev only
## -------- For dev and prod only (do after everything else) ----------------------------------------------------------

INSERT INTO `bento`.`Area` (`name`, `polygon`) VALUES ('Bay Area', '-123.140258,38.104305 -121.821899,38.087013 -121.206665,37.020098 -122.332763,36.760891 -123.140258,38.104305');

INSERT INTO `bento`.`OrderAheadZone` (`name`, `polygon`, `fk_Area`, `fk_Kitchen`) VALUES ('San Francisco', '-122.404003,37.813174 -122.380571,37.786453 -122.376794,37.750629 -122.395462,37.749747 -122.404346,37.74917 -122.408208,37.748322 -122.422585,37.747982 -122.438249,37.747134 -122.438303,37.748585 -122.441596,37.748593 -122.443614,37.747142 -122.444032,37.747533 -122.444161,37.748355 -122.443227,37.750247 -122.442348,37.753878 -122.44106,37.755956 -122.441639,37.756567 -122.442626,37.757093 -122.443163,37.757788 -122.443914,37.758263 -122.444815,37.758874 -122.444794,37.759502 -122.444493,37.759841 -122.443785,37.760265 -122.442648,37.761062 -122.441103,37.761079 -122.441425,37.762148 -122.446789,37.761809 -122.447068,37.762827 -122.446103,37.764302 -122.445845,37.764591 -122.446392,37.767203 -122.451247,37.766601 -122.452991,37.76638 -122.453935,37.766266 -122.453232,37.767585 -122.453479,37.768789 -122.453967,37.771198 -122.454675,37.774734 -122.455587,37.779559 -122.456027,37.780144 -122.456306,37.781289 -122.456617,37.781416 -122.456842,37.783952 -122.451816,37.784121 -122.447905,37.785041 -122.446424,37.785363 -122.447926,37.792812 -122.450952,37.80897 -122.404003,37.813174', '1', '1');




# All have been run on local and dev only
## -------- For All ------------------------------------------------------------------------------------------------


## -------- New Queries -----------------

## Kitchen

CREATE TABLE `bento`.`Kitchen` (
  `pk_Kitchen` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL COMMENT 'A logical kitchen that holds food inventory for OrderAhead.',
  PRIMARY KEY (`pk_Kitchen`));

ALTER TABLE `bento`.`Kitchen` 
CHANGE COLUMN `description` `description` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL , 
COMMENT = 'A logical kitchen that holds food inventory for OrderAhead.' ;

ALTER TABLE `bento`.`Kitchen` 
ADD COLUMN `name` VARCHAR(45) NULL AFTER `pk_Kitchen`,
ADD UNIQUE INDEX `name_UNIQUE` (`name` ASC);

INSERT INTO `bento`.`Kitchen` (`name`, `description`) VALUES ('SF1', '2152 3rd st');

ALTER TABLE `bento`.`Kitchen` 
ADD COLUMN `tzName` VARCHAR(45) NULL AFTER `description`;

UPDATE `bento`.`Kitchen` SET `tzName`='America/Los_Angeles' WHERE `pk_Kitchen`='1';



## Area
CREATE TABLE `bento`.`Area` (
  `pk_Area` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `polygon` TEXT NULL,
  PRIMARY KEY (`pk_Area`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

ALTER TABLE `bento`.`Area` 
COMMENT = 'A conceptual service area, akin to a \"market\" or a \"region\", that serves to group a number of service areas into a larger grouping. This also serves to help easily narrow down lat/long polygon geofencing.' ;

ALTER TABLE `bento`.`Area` 
CHANGE COLUMN `pk_Area` `pk_Area` INT(11) NOT NULL AUTO_INCREMENT ;


## OrderAheadZone
CREATE TABLE `bento`.`OrderAheadZone` (
  `pk_OrderAheadZone` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `polygon` TEXT NULL,
  `fk_Area` INT NULL,
  `fk_Kitchen` INT NULL,
  PRIMARY KEY (`pk_OrderAheadZone`));

ALTER TABLE `bento`.`OrderAheadZone` 
ADD UNIQUE INDEX `name_UNIQUE` (`name` ASC);


## MenuInventory
CREATE TABLE `bento`.`MenuInventory` (
  `pk_MenuInventory` INT NOT NULL AUTO_INCREMENT,
  `fk_Menu` INT NULL,
  `fk_item` INT NULL,
  `item_type` ENUM('Dish') NULL DEFAULT 'Dish',
  `qty` INT DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `change_reason` ENUM('init','admin_update','order_assignment') NULL DEFAULT 'init',
  PRIMARY KEY (`pk_MenuInventory`),
  UNIQUE INDEX `uq_item` (`fk_Menu` ASC, `fk_item` ASC, `item_type` ASC),
  INDEX `index3` (`fk_Menu` ASC));
USE `bento`;

DELIMITER $$
DROP TRIGGER IF EXISTS bento.MenuInventoryLog$$
USE `bento`$$
CREATE DEFINER=`bento`@`%` TRIGGER `MenuInventoryLog` 
	BEFORE UPDATE ON `MenuInventory` FOR EACH ROW

BEGIN  

INSERT INTO `MenuInventoryLog` 
select  NULL, t.* 
from `MenuInventory` t where pk_MenuInventory = OLD.pk_MenuInventory;

END$$
DELIMITER ;
USE `bento`;


DELIMITER $$
DROP TRIGGER IF EXISTS bento.MenuInventoryLog_BEFORE_DELETE$$
USE `bento`$$
CREATE DEFINER=`bento`@`%` TRIGGER `MenuInventoryLog_BEFORE_DELETE`
	BEFORE DELETE ON `MenuInventory` FOR EACH ROW

BEGIN  

INSERT INTO `MenuInventoryLog` 
select  NULL, t.* 
from `MenuInventory` t where pk_MenuInventory = OLD.pk_MenuInventory;

END$$
DELIMITER ;


## MenuInventoryLog
CREATE TABLE `bento`.`MenuInventoryLog` (
  `pk_MenuInventoryLog` int(11) NOT NULL AUTO_INCREMENT,
  `pk_MenuInventory` INT DEFAULT NULL,
  `fk_Menu` INT NULL,
  `fk_item` INT NULL,
  `item_type` ENUM('Dish') NULL DEFAULT 'Dish',
  `qty` INT DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `change_reason` ENUM('init','admin_update','order_assignment') NULL DEFAULT 'init',
  PRIMARY KEY (`pk_MenuInventoryLog`),
  INDEX `index3` (`fk_Menu` ASC));
USE `bento`;


## -------- Everything else -----------------

# Menu
ALTER TABLE `bento`.`Menu` 
ADD COLUMN `oa_avail` TINYINT(1) NULL DEFAULT 1 AFTER `fk_MealType`,
ADD COLUMN `od_avail` TINYINT(1) NULL DEFAULT 1 AFTER `oa_avail`;

ALTER TABLE `bento`.`Menu` 
CHANGE COLUMN `fk_MealType` `fk_MealType` INT(11) NULL DEFAULT '3' AFTER `updated_at`;

ALTER TABLE `bento`.`Menu` 
CHANGE COLUMN `od_avail` `od_avail` TINYINT(1) NULL DEFAULT '1' AFTER `menu_type`;

ALTER TABLE `bento`.`Menu` 
ADD COLUMN `oa_times` TEXT NULL AFTER `oa_avail`;

ALTER TABLE `bento`.`Menu` 
ADD COLUMN `fk_Kitchen` INT NULL DEFAULT 1 AFTER `fk_MealType`;
# /Menu


# MealType
ALTER TABLE `bento`.`MealType` 
ADD COLUMN `active` TINYINT NULL DEFAULT 1 AFTER `order`,
ADD COLUMN `endTime` TIME NULL AFTER `startTime`,
ADD COLUMN `oa_cutoff` TIME NULL AFTER `endTime`;

UPDATE `bento`.`MealType` SET `active`='0' WHERE `pk_MealType`='1';

ALTER TABLE `bento`.`MealType` 
ADD COLUMN `displayStartTime` TIME NULL AFTER `oa_cutoff`;

UPDATE `bento`.`MealType` SET `endTime`='15:59:59', `oa_cutoff`='10:00:00' WHERE `pk_MealType`='2';

UPDATE `bento`.`MealType` SET `startTime`='16:00:00', `endTime`='22:30:00', `oa_cutoff`='15:00:00' WHERE `pk_MealType`='3';

UPDATE `bento`.`MealType` SET `startTime`='10:45:00', `displayStartTime`='11:00:00' WHERE `pk_MealType`='2';

UPDATE `bento`.`MealType` SET `startTime`='16:45:00', `displayStartTime`='17:00:00' WHERE `pk_MealType`='3';
# /MealType

# Dish
ALTER TABLE `bento`.`Dish` 
ADD COLUMN `od_avail` TINYINT NULL DEFAULT 1 AFTER `i_notes`,
ADD COLUMN `oa_avail` TINYINT NULL DEFAULT 1 AFTER `od_avail`;




















