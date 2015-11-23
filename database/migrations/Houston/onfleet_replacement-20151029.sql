CREATE TABLE `bento`.`generic_Order` (
	`pk_generic_Order` INT NOT NULL AUTO_INCREMENT,
	`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	`deleted_at` TIMESTAMP NULL DEFAULT NULL,
	`status` ENUM('Open', 'En Route', 'Delivered', 'Cancelled', 'Rejected', 'Assigned', 'Modified') NOT NULL DEFAULT 'Open',
	`fk_Driver` INT NULL DEFAULT NULL,
	`name` VARCHAR(255) NULL DEFAULT NULL,
	`phone` VARCHAR(20) NULL DEFAULT NULL,
	`street` VARCHAR(255) NULL DEFAULT NULL,
	`city` VARCHAR(100) NULL DEFAULT NULL,
	`region` VARCHAR(100) NULL DEFAULT NULL,
	`zip_code` VARCHAR(12) NULL DEFAULT NULL,
	`country` VARCHAR(100) NULL DEFAULT NULL,
	`lat` VARCHAR(45) NULL DEFAULT NULL,
	`lng` VARCHAR(45) NULL DEFAULT NULL,
	`body` VARCHAR(5000) NULL DEFAULT NULL,
	PRIMARY KEY (`pk_generic_Order`)
);

ALTER TABLE `Driver` ADD COLUMN `status` TINYINT NOT NULL DEFAULT 0;