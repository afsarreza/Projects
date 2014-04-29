SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `assign2` DEFAULT CHARACTER SET latin1 ;
USE `assign2` ;

-- -----------------------------------------------------
-- Table `assign2`.`SUPPLIER`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `assign2`.`SUPPLIER` (
  `SID` INT(11) NOT NULL ,
  `Name` VARCHAR(45) NULL DEFAULT NULL ,
  `Address` VARCHAR(45) NULL DEFAULT NULL ,
  `Phone` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`SID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `assign2`.`ITEM`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `assign2`.`ITEM` (
  `IID` INT(11) NOT NULL ,
  `Name` VARCHAR(45) NULL DEFAULT NULL ,
  `Category` VARCHAR(45) NULL DEFAULT NULL ,
  `Description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`IID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `assign2`.`INVENTORY`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `assign2`.`INVENTORY` (
  `Qty` INT(11) NULL DEFAULT NULL ,
  INDEX `IID` (`Qty` ASC) ,
  INDEX `SID` (`Qty` ASC) ,
  CONSTRAINT `SID`
    FOREIGN KEY (`Qty` )
    REFERENCES `assign2`.`SUPPLIER` (`SID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IID`
    FOREIGN KEY (`Qty` )
    REFERENCES `assign2`.`ITEM` (`IID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `assign2`.`PRICELIST`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `assign2`.`PRICELIST` (
  `PricePerItem` INT(11) NULL DEFAULT NULL ,
  `SID` INT(11) NOT NULL ,
  `IID` INT(11) NOT NULL ,
  INDEX `SID` (`SID` ASC) ,
  INDEX `IID` (`IID` ASC) ,
  CONSTRAINT `SID`
    FOREIGN KEY (`SID` )
    REFERENCES `assign2`.`SUPPLIER` (`SID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IID`
    FOREIGN KEY (`IID` )
    REFERENCES `assign2`.`ITEM` (`IID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
