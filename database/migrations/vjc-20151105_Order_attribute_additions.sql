
## All have been run on local, dev, & prod

ALTER TABLE `bento`.`CustomerBentoBox` 
ADD COLUMN `unit_price_paid` DECIMAL(4,2) NULL DEFAULT NULL AFTER `fk_side4`;


ALTER TABLE `bento`.`Order` 
CHANGE COLUMN `pre_coupon_total` `subtotal` DECIMAL(7,2) NULL DEFAULT NULL AFTER `tax`;

ALTER TABLE `bento`.`Order` 
ADD COLUMN `items_total` DECIMAL(7,2) NULL DEFAULT NULL AFTER `updated_at`,
ADD COLUMN `delivery_price` DECIMAL(4,2) NULL DEFAULT NULL AFTER `items_total`,
ADD COLUMN `coupon_discount_cents` VARCHAR(45) NULL DEFAULT 0 AFTER `delivery_price`,
ADD COLUMN `tax_percentage` TINYINT(2) NULL DEFAULT NULL AFTER `coupon_discount`,
ADD COLUMN `tax_cents` INT(10) NULL DEFAULT NULL AFTER `tax_percentage`,
ADD COLUMN `tip_percentage` TINYINT(2) NULL DEFAULT NULL AFTER `subtotal`,
ADD COLUMN `tip_cents` INT(10) NULL DEFAULT NULL AFTER `tip_percentage`,
ADD COLUMN `total_cents` INT(10) NULL DEFAULT NULL COMMENT 'The FINAL amount that we send to stripe.' AFTER `tip`,
ADD COLUMN `total_cents_without_coupon` INT(10) NULL DEFAULT NULL AFTER `amount`;

ALTER TABLE `bento`.`Order` 
CHANGE COLUMN `amount` `amount` DECIMAL(7,2) NULL DEFAULT NULL COMMENT 'A conversion of total_cents.' AFTER `total_cents`,
CHANGE COLUMN `notes_for_driver` `notes_for_driver` TEXT NULL DEFAULT NULL AFTER `fk_PendingOrder`,
CHANGE COLUMN `coupon_discount` `coupon_discount` DECIMAL(7,2) NULL DEFAULT '0.00' COMMENT 'A transfrom from coupon_discount_cents' ,
CHANGE COLUMN `tip` `tip` DECIMAL(7,2) NULL DEFAULT NULL COMMENT 'A conversion from tip_cents.';

ALTER TABLE `bento`.`Order` 
CHANGE COLUMN `total_cents_without_coupon` `total_cents_without_coupon` INT(10) NULL DEFAULT NULL COMMENT 'What the total would have been, without the coupon.' AFTER `amount`;

ALTER TABLE `bento`.`Order` 
CHANGE COLUMN `tax` `tax` DECIMAL(7,2) NULL DEFAULT NULL COMMENT 'A transform from tax_cents.' ;








