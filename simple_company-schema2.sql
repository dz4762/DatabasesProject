SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema simple_company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `simple_company` DEFAULT CHARACTER SET utf8 ;
USE `simple_company` ;

-- -----------------------------------------------------
-- Table `simple_company`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simple_company`.`customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(15) NOT NULL,
  `lastName` VARCHAR(15) NOT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL, 
  `dob` DATE NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `simple_company`.`address` (
  `address1` VARCHAR(50) NULL DEFAULT NULL,
  `address2` VARCHAR(50) NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state` VARCHAR(50) NULL DEFAULT NULL,
  `zipcode` VARCHAR(50) NULL DEFAULT NULL,
  `customerID` int NOT NULL,
  CONSTRAINT `address_ibfk_1`
    FOREIGN KEY (`customerID`)
    REFERENCES `simple_company`.`customer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `simple_company`.`creditcard` (
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `ccNumber` VARCHAR(50) NULL DEFAULT NULL,
  `expDate` VARCHAR(50) NULL DEFAULT NULL,
  `securityCode` VARCHAR(50) NULL DEFAULT NULL,
  `customerID` int NOT NULL,
  CONSTRAINT `creditcard_ibfk_1`
    FOREIGN KEY (`customerID`)
    REFERENCES `simple_company`.`customer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `simple_company`.`purchase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simple_company`.`purchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productID` int NOT NULL,
  `customerID` int NOT NULL,
  `purchaseDate` DATE NULL DEFAULT NULL,
  `purchaseAmount` decimal NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `purchase_ibfk_1`
    FOREIGN KEY (`customerID`)
    REFERENCES `simple_company`.`customer` (`id`) 
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_2`
    FOREIGN KEY (`productID`)
    REFERENCES `simple_company`.`product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `simple_company`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simple_company`.`product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prodName` VARCHAR(50) NOT NULL,
  `prodDescription` VARCHAR(50) NULL DEFAULT NULL,
  `prodCategory` int NOT NULL,
  `prodUPC` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;