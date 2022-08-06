       IDENTIFICATION DIVISION. 
       PROGRAM-ID.     FILE03.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT CUSTOMERFILE ASSIGN TO "CUSTOMER.DAT"
              ORGANIZATION IS LINE SEQUENTIAL
              ACCESS IS SEQUENTIAL. 
       DATA DIVISION. 
       FILE SECTION. 
       FD CUSTOMERFILE.
       01 CUSTOMERDATA.
           02 IDNUM                PIC 9(5).
           02 CUSTNAME.
              03 FIRSTNAME         PIC X(15). 
              03 LASTNAME          PIC X(15).  
       WORKING-STORAGE SECTION. 
       01 WS-CUSTOMER.
           02 WS-IDNUM             PIC 9(5).
           02 WS-CUSTNAME.
              03 WS-FIRSTNAME      PIC X(15). 
              03 WS-LASTNAME       PIC X(15). 
       01 WS-EOF                   PIC A(1).
       PROCEDURE DIVISION.
           OPEN INPUT CUSTOMERFILE 
           PERFORM UNTIL WS-EOF = 'Y' 
              READ CUSTOMERFILE INTO WS-CUSTOMER
                 AT END MOVE 'Y' TO WS-EOF
                 NOT AT END DISPLAY WS-CUSTOMER 
           END PERFORM      
           CLOSE CUSTOMERFILE 
           GOBACK.
       END PROGRAM FILE03.
