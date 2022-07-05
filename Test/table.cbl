       IDENTIFICATION DIVISION.
       PROGRAM-ID.     TAB01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  STORE-SALES-TABLE.
           05 STORES OCCURS 3.
              10 STORE-LOCATION    PIC 9.
              10 SALES OCCURS 4 TIMES.
                 15 STORE-SALES PIC 9(5).
       01  COUNTER  PIC 9 VALUE 1.
       PROCEDURE DIVISION.
           MOVE 300 TO STORE-SALES (1 1)
           MOVE 400 TO STORE-SALES (1 2)
           MOVE 350 TO STORE-SALES (1 3)
           MOVE 320 TO STORE-SALES (1 4)
      *
           PERFORM UNTIL COUNTER >= 5
              DISPLAY STORE-SALES (1 COUNTER)
              ADD 1 TO COUNTER
           END-PERFORM
           GOBACK.
           