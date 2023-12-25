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
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);

USE `tm` ;

-- -----------------------------------------------------
-- Table `tm`.`producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm`.`producer` (
  `prodid` INT NOT NULL AUTO_INCREMENT,
  `producername` VARCHAR(100) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`prodid`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tm`.`treatments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm`.`treatments` (
  `treatid` INT NOT NULL AUTO_INCREMENT,
  `treatment` VARCHAR(100) NOT NULL,
  `descriptionoftreatment` VARCHAR(500) NULL DEFAULT NULL,
  `dose` INT NOT NULL,
  `amountinpackage` INT NOT NULL,
  `cost` INT NOT NULL,
  `link` VARCHAR(500) NULL DEFAULT NULL,
  `receiptdate` TIMESTAMP NOT NULL,
  `amountofpackage` INT NOT NULL,
  `prodid` INT NOT NULL,
  `remains` INT NOT NULL,
  PRIMARY KEY (`treatid`),
  INDEX `fk_treatments_prodid` (`prodid` ASC) VISIBLE,
  CONSTRAINT `fk_treatments_prodid`
    FOREIGN KEY (`prodid`)
    REFERENCES `tm`.`producer` (`prodid`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tm`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm`.`orders` (
  `orderid` INT NOT NULL AUTO_INCREMENT,
  `numoforder` INT NOT NULL,
  `treatid` INT NOT NULL,
  `amount` INT NOT NULL,
  `customername` VARCHAR(200) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `dateoforder` TIMESTAMP NOT NULL,
  `dateofdelivery` TIMESTAMP NOT NULL,
  `dateofbuying` TIMESTAMP NOT NULL,
  PRIMARY KEY (`orderid`),
  INDEX `fk_orders_treatid` (`treatid` ASC) VISIBLE,
  CONSTRAINT `fk_orders_treatid`
    FOREIGN KEY (`treatid`)
    REFERENCES `tm`.`treatments` (`treatid`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `tm` ;

-- -----------------------------------------------------
-- Placeholder table for view `tm`.`cost_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm`.`cost_order` (`Имя заказчика` INT, `Заказ` INT, `(amount*cost)` INT);

-- -----------------------------------------------------
-- Placeholder table for view `tm`.`country_producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm`.`country_producer` (`producername` INT, `country` INT);

-- -----------------------------------------------------
-- Placeholder table for view `tm`.`remains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tm`.`remains` (`treatment` INT, `total_ordered` INT, `available_for_order` INT);

-- -----------------------------------------------------
-- View `tm`.`cost_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tm`.`cost_order`;
USE `tm`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tm`.`cost_order` AS select distinct `ord`.`customername` AS `Имя заказчика`,concat(`tr`.`treatment`,', Количество:',`ord`.`amount`) AS `Заказ`,(`ord`.`amount` * `tr`.`cost`) AS `(amount*cost)` from (`tm`.`orders` `ord` join `tm`.`treatments` `tr` on((`ord`.`treatid` = `tr`.`treatid`)));

-- -----------------------------------------------------
-- View `tm`.`country_producer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tm`.`country_producer`;
USE `tm`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tm`.`country_producer` AS select distinct `tm`.`producer`.`producername` AS `producername`,`tm`.`producer`.`country` AS `country` from `tm`.`producer`;

-- -----------------------------------------------------
-- View `tm`.`remains`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tm`.`remains`;
USE `tm`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tm`.`remains` AS select `t`.`treatment` AS `treatment`,sum(`o`.`amount`) AS `total_ordered`,(case when ((`t`.`remains` - sum(`o`.`amount`)) < 0) then 'недоступно для заказа' else (`t`.`remains` - sum(`o`.`amount`)) end) AS `available_for_order` from (`tm`.`orders` `o` join `tm`.`treatments` `t` on((`o`.`treatid` = `t`.`treatid`))) group by `o`.`treatid`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
