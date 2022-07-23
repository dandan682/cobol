       IDENTIFICATION DIVISION.
       PROGRAM-ID. Pl.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       EXEC SQL
           INCLUDE SQLCA
       END-EXEC
       PROCEDURE DIVISION.
        MAIN-PARA.
            DISPLAY "SIMPLE PROGRAM TO INSERT RECORDS IN TO A TABLE : "
            EXEC SQL
               INSERT INTO ABTEIL ('ABTEILUNG NAME', 'PRAEMIE') 
               VALUES ('Testabteilung', 15)
            END-EXEC.
            IF SQLCODE = 0
               DISPLAY "RECORD IS CREATED"
            ELSE
               DISPLAY "RECORD CREATION FAILED : " SQLCODE
            END-IF.
           STOP RUN.
