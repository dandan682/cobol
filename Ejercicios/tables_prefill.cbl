       IDENTIFICATION DIVISION.
       PROGRAM-ID.     TABLE-FILL.
      *****
       DATA DIVISION.
      *****
       WORKING-STORAGE SECTION.
       01 PROD-TABLE.
          02 PROD-DATA.
             03 FILLER PIC X(8) VALUE 'RED  SML'.
             03 FILLER PIC X(8) VALUE 'BLUE SML'.
             03 FILLER PIC X(8) VALUE 'GREENSML'.
          02 FILLER REDEFINES PROD-DATA.
             03 SHIRT OCCURS 3 TIMES.
                04 PRODNAME              PIC X(5).
                04 PROSIZES              PIC A OCCURS 3 TIMES.
      *****
       01 CHANGEME.
          02 TEXTNUM                     PIC X(6).
          02 FLOATNUM REDEFINES TEXTNUM  PIC 9(4)V99.
      *****
       01 STRNUM                         PIC X(7).
      *****
       01 SPLITNUM.
          02 WNUM                        PIC 9(4) VALUE ZERO.
          02 FNUM                        PIC 99   VALUE ZERO.     
       01 FLNUM REDEFINES SPLITNUM       PIC 9999V99.
       01 DOLLARNUM                      PIC $$,$$9.99.    
      *****
       PROCEDURE DIVISION.
           DISPLAY '*'SHIRT(1)'*'PRODNAME(1)'*'PROSIZES(1 1)'*'
           MOVE '123456' TO TEXTNUM
           DISPLAY FLOATNUM 
           DISPLAY 'ENTER A FLOAT: ' WITH NO ADVANCING.
           ACCEPT STRNUM 
           UNSTRING STRNUM 
              DELIMITED BY '.' OR ALL SPACES 
              INTO WNUM, FNUM 
           MOVE FLNUM TO DOLLARNUM 
           DISPLAY DOLLARNUM 
           GOBACK.      
           END PROGRAM TABLE-FILL.
