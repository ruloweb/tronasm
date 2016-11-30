menu_x				db ?
menu_y				db ?
menu_ancho 			dw ?
menu_alto				dw ?
menu_alto_cabecera		dw ?
menu_cantidad_opciones	dw ?
menu_off				dw ?
menu_posicion			dw ?

MENU	MACRO _x, _y, _ancho, _alto, _alto_cabecera, _cantidad_opciones, _off
			PUSH AX
			
			MOV AX, _x
			MOV menu_x, AL
			MOV AX, _y
			MOV menu_y, AL
			MOV AX, _ancho
			MOV menu_ancho, AX
			MOV AX, _alto
			MOV menu_alto, AX
			MOV AX, _alto_cabecera
			MOV menu_alto_cabecera, AX
			MOV AX, _cantidad_opciones
			MOV menu_cantidad_opciones, AX
			MOV AX, OFFSET _off
			MOV menu_off, AX
			MOV menu_posicion, 1

			CALL _menu
    
			POP AX
		
			ENDM

;*********************************** MENU **********************************
_menu	PROC NEAR

		PUSH BP
		PUSH AX
		PUSH BX
		PUSH CX
		PUSH DX

		MOV AX, DS
		MOV ES, AX

MENU_REPITA:
		MOV CX, menu_alto

MENU_CICLO:
		PUSH CX

		CALL MENU_COLOR

		MOV DL, CL
		DEC DL
		MOV AX, menu_ancho
		MUL DL
		
		MOV BP, AX
		ADD BP, menu_off

		MOV DL, menu_x
		MOV DH, menu_y
		ADD DH, CL

		MOV BH, 00h
		MOV CX, menu_ancho

		MOV AX, 1301h
		INT 10h                 ;LEE DESDE ES:BP

		POP CX
		LOOP MENU_CICLO

		CALL MENU_TECLAS
		JC MENU_SALIR

		JMP MENU_REPITA

MENU_SALIR:

		POP DX
		POP CX
		POP BX
		POP AX
		POP BP
		RET
_menu	ENDP

;****************************************************************************


;********************************* MENU_COLOR *******************************
MENU_COLOR	PROC NEAR

		PUSH CX

		SUB CX, menu_alto_cabecera

		CMP CX, menu_posicion
		JNZ MENU_COLOR_A

		MOV BL, 4
                JMP MENU_COLOR_FIN

MENU_COLOR_A:   MOV BL, 15

MENU_COLOR_FIN:
                POP CX

                RET
MENU_COLOR      ENDP

;****************************************************************************


;******************************** MENU_TECLAS *******************************
MENU_TECLAS     PROC NEAR

		PUSH AX
		PUSH DX

MENU_TECLA_C:
		MOV AH,06H
		MOV DL,0FFH
		INT 21H
		JZ MENU_TECLA_C

		CMP AL,0
		JZ MENU_TECLA_EXTENDIDO

		CMP AL, 13              ;SALE AL PRESIONAR INTRO
		STC                     ;ACTIVA LA BANDERA DE CARRI
		JZ MENU_TECLA_FIN_C

		JMP MENU_TECLA_FIN

MENU_TECLA_EXTENDIDO:
		INT 21H

		CMP AL,'H'
		JNZ MENU_TECLA_NO_SUBE

		MOV AX, menu_posicion
		CMP AX, 1
		JNZ MENU_TECLA_SUBIR

		MOV AX, menu_cantidad_opciones

		JMP MENU_TECLA_SALTA_MENU_TECLA_SUBIR

MENU_TECLA_SUBIR:
		DEC AX

MENU_TECLA_SALTA_MENU_TECLA_SUBIR:
		MOV menu_posicion, AX

		JMP MENU_TECLA_FIN

MENU_TECLA_NO_SUBE:
		CMP AL, 'P'
		JNZ MENU_TECLA_FIN

		MOV AX, menu_posicion
		CMP AX, menu_cantidad_opciones
		JNZ MENU_TECLA_BAJAR

		MOV AX, 1
		JMP MENU_TECLA_SALTA_MENU_TECLA_BAJAR

MENU_TECLA_BAJAR:
		INC AX

MENU_TECLA_SALTA_MENU_TECLA_BAJAR:
		MOV menu_posicion, AX

MENU_TECLA_FIN:
		CLC                     ;DESACTIVA LA BANDERA DE CARRI
		JMP MENU_TECLA_SALIR

MENU_TECLA_FIN_C:
		STC                     ;ACTIVA LA BANDERA DE CARRI
MENU_TECLA_SALIR:

		POP DX
		POP AX

		RET
MENU_TECLAS	ENDP

;****************************************************************************