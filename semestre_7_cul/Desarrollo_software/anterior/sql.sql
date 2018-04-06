-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Libreria
-- -----------------------------------------------------
-- Base de datos para una Libreria Web

-- -----------------------------------------------------
-- Schema Libreria
--
-- Base de datos para una Libreria Web
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Libreria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Libreria` ;

-- -----------------------------------------------------
-- Table `Libreria`.`Editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Editorial` (
  `IdEditorial` INT NOT NULL,
  `Nombre` VARCHAR(50) NULL,
  `Telefono` MEDIUMTEXT NULL,
  `ContactoPersona` VARCHAR(50) NULL,
  `Direccion` VARCHAR(100) NULL,
  `Ciudad` VARCHAR(50) NULL,
  PRIMARY KEY (`IdEditorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Tema` (
  `IdTema` INT NOT NULL,
  `Nombre` VARCHAR(50) NULL,
  PRIMARY KEY (`IdTema`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Libro` (
  `idLibro` INT NOT NULL,
  `Titulo` VARCHAR(45) NULL,
  `NumPagina` INT NULL,
  `NumEdicion` INT NULL,
  `TipoCubierta` VARCHAR(20) NULL,
  `Idioma` VARCHAR(45) NULL,
  `Precio` FLOAT NULL,
  `IdEditorial` INT NULL,
  `IdTema` INT NULL,
  PRIMARY KEY (`idLibro`),
  INDEX `IdEditorial_idx` (`IdEditorial` ASC),
  INDEX `IdTema_idx` (`IdTema` ASC),
  CONSTRAINT `IdEditorial1`
    FOREIGN KEY (`IdEditorial`)
    REFERENCES `Libreria`.`Editorial` (`IdEditorial`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `IdTema`
    FOREIGN KEY (`IdTema`)
    REFERENCES `Libreria`.`Tema` (`IdTema`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Autor` (
  `IdAutor` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Pais` VARCHAR(45) NULL,
  PRIMARY KEY (`IdAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Ejemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Ejemplar` (
  `IdLibro` INT NOT NULL,
  `IdAutor` INT NOT NULL,
  `Cantidad` INT NULL,
  `NumEstante` INT NULL,
  PRIMARY KEY (`IdLibro`, `IdAutor`),
  INDEX `IdAutor_idx` (`IdAutor` ASC),
  CONSTRAINT `IdAutor2`
    FOREIGN KEY (`IdAutor`)
    REFERENCES `Libreria`.`Autor` (`IdAutor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `IdLibro`
    FOREIGN KEY (`IdLibro`)
    REFERENCES `Libreria`.`Libro` (`idLibro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Cliente` (
  `IdCliente` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Cedula` MEDIUMTEXT NULL,
  `Telefono` MEDIUMTEXT NULL,
  `Direccion` VARCHAR(100) NULL,
  `Correo` VARCHAR(50) NULL,
  `Contraseña` MEDIUMTEXT NULL,
  PRIMARY KEY (`IdCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Pedido` (
  `IdPedido` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `NumTarjeta` MEDIUMTEXT NULL,
  `IdCliente` INT NULL,
  PRIMARY KEY (`IdPedido`),
  INDEX `IdCliente_idx` (`IdCliente` ASC),
  CONSTRAINT `IdCliente3`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `Libreria`.`Cliente` (`IdCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Pedido Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Pedido Cliente` (
  `IdLibro` INT NOT NULL,
  `IdPedido` INT NOT NULL,
  `Cantidad` INT NULL,
  `Precio` FLOAT NULL,
  PRIMARY KEY (`IdLibro`, `IdPedido`),
  INDEX `IdPedido_idx` (`IdPedido` ASC),
  CONSTRAINT `IdLibro4`
    FOREIGN KEY (`IdLibro`)
    REFERENCES `Libreria`.`Libro` (`idLibro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `IdPedido`
    FOREIGN KEY (`IdPedido`)
    REFERENCES `Libreria`.`Pedido` (`IdPedido`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Proveedor` (
  `IdProveedor` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Telefono` MEDIUMTEXT NULL,
  `Direccion` VARCHAR(100) NULL,
  `Correo` VARCHAR(50) NULL,
  PRIMARY KEY (`IdProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Suministro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Suministro` (
  `IdProveedor` INT NOT NULL,
  `IdLibro` INT NOT NULL,
  `Cantidad` INT NULL,
  `Precio` FLOAT NULL,
  INDEX `IdProveedor_idx` (`IdProveedor` ASC),
  INDEX `IdLibro_idx` (`IdLibro` ASC),
  PRIMARY KEY (`IdProveedor`, `IdLibro`),
  CONSTRAINT `IdProveedor5`
    FOREIGN KEY (`IdProveedor`)
    REFERENCES `Libreria`.`Proveedor` (`IdProveedor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `IdLibro12`
    FOREIGN KEY (`IdLibro`)
    REFERENCES `Libreria`.`Libro` (`idLibro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Libreria`.`Foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`Foto` (
  `IdLibro` INT NULL,
  `Imagen` LONGBLOB NULL,
  INDEX `IdLibro_idx` (`IdLibro` ASC),
  CONSTRAINT `IdLibro6`
    FOREIGN KEY (`IdLibro`)
    REFERENCES `Libreria`.`Libro` (`idLibro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `Libreria` ;

-- -----------------------------------------------------
-- Placeholder table for view `Libreria`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Libreria`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `Libreria`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Libreria`.`view1`;
USE `Libreria`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/*
//vista creada por mi
USE `Libreria` ;


create view Autores 
as 
(
select nombre
,apellido
 from autor
);
*/
