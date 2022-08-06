       IDENTIFICATION DIVISION. 
       PROGRAM-ID.     FILE04.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
           SELECT CUSTOMERREPORT ADDIGN TO "CUSTOMER.RPT"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CUSTOMERFILE ASSIGN TO "CUSTOMER.DAT"
              ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION. 
       FILE SECTION. 
       FD CUSTOMERREPORT.
       01 PRINTLINE                PIC X(44).
       FD CUSTOMERFILE.
       01 CUSTOMERDATA.
           02 IDNUM                PIC 9(5).
           02 CUSTNAME.
              03 FIRSTNAME         PIC X(15). 
              03 LASTNAME          PIC X(15).  
           88 WS-EOF               VALUE HIGH-VALUE.
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
              END-READ
           END-PERFORM      
           CLOSE CUSTOMERFILE 
           GOBACK.
       END PROGRAM FILE04.
