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
  `facebook_url` VARCHAR(500) NULL,
  `linkedin_url` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(60) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `profile_id` INT NULL,
  `avg_user_rating` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx1` (`profile_id` ASC),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC),
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
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `address_id` INT NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `activity` VARCHAR(120) NOT NULL,
  `time` DATETIME NOT NULL,
  `owner_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`address_id` ASC),
  INDEX `id_idx1` (`owner_id` ASC),
  CONSTRAINT `event_address_fk`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `owner_event_fk`
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
  `user_id` INT UNSIGNED NOT NULL,
  `event_id` INT UNSIGNED NOT NULL,
  INDEX `event_participant_event_fk_idx` (`event_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `user_event_participant_user_fk`
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


-- -----------------------------------------------------
-- Table `reviews`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reviews` ;

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `review` VARCHAR(1000) NULL,
  `rating` INT(5) NULL,
  `reviewer_id` INT UNSIGNED NULL,
  `reviewee_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `reviews_user_fk_idx` (`reviewee_id` ASC),
  INDEX `reviewer_user_fk_idx` (`reviewer_id` ASC),
  CONSTRAINT `reviews_user_fk`
    FOREIGN KEY (`reviewee_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `reviewer_user_fk`
    FOREIGN KEY (`reviewer_id`)
    REFERENCES `user` (`id`)
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
INSERT INTO `profile` (`id`, `bio`, `img_url`, `first_name`, `last_name`, `facebook_url`, `linkedin_url`) VALUES (1, 'aaron\'s bio', NULL, 'aaron', 'ipp', NULL, 'https://www.linkedin.com/in/aaron-ipp-51550ab/');
INSERT INTO `profile` (`id`, `bio`, `img_url`, `first_name`, `last_name`, `facebook_url`, `linkedin_url`) VALUES (2, 'stumpe\'s bio', NULL, 'david', 'stumpe', NULL, NULL);
INSERT INTO `profile` (`id`, `bio`, `img_url`, `first_name`, `last_name`, `facebook_url`, `linkedin_url`) VALUES (3, 'jake\'s bio', NULL, 'jake', 'simms', NULL, NULL);
INSERT INTO `profile` (`id`, `bio`, `img_url`, `first_name`, `last_name`, `facebook_url`, `linkedin_url`) VALUES (4, 'jen\'s bio', NULL, 'jen', 'veigel', NULL, NULL);
INSERT INTO `profile` (`id`, `bio`, `img_url`, `first_name`, `last_name`, `facebook_url`, `linkedin_url`) VALUES (5, 'dave\'s bio', NULL, 'dave', 'chirdon', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentafrienddb`;
INSERT INTO `user` (`id`, `user_name`, `password`, `profile_id`, `avg_user_rating`) VALUES (1, 'aaron', 'aaron', 1, 5);
INSERT INTO `user` (`id`, `user_name`, `password`, `profile_id`, `avg_user_rating`) VALUES (2, 'dstumpe', 'dstumpe', 2, 5);
INSERT INTO `user` (`id`, `user_name`, `password`, `profile_id`, `avg_user_rating`) VALUES (3, 'jake', 'jake', 3, 5);
INSERT INTO `user` (`id`, `user_name`, `password`, `profile_id`, `avg_user_rating`) VALUES (4, 'jen', 'jen', 4, 5);
INSERT INTO `user` (`id`, `user_name`, `password`, `profile_id`, `avg_user_rating`) VALUES (5, 'dave', 'dave', 5, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentafrienddb`;
INSERT INTO `address` (`id`, `address`, `city`, `state`) VALUES (1, '123 main street', 'Orlando', 'FL');
INSERT INTO `address` (`id`, `address`, `city`, `state`) VALUES (2, '321 niam street', 'Denver', 'CO');
INSERT INTO `address` (`id`, `address`, `city`, `state`) VALUES (3, '543 aimn street', 'Houston', 'TX');
INSERT INTO `address` (`id`, `address`, `city`, `state`) VALUES (4, '345 nami street', 'Denver', 'CO');
INSERT INTO `address` (`id`, `address`, `city`, `state`) VALUES (5, '435 iman street', 'Denver', 'CO');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentafrienddb`;
INSERT INTO `event` (`id`, `title`, `address_id`, `description`, `activity`, `time`, `owner_id`) VALUES (1, 'Going to the Movies', 1, 'Going to the Movies', 'movies', '2016-01-15 12:30:00', 1);
INSERT INTO `event` (`id`, `title`, `address_id`, `description`, `activity`, `time`, `owner_id`) VALUES (2, 'Football Game', 2, 'Football Game', 'Football', '2017-12-1 16:30:00', 2);
INSERT INTO `event` (`id`, `title`, `address_id`, `description`, `activity`, `time`, `owner_id`) VALUES (3, 'Paintball', 3, 'Paintball', 'Paintball', '2016-01-15 12:30:00', 3);
INSERT INTO `event` (`id`, `title`, `address_id`, `description`, `activity`, `time`, `owner_id`) VALUES (4, 'Knitting Club', 4, 'Knitting', 'Knitting', '2016-01-15 12:30:00', 4);
INSERT INTO `event` (`id`, `title`, `address_id`, `description`, `activity`, `time`, `owner_id`) VALUES (5, 'Snowboarding', 5, 'hitting the slopes', 'snowboarding', '2016-01-15 12:30:00', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_participant`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentafrienddb`;
INSERT INTO `event_participant` (`id`, `user_id`, `event_id`) VALUES (1, 1, 1);
INSERT INTO `event_participant` (`id`, `user_id`, `event_id`) VALUES (2, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `reviews`
-- -----------------------------------------------------
START TRANSACTION;
USE `rentafrienddb`;
INSERT INTO `reviews` (`id`, `review`, `rating`, `reviewer_id`, `reviewee_id`) VALUES (1, 'He is a great person.', 5, NULL, 1);
INSERT INTO `reviews` (`id`, `review`, `rating`, `reviewer_id`, `reviewee_id`) VALUES (2, 'Never complains, always happy', 5, NULL, 2);
INSERT INTO `reviews` (`id`, `review`, `rating`, `reviewer_id`, `reviewee_id`) VALUES (3, 'He has greate quotes from the Congo', 5, NULL, 3);
INSERT INTO `reviews` (`id`, `review`, `rating`, `reviewer_id`, `reviewee_id`) VALUES (4, 'Never a dull moment', 5, NULL, 4);
INSERT INTO `reviews` (`id`, `review`, `rating`, `reviewer_id`, `reviewee_id`) VALUES (5, 'Always on point', 5, NULL, 5);

COMMIT;
