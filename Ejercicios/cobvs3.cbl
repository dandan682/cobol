       IDENTIFICATION DIVISION.
       PROGRAM-ID.     COBVS3.
      *****************************************************************
      * PROGRAM TO RETRIEVE AND UPDATE A RECORD ON THE EMPLOOYEE FILE *
      *****************************************************************
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. IBM-3081. 
       OBJECT-COMPUTER. IBM-3081. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT EMPLOYEE-VS-FILE ASSIGN TO EMPVSFIL
           ORGANIZATION IS INDEXED
           ACCESS MODE  IS RANDOM
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
           DISPLAY 'COBVS3 - SAMPLE COBOL PROGRAM: VSAM UPDATE.'
           OPEN I-O EMPLOYEE-VS-FILE 
           IF EMP-FILE-STATUS = '00' OR '97' THEN
              NEXT SENTENCE 
           ELSE
              DISPLAY 'ERROR ON OPEN - FILE STATUS ' EMP-FILE-STATUS
           INITIALIZE EMPLOYEE 
       P200-MAINLINE.
      ***************************************************************
      * FIRST READ THE SPECIFIED RECORD. THEN MAKE CHANGES TO THE   *
      * RECORD. FINALLY REWRITE THE RECORD TO THE VSAM FILE.        *
      ***************************************************************
           MOVE '1111'    TO EMP-ID
           READ EMPLOYEE-VS-FILE
           IF EMP-FILE-STATUS = '00' THEN
              NEXT SENTENCE 
           ELSE
              DISPLAY 'ERROR ON READ - FILE STATUS ' EMP-FILE-STATUS 
           MOVE '10'      TO EMP-SERVICE-YEARS
           REWRITE EMPLOYEE
           IF EMP-FILE-STATUS = '00' THEN
              DISPLAY 'UPDATE SUCCESSFUL - DATA IS ' EMPLOYEE 
           ELSE
              DISPLAY 'ERROR ON REWRITE - FILE STATUS ' EMP-FILE-STATUS 

       P300-TERMINATION.
           CLOSE EMPLOYEE-VS-FILE
           DISPLAY 'COBVS3 - SUCCESSFULLY ENDED'.
      ***************************************************************
      * END OF SOURCE CODE.                                         *
      ***************************************************************
