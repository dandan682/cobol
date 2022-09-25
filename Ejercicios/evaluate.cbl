       IDENTIFICATION DIVISION.

       PROGRAM-ID.     EVAL01.
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01  STUDENT-NAME               PIC X(20).
       01  STUDENT-MARK-1             PIC 999.
       01  STUDENT-MARK-2             PIC 999.
       01  A                          PIC 999.
       01  KODE                       PIC 9.
           88 ADD-RECORD              VALUE 1.
           88 DELETE-RECORD           VALUE 2.
           88 ADDRESS-CHANGE          VALUE 3.
           88 NAME-CHANGE             VALUE 4.
           88 CREDIT-CHANGE           VALUE 5.
           88 CODE-ERROR              VALUE 0 6 THRU 9.
           
       PROCEDURE DIVISION.
      *    EVALUATE COMPLEJO

           DISPLAY 'ENTER STUDENT NAME'
           ACCEPT STUDENT-NAME
           DISPLAY 'GRADE 1 (40 A 100):'
           ACCEPT STUDENT-MARK-1
           DISPLAY 'GRADE 2 (40 A 100):'
           ACCEPT STUDENT-MARK-2
           EVALUATE (STUDENT-MARK-1 + STUDENT-MARK-2) / 2
              WHEN 40 THRU 49.9 DISPLAY 'THIRD CLASS'
              WHEN 50 THRU 59.9 DISPLAY 'LOWER SECOND'
              WHEN 60 THRU 69.9 DISPLAY 'UPPER SECOND'
              WHEN 70 THRU 100  DISPLAY 'FIRST CLASS'
              WHEN OTHER        DISPLAY 'PROG OR DATA ERROR!'
           END-EVALUATE

      *    EVALUATE SIMPLE
           DISPLAY 'VALUE OF A (NUMERIC):'
           ACCEPT A
           DISPLAY 'VALOR DE A:*' A '*'
           EVALUATE TRUE 
              WHEN A > 10
                 DISPLAY 'A IS GREATER THAN 10'
              WHEN A > 5
                 DISPLAY 'A IS GRATER THAN 5 BUT LESS THAN 10'
              WHEN A > 0
                 DISPLAY 'A IS GREATER THAH 0 BUT LES THAN 5'
              WHEN OTHER
                 DISPLAY 'INVALID VALUE OF A'
           END-EVALUATE 
           
      *    EVALUATE IDENTIFIER.
      
           DISPLAY 'KODE ACCTION (DE 1 A 5): ' WITH NO ADVANCING 
           ACCEPT KODE 
           EVALUATE KODE
              WHEN 1               PERFORM ADDITION
              WHEN 2               PERFORM DELETION
              WHEN 3               PERFORM CHANGE-ADDRESS
              WHEN 4               PERFORM CHANGE-NAME
              WHEN 5               PERFORM CHANGE-CREDIT
              WHEN OTHER           PERFORM ERROR-CODE                    
           END-EVALUATE

      *    EVALUATE 88
           EVALUATE TRUE
              WHEN ANY             DISPLAY 'ANY'
              WHEN ADD-RECORD      PERFORM ADDITION
              WHEN DELETE-RECORD   PERFORM DELETION
              WHEN ADDRESS-CHANGE  PERFORM CHANGE-ADDRESS
              WHEN NAME-CHANGE     PERFORM CHANGE-NAME
              WHEN CREDIT-CHANGE   PERFORM CHANGE-CREDIT
              WHEN OTHER           PERFORM ERROR-CODE
           END-EVALUATE
           GOBACK.

       ADDITION.
           DISPLAY 'ADDITION'.
       DELETION.
           DISPLAY 'DELETION'.
       CHANGE-ADDRESS.
           DISPLAY 'CHANGE-ADDRESS'.
       CHANGE-NAME.
           DISPLAY 'CHANGE-NAME'.
       CHANGE-CREDIT.
           DISPLAY 'CHANGE-CREDIT'.
       ERROR-CODE.
           DISPLAY 'ERROR-CODE'.
