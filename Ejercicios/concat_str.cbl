       IDENTIFICATION DIVISION.
       PROGRAM-ID.     CONCAT01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SAMPSTR      PIC X(18) VALUE 'EERIE BEEF SNEEZED'.
       01 NUMCHARS     PIC 99 VALUE 0.
       01 NUMES        PIC 99 VALUE 0.
       01 FNAME        PIC X(6) VALUE 'MARTIN'.
       01 MNAME        PIC X(11) VALUE 'LUTHER KING'.
       01 LNAME        PIC X(4) VALUE 'KING'.
       01 FLNAME       PIC X(11).
       01 FMLNAME      PIC X(18).
       01 SSTR1        PIC X(7) VALUE 'THE EGG'.
       01 SSTR2        PIC X(9) VALUE 'IS #1 AND'.
       01 DEST         PIC X(33) VALUE 'IS THE BIG CHICKEN'.
       01 PTR          PIC 9 VALUE 1.
       01 SSTR3        PIC X(3).
       01 SSTR4        PIC X(3).
       PROCEDURE DIVISION.
           GOBACK.

           