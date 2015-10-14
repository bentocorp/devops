ALTER TABLE `bento`.`PendingOrder` 
ADD COLUMN `idempotent_token` VARCHAR(128) NULL DEFAULT NULL AFTER `order_json`,
ADD UNIQUE INDEX `idempotent_token_UNIQUE` (`idempotent_token` ASC);



