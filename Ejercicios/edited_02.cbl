       IDENTIFICATION DIVISION.
       PROGRAM-ID.     EDITED_02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STARTNUM     PIC 9(8)V99 VALUE 00001123.55.
       01 NOZERO       PIC ZZZZZZZ9.99.
       01 NOZPLUSC     PIC ZZ,ZZZ,ZZ9.99.
       01 DOLLAR       PIC $$,$$$,$$9.99.
       01 BDAY         PIC 9(8) VALUE 12211974.
       01 ADAY         PIC 99/99/9999.
       PROCEDURE DIVISION.
           MOVE STARTNUM TO NOZERO
           DISPLAY NOZERO
           MOVE STARTNUM TO NOZPLUSC
           DISPLAY NOZPLUSC
           MOVE STARTNUM TO DOLLAR
           DISPLAY DOLLAR
           MOVE BDAY TO ADAY 
           DISPLAY ADAY 
           GOBACK.