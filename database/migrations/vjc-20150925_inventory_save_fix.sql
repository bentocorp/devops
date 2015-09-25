ALTER TABLE `bento`.`DriverInventory` 
ADD UNIQUE INDEX `uq_item` (`fk_Driver` ASC, `fk_item` ASC, `item_type` ASC);

ALTER TABLE `bento`.`LiveInventory` 
CHANGE COLUMN `qty` `qty` SMALLINT(6) UNSIGNED NULL DEFAULT 0 ;





