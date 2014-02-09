SET SQL_SAFE_UPDATES=0;

####################################################################

TRUNCATE TABLE sparkle_app.user;
INSERT INTO sparkle_app.user (user_id, user_name, user_access, user_password)
  VALUES ('tat', 'Tatijanna', 'user', 'tatijanna');
INSERT INTO sparkle_app.user (user_id, user_name, user_access, user_password)
  VALUES ('tash', 'Natasha', 'user', 'natasha');
INSERT INTO sparkle_app.user (user_id, user_name, user_access, user_password)
  VALUES ('tom', 'Tom the Man', 'user', 'tom');
INSERT INTO sparkle_app.user (user_id, user_name, user_access, user_password)
  VALUES ('supertom', 'Tom the Superman', 'user,admin', 'tomthesuperman');
INSERT INTO sparkle_app.user (user_id, user_name, user_access, user_password)
  VALUES ('marc', 'Marc the Nerd', 'user,admin', 'marcthenerd');
INSERT INTO sparkle_app.user (user_id, user_name, user_access, user_password, user_deleted_sw)
  VALUES ('joe', 'Slacker Joe', 'user', 'loser', true);

#####################################################################

TRUNCATE TABLE sparkle_app.payment_type;
INSERT INTO sparkle_app.payment_type (payment_type_dbid, payment_type_id, payment_type_cash_on_hand_sw, payment_type_desc)
  VALUES (100, 'Check', true, 'Check Payment');
INSERT INTO sparkle_app.payment_type (payment_type_dbid, payment_type_id, payment_type_cash_on_hand_sw, payment_type_desc)
  VALUES (200, 'Cash', true, 'Cash Payment');
INSERT INTO sparkle_app.payment_type (payment_type_dbid, payment_type_id, payment_type_cash_on_hand_sw, payment_type_desc)
  VALUES (300, 'Memo', false, 'Credit/Debit memo value applied');
INSERT INTO sparkle_app.payment_type (payment_type_dbid, payment_type_id, payment_type_cash_on_hand_sw, payment_type_desc)
  VALUES (400, 'Courtesy', false, 'Discount/Adjustment as a customer courtesy');
INSERT INTO sparkle_app.payment_type (payment_type_dbid, payment_type_id, payment_type_cash_on_hand_sw, payment_type_desc)
  VALUES (500, 'Fair Trade', false, 'Fair Trade - exchange for services');
INSERT INTO sparkle_app.payment_type (payment_type_dbid, payment_type_id, payment_type_cash_on_hand_sw, payment_type_desc)
  VALUES (600, 'Bad Debt', false, 'Uncollectable debt/write off');

#####################################################################

TRUNCATE TABLE sparkle_app.invoice_status;
INSERT INTO sparkle_app.invoice_status (invoice_status_dbid, invoice_status_id, invoice_status_allow_changes_sw, invoice_status_desc)
  VALUES (sparkle_app.fn_invoice_status_open(), 'Open', true, 'Open for changes and additions');
INSERT INTO sparkle_app.invoice_status (invoice_status_dbid, invoice_status_id, invoice_status_allow_changes_sw, invoice_status_desc)
  VALUES (sparkle_app.fn_invoice_status_printed(), 'Printed', false, 'Printed or PDF created, closed for changes');
INSERT INTO sparkle_app.invoice_status (invoice_status_dbid, invoice_status_id, invoice_status_allow_changes_sw, invoice_status_desc)
  VALUES (sparkle_app.fn_invoice_status_closed(), 'Closed', false, 'Paid by customer or was uncollectable');
INSERT INTO sparkle_app.invoice_status (invoice_status_dbid, invoice_status_id, invoice_status_allow_changes_sw, invoice_status_desc)
  VALUES (sparkle_app.fn_invoice_status_voided(), 'Voided', false, 'Invoice cancelled and never reached the customer');

#####################################################################

TRUNCATE TABLE sparkle_app.invoice_behavior;
INSERT INTO sparkle_app.invoice_behavior (invoice_behavior_dbid, invoice_behavior_id, invoice_behavior_bill_all_jobs_together_sw, invoice_behavior_bill_jobs_with_same_name_together_sw, invoice_behavior_bill_jobs_seperately_sw, invoice_behavior_desc)
  VALUES(sparkle_app.fn_invoice_behavior_combine_all(), 'Combine All Jobs', true, false, false, 'Bill all jobs together on the same invoice');
INSERT INTO sparkle_app.invoice_behavior (invoice_behavior_dbid, invoice_behavior_id, invoice_behavior_bill_all_jobs_together_sw, invoice_behavior_bill_jobs_with_same_name_together_sw, invoice_behavior_bill_jobs_seperately_sw, invoice_behavior_desc)
  VALUES(sparkle_app.fn_invoice_behavior_combine_by_name(), 'Combine by Job Name', false, true, false, 'Bill jobs with the same name together on the same invoice');
INSERT INTO sparkle_app.invoice_behavior (invoice_behavior_dbid, invoice_behavior_id, invoice_behavior_bill_all_jobs_together_sw, invoice_behavior_bill_jobs_with_same_name_together_sw, invoice_behavior_bill_jobs_seperately_sw, invoice_behavior_desc)
  VALUES(sparkle_app.fn_invoice_behavior_combine_same_job(), 'Combine Same Job only', false, true, false, 'Bill job seperately, but multiple occurrences can be on the invoice');

#####################################################################

TRUNCATE TABLE sparkle_app.invoice_frequency;
INSERT INTO sparkle_app.invoice_frequency ( invoice_frequency_dbid, invoice_frequency_id, invoice_frequency_weekly_sw, invoice_frequency_montly_sw, invoice_frequency_desc )
  VALUES (sparkle_app.fn_invoice_frequency_weekly(), 'Weekly', true, false, 'Invoice weekly');
INSERT INTO sparkle_app.invoice_frequency ( invoice_frequency_dbid, invoice_frequency_id, invoice_frequency_weekly_sw, invoice_frequency_montly_sw, invoice_frequency_desc )
  VALUES (sparkle_app.fn_invoice_frequency_monthly(), 'Monthly', false, true, 'Invoice Montly');

#####################################################################

TRUNCATE TABLE sparkle_app.job_frequency;
INSERT INTO sparkle_app.job_frequency (job_frequency_dbid, job_frequency_id, job_frequency_weekly_sw, job_frequency_biweekly_sw, job_frequency_montly_sw, job_frequency_on_call_sw, job_frequency_desc )
  VALUES (sparkle_app.fn_job_frequency_weekly(), 'Weekly', true, false, false, false, 'Job is done each week');
INSERT INTO sparkle_app.job_frequency (job_frequency_dbid, job_frequency_id, job_frequency_weekly_sw, job_frequency_biweekly_sw, job_frequency_montly_sw, job_frequency_on_call_sw, job_frequency_desc )
  VALUES (sparkle_app.fn_job_frequency_biweekly(), 'Biweekly', false, true, false, false, 'Job is done every other week');
INSERT INTO sparkle_app.job_frequency (job_frequency_dbid, job_frequency_id, job_frequency_weekly_sw, job_frequency_biweekly_sw, job_frequency_montly_sw, job_frequency_on_call_sw, job_frequency_desc )
  VALUES (sparkle_app.fn_job_frequency_monthly(), 'Monthly', false, false, true, false, 'Job is done each month');
INSERT INTO sparkle_app.job_frequency (job_frequency_dbid, job_frequency_id, job_frequency_weekly_sw, job_frequency_biweekly_sw, job_frequency_montly_sw, job_frequency_on_call_sw, job_frequency_desc )
  VALUES (sparkle_app.fn_job_frequency_on_call(), 'On Call', false, false, false, true, 'Job is done when customer requests it');

#####################################################################

TRUNCATE TABLE sparkle_app.jobcode;
INSERT INTO sparkle_app.jobcode
( jobcode_id,
  jobcode_desc,
  jobcode_short_desc,
  jobcode_category )
SELECT
  col1, col2, col3, col4
FROM sparkle_conversion.txt_jobcode; 

INSERT INTO sparkle_app.jobcode
( jobcode_id,
  jobcode_desc,
  jobcode_short_desc,
  jobcode_category,
  jobcode_deleted_sw)
SELECT
  col3, MAX(col11), MAX(col10), 'Unknown', TRUE
FROM sparkle_conversion.txt_jobdtl
LEFT JOIN sparkle_app.jobcode ON jobcode.jobcode_id LIKE sparkle_conversion.txt_jobdtl.col3
WHERE jobcode.jobcode_dbid IS NULL
GROUP BY txt_jobdtl.col3;

#####################################################################

TRUNCATE TABLE sparkle_app.message;
INSERT INTO sparkle_app.message
( message_id,
  message_desc )
SELECT
  col1, col2
FROM sparkle_conversion.txt_messages; 

INSERT INTO sparkle_app.message
( message_id,
  message_desc,
  message_deleted_sw )
SELECT
   col16, col16, TRUE
FROM sparkle_conversion.txt_cust
LEFT JOIN sparkle_app.message ON message.message_id = txt_cust.col16
WHERE message.message_dbid IS NULL AND txt_cust.col16 IS NOT NULL
GROUP BY txt_cust.col16;

#####################################################################

TRUNCATE TABLE sparkle_app.customer;
INSERT INTO sparkle_app.customer
( customer_id,
  customer_attention,
  customer_name,
  customer_addr1,
  customer_addr2,
  customer_city,
  customer_state,
  customer_zip,
  customer_phone1,
  customer_phone2,
  customer_phone3,
  customer_email1,
  customer_notes,
  customer_net,
  customer_po,
  customer_message_dbid,
  customer_invoice_behavior_dbid,
  customer_phone3_desc )
SELECT
  col1, col2, col3, col4, col5,
  col6, col7, col8, col9, col10,
  col11, col12, col13, col14, col15,
 (SELECT message.message_dbid FROM sparkle_app.message WHERE message.message_id = txt_cust.col16 LIMIT 1),
 COL20, 'Fax'
FROM sparkle_conversion.txt_cust;

#####################################################################
## Add missing customer rows and mark them as deleted
#####################################################################

INSERT INTO sparkle_app.customer
( customer_id,
  customer_name,
  customer_deleted_sw )
SELECT
  col8, col4, TRUE
FROM sparkle_conversion.txt_ckdtl
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_ckdtl.col8
WHERE customer.customer_dbid IS NULL
GROUP BY txt_ckdtl.col8;

INSERT INTO sparkle_app.customer
( customer_id,
  customer_name,
  customer_deleted_sw )
SELECT
  col8, col4, TRUE
FROM sparkle_conversion.txt_ckdtl2
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_ckdtl2.col8
WHERE customer.customer_dbid IS NULL
GROUP BY txt_ckdtl2.col8;

INSERT INTO sparkle_app.customer
( customer_id,
  customer_name,
  customer_deleted_sw )
SELECT
  col1, col1, TRUE
FROM sparkle_conversion.txt_saleinv
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_saleinv.col1
WHERE customer.customer_dbid IS NULL
GROUP BY txt_saleinv.col1;

INSERT INTO sparkle_app.customer
( customer_id,
  customer_name,
  customer_deleted_sw )
SELECT
  col1, col1, TRUE
FROM sparkle_conversion.txt_salearc
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_salearc.col1
WHERE customer.customer_dbid IS NULL
GROUP BY txt_salearc.col1;

INSERT INTO sparkle_app.customer
( customer_id,
  customer_name,
  customer_deleted_sw )
SELECT
  col1, col1, TRUE
FROM sparkle_conversion.txt_saledtl
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_saledtl.col1
WHERE customer.customer_dbid IS NULL
GROUP BY txt_saledtl.col1;

INSERT INTO sparkle_app.customer
( customer_id,
  customer_name,
  customer_deleted_sw )
SELECT
  col1, col1, TRUE
FROM sparkle_conversion.txt_saledtlarc
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_saledtlarc.col1
WHERE customer.customer_dbid IS NULL
GROUP BY txt_saledtlarc.col1;

INSERT INTO sparkle_app.customer
( customer_id,
  customer_name,
  customer_deleted_sw )
SELECT
  col1, col1, TRUE
FROM sparkle_conversion.txt_job
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_job.col1
WHERE customer.customer_dbid IS NULL
GROUP BY txt_job.col1;

INSERT INTO sparkle_app.customer
( customer_id,
  customer_name,
  customer_deleted_sw )
SELECT
  col1, col1, TRUE
FROM sparkle_conversion.txt_jobdtl
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_jobdtl.col1
WHERE customer.customer_dbid IS NULL
GROUP BY txt_jobdtl.col1;

#####################################################################

UPDATE sparkle_conversion.txt_ckdtl SET col99 = (SELECT customer.customer_dbid FROM sparkle_app.customer WHERE customer.customer_id = txt_ckdtl.col8 LIMIT 1);
UPDATE sparkle_conversion.txt_ckdtl2 SET col99 = (SELECT customer.customer_dbid FROM sparkle_app.customer WHERE customer.customer_id = txt_ckdtl2.col8 LIMIT 1);

#####################################################################

TRUNCATE TABLE sparkle_app.invoice;
INSERT INTO sparkle_app.invoice
( invoice_customer_dbid,
  invoice_dt,
  invoice_created_dt,
  invoice_id,
  invoice_total_amt,
  invoice_invoice_status_dbid,
  invoice_received_amt,
  invoice_desc,
  invoice_balance_amt,
  invoice_posted_dt,
  invoice_bill_to_attention,
  invoice.invoice_bill_to_name,
  invoice.invoice_bill_to_addr1,
  invoice.invoice_bill_to_addr2,
  invoice.invoice_bill_to_city,
  invoice.invoice_bill_to_state,
  invoice.invoice_bill_to_zip,
  invoice.invoice_bill_to_phone1_desc,
  invoice.invoice_bill_to_phone1,
  invoice.invoice_bill_to_phone2_desc,
  invoice.invoice_bill_to_phone2,
  invoice.invoice_bill_to_phone3_desc,
  invoice.invoice_bill_to_phone3,
  invoice.invoice_message)
SELECT
  customer.customer_dbid,
  txt_saleinv.dte2, txt_saleinv.dte2, txt_saleinv.col3, txt_saleinv.col4, sparkle_app.fn_invoice_status_printed(), 
  txt_saleinv.col7, txt_saleinv.col8, txt_saleinv.col9, txt_saleinv.dte10,
  customer.customer_attention, customer.customer_name,
  customer.customer_addr1, customer.customer_addr2,
  customer.customer_city, customer.customer_state, customer.customer_zip,
  customer.customer_phone1_desc, customer.customer_phone1,
  customer.customer_phone2_desc, customer.customer_phone2,
  customer.customer_phone3_desc, customer.customer_phone3,
  sparkle_conversion.txt_notes.col2
FROM sparkle_conversion.txt_saleinv
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_saleinv.col1
LEFT JOIN sparkle_conversion.txt_notes ON txt_saleinv.col3 =  txt_notes.col1;


INSERT INTO sparkle_app.invoice
( invoice_customer_dbid,
  invoice_dt,
  invoice_id,
  invoice_total_amt,
  invoice_invoice_status_dbid,
  invoice_received_amt,
  invoice_desc,
  invoice_balance_amt,
  invoice_posted_dt,
  invoice_bill_to_attention,
  invoice.invoice_bill_to_name,
  invoice.invoice_bill_to_addr1,
  invoice.invoice_bill_to_addr2,
  invoice.invoice_bill_to_city,
  invoice.invoice_bill_to_state,
  invoice.invoice_bill_to_zip,
  invoice.invoice_bill_to_phone1,
  invoice.invoice_bill_to_phone2,
  invoice.invoice_message)
SELECT
  customer.customer_dbid,
  txt_salearc.dte2, txt_salearc.col3, txt_salearc.col4, sparkle_app.fn_invoice_status_closed(), 
  txt_salearc.col7, txt_salearc.col8, 0, txt_salearc.dte9,
  customer.customer_attention, customer.customer_name,
  customer.customer_addr1, customer.customer_addr2,
  customer.customer_city, customer.customer_state, customer.customer_zip,
  customer.customer_phone1, customer.customer_phone2,
  txt_notesarc.col3
FROM sparkle_conversion.txt_salearc
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_salearc.col1
LEFT JOIN sparkle_conversion.txt_notesarc ON txt_salearc.col3 =  txt_notesarc.col1;


#####################################################################
## Add missing invoice rows and mark them as deleted
#####################################################################

INSERT INTO sparkle_app.invoice
( invoice_customer_dbid,
  invoice_id,
  invoice_dt,
  invoice_desc,
  invoice_total_amt,
  invoice_posted_dt,
  invoice_bill_to_attention,
  invoice.invoice_bill_to_name,
  invoice.invoice_bill_to_addr1,
  invoice.invoice_bill_to_addr2,
  invoice.invoice_bill_to_city,
  invoice.invoice_bill_to_state,
  invoice.invoice_bill_to_zip,
  invoice.invoice_bill_to_phone1,
  invoice.invoice_bill_to_phone2,
  invoice_invoice_status_dbid )
SELECT
  customer.customer_dbid,
  col1, MAX(dte3), MAX(col4), SUM(col5), MAX(dte3),
  customer.customer_attention, customer.customer_name,
  customer.customer_addr1, customer.customer_addr2,
  customer.customer_city, customer.customer_state, customer.customer_zip,
  customer.customer_phone1, customer.customer_phone2,
  sparkle_app.fn_invoice_status_closed()
FROM sparkle_conversion.txt_ckdtl
LEFT JOIN sparkle_app.invoice ON invoice.invoice_id = txt_ckdtl.col1
LEFT JOIN sparkle_app.customer ON customer.customer_dbid = txt_ckdtl.col99
WHERE invoice.invoice_dbid IS NULL
GROUP BY txt_ckdtl.col1;

INSERT INTO sparkle_app.invoice
( invoice_customer_dbid,
  invoice_id,
  invoice_dt,
  invoice_desc,
  invoice_total_amt,
  invoice_posted_dt,
  invoice_bill_to_attention,
  invoice.invoice_bill_to_name,
  invoice.invoice_bill_to_addr1,
  invoice.invoice_bill_to_addr2,
  invoice.invoice_bill_to_city,
  invoice.invoice_bill_to_state,
  invoice.invoice_bill_to_zip,
  invoice.invoice_bill_to_phone1,
  invoice.invoice_bill_to_phone2,
  invoice_invoice_status_dbid )
SELECT
  customer.customer_dbid,
  col1, MAX(dte3), MAX(col4), SUM(col5), MAX(dte3),
  customer.customer_attention, customer.customer_name,
  customer.customer_addr1, customer.customer_addr2,
  customer.customer_city, customer.customer_state, customer.customer_zip,
  customer.customer_phone1, customer.customer_phone2,
  sparkle_app.fn_invoice_status_closed()
FROM sparkle_conversion.txt_ckdtl2
LEFT JOIN sparkle_app.invoice ON invoice.invoice_id = txt_ckdtl2.col1
LEFT JOIN sparkle_app.customer ON customer.customer_dbid = txt_ckdtl2.col99
WHERE invoice.invoice_dbid IS NULL
GROUP BY txt_ckdtl2.col1;

INSERT INTO sparkle_app.invoice
( invoice_customer_dbid,
  invoice_id,
  invoice_dt,
  invoice_desc,
  invoice_total_amt,
  invoice_posted_dt,
  invoice_bill_to_attention,
  invoice.invoice_bill_to_name,
  invoice.invoice_bill_to_addr1,
  invoice.invoice_bill_to_addr2,
  invoice.invoice_bill_to_city,
  invoice.invoice_bill_to_state,
  invoice.invoice_bill_to_zip,
  invoice.invoice_bill_to_phone1,
  invoice.invoice_bill_to_phone2,
  invoice_invoice_status_dbid )
SELECT
  customer.customer_dbid, col2, MAX(dte6), customer.customer_name, SUM(col5), MAX(dte6),
  customer.customer_attention, customer.customer_name,
  customer.customer_addr1, customer.customer_addr2,
  customer.customer_city, customer.customer_state, customer.customer_zip,
  customer.customer_phone1, customer.customer_phone2,
  sparkle_app.fn_invoice_status_voided()
FROM sparkle_conversion.txt_saledtl
LEFT JOIN sparkle_app.invoice ON invoice.invoice_id = txt_saledtl.col2
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_saledtl.col1
WHERE invoice.invoice_dbid IS NULL
GROUP BY txt_saledtl.col2;

INSERT INTO sparkle_app.invoice
( invoice_customer_dbid,
  invoice_id,
  invoice_dt,
  invoice_desc,
  invoice_total_amt,
  invoice_posted_dt,
  invoice_bill_to_attention,
  invoice.invoice_bill_to_name,
  invoice.invoice_bill_to_addr1,
  invoice.invoice_bill_to_addr2,
  invoice.invoice_bill_to_city,
  invoice.invoice_bill_to_state,
  invoice.invoice_bill_to_zip,
  invoice.invoice_bill_to_phone1,
  invoice.invoice_bill_to_phone2,
  invoice_invoice_status_dbid )
SELECT
  customer.customer_dbid, col2, MAX(dte6), customer.customer_name, SUM(col5), MAX(dte6),
  customer.customer_attention, customer.customer_name,
  customer.customer_addr1, customer.customer_addr2,
  customer.customer_city, customer.customer_state, customer.customer_zip,
  customer.customer_phone1, customer.customer_phone2,
  sparkle_app.fn_invoice_status_voided()
FROM sparkle_conversion.txt_saledtlarc
LEFT JOIN sparkle_app.invoice ON invoice.invoice_id = txt_saledtlarc.col2
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_saledtlarc.col1
WHERE invoice.invoice_dbid IS NULL
GROUP BY txt_saledtlarc.col2;

#####################################################################

TRUNCATE TABLE sparkle_app.job;
INSERT INTO sparkle_app.job
( job_customer_dbid,
  job_id,
  job_attention,
  job_name,
  job_addr1,
  job_phone1,
  job_job_frequency_dbid,
  job_created_dt,
  job_fixed_amt,
  job_totwtm_amt,
  job_totjtm_amt,
  job_totwfe_amt,
  job_totjfe_amt )
SELECT 
  customer.customer_dbid, col2, COL20, col8, col3, col15,
  col5, dte6,
  col7, col9, col10, col11, col12
FROM sparkle_conversion.txt_job
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_job.col1
WHERE customer.customer_dbid IS NOT NULL;

#####################################################################
## adjust two damaged invoices to proper date
#####################################################################

UPDATE sparkle_app.invoice SET invoice_dt = '2004-10-17' WHERE invoice_id = '66062';
UPDATE sparkle_app.invoice SET invoice_dt = '2004-10-17' WHERE invoice_id = '66137';

#####################################################################
## Add missing job rows and mark them as deleted
#####################################################################

INSERT INTO sparkle_app.job
( job_customer_dbid,
  job_id,
  job_name,
  job_addr1,
  job_deleted_sw )
SELECT
  customer.customer_dbid, col16, customer.customer_name, MAX(col7), TRUE
FROM sparkle_conversion.txt_saledtl
LEFT JOIN sparkle_app.job ON job.job_id = txt_saledtl.col16
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_saledtl.col1
WHERE job.job_dbid IS NULL AND txt_saledtl.col16 IS NOT NULL
GROUP BY txt_saledtl.col16;

INSERT INTO sparkle_app.job
( job_customer_dbid,
  job_id,
  job_name,
  job_addr1,
  job_deleted_sw )
SELECT
  customer.customer_dbid, col16, customer.customer_name, MAX(col7), TRUE
FROM sparkle_conversion.txt_saledtlarc
LEFT JOIN sparkle_app.job ON job.job_id = txt_saledtlarc.col16
LEFT JOIN sparkle_app.customer ON customer.customer_id = txt_saledtlarc.col1
WHERE job.job_dbid IS NULL AND txt_saledtlarc.col16 IS NOT NULL
GROUP BY txt_saledtlarc.col16;

INSERT INTO sparkle_app.job
( job_customer_dbid,
  job_id,
  job_name,
  job_deleted_sw )
SELECT
  (SELECT customer.customer_dbid FROM sparkle_app.customer WHERE customer.customer_id = txt_jobdtl.col1 LIMIT 1),
  col2, MAX(col11), TRUE
FROM sparkle_conversion.txt_jobdtl
LEFT JOIN sparkle_app.job ON job.job_id = txt_jobdtl.col2
WHERE job.job_dbid IS NULL
GROUP BY txt_jobdtl.col2;

#####################################################################

TRUNCATE TABLE sparkle_app.job_dtl;
INSERT INTO sparkle_app.job_dtl
( job_dtl_job_dbid,
  job_dtl_jobcode_dbid,
  job_dtl_desc,
  job_dtl_freq_cd,
  job_dtl_vtime_nbr,
  job_dtl_fee_amt,
  job_dtl_empl_cd,
  job_dtl_last_dt,
  job_dtl_instr_text,
  job_dtl_mandate_cd,
  job_dtl_a_day_cd,
  job_dtl_ap_pm_cd,
  job_dtl_prcnt_amt,
  job_dtl_srt,
  job_dtl_ow_cd,
  job_dtl_alt_pay_amt,
  job_dtl_paytype_cd,
  job_dtl_typesrt )
SELECT
  (SELECT job.job_dbid FROM sparkle_app.job WHERE job.job_id = txt_jobdtl.col2 LIMIT 1),
  (SELECT jobcode.jobcode_dbid FROM sparkle_app.jobcode WHERE jobcode.jobcode_id = txt_jobdtl.col3 LIMIT 1),
  col4, col5, col6,
  col7, col8, dte9, col12, col14,
  col15, col16, col17, col18, col19, 
  col20, col21, col22
FROM sparkle_conversion.txt_jobdtl;

#####################################################################
## set any job detail to deleted if its jobcode is deleted
#####################################################################

UPDATE sparkle_app.job_dtl SET job_dtl_deleted_sw = TRUE
WHERE (SELECT count(*) FROM sparkle_app.jobcode 
	   WHERE job_dtl.job_dtl_jobcode_dbid = jobcode.jobcode_dbid 
       AND jobcode.jobcode_deleted_sw) > 0;

#####################################################################
## set any job header to deleted if a jobcode has not been used lately
#####################################################################

UPDATE sparkle_app.job SET job_deleted_sw = TRUE
WHERE (SELECT MAX(invoice.invoice_dt) FROM sparkle_app.invoice_dtl
       LEFT JOIN sparkle_app.invoice ON invoice_dtl.invoice_dtl_invoice_dbid = invoice.invoice_dbid
       WHERE invoice_dtl.invoice_dtl_job_dbid = job.job_dbid) < '2011-12-31';

#####################################################################

TRUNCATE TABLE sparkle_app.invoice_dtl;
INSERT INTO sparkle_app.invoice_dtl
( invoice_dtl_invoice_dbid,
  invoice_dtl_job_dbid,
  invoice_dtl_sold_qty,
  invoice_dtl_item_txt,
  invoice_dtl_unit_cost_amt,
  invoice_dtl_sold_dt,
  invoice_dtl_location,
  invoice_dtl_bill_cd,
  invoice_dtl_serv_cd,
  invoice_dtl_a_day,
  invoice_dtl_empl,
  invoice_dtl_am_pm,
  invoice_dtl_srt,
  invoice_dtl_prcnt_amt,
  invoice_dtl_pd_date,
  invoice_dtl_ow_cd,
  invoice_dtl_altpay_amt,
  invoice_dtl_tdate,
  invoice_dtl_phone1,
  invoice_dtl_ytype,
  invoice_dtl_pay_type )
SELECT
  (SELECT invoice.invoice_dbid FROM sparkle_app.invoice WHERE invoice.invoice_id = txt_saledtl.col2 LIMIT 1),
  (SELECT job.job_dbid FROM sparkle_app.job WHERE job.job_id = txt_saledtl.col16 LIMIT 1),
	col3, col4, col5,
	dte6, col7, col8, col9, col10,
	col11, col12, col13, col14,
	dte15, col17, col18, dte19,
	col20, col21, col22
FROM sparkle_conversion.txt_saledtl;

INSERT INTO sparkle_app.invoice_dtl
( invoice_dtl_invoice_dbid,
  invoice_dtl_job_dbid,
  invoice_dtl_sold_qty,
  invoice_dtl_item_txt,
  invoice_dtl_unit_cost_amt,
  invoice_dtl_sold_dt,
  invoice_dtl_location,
  invoice_dtl_bill_cd,
  invoice_dtl_serv_cd,
  invoice_dtl_a_day,
  invoice_dtl_empl,
  invoice_dtl_am_pm,
  invoice_dtl_srt,
  invoice_dtl_prcnt_amt,
  invoice_dtl_pd_date,
  invoice_dtl_ow_cd,
  invoice_dtl_altpay_amt,
  invoice_dtl_tdate,
  invoice_dtl_pay_type )
SELECT
	(SELECT invoice.invoice_dbid FROM sparkle_app.invoice WHERE invoice.invoice_id = txt_saledtlarc.col2 LIMIT 1),
  (SELECT job.job_dbid FROM sparkle_app.job WHERE job.job_id = txt_saledtlarc.col16 LIMIT 1),
	col3, col4, col5,
	dte6, col7, col8, col9, null,
	col11, null, col13, col14, dte15,
  col16, col18, dte20, col19
FROM sparkle_conversion.txt_saledtlarc;

#####################################################################
## Add payment info
#####################################################################

TRUNCATE TABLE sparkle_app.payment;
INSERT INTO sparkle_app.payment
( payment_customer_dbid,
  payment_desc_txt,
  payment_amt,
  payment_dt,
  payment_created_dt)
SELECT 
  max(col99), max(col4), sum(col5), max(dte3), max(dte3)
FROM sparkle_conversion.txt_ckdtl
GROUP BY CONCAT_WS('-', col3, col8);

INSERT INTO sparkle_app.payment
( payment_customer_dbid,
  payment_desc_txt,
  payment_amt,
  payment_dt,
  payment_created_dt)
SELECT 
  max(col99), max(col4), sum(col5), max(dte3), max(dte3)
FROM sparkle_conversion.txt_ckdtl2
GROUP BY CONCAT_WS('-', col3, col8);

TRUNCATE TABLE sparkle_app.payment_dtl;
INSERT INTO sparkle_app.payment_dtl
( payment_dtl_payment_dbid,
  payment_dtl_invoice_dbid,
  payment_dtl_payment_type_dbid,
  payment_dtl_job_state,
  payment_dtl_applied_amt,
  payment_dtl_created_dt )
SELECT 
  (SELECT payment.payment_dbid FROM sparkle_app.payment 
   WHERE payment.payment_customer_dbid = txt_ckdtl.col99 AND payment.payment_dt = txt_ckdtl.dte3 LIMIT 1),
  (SELECT invoice.invoice_dbid FROM sparkle_app.invoice WHERE invoice.invoice_id = txt_ckdtl.col1 LIMIT 1),
  col6, col9, col5, dte3
FROM sparkle_conversion.txt_ckdtl;

INSERT INTO sparkle_app.payment_dtl
( payment_dtl_payment_dbid,
  payment_dtl_invoice_dbid,
  payment_dtl_payment_type_dbid,
  payment_dtl_job_state,
  payment_dtl_applied_amt,
  payment_dtl_created_dt )
SELECT 
  (SELECT payment.payment_dbid FROM sparkle_app.payment 
   WHERE payment.payment_customer_dbid = txt_ckdtl2.col99 AND payment.payment_dt = txt_ckdtl2.dte3 LIMIT 1),
  (SELECT invoice.invoice_dbid FROM sparkle_app.invoice WHERE invoice.invoice_id = txt_ckdtl2.col1 LIMIT 1),
  col6, col9, col5, dte3
FROM sparkle_conversion.txt_ckdtl2;

#####################################################################
## Set proper status to unpaid invoices
#####################################################################

DROP FUNCTION IF EXISTS sparkle_app.fn_invoice_zero_out;
DELIMITER $$
CREATE FUNCTION sparkle_app.fn_invoice_zero_out(v_invoice_dbid BIGINT UNSIGNED, v_payment_type BIGINT UNSIGNED)

	RETURNS DECIMAL(21,2)

BEGIN

  DECLARE v_total_adjustment DECIMAL(21,2);
	DECLARE v_activity_date TIMESTAMP;
	DECLARE v_customer_dbid BIGINT UNSIGNED;
	DECLARE v_payment_dbid BIGINT UNSIGNED;

    SET v_total_adjustment = fn_get_invoice_balance_due(v_invoice_dbid);

	IF v_total_adjustment <> 0 THEN 
		
		SELECT invoice_posted_dt INTO v_activity_date FROM invoice WHERE invoice_dbid = v_invoice_dbid;
		IF v_activity_date IS NULL THEN 
			SELECT invoice_dt INTO v_activity_date FROM invoice WHERE invoice_dbid = v_invoice_dbid;
		END IF;

		SELECT invoice_customer_dbid INTO v_customer_dbid FROM invoice WHERE invoice_dbid = v_invoice_dbid;

		INSERT INTO sparkle_app.payment
		( 	payment_customer_dbid,
			payment_desc_txt,
			payment_amt,
			payment_dt )
		SELECT
			v_customer_dbid,
			'Conversion to Sparkle Adjustment',
			v_total_adjustment,
			v_activity_date;

		SET v_payment_dbid = LAST_INSERT_ID();

		INSERT INTO sparkle_app.payment_dtl
		( 	payment_dtl_payment_dbid,
			payment_dtl_invoice_dbid,
			payment_dtl_payment_type_dbid,
			payment_dtl_desc,
			payment_dtl_applied_amt,
			payment_dtl_job_state )
		SELECT
			v_payment_dbid,
			v_invoice_dbid,
			v_payment_type,
			'Conversion to Sparkle Adjustment',
			v_total_adjustment,
			'WA';

	END IF;

	RETURN v_total_adjustment;
END;
$$
DELIMITER ;

UPDATE sparkle_app.invoice SET invoice_balance_amt = sparkle_app.fn_get_invoice_balance_due(invoice_dbid)
WHERE invoice_invoice_status_dbid <> sparkle_app.fn_invoice_status_voided(); 

UPDATE sparkle_app.invoice SET invoice_balance_amt = 0
WHERE invoice_invoice_status_dbid = sparkle_app.fn_invoice_status_voided(); 

## zero out closed credit memos
SELECT sum(sparkle_app.fn_invoice_zero_out(invoice_dbid,300))
FROM sparkle_app.invoice 
WHERE invoice_balance_amt<>0 
AND invoice_total_amt<0
AND invoice_invoice_status_dbid=sparkle_app.fn_invoice_status_closed();

## zero out all other closed invoices
SELECT sum(sparkle_app.fn_invoice_zero_out(invoice_dbid,400))
FROM sparkle_app.invoice 
WHERE invoice_balance_amt<>0 
AND invoice_invoice_status_dbid=sparkle_app.fn_invoice_status_closed();

## zero out all other salmon creek cleaners invoices
SELECT sum(sparkle_app.fn_invoice_zero_out(invoice_dbid,500))
FROM sparkle_app.invoice_view 
WHERE invoice_balance_amt<>0 
AND customer_id='SALMON2';
##AND invoice_invoice_status_dbid=sparkle_app.fn_invoice_status_printed();

UPDATE sparkle_app.invoice SET invoice_balance_amt = sparkle_app.fn_get_invoice_balance_due(invoice_dbid);

UPDATE sparkle_app.invoice SET invoice_invoice_status_dbid = sparkle_app.fn_invoice_status_closed()
WHERE invoice_invoice_status_dbid = sparkle_app.fn_invoice_status_printed()
AND invoice_balance_amt = 0;

DROP FUNCTION IF EXISTS sparkle_app.fn_invoice_zero_out;

#####################################################################
## real delete of dead data
#####################################################################

/*
DELETE FROM sparkle_app.jobdtl
WHERE sparkle_app.fn_get_customer_invoice_count(customer_dbid)=0;

DELETE FROM sparkle_app.job
WHERE sparkle_app.fn_get_customer_invoice_count(job_customer_dbid)=0;
*/

DELETE FROM sparkle_app.customer
WHERE sparkle_app.fn_get_customer_invoice_count(customer_dbid)=0 AND sparkle_app.fn_get_customer_job_count(customer_dbid)=0;

#####################################################################
## Compress tables for best speed
#####################################################################

ALTER TABLE sparkle_app.customer ENGINE = InnoDB;
ALTER TABLE sparkle_app.invoice ENGINE = InnoDB;
ALTER TABLE sparkle_app.invoice_dtl ENGINE = InnoDB;
ALTER TABLE sparkle_app.job ENGINE = InnoDB;
ALTER TABLE sparkle_app.job_dtl ENGINE = InnoDB;
ALTER TABLE sparkle_app.jobcode ENGINE = InnoDB;
ALTER TABLE sparkle_app.message ENGINE = InnoDB;
ALTER TABLE sparkle_app.payment ENGINE = InnoDB;
ALTER TABLE sparkle_app.payment_dtl ENGINE = InnoDB;
ALTER TABLE sparkle_app.user ENGINE = InnoDB;