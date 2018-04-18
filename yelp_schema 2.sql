SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema yelp_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema yelp_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yelp_db` DEFAULT CHARACTER SET utf8 ;
USE `yelp_db` ;

-- -----------------------------------------------------
-- Table `yelp_db`.`business`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`business` (
  `id` VARCHAR(22) NOT NULL,
  `name` VARCHAR(255) NULL,
  `neighborhood` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `city` VARCHAR(255) NULL,
  `state` VARCHAR(255) NULL,
  `postal_code` VARCHAR(255) NULL,
  `latitude` FLOAT NULL,
  `longitude` FLOAT NULL,
  `stars` FLOAT NULL,
  `review_count` INT NULL,
  `is_open` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`hours`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`hours` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `business_id` VARCHAR(22) NOT NULL,
  `hours` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `business_id` VARCHAR(22) NOT NULL,
  `category` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`attribute`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`attribute` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `business_id` VARCHAR(22) NOT NULL,
  `name` VARCHAR(255) NULL,
  `value` TEXT(65535) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`user` (
  `id` VARCHAR(22) NOT NULL,
  `name` VARCHAR(255) NULL,
  `review_count` INT NULL,
  `yelping_since` DATETIME NULL,
  `useful` INT NULL,
  `funny` INT NULL,
  `cool` INT NULL,
  `fans` INT NULL,
  `average_stars` FLOAT NULL,
  `compliment_hot` INT NULL,
  `compliment_more` INT NULL,
  `compliment_profile` INT NULL,
  `compliment_cute` INT NULL,
  `compliment_list` INT NULL,
  `compliment_note` INT NULL,
  `compliment_plain` INT NULL,
  `compliment_cool` INT NULL,
  `compliment_funny` INT NULL,
  `compliment_writer` INT NULL,
  `compliment_photos` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`review` (
  `id` VARCHAR(22) NOT NULL,
  `business_id` VARCHAR(22) NOT NULL,
  `user_id` VARCHAR(22) NOT NULL,
  `stars` INT NULL,
  `date` DATETIME NULL,
  `text` TEXT(65535) NULL,
  `useful` INT NULL,
  `funny` INT NULL,
  `cool` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`friend`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`friend` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(22) NOT NULL,
  `friend_id` VARCHAR(22) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`elite_years`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`elite_years` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(22) NOT NULL,
  `year` CHAR(4) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`checkin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`checkin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `business_id` VARCHAR(22) NOT NULL,
  `date` VARCHAR(255) NULL,
  `count` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`tip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`tip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(22) NOT NULL,
  `business_id` VARCHAR(22) NOT NULL,
  `text` TEXT(65535) NULL,
  `date` DATETIME NULL,
  `likes` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yelp_db`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yelp_db`.`photo` (
  `id` VARCHAR(22) NOT NULL,
  `business_id` VARCHAR(22) NOT NULL,
  `caption` VARCHAR(255) NULL,
  `label` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
