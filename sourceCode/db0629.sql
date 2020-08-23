CREATE TABLE `tbl_dept`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `deptName` VARCHAR(30) DEFAULT NULL,
    `locAdd` VARCHAR(40) DEFAULT NULL,
    PRIMARY KEY(`id`)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_emp`(
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) DEFAULT NULL,
    `deptld` INT(11) DEFAULT NULL,
    PRIMARY KEY(`id`),
    KEY `fk_dept_id` (`deptld`)
    #CONSTRAINT `fk_dept_id` FOREIGN KEY (`deptld`) REFERENCES `tbl_dept` (`id`)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO tbl_dept(deptName,locAdd) VALUES('RD',11);
INSERT INTO tbl_dept(deptName,locAdd) VALUES('HR',12);
INSERT INTO tbl_dept(deptName,locAdd) VALUES('MK',13);
INSERT INTO tbl_dept(deptName,locAdd) VALUES('MIS',14);
INSERT INTO tbl_dept(deptName,locAdd) VALUES('FD',15);

INSERT INTO tbl_emp(NAME,deptld) VALUES('z3',1);
INSERT INTO tbl_emp(NAME,deptld) VALUES('z4',1);
INSERT INTO tbl_emp(NAME,deptld) VALUES('z5',1);

INSERT INTO tbl_emp(NAME,deptld) VALUES('w5',2);
INSERT INTO tbl_emp(NAME,deptld) VALUES('w6',2);

INSERT INTO tbl_emp(NAME,deptld) VALUES('s7',3);
INSERT INTO tbl_emp(NAME,deptld) VALUES('s8',4);

INSERT INTO tbl_emp(NAME,deptld) VALUES('s9',51);



