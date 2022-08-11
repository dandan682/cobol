       IDENTIFICATION DIVISION.
       PROGRAM-ID.     SORT01.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.
           SELECT WORKFILE      ASSIGN TO "work.tmp".
           SELECT ORGFILE       ASSIGN TO "student.dat"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SORTED-FILE   ASSIGN TO "student-sort.dat"
              ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION. 
       FILE SECTION.
       FD ORGFILE.
       01 STUD-DATA.
          02 ID-NUM          PIC 9.
          02 STUD-NAME       PIC X(10).
       SD WORKFILE.
       01 W-STUD-DATA.
          02 W-ID-NUM        PIC 9.
          02 W-STUD-NAME     PIC X(10).
       FD SORTED-FILE.
       01 S-STUD-DATA.
          02 S-ID-NUM        PIC 9.
          02 S-STUD-NAME     PIC X(10).
       WORKING-STORAGE SECTION. 
       PROCEDURE DIVISION.
           SORT WORKFILE ON ASCENDING KEY S-STUD-NAME  
              USING ORGFILE 
              GIVING SORTED-FILE
           GOBACK.
       END PROGRAM SORT01.
