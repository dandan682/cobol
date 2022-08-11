       IDENTIFICATION DIVISION.
       PROGRAM-ID.     MERGE01.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL.
           SELECT WORKFILE      ASSIGN TO "work.tmp".
           SELECT FILE1         ASSIGN TO "student.dat"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT FILE2         ASSIGN TO "student3.dat"
              ORGANIZATION IS LINE SEQUENTIAL.
           SELECT NEWFILE       ASSIGN TO "student4.dat"
              ORGANIZATION IS LINE SEQUENTIAL.              
       DATA DIVISION. 
       FILE SECTION.
       FD FILE1.
       01 STUD-DATA.
          02 ID-NUM          PIC 9.
          02 STUD-NAME       PIC X(10).
       FD FILE2.
       01 STUD-DATA2.
          02 ID-NUM2          PIC 9.
          02 STUD-NAME2       PIC X(10).
       SD WORKFILE.
       01 W-STUD-DATA.
          02 W-ID-NUM        PIC 9.
          02 W-STUD-NAME     PIC X(10).
       FD NEWFILE.
       01 N-STUD-DATA.
          02 N-ID-NUM        PIC 9.
          02 N-STUD-NAME     PIC X(10).
       WORKING-STORAGE SECTION. 
       PROCEDURE DIVISION.
           MERGE WORKFILE ON ASCENDING KEY N-ID-NUM  
              USING FILE1, FILE2 
              GIVING NEWFILE
           GOBACK.
       END PROGRAM MERGE01.
