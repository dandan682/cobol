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
          88 ISEVEN    VALUE '2', '6', '8'.
          88 LESSTHAN5 VALUE '1' THRU '4'.
          88 ANUMBER   VALUE '0' THRU '9'.
       01 EMPLOYEE-CODE PIC X.
          88 MALE      VALUE '1'.
          88 FEMALE    VALUE '2'.
          88 ERROR-SEX-CODE VALUE LOW-VALUES THRU ZERO 
                        '3' THRU HIGH-VALUES. 
       PROCEDURE DIVISION.
           DISPLAY 'ENTER AGE TO CHECK VOTING: ' WITH NO ADVANCING 
           ACCEPT AGE
           IF AGE > 18 THEN 
              SET CANVOTE TO TRUE
           ELSE
              SET CANTVOTE TO TRUE
           END-IF 
           DISPLAY 'VOTE: ' CANVOTEFLAG
           SET ISEVEN TO TRUE
           DISPLAY 'TEST NUMBER: ' TESTNUMBER 
           DISPLAY 'ENTER SINGLE NUMBER OR X TO EXIT'
           ACCEPT TESTNUMBER 
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
           DISPLAY 'ENTER SEXODE 1 OR 2'
           ACCEPT EMPLOYEE-CODE.
           EVALUATE TRUE
              WHEN MALE DISPLAY 'MALE'
              WHEN FEMALE DISPLAY 'FEMALE'
              WHEN ERROR-SEX-CODE DISPLAY 'ERROR SEX CODE'
              WHEN OTHER DISPLAY 'DEFAULT CONDITION'
           END-EVALUATE
           GOBACK.
