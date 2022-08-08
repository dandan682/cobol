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
              DISPLAY 'CUSTOMER DOES NOT EXIST'
           ELSE
              DISPLAY 'ENTER FIRST NAME: ' WITH NO ADVANCING 
              ACCEPT FIRSTNAME 
              DISPLAY 'ENTER LAST NAME: ' WITH NO ADVANCING 
              ACCEPT LASTNAME           
              REWRITE CUSTOMERDATA 
                 INVALID KEY DISPLAY 'CUSTOMER NOT UPDATED'
              END-REWRITE
           END-IF.   
       GETCUST.
           DISPLAY ''  
           DISPLAY 'ENTER ID TO FIND: ' WITH NO ADVANCING 
           ACCEPT IDNUM   
           READ CUSTOMER-FILE
              INVALID KEY MOVE 'N' TO CUSTEXIST 
           END-READ
           IF CUSTEXIST = 'N'
              DISPLAY 'CUSTOMER DOES NOT EXIST'
           ELSE 
              DISPLAY ' '
              DISPLAY 'ID: ' IDNUM 
              DISPLAY 'FIST NAME: ' FIRSTNAME 
              DISPLAY 'LAST NAME: ' LASTNAME 
           END-IF.
       END PROGRAM FILE04.
