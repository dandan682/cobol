       IDENTIFICATION DIVISION. 
       PROGRAM-ID.                 COLOUR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COLOUR-1                 PIC A(6). 
       01 COLOUR-2                 PIC A(6).
       PROCEDURE DIVISION. 
       INPUT-COLOURS.
           DISPLAY 'Enter FIRST primary colour'
           ACCEPT COLOUR-1
           DISPLAY 'Enter SECOND primary colour'
           ACCEPT COLOUR-2
           EVALUATE COLOUR-1 ALSO COLOUR-2 
              WHEN COLOUR-2  ALSO COLOUR-1  
                    DISPLAY 'Mixed colour is ' COLOUR-1
              WHEN 'red'     ALSO 'yellow'
              WHEN 'yellow'  ALSO 'red'     
                    DISPLAY 'Mixed colour is orange'
              WHEN 'red'     ALSO 'blue'
              WHEN 'blue'    ALSO 'red'     
                    DISPLAY 'Mixed colour is violet' 
              WHEN 'yellow'  ALSO 'blue'
              WHEN 'blue'    ALSO 'yellow'  
                    DISPLAY 'Mixed colour is green'
              WHEN OTHER                    
                    DISPLAY 'Incorrect input' 
           END-EVALUATE.
           GOBACK.
