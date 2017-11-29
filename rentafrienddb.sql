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
-- Table `profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile` ;

CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bio` VARCHAR(2000) NULL,
  `img_url` VARCHAR(500) NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(60) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `profile_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx1` (`profile_id` ASC),
  CONSTRAINT `user_profile_fk`
    FOREIGN KEY (`profile_id`)
    REFERENCES `profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(250) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` CHAR(2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `activity` VARCHAR(120) NOT NULL,
  `owner_id` INT NOT NULL,
  `time` DATETIME NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`address_id` ASC),
  INDEX `id_idx1` (`owner_id` ASC),
  CONSTRAINT `event_address_fk`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `owner_id_fk`
    FOREIGN KEY (`owner_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_participant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_participant` ;

CREATE TABLE IF NOT EXISTS `event_participant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_id` INT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`user_id` ASC),
  INDEX `id_idx1` (`event_id` ASC),
  CONSTRAINT `user_event_participant_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `event_participant_event_fk`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin@localhost;
 DROP USER admin@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT ALL ON * TO 'admin'@'localhost';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'admin'@'localhost';
GRANT SELECT, INSERT, TRIGGER ON TABLE * TO 'admin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentafrienddb`;
INSERT INTO `profile` (`id`, `bio`, `img_url`, `first_name`, `last_name`) VALUES (1, 'falcon\'s bio', NULL, 'aaron', 'ipp');
INSERT INTO `profile` (`id`, `bio`, `img_url`, `first_name`, `last_name`) VALUES (2, 'stumpe\'s bio', NULL, 'david', 'stumpe');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentafrienddb`;
INSERT INTO `user` (`id`, `user_name`, `password`, `profile_id`) VALUES (1, 'falcon', 'falcon', 1);
INSERT INTO `user` (`id`, `user_name`, `password`, `profile_id`) VALUES (2, 'dstumpe', 'dstumpe', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentafrienddb`;
INSERT INTO `address` (`id`, `address`, `city`, `state`) VALUES (1, '123 main street', 'Orlando', 'FL');
INSERT INTO `address` (`id`, `address`, `city`, `state`) VALUES (2, '321 niam street', 'Denver', 'CO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentafrienddb`;
INSERT INTO `event` (`id`, `activity`, `owner_id`, `time`, `address_id`) VALUES (1, 'Going to the Movies', 1, '2016-01-15 12:30:00', 1);
INSERT INTO `event` (`id`, `activity`, `owner_id`, `time`, `address_id`) VALUES (2, 'Football Game', 2, '2017-12-1 16:30:00', 2);

COMMIT;
