       IDENTIFICATION DIVISION.
       PROGRAM-ID.     PARA01.
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       SUBONE.
           DISPLAY 'IN PARAGRAPH 1'
           PERFORM SUBTWO
           DISPLAY 'RETURNED TO PARAGRAPH 1'
           PERFORM SUBFOUR 2 TIMES 
           GOBACK.
      *
       SUBTHREE.
           DISPLAY 'IN PARAGRAPH 3'.
      *
       SUBTWO.
           DISPLAY 'IN PARAGRAPH 2'
           PERFORM SUBTHREE
           DISPLAY 'RETURNED TO PARAGRAPH 2'.
      *
       SUBFOUR.
           DISPLAY 'REPEAT PARAGRAPH 4'.
