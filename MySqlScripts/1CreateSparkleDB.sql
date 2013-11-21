
# DROP database sparkle_app;

CREATE SCHEMA IF NOT EXISTS sparkle_app DEFAULT CHARACTER SET ascii ;

USE sparkle_app;

# DROP TABLE invoice_status;

CREATE TABLE IF NOT EXISTS invoice_status (
  invoice_status_dbid BIGINT UNSIGNED NOT NULL,
  invoice_status_id VARCHAR(80) NOT NULL ,
  invoice_status_allow_changes_sw BOOLEAN NOT NULL DEFAULT FALSE ,
  invoice_status_desc VARCHAR(80) NULL ,
  invoice_status_created_dt TIMESTAMP NULL,
  invoice_status_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (invoice_status_dbid),
  INDEX index_invoice_status_id (invoice_status_id ASC) );

DROP TRIGGER IF EXISTS invoice_status_before_insert;
delimiter |
CREATE TRIGGER invoice_status_before_insert BEFORE INSERT ON invoice_status
  FOR EACH ROW BEGIN
    IF NEW.invoice_status_created_dt IS NULL THEN
		SET NEW.invoice_status_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

CREATE TABLE IF NOT EXISTS invoice_behavior (
  invoice_behavior_dbid BIGINT UNSIGNED NOT NULL,
  invoice_behavior_id VARCHAR(80) NOT NULL ,
  invoice_behavior_bill_all_jobs_together_sw BOOLEAN NOT NULL DEFAULT TRUE ,
  invoice_behavior_bill_jobs_with_same_name_together_sw BOOLEAN NOT NULL DEFAULT FALSE ,
  invoice_behavior_bill_jobs_seperately_sw BOOLEAN NOT NULL DEFAULT FALSE ,
  invoice_behavior_desc VARCHAR(80) NULL ,
  invoice_behavior_created_dt TIMESTAMP NULL,
  invoice_behavior_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (invoice_behavior_dbid),
  INDEX index_invoice_behavior_id (invoice_behavior_id ASC) );

DROP TRIGGER IF EXISTS invoice_behavior_before_insert;
delimiter |
CREATE TRIGGER invoice_behavior_before_insert BEFORE INSERT ON invoice_behavior
  FOR EACH ROW BEGIN
    IF NEW.invoice_behavior_created_dt IS NULL THEN
		SET NEW.invoice_behavior_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

CREATE TABLE IF NOT EXISTS invoice_frequency (
  invoice_frequency_dbid BIGINT UNSIGNED NOT NULL,
  invoice_frequency_id VARCHAR(80) NOT NULL ,
  invoice_frequency_weekly_sw BOOLEAN NOT NULL DEFAULT TRUE ,
  invoice_frequency_montly_sw BOOLEAN NOT NULL DEFAULT FALSE ,
  invoice_frequency_desc VARCHAR(80) NULL ,
  invoice_frequency_created_dt TIMESTAMP NULL,
  invoice_frequency_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (invoice_frequency_dbid),
  INDEX index_invoice_frequency_id (invoice_frequency_id ASC) );

DROP TRIGGER IF EXISTS invoice_frequency_before_insert;
delimiter |
CREATE TRIGGER invoice_frequency_before_insert BEFORE INSERT ON invoice_frequency
  FOR EACH ROW BEGIN
    IF NEW.invoice_frequency_created_dt IS NULL THEN
		SET NEW.invoice_frequency_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

CREATE TABLE IF NOT EXISTS job_frequency (
  job_frequency_dbid BIGINT UNSIGNED NOT NULL,
  job_frequency_id VARCHAR(80) NOT NULL ,
  job_frequency_weekly_sw BOOLEAN NOT NULL DEFAULT TRUE ,
  job_frequency_biweekly_sw BOOLEAN NOT NULL DEFAULT FALSE ,
  job_frequency_montly_sw BOOLEAN NOT NULL DEFAULT FALSE ,
  job_frequency_on_call_sw BOOLEAN NOT NULL DEFAULT FALSE ,
  job_frequency_desc VARCHAR(80) NULL ,
  job_frequency_created_dt TIMESTAMP NULL,
  job_frequency_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (job_frequency_dbid),
  INDEX index_job_frequency_id (job_frequency_id ASC) );

DROP TRIGGER IF EXISTS job_frequency_before_insert;
delimiter |
CREATE TRIGGER job_frequency_before_insert BEFORE INSERT ON job_frequency
  FOR EACH ROW BEGIN
    IF NEW.job_frequency_created_dt IS NULL THEN
		SET NEW.job_frequency_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

# DROP TABLE payment_type

CREATE TABLE IF NOT EXISTS payment_type (
  payment_type_dbid BIGINT UNSIGNED NOT NULL,
  payment_type_id VARCHAR(80) NOT NULL ,
  payment_type_cash_on_hand_sw BOOLEAN NOT NULL DEFAULT FALSE ,
  payment_type_desc VARCHAR(80) NULL ,
  payment_type_created_dt TIMESTAMP NULL,
  payment_type_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (payment_type_dbid),
  INDEX index_payment_type_id (payment_type_id ASC) );

DROP TRIGGER IF EXISTS payment_type_before_insert;
delimiter |
CREATE TRIGGER payment_type_before_insert BEFORE INSERT ON payment_type
  FOR EACH ROW BEGIN
    IF NEW.payment_type_created_dt IS NULL THEN
		SET NEW.payment_type_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

# DROP TABLE jobcode;

CREATE TABLE IF NOT EXISTS jobcode (
  jobcode_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  jobcode_deleted_sw BOOLEAN NOT NULL DEFAULT FALSE ,
  jobcode_deleted_dt TIMESTAMP NULL ,
  jobcode_deleted_unique_key VARCHAR(100) NOT NULL UNIQUE DEFAULT '?',
  jobcode_id VARCHAR(80) NOT NULL,
  jobcode_desc VARCHAR(80) NULL ,
  jobcode_short_desc VARCHAR(80) NULL ,
  jobcode_category VARCHAR(80) NULL ,
  jobcode_created_dt TIMESTAMP NULL,
  jobcode_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (jobcode_dbid),
  INDEX index_jobcode_id (jobcode_id ASC) );

DROP TRIGGER IF EXISTS jobcode_before_insert;
delimiter |
CREATE TRIGGER jobcode_before_insert BEFORE INSERT ON jobcode
  FOR EACH ROW BEGIN
    IF NEW.jobcode_deleted_sw THEN
      IF NEW.jobcode_deleted_dt IS NULL THEN
        SET NEW.jobcode_deleted_dt = NOW();
      END IF;
      SET NEW.jobcode_deleted_unique_key = CONCAT_WS(' ', NEW.jobcode_id, NEW.jobcode_deleted_dt);
    ELSE
      SET NEW.jobcode_deleted_dt = NULL;
      SET NEW.jobcode_deleted_unique_key = NEW.jobcode_id;
    END IF;
    IF NEW.jobcode_created_dt IS NULL THEN
		SET NEW.jobcode_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

DROP TRIGGER IF EXISTS jobcode_before_update;
delimiter |
CREATE TRIGGER jobcode_before_update BEFORE UPDATE ON jobcode
  FOR EACH ROW BEGIN
    IF NEW.jobcode_deleted_sw AND NOT OLD.jobcode_deleted_sw THEN
      IF NEW.jobcode_deleted_dt IS NULL THEN
        SET NEW.jobcode_deleted_dt = NOW();
      END IF;
      SET NEW.jobcode_deleted_unique_key = CONCAT_WS(' ', NEW.jobcode_id, NEW.jobcode_deleted_dt);
    ELSE
      IF NOT NEW.jobcode_deleted_sw THEN
        SET NEW.jobcode_deleted_dt = NULL;
        SET NEW.jobcode_deleted_unique_key = NEW.jobcode_id;
      END IF;
    END IF;
  END;
|
delimiter ;

# DROP TABLE customer;

CREATE TABLE IF NOT EXISTS customer (
  customer_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  customer_deleted_sw BOOLEAN NOT NULL DEFAULT FALSE,
  customer_deleted_dt TIMESTAMP NULL,
  customer_deleted_unique_key VARCHAR(100) NOT NULL UNIQUE DEFAULT '?',
  customer_id VARCHAR(80) NOT NULL, ##ST col1
  customer_attention VARCHAR(80) NULL , ##ST col2
  customer_name VARCHAR(80) NULL , ##ST col3
  customer_addr1 VARCHAR(80) NULL , ##ST col4
  customer_addr2 VARCHAR(80) NULL , ##ST col5
  customer_city VARCHAR(80) NULL , ##ST col6
  customer_state VARCHAR(2) NULL , ##ST col7
  customer_zip VARCHAR(10) NULL , ##ST col8
  customer_phone1_desc VARCHAR(20) NULL DEFAULT 'P1',
  customer_phone1 VARCHAR(20) NULL , ##ST col9
  customer_phone2_desc VARCHAR(20) NULL DEFAULT 'P2',
  customer_phone2 VARCHAR(20) NULL , ##ST col10
  customer_phone3_desc VARCHAR(20) NULL DEFAULT 'P3',
  customer_phone3 VARCHAR(20) NULL , ##ST col11
  customer_email1_desc VARCHAR(20) NULL DEFAULT 'Email1',
  customer_email1 VARCHAR(40) NULL , ##ST col12 (was telix)
  customer_email2_desc VARCHAR(20) NULL DEFAULT 'Email2',
  customer_email2 VARCHAR(40) NULL ,
  customer_notes TEXT NULL , ##ST col13
  customer_ar_notes TEXT NULL ,
  customer_net VARCHAR(20) NULL , ##ST col14
  customer_po VARCHAR(80) NULL , ##ST col15
  customer_invoice_behavior_dbid BIGINT UNSIGNED NOT NULL DEFAULT 3100,
  customer_invoice_frequency_dbid BIGINT UNSIGNED NOT NULL DEFAULT 4100,
  customer_message_dbid BIGINT UNSIGNED NULL , ##ST col16
  customer_created_dt TIMESTAMP NULL,
  customer_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (customer_dbid) ,
  INDEX index_customer_id (customer_id ASC),
  INDEX index_customer_Name (customer_name ASC) );

DROP TRIGGER IF EXISTS customer_before_insert;
delimiter |
CREATE TRIGGER customer_before_insert BEFORE INSERT ON customer
  FOR EACH ROW BEGIN
    IF NEW.customer_deleted_sw THEN
      IF NEW.customer_deleted_dt IS NULL THEN
        SET NEW.customer_deleted_dt = NOW();
      END IF;
      SET NEW.customer_deleted_unique_key = CONCAT_WS(' ', NEW.customer_id, NEW.customer_deleted_dt);
    ELSE
      SET NEW.customer_deleted_dt = NULL;
      SET NEW.customer_deleted_unique_key = NEW.customer_id;
    END IF;
    IF NEW.customer_created_dt IS NULL THEN
		SET NEW.customer_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

DROP TRIGGER IF EXISTS customer_before_update;
delimiter |
CREATE TRIGGER customer_before_update BEFORE UPDATE ON customer
  FOR EACH ROW BEGIN
    IF NEW.customer_deleted_sw AND NOT OLD.customer_deleted_sw THEN
      IF NEW.customer_deleted_dt IS NULL THEN
        SET NEW.customer_deleted_dt = NOW();
      END IF;
      SET NEW.customer_deleted_unique_key = CONCAT_WS(' ', NEW.customer_id, NEW.customer_deleted_dt);
    ELSE
      IF NOT NEW.customer_deleted_sw THEN
        SET NEW.customer_deleted_dt = NULL;
        SET NEW.customer_deleted_unique_key = NEW.customer_id;
      END IF;
    END IF;
  END;
|
delimiter ;


# DROP TABLE job;

CREATE TABLE IF NOT EXISTS job (
  job_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  job_customer_dbid BIGINT NOT NULL, ##col1
  job_deleted_sw BOOLEAN NOT NULL DEFAULT FALSE,
  job_deleted_dt TIMESTAMP NULL,
  job_deleted_unique_key VARCHAR(100) NOT NULL UNIQUE DEFAULT '?',
  job_id VARCHAR(80) NOT NULL, ## col2
  job_attention VARCHAR(80) NULL ,
  job_name VARCHAR(80) NULL , ##ST col8
  job_addr1 VARCHAR(80) NULL , ##ST col3
  job_addr2 VARCHAR(80) NULL , 
  job_city VARCHAR(80) NULL ,
  job_state VARCHAR(2) NULL ,
  job_zip VARCHAR(10) NULL ,
  job_notes TEXT NULL , 
  job_phone1_desc VARCHAR(20) NULL DEFAULT 'P1',
  job_phone1 VARCHAR(20) NULL ,
  job_phone2_desc VARCHAR(20) NULL DEFAULT 'P2',
  job_phone2 VARCHAR(20) NULL , 
  job_phone3_desc VARCHAR(20) NULL DEFAULT 'P3',
  job_phone3 VARCHAR(20) NULL , 
  job_email1_desc VARCHAR(20) NULL DEFAULT 'Email1',
  job_email1 VARCHAR(40) NULL ,
  job_email2_desc VARCHAR(20) NULL DEFAULT 'Email2',
  job_email2 VARCHAR(40) NULL ,
  job_job_frequency_dbid BIGINT NOT NULL DEFAULT 5900,
  job_fixed_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##ST col7
  job_totwtm_amt INT NOT NULL DEFAULT 0, ##ST col9
  job_totjtm_amt INT NOT NULL DEFAULT 0, ##ST col10
  job_totwfe_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##ST col11
  job_totjfe_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##ST col12
  job_created_dt TIMESTAMP NULL,
  job_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (job_dbid),
UNIQUE KEY id_unique (job_customer_dbid,job_id),
  INDEX index_unique(job_customer_dbid,job_id ASC),
  INDEX index_job_customer_dbid(job_customer_dbid ASC),
  INDEX index_job_id(job_id ASC) );

DROP TRIGGER IF EXISTS job_before_insert;
delimiter |
CREATE TRIGGER job_before_insert BEFORE INSERT ON job
  FOR EACH ROW BEGIN
    IF NEW.job_deleted_sw THEN
      IF NEW.job_deleted_dt IS NULL THEN
        SET NEW.job_deleted_dt = NOW();
      END IF;
      SET NEW.job_deleted_unique_key = CONCAT_WS(' ', NEW.job_id, NEW.job_deleted_dt);
    ELSE
      SET NEW.job_deleted_dt = NULL;
      SET NEW.job_deleted_unique_key = NEW.job_id;
    END IF;
    IF NEW.job_created_dt IS NULL THEN
		SET NEW.job_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

DROP TRIGGER IF EXISTS job_before_update;
delimiter |
CREATE TRIGGER job_before_update BEFORE UPDATE ON job
  FOR EACH ROW BEGIN
    IF NEW.job_deleted_sw AND NOT OLD.job_deleted_sw THEN
      IF NEW.job_deleted_dt IS NULL THEN
        SET NEW.job_deleted_dt = NOW();
      END IF;
      SET NEW.job_deleted_unique_key = CONCAT_WS(' ', NEW.job_id, NEW.job_deleted_dt);
    ELSE
      IF NOT NEW.job_deleted_sw THEN
        SET NEW.job_deleted_dt = NULL;
        SET NEW.job_deleted_unique_key = NEW.job_id;
      END IF;
    END IF;
  END;
|
delimiter ;

# DROP TABLE job_dtl;

CREATE TABLE IF NOT EXISTS job_dtl (
  job_dtl_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  job_dtl_job_dbid BIGINT NOT NULL,
  job_dtl_jobcode_dbid BIGINT NOT NULL,
  job_dtl_deleted_sw BOOLEAN NOT NULL DEFAULT FALSE,
  job_dtl_deleted_dt TIMESTAMP NULL,
  job_dtl_desc TEXT NULL, ## col4
  job_dtl_freq_cd VARCHAR(20) NULL, ##col5
  job_dtl_vtime_nbr INT NOT NULL DEFAULT 0, ## col6
  job_dtl_fee_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##col7
  job_dtl_empl_cd VARCHAR(20) NULL, ##col8
  job_dtl_last_dt DATE NULL, ##col9
  job_dtl_instr_text TEXT NULL, ## col112
  job_dtl_mandate_cd VARCHAR(20) NULL, ##col14
  job_dtl_a_day_cd VARCHAR(20) NULL, ##col15
  job_dtl_ap_pm_cd VARCHAR(20) NULL, ##col16
  job_dtl_prcnt_amt DECIMAL(21,4) NOT NULL DEFAULT 0, ##col17
  job_dtl_ow_cd VARCHAR(20) NULL, ##col19
  job_dtl_alt_pay_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##col120
  job_dtl_paytype_cd VARCHAR(20) NULL, ##col21
  job_dtl_srt INTEGER NOT NULL DEFAULT 0, ##ST col18
  job_dtl_typesrt INTEGER NOT NULL DEFAULT 0, ##ST col22
  job_dtl_created_dt TIMESTAMP NULL,
  job_dtl_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (job_dtl_dbid),
  INDEX index_job_dtl_job_dbid(job_dtl_job_dbid ASC),
  INDEX index_job_dtl_jobcode_dbid(job_dtl_jobcode_dbid ASC) );

DROP TRIGGER IF EXISTS job_dtl_before_insert;
delimiter |
CREATE TRIGGER job_dtl_before_insert BEFORE INSERT ON job_dtl
  FOR EACH ROW BEGIN
    IF NEW.job_dtl_deleted_sw THEN
      IF NEW.job_dtl_deleted_dt IS NULL THEN
        SET NEW.job_dtl_deleted_dt = NOW();
      END IF;
    ELSE
      SET NEW.job_dtl_deleted_dt = NULL;
    END IF;
    IF NEW.job_dtl_created_dt IS NULL THEN
		SET NEW.job_dtl_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

DROP TRIGGER IF EXISTS job_dtl_before_update;
delimiter |
CREATE TRIGGER job_dtl_before_update BEFORE UPDATE ON job_dtl
  FOR EACH ROW BEGIN
    IF NEW.job_dtl_deleted_sw AND NOT OLD.job_dtl_deleted_sw THEN
      IF NEW.job_dtl_deleted_dt IS NULL THEN
        SET NEW.job_dtl_deleted_dt = NOW();
      END IF;
    ELSE
      IF NOT NEW.job_dtl_deleted_sw THEN
        SET NEW.job_dtl_deleted_dt = NULL;
      END IF;
    END IF;
  END;
|
delimiter ;

# DROP TABLE messages

CREATE TABLE IF NOT EXISTS message (
  message_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  message_deleted_sw BOOLEAN NOT NULL DEFAULT FALSE,
  message_deleted_dt TIMESTAMP NULL,
  message_deleted_unique_key VARCHAR(100) NOT NULL UNIQUE DEFAULT '?',
  message_id VARCHAR(20) NOT NULL, ##ST col3
  message_desc TEXT NULL, ##ST col8
  message_created_dt TIMESTAMP NULL,
  message_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (message_dbid) ,
  INDEX index_message_id (message_id ASC) );

DROP TRIGGER IF EXISTS message_before_insert;
delimiter |
CREATE TRIGGER message_before_insert BEFORE INSERT ON message
  FOR EACH ROW BEGIN
    IF NEW.message_deleted_sw THEN
      IF NEW.message_deleted_dt IS NULL THEN
        SET NEW.message_deleted_dt = NOW();
      END IF;
      SET NEW.message_deleted_unique_key = CONCAT_WS(' ', NEW.message_id, NEW.message_deleted_dt);
    ELSE
      SET NEW.message_deleted_dt = NULL;
      SET NEW.message_deleted_unique_key = NEW.message_id;
    END IF;
    IF NEW.message_created_dt IS NULL THEN
		SET NEW.message_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

DROP TRIGGER IF EXISTS message_before_update;
delimiter |
CREATE TRIGGER message_before_update BEFORE UPDATE ON message
  FOR EACH ROW BEGIN
    IF NEW.message_deleted_sw AND NOT OLD.message_deleted_sw THEN
      IF NEW.message_deleted_dt IS NULL THEN
        SET NEW.message_deleted_dt = NOW();
      END IF;
      SET NEW.message_deleted_unique_key = CONCAT_WS(' ', NEW.message_id, NEW.message_deleted_dt);
    ELSE
      IF NOT NEW.message_deleted_sw THEN
        SET NEW.message_deleted_dt = NULL;
        SET NEW.message_deleted_unique_key = NEW.message_id;
      END IF;
    END IF;
  END;
|
delimiter ;

# DROP TABLE invoice;

CREATE TABLE IF NOT EXISTS invoice (
  invoice_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  invoice_customer_dbid BIGINT UNSIGNED NOT NULL, ##must select against ST col1 (cus#) to populate
  invoice_invoice_status_dbid BIGINT UNSIGNED NOT NULL DEFAULT 2100,
  invoice_id VARCHAR(20) NOT NULL, ##ST col3
  invoice_dt DATE NOT NULL , ##ST col2
  invoice_desc TEXT NULL, ##ST col8
  invoice_bill_to_attention VARCHAR(80) NULL , 
  invoice_bill_to_name VARCHAR(80) NULL ,
  invoice_bill_to_addr1 VARCHAR(80) NULL , 
  invoice_bill_to_addr2 VARCHAR(80) NULL , 
  invoice_bill_to_city VARCHAR(80) NULL , 
  invoice_bill_to_state VARCHAR(2) NULL ,
  invoice_bill_to_zip VARCHAR(10) NULL , 
  invoice_bill_to_phone1_desc VARCHAR(20) NULL,
  invoice_bill_to_phone1 VARCHAR(20) NULL , 
  invoice_bill_to_phone2_desc VARCHAR(20) NULL,
  invoice_bill_to_phone2 VARCHAR(20) NULL ,
  invoice_bill_to_phone3_desc VARCHAR(20) NULL ,
  invoice_bill_to_phone3 VARCHAR(20) NULL ,
  invoice_bill_to_email1_desc VARCHAR(20) NULL,
  invoice_bill_to_email1 VARCHAR(40) NULL ,
  invoice_bill_to_email2_desc VARCHAR(20) NULL ,
  invoice_bill_to_email2 VARCHAR(40) NULL ,
  invoice_bill_to_po VARCHAR(80) NULL ,
  invoice_total_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##ST col4
  invoice_received_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##ST col7
  invoice_balance_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##ST col9
  invoice_posted_dt DATE NULL , ##ST col10
  invoice_message TEXT NULL, ##ST col8
  invoice_created_dt TIMESTAMP NULL,
  invoice_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (invoice_dbid) ,
  INDEX index_invoice_customer_dbid (invoice_customer_dbid ASC),
  INDEX index_invoice_dt (invoice_dt ASC),
  INDEX index_invoice_id (invoice_id ASC),
  INDEX index_invoice_invoice_status_dbid (invoice_invoice_status_dbid ASC) );

DROP TRIGGER IF EXISTS invoice_before_insert;
delimiter |
CREATE TRIGGER invoice_before_insert BEFORE INSERT ON invoice
  FOR EACH ROW BEGIN
    IF NEW.invoice_created_dt IS NULL THEN
		SET NEW.invoice_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

# DROP TABLE invoice_dtl;

CREATE TABLE IF NOT EXISTS invoice_dtl (
  invoice_dtl_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  invoice_dtl_invoice_dbid BIGINT UNSIGNED NOT NULL, ##must select against ST col2 (inv#) to populate
  invoice_dtl_job_dbid BIGINT UNSIGNED NULL, ##must select against ST col16 (job#) to populate
  invoice_dtl_sold_qty DECIMAL(21,2) NOT NULL DEFAULT 0, ##ST col3
  invoice_dtl_item_txt TEXT NULL , ##ST col4
  invoice_dtl_unit_cost_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##ST col5
  invoice_dtl_sold_dt DATE NULL , ##ST col6
  invoice_dtl_location TEXT NULL, ##ST col7
  invoice_dtl_bill_cd VARCHAR(20) NULL , ##ST col8
  invoice_dtl_serv_cd VARCHAR(20) NULL , ##ST col9
  invoice_dtl_a_day VARCHAR(20) NULL , ##ST col10
  invoice_dtl_empl VARCHAR(20) NULL , ##ST col11
  invoice_dtl_am_pm VARCHAR(20) NULL , ##ST col12
  invoice_dtl_prcnt_amt DECIMAL(21,4) NOT NULL DEFAULT 0, ##ST col14
  invoice_dtl_pd_date DATE NULL , ##ST col15
  invoice_dtl_ow_cd VARCHAR(20) NULL , ##ST col17
  invoice_dtl_altpay_amt DECIMAL(21,2) NOT NULL DEFAULT 0, ##ST col18
  invoice_dtl_tdate DATE NULL , ##ST col19
  invoice_dtl_phone1 VARCHAR(20) NULL , ##ST col20
  invoice_dtl_ytype VARCHAR(20) NULL , ##ST col121
  invoice_dtl_pay_type VARCHAR(20) NULL , ##ST col22
  invoice_dtl_srt INTEGER NOT NULL DEFAULT 0, ##ST col13
  invoice_dtl_created_dt TIMESTAMP NULL,
  invoice_dtl_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (invoice_dtl_dbid),
  INDEX index_invoice_dtl_invoice_dbid (invoice_dtl_invoice_dbid ASC),
  INDEX index_invoice_dtl_job_dbid (invoice_dtl_job_dbid ASC)) ;

DROP TRIGGER IF EXISTS invoice_dtl_before_insert;
delimiter |
CREATE TRIGGER invoice_dtl_before_insert BEFORE INSERT ON invoice_dtl
  FOR EACH ROW BEGIN
    IF NEW.invoice_dtl_created_dt IS NULL THEN
		SET NEW.invoice_dtl_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

# DROP TABLE payment_dtl; DROP TABLE payment;

CREATE TABLE IF NOT EXISTS payment (
  payment_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  payment_customer_dbid BIGINT UNSIGNED NOT NULL, #col8
  payment_deleted_sw BOOLEAN NOT NULL DEFAULT FALSE,
  payment_deleted_dt TIMESTAMP NULL,
  payment_desc_txt VARCHAR(80) NULL , #col4
  payment_refer_txt VARCHAR(80) NULL , # for check number
  payment_amt DECIMAL(21,2) NOT NULL DEFAULT 0, #col5
  payment_dt DATE NULL , #col3
  payment_created_dt TIMESTAMP NULL,
  payment_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
PRIMARY KEY (payment_dbid),
  INDEX index_payment_customer_dbid (payment_customer_dbid ASC) );

DROP TRIGGER IF EXISTS  payment_before_insert;
delimiter |
CREATE TRIGGER  payment_before_insert BEFORE INSERT ON  payment
  FOR EACH ROW BEGIN
    IF NEW.payment_created_dt IS NULL THEN
		SET NEW.payment_created_dt = NOW();
	END IF;
  END;
|
delimiter ;


CREATE TABLE IF NOT EXISTS payment_dtl (
  payment_dtl_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  payment_dtl_payment_dbid BIGINT UNSIGNED NOT NULL, 
  payment_dtl_invoice_dbid BIGINT UNSIGNED NULL, 
  payment_dtl_payment_type_dbid BIGINT UNSIGNED NOT NULL DEFAULT 100 , #col6
  payment_dtl_applied_amt DECIMAL(21,2) NOT NULL DEFAULT 0,
  payment_dtl_job_state VARCHAR(20) NULL DEFAULT 'WA', #col9
  payment_dtl_desc VARCHAR(80),
  payment_dtl_created_dt TIMESTAMP NULL,
  payment_dtl_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP , 
PRIMARY KEY (payment_dtl_dbid),
  INDEX index_payment_dtl_payment_dbid (payment_dtl_payment_dbid ASC),
  INDEX index_payment_dtl_invoice_dbid (payment_dtl_invoice_dbid ASC) );

DROP TRIGGER IF EXISTS  payment_dtl_before_insert;
delimiter |
CREATE TRIGGER  payment_dtl_before_insert BEFORE INSERT ON  payment_dtl
  FOR EACH ROW BEGIN
    IF NEW.payment_dtl_created_dt IS NULL THEN
		SET NEW.payment_dtl_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

# DROP TABLE user;

CREATE TABLE IF NOT EXISTS user (
  user_dbid BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
  user_deleted_sw BOOLEAN NOT NULL DEFAULT FALSE,
  user_deleted_dt TIMESTAMP NULL,
  user_deleted_unique_key VARCHAR(100) NOT NULL UNIQUE DEFAULT '?',
  user_id VARCHAR(20) NOT NULL,
  user_name VARCHAR(40) NOT NULL,
  user_access VARCHAR(40) NOT NULL DEFAULT 'user',
  user_password VARCHAR(40) NOT NULL DEFAULT 'abc123',
  user_created_dt TIMESTAMP NULL,
  user_last_modified_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP , 
PRIMARY KEY (user_dbid) ,
  INDEX index_user_id (user_id ASC) );

DROP TRIGGER IF EXISTS user_before_insert;
delimiter |
CREATE TRIGGER user_before_insert BEFORE INSERT ON user
  FOR EACH ROW BEGIN
    IF NEW.user_deleted_sw THEN
      IF NEW.user_deleted_dt IS NULL THEN
        SET NEW.user_deleted_dt = NOW();
      END IF;
      SET NEW.user_deleted_unique_key = CONCAT_WS(' ', NEW.user_id, NEW.user_deleted_dt);
    ELSE
      SET NEW.user_deleted_dt = NULL;
      SET NEW.user_deleted_unique_key = NEW.user_id;
    END IF;
    IF NEW.user_created_dt IS NULL THEN
		SET NEW.user_created_dt = NOW();
	END IF;
  END;
|
delimiter ;

DROP TRIGGER IF EXISTS user_before_update;
delimiter |
CREATE TRIGGER user_before_update BEFORE UPDATE ON user
  FOR EACH ROW BEGIN
    IF NEW.user_deleted_sw AND NOT OLD.user_deleted_sw THEN
      IF NEW.user_deleted_dt IS NULL THEN
        SET NEW.user_deleted_dt = NOW();
      END IF;
      SET NEW.user_deleted_unique_key = CONCAT_WS(' ', NEW.user_id, NEW.user_deleted_dt);
    ELSE
      IF NOT NEW.user_deleted_sw THEN
        SET NEW.user_deleted_dt = NULL;
        SET NEW.user_deleted_unique_key = NEW.user_id;
      END IF;
    END IF;
  END;
|
delimiter ;

####################################################################################
## create functions
####################################################################################

DROP FUNCTION IF EXISTS fn_job_frequency_weekly;
DELIMITER $$
CREATE FUNCTION fn_job_frequency_weekly()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 5100;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_job_frequency_biweekly;
DELIMITER $$
CREATE FUNCTION fn_job_frequency_biweekly()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 5200;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_job_frequency_monthly;
DELIMITER $$
CREATE FUNCTION fn_job_frequency_monthly()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 5300;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_job_frequency_on_call;
DELIMITER $$
CREATE FUNCTION fn_job_frequency_on_call()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 5900;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_invoice_frequency_weekly;
DELIMITER $$
CREATE FUNCTION fn_invoice_frequency_weekly()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 4100;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_invoice_frequency_monthly;
DELIMITER $$
CREATE FUNCTION fn_invoice_frequency_monthly()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 4200;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_invoice_behavior_combine_all;
DELIMITER $$
CREATE FUNCTION fn_invoice_behavior_combine_all()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 3100;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_invoice_behavior_combine_by_name;
DELIMITER $$
CREATE FUNCTION fn_invoice_behavior_combine_by_name()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 3200;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_invoice_behavior_combine_same_job;
DELIMITER $$
CREATE FUNCTION fn_invoice_behavior_combine_same_job()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 3300;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_invoice_status_open;
DELIMITER $$
CREATE FUNCTION fn_invoice_status_open()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 2100;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_invoice_status_printed;
DELIMITER $$
CREATE FUNCTION fn_invoice_status_printed()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 2200;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_invoice_status_closed;
DELIMITER $$
CREATE FUNCTION fn_invoice_status_closed()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 2300;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_invoice_status_voided;
DELIMITER $$
CREATE FUNCTION fn_invoice_status_voided()
	RETURNS BIGINT
    NOT DETERMINISTIC
BEGIN
	RETURN 2400;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_get_invoice_balance_due;
DELIMITER $$
CREATE FUNCTION fn_get_invoice_balance_due(v_invoice_dbid BIGINT UNSIGNED)

	RETURNS DECIMAL(21,2)

BEGIN

	DECLARE v_total_payments DECIMAL(21,2);
    DECLARE v_total_invoice DECIMAL(21,2);

	SELECT IF(SUM(payment_dtl_applied_amt) IS NULL, 0, SUM(payment_dtl_applied_amt))
		INTO v_total_payments
		FROM payment_dtl 
		WHERE payment_dtl.payment_dtl_invoice_dbid = v_invoice_dbid;

	IF v_total_payments IS NULL THEN 
		SET v_total_payments = 0;
	END IF;

    SELECT invoice_total_amt INTO v_total_invoice FROM invoice WHERE invoice_dbid = v_invoice_dbid;

	IF v_total_invoice IS NULL THEN 
		SET v_total_invoice = 0;
	END IF;

	RETURN v_total_invoice - v_total_payments;
END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_get_invoice_balance_due_aged;
DELIMITER $$
CREATE FUNCTION fn_get_invoice_balance_due_aged(v_invoice_dbid BIGINT UNSIGNED, v_start_days INT, v_end_days INT)

	RETURNS DECIMAL(21,2)

BEGIN

	DECLARE v_balance_due DECIMAL(21,2) DEFAULT 0;
	DECLARE v_days_aged INT;

    SELECT TIMESTAMPDIFF(DAY,invoice_dt,CURDATE()) INTO v_days_aged FROM invoice WHERE invoice_dbid = v_invoice_dbid;

	IF v_days_aged >= v_start_days AND v_days_aged <= v_end_days THEN 
		SET v_balance_due = fn_get_invoice_balance_due(v_invoice_dbid);
	END IF;

	RETURN v_balance_due;

END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_get_customer_invoice_count;
DELIMITER $$
CREATE FUNCTION fn_get_customer_invoice_count(v_customer_dbid BIGINT UNSIGNED)

	RETURNS INT

BEGIN

    DECLARE v_invoice_count INT;

    SELECT COUNT(invoice_dbid) INTO v_invoice_count FROM invoice WHERE invoice_customer_dbid = v_customer_dbid;

	RETURN v_invoice_count;

END;
$$
DELIMITER ;

DROP FUNCTION IF EXISTS fn_get_customer_job_count;
DELIMITER $$
CREATE FUNCTION fn_get_customer_job_count(v_customer_dbid BIGINT UNSIGNED)

	RETURNS INT

BEGIN

    DECLARE v_job_count INT;

    SELECT COUNT(job_dbid) INTO v_job_count FROM job WHERE job_customer_dbid = v_customer_dbid;

	RETURN v_job_count;

END;
$$
DELIMITER ;

####################################################################################
## create views
####################################################################################

CREATE OR REPLACE VIEW ar_ageing_view AS
SELECT
  customer_dbid ,
  customer_id ,
  invoice_dbid ,
  invoice_id , 
  invoice_dt ,
  invoice_total_amt ,
  TIMESTAMPDIFF(DAY,invoice_dt,CURDATE()) AS view_days_aged ,
  fn_get_invoice_balance_due_aged(invoice_dbid,-9999,30) AS view_balance_current ,
  fn_get_invoice_balance_due_aged(invoice_dbid,31,60) AS view_balance_31_60 ,
  fn_get_invoice_balance_due_aged(invoice_dbid,61,90) AS view_balance_61_90 ,
  fn_get_invoice_balance_due_aged(invoice_dbid,91,120) AS view_balance_91_120 ,
  fn_get_invoice_balance_due_aged(invoice_dbid,121,9999) AS view_balance_over_120 ,
  invoice_posted_dt ,
  invoice_status_dbid ,
  invoice_status_id,
  invoice_desc , 
  invoice_bill_to_attention, 
  invoice_bill_to_name,
  invoice_bill_to_addr1, 
  invoice_bill_to_addr2, 
  invoice_bill_to_city, 
  invoice_bill_to_state,
  invoice_bill_to_zip,
  invoice_bill_to_phone1_desc,
  invoice_bill_to_phone1, 
  invoice_bill_to_phone2_desc,
  invoice_bill_to_phone2,
  invoice_bill_to_phone3_desc,
  invoice_bill_to_phone3,
  invoice_bill_to_email1_desc,
  invoice_bill_to_email1,
  invoice_bill_to_email2_desc,
  invoice_bill_to_email2,
  invoice_bill_to_po, 
  customer_attention,
  customer_name ,
  customer_addr1 ,
  customer_addr2 ,
  customer_city ,
  customer_state ,
  customer_zip ,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_net ,
  customer_po ,
  customer_ar_notes
FROM invoice
LEFT JOIN customer ON customer.customer_dbid = invoice.invoice_customer_dbid
LEFT JOIN invoice_status ON invoice_status.invoice_status_dbid = invoice.invoice_invoice_status_dbid
WHERE invoice_status_dbid = fn_invoice_status_printed();

CREATE OR REPLACE VIEW ar_collections_view AS
SELECT
  customer_dbid ,
  customer_id ,
  invoice_dbid ,
  invoice_id , 
  invoice_dt ,
  invoice_total_amt ,
  TIMESTAMPDIFF(DAY,invoice_dt,CURDATE()) AS view_days_aged ,
  fn_get_invoice_balance_due_aged(invoice_dbid,31,45) AS view_balance_31_45 ,
  fn_get_invoice_balance_due_aged(invoice_dbid,46,60) AS view_balance_46_60 ,
  fn_get_invoice_balance_due_aged(invoice_dbid,61,90) AS view_balance_61_90 ,
  fn_get_invoice_balance_due_aged(invoice_dbid,91,9999) AS view_balance_over_90,
  invoice_posted_dt ,
  invoice_status_dbid ,
  invoice_status_id,
  invoice_desc , 
  invoice_bill_to_attention, 
  invoice_bill_to_name,
  invoice_bill_to_addr1, 
  invoice_bill_to_addr2, 
  invoice_bill_to_city, 
  invoice_bill_to_state,
  invoice_bill_to_zip,
  invoice_bill_to_phone1_desc,
  invoice_bill_to_phone1, 
  invoice_bill_to_phone2_desc,
  invoice_bill_to_phone2,
  invoice_bill_to_phone3_desc,
  invoice_bill_to_phone3,
  invoice_bill_to_email1_desc,
  invoice_bill_to_email1,
  invoice_bill_to_email2_desc,
  invoice_bill_to_email2,
  invoice_bill_to_po,
  customer_attention,
  customer_name ,
  customer_addr1 ,
  customer_addr2 ,
  customer_city ,
  customer_state ,
  customer_zip ,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_net ,
  customer_po ,
  customer_notes,
  customer_ar_notes
FROM invoice
LEFT JOIN customer ON customer.customer_dbid = invoice.invoice_customer_dbid
LEFT JOIN invoice_status ON invoice_status.invoice_status_dbid = invoice.invoice_invoice_status_dbid
WHERE invoice_status_dbid = fn_invoice_status_printed() AND fn_get_invoice_balance_due_aged(invoice_dbid,31,9999) <> 0.00;

CREATE OR REPLACE VIEW ar_collections_summary_view AS
SELECT
  customer_dbid,
  customer_id,
  customer_name,
  COUNT(invoice_dbid) AS view_invoice_count,
  SUM(fn_get_invoice_balance_due_aged(invoice_dbid,31,45)) AS view_balance_31_45 ,
  SUM(fn_get_invoice_balance_due_aged(invoice_dbid,46,60)) AS view_balance_46_60 ,
  SUM(fn_get_invoice_balance_due_aged(invoice_dbid,61,90)) AS view_balance_61_90 ,
  SUM(fn_get_invoice_balance_due_aged(invoice_dbid,91,9999)) AS view_balance_over_90,
  customer_notes,
  customer_ar_notes
FROM ar_collections_view
GROUP BY customer_dbid;

CREATE OR REPLACE VIEW customer_grid_view AS
SELECT
  customer_dbid,
  customer_deleted_sw,
  customer_deleted_dt,
  customer_id,
  customer_attention,
  customer_name,
  customer_addr1,
  customer_addr2,
  customer_city,
  customer_state,
  customer_zip,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_notes,
  customer_ar_notes,
  COUNT(invoice_dbid) as view_invoice_count,
  MAX(invoice_dt) AS view_last_invoice_dt,
  (SELECT count(*) FROM job WHERE job.job_customer_dbid = customer.customer_dbid) as view_job_count
FROM customer
LEFT JOIN invoice ON invoice.invoice_customer_dbid = customer.customer_dbid GROUP BY customer.customer_dbid;


CREATE OR REPLACE VIEW customer_view AS
SELECT
  customer_dbid ,
  customer_deleted_sw ,
  customer_deleted_dt ,
  customer_id ,
  customer_attention ,
  customer_name ,
  customer_addr1 ,
  customer_addr2 ,
  customer_city ,
  customer_state ,
  customer_zip ,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_notes ,
  customer_ar_notes,
  customer_net ,
  customer_po ,
  message_dbid,
  message_id,
  message_desc
FROM customer
LEFT JOIN message ON message.message_dbid = customer.customer_message_dbid;

CREATE OR REPLACE VIEW payment_view AS
SELECT
  payment_dbid,
  payment_deleted_sw,
  payment_deleted_dt,
  payment_desc_txt,
  payment_refer_txt,
  payment_amt,
  payment_dt,
  customer_dbid,
  customer_deleted_sw,
  customer_deleted_dt,
  customer_id,
  customer_attention,
  customer_name,
  customer_addr1,
  customer_addr2,
  customer_city,
  customer_state,
  customer_zip,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_notes,
  customer_ar_notes,
  customer_net,
  customer_po
FROM payment
LEFT JOIN customer ON customer.customer_dbid = payment.payment_customer_dbid;

CREATE OR REPLACE VIEW payment_dtl_view AS
SELECT
  payment_dtl_dbid,
  payment_dtl_payment_type_dbid,
  payment_dtl_applied_amt, 
  payment_dtl_job_state,
  payment_dtl_desc,
  payment_dbid,
  payment_deleted_sw,
  payment_deleted_dt,
  payment_desc_txt,
  payment_refer_txt,
  payment_amt,
  payment_dt,
  invoice_dbid,
  invoice_id, 
  invoice_dt,
  invoice_desc, 
  invoice_bill_to_attention, 
  invoice_bill_to_name,
  invoice_bill_to_addr1, 
  invoice_bill_to_addr2, 
  invoice_bill_to_city, 
  invoice_bill_to_state,
  invoice_bill_to_zip,
  invoice_bill_to_phone1_desc,
  invoice_bill_to_phone1, 
  invoice_bill_to_phone2_desc,
  invoice_bill_to_phone2,
  invoice_bill_to_phone3_desc,
  invoice_bill_to_phone3,
  invoice_bill_to_email1_desc,
  invoice_bill_to_email1,
  invoice_bill_to_email2_desc,
  invoice_bill_to_email2,
  invoice_bill_to_po, 
  invoice_total_amt, 
  invoice_received_amt,
  invoice_balance_amt,
  invoice_posted_dt,
  invoice_message,
  customer_dbid,
  customer_deleted_sw,
  customer_deleted_dt,
  customer_id,
  customer_attention,
  customer_name,
  customer_addr1,
  customer_addr2,
  customer_city,
  customer_state,
  customer_zip,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_notes,
  customer_ar_notes,
  customer_net,
  customer_po,
  invoice_status_dbid,
  invoice_status_id
FROM payment_dtl
LEFT JOIN payment ON payment.payment_dbid = payment_dtl.payment_dtl_payment_dbid
LEFT JOIN invoice ON invoice.invoice_dbid = payment_dtl.payment_dtl_invoice_dbid
LEFT JOIN invoice_status ON invoice_status.invoice_status_dbid = invoice.invoice_invoice_status_dbid
LEFT JOIN customer ON customer.customer_dbid = payment.payment_customer_dbid;


CREATE OR REPLACE VIEW invoice_view AS
SELECT
  invoice_dbid ,
  invoice_id , 
  invoice_dt ,
  invoice_desc , 
  invoice_bill_to_attention, 
  invoice_bill_to_name,
  invoice_bill_to_addr1, 
  invoice_bill_to_addr2, 
  invoice_bill_to_city, 
  invoice_bill_to_state,
  invoice_bill_to_zip,
  invoice_bill_to_phone1_desc,
  invoice_bill_to_phone1, 
  invoice_bill_to_phone2_desc,
  invoice_bill_to_phone2,
  invoice_bill_to_phone3_desc,
  invoice_bill_to_phone3,
  invoice_bill_to_email1_desc,
  invoice_bill_to_email1,
  invoice_bill_to_email2_desc,
  invoice_bill_to_email2,
  invoice_bill_to_po, 
  invoice_total_amt , 
  invoice_invoice_status_dbid , 
  invoice_received_amt ,
  invoice_balance_amt ,
  invoice_posted_dt ,
  invoice_message ,
  customer_dbid ,
  customer_deleted_sw ,
  customer_deleted_dt ,
  customer_id ,
  customer_attention ,
  customer_name ,
  customer_addr1 ,
  customer_addr2 ,
  customer_city ,
  customer_state ,
  customer_zip ,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_notes ,
  customer_ar_notes,
  customer_net ,
  customer_po ,
  invoice_status_dbid,
  invoice_status_id
FROM invoice
LEFT JOIN customer ON customer.customer_dbid = invoice.invoice_customer_dbid
LEFT JOIN invoice_status ON invoice_status.invoice_status_dbid = invoice.invoice_invoice_status_dbid;


CREATE OR REPLACE VIEW invoice_dtl_view AS
SELECT
  invoice_dtl_dbid ,
  invoice_dtl_sold_qty ,
  invoice_dtl_item_txt ,
  invoice_dtl_unit_cost_amt ,
  invoice_dtl_sold_dt ,
  invoice_dtl_location ,
  invoice_dtl_bill_cd ,
  invoice_dtl_serv_cd ,
  invoice_dtl_a_day ,
  invoice_dtl_empl ,
  invoice_dtl_am_pm ,
  invoice_dtl_prcnt_amt ,
  invoice_dtl_pd_date ,
  invoice_dtl_ow_cd ,
  invoice_dtl_altpay_amt ,
  invoice_dtl_tdate ,
  invoice_dtl_phone1 ,
  invoice_dtl_ytype ,
  invoice_dtl_pay_type ,
  invoice_dtl_srt ,
  invoice_dbid ,
  invoice_id , 
  invoice_dt ,
  invoice_desc , 
  invoice_bill_to_attention, 
  invoice_bill_to_name,
  invoice_bill_to_addr1, 
  invoice_bill_to_addr2, 
  invoice_bill_to_city, 
  invoice_bill_to_state,
  invoice_bill_to_zip,
  invoice_bill_to_phone1_desc,
  invoice_bill_to_phone1, 
  invoice_bill_to_phone2_desc,
  invoice_bill_to_phone2,
  invoice_bill_to_phone3_desc,
  invoice_bill_to_phone3,
  invoice_bill_to_email1_desc,
  invoice_bill_to_email1,
  invoice_bill_to_email2_desc,
  invoice_bill_to_email2,
  invoice_bill_to_po,
  invoice_total_amt , 
  invoice_invoice_status_dbid , 
  invoice_received_amt ,
  invoice_balance_amt ,
  invoice_posted_dt ,
  invoice_message ,
  job_dbid ,
  job_deleted_sw ,
  job_deleted_dt ,
  job_id ,
  job_attention,
  job_name ,
  job_addr1 ,
  job_addr2 , 
  job_city ,
  job_state ,
  job_zip ,
  job_notes, 
  job_phone1_desc,
  job_phone1,
  job_phone2_desc,
  job_phone2, 
  job_phone3_desc,
  job_phone3, 
  job_email1_desc,
  job_email1,
  job_email2_desc,
  job_email2,
  job_job_frequency_dbid ,
  job_fixed_amt ,
  job_totwtm_amt ,
  job_totjtm_amt ,
  job_totwfe_amt ,
  job_totjfe_amt ,
  customer_dbid ,
  customer_deleted_sw ,
  customer_deleted_dt ,
  customer_id ,
  customer_attention ,
  customer_name ,
  customer_addr1 ,
  customer_addr2 ,
  customer_city ,
  customer_state ,
  customer_zip ,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_notes ,
  customer_ar_notes,
  customer_net ,
  customer_po ,
  invoice_status_dbid,
  invoice_status_id
FROM invoice_dtl
LEFT JOIN invoice ON invoice.invoice_dbid = invoice_dtl.invoice_dtl_invoice_dbid
LEFT JOIN invoice_status ON invoice_status.invoice_status_dbid = invoice.invoice_invoice_status_dbid
LEFT JOIN job ON job.job_dbid = invoice_dtl.invoice_dtl_job_dbid
LEFT JOIN customer ON customer.customer_dbid = invoice.invoice_customer_dbid;

CREATE OR REPLACE VIEW job_view AS
SELECT
  job_dbid ,
  job_deleted_sw ,
  job_deleted_dt ,
  job_id ,
  job_attention,
  job_name ,
  job_addr1 ,
  job_addr2 , 
  job_city ,
  job_state ,
  job_zip ,
  job_notes, 
  job_phone1_desc,
  job_phone1,
  job_phone2_desc,
  job_phone2, 
  job_phone3_desc,
  job_phone3, 
  job_email1_desc,
  job_email1,
  job_email2_desc,
  job_email2,
  job_fixed_amt ,
  job_totwtm_amt ,
  job_totjtm_amt ,
  job_totwfe_amt ,
  job_totjfe_amt ,
  customer_dbid ,
  customer_deleted_sw ,
  customer_deleted_dt ,
  customer_id ,
  customer_attention ,
  customer_name ,
  customer_addr1 ,
  customer_addr2 ,
  customer_city ,
  customer_state ,
  customer_zip ,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_notes ,
  customer_ar_notes,
  customer_net ,
  customer_po ,
  job_frequency_dbid,
  job_frequency_id,
  job_frequency_desc
FROM job
LEFT JOIN customer ON customer.customer_dbid = job.job_customer_dbid
LEFT JOIN job_frequency ON job_frequency.job_frequency_dbid = job.job_job_frequency_dbid;

CREATE OR REPLACE VIEW job_grid_view AS
SELECT
  job_dbid ,
  job_deleted_sw ,
  job_deleted_dt ,
  job_id ,
  job_attention,
  job_name ,
  job_addr1 ,
  job_addr2 , 
  job_city ,
  job_state ,
  job_zip ,
  job_notes, 
  job_phone1_desc,
  job_phone1,
  job_phone2_desc,
  job_phone2, 
  job_phone3_desc,
  job_phone3, 
  job_email1_desc,
  job_email1,
  job_email2_desc,
  job_email2,
  job_job_frequency_dbid ,
  job_fixed_amt ,
  job_totwtm_amt ,
  job_totjtm_amt ,
  job_totwfe_amt ,
  job_totjfe_amt ,
  customer_dbid ,
  customer_deleted_sw ,
  customer_deleted_dt ,
  customer_id ,
  customer_attention ,
  customer_name ,
  customer_addr1 ,
  customer_addr2 ,
  customer_city ,
  customer_state ,
  customer_zip ,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_notes ,
  customer_ar_notes,
  customer_net ,
  customer_po,
 (SELECT MAX(invoice.invoice_dt) FROM invoice_dtl
    LEFT JOIN invoice ON invoice.invoice_dbid = invoice_dtl.invoice_dtl_invoice_dbid
    WHERE invoice_dtl_job_dbid = job.job_dbid) as view_last_invoice_dt,
  job_frequency_dbid,
  job_frequency_id,
  job_frequency_desc
FROM job
LEFT JOIN customer ON customer.customer_dbid = job.job_customer_dbid
LEFT JOIN job_frequency ON job_frequency.job_frequency_dbid = job.job_job_frequency_dbid;

CREATE OR REPLACE VIEW job_dtl_view AS
SELECT
  job_dtl_dbid ,
  job_dtl_deleted_sw ,
  job_dtl_deleted_dt ,
  job_dtl_desc ,
  job_dtl_freq_cd ,
  job_dtl_vtime_nbr ,
  job_dtl_fee_amt ,
  job_dtl_empl_cd ,
  job_dtl_last_dt ,
  job_dtl_instr_text ,
  job_dtl_mandate_cd ,
  job_dtl_a_day_cd ,
  job_dtl_ap_pm_cd ,
  job_dtl_prcnt_amt ,
  job_dtl_ow_cd ,
  job_dtl_alt_pay_amt ,
  job_dtl_paytype_cd ,
  job_dtl_srt ,
  job_dtl_typesrt ,
  jobcode_dbid ,
  jobcode_deleted_sw ,
  jobcode_deleted_dt ,
  jobcode_id ,
  jobcode_desc ,
  jobcode_short_desc ,
  jobcode_category ,
  job_dbid ,
  job_deleted_sw ,
  job_deleted_dt ,
  job_id ,
  job_attention,
  job_name ,
  job_addr1 ,
  job_addr2 , 
  job_city ,
  job_state ,
  job_zip ,
  job_notes, 
  job_phone1_desc,
  job_phone1,
  job_phone2_desc,
  job_phone2, 
  job_phone3_desc,
  job_phone3, 
  job_email1_desc,
  job_email1,
  job_email2_desc,
  job_email2,
  job_job_frequency_dbid ,
  job_fixed_amt ,
  job_totwtm_amt ,
  job_totjtm_amt ,
  job_totwfe_amt ,
  job_totjfe_amt ,
  customer_dbid ,
  customer_deleted_sw ,
  customer_deleted_dt ,
  customer_id ,
  customer_attention ,
  customer_name ,
  customer_addr1 ,
  customer_addr2 ,
  customer_city ,
  customer_state ,
  customer_zip ,
  customer_phone1_desc,
  customer_phone1,
  customer_phone2_desc,
  customer_phone2,
  customer_phone3_desc,
  customer_phone3,
  customer_email1_desc,
  customer_email1,
  customer_email2_desc,
  customer_email2,
  customer_notes ,
  customer_ar_notes,
  customer_net ,
  customer_po ,
  job_frequency_dbid,
  job_frequency_id,
  job_frequency_desc
FROM job_dtl
LEFT JOIN jobcode ON jobcode.jobcode_dbid = job_dtl.job_dtl_jobcode_dbid
LEFT JOIN job ON job.job_dbid = job_dtl.job_dtl_job_dbid
LEFT JOIN customer ON customer.customer_dbid = job.job_customer_dbid
LEFT JOIN job_frequency ON job_frequency.job_frequency_dbid = job.job_job_frequency_dbid;


