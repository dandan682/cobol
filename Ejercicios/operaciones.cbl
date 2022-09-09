       IDENTIFICATION DIVISION.
       PROGRAM-ID.     OPERA.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-NUM1         PIC 99 VALUE 10.
       01 WS-NUM2         PIC 99 VALUE 65.
       01 WS-NUM3         PIC 99 VALUE 0.
       01 WS-RESUL        PIC 999 VALUE ZEROES.
        
       PROCEDURE DIVISION.
       
           DISPLAY 'ADD WS-NUM1 WS-NUM2: ' WS-NUM1 ' ' WS-NUM2   
           ADD WS-NUM1 TO WS-NUM2 GIVING WS-RESUL
           DISPLAY 'ADD RESULTADO: ' WS-RESUL  

           ADD WS-NUM1 TO WS-NUM2, WS-NUM3 
           DISPLAY 'ADD WS-NUM1 TO WS-NUM2 WS-NUM3: '
                    WS-NUM2 ' ' WS-NUM3   

           DISPLAY 'VALORES WS-NUM1 WS-NUM2: ' WS-NUM1 ' ' WS-NUM2   
           SUBTRACT WS-NUM1 FROM WS-NUM2 GIVING WS-RESUL 
           DISPLAY 'SUBTRACT RESULTADO: ' WS-RESUL  
           
           DISPLAY 'VALORES WS-NUM1 WS-NUM2: ' WS-NUM1 ' ' WS-NUM2   
           MULTIPLY WS-NUM1 BY WS-NUM2 GIVING WS-RESUL 
           DISPLAY 'MULTIPLY IS: ' WS-RESUL 

           DISPLAY 'VALORES WS-NUM1 WS-NUM2: ' WS-NUM1 ' ' WS-NUM2   
           DIVIDE WS-NUM2 BY WS-NUM1 GIVING WS-RESUL 
           DISPLAY 'DIVIDE IS: ' WS-RESUL 

           GOBACK.
