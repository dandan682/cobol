       IDENTIFICATION DIVISION.
       PROGRAM-ID.     PARAMS.
       DATA DIVISION. 
       WORKING-STORAGE SECTION. 
       01 WS-DISPLAY-DATA          PIC X(150).
       01 WS-LEN                   PIC S9(4) SIGN LEADING SEPARATE.
       LINKAGE SECTION. 
       01 WS-PARM-GRP.
          05 WS-PARM-LEN           PIC S9(4) COMP.
          05 WS-PARM-DATA          PIC X(100).
       PROCEDURE DIVISION.
           COMPUTE WS-LEN = WS-PARM-LEN + 0
           MOVE WS-PARM-DATA TO WS-DISPLAY-DATA 
           DISPLAY 'LENGTH OF DATA IS: ' WS-LEN 
           DISPLAY 'DATA IS: ' WS-DISPLAY-DATA 
           GOBACK.
              