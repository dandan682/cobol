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
           PERFORM LEAP-002
           CONTINUE.
       LEAP-EXIT.
         GOBACK.
       LEAP-002.
           EVALUATE TRUE                                  
               WHEN FUNCTION MOD (WS-YEAR 4)   NOT ZERO    
               WHEN FUNCTION MOD (WS-YEAR 100) =   ZERO    
                AND FUNCTION MOD (WS-YEAR 400) NOT ZERO    
                    DISPLAY 'IT IS NOT A LEAP YEAR ' WS-YEAR 
               WHEN OTHER                                      
                    DISPLAY 'IT IS A LEAP YEAR     ' WS-YEAR 
           END-EVALUATE.
           