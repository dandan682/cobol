       IDENTIFICATION DIVISION.
       PROGRAM-ID.     EVAL01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 AGE          PIC 99 VALUE 0.
       01 CANVOTEFLAG  PIC 9  VALUE 0.
          88 CANVOTE   VALUE 1.
          88 CANTVOTE  VALUE 0.
       01 TESTNUMBER   PIC X.
          88 ISPRIME   VALUE '1', '3', '5', '7'.
          88 ISODD     VALUE '1', '3', '5', '7', '9'.
          88 ISEVEN    VALUE '2', '4', '6', '8'.
          88 LESSTHAN5 VALUE '1' THRU '4'.
          88 ANUMBER   VALUE '0' THRU '9'.
       PROCEDURE DIVISION.
           DISPLAY 'ENTER AGE: ' WITH NO ADVANCING 
           ACCEPT AGE
           IF AGE > 18 THEN 
              SET CANVOTE TO TRUE
           ELSE
              SET CANTVOTE TO TRUE
           END-IF 
           DISPLAY 'VOTE: ' CANVOTEFLAG
           DISPLAY 'ENTER SINGLE NUMBER OR X TO EXIT'
           PERFORM UNTIL NOT ANUMBER 
              EVALUATE TRUE 
                 WHEN ISPRIME   DISPLAY 'PRIME'
                 WHEN ISODD     DISPLAY 'ODD'
                 WHEN ISEVEN    DISPLAY 'EVEN'
                 WHEN LESSTHAN5 DISPLAY 'LESS THAN 5'
                 WHEN OTHER     DISPLAY 'DEFAULT ACTION'
              END-EVALUATE 
              ACCEPT TESTNUMBER 
           END-PERFORM   
           GOBACK.
