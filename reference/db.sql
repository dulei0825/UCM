#
####################################
#  !!! SQL_MODE=NO_AUTO_VALUE_ON_ZERO MUST be set before import
####################################


CREATE DATABASE `ucm` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS `pn` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY `pk_`(``)
) ENGINE = InnoDB;
