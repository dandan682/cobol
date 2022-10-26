       IDENTIFICATION DIVISION.
       PROGRAM-ID.     PRUEBAC2.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 WS-ENTRADA.
       
      * EN EL FILLER RECIBE EL CODIGO DE TRANSACCION Y LAS COORDENADAS
      * DEL TEXTO 
          05 FILLER       PIC X(4).
          05 WS-MENSAJE-E PIC X(70).
      *
       01 WS-SALIDA.
          05 WS-TEXTO     PIC X(8).
          05 WS-MENSAJE-S PIC X(70).

       PROCEDURE DIVISION.
           PERFORM 1000-INICIO.
           PERFORM 2000-PROCESO.
           PERFORM 3000-FIN.
           GOBACK.
           
       1000-INICIO.
      * INICIALIZAMOS LA VARIABLE DE LONGITUD DE ENTRADA Y SALIDA.
           INITIALIZE WS-ENTRADA 
                      WS-SALIDA 

           EXEC CICS RECEIVE
               INTO (WS-ENTRADA)
               LENGTH(LENGTH OF WS-ENTRADA)
           END-EXEC.

       2000-PROCESO.

      * MOVEMOS LA ENTRADA A LA SALIDA
           MOVE WS-MENSAJE-E TO WS-MENSAJE-S 
           MOVE 'SALIDA :'   TO WS-TEXTO 

      * ENVIAMOS LA VARIABLE AL CICS
           EXEC CICS SEND 
              FROM (WS-SALIDA)
              LENGTH (LENGTH OF WS-SALIDA)
              ERASE               
           END-EXEC.

       3000-FIN.
      * DEVOLVEMOS EL CONTROL AL CICS
           EXEC CICS RETURN END-EXEC.
