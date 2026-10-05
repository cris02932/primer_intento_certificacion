-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CinePedia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CinePedia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CinePedia` DEFAULT CHARACTER SET utf8 ;
USE `CinePedia` ;

-- -----------------------------------------------------
-- Table `CinePedia`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinePedia`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL,
  `apellido` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinePedia`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinePedia`.`peliculas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_pelicula` VARCHAR(255) NULL,
  `director` VARCHAR(255) NULL,
  `fecha_estreno` VARCHAR(255) NULL,
  `sinopsis` TEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CinePedia`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CinePedia`.`comentarios` (
  `usuarios_id` INT NOT NULL,
  `peliculas_id` INT NOT NULL,
  `comentarios` TEXT NULL,
  PRIMARY KEY (`usuarios_id`, `peliculas_id`),
  INDEX `fk__has_peliculas_peliculas1_idx` (`peliculas_id` ASC) VISIBLE,
  INDEX `fk__has_peliculas__idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk__has_peliculas_`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `CinePedia`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk__has_peliculas_peliculas1`
    FOREIGN KEY (`peliculas_id`)
    REFERENCES `CinePedia`.`peliculas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
