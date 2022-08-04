       IDENTIFICATION DIVISION. 
       PROGRAM-ID.     FILE01.
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
       01 WS-CUSTOMERDATA.
           02 WS-IDNUM             PIC 9(5).
           02 WS-CUSTNAME.
              03 WS-FIRSTNAME      PIC X(15). 
              03 WS-LASTNAME       PIC X(15). 
       PROCEDURE DIVISION.
           OPEN OUTPUT CUSTOMERFILE 
           MOVE 00000 TO IDNUM 
           MOVE "DOUGH" TO FIRSTNAME 
           MOVE "THOMAS" TO LASTNAME 
           WRITE CUSTOMERDATA 
           CLOSE CUSTOMERFILE 
           GOBACK.
           