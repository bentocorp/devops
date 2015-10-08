ALTER TABLE `Driver`
ADD COLUMN `password` VARCHAR(255) NULL DEFAULT NULL,
ADD COLUMN `api_token` VARCHAR(255) NULL DEFAULT NULL,
ADD COLUMN `order_queue` VARCHAR(999) NULL DEFAULT NULL; /* 19 (digits for max long) * 50 (order IDs) + 49 (commas) = 999 */

ALTER TABLE `admin_User`
ADD COLUMN `api_token` VARCHAR(255) NULL DEFAULT NULL;

ALTER TABLE `api_User`
ADD COLUMN `api_token` VARCHAR(255) NULL DEFAULT NULL;

ALTER TABLE `OrderStatus`
MODIFY COLUMN `status` ENUM('Open', 'En Route', 'Delivered', 'Cancelled', 'Rejected', 'Assigned', 'Modified') NULL DEFAULT('Open');

ALTER TABLE `OrderStatusLog`
MODIFY COLUMN `status` ENUM('Open', 'En Route', 'Delivered', 'Cancelled', 'Rejected', 'Assigned', 'Modified') NULL;
