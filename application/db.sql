/*Table structure for table `employee_profile` */

/* Table structure for table ci_sessions */
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` VARCHAR(40) NOT NULL,
  `ip_address` VARCHAR(45) NOT NULL,
  `timestamp` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` BLOB NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `employee_profile` (
  `EMP_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `EMP_NAME` VARCHAR(300) NOT NULL,
  `EMP_ADDRESS` VARCHAR(300) NOT NULL,
  `EMP_PHONE` VARCHAR(300) NOT NULL,
  `EMP_CELL` VARCHAR(300) NOT NULL,
  `EMP_EMAIL` VARCHAR(300) NOT NULL,
  `EMP_PIC` VARCHAR(300) NOT NULL,
  `EMP_GENDER` VARCHAR(11) NOT NULL,
  `EMP_DATE` DATE NOT NULL,
  `CREATED_DATE` DATE DEFAULT NULL,
  `CREATED_USERID` INT(11) DEFAULT NULL,
  `UPDATED_DATE` DATE DEFAULT NULL,
  `UPDATED_USERID` INT(11) DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`)
) ENGINE=INNODB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `employee_profile` */

INSERT  INTO `employee_profile`(`EMP_ID`,`EMP_NAME`,`EMP_ADDRESS`,`EMP_PHONE`,`EMP_CELL`,`EMP_EMAIL`,`EMP_PIC`,`EMP_GENDER`,`EMP_DATE`,`CREATED_DATE`,`CREATED_USERID`,`UPDATED_DATE`,`UPDATED_USERID`) VALUES (1,'Imran Shah','Charsadda','2324030','03339276769','shahmian@gmail.com','employee_pics/3e70faef699d1b5a8c8ddc449fac5988.jpg','MALE','2017-07-31','2017-07-31',1,NULL,NULL);

/*Table structure for table `usr_group` */

CREATE TABLE IF NOT EXISTS `usr_group` (
  `GROUP_ID` INT(11) NOT NULL,
  `GROUP_NAME` VARCHAR(100) NOT NULL,
  `CREATED_DATE` DATE DEFAULT NULL,
  `CREATED_USERID` INT(11) DEFAULT NULL,
  `UPDATED_DATE` DATE DEFAULT NULL,
  `UPDATED_USERID` INT(11) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`),
  UNIQUE KEY `UK_GROUP_NAME` (`GROUP_NAME`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `usr_group` */

INSERT  INTO `usr_group`(`GROUP_ID`,`GROUP_NAME`,`CREATED_DATE`,`CREATED_USERID`,`UPDATED_DATE`,`UPDATED_USERID`) VALUES (1,'Superadmin','2015-02-27',1,NULL,NULL),(2,'General Manager','2015-02-27',1,NULL,NULL),(3,'Designer','2015-02-27',1,NULL,NULL);

/*Table structure for table `usr_menu` */

CREATE TABLE IF NOT EXISTS `usr_menu` (
  `MENU_ID` INT(11) NOT NULL,
  `MENU_TEXT` VARCHAR(100) DEFAULT NULL,
  `MENU_URL` VARCHAR(500) DEFAULT NULL,
  `PARENT_ID` INT(11) DEFAULT NULL,
  `SORT_ORDER` INT(11) DEFAULT NULL,
  `SHOW_IN_MENU` INT(11) DEFAULT NULL,
  `IS_ADMIN` VARCHAR(1) DEFAULT NULL,
  `CREATED_DATE` DATE DEFAULT NULL,
  `CREATED_USERID` INT(11) DEFAULT NULL,
  `UPDATED_DATE` DATE DEFAULT NULL,
  `UPDATED_USERID` INT(11) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`),
  KEY `FK_usr_menu_usr_menu_menu_id` (`PARENT_ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `usr_menu` */

INSERT  INTO `usr_menu`(`MENU_ID`,`MENU_TEXT`,`MENU_URL`,`PARENT_ID`,`SORT_ORDER`,`SHOW_IN_MENU`,`IS_ADMIN`,`CREATED_DATE`,`CREATED_USERID`,`UPDATED_DATE`,`UPDATED_USERID`) VALUES (1,'User Management','#',0,2,1,'1',NULL,NULL,NULL,NULL),(2,'Add User','users/add_user',1,2,1,NULL,NULL,NULL,NULL,NULL),(3,'General Settings','#',0,3,1,NULL,NULL,NULL,NULL,NULL),(4,'Add Menu','generals/addmenu',3,3,1,NULL,NULL,NULL,NULL,NULL),(5,'People','#',0,11,1,NULL,NULL,NULL,NULL,NULL),(9,'List Employees','employees/employee_list',5,6,1,NULL,NULL,NULL,NULL,NULL),(18,'Add Menu','generals/addmenu',1,2,1,NULL,'2016-06-09',1,NULL,NULL),(21,'Add Group','generals/add_group',3,2,1,NULL,'2016-06-16',1,NULL,NULL),(22,'Ecommerce','#',0,5,1,NULL,'2017-08-17',1,NULL,NULL),(23,'Orders','admin/orders',22,1,1,NULL,NULL,NULL,NULL,NULL),(24,'Products','admin/products',22,2,1,NULL,'2017-08-17',1,NULL,NULL),(25,'Customers','admin/customers',22,3,1,NULL,'2017-08-17',1,NULL,NULL),(26,'Manage Category','admin/manageCategory',22,4,1,NULL,'2017-08-17',1,NULL,NULL),(27,'Slider Settings','admin/sliderSettings',22,5,1,NULL,'2017-08-17',1,NULL,NULL),(28,'Service Section','admin/serviceSection',22,6,1,NULL,'2017-08-17',1,NULL,NULL),(29,'Testimonial Section','admin/testimonialSection',22,7,1,NULL,'2017-08-17',1,NULL,NULL);

/*Table structure for table `usr_permission` */
CREATE TABLE IF NOT EXISTS `usr_permission` (
  `PER_ID` INT(11) NOT NULL,
  `GROUP_ID` INT(11) NOT NULL,
  `MENU_ID` INT(11) NOT NULL,
  `PER_SELECT` VARCHAR(1) NOT NULL,
  `PER_INSERT` VARCHAR(1) NOT NULL,
  `PER_UPDATE` VARCHAR(1) NOT NULL,
  `PER_DELETE` VARCHAR(1) NOT NULL,
  `CREATED_DATE` DATE DEFAULT NULL,
  `CREATED_USERID` INT(11) DEFAULT NULL,
  `UPDATED_DATE` DATE DEFAULT NULL,
  `UPDATED_USERID` INT(11) DEFAULT NULL,
  PRIMARY KEY (`PER_ID`),
  KEY `FK_usr_permission_usr_group_group_id` (`GROUP_ID`),
  KEY `FK_usr_permission_usr_menu_menu_id` (`MENU_ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `usr_permission` */

INSERT  INTO `usr_permission`(`PER_ID`,`GROUP_ID`,`MENU_ID`,`PER_SELECT`,`PER_INSERT`,`PER_UPDATE`,`PER_DELETE`,`CREATED_DATE`,`CREATED_USERID`,`UPDATED_DATE`,`UPDATED_USERID`) VALUES (1,2,2,'1','1','1','1',NULL,NULL,'2017-10-18',1),(2,2,3,'0','0','0','0',NULL,NULL,'2017-10-18',1),(3,2,4,'0','0','0','0',NULL,NULL,'2017-10-18',1),(4,2,5,'1','0','0','0',NULL,NULL,'2017-10-18',1),(5,2,6,'0','0','0','0',NULL,NULL,'2016-06-16',1),(6,2,9,'1','1','0','0',NULL,NULL,'2017-10-18',1),(7,2,10,'0','0','0','0',NULL,NULL,'2016-06-16',1),(8,2,11,'0','0','0','0',NULL,NULL,'2016-06-16',1),(9,2,12,'1','0','0','0',NULL,NULL,'2016-06-16',1),(10,2,13,'1','0','0','0',NULL,NULL,'2016-06-16',1),(11,2,14,'1','0','0','0',NULL,NULL,'2016-06-16',1),(12,2,15,'0','0','0','0','2015-03-02',1,'2016-06-16',1),(13,2,16,'0','0','0','0','2015-03-02',1,'2016-06-16',1),(14,2,17,'0','0','0','0','2015-03-02',1,'2016-06-16',1),(15,2,18,'0','0','0','0','2015-03-02',1,'2017-10-18',1),(16,2,19,'1','0','0','0','2015-03-02',1,'2016-06-16',1),(17,1,2,'0','0','0','0','2015-03-06',1,'2015-04-15',1),(18,1,3,'1','1','1','1','2015-03-06',1,'2015-04-15',1),(19,1,5,'0','0','0','0','2015-03-06',1,'2015-04-15',1),(20,1,6,'0','0','0','0','2015-03-06',1,'2015-04-15',1),(21,1,9,'0','0','0','0','2015-03-06',1,NULL,NULL),(22,1,10,'0','0','0','0','2015-03-06',1,NULL,NULL),(23,1,11,'0','0','0','0','2015-03-06',1,NULL,NULL),(24,1,12,'0','0','0','0','2015-03-06',1,'2015-04-15',1),(25,1,13,'0','0','0','0','2015-03-06',1,'2015-04-15',1),(26,1,14,'0','0','0','0','2015-03-06',1,'2015-04-15',1),(27,1,15,'0','0','0','0','2015-03-06',1,NULL,NULL),(28,1,16,'0','0','0','0','2015-03-06',1,NULL,NULL),(29,1,17,'0','0','0','0','2015-03-06',1,NULL,NULL),(30,1,18,'0','0','0','0','2015-03-06',1,NULL,NULL),(31,1,19,'0','0','0','0','2015-03-06',1,NULL,NULL),(32,1,21,'1','1','1','1','2015-03-06',1,'2015-04-15',1),(33,1,22,'1','1','1','1','2015-03-06',1,'2015-04-15',1),(34,2,21,'0','0','0','0','2015-03-16',1,'2017-10-18',1),(35,2,22,'1','0','0','0','2015-03-16',1,'2017-10-18',1),(36,2,23,'0','0','0','0','2015-03-16',1,'2017-10-18',1),(37,2,24,'0','0','0','0','2015-03-16',1,'2017-10-18',1),(38,2,25,'0','0','0','0','2015-03-16',1,'2017-10-18',1),(39,1,23,'0','0','0','0','2015-04-15',1,'2015-04-15',1),(40,1,24,'0','0','0','0','2015-04-15',1,'2015-04-15',1),(41,1,25,'0','0','0','0','2015-04-15',1,'2015-04-15',1),(42,1,26,'0','0','0','0','2015-04-15',1,'2015-04-15',1),(43,2,26,'0','0','0','0','2015-09-11',1,'2017-10-18',1),(44,2,27,'0','0','0','0','2015-09-11',1,'2017-10-18',1),(45,2,28,'0','0','0','0','2015-09-11',1,'2017-10-18',1),(46,2,29,'0','0','0','0','2015-09-11',1,'2017-10-18',1),(47,2,1,'1','0','0','0','2016-06-16',1,'2017-10-18',1),(48,2,7,'0','0','0','0','2016-06-16',1,NULL,NULL),(49,2,8,'0','0','0','0','2016-06-16',1,NULL,NULL),(50,2,20,'0','0','0','0','2016-06-16',1,NULL,NULL),(51,3,1,'0','0','0','0','2017-08-01',1,NULL,NULL),(52,3,2,'0','0','0','0','2017-08-01',1,NULL,NULL),(53,3,3,'0','0','0','0','2017-08-01',1,NULL,NULL),(54,3,4,'0','0','0','0','2017-08-01',1,NULL,NULL),(55,3,5,'1','0','0','0','2017-08-01',1,NULL,NULL),(56,3,9,'1','0','0','0','2017-08-01',1,NULL,NULL),(57,3,18,'0','0','0','0','2017-08-01',1,NULL,NULL),(58,3,21,'0','0','0','0','2017-08-01',1,NULL,NULL);

/*Table structure for table `usr_user` */

CREATE TABLE IF NOT EXISTS `usr_user` (
  `USER_ID` INT(11) NOT NULL,
  `USER_NAME` VARCHAR(100) NOT NULL,
  `U_PASSWORD` VARCHAR(500) NOT NULL,
  `EMP_NO` VARCHAR(20) DEFAULT NULL,
  `logged_in` INT(1) DEFAULT NULL,
  `IS_ACTIVE` VARCHAR(1) NOT NULL,
  `GROUP_ID` INT(11) NOT NULL,
  `SUP_ADMIN` VARCHAR(1) DEFAULT NULL,
  `CREATED_DATE` DATE DEFAULT NULL,
  `CREATED_USERID` INT(11) DEFAULT NULL,
  `UPDATED_DATE` DATE DEFAULT NULL,
  `UPDATED_USERID` INT(11) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `UK_USER_NAME` (`USER_NAME`),
  KEY `FK_usr_user_hrm_employees_emp_no` (`EMP_NO`),
  KEY `FK_usr_user_usr_group_group_id` (`GROUP_ID`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `usr_user` */

INSERT  INTO `usr_user`(`USER_ID`,`USER_NAME`,`U_PASSWORD`,`EMP_NO`,`logged_in`,`IS_ACTIVE`,`GROUP_ID`,`SUP_ADMIN`,`CREATED_DATE`,`CREATED_USERID`,`UPDATED_DATE`,
`UPDATED_USERID`) VALUES (1,'superadmin','21232f297a57a5a743894a0e4a801fc3','0',NULL,'1',1,NULL,NULL,NULL,'2017-08-08',1),(2,'sameer','d524813536b71639999ba12bdb3621a8','1',NULL,'1',2,NULL,'2015-03-16',1,'2015-09-11',0),(4,'sohail','202cb962ac59075b964b07152d234b70','3',NULL,'1',3,NULL,'2016-08-03',1,NULL,NULL);

