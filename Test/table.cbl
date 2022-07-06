       IDENTIFICATION DIVISION.
       PROGRAM-ID.     TAB01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  STORE-SALES-TABLE.
           05 STORES               OCCURS 3.
              10 STORE-LOCATION    PIC 9.
              10 SALES             OCCURS 4 TIMES.
                 15 STORE-SALES    PIC 9(5).
       01  COUNTER-I               PIC 9 VALUE 1.
       01  COUNTER-J               PIC 9 VALUE 1.
       PROCEDURE DIVISION.
           MOVE 300 TO STORE-SALES (1 1)
           MOVE 400 TO STORE-SALES (1 2)
           MOVE 350 TO STORE-SALES (1 3)
           MOVE 320 TO STORE-SALES (1 4)
           MOVE 520 TO STORE-SALES (2 1)
           MOVE 530 TO STORE-SALES (2 2)
           MOVE 550 TO STORE-SALES (2 3)
           MOVE 560 TO STORE-SALES (2 4)
           MOVE 660 TO STORE-SALES (3 1)
           MOVE 680 TO STORE-SALES (3 2)
           MOVE 630 TO STORE-SALES (3 3)
           MOVE 670 TO STORE-SALES (3 4)
      *
           PERFORM UNTIL COUNTER-I >= 4
              MOVE 1 TO COUNTER-J
              PERFORM UNTIL COUNTER-J >= 5
                 DISPLAY STORE-SALES (COUNTER-I  COUNTER-J)
                 ADD 1 TO COUNTER-J
              END-PERFORM
              ADD 1 TO COUNTER-I
           END-PERFORM
           GOBACK.
           