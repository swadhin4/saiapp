-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.37-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for saiapp_db
DROP DATABASE IF EXISTS `saiapp_db`;
CREATE DATABASE IF NOT EXISTS `saiapp_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `saiapp_db`;

-- Dumping structure for table saiapp_db.address
DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zipcode` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.address: ~10 rows (approximately)
DELETE FROM `address`;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`address_id`, `address_line1`, `address_line2`, `city`, `zipcode`, `state`, `created_at`, `version`) VALUES
	(203, 'Lingaraj Vihar', 'Pokhariput', NULL, '423423', NULL, '2017-03-30 18:10:19', 1),
	(216, 'fsdfsdfsdf', 'fsdfsfs', NULL, NULL, NULL, '2017-03-31 10:15:15', 0),
	(217, 'dasfsd', 'vsd', NULL, '312312', NULL, '2017-03-31 10:18:05', 0),
	(218, 'dasda', 'dasda', NULL, '423543', NULL, '2017-03-31 19:41:40', 0),
	(255, 'Pokhariput', 'BBSR', NULL, '751020', NULL, '2017-05-11 18:21:11', 0),
	(257, 'dasd', 'das', NULL, NULL, NULL, '2017-05-16 16:53:13', 1),
	(258, 'yyruuytuytu', 'dasd', NULL, NULL, NULL, '2017-05-16 14:55:20', 0),
	(259, 'fsdf', 'fsdfs', NULL, NULL, NULL, '2017-05-16 15:39:05', 0),
	(260, 'gdgf', 'gdfgd', NULL, NULL, NULL, '2017-05-16 15:55:34', 0),
	(261, 'qeqweqewqeqwe', 'eqweqwqwe', NULL, NULL, NULL, '2017-05-16 16:53:28', 0);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.agent
DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `agent_type` varchar(45) DEFAULT NULL,
  `del_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`agent_id`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `agent_address_fk_idx` (`address_id`),
  CONSTRAINT `agent_address_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.agent: ~1 rows (approximately)
DELETE FROM `agent`;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` (`agent_id`, `name`, `mobile`, `enabled`, `created_at`, `address_id`, `version`, `agent_type`, `del_flag`) VALUES
	(19, 'Tushar Das', '0987654321', NULL, '2017-05-11 18:21:11', 255, 0, 'ARCHITECT', 0);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.application_users
DROP TABLE IF EXISTS `application_users`;
CREATE TABLE IF NOT EXISTS `application_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  `password_changed` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_uq_cons` (`username`),
  UNIQUE KEY `idx_application_users` (`employee_id`),
  CONSTRAINT `fk_application_users_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.application_users: ~1 rows (approximately)
DELETE FROM `application_users`;
/*!40000 ALTER TABLE `application_users` DISABLE KEYS */;
INSERT INTO `application_users` (`user_id`, `username`, `password`, `enabled`, `created_by`, `created_at`, `version`, `password_changed`, `employee_id`) VALUES
	(9, 'admin', 'admin', 1, 1, '2017-04-02 01:43:28', 0, NULL, 24);
/*!40000 ALTER TABLE `application_users` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.bank_accounts
DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `bank_accounts_id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `account_number` bigint(16) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `ifsc_code` varchar(10) NOT NULL,
  `balance` bigint(20) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(10) NOT NULL,
  `version` int(3) DEFAULT NULL,
  PRIMARY KEY (`bank_accounts_id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `FK_bank_accounts_createdBy_users` (`created_by`),
  KEY `FK_bank_accounts_ModifiedBy_users` (`modified_by`),
  CONSTRAINT `FK_bank_accounts_ModifiedBy_users` FOREIGN KEY (`modified_by`) REFERENCES `application_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bank_accounts_createdBy_users` FOREIGN KEY (`created_by`) REFERENCES `application_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.bank_accounts: ~2 rows (approximately)
DELETE FROM `bank_accounts`;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
INSERT INTO `bank_accounts` (`bank_accounts_id`, `bank_name`, `account_number`, `account_name`, `address`, `ifsc_code`, `balance`, `created_at`, `created_by`, `modified_at`, `modified_by`, `version`) VALUES
	(1, 'Bank of Baroda', 24280500004332, 'Sai Plywood', 'Samantarapur', 'BOB2345', 9954, '2017-06-07 13:47:24', 9, '2017-06-07 13:47:24', 9, 3),
	(3, 'Bank of Baroda', 24280500004333, 'Sai Plywood', 'Samantarapur', 'BOB2345', 0, '2017-06-07 13:47:24', 9, '2017-06-07 13:47:24', 9, 0);
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.bank_credits
DROP TABLE IF EXISTS `bank_credits`;
CREATE TABLE IF NOT EXISTS `bank_credits` (
  `bank_credit_id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `account_number` bigint(16) NOT NULL,
  `deposit_date` datetime DEFAULT NULL,
  `clearance_date` datetime DEFAULT NULL,
  `credit_reason` varchar(500) DEFAULT NULL,
  `payment_details_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `modified_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `version` int(3) DEFAULT NULL,
  PRIMARY KEY (`bank_credit_id`),
  KEY `FK_bank_deposits_payment_details_id` (`payment_details_id`),
  KEY `FK_bank_deposits_createdBy_users` (`created_by`),
  KEY `FK_bank_deposits_ModifiedBy_users` (`modified_by`),
  CONSTRAINT `FK_bank_deposits_ModifiedBy_users` FOREIGN KEY (`modified_by`) REFERENCES `application_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bank_deposits_createdBy_users` FOREIGN KEY (`created_by`) REFERENCES `application_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bank_deposits_payment_details_id` FOREIGN KEY (`payment_details_id`) REFERENCES `order_payment_details` (`payment_details_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.bank_credits: ~1 rows (approximately)
DELETE FROM `bank_credits`;
/*!40000 ALTER TABLE `bank_credits` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_credits` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.bank_debits
DROP TABLE IF EXISTS `bank_debits`;
CREATE TABLE IF NOT EXISTS `bank_debits` (
  `bank_debit_id` int(10) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) NOT NULL,
  `account_number` bigint(16) NOT NULL,
  `debit_date` datetime DEFAULT NULL,
  `debit_reason` varchar(500) NOT NULL,
  `payment_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int(10) NOT NULL,
  `version` int(3) DEFAULT NULL,
  PRIMARY KEY (`bank_debit_id`),
  KEY `FK_bank_debits_payment_id` (`payment_id`),
  KEY `FK_bank_debits_createdBy_users` (`created_by`),
  KEY `FK_bank_debits_ModifiedBy_users` (`modified_by`),
  CONSTRAINT `FK_bank_debits_ModifiedBy_users` FOREIGN KEY (`modified_by`) REFERENCES `application_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bank_debits_createdBy_users` FOREIGN KEY (`created_by`) REFERENCES `application_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_bank_debits_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `vendor_payment_details` (`payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.bank_debits: ~0 rows (approximately)
DELETE FROM `bank_debits`;
/*!40000 ALTER TABLE `bank_debits` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_debits` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.challan
DROP TABLE IF EXISTS `challan`;
CREATE TABLE IF NOT EXISTS `challan` (
  `challan_id` int(11) NOT NULL AUTO_INCREMENT,
  `challan_number` varchar(45) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`challan_id`),
  KEY `FK_challan_order_booking` (`order_id`),
  CONSTRAINT `FK_challan_order_booking` FOREIGN KEY (`order_id`) REFERENCES `order_booking` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.challan: ~0 rows (approximately)
DELETE FROM `challan`;
/*!40000 ALTER TABLE `challan` DISABLE KEYS */;
/*!40000 ALTER TABLE `challan` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.customer
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `customer_type` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_id` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `mobile_UNIQUE` (`mobile`),
  KEY `customer_address_fk_idx` (`address_id`),
  CONSTRAINT `customer_address_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.customer: ~0 rows (approximately)
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `customer_type`, `created_at`, `address_id`, `email`, `mobile`, `phone`, `version`) VALUES
	(1, 'dasda', 'dasd', NULL, '2017-05-16 16:52:55', 257, NULL, '3123122313', NULL, 1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.designation
DROP TABLE IF EXISTS `designation`;
CREATE TABLE IF NOT EXISTS `designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.designation: ~0 rows (approximately)
DELETE FROM `designation`;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `id_proof` varchar(100) DEFAULT NULL,
  `id_type` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `del_flag` int(11) DEFAULT '0',
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `id_proof_UNIQUE` (`id_proof`),
  KEY `FK_employee` (`address_id`),
  KEY `idx_user_id` (`first_name`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.employee: ~1 rows (approximately)
DELETE FROM `employee`;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`, `first_name`, `middle_name`, `last_name`, `address_id`, `id_proof`, `id_type`, `email`, `created_at`, `mobile`, `phone`, `del_flag`, `version`) VALUES
	(24, 'Swadhin', 'Kumar', 'Mohanta', 203, 'BBWER6G', 'Pan Card', 'swadhin4@gmail.com', '2017-03-30 18:08:55', '9583291103', NULL, 0, 0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.grades
DROP TABLE IF EXISTS `grades`;
CREATE TABLE IF NOT EXISTS `grades` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(100) DEFAULT NULL,
  `thickness` decimal(10,2) DEFAULT NULL,
  `thickness_unit` varchar(45) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `size_unit` varchar(10) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `unit_sqmtr_piece` decimal(10,2) DEFAULT NULL,
  `vat` decimal(5,2) DEFAULT NULL,
  `cgst` decimal(5,2) DEFAULT NULL,
  `igst` decimal(5,2) DEFAULT NULL,
  `sgst` decimal(5,2) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `FK_grades_vendor` (`vendor_id`),
  KEY `FK_grades_product_idx` (`product_id`),
  CONSTRAINT `FK_grades_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_grades_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.grades: ~3 rows (approximately)
DELETE FROM `grades`;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` (`grade_id`, `grade_name`, `thickness`, `thickness_unit`, `length`, `width`, `size_unit`, `price`, `unit_sqmtr_piece`, `vat`, `cgst`, `igst`, `sgst`, `vendor_id`, `created_at`, `version`, `product_id`, `description`) VALUES
	(1, NULL, NULL, NULL, 10.00, 8.00, NULL, 100.00, 2.00, 4.00, NULL, NULL, NULL, 1, '2017-03-31 10:16:42', 4, 22, '19 MM PLY Century Club Plus 10 X 8'),
	(2, '', NULL, '', 9.00, 8.00, 'MTR', 200.00, 2.00, 5.00, NULL, NULL, NULL, 1, '2017-04-03 19:59:45', 0, 22, '10MM Ply Century Club Plus 9 X 8'),
	(4, NULL, NULL, NULL, 9.00, 8.00, NULL, 500.00, 2.00, 5.00, NULL, NULL, NULL, 1, '2017-04-03 21:39:03', 3, 22, '24MM Ply Century Club Plus 9 X 8'),
	(5, NULL, NULL, NULL, NULL, NULL, NULL, 400.00, NULL, 4.00, NULL, NULL, NULL, 1, '2017-09-14 02:08:39', 5, 22, 'Test');
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.grades_backup
DROP TABLE IF EXISTS `grades_backup`;
CREATE TABLE IF NOT EXISTS `grades_backup` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(100) DEFAULT NULL,
  `thickness` decimal(10,2) DEFAULT NULL,
  `thickness_unit` varchar(45) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `size_unit` varchar(10) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `vat` decimal(5,2) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `FK_grades_vendor` (`vendor_id`),
  KEY `FK_grades_product_idx` (`product_id`),
  CONSTRAINT `grades_backup_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `grades_backup_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table saiapp_db.grades_backup: ~0 rows (approximately)
DELETE FROM `grades_backup`;
/*!40000 ALTER TABLE `grades_backup` DISABLE KEYS */;
INSERT INTO `grades_backup` (`grade_id`, `grade_name`, `thickness`, `thickness_unit`, `length`, `width`, `size_unit`, `price`, `vat`, `vendor_id`, `created_at`, `version`, `product_id`, `description`) VALUES
	(1, NULL, NULL, NULL, 10.00, 8.00, 'MTR', 100.00, 5.00, 1, '2017-03-31 10:16:42', 1, 22, 'fdsf');
/*!40000 ALTER TABLE `grades_backup` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.hardware
DROP TABLE IF EXISTS `hardware`;
CREATE TABLE IF NOT EXISTS `hardware` (
  `hardware_stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `total_units` int(11) DEFAULT NULL,
  `unit_type` varchar(50) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`hardware_stock_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.hardware: ~2 rows (approximately)
DELETE FROM `hardware`;
/*!40000 ALTER TABLE `hardware` DISABLE KEYS */;
INSERT INTO `hardware` (`hardware_stock_id`, `description`, `unit_price`, `cost_price`, `total_units`, `unit_type`, `vat`, `created_at`, `version`) VALUES
	(1, 'ADHESIVE FEVICOL MARINE 50KG', 8558.95, NULL, 10, 'Pieces', 14.50, '2017-04-04 19:44:59', 15),
	(2, 'FEVICOL HEATX 2 LTRS', 698.68, NULL, 17, 'Litre', 14.50, '2017-04-04 19:46:15', 8);
/*!40000 ALTER TABLE `hardware` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.invoice
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(50) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `invoice_type` varchar(50) DEFAULT NULL,
  `invoice_status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `FK_invoice_order_booking` (`order_id`),
  CONSTRAINT `FK_invoice_order_booking` FOREIGN KEY (`order_id`) REFERENCES `order_booking` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.invoice: ~1 rows (approximately)
DELETE FROM `invoice`;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.order_booking
DROP TABLE IF EXISTS `order_booking`;
CREATE TABLE IF NOT EXISTS `order_booking` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_address_id` int(11) DEFAULT NULL,
  `order_amount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_at` datetime DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `collection_agent` int(11) DEFAULT NULL,
  `order_agent` int(11) DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `order_cust_fk_idx` (`customer_id`),
  KEY `order_address_fk_idx` (`order_address_id`),
  KEY `FK_order_agent` (`order_agent`),
  KEY `FK_order_employee` (`collection_agent`),
  KEY `FK_order_user` (`last_modified_by`),
  KEY `FK_order_user_created_by` (`created_by`),
  CONSTRAINT `FK_order_address` FOREIGN KEY (`order_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_agent` FOREIGN KEY (`order_agent`) REFERENCES `agent` (`agent_id`),
  CONSTRAINT `FK_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_employee` FOREIGN KEY (`collection_agent`) REFERENCES `application_users` (`user_id`),
  CONSTRAINT `FK_order_user` FOREIGN KEY (`last_modified_by`) REFERENCES `application_users` (`user_id`),
  CONSTRAINT `FK_order_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `application_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.order_booking: ~0 rows (approximately)
DELETE FROM `order_booking`;
/*!40000 ALTER TABLE `order_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_booking` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.order_item
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_id` int(11) DEFAULT NULL,
  `hardware_stock_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_id` int(11) DEFAULT NULL,
  `total_square_meter` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_order_items_order` (`order_id`),
  KEY `FK_order_item_grade` (`grade_id`),
  KEY `FK_order_item_hardware` (`hardware_stock_id`),
  CONSTRAINT `FK_order_item_grade` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  CONSTRAINT `FK_order_item_hardware` FOREIGN KEY (`hardware_stock_id`) REFERENCES `hardware` (`hardware_stock_id`),
  CONSTRAINT `FK_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `order_booking` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.order_item: ~0 rows (approximately)
DELETE FROM `order_item`;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.order_item_warehouse_breakup
DROP TABLE IF EXISTS `order_item_warehouse_breakup`;
CREATE TABLE IF NOT EXISTS `order_item_warehouse_breakup` (
  `warehouse_breakup_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`warehouse_breakup_id`),
  KEY `warehouse_breakup_fk_idx` (`warehouse_id`),
  KEY `item_breakup_fk_idx` (`item_id`),
  CONSTRAINT `item_breakup_fk` FOREIGN KEY (`item_id`) REFERENCES `order_item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `warehouse_breakup_fk` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.order_item_warehouse_breakup: ~0 rows (approximately)
DELETE FROM `order_item_warehouse_breakup`;
/*!40000 ALTER TABLE `order_item_warehouse_breakup` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item_warehouse_breakup` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.order_payment_details
DROP TABLE IF EXISTS `order_payment_details`;
CREATE TABLE IF NOT EXISTS `order_payment_details` (
  `payment_details_Id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `cheque_draft_no` varchar(20) DEFAULT NULL,
  `cheque_draft_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `next_pmt_due_date` date DEFAULT NULL,
  `receipt` varchar(50) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`payment_details_Id`),
  KEY `Order_PMT_OrderId_FK_idx` (`order_id`),
  CONSTRAINT `Order_PMT_OrderId_FK` FOREIGN KEY (`order_id`) REFERENCES `order_booking` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Payment details of orders';

-- Dumping data for table saiapp_db.order_payment_details: ~0 rows (approximately)
DELETE FROM `order_payment_details`;
/*!40000 ALTER TABLE `order_payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment_details` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  `product_code` varchar(100) DEFAULT NULL,
  `del_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.product: ~3 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`product_id`, `product_name`, `created_at`, `version`, `product_code`, `del_flag`) VALUES
	(22, 'Plywood', '2017-03-30 21:11:41', 5, NULL, 0),
	(27, 'Laminates1', '2017-03-31 00:34:15', 1, NULL, 0),
	(28, 'Hardware', '2017-04-04 19:42:57', 0, NULL, 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.product_grade_stock
DROP TABLE IF EXISTS `product_grade_stock`;
CREATE TABLE IF NOT EXISTS `product_grade_stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `FK_product_stock` (`grade_id`),
  KEY `FK_product_stock_warehouse` (`warehouse_id`),
  CONSTRAINT `FK_product_stock_grade` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_product_stock_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.product_grade_stock: ~4 rows (approximately)
DELETE FROM `product_grade_stock`;
/*!40000 ALTER TABLE `product_grade_stock` DISABLE KEYS */;
INSERT INTO `product_grade_stock` (`stock_id`, `grade_id`, `quantity`, `warehouse_id`, `created_at`, `version`) VALUES
	(17, 1, 171, 1, '2017-05-11 19:22:59', 21),
	(18, 1, 170, 2, '2017-05-11 19:22:59', 23),
	(19, 2, 200, 1, '2017-09-14 00:06:05', 0),
	(20, 2, 100, 2, '2017-09-14 00:06:06', 0);
/*!40000 ALTER TABLE `product_grade_stock` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.purchase_order
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE IF NOT EXISTS `purchase_order` (
  `purchase_order_id` int(10) NOT NULL AUTO_INCREMENT,
  `purchase_order_number` varchar(20) DEFAULT NULL,
  `purchase_invoice_number` varchar(20) DEFAULT NULL,
  `vendor_id` int(10) DEFAULT NULL,
  `purchase_order_amount` decimal(10,2) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `is_stock_entry` int(11) DEFAULT '0',
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` int(10) DEFAULT NULL,
  `last_updated_at` datetime DEFAULT NULL,
  `version` int(3) DEFAULT NULL,
  PRIMARY KEY (`purchase_order_id`),
  UNIQUE KEY `purchage_order_number_unique` (`purchase_order_number`),
  UNIQUE KEY `purchase_invoice_number` (`purchase_invoice_number`),
  KEY `FK_purchage_order_vendor` (`vendor_id`),
  KEY `FK_purchage_order_user_modified_by` (`last_modified_by`),
  KEY `FK_purchage_order_user_created_by` (`created_by`),
  CONSTRAINT `FK_purchage_order_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `application_users` (`user_id`),
  CONSTRAINT `FK_purchage_order_user_modified_by` FOREIGN KEY (`last_modified_by`) REFERENCES `application_users` (`user_id`),
  CONSTRAINT `FK_purchage_order_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.purchase_order: ~1 rows (approximately)
DELETE FROM `purchase_order`;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` (`purchase_order_id`, `purchase_order_number`, `purchase_invoice_number`, `vendor_id`, `purchase_order_amount`, `order_status`, `payment_status`, `is_stock_entry`, `created_by`, `created_at`, `last_modified_by`, `last_updated_at`, `version`) VALUES
	(3, 'dasdda', 'dasd', 1, 1.00, 'RECEIVED', 'PENDING', 1, 9, '2017-09-14 12:33:16', 9, '2017-09-14 12:34:15', 1);
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.purchase_order_image
DROP TABLE IF EXISTS `purchase_order_image`;
CREATE TABLE IF NOT EXISTS `purchase_order_image` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` blob,
  `purchase_order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `FK_purchase_order_image_purchase_order` (`purchase_order_id`),
  CONSTRAINT `FK_purchase_order_image_purchase_order` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`purchase_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.purchase_order_image: ~1 rows (approximately)
DELETE FROM `purchase_order_image`;
/*!40000 ALTER TABLE `purchase_order_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_image` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.purchase_order_item
DROP TABLE IF EXISTS `purchase_order_item`;
CREATE TABLE IF NOT EXISTS `purchase_order_item` (
  `purchase_item_id` int(10) NOT NULL AUTO_INCREMENT,
  `grade_id` int(10) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `total_sq_mtr` decimal(10,3) DEFAULT NULL,
  `hardware_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `unit_cost_price` decimal(10,2) DEFAULT NULL,
  `total_cost_price` decimal(10,2) DEFAULT NULL,
  `is_stock_entered` int(11) DEFAULT '0',
  `purchase_order_id` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` int(10) DEFAULT NULL,
  `last_updated_at` datetime DEFAULT NULL,
  `version` int(3) DEFAULT NULL,
  PRIMARY KEY (`purchase_item_id`),
  KEY `FK_purchage_items_grade` (`grade_id`),
  KEY `FK_order_items_hardware` (`hardware_id`),
  KEY `FK_purchage_items_order` (`purchase_order_id`),
  KEY `FK_purchage_items_user_modified_by` (`last_modified_by`),
  KEY `FK_purchage_items_user_created_by` (`created_by`),
  KEY `FK_purchase_order_item_product` (`product_id`),
  CONSTRAINT `FK_order_items_hardware` FOREIGN KEY (`hardware_id`) REFERENCES `hardware` (`hardware_stock_id`),
  CONSTRAINT `FK_purchage_items_grade` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  CONSTRAINT `FK_purchage_items_order` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`purchase_order_id`),
  CONSTRAINT `FK_purchage_items_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `application_users` (`user_id`),
  CONSTRAINT `FK_purchage_items_user_modified_by` FOREIGN KEY (`last_modified_by`) REFERENCES `application_users` (`user_id`),
  CONSTRAINT `FK_purchase_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.purchase_order_item: ~1 rows (approximately)
DELETE FROM `purchase_order_item`;
/*!40000 ALTER TABLE `purchase_order_item` DISABLE KEYS */;
INSERT INTO `purchase_order_item` (`purchase_item_id`, `grade_id`, `description`, `total_sq_mtr`, `hardware_id`, `product_id`, `quantity`, `unit_cost_price`, `total_cost_price`, `is_stock_entered`, `purchase_order_id`, `created_by`, `created_at`, `last_modified_by`, `last_updated_at`, `version`) VALUES
	(1, 1, '19 MM PLY Century Club Plus 10 X 8', 1.000, NULL, 22, 1, 1.00, 1.00, 1, 3, 9, '2017-09-14 12:33:16', 9, NULL, 1);
/*!40000 ALTER TABLE `purchase_order_item` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.role: ~3 rows (approximately)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`, `role_name`, `description`, `version`) VALUES
	(1, 'ROLE_ADMIN', 'Admin', 0),
	(2, 'STOCK_MANAGER', 'Stock Manager', 0),
	(3, 'COLLECTION_MANAGER', 'Collection Manager', 0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.total_grade_stock
DROP TABLE IF EXISTS `total_grade_stock`;
CREATE TABLE IF NOT EXISTS `total_grade_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_id` int(11) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `grade_total_fk_idx` (`grade_id`),
  CONSTRAINT `grade_total_fk` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.total_grade_stock: ~0 rows (approximately)
DELETE FROM `total_grade_stock`;
/*!40000 ALTER TABLE `total_grade_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `total_grade_stock` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.trader_account
DROP TABLE IF EXISTS `trader_account`;
CREATE TABLE IF NOT EXISTS `trader_account` (
  `trader_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` bigint(20) DEFAULT NULL,
  `amount_balance` bigint(20) DEFAULT NULL,
  `bank_address` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trader_account_id`),
  UNIQUE KEY `account_number` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.trader_account: ~4 rows (approximately)
DELETE FROM `trader_account`;
/*!40000 ALTER TABLE `trader_account` DISABLE KEYS */;
INSERT INTO `trader_account` (`trader_account_id`, `bank_name`, `account_number`, `amount_balance`, `bank_address`, `ifsc_code`) VALUES
	(1, 'Bank of Baroda', 24280500004332, NULL, 'Samantarapur', 'BARB0SABHUB'),
	(4, 'Bank of Baroda', 24280500004331, NULL, 'Samantarapur', 'BARB0SABHUB'),
	(5, 'Bank of India', 12345678902345, NULL, 'Samantarapur', 'BOB0SABHUB'),
	(6, 'Bank of India', 18899978902345, NULL, 'Samantarapur', 'BOB0SABHUB');
/*!40000 ALTER TABLE `trader_account` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_ibfk_1` (`role_id`),
  KEY `user_role_ibfk_2` (`user_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `application_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.user_role: ~1 rows (approximately)
DELETE FROM `user_role`;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`id`, `user_id`, `role_id`) VALUES
	(32, 9, 1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.vendor
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE IF NOT EXISTS `vendor` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `contact_person` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `del_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`vendor_id`),
  UNIQUE KEY `name_phone` (`name`,`phone`),
  KEY `FK_vendor_address` (`address_id`),
  CONSTRAINT `FK_vendor_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.vendor: ~0 rows (approximately)
DELETE FROM `vendor`;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` (`vendor_id`, `name`, `address_id`, `enabled`, `created_at`, `created_by`, `version`, `contact_person`, `phone`, `mobile`, `del_flag`) VALUES
	(1, 'Century', 216, NULL, '2017-03-31 10:15:21', 0, 2, 'Test', '5345345345', '3424234234', 0);
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.vendor_bank_details
DROP TABLE IF EXISTS `vendor_bank_details`;
CREATE TABLE IF NOT EXISTS `vendor_bank_details` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `account_number` bigint(20) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`bank_id`),
  KEY `FK_vendor_bank_details_vendor` (`vendor_id`),
  CONSTRAINT `FK_vendor_bank_details_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.vendor_bank_details: ~0 rows (approximately)
DELETE FROM `vendor_bank_details`;
/*!40000 ALTER TABLE `vendor_bank_details` DISABLE KEYS */;
INSERT INTO `vendor_bank_details` (`bank_id`, `bank_name`, `account_name`, `account_number`, `ifsc_code`, `branch`, `address`, `vendor_id`, `version`) VALUES
	(4, 'ICIC', 'dfsf', 3213, 'fsdfsdf', 'fsd', 'fsdfsf', 1, 0);
/*!40000 ALTER TABLE `vendor_bank_details` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.vendor_payment_details
DROP TABLE IF EXISTS `vendor_payment_details`;
CREATE TABLE IF NOT EXISTS `vendor_payment_details` (
  `payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `cheque_draft_no` varchar(20) DEFAULT NULL,
  `cheque_draft_date` datetime DEFAULT NULL,
  `deposit_date` datetime DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `vendor_bank_name` varchar(100) DEFAULT NULL,
  `vendor_account_number` bigint(16) NOT NULL,
  `transanction_no` varchar(20) DEFAULT NULL,
  `receipt_no` varchar(20) DEFAULT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `next_pmt_due_date` datetime DEFAULT NULL,
  `purchage_order_id` int(11) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` int(10) DEFAULT NULL,
  `last_updated_at` datetime DEFAULT NULL,
  `version` int(3) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `Order_PMT_purchage_OrderId_FK` (`purchage_order_id`),
  KEY `FK_vendor_payment_user_modified_by` (`last_modified_by`),
  KEY `FK_vendor_payment_user_created_by` (`created_by`),
  CONSTRAINT `FK_vendor_payment_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `application_users` (`user_id`),
  CONSTRAINT `FK_vendor_payment_user_modified_by` FOREIGN KEY (`last_modified_by`) REFERENCES `application_users` (`user_id`),
  CONSTRAINT `Order_PMT_purchage_OrderId_FK` FOREIGN KEY (`purchage_order_id`) REFERENCES `purchase_order` (`purchase_order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.vendor_payment_details: ~0 rows (approximately)
DELETE FROM `vendor_payment_details`;
/*!40000 ALTER TABLE `vendor_payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_payment_details` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.vendor_product
DROP TABLE IF EXISTS `vendor_product`;
CREATE TABLE IF NOT EXISTS `vendor_product` (
  `product_id` int(11) NOT NULL,
  `VENDOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`VENDOR_ID`),
  KEY `VENDOR_FK_idx` (`VENDOR_ID`),
  CONSTRAINT `BU_FK` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VENDOR_FK` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor` (`vendor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.vendor_product: ~0 rows (approximately)
DELETE FROM `vendor_product`;
/*!40000 ALTER TABLE `vendor_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_product` ENABLE KEYS */;

-- Dumping structure for table saiapp_db.warehouse
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `warehouse_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `incharge_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `del_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`warehouse_id`),
  KEY `FK_warehouse` (`address_id`),
  KEY `FK_warehouse_employee` (`incharge_id`),
  CONSTRAINT `FK_warehouse` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_warehouse_employee` FOREIGN KEY (`incharge_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table saiapp_db.warehouse: ~2 rows (approximately)
DELETE FROM `warehouse`;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` (`warehouse_id`, `warehouse_name`, `address_id`, `incharge_id`, `created_at`, `version`, `capacity`, `del_flag`) VALUES
	(1, 'W1', 217, 24, '2017-03-31 10:18:05', 0, 1000, 0),
	(2, 'W2', 218, 24, '2017-03-31 19:41:40', 0, 200, 0);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
