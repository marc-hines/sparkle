SET SQL_SAFE_UPDATES=0;

USE sparkle_conversion;

DELETE FROM txt_jobcode WHERE col1="";
DELETE FROM txt_jobcode WHERE col1="-0-";
UPDATE txt_jobcode SET col2=null WHERE col2='-0-';
UPDATE txt_jobcode SET col3=null WHERE col3='-0-';
UPDATE txt_jobcode SET col4=null WHERE col4='-0-';
UPDATE txt_jobcode SET col5=null WHERE col5='-0-';
UPDATE txt_jobcode SET col6=null WHERE col6='-0-';

DELETE FROM txt_factors WHERE col1="";
DELETE FROM txt_factors WHERE col1="-0-";
UPDATE txt_factors SET col1=UPPER(col1) WHERE col1 IS NOT NULL;
UPDATE txt_factors SET col2=null WHERE col2='-0-';

DELETE FROM txt_cust WHERE col1="";
DELETE FROM txt_cust WHERE col1="-0-";
UPDATE txt_cust SET col2=null WHERE col2='-0-';
UPDATE txt_cust SET col3=null WHERE col3='-0-';
UPDATE txt_cust SET col3=col2, col2=null WHERE col3 IS NULL AND col2 IS NOT NULL ;
UPDATE txt_cust SET col4=null WHERE col4='-0-';
UPDATE txt_cust SET col5=null WHERE col5='-0-';
UPDATE txt_cust SET col6=null WHERE col6='-0-';
UPDATE txt_cust SET col7=null WHERE col7='-0-';
UPDATE txt_cust SET col7=UPPER(col7) WHERE col7 IS NOT NULL;
UPDATE txt_cust SET col8=null WHERE col8='-0-';
UPDATE txt_cust SET col9=null WHERE col9='-0-';
UPDATE txt_cust SET col9=REPLACE(col9,')', '.');
UPDATE txt_cust SET col9=REPLACE(col9,'(', '');
UPDATE txt_cust SET col9=REPLACE(col9,'-', '.');
UPDATE txt_cust SET col9=REPLACE(col9,' ', '');
UPDATE txt_cust SET col10=null WHERE col10='-0-';
UPDATE txt_cust SET col10=REPLACE(col10,')', '.');
UPDATE txt_cust SET col10=REPLACE(col10,'(', '');
UPDATE txt_cust SET col10=REPLACE(col10,'-', '.');
UPDATE txt_cust SET col10=REPLACE(col10,' ', '');
UPDATE txt_cust SET col11=null WHERE col11='-0-';
UPDATE txt_cust SET col11=REPLACE(col11,')', '.');
UPDATE txt_cust SET col11=REPLACE(col11,'(', '');
UPDATE txt_cust SET col11=REPLACE(col11,'-', '.');
UPDATE txt_cust SET col11=REPLACE(col11,' ', '');
UPDATE txt_cust SET col12=null WHERE col12='-0-';
UPDATE txt_cust SET col13=null WHERE col13='-0-';
UPDATE txt_cust SET col13=REPLACE(col13,'       ', '  ');
UPDATE txt_cust SET col13=REPLACE(col13,'      ', '  ');
UPDATE txt_cust SET col13=REPLACE(col13,'     ', '  ');
UPDATE txt_cust SET col13=REPLACE(col13,'    ', '  ');
UPDATE txt_cust SET col13=REPLACE(col13,'   ', '  ');
UPDATE txt_cust SET col13=REPLACE(col13,'  ', '<br>');
UPDATE txt_cust SET col13=REPLACE(col13,'<br> ', '<br>');
UPDATE txt_cust SET col13=REPLACE(col13,' <br>', '<br>');
UPDATE txt_cust SET col14=null WHERE col14='-0-';
UPDATE txt_cust SET col15=null WHERE col15='-0-';
UPDATE txt_cust SET col16=null WHERE col16='-0-';
UPDATE txt_cust SET col16=UPPER(col16) WHERE col16 IS NOT NULL;
UPDATE txt_cust SET col17=null WHERE col17='-0-';
UPDATE txt_cust SET col18=null WHERE col18='-0-';
UPDATE txt_cust SET col19=null WHERE col19='-0-';
UPDATE txt_cust SET col20=null WHERE col20='-0-';

DELETE FROM txt_ckdtl WHERE col1="";
DELETE FROM txt_ckdtl WHERE col1="-0-";
UPDATE txt_ckdtl SET col2=null WHERE col2='-0-';
UPDATE txt_ckdtl SET col3=null WHERE col3='-0-';
UPDATE txt_ckdtl SET col4=null WHERE col4='-0-';
UPDATE txt_ckdtl SET col5=0 WHERE col5='-0-';
UPDATE txt_ckdtl SET col6='200' WHERE col6='2';
UPDATE txt_ckdtl SET col6='100' WHERE col6<>'200';
UPDATE txt_ckdtl SET col7=null WHERE col7='-0-';
UPDATE txt_ckdtl SET col8=null WHERE col8='-0-';
UPDATE txt_ckdtl SET col9=null WHERE col9='-0-';
UPDATE txt_ckdtl SET col9=UPPER(col9) WHERE col9 IS NOT NULL;
UPDATE txt_ckdtl SET col9='OR' WHERE col9='O';
UPDATE txt_ckdtl SET col9='OR' WHERE col9='0';
UPDATE txt_ckdtl SET col9='WA' WHERE col9<>'OR';
UPDATE txt_ckdtl SET col10=null WHERE col10='-0-';
UPDATE txt_ckdtl SET dte3 = str_to_date(col3,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col3 IS NOT NULL;
UPDATE txt_ckdtl SET dte3 = dte3-INTERVAL 100 YEAR WHERE dte3 > "2015-01-01";

DELETE FROM txt_ckdtl2 WHERE col1="";
DELETE FROM txt_ckdtl2 WHERE col1="-0-";
UPDATE txt_ckdtl2 SET col2=null WHERE col2='-0-';
UPDATE txt_ckdtl2 SET col3=null WHERE col3='-0-';
UPDATE txt_ckdtl2 SET col3='06/18/1912AD' WHERE col3 = '06/18/0031BC';
UPDATE txt_ckdtl2 SET col4=null WHERE col4='-0-';
UPDATE txt_ckdtl2 SET col5=0 WHERE col5='-0-';
UPDATE txt_ckdtl2 SET col6='200' WHERE col6='2';
UPDATE txt_ckdtl2 SET col6='100' WHERE col6<>'200';
UPDATE txt_ckdtl2 SET col7=null WHERE col7='-0-';
UPDATE txt_ckdtl2 SET col8=null WHERE col8='-0-';
UPDATE txt_ckdtl2 SET col9=null WHERE col9='-0-';
UPDATE txt_ckdtl2 SET col9=UPPER(col9) WHERE col9 IS NOT NULL;
UPDATE txt_ckdtl2 SET col9='OR' WHERE col9='O';
UPDATE txt_ckdtl2 SET col9='OR' WHERE col9='0';
UPDATE txt_ckdtl2 SET col9='WA' WHERE col9<>'OR';
UPDATE txt_ckdtl2 SET col10=null WHERE col10='-0-';
UPDATE txt_ckdtl2 SET dte3 = str_to_date(col3,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col3 IS NOT NULL;
UPDATE txt_ckdtl2 SET dte3 = dte3-INTERVAL 100 YEAR WHERE dte3 > "2015-01-01";

DELETE FROM txt_empl WHERE col1="";
DELETE FROM txt_empl WHERE col1="-0-";
UPDATE txt_empl SET col2=null WHERE col2='-0-';
UPDATE txt_empl SET col3=null WHERE col3='-0-';
UPDATE txt_empl SET col4=null WHERE col4='-0-';
UPDATE txt_empl SET col5=null WHERE col5='-0-';
UPDATE txt_empl SET col6=null WHERE col6='-0-'; -- HAS GARBAGE yyy
UPDATE txt_empl SET col7=null WHERE col7='-0-';
UPDATE txt_empl SET col8=null WHERE col8='-0-'; -- HAS GARBAGE y
UPDATE txt_empl SET col9=null WHERE col9='-0-';
UPDATE txt_empl SET col10=UPPER(col10) WHERE col10 IS NOT NULL;
UPDATE txt_empl SET dte1 = str_to_date(col1,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col1 IS NOT NULL;
UPDATE txt_empl SET dte1 = dte1-INTERVAL 100 YEAR WHERE dte1 > "2015-01-01";

DELETE FROM txt_emplarc WHERE col1="";
DELETE FROM txt_emplarc WHERE col1="-0-";
UPDATE txt_emplarc SET col2=null WHERE col2='-0-';
UPDATE txt_emplarc SET col3=null WHERE col3='-0-';
UPDATE txt_emplarc SET col4=null WHERE col4='-0-';
UPDATE txt_emplarc SET col5=null WHERE col5='-0-';
UPDATE txt_emplarc SET col6=null WHERE col6='-0-';
UPDATE txt_emplarc SET col7=null WHERE col7='-0-';
UPDATE txt_emplarc SET col8=null WHERE col8='-0-';
UPDATE txt_emplarc SET col9=null WHERE col9='-0-';
UPDATE txt_emplarc SET col10=null WHERE col10='-0-';
UPDATE txt_empl SET col10=UPPER(col10) WHERE col10 IS NOT NULL;
UPDATE txt_emplarc SET dte1 = str_to_date(col1,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col1 IS NOT NULL;
UPDATE txt_emplarc SET dte1 = dte1-INTERVAL 100 YEAR WHERE dte1 > "2015-01-01";

DELETE FROM txt_job WHERE col1="";
DELETE FROM txt_job WHERE col1="-0-";
UPDATE txt_job SET col2=null WHERE col2='-0-';
UPDATE txt_job SET col3=null WHERE col3='-0-';
UPDATE txt_job SET col4=null WHERE col4='-0-';
UPDATE txt_job SET col5=null WHERE col5='-0-';
UPDATE txt_job SET col5=UPPER(col5) WHERE col5 IS NOT NULL;
UPDATE txt_job SET col6=null WHERE col6='-0-';
UPDATE txt_job SET col7=0 WHERE col7='-0-';
UPDATE txt_job SET col8=null WHERE col8='-0-';
UPDATE txt_job SET col9=0 WHERE col9='-0-';
UPDATE txt_job SET col10=0 WHERE col10='-0-';
UPDATE txt_job SET col11=0 WHERE col11='-0-';
UPDATE txt_job SET col12=0 WHERE col12='-0-';
UPDATE txt_job SET col13=0 WHERE col13='-0-';
UPDATE txt_job SET col14=0 WHERE col14='-0-';
UPDATE txt_job SET col15=null WHERE col15='-0-';
UPDATE txt_job SET col15=REPLACE(col15,')', '.');
UPDATE txt_job SET col15=REPLACE(col15,'(', '');
UPDATE txt_job SET col15=REPLACE(col15,'-', '.');
UPDATE txt_job SET col15=REPLACE(col15,' ', '');
UPDATE txt_job SET col16=null WHERE col16='-0-';
UPDATE txt_job SET col17=null WHERE col17='-0-';
UPDATE txt_job SET col18=null WHERE col18='-0-';
UPDATE txt_job SET col19=null WHERE col19='-0-';
UPDATE txt_job SET col20=null WHERE col20='-0-';
UPDATE txt_job SET dte6 = str_to_date(col6,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col6 IS NOT NULL;
UPDATE txt_job SET dte6 = dte6-INTERVAL 100 YEAR WHERE dte6 > "2015-01-01";

DELETE FROM txt_jobdtl WHERE col1="";
DELETE FROM txt_jobdtl WHERE col1="-0-";
DELETE FROM txt_jobdtl WHERE col2="-0-";
UPDATE txt_jobdtl SET col3=null WHERE col3='-0-';
UPDATE txt_jobdtl SET col3=UPPER(col3) WHERE col3 IS NOT NULL;
UPDATE txt_jobdtl SET col4=null WHERE col4='-0-';
UPDATE txt_jobdtl SET col4=REPLACE(col4,'       ', '  ');
UPDATE txt_jobdtl SET col4=REPLACE(col4,'      ', '  ');
UPDATE txt_jobdtl SET col4=REPLACE(col4,'     ', '  ');
UPDATE txt_jobdtl SET col4=REPLACE(col4,'    ', '  ');
UPDATE txt_jobdtl SET col4=REPLACE(col4,'   ', '  ');
UPDATE txt_jobdtl SET col4=REPLACE(col4,'  ', '<br>');
UPDATE txt_jobdtl SET col4=REPLACE(col4,'<br> ', '<br>');
UPDATE txt_jobdtl SET col4=REPLACE(col4,' <br>', '<br>');
UPDATE txt_jobdtl SET col5=null WHERE col5='-0-';
UPDATE txt_jobdtl SET col6=0 WHERE col6='-0-';
UPDATE txt_jobdtl SET col7=0 WHERE col7='-0-';
UPDATE txt_jobdtl SET col8=null WHERE col8='-0-';
UPDATE txt_jobdtl SET col9=null WHERE col9='-0-';
UPDATE txt_jobdtl SET col10=null WHERE col10='-0-';
UPDATE txt_jobdtl SET col11=null WHERE col11='-0-';
UPDATE txt_jobdtl SET col12=null WHERE col12='-0-';
UPDATE txt_jobdtl SET col12=REPLACE(col12,'       ', '  ');
UPDATE txt_jobdtl SET col12=REPLACE(col12,'      ', '  ');
UPDATE txt_jobdtl SET col12=REPLACE(col12,'     ', '  ');
UPDATE txt_jobdtl SET col12=REPLACE(col12,'    ', '  ');
UPDATE txt_jobdtl SET col12=REPLACE(col12,'   ', '  ');
UPDATE txt_jobdtl SET col12=REPLACE(col12,'  ', '<br>');
UPDATE txt_jobdtl SET col12=REPLACE(col12,'<br> ', '<br>');
UPDATE txt_jobdtl SET col12=REPLACE(col12,' <br>', '<br>');
UPDATE txt_jobdtl SET col13=null WHERE col13='-0-';
UPDATE txt_jobdtl SET col14=null WHERE col14='-0-';
UPDATE txt_jobdtl SET col15=null WHERE col15='-0-';
UPDATE txt_jobdtl SET col16=null WHERE col16='-0-';
UPDATE txt_jobdtl SET col17=0 WHERE col17='-0-';
UPDATE txt_jobdtl SET col18=0 WHERE col18='-0-';
UPDATE txt_jobdtl SET col19=null WHERE col19='-0-';
UPDATE txt_jobdtl SET col19=UPPER(col19) WHERE col19 IS NOT NULL;
UPDATE txt_jobdtl SET col20=0 WHERE col20='-0-';
UPDATE txt_jobdtl SET col21=null WHERE col21='-0-';
UPDATE txt_jobdtl SET col21=UPPER(col21) WHERE col21 IS NOT NULL;
UPDATE txt_jobdtl SET col22=0 WHERE col22='-0-';
UPDATE txt_jobdtl SET col23=null WHERE col23='-0-';
UPDATE txt_jobdtl SET col24=null WHERE col24='-0-';
UPDATE txt_jobdtl SET col25=null WHERE col25='-0-';
UPDATE txt_jobdtl SET dte9 = str_to_date(col9,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col9 IS NOT NULL;
UPDATE txt_jobdtl SET dte9 = dte9-INTERVAL 100 YEAR WHERE dte9 > "2015-01-01";

DELETE FROM txt_forms WHERE col1="";
DELETE FROM txt_forms WHERE col1="-0-";
UPDATE txt_forms SET col2=null WHERE col2='-0-';

# There is only one row of real data from this settings table
DELETE FROM txt_globset WHERE col1="";
UPDATE txt_globset SET col1=null WHERE col1='-0-';
UPDATE txt_globset SET col2=null WHERE col2='-0-';
UPDATE txt_globset SET col3=null WHERE col3='-0-';
UPDATE txt_globset SET col4=null WHERE col4='-0-';
UPDATE txt_globset SET col5=null WHERE col5='-0-';
UPDATE txt_globset SET col6=null WHERE col6='-0-';
UPDATE txt_globset SET col7=null WHERE col7='-0-';
UPDATE txt_globset SET col8=null WHERE col8='-0-';
UPDATE txt_globset SET col9=null WHERE col9='-0-';
UPDATE txt_globset SET col10=null WHERE col10='-0-';
UPDATE txt_globset SET col11=null WHERE col11='-0-';
UPDATE txt_globset SET col12=null WHERE col12='-0-';
UPDATE txt_globset SET col13=null WHERE col13='-0-';
UPDATE txt_globset SET col14=null WHERE col14='-0-';
UPDATE txt_globset SET col15=null WHERE col15='-0-';
UPDATE txt_globset SET col16=null WHERE col16='-0-';
UPDATE txt_globset SET col17=null WHERE col17='-0-';
UPDATE txt_globset SET col18=null WHERE col18='-0-';
UPDATE txt_globset SET col19=null WHERE col19='-0-';
UPDATE txt_globset SET col20=null WHERE col20='-0-';
UPDATE txt_globset SET col21=null WHERE col21='-0-';
UPDATE txt_globset SET col22=null WHERE col22='-0-';
UPDATE txt_globset SET col23=null WHERE col23='-0-';
UPDATE txt_globset SET col24=null WHERE col24='-0-';
UPDATE txt_globset SET col25=null WHERE col25='-0-';

DELETE FROM txt_messages WHERE col1="";
DELETE FROM txt_messages WHERE col1="-0-";
UPDATE txt_messages SET col1=UPPER(col1) WHERE col1 IS NOT NULL;
UPDATE txt_messages SET col2=null WHERE col2='-0-';
UPDATE txt_messages SET col2=REPLACE(col2,'       ', '  ');
UPDATE txt_messages SET col2=REPLACE(col2,'      ', '  ');
UPDATE txt_messages SET col2=REPLACE(col2,'     ', '  ');
UPDATE txt_messages SET col2=REPLACE(col2,'    ', '  ');
UPDATE txt_messages SET col2=REPLACE(col2,'   ', '  ');
UPDATE txt_messages SET col2=REPLACE(col2,'  ', '<br>');
UPDATE txt_messages SET col2=REPLACE(col2,'<br> ', '<br>');
UPDATE txt_messages SET col2=REPLACE(col2,'SEPERATE', 'SEPARATE');

DELETE FROM txt_notes WHERE col1="";
DELETE FROM txt_notes WHERE col1="-0-";
DELETE FROM txt_notes WHERE col1="-742326040";
DELETE FROM txt_notes WHERE col1="-1";
DELETE FROM txt_notes WHERE col1="0";
DELETE FROM txt_notes WHERE col1="1";
UPDATE txt_notes SET col2=null WHERE col2='-0-';
UPDATE txt_notes SET col3=null WHERE col3='-0-';
UPDATE txt_notes SET col4=null WHERE col4='-0-';
UPDATE txt_notes SET col2=REPLACE(col2,'       ', '  ');
UPDATE txt_notes SET col2=REPLACE(col2,'      ', '  ');
UPDATE txt_notes SET col2=REPLACE(col2,'     ', '  ');
UPDATE txt_notes SET col2=REPLACE(col2,'    ', '  ');
UPDATE txt_notes SET col2=REPLACE(col2,'   ', '  ');
UPDATE txt_notes SET col2=REPLACE(col2,'  ', '<br>');
UPDATE txt_notes SET col2=REPLACE(col2,'<br> ', '<br>');
UPDATE txt_notes SET col2=REPLACE(col2,'SEPERATE', 'SEPARATE');

DELETE FROM txt_notesarc WHERE col1="";
DELETE FROM txt_notesarc WHERE col1="-0-";
UPDATE txt_notesarc SET col2=null WHERE col2='-0-';
UPDATE txt_notesarc SET col3=null WHERE col3='-0-';
UPDATE txt_notesarc SET col4=null WHERE col4='-0-';
UPDATE txt_notesarc SET col3=REPLACE(col3,'       ', '  ');
UPDATE txt_notesarc SET col3=REPLACE(col3,'      ', '  ');
UPDATE txt_notesarc SET col3=REPLACE(col3,'     ', '  ');
UPDATE txt_notesarc SET col3=REPLACE(col3,'    ', '  ');
UPDATE txt_notesarc SET col3=REPLACE(col3,'   ', '  ');
UPDATE txt_notesarc SET col3=REPLACE(col3,'  ', '<br>');
UPDATE txt_notesarc SET col3=REPLACE(col3,'<br> ', '<br>');
UPDATE txt_notesarc SET col3=REPLACE(col3,' <br>', '<br>');
UPDATE txt_notesarc SET col3=REPLACE(col3,'SEPERATE', 'SEPARATE');

DELETE FROM txt_payroll WHERE col1="";
DELETE FROM txt_payroll WHERE col1="-0-";
UPDATE txt_payroll SET col2=null WHERE col2='-0-';
UPDATE txt_payroll SET col3=null WHERE col3='-0-';
UPDATE txt_payroll SET col4=0 WHERE col4='-0-';
UPDATE txt_payroll SET col5=null WHERE col5='-0-';
UPDATE txt_payroll SET col6=null WHERE col6='-0-';
UPDATE txt_payroll SET col7=0 WHERE col7='-0-';
UPDATE txt_payroll SET col8=0 WHERE col8='-0-';
UPDATE txt_payroll SET col9=null WHERE col9='-0-';
UPDATE txt_payroll SET col10=null WHERE col10='-0-';
UPDATE txt_payroll SET col11=null WHERE col11='-0-';
UPDATE txt_payroll SET col11=UPPER(col11) WHERE col11 IS NOT NULL;
UPDATE txt_payroll SET col12=null WHERE col12='-0-';
UPDATE txt_payroll SET col13=null WHERE col13='-0-';
UPDATE txt_payroll SET col14=null WHERE col14='-0-';
UPDATE txt_payroll SET col15=null WHERE col15='-0-';
UPDATE txt_payroll SET col15=UPPER(col15) WHERE col15 IS NOT NULL;
UPDATE txt_payroll SET col16=null WHERE col16='-0-';
UPDATE txt_payroll SET col17=null WHERE col17='-0-';
UPDATE txt_payroll SET col18=null WHERE col18='-0-';
UPDATE txt_payroll SET col19=null WHERE col19='-0-';
UPDATE txt_payroll SET col20=null WHERE col20='-0-';
UPDATE txt_payroll SET dte10 = str_to_date(col10,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col10 IS NOT NULL;
UPDATE txt_payroll SET dte10 = dte10-INTERVAL 100 YEAR WHERE dte10 > "2015-01-01";
UPDATE txt_payroll SET dte13 = str_to_date(col13,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col13 IS NOT NULL;
UPDATE txt_payroll SET dte13 = dte13-INTERVAL 100 YEAR WHERE dte13 > "2015-01-01";
UPDATE txt_payroll SET dte14 = str_to_date(col14,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col14 IS NOT NULL;
UPDATE txt_payroll SET dte14 = dte14-INTERVAL 100 YEAR WHERE dte14 > "2015-01-01";

DELETE FROM txt_reports WHERE col1="";
DELETE FROM txt_reports WHERE col1="-0-";
UPDATE txt_reports SET col2=null WHERE col2='-0-';
UPDATE txt_reports SET col3=null WHERE col3='-0-';

DELETE FROM txt_rules WHERE col1="";
DELETE FROM txt_rules WHERE col1="-0-";
UPDATE txt_rules SET col2=null WHERE col2='-0-';
UPDATE txt_rules SET col3=null WHERE col3='-0-';
UPDATE txt_rules SET col4=null WHERE col4='-0-';
UPDATE txt_rules SET col5=null WHERE col5='-0-';
UPDATE txt_rules SET col6=null WHERE col6='-0-';
UPDATE txt_rules SET col7=null WHERE col7='-0-';
UPDATE txt_rules SET col8=null WHERE col8='-0-';

DELETE FROM txt_salearc WHERE col1="";
DELETE FROM txt_salearc WHERE col3='-0-';#col3 is key
UPDATE txt_salearc SET col1=null WHERE col1='-0-';
UPDATE txt_salearc SET col2=null WHERE col2='-0-';
UPDATE txt_salearc SET col4=0 WHERE col4='-0-';
UPDATE txt_salearc SET col5=null WHERE col5='-0-';
UPDATE txt_salearc SET col6=null WHERE col6='-0-';
UPDATE txt_salearc SET col7=0 WHERE col7='-0-';
UPDATE txt_salearc SET col8=null WHERE col8='-0-';
UPDATE txt_salearc SET col9=null WHERE col9='-0-';
UPDATE txt_salearc SET dte2 = str_to_date(col2,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col2 IS NOT NULL;
UPDATE txt_salearc SET dte2 = dte2-INTERVAL 100 YEAR WHERE dte2 > "2015-01-01";
UPDATE txt_salearc SET dte9 = str_to_date(col9,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col9 IS NOT NULL;
UPDATE txt_salearc SET dte9 = dte9-INTERVAL 100 YEAR WHERE dte9 > "2015-01-01";

DELETE FROM txt_saledtl WHERE col1="";
DELETE FROM txt_saledtl WHERE col2='-0-';#col2 is key
DELETE FROM txt_saledtl WHERE col2='1';#col2 is key
UPDATE txt_saledtl SET col1=null WHERE col1='-0-';
UPDATE txt_saledtl SET col3=null WHERE col3='-0-';
UPDATE txt_saledtl SET col4=null WHERE col4='-0-';
UPDATE txt_saledtl SET col5=0 WHERE col5='-0-';
UPDATE txt_saledtl SET col6=null WHERE col6='-0-';
UPDATE txt_saledtl SET col7=null WHERE col7='-0-';
UPDATE txt_saledtl SET col8=null WHERE col8='-0-';
UPDATE txt_saledtl SET col8=UPPER(col8) WHERE col8 IS NOT NULL;
UPDATE txt_saledtl SET col9=null WHERE col9='-0-';
UPDATE txt_saledtl SET col9=UPPER(col9) WHERE col9 IS NOT NULL;
UPDATE txt_saledtl SET col10=null WHERE col10='-0-';
UPDATE txt_saledtl SET col11=null WHERE col11='-0-';
UPDATE txt_saledtl SET col12=null WHERE col12='-0-';
UPDATE txt_saledtl SET col13=0 WHERE col13='-0-';
UPDATE txt_saledtl SET col14=0 WHERE col14='-0-';
UPDATE txt_saledtl SET col15=null WHERE col15='-0-';
UPDATE txt_saledtl SET col16=null WHERE col16='-0-';
UPDATE txt_saledtl SET col17=null WHERE col17='-0-';
UPDATE txt_saledtl SET col17=UPPER(col17) WHERE col17 IS NOT NULL;
UPDATE txt_saledtl SET col18=0 WHERE col18='-0-';
UPDATE txt_saledtl SET col19=null WHERE col19='-0-';
UPDATE txt_saledtl SET col20=null WHERE col20='-0-';
UPDATE txt_saledtl SET col21=null WHERE col21='-0-';
UPDATE txt_saledtl SET col22=null WHERE col22='-0-';
UPDATE txt_saledtl SET col22=UPPER(col22) WHERE col22 IS NOT NULL;
UPDATE txt_saledtl SET col23=null WHERE col23='-0-';
UPDATE txt_saledtl SET col24=null WHERE col24='-0-';
UPDATE txt_saledtl SET col25=null WHERE col25='-0-';
UPDATE txt_saledtl SET dte6 = str_to_date(col6,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col6 IS NOT NULL;
UPDATE txt_saledtl SET dte6 = dte6-INTERVAL 100 YEAR WHERE dte6 > "2015-01-01";
UPDATE txt_saledtl SET dte15 = str_to_date(col15,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col15 IS NOT NULL;
UPDATE txt_saledtl SET dte15 = dte15-INTERVAL 100 YEAR WHERE dte15 > "2015-01-01";
UPDATE txt_saledtl SET dte19 = str_to_date(col19,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col19 IS NOT NULL;
UPDATE txt_saledtl SET dte19 = dte19-INTERVAL 100 YEAR WHERE dte19 > "2015-01-01";

DELETE FROM txt_saleinv WHERE col1="";
DELETE FROM txt_saleinv WHERE col3='-0-';#col3 is key
DELETE FROM txt_saleinv WHERE col3='-1';#col3 is key
DELETE FROM txt_saleinv WHERE col3='0';#col3 is key
DELETE FROM txt_saleinv WHERE col3='99595';#col3 is key
UPDATE txt_saleinv SET col1=null WHERE col1='-0-';
UPDATE txt_saleinv SET col2=null WHERE col2='-0-';
UPDATE txt_saleinv SET col4=0 WHERE col4='-0-';
UPDATE txt_saleinv SET col5=null WHERE col5='-0-';
UPDATE txt_saleinv SET col6=null WHERE col6='-0-';
UPDATE txt_saleinv SET col7=0 WHERE col7='-0-';
UPDATE txt_saleinv SET col8=null WHERE col8='-0-';
UPDATE txt_saleinv SET col9=0 WHERE col9='-0-';
UPDATE txt_saleinv SET col10=null WHERE col10='-0-';
UPDATE txt_saleinv SET dte2 = str_to_date(col2,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col2 IS NOT NULL;
UPDATE txt_saleinv SET dte2 = dte2-INTERVAL 100 YEAR WHERE dte2 > "2015-01-01";
UPDATE txt_saleinv SET dte10 = str_to_date(col10,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col10 IS NOT NULL;
UPDATE txt_saleinv SET dte10 = dte10-INTERVAL 100 YEAR WHERE dte10 > "2015-01-01";

DELETE FROM txt_saledtlarc WHERE col1="";
DELETE FROM txt_saledtlarc WHERE col2='-0-'; ##col2 is key
UPDATE txt_saledtlarc SET col1=null WHERE col1='-0-';
UPDATE txt_saledtlarc SET col3=0 WHERE col3='-0-';
UPDATE txt_saledtlarc SET col4=null WHERE col4='-0-';
UPDATE txt_saledtlarc SET col5=0 WHERE col5='-0-';
UPDATE txt_saledtlarc SET col6=null WHERE col6='-0-';
UPDATE txt_saledtlarc SET col7=null WHERE col7='-0-';
UPDATE txt_saledtlarc SET col8=null WHERE col8='-0-';
UPDATE txt_saledtlarc SET col8=UPPER(col8) WHERE col8 IS NOT NULL;
UPDATE txt_saledtlarc SET col9=null WHERE col9='-0-';
UPDATE txt_saledtlarc SET col9=UPPER(col9) WHERE col9 IS NOT NULL;
UPDATE txt_saledtlarc SET col10=null WHERE col10='-0-';
UPDATE txt_saledtlarc SET col11=null WHERE col11='-0-';
UPDATE txt_saledtlarc SET col12=null WHERE col12='-0-';
UPDATE txt_saledtlarc SET col13=0 WHERE col13='-0-';
UPDATE txt_saledtlarc SET col14=0 WHERE col14='-0-';
UPDATE txt_saledtlarc SET col15=null WHERE col15='-0-';
UPDATE txt_saledtlarc SET col16=null WHERE col16='-0-';
UPDATE txt_saledtlarc SET col17=null WHERE col17='-0-';
UPDATE txt_saledtlarc SET col17=UPPER(col17) WHERE col17 IS NOT NULL;
UPDATE txt_saledtlarc SET col18=0 WHERE col18='-0-';
UPDATE txt_saledtlarc SET col19=null WHERE col19='-0-';
UPDATE txt_saledtlarc SET col19=UPPER(col19) WHERE col19 IS NOT NULL;
UPDATE txt_saledtlarc SET col20=null WHERE col20='-0-';
UPDATE txt_saledtlarc SET col21=null WHERE col21='-0-';
UPDATE txt_saledtlarc SET col22=null WHERE col22='-0-';
UPDATE txt_saledtlarc SET col23=null WHERE col23='-0-';
UPDATE txt_saledtlarc SET col24=null WHERE col24='-0-';
UPDATE txt_saledtlarc SET col25=null WHERE col25='-0-';
UPDATE txt_saledtlarc SET dte6 = str_to_date(col6,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col6 IS NOT NULL;
UPDATE txt_saledtlarc SET dte6 = dte6-INTERVAL 100 YEAR WHERE dte6 > "2015-01-01";
UPDATE txt_saledtlarc SET dte15 = str_to_date(col15,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col15 IS NOT NULL;
UPDATE txt_saledtlarc SET dte15 = dte15-INTERVAL 100 YEAR WHERE dte15 > "2015-01-01";
UPDATE txt_saledtlarc SET dte20 = str_to_date(col20,"%m/%d/%YAD")+INTERVAL 100 YEAR WHERE col20 IS NOT NULL;
UPDATE txt_saledtlarc SET dte20 = dte20-INTERVAL 100 YEAR WHERE dte20 > "2015-01-01";

DELETE FROM txt_weekdays WHERE col1="";
DELETE FROM txt_weekdays WHERE col1="-0-";
UPDATE txt_weekdays SET col2=null WHERE col2='-0-';

DELETE FROM txt_zone WHERE col1="";
DELETE FROM txt_zone WHERE col1="-0-";
UPDATE txt_zone SET col2=null WHERE col2='-0-';

#####################################################################
## convert frequncy values
#####################################################################

UPDATE sparkle_conversion.txt_job SET txt_job.col5 = sparkle_app.fn_job_frequency_weekly() WHERE txt_job.col5='W';
UPDATE sparkle_conversion.txt_job SET txt_job.col5 = sparkle_app.fn_job_frequency_biweekly() WHERE txt_job.col5='B';
UPDATE sparkle_conversion.txt_job SET txt_job.col5 = sparkle_app.fn_job_frequency_monthly() WHERE txt_job.col5='M';
UPDATE sparkle_conversion.txt_job SET txt_job.col5 = sparkle_app.fn_job_frequency_on_call() 
  WHERE txt_job.col5 IS NULL 
    OR (txt_job.col5<>sparkle_app.fn_job_frequency_weekly() 
    AND txt_job.col5<>sparkle_app.fn_job_frequency_biweekly()
    AND txt_job.col5<>sparkle_app.fn_job_frequency_monthly());

UPDATE sparkle_conversion.txt_cust SET COL20=sparkle_app.fn_invoice_behavior_combine_all();

#####################################################################
## Consolidate customer Bill To's
#####################################################################

##############   NEST   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='NEST', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1 AND txt_cust.col1<>'NEST' AND ( txt_cust.col3 LIKE 'nest%' OR txt_cust.col3 LIKE 'n.e.s.t%');

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='NEST'
WHERE txt_jobdtl.col1=txt_cust.col1 AND ( txt_cust.col3 LIKE 'nest%' OR txt_cust.col3 LIKE 'n.e.s.t%');

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='NEST'
WHERE txt_ckdtl.col8=txt_cust.col1 AND ( txt_cust.col3 LIKE 'nest%' OR txt_cust.col3 LIKE 'n.e.s.t%');

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='NEST'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND ( txt_cust.col3 LIKE 'nest%' OR txt_cust.col3 LIKE 'n.e.s.t%');

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='NEST'
WHERE txt_saleinv.col1=txt_cust.col1 AND ( txt_cust.col3 LIKE 'nest%' OR txt_cust.col3 LIKE 'n.e.s.t%');

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='NEST'
WHERE txt_saledtl.col1=txt_cust.col1 AND ( txt_cust.col3 LIKE 'nest%' OR txt_cust.col3 LIKE 'n.e.s.t%');

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='NEST'
WHERE txt_salearc.col1=txt_cust.col1 AND ( txt_cust.col3 LIKE 'nest%' OR txt_cust.col3 LIKE 'n.e.s.t%');

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='NEST'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND ( txt_cust.col3 LIKE 'nest%' OR txt_cust.col3 LIKE 'n.e.s.t%');

UPDATE sparkle_conversion.txt_cust
SET txt_cust.col1='NEST', COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='L''OCCI2';

##############   TRADE SECRET TO: NEST   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='NEST', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1 AND txt_cust.col1<>'NEST' AND txt_cust.col3 LIKE 'trade secret%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='NEST'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'trade secret%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='NEST'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'trade secret%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='NEST'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'trade secret%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='NEST'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'trade secret%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='NEST'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'trade secret%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='NEST'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'trade secret%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='NEST'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'trade secret%';

UPDATE sparkle_conversion.txt_cust
SET COL2=col3, COL3='NEST INTERNATIONAL'
WHERE txt_cust.col1<>'NEST' AND txt_cust.col3 LIKE 'trade secret%';

##############   COAST TO COAST   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='COAST', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'COAST' AND txt_cust.col3 LIKE 'coast to coast%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='COAST'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'coast to coast%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='COAST'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'coast to coast%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='COAST'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'coast to coast%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='COAST'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'coast to coast%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='COAST'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'coast to coast%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='COAST'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'coast to coast%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='COAST'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'coast to coast%';

UPDATE sparkle_conversion.txt_cust
SET COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='COAST';

##############   Solutions Management   ##############

UPDATE sparkle_conversion.txt_cust
SET  COL3='Solutions Management'
WHERE txt_cust.col1='YANKEE3';

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='SOLMAN', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'SOLMAN' AND txt_cust.col3 LIKE 'solutions management%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='SOLMAN'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'solutions management%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='SOLMAN'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'solutions management%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='SOLMAN'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'solutions management%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='SOLMAN'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'solutions management%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='SOLMAN'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'solutions management%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='SOLMAN'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'solutions management%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='SOLMAN'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'solutions management%';

UPDATE sparkle_conversion.txt_cust
SET COL1='SOLMAN', COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='FASHI1';

##############   PHILLIPS EDISON & COMPANY   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='OPHILL1', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'OPHILL1' AND txt_cust.col3 LIKE 'PHILLIPS EDISON%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='OPHILL1'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PHILLIPS EDISON%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='OPHILL1'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'PHILLIPS EDISON%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='OPHILL1'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'PHILLIPS EDISON%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='OPHILL1'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PHILLIPS EDISON%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='OPHILL1'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PHILLIPS EDISON%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='OPHILL1'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PHILLIPS EDISON%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='OPHILL1'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PHILLIPS EDISON%';

UPDATE sparkle_conversion.txt_cust
SET COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='OPHILL1';

##############   ARCHIBALD CANDY COMPANY   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='SWEET1', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'SWEET1' AND txt_cust.col3 LIKE 'C/O ARCHIBALD%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='SWEET1'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'C/O ARCHIBALD%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='SWEET1'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'C/O ARCHIBALD%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='SWEET1'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'C/O ARCHIBALD%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='SWEET1'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'C/O ARCHIBALD%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='SWEET1'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'C/O ARCHIBALD%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='SWEET1'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'C/O ARCHIBALD%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='SWEET1'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'C/O ARCHIBALD%';

UPDATE sparkle_conversion.txt_cust
SET COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='SWEET1';

##############   PARTY FACTORY   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='PARTY2', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'PARTY2' AND txt_cust.col3 LIKE 'PARTY FACT%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='PARTY2'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PARTY FACT%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='PARTY2'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'PARTY FACT%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='PARTY2'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'PARTY FACT%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='PARTY2'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PARTY FACT%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='PARTY2'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PARTY FACT%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='PARTY2'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PARTY FACT%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='PARTY2'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'PARTY FACT%';

UPDATE sparkle_conversion.txt_cust
SET COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='PARTY2';

##############   American Seaboard   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='SEABOARD', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'SEABOARD' AND txt_cust.col3 LIKE 'american seaboard%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='SEABOARD'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'american seaboard%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='SEABOARD'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'american seaboard%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='SEABOARD'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'american seaboard%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='SEABOARD'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'american seaboard%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='SEABOARD'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'american seaboard%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='SEABOARD'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'american seaboard%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='SEABOARD'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'american seaboard%';

UPDATE sparkle_conversion.txt_cust
SET COL1='SEABOARD', COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='oameag1';

##############   Expert NJS - USC   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='ZQBARN1', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'ZQBARN1' AND (txt_cust.col3 like 'NATIONAL JANITORIAL%' OR  txt_cust.col3 like 'EXPERT NJS%');

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='ZQBARN1'
WHERE txt_jobdtl.col1=txt_cust.col1 AND (txt_cust.col3 like 'NATIONAL JANITORIAL%' OR  txt_cust.col3 like 'EXPERT NJS%');

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='ZQBARN1'
WHERE txt_ckdtl.col8=txt_cust.col1 AND (txt_cust.col3 like 'NATIONAL JANITORIAL%' OR  txt_cust.col3 like 'EXPERT NJS%');

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='ZQBARN1'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND (txt_cust.col3 like 'NATIONAL JANITORIAL%' OR  txt_cust.col3 like 'EXPERT NJS%');

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='ZQBARN1'
WHERE txt_saleinv.col1=txt_cust.col1 AND (txt_cust.col3 like 'NATIONAL JANITORIAL%' OR  txt_cust.col3 like 'EXPERT NJS%');

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='ZQBARN1'
WHERE txt_saledtl.col1=txt_cust.col1 AND (txt_cust.col3 like 'NATIONAL JANITORIAL%' OR  txt_cust.col3 like 'EXPERT NJS%');

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='ZQBARN1'
WHERE txt_salearc.col1=txt_cust.col1 AND (txt_cust.col3 like 'NATIONAL JANITORIAL%' OR  txt_cust.col3 like 'EXPERT NJS%');

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='ZQBARN1'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND (txt_cust.col3 like 'NATIONAL JANITORIAL%' OR  txt_cust.col3 like 'EXPERT NJS%');

UPDATE sparkle_conversion.txt_cust
SET COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='ZQBARN1';

##############   Rock Soft Futon   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='ROCKSOFT', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'ROCKSOFT' AND txt_cust.col3 like 'ROCK SOFT FUTON%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='ROCKSOFT'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 like 'ROCK SOFT FUTON%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='ROCKSOFT'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 like 'ROCK SOFT FUTON%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='ROCKSOFT'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 like 'ROCK SOFT FUTON%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='ROCKSOFT'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 like 'ROCK SOFT FUTON%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='ROCKSOFT'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 like 'ROCK SOFT FUTON%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='ROCKSOFT'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 like 'ROCK SOFT FUTON%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='ROCKSOFT'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 like 'ROCK SOFT FUTON%';

UPDATE sparkle_conversion.txt_cust
SET COL1='ROCKSOFT', COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='ROCK S2';

##############   Ellis Enterprises - NSC   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='ELLIS', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'ELLIS' AND txt_cust.col3 like 'ELLIS ENTER%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='ELLIS'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 like 'ELLIS ENTER%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='ELLIS'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 like 'ELLIS ENTER%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='ELLIS'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 like 'ELLIS ENTER%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='ELLIS'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 like 'ELLIS ENTER%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='ELLIS'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 like 'ELLIS ENTER%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='ELLIS'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 like 'ELLIS ENTER%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='ELLIS'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 like 'ELLIS ENTER%';

UPDATE sparkle_conversion.txt_cust
SET COL1='ELLIS', COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='J.CREW1';

##############   Forever 21 Inc.   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='FOREVER21', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'FOREVER21' AND txt_cust.col3 like 'FOREVER 21 INC%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='FOREVER21'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 like 'FOREVER 21 INC%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='FOREVER21'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 like 'FOREVER 21 INC%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='FOREVER21'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 like 'FOREVER 21 INC%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='FOREVER21'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 like 'FOREVER 21 INC%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='FOREVER21'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 like 'FOREVER 21 INC%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='FOREVER21'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 like 'FOREVER 21 INC%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='FOREVER21'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 like 'FOREVER 21 INC%';

UPDATE sparkle_conversion.txt_cust
SET COL1='FOREVER21', COL2=NULL, COL13=NULL, COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='FOREVE1';

##############   CLEANWAY - USC   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='CLEANWAY', txt_job.col18='0', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1  AND txt_cust.col1<>'CLEANWAY' AND (txt_cust.col3 like 'CLEANWAY -%' OR txt_cust.col3 like 'CLEANWAY IND%');

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='CLEANWAY'
WHERE txt_jobdtl.col1=txt_cust.col1 AND (txt_cust.col3 like 'CLEANWAY -%' OR txt_cust.col3 like 'CLEANWAY IND%');

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='CLEANWAY'
WHERE txt_ckdtl.col8=txt_cust.col1 AND (txt_cust.col3 like 'CLEANWAY -%' OR txt_cust.col3 like 'CLEANWAY IND%');

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='CLEANWAY'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND (txt_cust.col3 like 'CLEANWAY -%' OR txt_cust.col3 like 'CLEANWAY IND%');

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='CLEANWAY'
WHERE txt_saleinv.col1=txt_cust.col1 AND (txt_cust.col3 like 'CLEANWAY -%' OR txt_cust.col3 like 'CLEANWAY IND%');

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='CLEANWAY'
WHERE txt_saledtl.col1=txt_cust.col1 AND (txt_cust.col3 like 'CLEANWAY -%' OR txt_cust.col3 like 'CLEANWAY IND%');

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='CLEANWAY'
WHERE txt_salearc.col1=txt_cust.col1 AND (txt_cust.col3 like 'CLEANWAY -%' OR txt_cust.col3 like 'CLEANWAY IND%');

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='CLEANWAY'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND(txt_cust.col3 like 'CLEANWAY -%' OR txt_cust.col3 like 'CLEANWAY IND%');

UPDATE sparkle_conversion.txt_cust
SET COL1='CLEANWAY', COL20=sparkle_app.fn_invoice_behavior_combine_by_name()
WHERE txt_cust.col1='EDDIE11';

##############   CITY OF WEST LINN   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='WESTLINN', txt_job.col18='1'
WHERE txt_job.col1=txt_cust.col1 AND txt_cust.col1<>'WESTLINN' AND txt_cust.col3 like 'CITY OF WEST LINN%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='WESTLINN'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 like 'CITY OF WEST LINN%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='WESTLINN'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 like 'CITY OF WEST LINN%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='WESTLINN'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 like 'CITY OF WEST LINN%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='WESTLINN'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 like 'CITY OF WEST LINN%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='WESTLINN'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 like 'CITY OF WEST LINN%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='WESTLINN'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 like 'CITY OF WEST LINN%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='WESTLINN'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 like 'CITY OF WEST LINN%';

UPDATE sparkle_conversion.txt_cust
SET COL1='WESTLINN', COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='OZKWES1';

##############   JO-ANN FABRICS   ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='JO-ANN1', txt_job.col18='1'
WHERE txt_job.col1=txt_cust.col1 AND txt_cust.col1<>'JO-ANN1' AND txt_cust.col3 like 'JO-ANN FABRIC%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='JO-ANN1'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 like 'JO-ANN FABRIC%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='JO-ANN1'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 like 'JO-ANN FABRIC%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='JO-ANN1'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 like 'JO-ANN FABRIC%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='JO-ANN1'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 like 'JO-ANN FABRIC%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='JO-ANN1'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 like 'JO-ANN FABRIC%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='JO-ANN1'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 like 'JO-ANN FABRIC%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='JO-ANN1'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 like 'JO-ANN FABRIC%';

UPDATE sparkle_conversion.txt_cust
SET COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='JO-ANN1';

##############   WHELAN'S INTERNATIONAL  ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='WHELANS', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1 AND txt_cust.col1<>'WHELANS' AND txt_cust.col3 LIKE 'whelan''s%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='WHELANS'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'whelan''s%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='WHELANS'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'whelan''s%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='WHELANS'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'whelan''s%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='WHELANS'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'whelan''s%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='WHELANS'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'whelan''s%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='WHELANS'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'whelan''s%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='WHELANS'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'whelan''s%';

UPDATE sparkle_conversion.txt_cust
SET txt_cust.col1='WHELANS', COL2=NULL, COL13=NULL,COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='EDDIE1';

##############   Abercrombie and Fitch  ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='ABERCR', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1 AND txt_cust.col1<>'ABERCR' AND txt_cust.col3 LIKE 'Abercrombie and Fitch%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='ABERCR'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Abercrombie and Fitch%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='ABERCR'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'Abercrombie and Fitch%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='ABERCR'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'Abercrombie and Fitch%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='ABERCR'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Abercrombie and Fitch%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='ABERCR'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Abercrombie and Fitch%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='ABERCR'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Abercrombie and Fitch%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='ABERCR'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Abercrombie and Fitch%';

UPDATE sparkle_conversion.txt_cust
SET txt_cust.col1='ABERCR', COL2=NULL, COL13=NULL,COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='ABERCR1';

##############   ADVANCED INTERIORS  ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='ADVANC', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1 AND txt_cust.col1<>'ADVANC' AND txt_cust.col3 LIKE 'ADVANCED INTERIORS%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='ADVANC'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'ADVANCED INTERIORS%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='ADVANC'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'ADVANCED INTERIORS%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='ADVANC'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'ADVANCED INTERIORS%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='ADVANC'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'ADVANCED INTERIORS%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='ADVANC'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'ADVANCED INTERIORS%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='ADVANC'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'ADVANCED INTERIORS%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='ADVANC'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'ADVANCED INTERIORS%';

UPDATE sparkle_conversion.txt_cust
SET txt_cust.col1='ADVANC', COL2=NULL, COL13=NULL,COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='ADVANC1';

##############   Stitle Realty Services  ##############

UPDATE sparkle_conversion.txt_job, sparkle_conversion.txt_cust
SET txt_job.col1='STITLE', txt_job.col18='1', txt_job.col19=txt_cust.col2, txt_job.col20=txt_cust.col15 
WHERE txt_job.col1=txt_cust.col1 AND txt_cust.col1<>'STITLE' AND txt_cust.col3 LIKE 'Stitle Realty%';

UPDATE sparkle_conversion.txt_jobdtl, sparkle_conversion.txt_cust
SET txt_jobdtl.col1='STITLE'
WHERE txt_jobdtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Stitle Realty%';

UPDATE sparkle_conversion.txt_ckdtl, sparkle_conversion.txt_cust
SET txt_ckdtl.col8='STITLE'
WHERE txt_ckdtl.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'Stitle Realty%';

UPDATE sparkle_conversion.txt_ckdtl2, sparkle_conversion.txt_cust
SET txt_ckdtl2.col8='STITLE'
WHERE txt_ckdtl2.col8=txt_cust.col1 AND txt_cust.col3 LIKE 'Stitle Realty%';

UPDATE sparkle_conversion.txt_saleinv, sparkle_conversion.txt_cust
SET txt_saleinv.col1='STITLE'
WHERE txt_saleinv.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Stitle Realty%';

UPDATE sparkle_conversion.txt_saledtl, sparkle_conversion.txt_cust
SET txt_saledtl.col1='STITLE'
WHERE txt_saledtl.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Stitle Realty%';

UPDATE sparkle_conversion.txt_salearc, sparkle_conversion.txt_cust
SET txt_salearc.col1='STITLE'
WHERE txt_salearc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Stitle Realty%';

UPDATE sparkle_conversion.txt_saledtlarc, sparkle_conversion.txt_cust
SET txt_saledtlarc.col1='STITLE'
WHERE txt_saledtlarc.col1=txt_cust.col1 AND txt_cust.col3 LIKE 'Stitle Realty%';

UPDATE sparkle_conversion.txt_cust
SET txt_cust.col1='STITLE', COL2=NULL, COL13=NULL,COL20=sparkle_app.fn_invoice_behavior_combine_same_job()
WHERE txt_cust.col1='THE GA1';

##############  remove some duplications   ##############

UPDATE sparkle_conversion.txt_ckdtl SET col8='oalber6' WHERE col8='oalber5';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='oalber6' WHERE col8='oalber5';
UPDATE sparkle_conversion.txt_saleinv SET col1='oalber6' WHERE col1='oalber5';
UPDATE sparkle_conversion.txt_saledtl SET col1='oalber6' WHERE col1='oalber5';
UPDATE sparkle_conversion.txt_salearc SET col1='oalber6' WHERE col1='oalber5';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='oalber6' WHERE col1='oalber5';

UPDATE sparkle_conversion.txt_ckdtl SET col8='oalber3' WHERE col8='oalber2';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='oalber3' WHERE col8='oalber2';
UPDATE sparkle_conversion.txt_saleinv SET col1='oalber3' WHERE col1='oalber2';
UPDATE sparkle_conversion.txt_saledtl SET col1='oalber3' WHERE col1='oalber2';
UPDATE sparkle_conversion.txt_salearc SET col1='oalber3' WHERE col1='oalber2';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='oalber3' WHERE col1='oalber2';

UPDATE sparkle_conversion.txt_ckdtl SET col8='EMERAL1' WHERE col8='EMERAL2';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='EMERAL1' WHERE col8='EMERAL2';
UPDATE sparkle_conversion.txt_saleinv SET col1='EMERAL1' WHERE col1='EMERAL2';
UPDATE sparkle_conversion.txt_saledtl SET col1='EMERAL1' WHERE col1='EMERAL2';
UPDATE sparkle_conversion.txt_salearc SET col1='EMERAL1' WHERE col1='EMERAL2';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='EMERAL1' WHERE col1='EMERAL2';

UPDATE sparkle_conversion.txt_ckdtl SET col8='wjcpac1' WHERE col8='PACIFI1';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='wjcpac1' WHERE col8='PACIFI1';
UPDATE sparkle_conversion.txt_saleinv SET col1='wjcpac1' WHERE col1='PACIFI1';
UPDATE sparkle_conversion.txt_saledtl SET col1='wjcpac1' WHERE col1='PACIFI1';
UPDATE sparkle_conversion.txt_salearc SET col1='wjcpac1' WHERE col1='PACIFI1';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='wjcpac1' WHERE col1='PACIFI1';

UPDATE sparkle_conversion.txt_ckdtl SET col8='wjcpac1' WHERE col8='PACIFI';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='wjcpac1' WHERE col8='PACIFI';
UPDATE sparkle_conversion.txt_saleinv SET col1='wjcpac1' WHERE col1='PACIFI';
UPDATE sparkle_conversion.txt_saledtl SET col1='wjcpac1' WHERE col1='PACIFI';
UPDATE sparkle_conversion.txt_salearc SET col1='wjcpac1' WHERE col1='PACIFI';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='wjcpac1' WHERE col1='PACIFI';

UPDATE sparkle_conversion.txt_ckdtl SET col8='YANKEE2' WHERE col8='YANKEE1';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='YANKEE2' WHERE col8='YANKEE1';
UPDATE sparkle_conversion.txt_saleinv SET col1='YANKEE2' WHERE col1='YANKEE1';
UPDATE sparkle_conversion.txt_saledtl SET col1='YANKEE2' WHERE col1='YANKEE1';
UPDATE sparkle_conversion.txt_salearc SET col1='YANKEE2' WHERE col1='YANKEE1';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='YANKEE2' WHERE col1='YANKEE1';

UPDATE sparkle_conversion.txt_ckdtl SET col8='COLUMB3' WHERE col8='COLUMB1';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='COLUMB3' WHERE col8='COLUMB1';
UPDATE sparkle_conversion.txt_saleinv SET col1='COLUMB3' WHERE col1='COLUMB1';
UPDATE sparkle_conversion.txt_saledtl SET col1='COLUMB3' WHERE col1='COLUMB1';
UPDATE sparkle_conversion.txt_salearc SET col1='COLUMB3' WHERE col1='COLUMB1';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='COLUMB3' WHERE col1='COLUMB1';

DELETE FROM sparkle_conversion.txt_job WHERE col1='OTHOMA2';
DELETE FROM sparkle_conversion.txt_jobdtl WHERE col1='OTHOMA2';
UPDATE sparkle_conversion.txt_ckdtl SET col8='OTHOMA1' WHERE col8='OTHOMA2';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='OTHOMA1' WHERE col8='OTHOMA2';
UPDATE sparkle_conversion.txt_saleinv SET col1='OTHOMA1' WHERE col1='OTHOMA2';
UPDATE sparkle_conversion.txt_saledtl SET col1='OTHOMA1' WHERE col1='OTHOMA2';
UPDATE sparkle_conversion.txt_salearc SET col1='OTHOMA1' WHERE col1='OTHOMA2';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='OTHOMA1' WHERE col1='OTHOMA2';

DELETE FROM sparkle_conversion.txt_job WHERE col1='BELLA';
DELETE FROM sparkle_conversion.txt_jobdtl WHERE col1='BELLA';
UPDATE sparkle_conversion.txt_ckdtl SET col8='ozkbel1' WHERE col8='BELLA';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='ozkbel1' WHERE col8='BELLA';
UPDATE sparkle_conversion.txt_saleinv SET col1='ozkbel1' WHERE col1='BELLA';
UPDATE sparkle_conversion.txt_saledtl SET col1='ozkbel1' WHERE col1='BELLA';
UPDATE sparkle_conversion.txt_salearc SET col1='ozkbel1' WHERE col1='BELLA';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='ozkbel1' WHERE col1='BELLA';

DELETE FROM sparkle_conversion.txt_job WHERE col1='BELLA 1';
DELETE FROM sparkle_conversion.txt_jobdtl WHERE col1='BELLA 1';
UPDATE sparkle_conversion.txt_ckdtl SET col8='ozkbel1' WHERE col8='BELLA 1';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='ozkbel1' WHERE col8='BELLA 1';
UPDATE sparkle_conversion.txt_saleinv SET col1='ozkbel1' WHERE col1='BELLA 1';
UPDATE sparkle_conversion.txt_saledtl SET col1='ozkbel1' WHERE col1='BELLA 1';
UPDATE sparkle_conversion.txt_salearc SET col1='ozkbel1' WHERE col1='BELLA 1';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='ozkbel1' WHERE col1='BELLA 1';

DELETE FROM sparkle_conversion.txt_job WHERE col1='walkin2';
DELETE FROM sparkle_conversion.txt_jobdtl WHERE col1='walkin2';
UPDATE sparkle_conversion.txt_ckdtl SET col8='WALKIN1' WHERE col8='walkin2';
UPDATE sparkle_conversion.txt_ckdtl2 SET col8='WALKIN1' WHERE col8='walkin2';
UPDATE sparkle_conversion.txt_saleinv SET col1='WALKIN1' WHERE col1='walkin2';
UPDATE sparkle_conversion.txt_saledtl SET col1='WALKIN1' WHERE col1='walkin2';
UPDATE sparkle_conversion.txt_salearc SET col1='WALKIN1' WHERE col1='walkin2';
UPDATE sparkle_conversion.txt_saledtlarc SET col1='WALKIN1' WHERE col1='walkin2';


#####################################################################
## Compress tables for best speed
#####################################################################
ALTER TABLE txt_jobcode ENGINE = InnoDB;
ALTER TABLE txt_factors ENGINE = InnoDB;
ALTER TABLE txt_cust ENGINE = InnoDB;
ALTER TABLE txt_ckdtl ENGINE = InnoDB;
ALTER TABLE txt_ckdtl2 ENGINE = InnoDB;
ALTER TABLE txt_empl ENGINE = InnoDB;
ALTER TABLE txt_emplarc ENGINE = InnoDB;
ALTER TABLE txt_job ENGINE = InnoDB;
ALTER TABLE txt_jobdtl ENGINE = InnoDB;
ALTER TABLE txt_forms ENGINE = InnoDB;
ALTER TABLE txt_globset ENGINE = InnoDB;
ALTER TABLE txt_messages ENGINE = InnoDB;
ALTER TABLE txt_notes ENGINE = InnoDB;
ALTER TABLE txt_notesarc ENGINE = InnoDB;
ALTER TABLE txt_payroll ENGINE = InnoDB;
ALTER TABLE txt_reports ENGINE = InnoDB;
ALTER TABLE txt_rules ENGINE = InnoDB;
ALTER TABLE txt_salearc ENGINE = InnoDB;
ALTER TABLE txt_saledtl ENGINE = InnoDB;
ALTER TABLE txt_saleinv ENGINE = InnoDB;
ALTER TABLE txt_saledtlarc ENGINE = InnoDB;
ALTER TABLE txt_weekdays ENGINE = InnoDB;
ALTER TABLE txt_zone ENGINE = InnoDB;
