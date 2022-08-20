       IDENTIFICATION DIVISION. 
       PROGRAM-ID.     RENAME.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-A.
          02 WS-A1     PIC X(5) VALUE 'DATE:'.
          02 WS-A2     PIC X(5) VALUE '05/27'.
          02 WS-A3     PIC X(5) VALUE '/2014'.
       66 WS-A1A2A3 RENAMES WS-A1 THRU WS-A3.
       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY WS-A1 
           DISPLAY WS-A2 
           DISPLAY WS-A3 
           DISPLAY WS-A1A2A3  
           GOBACK.
