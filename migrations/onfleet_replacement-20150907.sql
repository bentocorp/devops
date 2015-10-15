ALTER TABLE `Driver`
ADD COLUMN `password` VARCHAR(255) NULL DEFAULT NULL,
ADD COLUMN `api_token` VARCHAR(255) NULL DEFAULT NULL,
ADD COLUMN `order_queue` VARCHAR(999) NULL DEFAULT NULL, /* 19 (digits for max long) * 50 (order IDs) + 49 (commas) = 999 */
ADD UNIQUE INDEX `api_token_UNIQUE` (`api_token` ASC);

ALTER TABLE `admin_User`
ADD COLUMN `api_token` VARCHAR(255) NULL DEFAULT NULL,
ADD UNIQUE INDEX `api_token_UNIQUE` (`api_token` ASC);

CREATE TABLE `bento`.`houston_api_User` (
  `pk_houston_api_User` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `comment` VARCHAR(255) NULL DEFAULT NULL,
  `api_token` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_houston_api_User`),
  UNIQUE INDEX `api_token_UNIQUE` (`api_token` ASC));


ALTER TABLE `OrderStatus`
CHANGE `status` `status` ENUM('Open', 'En Route', 'Delivered', 'Cancelled', 'Rejected', 'Assigned', 'Modified') NULL DEFAULT 'Open';

ALTER TABLE `OrderStatusLog`
CHANGE `status` `status` ENUM('Open', 'En Route', 'Delivered', 'Cancelled', 'Rejected', 'Assigned', 'Modified') NULL DEFAULT NULL;
