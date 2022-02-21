-- MySQL Script generated by MySQL Workbench
-- Mon Feb 21 02:44:34 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Books` DEFAULT CHARACTER SET utf8 ;
USE `Books` ;

-- -----------------------------------------------------
-- Table `Books`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`Book` (
  `ISBN` BIGINT NOT NULL,
  `Title` VARCHAR(50) NOT NULL,
  `N_Pages` INT NOT NULL,
  `P_Date` YEAR NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`Avtor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`Avtor` (
  `idAvtor` INT NOT NULL,
  `FirstName` VARCHAR(20) NOT NULL,
  `LastName` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idAvtor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`Book_has_Avtor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`Book_has_Avtor` (
  `id` INT NOT NULL,
  `Book_ISBN` BIGINT(13) NOT NULL,
  `Avtor_idAvtor` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Book_has_Avtor_Avtor1_idx` (`Avtor_idAvtor` ASC) VISIBLE,
  INDEX `fk_Book_has_Avtor_Book_idx` (`Book_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Book_has_Avtor_Book`
    FOREIGN KEY (`Book_ISBN`)
    REFERENCES `Books`.`Book` (`ISBN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Book_has_Avtor_Avtor1`
    FOREIGN KEY (`Avtor_idAvtor`)
    REFERENCES `Books`.`Avtor` (`idAvtor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`Genre` (
  `idGenre` INT NOT NULL,
  `N_Genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`Book_has_Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books`.`Book_has_Genre` (
  `id` INT NOT NULL,
  `Book_ISBN` BIGINT NOT NULL,
  `Genre_idGenre` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Book_has_Genre_Genre1_idx` (`Genre_idGenre` ASC) VISIBLE,
  INDEX `fk_Book_has_Genre_Book1_idx` (`Book_ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Book_has_Genre_Book1`
    FOREIGN KEY (`Book_ISBN`)
    REFERENCES `Books`.`Book` (`ISBN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Book_has_Genre_Genre1`
    FOREIGN KEY (`Genre_idGenre`)
    REFERENCES `Books`.`Genre` (`idGenre`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;