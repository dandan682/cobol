       IDENTIFICATION DIVISION. 
       PROGRAM-ID.     FILE04.
      ***************************************
       ENVIRONMENT DIVISION.
      ***************************************
       INPUT-OUTPUT SECTION. 
      ***************************************
       FILE-CONTROL. 
           SELECT CUSTOMER-REPORT  ASSIGN TO "customer.rpt"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CUSTOMER-FILE    ASSIGN TO "customer.dat"
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
             ' IDNUM    FIRST NAME       LAST NAME'.
       01 CUSTOMER-DETAIL-LINE.
          02 FILLER                PIC X VALUE SPACE. 
          02 PRN-CUSTID            PIC 9(5).
          02 FILLER                PIC X(4) VALUE SPACE.
          02 PRN-FIRSTNAME         PIC X(15).
          02 FILLER                PIC XX VALUE SPACE.
          02 PRN-LASTNAME          PIC X(15).
       01 REPORT-FOOTING           PIC X(13) VALUE 'END OF REPORT'.
       01 LINE-COUNT               PIC 99 VALUE ZERO.
          88 NEW-PAGE-REQUIRED     VALUE 40 THRU 99.
       01 PAGE-COUNT               PIC 99 VALUE ZERO.
      ***************************************
       PROCEDURE DIVISION.
           OPEN INPUT CUSTOMER-FILE 
           OPEN OUTPUT CUSTOMER-REPORT
           PERFORM PRINT-PAGE-HEADING.
           READ CUSTOMER-FILE
              AT END SET WS-EOF TO TRUE
           END-READ
           PERFORM PRINT-REPORT-BODY UNTIL WS-EOF
           WRITE PRINT-LINE FROM REPORT-FOOTING AFTER ADVANCING 5
              LINES 
           CLOSE CUSTOMER-FILE, CUSTOMER-REPORT 
           GOBACK.
       PRINT-PAGE-HEADING.
           WRITE PRINT-LINE FROM PAGE-HEADING AFTER ADVANCING PAGE
           WRITE PRINT-LINE FROM HEADER AFTER ADVANCING 5 LINES
           MOVE 3 TO LINE-COUNT
           ADD 1 TO PAGE-COUNT.
       PRINT-REPORT-BODY.
           IF NEW-PAGE-REQUIRED
              MOVE PAGE-COUNT TO PRN-PAGENUM
              WRITE PRINT-LINE FROM PAGE-FOOTING AFTER ADVANCING 5
                 LINES
              PERFORM PRINT-PAGE-HEADING
           END-IF
           MOVE IDNUM TO PRN-CUSTID
           MOVE FIRSTNAME TO PRN-FIRSTNAME
           MOVE LASTNAME TO PRN-LASTNAME
           WRITE PRINT-LINE FROM CUSTOMER-DETAIL-LINE AFTER 
              ADVANCING 1 LINE 
           ADD 1 TO LINE-COUNT
           READ CUSTOMER-FILE
              AT END SET WS-EOF TO TRUE
           END-READ.
       END PROGRAM FILE04.

