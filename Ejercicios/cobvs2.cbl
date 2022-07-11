       IDENTIFICATION DIVISION.
       PROGRAM-ID.     COBVS2.
      *****************************************************************
      * PROGRAM TO ADD A RECORD TO THE EMPLOYEE VSAM FILE             *
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
           05 EMP-FIRST-NAME       PIC X(30).
           05 EMP-SERVICE-YEARS    PIC 9(02).
           05 EMP-PROMOTION-DATE   PIC X(10).
           05 FILLER               PIC X(14).
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
           DISPLAY 'COBVS2 - SAMPLE COBOL PROGRAM: VSAM INSERT'
           OPEN I-O EMPLOYEE-VS-FILE 
           IF EMP-FILE-STATUS = '00' OR '97' THEN
              NEXT SENTENCE 
           ELSE
              DISPLAY 'ERROR ON OPEN - FILE STATUS ' EMP-FILE-STATUS
           INITIALIZE EMPLOYEE 
       P200-MAINLINE.
      ***************************************************************
      * SET UP DATA ON THE RECORD STRUCTURE                         *
      * AND THEN WRITE THE RECORD.                                  *
      ***************************************************************
           MOVE '1111'    TO EMP-ID
           MOVE 'SMITH'   TO EMP-LAST-NAME
           MOVE 'SANDRA'  TO EMP-FIRST-NAME
           MOVE '09'      TO EMP-SERVICE-YEARS
           MOVE '2017-01-01' TO EMP-PROMOTION-DATE
           WRITE EMPLOYEE 
           IF EMP-FILE-STATUS = '00' THEN
              DISPLAY 'ADD SUCCESSFUL - DATA IS ' EMPLOYEE 
           ELSE
              DISPLAY 'ERROR ON INSERT - FILE STATUS ' EMP-FILE-STATUS 
       P300-TERMINATION.
           CLOSE EMPLOYEE-VS-FILE
           DISPLAY 'COBVS2 - SUCCESSFUL ENDED'.
      ***************************************************************
      * END OF SOURCE CODE.                                         *
      ***************************************************************
