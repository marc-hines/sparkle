
# DROP database sparkle_conversion;

CREATE SCHEMA IF NOT EXISTS sparkle_conversion DEFAULT CHARACTER SET ascii ;

USE sparkle_conversion;

DROP TABLE IF EXISTS txt_jobcode;
CREATE TABLE IF NOT EXISTS txt_jobcode (
col1 VARCHAR(80) NOT NULL UNIQUE,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
PRIMARY KEY (col1) );

DROP TABLE IF EXISTS txt_factors;
CREATE TABLE IF NOT EXISTS txt_factors (
col1 VARCHAR(80) NOT NULL UNIQUE,
col2 VARCHAR(80) NULL ,
PRIMARY KEY (col1) );

DROP TABLE IF EXISTS txt_cust;
CREATE TABLE IF NOT EXISTS txt_cust (
col1 VARCHAR(80) NOT NULL UNIQUE,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL ,
col11 VARCHAR(512) NULL ,
col12 VARCHAR(512) NULL ,
col13 VARCHAR(512) NULL ,
col14 VARCHAR(512) NULL ,
col15 VARCHAR(512) NULL ,
col16 VARCHAR(512) NULL ,
col17 VARCHAR(512) NULL ,
col18 VARCHAR(512) NULL ,
col19 VARCHAR(512) NULL ,
col20 VARCHAR(512) NULL ,
PRIMARY KEY (col1) );

DROP TABLE IF EXISTS txt_ckdtl;
CREATE TABLE IF NOT EXISTS txt_ckdtl (
col1 VARCHAR(80) NOT NULL UNIQUE,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL ,
col99 BIGINT NULL ,
dte3 DATE NULL ,
PRIMARY KEY (col1) );

DROP TABLE IF EXISTS txt_ckdtl2;
CREATE TABLE IF NOT EXISTS txt_ckdtl2 (
col1 VARCHAR(80) NOT NULL UNIQUE,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL ,
col99 BIGINT NULL ,
dte3 DATE NULL ,
PRIMARY KEY (col1) );

DROP TABLE IF EXISTS txt_empl;
CREATE TABLE IF NOT EXISTS txt_empl (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL ,
dte1 DATE NULL );

DROP TABLE IF EXISTS txt_emplarc;
CREATE TABLE IF NOT EXISTS txt_emplarc (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL ,
dte1 DATE NULL ); 

DROP TABLE IF EXISTS txt_job;
CREATE TABLE IF NOT EXISTS txt_job (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL,
col11 VARCHAR(512) NULL,
col12 VARCHAR(512) NULL ,
col13 VARCHAR(512) NULL ,
col14 VARCHAR(512) NULL ,
col15 VARCHAR(512) NULL ,
col16 VARCHAR(512) NULL ,
col17 VARCHAR(512) NULL ,
col18 VARCHAR(512) NULL ,
col19 VARCHAR(512) NULL ,
col20 VARCHAR(512) NULL  ,
dte6 DATE NULL);

DROP TABLE IF EXISTS txt_jobdtl;
CREATE TABLE IF NOT EXISTS txt_jobdtl (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL,
col11 VARCHAR(512) NULL,
col12 VARCHAR(512) NULL ,
col13 VARCHAR(512) NULL ,
col14 VARCHAR(512) NULL ,
col15 VARCHAR(512) NULL ,
col16 VARCHAR(512) NULL ,
col17 VARCHAR(512) NULL ,
col18 VARCHAR(512) NULL ,
col19 VARCHAR(512) NULL ,
col20 VARCHAR(512) NULL ,
col21 VARCHAR(512) NULL ,
col22 VARCHAR(512) NULL ,
col23 VARCHAR(512) NULL ,
col24 VARCHAR(512) NULL ,
col25 VARCHAR(512) NULL,
dte9 DATE NULL );

DROP TABLE IF EXISTS txt_forms;
CREATE TABLE IF NOT EXISTS txt_forms (
col1 VARCHAR(512) NOT NULL,
col2 VARCHAR(512) NULL );

DROP TABLE IF EXISTS txt_globset;
CREATE TABLE IF NOT EXISTS txt_globset (
col1 VARCHAR(512) NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL,
col11 VARCHAR(512) NULL,
col12 VARCHAR(512) NULL ,
col13 VARCHAR(512) NULL ,
col14 VARCHAR(512) NULL ,
col15 VARCHAR(512) NULL ,
col16 VARCHAR(512) NULL ,
col17 VARCHAR(512) NULL ,
col18 VARCHAR(512) NULL ,
col19 VARCHAR(512) NULL ,
col20 VARCHAR(512) NULL ,
col21 VARCHAR(512) NULL ,
col22 VARCHAR(512) NULL ,
col23 VARCHAR(512) NULL ,
col24 VARCHAR(512) NULL ,
col25 VARCHAR(512) NULL );

DROP TABLE IF EXISTS txt_messages;
CREATE TABLE IF NOT EXISTS txt_messages (
col1 VARCHAR(80) NOT NULL UNIQUE,
col2 TEXT NULL ,
PRIMARY KEY (col1) );

DROP TABLE IF EXISTS txt_notes;
CREATE TABLE IF NOT EXISTS txt_notes (
col1 VARCHAR(80) NOT NULL UNIQUE,
col2 TEXT NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
PRIMARY KEY (col1) );

DROP TABLE IF EXISTS txt_notesarc;
CREATE TABLE IF NOT EXISTS txt_notesarc (
col1 VARCHAR(80) NOT NULL UNIQUE,
col2 TEXT NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
PRIMARY KEY (col1) );

DROP TABLE IF EXISTS txt_payroll;
CREATE TABLE IF NOT EXISTS txt_payroll (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL,
col11 VARCHAR(512) NULL,
col12 VARCHAR(512) NULL ,
col13 VARCHAR(512) NULL ,
col14 VARCHAR(512) NULL ,
col15 VARCHAR(512) NULL ,
col16 VARCHAR(512) NULL ,
col17 VARCHAR(512) NULL ,
col18 VARCHAR(512) NULL ,
col19 VARCHAR(512) NULL ,
col20 VARCHAR(512) NULL ,
dte10 DATE NULL ,
dte13 DATE NULL ,
dte14 DATE NULL );

DROP TABLE IF EXISTS txt_reports;
CREATE TABLE IF NOT EXISTS txt_reports (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL );

DROP TABLE IF EXISTS txt_rules;
CREATE TABLE IF NOT EXISTS txt_rules (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL );

DROP TABLE IF EXISTS txt_salearc;
CREATE TABLE IF NOT EXISTS txt_salearc (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL UNIQUE,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
dte2 DATE NULL ,
dte9 DATE NULL ,
PRIMARY KEY (col3) );

DROP TABLE IF EXISTS txt_saledtl;
CREATE TABLE IF NOT EXISTS txt_saledtl (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL,
col11 VARCHAR(512) NULL,
col12 VARCHAR(512) NULL ,
col13 VARCHAR(512) NULL ,
col14 VARCHAR(512) NULL ,
col15 VARCHAR(512) NULL ,
col16 VARCHAR(512) NULL ,
col17 VARCHAR(512) NULL ,
col18 VARCHAR(512) NULL ,
col19 VARCHAR(512) NULL ,
col20 VARCHAR(512) NULL ,
col21 VARCHAR(512) NULL ,
col22 VARCHAR(512) NULL ,
col23 VARCHAR(512) NULL ,
col24 VARCHAR(512) NULL ,
col25 VARCHAR(512) NULL ,
dte6 DATE NULL ,
dte15 DATE NULL ,
dte19 DATE NULL );

DROP TABLE IF EXISTS txt_saleinv;
CREATE TABLE IF NOT EXISTS txt_saleinv (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL UNIQUE,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL ,
dte2 DATE NULL ,
dte10 DATE NULL ,
PRIMARY KEY (col3) );

DROP TABLE IF EXISTS txt_saledtlarc;
CREATE TABLE IF NOT EXISTS txt_saledtlarc (
col1 VARCHAR(80) NOT NULL,
col2 VARCHAR(512) NULL ,
col3 VARCHAR(512) NULL ,
col4 VARCHAR(512) NULL ,
col5 VARCHAR(512) NULL ,
col6 VARCHAR(512) NULL ,
col7 VARCHAR(512) NULL ,
col8 VARCHAR(512) NULL ,
col9 VARCHAR(512) NULL ,
col10 VARCHAR(512) NULL,
col11 VARCHAR(512) NULL,
col12 VARCHAR(512) NULL ,
col13 VARCHAR(512) NULL ,
col14 VARCHAR(512) NULL ,
col15 VARCHAR(512) NULL ,
col16 VARCHAR(512) NULL ,
col17 VARCHAR(512) NULL ,
col18 VARCHAR(512) NULL ,
col19 VARCHAR(512) NULL ,
col20 VARCHAR(512) NULL ,
col21 VARCHAR(512) NULL ,
col22 VARCHAR(512) NULL ,
col23 VARCHAR(512) NULL ,
col24 VARCHAR(512) NULL ,
col25 VARCHAR(512) NULL ,
dte6 DATE NULL ,
dte15 DATE NULL ,
dte20 DATE NULL );

DROP TABLE IF EXISTS txt_weekdays;
CREATE TABLE IF NOT EXISTS txt_weekdays (
col1 VARCHAR(80) NULL ,
col2 VARCHAR(80) NULL );

DROP TABLE IF EXISTS txt_zone;
CREATE TABLE IF NOT EXISTS txt_zone (
col1 VARCHAR(80) NULL ,
col2 VARCHAR(80) NULL );
