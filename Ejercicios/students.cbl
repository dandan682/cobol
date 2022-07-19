       IDENTIFICATION DIVISION.
       PROGRAM-ID.     STUDENT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  STUDENT-RESULT-TABLE.
           05 STUDENT-RESULT-LINE  OCCURS   5.
              10 STUDENT-MARK   PIC   999   OCCURS   3.
       01  STUDENT-NUM PIC   9.
       01  SUBJECT-NUM PIC   9.
       PROCEDURE DIVISION.
      PROCESS-RESULTS-MAIN.
           PERFORM FILL-TABLE
           PERFORM DISPLAY-TABLE
           GOBACK.
       FILL-TABLE.
           PERFORM FILL-LINE VARYING STUDENT-NUM FROM 1 BY 1
           UNTIL STUDENT-NUM > 5.
       FILL-LINE.
           DISPLAY 'STUDENT NUMBER - ', STUDENT-NUM
           PERFORM GET-MARK VARYING SUBJECT-NUM FROM 1 BY 1
           UNTIL SUBJECT-NUM > 3.
       GET-MARK.
           DISPLAY 'SUBJECT NUMBER - ', SUBJECT-NUM 
           ACCEPT STUDENT-MARK(STUDENT-NUM, SUBJECT-NUM).
       DISPLAY-TABLE.
           PERFORM DISPLAY-LINE VARYING STUDENT-NUM FROM 1 BY 1
           UNTIL STUDENT-NUM > 5.
       DISPLAY-LINE.
           DISPLAY STUDENT-NUM, ' '
              STUDENT-MARK 