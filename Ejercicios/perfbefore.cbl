           IDENTIFICATION DIVISION.
           PROGRAM-ID.    PERFBEF.
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 WS-SW       PIC X VALUE 'N'.
           77 WS-CONTA    PIC 9 VALUE 0.
           PROCEDURE DIVISION.
              PERFORM MAIN WITH TEST BEFORE
                 UNTIL WS-SW = 'Y'
              GOBACK.
           MAIN.
              ADD 1 TO WS-CONTA       
              DISPLAY 'MAIN #' WS-CONTA
              IF WS-CONTA >= 5 THEN 
                 MOVE 'Y' TO WS-SW
              END-IF.
              