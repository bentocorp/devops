ALTER TABLE `OrderStatus` CHANGE `status` `status`
ENUM('Open','En Route','Delivered','Cancelled','Rejected','Assigned','Modified','Arrived') DEFAULT 'Open';

ALTER TABLE `OrderStatusLog` CHANGE `status` `status`
ENUM('Open','En Route','Delivered','Cancelled','Rejected','Assigned','Modified','Arrived') DEFAULT 'Open';
