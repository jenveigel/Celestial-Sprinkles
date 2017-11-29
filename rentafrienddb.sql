-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema rentafrienddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rentafrienddb` ;

-- -----------------------------------------------------
-- Schema rentafrienddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rentafrienddb` DEFAULT CHARACTER SET utf8 ;
USE `rentafrienddb` ;

-- -----------------------------------------------------
-- Table `rentafrienddb`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentafrienddb`.`address` ;

CREATE TABLE IF NOT EXISTS `rentafrienddb`.`address` (
  `id` INT NOT NULL,
  `address` VARCHAR(250) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentafrienddb`.`profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentafrienddb`.`profile` ;

CREATE TABLE IF NOT EXISTS `rentafrienddb`.`profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bio` VARCHAR(2000) NULL,
  `img_url` VARCHAR(500) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentafrienddb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentafrienddb`.`user` ;

CREATE TABLE IF NOT EXISTS `rentafrienddb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(60) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `profile_id` INT NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`address_id` ASC),
  INDEX `id_idx1` (`profile_id` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`address_id`)
    REFERENCES `rentafrienddb`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id`
    FOREIGN KEY (`profile_id`)
    REFERENCES `rentafrienddb`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentafrienddb`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentafrienddb`.`event` ;

CREATE TABLE IF NOT EXISTS `rentafrienddb`.`event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `activity` VARCHAR(120) NULL,
  `owner_id` INT NOT NULL,
  `time` DATETIME NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`address_id` ASC),
  INDEX `id_idx1` (`owner_id` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`address_id`)
    REFERENCES `rentafrienddb`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id`
    FOREIGN KEY (`owner_id`)
    REFERENCES `rentafrienddb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rentafrienddb`.`event_participant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rentafrienddb`.`event_participant` ;

CREATE TABLE IF NOT EXISTS `rentafrienddb`.`event_participant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`user_id` ASC),
  INDEX `id_idx1` (`event_id` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`user_id`)
    REFERENCES `rentafrienddb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id`
    FOREIGN KEY (`event_id`)
    REFERENCES `rentafrienddb`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
