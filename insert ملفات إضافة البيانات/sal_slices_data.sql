SET DEFINE OFF;
Insert into SAL_SLICE
   (SLICE_ID, FROM_SAL, TO_SAL, PERCENT)
 Values
   (1, 1, 50000, 0);
Insert into SAL_SLICE
   (SLICE_ID, FROM_SAL, TO_SAL, PERCENT)
 Values
   (2, 50001, 80000, 4);
Insert into SAL_SLICE
   (SLICE_ID, FROM_SAL, TO_SAL, PERCENT)
 Values
   (3, 80001, 110000, 6);
Insert into SAL_SLICE
   (SLICE_ID, FROM_SAL, TO_SAL, PERCENT)
 Values
   (4, 110001, 140000, 8);
Insert into SAL_SLICE
   (SLICE_ID, FROM_SAL, TO_SAL, PERCENT)
 Values
   (5, 140001, 170000, 10);
Insert into SAL_SLICE
   (SLICE_ID, FROM_SAL, TO_SAL, PERCENT)
 Values
   (6, 170001, 200000, 12);
Insert into SAL_SLICE
   (SLICE_ID, FROM_SAL, TO_SAL, PERCENT)
 Values
   (7, 200001, 230000, 14);
Insert into SAL_SLICE
   (SLICE_ID, FROM_SAL, TO_SAL, PERCENT)
 Values
   (8, 230001, 260000, 16);
Insert into SAL_SLICE
   (SLICE_ID, FROM_SAL, TO_SAL, PERCENT)
 Values
   (9, 260001, 999999999999999, 18);
COMMIT;
