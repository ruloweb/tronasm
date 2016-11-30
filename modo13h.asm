MY_CODE SEGMENT
;***************************************************************************
                ASSUME CS:MY_CODE

                PUBLIC video_iniciar, video_finalizar
                PUBLIC _punto, _verpunto, _cuadro, _cuadror
                PUBLIC _imprimir

;*************************
                y	dw ?
                off	dw ?
                x1	dw ?
                y1	dw ?  
                x2	dw ?
                y2	dw ?
                colc	dw ?
                colf	dw ?
;*************************

;*************************
PUNTO     MACRO _x, _y, _color

                PUSH AX

                MOV AX, _color
                PUSH AX

                MOV AX, _y
                PUSH AX

                MOV AX, _x
                PUSH AX

                CALL _punto

                POP AX
                POP AX
                POP AX

                POP AX
		
                ENDM
;*************************

;************************ VIDEO_INICIAR ************************************
video_iniciar   PROC FAR

                MOV AX, 0013h
                INT 10h

                RET
video_iniciar   ENDP
;***************************************************************************

;************************ VIDEO_FINALIZAR **********************************
video_finalizar PROC FAR

                MOV AX, 0003h
                INT 10h

                RET
video_finalizar ENDP
;***************************************************************************

;************************ _PUNTO *******************************************
_punto          PROC FAR
		
                PUSH BP
                MOV BP, SP

                PUSH AX
                PUSH BX
                PUSH DX

                MOV AX, [BP + 6]
                MOV off, AX
                
                MOV AX, [BP + 8]
                MOV y, AX
		
                MOV CL, 8
                SHL AX, CL
                MOV CL, 6
                SHL y, CL

                ADD AX, y
                ADD off, AX
		
                MOV DL, [BP + 10]

                MOV AX, 0A000h
                MOV ES, AX
                
                MOV BX, off
                MOV ES:[BX], DL

                POP DX
                POP BX
                POP AX
                POP BP

                RET
_punto          ENDP
;***************************************************************************

;************************ VER_PUNTO ****************************************
_verpunto       PROC FAR

                PUSH BP
                MOV BP, SP

                PUSH AX
                PUSH BX
                PUSH DX

                MOV AX, [BP + 6]
                MOV off, AX
		
                MOV AX, [BP + 8]
                MOV y, AX
		
                MOV CL, 8
                SHL AX, CL
                MOV CL, 6
                SHL y, CL

                ADD AX, y
                ADD off, AX
		
                MOV AX, 0A000h
                MOV ES, AX
                
                MOV BX, off
                MOV DL, ES:[BX]

                MOV [BP + 10], DL

                POP DX
                POP BX
                POP AX
                POP BP
		
                RET
_verpunto       ENDP
;***************************************************************************

;************************ _CUADRO ******************************************
_cuadro         PROC FAR
		
                PUSH BP
                MOV BP, SP
		
                PUSH AX

                MOV AX, [BP + 6]
                MOV x1, AX
                MOV AX, [BP + 8]
                MOV y1, AX
                MOV AX, [BP + 10]
                MOV x2, AX
                MOV AX, [BP + 12]
                MOV y2, AX
                MOV AX, [BP + 14]
                MOV colc, AX
                MOV AX, [BP + 16]
                MOV colf, AX 

cuadro_linea_h:
                PUNTO x1, y1, colc
                PUNTO x1, y2, colc

                MOV AX, x1
                INC AX
                MOV x1, AX
		
                CMP AX, x2
                JNZ cuadro_linea_h 

                MOV AX, [BP + 6]
                MOV x1, AX
				
cuadro_linea_v:
                PUNTO x1, y1, colc
                PUNTO x2, y1, colc

                MOV AX, y1
                INC AX
                MOV y1, AX
		
                DEC AX
                CMP AX, y2
                JNZ cuadro_linea_v 

                POP AX
                POP BP
		
                RET
_cuadro         ENDP
;***************************************************************************

;************************ _CUADROR *****************************************
_cuadror         PROC FAR
		
                PUSH BP
                MOV BP, SP
		
                PUSH AX

                MOV AX, [BP + 6]
                MOV x1, AX
                MOV AX, [BP + 8]
                MOV y1, AX
                MOV AX, [BP + 10]
                MOV x2, AX
                MOV AX, [BP + 12]
                MOV y2, AX
                MOV AX, [BP + 14]
                MOV colc, AX
                MOV AX, [BP + 16]
                MOV colf, AX 

cuadror_linea_h:
                PUNTO x1, y1, colc
                PUNTO x1, y2, colc

                MOV AX, x1
                INC AX
                MOV x1, AX
		
                CMP AX, x2
                JNZ cuadror_linea_h 

                MOV AX, [BP + 6]
                MOV x1, AX
				
cuadror_linea_v:
                PUNTO x1, y1, colc
                PUNTO x2, y1, colc

                MOV AX, y1
                INC AX
                MOV y1, AX
		
                DEC AX
                CMP AX, y2
                JNZ cuadror_linea_v 

                MOV AX, [BP + 8]
                MOV y1, AX

                MOV AX, y2
                DEC AX
                MOV y2, AX

cuadror_linea_r:
                MOV AX, y1
                INC AX
                MOV y1, AX

                MOV AX, [BP + 6]
                INC AX
                MOV x1, AX

cuadror_linea_h_r:
                PUNTO x1, y1, colf
                PUNTO x1, y2, colf

                MOV AX, x1
                INC AX
                MOV x1, AX
		
                CMP AX, x2
                JNZ cuadror_linea_h_r 

                MOV AX, y1
                CMP AX, y2
                JNZ cuadror_linea_r

                POP AX
                POP BP
		
                RET
_cuadror         ENDP
;***************************************************************************

;************************ _IMPRIMIR ****************************************
_imprimir       PROC FAR

                PUSH BP
                MOV BP, SP

                PUSH AX
                PUSH BX
                PUSH CX
                PUSH SI

                MOV AX, DS
                MOV ES, AX

                MOV DL, [BP + 6]
                MOV DH, [BP + 8]
                MOV BH, 00h
                MOV BL, [BP + 12]
                MOV BP, [BP + 10]

                MOV CX, -1
                MOV SI, BP
                DEC SI
		
_imprimir_ciclo:
                INC SI
                INC CX
                CMP BYTE PTR [SI], 24h
                JNZ _imprimir_ciclo

                MOV AX, 1301h
                INT 10h                                 ;LEE DESDE ES:BP

                POP SI
                POP CX
                POP BX
                POP AX

                POP BP

                RET
_imprimir       ENDP
;***************************************************************************

;***************************************************************************
MY_CODE ENDS

                END
