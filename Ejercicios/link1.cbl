       IDENTIFICATION DIVISION.
       PROGRAM-ID.    LINK1.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFILE ASSIGN TO './link1.txt'.
       DATA DIVISION.
       FILE SECTION.
       FD INFILE.
       01  GROUP-VAR.
           05 VAR1           PIC 9(02).
           05 VAR2           PIC 9(02).
       WORKING-STORAGE SECTION.
       01  WS-GROUP-VAR.
           05 WS-VAR1        PIC 9(02).
           05 WS-VAR2        PIC 9(02).
       01  WS-PROG           PIC X(05) VALUE 'LINK2'.
       PROCEDURE DIVISION.
           OPEN INPUT INFILE
           READ INFILE
           MOVE VAR1 TO WS-VAR1
           MOVE VAR2 TO WS-VAR2
           DISPLAY 'VAR1 IS: ' VAR1
           DISPLAY 'VAR2 IS: ' VAR2
           DISPLAY 'CALLING PROGRAM2: LINK2...'
      ****************************************************
      *     CALL 'LINK2' USING WS-GROUP-VAR
           CALL WS-PROG USING WS-GROUP-VAR
      ****************************************************
           DISPLAY 'RETURNED TO PROGRAM1: LINK1.'
           CLOSE INFILE
           GOBACK.
