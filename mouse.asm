MY_CODE SEGMENT
                ASSUME CS:MY_CODE

                PUBLIC mouse_iniciar, mouse_mostrar
                PUBLIC mouse_ocultar, mouse_botones

mouse_iniciar   PROC FAR

                MOV AX, 0h
                INT 33h

                RET
mouse_iniciar   ENDP

mouse_mostrar   PROC FAR

                MOV AX, 1h
                INT 33h

                RET
mouse_mostrar   ENDP

mouse_ocultar   PROC FAR

                MOV AX, 2h
                INT 33h

                RET
mouse_ocultar   ENDP

mouse_botones   PROC FAR

                MOV AX, 3h
                INT 33h

                RET
mouse_botones   ENDP

MY_CODE ENDS

        END
