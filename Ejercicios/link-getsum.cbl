       IDENTIFICATION DIVISION.
       PROGRAM-ID.     LINK-GETSUM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01 LNUM1     PIC 9 VALUE 0.
       01 LNUM2     PIC 9 VALUE 0.
       01 LSUM1     PIC 99.
       PROCEDURE DIVISION USING LNUM1, LNUM2, LSUM1.
           COMPUTE LSUM1 = LNUM1 + LNUM2 
           GOBACK.
