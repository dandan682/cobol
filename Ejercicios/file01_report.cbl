       IDENTIFICATION DIVISION. 
       PROGRAM-ID.     FILE04.
      ***************************************
       ENVIRONMENT DIVISION.
      ***************************************
       INPUT-OUTPUT SECTION. 
      ***************************************
       FILE-CONTROL. 
           SELECT CUSTOMER-REPORT ASSIGN TO "CUSTOMER.RPT"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CUSTOMER-FILE ASSIGN TO "CUSTOMER.DAT"
              ORGANIZATION IS LINE SEQUENTIAL.
      ***************************************      
       DATA DIVISION. 
      ***************************************
       FILE SECTION. 
      ***************************************
       FD CUSTOMER-REPORT.
       01 PRINT-LINE               PIC X(44).
      ***************************************
       FD CUSTOMER-FILE.
       01 CUSTOMERDATA.
           02 IDNUM                PIC 9(5).
           02 CUSTNAME.
              03 FIRSTNAME         PIC X(15). 
              03 LASTNAME          PIC X(15).  
           88 WS-EOF               VALUE HIGH-VALUE.
      **************************************
       WORKING-STORAGE SECTION. 
       01 PAGE-HEADING.
          02 FILLER                PIC X(13) VALUE 'CUSTOMER LIST'.
       01 PAGE-FOOTING.
          02 FILLER                PIC X(15) VALUE SPACE.
          02 FILLER                PIC X(17) VALUE 'PAGE: '.
          02 PRN-PAGENUM PIC Z9.
       01 HEADER                   PIC X(36) VALUE 
             'IDNUM         FIRST NAME   LAST NAME'
      ***************************************
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
