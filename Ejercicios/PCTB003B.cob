      * dbpre V 0.4: PCTB003B.cob                                20220723-200622
------*-------------------------------------------------------------------------
----+-*--1----+----2----+----3----+----4----+----5----+----6----+----7-*--+----8
      **************************************************************************
      *  I D E N T I F I C A T I O N   D I V I S I O N                         *
      **************************************************************************
        IDENTIFICATION              DIVISION.
        PROGRAM-ID.                 PCTB003B.
DBPRE * AUTHOR.                     THE_PIPER.
DBPRE * DATE-WRITTEN.               TODAY.
      /
      **************************************************************************
      *  D A T A    D I V I S I O N                                            *
      **************************************************************************
        DATA                        DIVISION.
      /
      **************************************************************************
      *  W O R K I N G   S T O R A G E   S E C T I O N                         *
      **************************************************************************
        WORKING-STORAGE SECTION.
      *
      * The needed working storage stuff for the framework
        COPY PGCTBBATWS.
      *
      * This will be displayed in the logfile at runtime
        01  PGCTB-VERSION                    PIC  X(38) 
HISTOR*     VALUE '20120426 1.0 INITIAL RELEASE'.
            VALUE '20140521 1.2 CURSORS'.
      *
        01  FIELD1.
          05 FIELD1-NUM                      PIC  9(08).
          05 FILLER                          PIC  X(12) VALUE SPACE.
        01  FIELD2                           PIC  X(16).
        01  FIELD3                           PIC  X(32).
      *
        01  T                                PIC  S9(9) COMP.
      *
      * The communication area for the database
      * EXEC SQL 
      *    INCLUDE SQLCA  
        01  SQLCA.
          05 SQLCA-CID                     USAGE POINTER.
          05 SQLCA-CURSOR-CTRL-GRP.
            10 SQLCA-CURSOR-CTRL OCCURS 65 PIC X.
          05 SQLCA-RESULT-GRP OCCURS 65.
            10 SQLCA-RESULT                USAGE POINTER.
          05 SQLCA-SEQUENCE                PIC 9(08).
          05 SQLCA-COUNT                   PIC 9(08).
          05 FILLER                        PIC X VALUE LOW-VALUE.
          05 SQLCA-RETURN-CODE             PIC 9(03).
          05 SQLCA-CROWCNT                 PIC X(08).
          05 SQLCA-ROWCNT                  PIC 9(08).
            88 SQLCA-NO-ROW                VALUE 0.
            88 SQLCA-ONE-ROW               VALUE 1.
            88 SQLCA-MORE-THAN-ONE-ROW     VALUE 2 THRU 99999999.
          05 FILLER                        PIC X VALUE LOW-VALUE.
          05 SQLCA-HOST                    PIC X(32).
          05 FILLER                        PIC X VALUE LOW-VALUE.
          05 SQLCA-USER                    PIC X(32).
          05 FILLER                        PIC X VALUE LOW-VALUE.
          05 SQLCA-PASSWD                  PIC X(32).
          05 FILLER                        PIC X VALUE LOW-VALUE.
          05 SQLCA-DBNAME                  PIC X(32).
          05 FILLER                        PIC X VALUE LOW-VALUE.
          05 SQLCA-PORT                    PIC 9(05).
          05 FILLER                        PIC X VALUE LOW-VALUE.
          05 SQLCA-SOCKET                  PIC X(32).
          05 FILLER                        PIC X VALUE LOW-VALUE.
          05 SQLCA-QUOTE                   PIC X VALUE "'".
          05 SQLCA-COBVERSION              PIC X(20).
          05 SQLCA-CARD                    PIC X(80).
          05 SQLCA-STATEMENT.
            10 SQLCA-STAT-LINE OCCURS 80   PIC X(25).
          05 FILLER                        PIC X VALUE LOW-VALUE.
          05 SQLCODE                       PIC 9(03).
            88 DB-OK                       VALUE 0.
            88 DB-CURSOR-ALREADY-OPEN      VALUE -1.
            88 DB-CURSOR-NOT-OPEN          VALUE -2.
            88 DB-NOT-FOUND                VALUE 100.
DBPRE * END-EXEC.
      /
      **************************************************************************
      *  P R O C E D U R E   D I V I S I O N                                   *
      **************************************************************************
        PROCEDURE DIVISION.
      * The framework itself, calling PGCTB-ACTION to run the users coding
DBPRE      MOVE 1             TO SQLCA-SEQUENCE
      *    EXEC SQL
      *        INCLUDE PGCTBBAT REPLACING 'TTTTNNNB' BY 'PCTB003B'.
                                                 
----+-*--1-!--+----2----+----3----+----4----+----5----+----6----+----7-!--+----8
      *
           MOVE 'PCTB003B'                  TO PGCTB-PROGRAM-NAME
      *
           CALL "cobmysqlapi_get_cobol_version" USING SQLCA-COBVERSION
           END-CALL
      *
           CALL "read_params"         USING PGCTB-PROGRAM-NAME
                                            SQLCA-HOST
                                            SQLCA-USER
                                            SQLCA-PASSWD
                                            SQLCA-DBNAME
                                            SQLCA-PORT   
                                            SQLCA-SOCKET 
           END-CALL
      *
           INSPECT SQLCA-HOST REPLACING ALL LOW-VALUE BY SPACE
           INSPECT SQLCA-USER REPLACING ALL LOW-VALUE BY SPACE
           INSPECT SQLCA-PASSWD REPLACING ALL LOW-VALUE BY SPACE
           INSPECT SQLCA-DBNAME REPLACING ALL LOW-VALUE BY SPACE
           INSPECT SQLCA-PORT REPLACING ALL LOW-VALUE BY SPACE
           INSPECT SQLCA-SOCKET REPLACING ALL LOW-VALUE BY SPACE
           INSPECT SQLCA-COBVERSION REPLACING ALL LOW-VALUE BY SPACE
      *
      * All cursors are closed at the beginning
           MOVE ALL '0'                     TO SQLCA-CURSOR-CTRL-GRP
      *
           ACCEPT PGCTB-DATE                FROM DATE
           ACCEPT PGCTB-STARTTIME           FROM TIME
      *
           DISPLAY '*******************************************'
                   '*********'
           DISPLAY '*                                          '
                   '        *'
           DISPLAY '*                ' PGCTB-PROGRAM-NAME(1:1) ' '
                                       PGCTB-PROGRAM-NAME(2:1) ' '
                                       PGCTB-PROGRAM-NAME(3:1) ' '
                                       PGCTB-PROGRAM-NAME(4:1) ' '
                                       PGCTB-PROGRAM-NAME(5:1) ' '
                                       PGCTB-PROGRAM-NAME(6:1) ' '
                                       PGCTB-PROGRAM-NAME(7:1) ' '
                                       PGCTB-PROGRAM-NAME(8:1) ' '
                   '                  *'
           DISPLAY '*                                          '
                   '        *'
           DISPLAY '*       Start..: 20' PGCTB-DATE(1:2) '-' 
                   PGCTB-DATE(3:2) '-' PGCTB-DATE(5:2) ' ' 
                   PGCTB-STARTTIME(1:2) ':' PGCTB-STARTTIME(3:2) ':'
                   PGCTB-STARTTIME(5:2) '    '
                   '           *'
           DISPLAY '*                                          '
                   '        *'
           DISPLAY '* Version..: ' PGCTB-VERSION
                   '*'
           DISPLAY '*                                          '
                   '        *'
           DISPLAY '*                       -----              '
                   '        *'
           DISPLAY '*      Gnu-Cobol VERSION ' SQLCA-COBVERSION
                   '      *'
           DISPLAY '*                       -----              '
                   '        *'
           DISPLAY '*                                          '
                   '        *'
           DISPLAY '*******************************************'
                   '*********'
           DISPLAY '*  DBHOST.......: ' SQLCA-HOST ' *'
           DISPLAY '*  DBUSER.......: ' SQLCA-USER ' *'
           DISPLAY '*  DBPASSWD.....: ' SQLCA-PASSWD ' *'
           DISPLAY '*  DBNAME.......: ' SQLCA-DBNAME ' *'
           DISPLAY '*  DBPORT.......: ' SQLCA-PORT 
           '                            *'
           DISPLAY '*  DBSOCKET.....: ' SQLCA-SOCKET ' *'
           DISPLAY '*******************************************'
                   '*********'
      *
      * Initialize the database connection
DBPRE      MOVE 2             TO SQLCA-SEQUENCE
      *    EXEC SQL
      *       INIT DB
DBPRE         CALL "MySQL_init"  USING SQLCA-CID
DBPRE         END-CALL
DBPRE         MOVE RETURN-CODE    TO SQLCODE
DBPRE *    END-EXEC.
           EVALUATE TRUE
           WHEN DB-OK
              CONTINUE
           WHEN DB-NOT-FOUND
              SET DB-OK              TO TRUE
           WHEN OTHER
              PERFORM DB-STATUS
           END-EVALUATE
                                                 
DBPRE      MOVE 3             TO SQLCA-SEQUENCE
      *    EXEC SQL
      *       CONNECT DB
DBPRE         CALL "MySQL_real_connect" USING
DBPRE                                   SQLCA-HOST
DBPRE                                   SQLCA-USER
DBPRE                                   SQLCA-PASSWD
DBPRE                                   SQLCA-DBNAME
DBPRE                                   SQLCA-PORT
DBPRE                                   SQLCA-SOCKET
DBPRE         END-CALL
DBPRE         MOVE RETURN-CODE    TO SQLCODE
DBPRE *    END-EXEC.
           EVALUATE TRUE
           WHEN DB-OK
              CONTINUE
           WHEN DB-NOT-FOUND
              SET DB-OK              TO TRUE
           WHEN OTHER
              PERFORM DB-STATUS
           END-EVALUATE
      *
      * Now execute the user's code
           PERFORM PGCTB-ACTION
      *
      * Any errors?
           PERFORM DB-STATUS
      *
      * Commit the work
DBPRE      MOVE 4             TO SQLCA-SEQUENCE
      *    EXEC SQL
      *       COMMIT
DBPRE         CALL "MySQL_commit"
DBPRE         END-CALL

DBPRE         MOVE RETURN-CODE    TO SQLCODE
DBPRE         IF RETURN-CODE NOT = 0 THEN
DBPRE            PERFORM DB-STATUS
DBPRE         END-IF
DBPRE *    END-EXEC.
      *
      * We're done, now close the database and stop the program
DBPRE      MOVE 5             TO SQLCA-SEQUENCE
      *    EXEC SQL
      *        CLOSE DB
DBPRE          CALL "MySQL_close"

DBPRE          END-CALL

DBPRE          MOVE RETURN-CODE    TO SQLCODE

DBPRE *    END-EXEC.
           PERFORM DB-STATUS
      *
           ACCEPT PGCTB-DATE                FROM DATE
           ACCEPT PGCTB-ENDTIME             FROM TIME
           DISPLAY '*******************************************'
                   '*********'
           DISPLAY '*                                          '
                   '        *'
           DISPLAY '*       Start..: 20' PGCTB-DATE(1:2) '-' 
                   PGCTB-DATE(3:2) '-' PGCTB-DATE(5:2) ' ' 
                   PGCTB-STARTTIME(1:2) ':' PGCTB-STARTTIME(3:2) ':'
                   PGCTB-STARTTIME(5:2) '    '
                   '           *'
           DISPLAY '*                                          '
                   '        *'
           DISPLAY '*       End....: 20' PGCTB-DATE(1:2) '-' 
                   PGCTB-DATE(3:2) '-' PGCTB-DATE(5:2) ' ' 
                   PGCTB-ENDTIME(1:2) ':' PGCTB-ENDTIME(3:2) ':'
                   PGCTB-ENDTIME(5:2) '    '
                   '           *'
           DISPLAY '*                                          '
                   '        *'
           DISPLAY '*                                          '
                   '        *'
           DISPLAY '*******************************************'
                   '*********'
      *
      * No error, return zero
      *
           MOVE 0                       TO RETURN-CODE
           .
       PGCTB-MAIN-EXIT.    
           STOP RUN.
      /
      *************************************************************************
       PGCTB-STATUS SECTION.
           IF PGCTB-ERROR
              IF PGCTB-ERROR-MESSAGE = SPACES
                 STRING PGCTB-PROGRAM-NAME    DELIMITED BY SIZE
                        ': PGCTB-STATUS-FLD ' DELIMITED BY SIZE
                         PGCTB-STATUS-FLD     DELIMITED BY SIZE
                         ' is set!'         DELIMITED BY SIZE
                                   INTO PGCTB-ERROR-MESSAGE
              END-IF
      *
      * Rollback the work
DBPRE         MOVE 6             TO SQLCA-SEQUENCE
      *       EXEC SQL
      *          ROLLBACK
DBPRE          CALL "MySQL_rollback"
DBPRE          END-CALL
DBPRE          MOVE RETURN-CODE    TO SQLCODE
DBPRE *       END-EXEC.
              MOVE 2                       TO RETURN-CODE
              STOP RUN
           END-IF
           .
       PGCTB-STATUS-EXIT.    
           EXIT.    
      *************************************************************************
       PGCTB-DISPLAY-ERROR SECTION.
           DISPLAY '*******************************************'
                   '******************************'
           DISPLAY '* E R R O R * E R R O R * E R R O R * E R R'
                   ' O R * E R R O R * E R R O R *'
           DISPLAY '*******************************************'
                   '******************************'
           DISPLAY '***                                        '
                   '                           ***'
           DISPLAY '** ' PGCTB-ERROR-MESSAGE ' **'
           DISPLAY '***                                        '
                   '                           ***'
           DISPLAY '*******************************************'
                   '******************************'
           DISPLAY '* E R R O R * E R R O R * E R R O R * E R R'
                   ' O R * E R R O R * E R R O R *'
           DISPLAY '*******************************************'
                   '******************************'
           DISPLAY '*      D A T A B A S E   W O R K   U N I T '
                   '  R O L L E D    B A C K     *'
           DISPLAY '*******************************************'
                   '******************************'
           .
       PGCTB-DISPLAY-ERROR-EXIT.    
           EXIT.    
      *************************************************************************
       DB-STATUS SECTION.
           IF SQLCODE NOT = 0
              CALL "MySQL_errno" USING PGCTB-ERRNO
              END-CALL
              DISPLAY 'ERRNO: ' PGCTB-ERRNO
              CALL "MySQL_error" USING PGCTB-ERROR-MESSAGE
              END-CALL
              DISPLAY PGCTB-ERROR-MESSAGE
              MOVE SPACES                      TO PGCTB-ERROR-MESSAGE
              STRING  'DB-STATUS: Program '     DELIMITED BY SIZE
                      PGCTB-PROGRAM-NAME         DELIMITED BY SIZE
                      ' SQLCODE='             DELIMITED BY SIZE
                      SQLCODE                  DELIMITED BY SIZE
                      '   SQLCA-SEQUENCE='     DELIMITED BY SIZE
                      SQLCA-SEQUENCE           DELIMITED BY SIZE
                      ' '                      DELIMITED BY SIZE
                                               INTO PGCTB-ERROR-MESSAGE
              PERFORM PGCTB-DISPLAY-ERROR
      *
      * Rollback the work
DBPRE         MOVE 7             TO SQLCA-SEQUENCE
      *       EXEC SQL
      *          ROLLBACK
DBPRE          CALL "MySQL_rollback"
DBPRE          END-CALL
DBPRE          MOVE RETURN-CODE    TO SQLCODE
DBPRE *       END-EXEC.
              MOVE 3                       TO RETURN-CODE
              STOP RUN
           END-IF
           .
       DB-STATUS-EXIT.    
           EXIT.    
DBPRE *    END-EXEC.
                                                 
      /
      **************************************************************************
      *  P G C T B - A C T I O N   S E C T I O N                               *
      **************************************************************************
        PGCTB-ACTION SECTION. 
      *
           DISPLAY 'In PGCTB-ACTION.'
      *
      *    EXEC SQL
      *       ROLLBACK
      *       please do not parse this......
      *    END-EXEC
      *
           PERFORM DISPLAY-ALL-RECORDS
      *
           DISPLAY 'Delete entire table'
      * 
DBPRE      MOVE 8             TO SQLCA-SEQUENCE
      *    EXEC SQL
DBPRE *    END-EXEC.
DBPRE   MOVE LOW-VALUES TO SQLCA-STATEMENT
DBPRE   STRING
DBPRE   'DELETE ' DELIMITED SIZE
DBPRE   'FROM ' DELIMITED SIZE
DBPRE   'example_table ' DELIMITED SIZE
DBPRE   INTO SQLCA-STATEMENT
DBPRE   END-STRING
DBPRE   CALL 'MySQL_query' USING SQLCA-STATEMENT
DBPRE   END-CALL
DBPRE   MOVE RETURN-CODE TO SQLCODE
           EVALUATE TRUE
             WHEN DB-OK
                CONTINUE
             WHEN OTHER
                PERFORM DB-STATUS
           END-EVALUATE
      *
           PERFORM DISPLAY-ALL-RECORDS
      *
           DISPLAY 'Insert new records'
      * 
           PERFORM VARYING T FROM 1 BY 1 UNTIL T > 10
              MOVE T                   TO FIELD1-NUM
              DISPLAY 'Inserting #' T
DBPRE         MOVE 9             TO SQLCA-SEQUENCE
      *       EXEC SQL
DBPRE *       END-EXEC.
DBPRE   MOVE LOW-VALUES TO SQLCA-STATEMENT
DBPRE   STRING
DBPRE   'INSERT ' DELIMITED SIZE
DBPRE   'INTO ' DELIMITED SIZE
DBPRE   'example_table ' DELIMITED SIZE
DBPRE   '( ' DELIMITED SIZE
DBPRE   'FIELD1, ' DELIMITED SIZE
DBPRE   'FIELD2, ' DELIMITED SIZE
DBPRE   'FIELD3 ' DELIMITED SIZE
DBPRE   ') ' DELIMITED SIZE
DBPRE   'VALUES ' DELIMITED SIZE
DBPRE   '( ' DELIMITED SIZE
DBPRE   SQLCA-QUOTE DELIMITED SIZE
DBPRE   FIELD1 DELIMITED SIZE
DBPRE   SQLCA-QUOTE DELIMITED SIZE
DBPRE   ' ' DELIMITED SIZE
DBPRE   ', ' DELIMITED SIZE
DBPRE   '''Value2'' ' DELIMITED SIZE
DBPRE   ', ' DELIMITED SIZE
DBPRE   '''Value3'' ' DELIMITED SIZE
DBPRE   ') ' DELIMITED SIZE
DBPRE   INTO SQLCA-STATEMENT
DBPRE   END-STRING
DBPRE   CALL 'MySQL_query' USING SQLCA-STATEMENT
DBPRE   END-CALL
DBPRE   MOVE RETURN-CODE        TO SQLCODE
      *       DISPLAY SQLCA-STATEMENT
      *       DISPLAY 'SQLCODE=' SQLCODE
              EVALUATE TRUE
                WHEN DB-OK
                   CONTINUE
                WHEN OTHER
                   PERFORM DB-STATUS
              END-EVALUATE
           END-PERFORM   
      *
           PERFORM DISPLAY-ALL-RECORDS
      * 
           DISPLAY 'Update the first record'
      * 
                                                 
DBPRE      MOVE 10             TO SQLCA-SEQUENCE
      *    EXEC SQL
DBPRE *    END-EXEC.
DBPRE   MOVE LOW-VALUES TO SQLCA-STATEMENT
DBPRE   STRING
DBPRE   'UPDATE ' DELIMITED SIZE
DBPRE   'example_table ' DELIMITED SIZE
DBPRE   'SET ' DELIMITED SIZE
DBPRE   'FIELD1 ' DELIMITED SIZE
DBPRE   '= ' DELIMITED SIZE
DBPRE   '''UpdatedValue1'' ' DELIMITED SIZE
DBPRE   'WHERE ' DELIMITED SIZE
DBPRE   'FIELD1 ' DELIMITED SIZE
DBPRE   '= ' DELIMITED SIZE
DBPRE   '''00000001'' ' DELIMITED SIZE
DBPRE   INTO SQLCA-STATEMENT
DBPRE   END-STRING
DBPRE          CALL 'MySQL_query' USING SQLCA-STATEMENT
DBPRE          END-CALL
DBPRE          MOVE RETURN-CODE        TO SQLCODE
      * 
           DISPLAY 'Update the third record'
      * 
                                                 
DBPRE      MOVE 11             TO SQLCA-SEQUENCE
      *    EXEC SQL
DBPRE *    END-EXEC.
DBPRE   MOVE LOW-VALUES TO SQLCA-STATEMENT
DBPRE   STRING
DBPRE   'UPDATE ' DELIMITED SIZE
DBPRE   'example_table ' DELIMITED SIZE
DBPRE   'SET ' DELIMITED SIZE
DBPRE   'FIELD1 ' DELIMITED SIZE
DBPRE   '= ' DELIMITED SIZE
DBPRE   '''UpdatedValue3'' ' DELIMITED SIZE
DBPRE   'WHERE ' DELIMITED SIZE
DBPRE   'FIELD1 ' DELIMITED SIZE
DBPRE   '= ' DELIMITED SIZE
DBPRE   '''00000003'' ' DELIMITED SIZE
DBPRE   INTO SQLCA-STATEMENT
DBPRE   END-STRING
DBPRE          CALL 'MySQL_query' USING SQLCA-STATEMENT
DBPRE          END-CALL
DBPRE          MOVE RETURN-CODE        TO SQLCODE
      *    DISPLAY 'SQLCA-STATEMENT=' SQLCA-STATEMENT
      *    DISPLAY 'SQLCODE=' SQLCODE
      *    DISPLAY 'SQLCA-COUNT=' SQLCA-COUNT
           EVALUATE TRUE
             WHEN DB-OK
                CONTINUE
             WHEN OTHER
                PERFORM DB-STATUS
           END-EVALUATE
      * 
           PERFORM DISPLAY-ALL-RECORDS
      * 
           DISPLAY 'Ende PGCTB-ACTION.'
      *
           .
        PGCTB-ACTION-EXIT.
           EXIT.
      /
      **************************************************************************
        DISPLAY-ALL-RECORDS SECTION. 
      *
            DISPLAY '-----DISPLAY-ALL-RECORDS-------------------'
      * Attention !! Table name is CaSe sensitive!!!!!!!!!!!!!
DBPRE       MOVE 12             TO SQLCA-SEQUENCE
      *     EXEC SQL
DBPRE *        DECLARE ALLROWS CURSOR FOR
DBPRE *     END-EXEC.
            EVALUATE TRUE
            WHEN DB-OK
               CONTINUE
            WHEN OTHER
               PERFORM DB-STATUS
            END-EVALUATE
      *
DBPRE       MOVE 13             TO SQLCA-SEQUENCE
      *     EXEC SQL
DBPRE *          OPEN ALLROWS
DBPRE       IF SQLCA-CURSOR-CTRL (1) = 1
DBPRE          SET DB-CURSOR-ALREADY-OPEN TO TRUE
DBPRE          PERFORM DB-STATUS
DBPRE       END-IF

DBPRE       MOVE 1 TO SQLCA-CURSOR-CTRL (1)
DBPRE       MOVE LOW-VALUES TO SQLCA-STATEMENT
DBPRE       MOVE 'SELECT FIELD1, FIELD2, FI' TO SQLCA-STAT-LINE (1)
DBPRE       MOVE 'ELD3 FROM example_table ' TO SQLCA-STAT-LINE (2)
DBPRE       CALL 'MySQL_query' USING SQLCA-STATEMENT
DBPRE       END-CALL
DBPRE       MOVE RETURN-CODE TO SQLCODE
DBPRE       IF DB-OK
DBPRE          CALL 'MySQL_use_result' USING SQLCA-RESULT (1)
DBPRE          END-CALL
DBPRE          IF SQLCA-RESULT (1) = NULL
DBPRE             MOVE 100 TO SQLCODE
DBPRE          ELSE
DBPRE             MOVE 0 TO SQLCODE
DBPRE          END-IF
DBPRE       END-IF
DBPRE       IF DB-OK
DBPRE          CALL 'MySQL_fetch_row' USING SQLCA-RESULT (1)
DBPRE                                          FIELD1
DBPRE                                          FIELD2
DBPRE                                          FIELD3
DBPRE          END-CALL
DBPRE          IF SQLCA-RESULT (1) = NULL
DBPRE             MOVE 100 TO SQLCODE
DBPRE          ELSE
DBPRE             MOVE 0 TO SQLCODE
DBPRE          END-IF
DBPRE       END-IF
DBPRE *     END-EXEC.
            EVALUATE TRUE
            WHEN DB-OK
               CONTINUE
            WHEN DB-NOT-FOUND
               CONTINUE
            WHEN OTHER
               PERFORM DB-STATUS
            END-EVALUATE
                                                 
            DISPLAY  'FIELD1=' FIELD1 ' FIELD2=' FIELD2 
                     ' FIELD3=' FIELD3
          
            PERFORM UNTIL NOT DB-OK
DBPRE          MOVE 14             TO SQLCA-SEQUENCE
      *        EXEC SQL
DBPRE *        END-EXEC.
DBPRE       IF SQLCA-CURSOR-CTRL (1) = 0
DBPRE          SET DB-CURSOR-NOT-OPEN TO TRUE
DBPRE          PERFORM DB-STATUS
DBPRE       END-IF
DBPRE          CALL 'MySQL_fetch_row' USING SQLCA-RESULT (1)
DBPRE                                          FIELD1
DBPRE                                          FIELD2
DBPRE                                          FIELD3
DBPRE          END-CALL
DBPRE          IF SQLCA-RESULT (1) = NULL
DBPRE             MOVE 100 TO SQLCODE
DBPRE          ELSE
DBPRE             MOVE 0 TO SQLCODE
DBPRE          END-IF
               EVALUATE TRUE
                 WHEN DB-OK
                     DISPLAY  'FIELD1=' FIELD1 ' FIELD2=' FIELD2 
                           ' FIELD3=' FIELD3
                 WHEN DB-NOT-FOUND
                    MOVE SPACE             TO FIELD1
                    MOVE SPACE             TO FIELD2
                    MOVE SPACE             TO FIELD3
                 WHEN OTHER
                    PERFORM DB-STATUS
               END-EVALUATE
            END-PERFORM
            DISPLAY 'SQLCODE=' SQLCODE
            SET DB-OK                      TO TRUE
            DISPLAY '-------------------------------------------'
      *
DBPRE       MOVE 15             TO SQLCA-SEQUENCE
      *     EXEC SQL
      *        CLOSE ALLROWS
DBPRE       IF SQLCA-CURSOR-CTRL (1) = 0
DBPRE          SET DB-CURSOR-NOT-OPEN TO TRUE
DBPRE          PERFORM DB-STATUS
DBPRE       END-IF
DBPRE       MOVE 0 TO SQLCA-CURSOR-CTRL (1)
DBPRE *     END-EXEC.
            EVALUATE TRUE
            WHEN DB-OK
               CONTINUE
            WHEN OTHER
               PERFORM DB-STATUS
            END-EVALUATE
           .
        DISPLAY-ALL-RECORDS-EXIT.
           EXIT.
