       IDENTIFICATION DIVISION.
       PROGRAM-ID.     EVAL01.
       DATA DIVISION.
       WORKING-STORAGE SECTION. 
       01  STUDENT-NAME               PIC X(20).
       01  STUDENT-MAARK-1            PIC 999.
       01  STUDENT-MAARK-2            PIC 999.
       01  A                          PIC 99.
       PROCEDURE DIVISION.
           DISPLAY 'ENTER STUDENT NAME'
           ACCEPT STUDENT-NAME
           DISPLAY 'GRADE 1:'
           ACCEPT STUDENT-MAARK-1
           DISPLAY 'GRADE 2:'
           ACCEPT STUDENT-MAARK-2
           EVALUATE (STUDENT-MAARK-1 + STUDENT-MAARK-2) / 2
              WHEN 40 THRU 49.9 DISPLAY 'THIRD CLASS'
              WHEN 50 THRU 59.9 DISPLAY 'LOWER SECOND'
              WHEN 60 THRU 69.9 DISPLAY 'UPPER SECOND'
              WHEN 70 THRU 100  DISPLAY 'FIRST CLASS'
              WHEN OTHER        DISPLAY 'PROG OR DATA ERROR!'
           END-EVALUATE
           DISPLAY 'VALUE OF A:'
           ACCEPT A
           EVALUATE TRUE 
              WHEN A > 10
                 DISPLAY 'A IS GREATER THAN 10'
              WHEN A > 5
                 DISPLAY 'A IS GRATER THAN 5 BUT LESS THAN 10'
              WHEN A > 0
                 DISPLAY 'A IS GREATER THAH 0 BUT LES THAN 5'
              WHEN OTHER
                 DISPLAY 'IINVALID VALUE OF A'
           END-EVALUATE 
           GOBACK.
