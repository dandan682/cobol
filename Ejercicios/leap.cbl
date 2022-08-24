       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEAP.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-YEAR            PIC 9(4).
       01 WS-C               PIC 9(4).
       01 WS-R               PIC 9(4).
       PROCEDURE DIVISION.
       LEAP.
      * Enter solution here
           DISPLAY 'TYPE THE YEAR: ' WITH NO ADVANCING
           ACCEPT WS-YEAR
           PERFORM UNTIL WS-YEAR = ZEROS 
               DIVIDE WS-YEAR BY 4 GIVING WS-C REMAINDER WS-R
               DISPLAY 'WS-C: ' WS-C ' WS-R: ' WS-R
               DIVIDE WS-YEAR BY 100 GIVING WS-C REMAINDER WS-R
               DISPLAY 'WS-C: ' WS-C ' WS-R: ' WS-R
               DIVIDE WS-YEAR BY 400 GIVING WS-C REMAINDER WS-R
               DISPLAY 'WS-C: ' WS-C ' WS-R: ' WS-R
               DISPLAY 'TYPE THE YEAR: ' WITH NO ADVANCING
               ACCEPT WS-YEAR
           END-PERFORM      
           CONTINUE.
       LEAP-EXIT.
         EXIT.
