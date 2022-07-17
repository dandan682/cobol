       IDENTIFICATION DIVISION.
       PROGRAM-ID.     COBVS6.
      *****************************************************************
      * PROGRAM TO RETRIEVE A RECORD FROM THE EMPLOOYEE FILE USING    *
      * ALTERNATE INDEX                                               *
      *****************************************************************
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. IBM-3081. 
       OBJECT-COMPUTER. IBM-3081. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL. 
           SELECT EMPLOYEE-VS-FILE ASSIGN TO EMPVSFL
           ORGANIZATION IS INDEXED
           ACCESS MODE  IS RANDOM
           RECORD KEY   IS EMP-ID
           ALTERNATE KEY IS EMP-SSN
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
           05 EMP-SSN              PIC X(09).
           05 FILLER               PIC X(05) VALUE SPACES.
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
           DISPLAY 'COBVS6 - SAMPLE COBOL PROGRAM: VSAM ALT INDEX.'
           OPEN INPUT EMPLOYEE-VS-FILE 
           IF EMP-FILE-STATUS = '00' OR '97' THEN
              NEXT SENTENCE 
           ELSE
              DISPLAY 'ERROR ON OPEN - FILE STATUS ' EMP-FILE-STATUS.
           INITIALIZE EMPLOYEE.
       P200-MAINLINE.
      ***************************************************************
      * DELETE THE RECORD FROM THE VSAM FILE.                       *
      ***************************************************************
           MOVE '097644337' TO EMP-SSN
           READ EMPLOYEE-VS-FILE KEY IS EMP-SSN 
           IF EMP-FILE-STATUS = '00' THEN
              DISPLAY 'EMP-ID              : ' EMP-ID 
              DISPLAY 'EMP LAST NAME       : ' EMP-LAST-NAME 
              DISPLAY 'EMP FIRST NAME      : ' EMP-FIRST-NAME  
              DISPLAY 'EMP YEARS OF SERVICE: ' EMP-SERVICE-YEARS 
              DISPLAY 'EMP PROMOTION DATE  : ' EMP-PROMOTION-DATE 
              DISPLAY 'EMP SOCIAL SECURITY : ' EMP-SSN  
           ELSE
              DISPLAY 'RECORD NOT FOUND RC= ' EMP-FILE-STATUS.
       P300-TERMINATION.
           CLOSE EMPLOYEE-VS-FILE
           IF EMP-FILE-STATUS = '00' THEN
              NEXT SENTENCE 
           ELSE
              DISPLAY 'ERROR ON CLOSE - FILE STATUS ' EMP-FILE-STATUS.
           DISPLAY 'COBVS6 - SUCCESSFULLY ENDED'.
      ***************************************************************
      * END OF SOURCE CODE.                                         *
      ***************************************************************
