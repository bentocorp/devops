
# All have been run on local, dev, and prod

CREATE TABLE `bento`.`OrderItem` (
  `pk_OrderItem` INT NOT NULL AUTO_INCREMENT,
  `fk_Order` INT NULL,
  `fk_item` INT NULL,
  `item_type` ENUM('Addon','CustomerBentoBox') NULL,
  PRIMARY KEY (`pk_OrderItem`),
  UNIQUE INDEX `OrderItem` (`fk_Order` ASC, `fk_item` ASC, `item_type` ASC));


ALTER TABLE `bento`.`Dish` 
CHANGE COLUMN `type` `type` ENUM('main','side', 'addon') NULL DEFAULT NULL ;


ALTER TABLE `bento`.`OrderItem` 
ADD COLUMN `qty` TINYINT UNSIGNED NULL DEFAULT 1 AFTER `item_type`,
ADD COLUMN `unit_price_paid` DECIMAL(4,2) NULL DEFAULT NULL AFTER `qty`;


ALTER TABLE `bento`.`OrderItem` 
ADD COLUMN `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER `unit_price_paid`,
ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP AFTER `created_at`;




