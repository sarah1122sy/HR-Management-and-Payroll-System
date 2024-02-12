SET DEFINE OFF;
Insert into COMPENSATION
   (COMPEN_ID, COMPEN_NAME, PERCENT_CASH, IN_TAX)
 Values
   (3, 'housing', '1', '0');
Insert into COMPENSATION
   (COMPEN_ID, COMPEN_NAME, PERCENT_CASH, IN_TAX)
 Values
   (1, 'family', '0', '1');
Insert into COMPENSATION
   (COMPEN_ID, COMPEN_NAME, PERCENT_CASH, IN_TAX)
 Values
   (2, 'food', '0', '1');
Insert into COMPENSATION
   (COMPEN_ID, COMPEN_NAME, PERCENT_CASH, IN_TAX)
 Values
   (4, 'work_nature', '1', '0');
COMMIT;
