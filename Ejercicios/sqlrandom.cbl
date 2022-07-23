       IDENTIFICATION DIVISION.
       PROGRAM-ID. RANDOM01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 RET       PIC 9(3).
       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01 DBNAME    PIC X(32) VALUE "postgres".
       01 USERNAME  PIC X(32) VALUE "postgres".
       01 PASSWORD  PIC X(32) VALUE SPACE.
       EXEC SQL END DECLARE SECTION END-EXEC.
       EXEC SQL INCLUDE SQLCA END-EXEC.
       PROCEDURE DIVISION.
       MAIN.
            EXEC SQL
                CONNECT :USERNAME IDENTIFIED BY :PASSWORD
                    USING :DBNAME
            END-EXEC.
            EXEC SQL
                SELECT round(random()*100) INTO :RET
            END-EXEC.
            EXEC SQL
                DISCONNECT ALL
            END-EXEC.
            DISPLAY RET.
            GOBACK.
            