SET DEFINE OFF;
Insert into REWARD
   (REWARD_ID, EMPLOYEE_EMP_ID, VALUE_IN_MONTH, REWARD_DATE, FOR_N_MONTHS)
 Values
   (1, 1, 1000, TO_DATE('12/28/2021', 'MM/DD/YYYY'), 2);
Insert into REWARD
   (REWARD_ID, EMPLOYEE_EMP_ID, VALUE_IN_MONTH, REWARD_DATE, FOR_N_MONTHS)
 Values
   (2, 1, 75, TO_DATE('11/28/2021', 'MM/DD/YYYY'), 1);
Insert into REWARD
   (REWARD_ID, EMPLOYEE_EMP_ID, VALUE_IN_MONTH, REWARD_DATE, FOR_N_MONTHS)
 Values
   (3, 4, 6000, TO_DATE('12/28/2021', 'MM/DD/YYYY'), 1);
Insert into REWARD
   (REWARD_ID, EMPLOYEE_EMP_ID, VALUE_IN_MONTH, REWARD_DATE, FOR_N_MONTHS)
 Values
   (4, 2, 2000, TO_DATE('8/30/2021', 'MM/DD/YYYY'), 5);
Insert into REWARD
   (REWARD_ID, EMPLOYEE_EMP_ID, VALUE_IN_MONTH, REWARD_DATE, FOR_N_MONTHS)
 Values
   (5, 3, 1500, TO_DATE('7/28/2021', 'MM/DD/YYYY'), 4);
COMMIT;
