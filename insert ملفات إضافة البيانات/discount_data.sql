SET DEFINE OFF;
Insert into DISCOUNT
   (DISC_ID, DISC_NAME, PERCENT_CASH, IN_TAX)
 Values
   (1, 'social_insurance', '1', '1');
Insert into DISCOUNT
   (DISC_ID, DISC_NAME, PERCENT_CASH, IN_TAX)
 Values
   (2, 'installment', '0', '0');
COMMIT;
