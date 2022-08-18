       IDENTIFICATION DIVISION. 
       PROGRAM-ID. COBTRN6. 

      * PROGRAM USING FILE INPUT AND OUTPUT          
      * TO REFORMAT EMPLOYEE PAY INFORMATION.        
      * CALCULATE A 10% RAISE FOR EACH EMPLOYEE.     
      * ALSO PRODUCES A REPORT OF THE INFORMATION.   
   
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION. 
          FILE-CONTROL. 
             SELECT EMPLOYEE-IN-FILE   
                 ASSIGN TO "empifile.dat"
                 FILE STATUS IS WS-STATUS-INPUT.
             SELECT EMPLOYEE-OUT-FILE  
                 ASSIGN TO "empofile.txt". 
             SELECT REPORT-OUT-FILE    
                 ASSIGN TO "empreport.rpt". 
       DATA DIVISION. 
       FILE SECTION. 
       FD  EMPLOYEE-IN-FILE 
           RECORDING MODE IS F 
           LABEL RECORDS ARE STANDARD 
           RECORD CONTAINS 25 CHARACTERS 
           BLOCK CONTAINS 0 RECORDS 
           DATA RECORD IS EMPLOYEE-RECORD-IN. 
       01 EMPLOYEE-RECORD-IN.
          05  E-ID          PIC X(04). 
          05  FILLER        PIC X(21). 
       FD  EMPLOYEE-OUT-FILE 
           RECORDING MODE IS F 
           LABEL RECORDS ARE STANDARD 
           RECORD CONTAINS 80 CHARACTERS 
           BLOCK CONTAINS 0 RECORDS 
           DATA RECORD IS EMPLOYEE-RECORD-OUT. 
       01 EMPLOYEE-RECORD-OUT. 
          05  EMP-DATA      PIC X(80). 
       FD  REPORT-OUT-FILE 
           RECORDING MODE IS F 
           LABEL RECORDS ARE STANDARD 
           RECORD CONTAINS 80 CHARACTERS 
           BLOCK CONTAINS 0 RECORDS 
           DATA RECORD IS REPORT-RECORD-OUT. 
       01 REPORT-RECORD-OUT. 
          05  RPT-DATA      PIC X(80). 
       WORKING-STORAGE SECTION. 
       01 WS-FLAGS. 
          05  SW-END-OF-FILE-SWITCH   PIC X(1) 
                                      VALUE 'N'. 
              88  SW-END-OF-FILE      VALUE 'Y'. 
              88  SW-NOT-END-OF-FILE  VALUE 'N'. 
          05  SW-ERROR-SWITCH         PIC X(1) VALUE 'N'. 
              88  SW-HAS-ERROR        VALUE 'Y'. 
              88  SW-NO-ERRORS        VALUE 'N'. 
       01 IN-EMPLOYEE-RECORD. 
             05  EMP-ID-IN     PIC X(04). 
             05  FILLER        PIC X(05). 
             05  REG-PAY-IN    PIC 99999V99. 
             05  FILLER        PIC X(02). 
             05  BON-PAY-IN    PIC 9999V99. 
             05  FILLER        PIC X(01). 
       01 OUT-EMPLOYEE-RECORD. 
             05  EMP-ID-OUT    PIC S9(9) USAGE COMP. 
             05  FILLER        PIC X(05). 
             05  REG-PAY-OUT   PIC S9(6)V9(2) USAGE 
                 COMP-3. 
             05  FILLER        PIC X(02). 
             05  BON-PAY-OUT   PIC S9(6)V9(2) USAGE 
                 COMP-3. 
             05  FILLER        PIC X(02). 
             05  NEW-PAY-OUT   PIC S9(6)V9(2) USAGE 
                 COMP-3. 
             05  FILLER        PIC X(49) VALUE SPACES. 
       01 DISPLAY-EMPLOYEE-PIC. 
               05  DIS-REG-PAY  PIC 99999.99. 
               05  DIS-NEW-PAY  PIC 99999.99. 
               05  DIS-BON-PAY  PIC 9999.99. 
       01 HDR-LINE-01. 
             05  FILLER       PIC X(25) VALUE SPACES. 
             05  FILLER       PIC X(30) 
                 VALUE 'EMPLOYEE ANNUAL SALARY REPORT'. 
             05  FILLER       PIC X(25) VALUE SPACES. 
       01 HDR-LINE-02. 
             05  FILLER       PIC X(25) VALUE SPACES. 
             05  FILLER       PIC X(30) 
                 VALUE '----------------------------- '. 
             05  FILLER       PIC X(25) VALUE SPACES. 
       01 SPC-LINE            PIC X(80) VALUE SPACES. 
       01 DTL-HDR01. 
             05 FILLER        PIC  X(19) VALUE SPACE. 
             05 FILLER        PIC  X(06) VALUE 'EMP-ID'. 
             05 FILLER        PIC  X(03) VALUE SPACES. 
             05 FILLER        PIC  X(08) VALUE 'REGULAR '. 
             05 FILLER        PIC  X(04) VALUE SPACE. 
             05 FILLER        PIC  X(08) VALUE 'BONUS   '. 
             05 FILLER        PIC  X(04) VALUE SPACE. 
             05 FILLER        PIC  X(08) VALUE 'NEW PAY '. 
             05 FILLER        PIC  X(13) VALUE SPACES. 
          01 DTL-HDR02. 
             05 FILLER        PIC  X(19) VALUE SPACE. 
             05 FILLER        PIC  X(06) VALUE '------'. 
             05 FILLER        PIC  X(03) VALUE SPACES. 
             05 FILLER        PIC  X(08) VALUE '--------'. 
             05 FILLER        PIC  X(04) VALUE SPACE. 
             05 FILLER        PIC  X(08) VALUE '--------'. 
             05 FILLER        PIC  X(04) VALUE SPACE. 
             05 FILLER        PIC  X(08) VALUE '--------'. 
             05 FILLER        PIC  X(13) VALUE SPACES. 
          01 DTL-LINE. 
             05 FILLER        PIC  X(21) VALUE SPACE. 
             05 RPT-EMP-ID    PIC  9(04). 
             05 FILLER        PIC  X(03) VALUE SPACES. 
             05 RPT-REG-PAY   PIC  99999.99. 
             05 FILLER        PIC  X(04) VALUE SPACE. 
             05 RPT-BON-PAY   PIC  99999.99. 
             05 FILLER        PIC  X(04) VALUE SPACE. 
             05 RPT-NEW-PAY   PIC  99999.99. 
             05 FILLER        PIC  X(13) VALUE SPACES. 
       01 TRLR-LINE-01. 
             05  FILLER       PIC X(26) VALUE SPACES. 
             05  FILLER       PIC X(30) 
                 VALUE ' END OF ANNUAL SALARY REPORT  '. 
             05  FILLER       PIC X(24) VALUE SPACES. 
       77 WS-STATUS-INPUT     PIC X(02).
       77 WS-RECORD-NUM       PIC 99 VALUE 0.
       77 EMP-ID-BIN          PIC S9(9) USAGE COMP. 
       77 REG-PAY-PKD         PIC S9(6)V9(2) USAGE COMP-3. 
       77 BON-PAY-PKD         PIC S9(6)V9(2) USAGE COMP-3. 
       77 PAY-RAISE-PKD       PIC S9(6)V9(2) USAGE COMP-3. 
       77 NEW-PAY-PKD         PIC S9(6)V9(2) USAGE COMP-3. 
       77 NEW-PAY             PIC 99999.99. 
       PROCEDURE DIVISION. 
           PERFORM P100-INITIALIZATION. 
           PERFORM P200-MAINLINE. 
           PERFORM P300-TERMINATION. 
           GOBACK. 
       P100-INITIALIZATION. 
           DISPLAY 'COBTRN6 - SAMPLE COBOL PROGRAM: CHECKING DATA '. 
           OPEN INPUT  EMPLOYEE-IN-FILE ,
                OUTPUT EMPLOYEE-OUT-FILE ,
                OUTPUT REPORT-OUT-FILE. 
           INITIALIZE IN-EMPLOYEE-RECORD, 
                      OUT-EMPLOYEE-RECORD. 
           WRITE REPORT-RECORD-OUT FROM HDR-LINE-01 
           WRITE REPORT-RECORD-OUT FROM HDR-LINE-02 
           WRITE REPORT-RECORD-OUT FROM SPC-LINE 
           WRITE REPORT-RECORD-OUT FROM DTL-HDR01 
           WRITE REPORT-RECORD-OUT FROM DTL-HDR02. 
       P200-MAINLINE. 
      *    MAIN LOOP - READ THE INPUT FILE, 
      *    LOAD THE OUTPUT STRUCTURE AND 
      *    WRITE THE RECORD TO OUTPUT. 
           SET SW-NOT-END-OF-FILE TO TRUE. 
           READ EMPLOYEE-IN-FILE 
              INTO IN-EMPLOYEE-RECORD 
              AT END SET SW-END-OF-FILE TO TRUE
           END-READ 
           PERFORM UNTIL SW-END-OF-FILE 
              ADD 1 TO WS-RECORD-NUM
              PERFORM P1000-EDIT-RECORD 
              IF SW-NO-ERRORS THEN 
                 COMPUTE NEW-PAY-PKD = 
                    (REG-PAY-PKD + (REG-PAY-PKD * 0.10)) 
                 MOVE NEW-PAY-PKD TO NEW-PAY 
      *          DISPLAY 'NEW PAY ' NEW-PAY 
      *       MOVE FIELDS 
                 MOVE EMP-ID-IN   
                    TO EMP-ID-OUT, 
                       RPT-EMP-ID 
                 MOVE REG-PAY-IN 
                    TO REG-PAY-OUT, 
                       RPT-REG-PAY, 
                       DIS-REG-PAY 
                 MOVE BON-PAY-IN 
                    TO BON-PAY-OUT, 
                       RPT-BON-PAY, 
                       DIS-BON-PAY 
                 MOVE NEW-PAY-PKD 
                    TO NEW-PAY-OUT, 
                       RPT-NEW-PAY, 
                       DIS-NEW-PAY 
                 DISPLAY ' EMP ID: '   EMP-ID-IN 
                         ' REG PAY: '  DIS-REG-PAY 
                         ' BONUS PAY: ' DIS-BON-PAY 
                         ' NEW PAY  : ' DIS-NEW-PAY 
                 WRITE EMPLOYEE-RECORD-OUT 
                    FROM OUT-EMPLOYEE-RECORD 
                 WRITE REPORT-RECORD-OUT 
                    FROM DTL-LINE 
              ELSE 
                 DISPLAY ' ** RECORD #' WS-RECORD-NUM ' DISCARDED **' 
              END-IF 
              READ EMPLOYEE-IN-FILE 
                 INTO IN-EMPLOYEE-RECORD 
                    AT END 
                    SET SW-END-OF-FILE TO TRUE 
              END-READ 
           END-PERFORM. 
       P300-TERMINATION. 
           WRITE REPORT-RECORD-OUT FROM SPC-LINE 
           WRITE REPORT-RECORD-OUT FROM SPC-LINE 
           WRITE REPORT-RECORD-OUT FROM TRLR-LINE-01 
           CLOSE EMPLOYEE-IN-FILE, 
                 EMPLOYEE-OUT-FILE, 
                 REPORT-OUT-FILE. 
           DISPLAY 'COBTRN6 - SUCCESSFULLY ENDED'. 
       P1000-EDIT-RECORD. 
            SET SW-NO-ERRORS TO TRUE 
            IF SW-NO-ERRORS THEN 
               IF EMP-ID-IN IS NUMERIC THEN 
                  MOVE EMP-ID-IN TO EMP-ID-BIN 
               ELSE 
                  SET SW-HAS-ERROR TO TRUE 
                  DISPLAY ' ** EMP ID IS NOT NUMERIC ' EMP-ID-IN 
               END-IF 
            END-IF 
            IF SW-NO-ERRORS THEN 
               IF REG-PAY-IN IS NUMERIC THEN 
                  MOVE REG-PAY-IN TO REG-PAY-PKD 
               ELSE 
                  SET SW-HAS-ERROR TO TRUE 
                  DISPLAY ' ** REG PAY IS NOT NUMERIC ' REG-PAY-IN 
               END-IF 
            END-IF 
            IF SW-NO-ERRORS THEN 
               IF BON-PAY-IN IS NUMERIC THEN 
                  MOVE BON-PAY-IN TO BON-PAY-PKD 
               ELSE 
                  DISPLAY ' ** BON PAY IS NOT NUMERIC ' BON-PAY-IN 
                  SET SW-HAS-ERROR TO TRUE 
               END-IF 
            END-IF 
 
            IF SW-NO-ERRORS THEN 
               IF EMP-ID-BIN <= 0 THEN 
                  SET SW-HAS-ERROR TO TRUE 
                  DISPLAY ' ** EMP ID CANNOT BE ZERO ' EMP-ID-IN 
               END-IF 
            END-IF 
            IF SW-NO-ERRORS THEN 
               IF REG-PAY-PKD <= 0 THEN 
                  SET SW-HAS-ERROR TO TRUE 
                  DISPLAY ' ** REG PAY CANNOT BE ZERO ' REG-PAY-IN 
               END-IF 
            END-IF 
            IF SW-NO-ERRORS THEN 
               IF BON-PAY-PKD <= 0 THEN 
                  SET SW-HAS-ERROR TO TRUE 
                  DISPLAY ' ** BON PAY CANNOT BE ZERO ' BON-PAY-IN 
               END-IF 
            END-IF. 
      *    END OF SOURCE CODE 
       END PROGRAM COBTRN6.
           