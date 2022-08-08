       IDENTIFICATION DIVISION. 
       PROGRAM-ID.     FILE05.
      ***************************************
       ENVIRONMENT DIVISION.
      ***************************************
       INPUT-OUTPUT SECTION. 
      ***************************************
       FILE-CONTROL. 
           SELECT CUSTOMER-FILE    ASSIGN TO "customer.txt"
              ORGANIZATION IS LINE INDEXED
              ACCESS MODE IS RANDOM
              RECORD KEY IS IDNUM.
      ***************************************      
       DATA DIVISION. 
      ***************************************
       FILE SECTION. 
      ***************************************
       FD CUSTOMER-FILE.
       01 CUSTOMERDATA.
           02 IDNUM                PIC 9(2).
           02 FIRSTNAME            PIC X(15). 
           02 LASTNAME             PIC X(15).  
           88 WS-EOF               VALUE HIGH-VALUE.
      **************************************
       WORKING-STORAGE SECTION. 
       01 CHOICE                   PIC 9.
       01 STAYOPEN                 PIC X VALUE 'Y'.
       01 CUSTEXIST                PIC X.
      ***************************************
       PROCEDURE DIVISION.
           OPEN I-O CUSTOMER-FILE 
           PERFORM UNTIL STAYOPEN = 'N'
              DISPLAY ' '
              DISPLAY 'CUSTOMER RECORDS'
              DISPLAY ' '
              DISPLAY '1 : ADD CUSTOMER'
              DISPLAY '2 : DELETE CUSTOMER'
              DISPLAY '3 : UPDATE CUSTOMER'
              DISPLAY '4 : GET CUSTOMER'
              DISPLAY '0 : QUIT'
              DISPLAY ':' WITH NO ADVANCING 
              ACCEPT CHOICE 
              EVALUATE CHOICE 
                 WHEN 1 PERFORM ADDCUST
                 WHEN 2 PERFORM DELETECUST
                 WHEN 3 PERFORM UPDATECUST
                 WHEN 4 PERFORM GETCUST
                 WHEN OTHER MOVE 'N' TO STAYOPEN
              END-EVALUATE 
           END-PERFORM
           CLOSE CUSTOMER-FILE
           GOBACK.
       ADDCUST.
           DISPLAY ''
           DISPLAY 'ENTER ID: ' WITH NO ADVANCING 
           ACCEPT IDNUM 
           DISPLAY 'ENTER FIRST NAME: ' WITH NO ADVANCING 
           ACCEPT FIRSTNAME 
           DISPLAY 'ENTER LAST NAME: ' WITH NO ADVANCING 
           ACCEPT LASTNAME
           DISPLAY ' '
           WRITE CUSTOMERDATA 
              INVALID KEY DISPLAY 'ID TAKEN.'
           END-WRITE.
       DELETECUST.
           DISPLAY ''
           DISPLAY 'ENTER ID: ' WITH NO ADVANCING 
           ACCEPT IDNUM     
           DELETE CUSTOMER-FILE 
              INVALID KEY 'CUSTOMER DOES NOT EXIST'
           END-DELETE.
       UPDATECUST.
           DISPLAY ''
           DISPLAY 'ENTER ID: ' WITH NO ADVANCING 
           ACCEPT IDNUM       
           MOVE 'Y' TO CUSTEXIST 
           READ CUSTOMER-FILE 
              INVALID KEY MOVE 'N' TO CUSTEXIST
           IF CUSTEXIST = 'N'
              DISPLAY 'CUSTO'
           REWRITE        

                   

           PERFORM PRINT-PAGE-HEADING
           READ CUSTOMER-FILE
              AT END SET WS-EOF TO TRUE
           END-READ
           PERFORM PRINT-REPORT-BODY UNTIL WS-EOF
           WRITE PRINT-LINE FROM REPORT-FOOTING AFTER ADVANCING 4
              LINES 
           CLOSE CUSTOMER-FILE, CUSTOMER-REPORT 
           GOBACK.
       PRINT-PAGE-HEADING.
           WRITE PRINT-LINE FROM PAGE-HEADING AFTER ADVANCING PAGE
           WRITE PRINT-LINE FROM HEADER AFTER ADVANCING 2 LINES
           MOVE 2 TO LINE-COUNT
           ADD 1 TO PAGE-COUNT.
       PRINT-REPORT-BODY.
           IF NEW-PAGE-REQUIRED
              MOVE PAGE-COUNT TO PRN-PAGENUM
              WRITE PRINT-LINE FROM PAGE-FOOTING AFTER ADVANCING 4
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
