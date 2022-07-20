       IDENTIFICATION DIVISION.
       PROGRAM-ID.     COBVS5.
      *****************************************************************
      * PROGRAM TO RETRIEVE RECORDS SEQUENTIALLY FROM EMPLOOYEE FILE  *
      *****************************************************************
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. IBM-3081. 
       OBJECT-COMPUTER. IBM-3081. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT EMPLOYEE-VS-FILE ASSIGN TO EMPVSFIL
           ORGANIZATION IS INDEXED
           ACCESS MODE  IS SEQUENTIAL 
           RECORD KEY   IS EMP-ID
           FILE STATUS  IS EMP-FILE-STATUS.
      *****************************************************************
       DATA DIVISION.
       FILE SECTION. 
       FD  EMPLOYEE-VS-FILE.
       01  EMPLOYEE.
           05 EMP-ID               PIC 9(04).
           05 EMP-LAST-NAME        PIC X(30).
           05 EMP-FIRST-NAME       PIC X(20).
           05 EMP-SERVICE-YEARS    PIC 9(02).
           05 EMP-PROMOTION-DATE   PIC X(10).
           05 FILLER               PIC X(14) VALUE SPACES.
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  WS-FLAGS.
           05 SW-END-OF-FILE-SWITCH   PIC X(01) VALUE 'N'.
              88   SW-END-OF-FILE               VALUE 'Y'.
              88   SW-NOT-END-OF-FILE           VALUE 'N'.
       01  EMP-FILE-STATUS.
           05 EMPFILE-STAT1           PIC X.
           05 EMPFILE-STAT2           PIC X.  
      *****************************************************************
       PROCEDURE DIVISION.
           PERFORM P100-INITIALIZATION
           PERFORM P200-MAINLINE
           PERFORM P300-TERMINATION
           GOBACK.
       P100-INITIALIZATION.
           DISPLAY 'COBVS5 - SAMPLE COBOL PROGRAM: READ LOOP.'
           OPEN INPUT EMPLOYEE-VS-FILE 
           IF EMP-FILE-STATUS = '00' OR '97' THEN
              NEXT SENTENCE 
           ELSE
              DISPLAY 'ERROR ON OPEN - FILE STATUS ' EMP-FILE-STATUS
           DISPLAY 'INITIALIZE EMPLOYEE'
           INITIALIZE EMPLOYEE.
       P200-MAINLINE.
      ***************************************************************
      * READ THE RECORD FROM THE VSAM FILE.                         *
      ***************************************************************
           READ EMPLOYEE-VS-FILE
           IF EMP-FILE-STATUS = '10' THEN
              DISPLAY 'END OF FILE ENCOUNTERED'
              SET SW-END-OF-FILE TO TRUE
           END-IF 
           IF NOT SW-END-OF-FILE THEN
              PERFORM UNTIL SW-END-OF-FILE
                 DISPLAY 'EMP-ID: ' EMP-ID 
                 DISPLAY 'EMP LAST NAME: ' EMP-LAST-NAME 
                 DISPLAY 'EMP FIRST NAME: ' EMP-FIRST-NAME 
                 DISPLAY 'EMP YEARS OF SERVICE: ' EMP-SERVICE-YEARS 
                 DISPLAY 'EMP YEARS OF SERVICE: ' EMP-PROMOTION-DATE 
                 READ EMPLOYEE-VS-FILE
                 IF EMP-FILE-STATUS = '10' THEN
                    DISPLAY 'END OF FILE ENCOUNTERED'
                    SET SW-END-OF-FILE TO TRUE
                 END-IF 
              END-PERFORM
           ELSE 
              DISPLAY 'NO RECORDS IN FILE'
           END-IF. 
       P300-TERMINATION.
           CLOSE EMPLOYEE-VS-FILE
           DISPLAY 'COBVS5 - SUCCESSFULLY ENDED'.
      ***************************************************************
      * END OF SOURCE CODE.                                         *
      ***************************************************************
