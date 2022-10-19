       IDENTIFICATION DIVISION.
       PROGRAM-ID.     PRUEBAC1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SALIDA-L     PIC S9(4) COMP.
       01 WS-SALIDA       PIC X(10).
       PROCEDURE DIVISION.
           PERFORM 1000-INICIO.
           PERFORM 2000-PROCESO.
           PERFORM 3000-FIN.
           GOBACK.
           
       1000-INICIO.
      * INICIALIZAMOS LA VARIABLE DE SALIDA.
           MOVE 'HOLA MUNDO' TO WS-SALIDA.
           MOVE 10           TO WS-SALIDA-L.
       2000-PROCESO.
      * ENVIAMOS LA VARIABLE AL CICS.
           EXEC CICS SEND TEXT
              FROM (WS-SALIDA)
              LENGTH (WS-SALIDA-L)               
           END-EXEC.
       3000-FIN.
      * DEVOLVEMOS EL CONTROL AL CICS
           EXEC CICS RETURN END-EXEC.