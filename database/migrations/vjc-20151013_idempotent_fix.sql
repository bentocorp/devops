
ALTER TABLE `bento`.`PendingOrder` 
ADD COLUMN `idempotent_token` VARCHAR(128) NULL DEFAULT NULL AFTER `order_json`,
ADD UNIQUE INDEX `idempotent_token_UNIQUE` (`idempotent_token` ASC);

# For prod

ALTER TABLE `bento`.`PendingOrder` 
ADD COLUMN `is_processing` TINYINT(1) NULL DEFAULT 0 AFTER `idempotent_token`;

ALTER TABLE `bento`.`PendingOrder` 
CHANGE COLUMN `is_processing` `is_processing` TINYINT(1) NULL DEFAULT '1' ;


# For prod
ALTER TABLE `bento`.`PendingOrder` 
ADD UNIQUE INDEX `idempotent_token_UNIQUE` (`idempotent_token` ASC);




