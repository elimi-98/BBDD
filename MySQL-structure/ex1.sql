-- MySQL Script generated by MySQL Workbench
-- Wed Sep 27 18:12:58 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proveidor` (
  `idProveidor` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `telf` INT NULL,
  `fax` INT NULL,
  `NIF` VARCHAR(45) NULL,
  `direccio` MEDIUMTEXT NULL,
  PRIMARY KEY (`idProveidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`marca` (
  `idMarca` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `proveidor_idProveidor` INT NOT NULL,
  PRIMARY KEY (`idMarca`, `proveidor_idProveidor`),
  INDEX `fk_marca_proveidor1_idx` (`proveidor_idProveidor` ASC) VISIBLE,
  CONSTRAINT `fk_marca_proveidor1`
    FOREIGN KEY (`proveidor_idProveidor`)
    REFERENCES `mydb`.`proveidor` (`idProveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `idclient` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom1` VARCHAR(45) NULL,
  `cognom2` VARCHAR(45) NULL,
  `direccio` MEDIUMTEXT NULL,
  `codi_postal` INT NULL,
  `localitat` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  `telf` INT NULL,
  PRIMARY KEY (`idclient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleat` (
  `idEmpleat` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ventas` (
  `idVentas` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NULL,
  `client_idClient` INT NOT NULL,
  `empleat_idEmpleat` INT NOT NULL,
  PRIMARY KEY (`idVentas`, `client_idClient`, `empleat_idEmpleat`),
  INDEX `fk_ventas_client1_idx` (`client_idClient` ASC) VISIBLE,
  INDEX `fk_ventas_empleat1_idx` (`empleat_idEmpleat` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_client1`
    FOREIGN KEY (`client_idClient`)
    REFERENCES `mydb`.`client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_empleat1`
    FOREIGN KEY (`empleat_idEmpleat`)
    REFERENCES `mydb`.`empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ulleres` (
  `idUlleres` INT NOT NULL AUTO_INCREMENT,
  `graduacio_dret` DECIMAL NULL,
  `graduacio_esq` DECIMAL NULL,
  `muntura` ENUM('flotant', 'pasta', 'metàl·lica') NULL,
  `color _muntura` VARCHAR(45) NULL,
  `color _vidres` VARCHAR(45) NULL,
  `preu` DECIMAL NOT NULL,
  `marca_idMarca` INT NOT NULL,
  `ventas_idVentas` INT NOT NULL,
  `ventas_client_idClient` INT NOT NULL,
  `ventas_empleat_idEmpleat` INT NOT NULL,
  PRIMARY KEY (`idUlleres`, `marca_idMarca`, `ventas_idVentas`, `ventas_client_idClient`, `ventas_empleat_idEmpleat`),
  INDEX `fk_ulleres_marca1_idx` (`marca_idMarca` ASC) VISIBLE,
  INDEX `fk_ulleres_ventas1_idx` (`ventas_idVentas` ASC, `ventas_client_idClient` ASC, `ventas_empleat_idEmpleat` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_marca1`
    FOREIGN KEY (`marca_idMarca`)
    REFERENCES `mydb`.`marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_ventas1`
    FOREIGN KEY (`ventas_idVentas` , `ventas_client_idClient` , `ventas_empleat_idEmpleat`)
    REFERENCES `mydb`.`ventas` (`idVentas` , `client_idClient` , `empleat_idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `idclient` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom1` VARCHAR(45) NULL,
  `cognom2` VARCHAR(45) NULL,
  `direccio` MEDIUMTEXT NULL,
  `codi_postal` INT NULL,
  `localitat` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  `telf` INT NULL,
  PRIMARY KEY (`idclient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`botiga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`botiga` (
  `idbotiga` INT NOT NULL,
  `direccio` MEDIUMTEXT NULL,
  `codi_postal` INT NULL,
  `localitat` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  PRIMARY KEY (`idbotiga`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empleats/des`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empleats/des` (
  `idempleats/des` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom1` VARCHAR(45) NULL,
  `cognom2` VARCHAR(45) NULL,
  `NIF` INT NULL,
  `telf` INT NULL,
  `botiga_idbotiga` INT NOT NULL,
  PRIMARY KEY (`idempleats/des`),
  INDEX `fk_empleats/des_botiga1_idx` (`botiga_idbotiga` ASC) VISIBLE,
  CONSTRAINT `fk_empleats/des_botiga1`
    FOREIGN KEY (`botiga_idbotiga`)
    REFERENCES `mydb`.`botiga` (`idbotiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reparto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reparto` (
  `idtable1` INT NOT NULL,
  `empleats/des_idempleats/des` INT NOT NULL,
  `data_hora` DATETIME NULL,
  PRIMARY KEY (`idtable1`),
  INDEX `fk_domicili_empleats/des1_idx` (`empleats/des_idempleats/des` ASC) VISIBLE,
  CONSTRAINT `fk_domicili_empleats/des1`
    FOREIGN KEY (`empleats/des_idempleats/des`)
    REFERENCES `mydb`.`empleats/des` (`idempleats/des`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comanda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comanda` (
  `idcomanda` INT UNSIGNED NOT NULL,
  `data_hora` DATETIME NULL,
  `entrega` ENUM('recollir', 'domicili') NULL,
  `preu_total` DECIMAL NULL,
  `data/hora_repartiment` DATETIME NULL,
  `client_idclient` INT NOT NULL,
  `botiga_idbotiga` INT NOT NULL,
  `empleats/des_idempleats/des` INT NOT NULL,
  `repartidor_idtable1` INT NOT NULL,
  PRIMARY KEY (`idcomanda`),
  INDEX `fk_comanda_client1_idx` (`client_idclient` ASC) VISIBLE,
  INDEX `fk_comanda_botiga1_idx` (`botiga_idbotiga` ASC) VISIBLE,
  INDEX `fk_comanda_empleats/des1_idx` (`empleats/des_idempleats/des` ASC) VISIBLE,
  INDEX `fk_comanda_repartidor1_idx` (`repartidor_idtable1` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_client1`
    FOREIGN KEY (`client_idclient`)
    REFERENCES `mydb`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_botiga1`
    FOREIGN KEY (`botiga_idbotiga`)
    REFERENCES `mydb`.`botiga` (`idbotiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_empleats/des1`
    FOREIGN KEY (`empleats/des_idempleats/des`)
    REFERENCES `mydb`.`empleats/des` (`idempleats/des`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_repartidor1`
    FOREIGN KEY (`repartidor_idtable1`)
    REFERENCES `mydb`.`reparto` (`idtable1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `idcategoria` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producte` (
  `idproducte` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `descripcio` LONGTEXT NULL,
  `imatge` BLOB NULL,
  `preu` DECIMAL NULL,
  `tipus` ENUM('pizza', 'hamburguesa', 'beguda') NULL,
  `categoria_idcategoria` INT NULL,
  PRIMARY KEY (`idproducte`),
  INDEX `fk_producte_categoria1_idx` (`categoria_idcategoria` ASC) VISIBLE,
  CONSTRAINT `fk_producte_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `mydb`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comanda_has_producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comanda_has_producte` (
  `comanda_idcomanda` INT NOT NULL,
  `producte_idproducte` INT NOT NULL,
  `quantitat` INT NULL,
  PRIMARY KEY (`comanda_idcomanda`, `producte_idproducte`),
  INDEX `fk_comanda_has_producte_producte1_idx` (`producte_idproducte` ASC) VISIBLE,
  INDEX `fk_comanda_has_producte_comanda1_idx` (`comanda_idcomanda` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_has_producte_comanda1`
    FOREIGN KEY (`comanda_idcomanda`)
    REFERENCES `mydb`.`comanda` (`idcomanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_has_producte_producte1`
    FOREIGN KEY (`producte_idproducte`)
    REFERENCES `mydb`.`producte` (`idproducte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
