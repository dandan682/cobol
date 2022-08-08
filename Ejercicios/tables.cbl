       IDENTIFICATION DIVISION.
       PROGRAM-ID.     TABLE01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TABLE1.
          02 FRIEND PIC X(15) OCCURS 4 TIMES. 
      *    
       01 CUST-TABLE.
          02 CUSTNAME OCCURS 5 TIMES.
             03 FNAME PIC X(15).
             03 LNAME PIC X(15). 
      *
       01 ORDERTABLE.
          02 PRODUCT OCCURS 2 TIMES INDEXED BY I.
             03 PRODNAME PIC X(10).
             03 PRODSIZE OCCURS 3 TIMES INDEXED BY J.
                04 SIZETYPE PIC A.
       PROCEDURE DIVISION.
           MOVE 'JOY' TO FRIEND(1)
           MOVE 'WILLOW' TO FRIEND(2)
           MOVE 'IVY' TO FRIEND(3)
           MOVE 'DANIEL' TO FRIEND(4)
           DISPLAY FRIEND(1)
           DISPLAY TABLE1 
      *
           MOVE 'PAUL'  TO FNAME(1)
           MOVE 'SMITH' TO LNAME(1)
           MOVE 'SALLY' TO FNAME(2)
           MOVE 'SMITH' TO LNAME(2)
           DISPLAY CUSTNAME(1)
           DISPLAY CUST-TABLE 
      *
           SET I J TO 1
           MOVE 'BLUE SHIRT' TO PRODUCT(I)
           MOVE 'S' TO PRODSIZE(I,J)
           SET J UP BY 1
           MOVE 'M' TO PRODSIZE(I,J)
           SET J DOWN BY 1
           MOVE 'BLUE SHIRTSMLRED SHIRT SML' TO ORDERTABLE 
           PERFORM GETPRODUCT VARYING I FROM 1 BY 1 UNTIL I > 2
           PERFORM LOOKUP.
       GETPRODUCT.
           DISPLAY PRODUCT(I)
           PERFORM GETSIZES VARYING J FROM 1 BY 1 UNTIL J > 3.
       GETSIZES.
           DISPLAY PRODSIZE(I,J).
       LOOKUP.
           SET I TO 1
           SEARCH PRODUCT 
              AT END DISPLAY 'PRODUCT NOT FOUND'
              WHEN PRODNAME(I) = 'RED SHIRT'
                 DISPLAY 'RED SHIRT FOUND'
           END-SEARCH
           GOBACK.
