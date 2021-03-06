-- MySQL Script generated by MySQL Workbench
-- 02/26/19 16:15:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema counting_sheep
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema counting_sheep
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `counting_sheep` DEFAULT CHARACTER SET utf8 ;
USE `counting_sheep` ;

-- -----------------------------------------------------
-- Table `counting_sheep`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `counting_sheep`.`User` (
  `user_id` INT NOT NULL,
  `uname` VARCHAR(45) NOT NULL,
  `pword` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone` VARCHAR(14) NULL,
  `user_type` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `uname_UNIQUE` (`uname` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `counting_sheep`.`Request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `counting_sheep`.`Request` (
  `request_id` INT NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `category` VARCHAR(45) NULL,
  `creation_time` DATETIME NOT NULL,
  `completion_time` DATETIME NULL,
  `manager_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`request_id`),
  INDEX `manager_fk_idx` (`manager_id` ASC),
  INDEX `customer_fk_idx` (`customer_id` ASC),
  CONSTRAINT `manager_request_fk`
    FOREIGN KEY (`manager_id`)
    REFERENCES `counting_sheep`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_request_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `counting_sheep`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `counting_sheep`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `counting_sheep`.`Hotel` (
  `hotel_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `breakfast` TINYINT(1) NULL,
  `pool` TINYINT(1) NULL,
  `rating` DECIMAL NULL,
  `food_delivery` TINYINT(1) NULL,
  `manager_id` INT NOT NULL,
  PRIMARY KEY (`hotel_id`),
  INDEX `manager_fk_idx` (`manager_id` ASC),
  CONSTRAINT `manager_hotel_fk`
    FOREIGN KEY (`manager_id`)
    REFERENCES `counting_sheep`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `counting_sheep`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `counting_sheep`.`Room` (
  `room_id` INT NOT NULL,
  `number` INT NOT NULL,
  `description` VARCHAR(200) NULL,
  `price` DECIMAL NOT NULL,
  `hotel_id` INT NOT NULL,
  PRIMARY KEY (`room_id`),
  INDEX `hotel_fk_idx` (`hotel_id` ASC),
  CONSTRAINT `hotel_room_fk`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `counting_sheep`.`Hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `counting_sheep`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `counting_sheep`.`Booking` (
  `booking_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `customer_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_fk_idx` (`customer_id` ASC),
  INDEX `room_fk_idx` (`room_id` ASC),
  CONSTRAINT `customer_booking_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `counting_sheep`.`User` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `room_booking_fk`
    FOREIGN KEY (`room_id`)
    REFERENCES `counting_sheep`.`Room` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
