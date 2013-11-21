USE sparkle_conversion;

TRUNCATE TABLE sparkle_conversion.txt_jobcode;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/JOBCODE.TXT' IGNORE INTO TABLE sparkle_conversion.txt_jobcode  
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n"; 

TRUNCATE TABLE sparkle_conversion.txt_factors;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/FACTORS.TXT' IGNORE INTO TABLE sparkle_conversion.txt_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_cust;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/CUST.TXT' IGNORE INTO TABLE sparkle_conversion.txt_cust
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_ckdtl;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/CKDTL.TXT' IGNORE INTO TABLE sparkle_conversion.txt_ckdtl
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_ckdtl2;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/CKDTL2.TXT' IGNORE INTO TABLE sparkle_conversion.txt_ckdtl2
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_empl;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/EMPL.TXT' INTO TABLE sparkle_conversion.txt_empl
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_emplarc;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/EMPL_ARC.TXT' INTO TABLE sparkle_conversion.txt_emplarc
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_job;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/JOB.TXT' INTO TABLE sparkle_conversion.txt_job
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_jobdtl;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/JOB_DTL.TXT' INTO TABLE sparkle_conversion.txt_jobdtl
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_forms;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/FORMS.TXT' INTO TABLE sparkle_conversion.txt_forms
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_globset;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/GLOBSET.TXT' INTO TABLE sparkle_conversion.txt_globset
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_messages;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/MESSAGES.TXT' INTO TABLE sparkle_conversion.txt_messages
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_notes;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/NOTES.TXT' INTO TABLE sparkle_conversion.txt_notes
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_notesarc;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/NOTE_ARC.TXT' INTO TABLE sparkle_conversion.txt_notesarc
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_payroll;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/PAYROLL.TXT' INTO TABLE sparkle_conversion.txt_payroll
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_reports;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/REPORTS.TXT' INTO TABLE sparkle_conversion.txt_reports
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_rules;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/RULES.TXT' INTO TABLE sparkle_conversion.txt_rules
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_salearc;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/SALE_ARC.TXT' INTO TABLE sparkle_conversion.txt_salearc
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_saledtl;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/SALE_DTL.TXT' INTO TABLE sparkle_conversion.txt_saledtl
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_saleinv;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/SALE_INV.TXT' INTO TABLE sparkle_conversion.txt_saleinv
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_saledtlarc;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/SALE2ARC.TXT' INTO TABLE sparkle_conversion.txt_saledtlarc
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_weekdays;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/WKDAYS.TXT' INTO TABLE sparkle_conversion.txt_weekdays
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";

TRUNCATE TABLE sparkle_conversion.txt_zone;
LOAD DATA LOCAL INFILE 'C:/Users/hinesm/Desktop/Sparkle/stup/ZONE.TXT' INTO TABLE sparkle_conversion.txt_zone
FIELDS TERMINATED BY "," ENCLOSED BY '"' LINES TERMINATED BY "\r\n";
