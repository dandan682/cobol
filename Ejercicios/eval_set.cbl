       IDENTIFICATION DIVISION.
       PROGRAM-ID.     EVAL01.
       DATA DIVISION.
       WORKING-STORAGE.
       01 CANVOTEFLAG  PIC 9 VALUE 0.
          88 CANVOTE   VALUE 1.
          88 CANTVOTE  VALUE 0.
       01 TESTNUMBER   PIC X.
          88 ISPRIME   VALUE '1', '3', '5', '7'.
          88 ISODD     VALUE '1', '3', '5', '7', '9'.
          88 ISEVEN    VALUE '2', '4', '6', '8'.
          88 LESSTHAN5 VALUE '1' THRU '4'.
          88 ANUMBER   VALUE '0' THRU '9'.
       PROCEDURE DIVISION.
           
           GOBACK.