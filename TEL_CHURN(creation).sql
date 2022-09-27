CREATE SCHEMA `tel_cus_churn` ;
#here creating schema named 'tel_cus_churn'


#now creating table inside the schema named customer which contains columns 'customer_id','count','gender'
CREATE TABLE `tel_cus_churn`.`customer` (
  `customer_id` VARCHAR(15) NOT NULL,
  `count` INT NULL,
  `gender` VARCHAR(7) NULL,
  `senior_citizen` VARCHAR(3) NULL,
  `partner` VARCHAR(3) NULL,
  `dependents` VARCHAR(3) NULL,
  `tenure_monthly` INT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `idcustomer_UNIQUE` (`customer_id` ASC) VISIBLE);
  
  
  INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('3668-QPYBK', '1', 'Male', 'No', 'No', 'No', '2');
INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('9237-HQITU', '1', 'Female', 'No', 'No', 'Yes', '2');
INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('9305-CDSKC', '1', 'Female', 'No', 'No', 'Yes', '8');
INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('7892-POOKP', '1', 'Female', 'No', 'Yes', 'Yes', '28');
INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('0280-XJGEX', '1', 'Male', 'No', 'No', 'Yes', '49');
INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('4190-MFLUW', '1', 'Female', 'No', 'Yes', 'No', '10');
INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('8779-QRDMV', '1', 'Male', 'Yes', 'No', 'No', '1');
INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('1066-JKSGK', '1', 'Male', 'No', 'No', 'No', '1');
INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('6467-CHFZW', '1', 'Male', 'No', 'Yes', 'Yes', '47');
INSERT INTO `tel_cus_churn`.`customer` (`customer_id`, `count`, `gender`, `senior_citizen`, `partner`, `dependents`, `tenure_monthly`) VALUES ('8665-UTDHZ', '1', 'Male', 'No', 'Yes', 'No', '1');



CREATE TABLE `tel_cus_churn`.`location` (
  `id` VARCHAR(20) NULL,
  `latitude` INT NULL,
  `longitude` INT NULL,
  `country` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `zipcode` INT  NOT NULL,
  INDEX `id_idx` (`id` ASC) VISIBLE,
  PRIMARY KEY (`zipcode`),
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `tel_cus_churn`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('3668-QPYBK', '33.964131', '-118.272783', 'United States', 'California', 'Los Angeles', '90003');
INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('9237-HQITU', '34.059281', '-118.307420', 'United States', 'California', 'Los Angeles', '90005');
INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('9305-CDSKC', '34.048013', '-118.293953', 'United States', 'California', 'Los Angeles', '90006');
INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('7892-POOKP', '34.062125', '-118.315709', 'United States', 'California', 'Los Angeles', '90010');
INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('0280-XJGEX', '34.039224', '-118.266293', 'United States', 'California', 'Los Angeles', '90015');
INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('4190-MFLUW', '34.039224', '-118.309868', 'United States', 'California', 'Los Angeles', '90020');
INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('8779-QRDMV', '34.039224', '-118.156582', 'United States', 'California', 'Los Angeles', '90022');
INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('1066-JKSGK', '34.039224', '-118.435479', 'United States', 'California', 'Los Angeles', '90024');
INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('6467-CHFZW', '34.039224', '-118.326843', 'United States', 'California', 'Los Angeles', '90028');
INSERT INTO `tel_cus_churn`.`location` (`id`, `latitude`, `longitude`, `country`, `state`, `city`, `zipcode`) VALUES ('8665-UTDHZ', '34.039224', '-118.294824', 'United States', 'California', 'Los Angeles', '90029');




CREATE TABLE `tel_cus_churn`.`payments_churns` (
  `cus_id` VARCHAR(45) NOT NULL,
  `contract` VARCHAR(45) NULL,
  `pay_method` VARCHAR(45) NULL,
  `paperless_billing` VARCHAR(45) NULL,
  `total_charges` DECIMAL(20,10) NULL,
  `monthly_charges` DECIMAL(20,10) NULL,
  `churn_label` VARCHAR(4) NULL,
  `churn_value` INT NULL,
  `churn_score` INT NULL,
  `cltv` INT NULL,
  `churn_reason` VARCHAR(45) NULL,
  PRIMARY KEY (`cus_id`),
  CONSTRAINT `cus_id`
    FOREIGN KEY (`cus_id`)
    REFERENCES `tel_cus_churn`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('3668-QPYBK', 'Month-to-month', 'Mailed check', 'Yes', '108.15', '53.85', 'Yes', '1', '86', '3239', 'Competitor made better offer');
INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('9237-HQITU', 'Month-to-month', 'Electronic check', 'Yes', '151.65', '70.7', 'Yes', '1', '67', '2701', 'Moved');
INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('9305-CDSKC', 'Month-to-month', 'Electronic check', 'Yes', '820.5', '99.65', 'Yes', '1', '86', '5372', 'Moved');
INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('7892-POOKP', 'Month-to-month', 'Electronic check', 'Yes', '3046.05', '104.8', 'Yes', '1', '84', '5003', 'Moved');
INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('0280-XJGEX', 'Month-to-month', 'Bank transfer (automatic)', 'Yes', '5036.3', '103.7', 'Yes', '1', '89', '5340', 'Competitor had better devices');
INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('4190-MFLUW', 'Month-to-month', 'Credit card (automatic)', 'No', '528.35', '55.2', 'Yes', '1', '78', '5925', 'Competitor offered higher download speeds');
INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('8779-QRDMV', 'Month-to-month', 'Electronic check', 'Yes', '39.65', '39.65', 'Yes', '1', '100', '5433', 'Competitor offered more data');
INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('1066-JKSGK', 'Month-to-month', 'Mailed check', 'No', '20.15', '20.15', 'Yes', '1', '92', '4832', 'Competitor made better offer');
INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('6467-CHFZW', 'Month-to-month', 'Electronic check', 'Yes', '4749.15', '99.35', 'Yes', '1', '77', '5789', 'Competitor had better devices');
INSERT INTO `tel_cus_churn`.`payments_churns` (`cus_id`, `contract`, `pay_method`, `paperless_billing`, `total_charges`, `monthly_charges`, `churn_label`, `churn_value`, `churn_score`, `cltv`, `churn_reason`) VALUES ('8665-UTDHZ', 'Month-to-month', 'Electronic check', 'No', '30.2', '30.2', 'Yes', '1', '97', '2915', 'Competitor had better devices	');



CREATE TABLE `tel_cus_churn`.`technical support` (
  `id_cust` VARCHAR(20) NOT NULL,
  `phone services` VARCHAR(45) NULL,
  `multiple line` VARCHAR(45) NULL,
  `internet services` VARCHAR(45) NULL,
  `online security` VARCHAR(45) NULL,
  `online backup` VARCHAR(45) NULL,
  `device protection` VARCHAR(45) NULL,
  `tech support` VARCHAR(45) NULL,
  `streaming tv` VARCHAR(45) NULL,
  `streaming movies` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cust`),
  CONSTRAINT `id_cust`
    FOREIGN KEY (`id_cust`)
    REFERENCES `tel_cus_churn`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('3668-QPYBK', 'Yes', 'No', 'DSL', 'Yes', 'Yes', 'No', 'No', 'No', 'No');
INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('9237-HQITU', 'Yes', 'No', 'Fiber optic', 'No', 'No', 'No', 'No', 'No', 'No');
INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('9305-CDSKC', 'Yes', 'Yes', 'Fiber optic', 'No', 'No', 'Yes', 'No', 'Yes', 'Yes');
INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('7892-POOKP', 'Yes', 'Yes', 'Fiber optic', 'No', 'No', 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('0280-XJGEX', 'Yes', 'Yes', 'Fiber optic', 'No', 'Yes', 'Yes', 'No', 'Yes', 'Yes');
INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('4190-MFLUW', 'Yes', 'No', 'DSL', 'No', 'No', 'Yes', 'Yes', 'No', 'No');
INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('8779-QRDMV', 'No', 'No phone service', 'DSL', 'No', 'No', 'Yes', 'No', 'No', 'Yes');
INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('1066-JKSGK', 'Yes', 'No', 'No', 'No internet service', 'No internet service', 'No internet service', 'No internet service', 'No internet service', 'No internet service');
INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('6467-CHFZW', 'Yes', 'Yes', 'Fiber optic', 'No', 'Yes', 'No', 'No', 'Yes', 'Yes');
INSERT INTO `tel_cus_churn`.`technical support` (`id_cust`, `phone services`, `multiple line`, `internet services`, `online security`, `online backup`, `device protection`, `tech support`, `streaming tv`, `streaming movies`) VALUES ('8665-UTDHZ', 'No', 'No phone service', 'DSL', 'No', 'Yes', 'No', 'No', 'No', 'No');






