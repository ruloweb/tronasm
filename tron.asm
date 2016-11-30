MY_DATA SEGMENT



MENU_PRINCIPAL db "ษออออออออออออออออออออป"
           db "บ   .::: TRON :::.   บ"
           db "ฬออออออออออออออออออออน"
           db "        JUGAR         "
           db "       OPCIONES       "
           db "       CREDITOS       "
           db "        SALIR         "
           db "ศอออออออออออออออออออออผ"


MENU_JUGAR db "ษออออออออออออออออออออป"
          db "บ   MODO DE JUEGO    บ"
          db "ฬออออออออออออออออออออน"
          db "        LOCAL         "
          db "        REMOTO        "
          db "        VOLVER        "
          db "ศอออออออออออออออออออออผ"

MENU_REMOTO db "ษออออออออออออออออออออป"
          db "บ       REMOTO       บ"
          db "ฬออออออออออออออออออออน"
          db "        CREAR         "
          db "        BUSCAR        "
          db "        VOLVER        "
          db "ศอออออออออออออออออออออผ"


MENU_OPCIONES db "ษออออออออออออออออออออป"
          db "บ      OPCIONES      บ"
          db "ฬออออออออออออออออออออน"
          db "   COLOR DE LA NAVE   "
          db "   CANTIDAD DE VIDA   "
          db "        VOLVER        "
          db "ศอออออออออออออออออออออผ"

CREDITOS_DIBUJO db "ษอออออออออออออออออออออออออออออออออป"
              db "บ         .::: TRON :::.          บ"
              db "บ            CREDITOS             บ"
              db "ฬอออออออออออออออออออออออออออออออออน"
              db "บ AUTORES:                        บ"
              db "บ        CASTELLS EMILIANO        บ"
              db "บ       SANCHEZ TEJEDA JOSE       บ"
              db "บ                                 บ"
              db "บ PROFESOR:                       บ"
              db "บ        TOLEDO LUIS              บ"
              db "บ                                 บ"
              db "บ MATERIA:                        บ"
              db "บ       ARQUITECTURA DE LAS       บ"
              db "บ         COMPUTADORAS I          บ"
              db "บ                                 บ"
              db "บ               FEBRERO DE 2007   บ"
              db "ศอออออออออออออออออออออออออออออออออผ"

varDibujo1 db "       /\     $"
varDibujo2 db "       \ \    $"
varDibujo3 db "        \ \   $"
varDibujo4 db "         \ \  $"
varDibujo5 db "         /  \ $"
varDibujo6 db "  อออออ\/  b \$"
varDibujo7 db "  อออออ/\  p /$"
varDibujo8 db "         \  / $"
varDibujo9 db "         / /  $"
varDibujo10 db "        / /   $"
varDibujo11 db "       / /    $"
varDibujo12 db "       \/     $"
varDibujo13 db ".::TRON::.$"
varDibujo14 db "     /\     $"
varDibujo15 db "    /<>\    $"
varDibujo16 db "   /=  =\   $"
varDibujo17 db "  /      \  $"
varDibujo18 db " / /\  /\ \ $"
varDibujo19 db "/ /  \/  \ \$"
varDibujo20 db "\/   /\   \/$"
varDibujo21 db "     บบ     $"
varPresione db "PRESIONE UNA TECLA PARA CONTINUAR$"

varDesplacese db "DESPLACESE CON  $"
varSelecionEnter db "ENTER PARA SELECCIONAR UNA OPCION$"

varNavecita1 db " /\ $"
varNavecita2 db "/==\$"
varNavecita3 db "\/\/$"

      varTiempo                               DW 1
      varTecla_Escape                         DB 27
		varTecla_Enter						DB 13

      varTecla_Arriba_Jugador1                DB 'w'
      varTecla_Abajo_Jugador1                 DB 's'
      varTecla_Derecha_Jugador1               DB 'd'
      varTecla_Izquierda_Jugador1             DB 'a'

      varTecla_Arriba_Jugador2                DB (72 + 128)
      varTecla_Abajo_Jugador2                 DB (80 + 128)
      varTecla_Derecha_Jugador2               DB (77 + 128)
      varTecla_Izquierda_Jugador2             DB (75 + 128)

      varMovimiento_Vertical_Jugador1         DW 0
      varMovimiento_Horizontal_Jugador1       DW 1

      varMovimiento_Vertical_Jugador2         DW 0
      varMovimiento_Horizontal_Jugador2       DW -1

      varPosicion_X_Jugador1                  DW 10
      varPosicion_Y_Jugador1                  DW 100

      varPosicion_X_Jugador2                  DW 310
      varPosicion_Y_Jugador2                  DW 100

      varSalir                DB 0

   varIngreseNombre                DB "Ingrese el nombre (Hasta 9 caracteres)$"
   varIngreseJugador1            DB "del Jugador 1: $"
   varIngreseJugador2            DB "del Jugador 2: $"

   varNombre_Jugador1            DB "Jugador 1$"
   varNombre_Jugador2            DB "Jugador 2$"
   varNombreAux_Jugador1            DB "Jugador 1$"
   varNombreAux_Jugador2            DB "Jugador 2$"

   varColor_Jugador1            DW 2
   varColor_Jugador2            DW 5

   varTitulo                DB ".:: T R O N ::.$"

   varEsc                    DB "ESC para salir$"
   varEscCancela                    DB "Presione ESC para cancelar.$"
   varBuscando				DB "Buscando Jugador 1...$"
   varEsperando				DB "Esperando Jugador 2...$"

   varSinVida                DB "XXXXX$"
   varVida                    DB 3, '$'
   varVida_Jugador1            DB 5
   varVida_Jugador2            DB 5
   varPerdioVida_Jugador1        DB 0
   varPerdioVida_Jugador2        DB 0
   varVidaBandera            DB 0

   varColorTmp                DW ?
   varGano                DB "Ganador del juego:$"
   varEmpate                DB "Empataron$"
   varFin                DB 0

   varIngrese_vida            DB "Ingrese la cantidad de vidas [1-8]:$"
   varCuadro1                DB      201,205,205,205,187,'$'
   varCuadro2                DB     186,"   ",186,'$'
   varCuadro3                DB     200,205,205,205,188,'$'
   varVacio                DB     " $"

   varMal_ingresado        DB "OPCION INCORRECTA. Ingrese nuevamente$"

   varAmbosPerdieron            DB "Ambos perdieron una vida$"
   varPerdio                DB "Perdio una vida:$"
   varPresioneEnter            DB "Enter para continuar$"
    varMenu_salir            DB 0
    varMenu_volver            DB 0

    varIngrese_color            DB "Ingrese el color [1-8]: $"
    varColor1                 DB "1) ",219,219,219,'$'
    varColor2                 DB "2) ",219,219,219,'$'
    varColor3                 DB "3) ",219,219,219,'$'
    varColor4                 DB "4) ",219,219,219,'$'
    varColor5                 DB "5) ",219,219,219,'$'
    varColor6                 DB "6) ",219,219,219,'$'
    varColor7                 DB "7) ",219,219,219,'$'
    varColor8                 DB "8) ",219,219,219,'$'
    varColor_Ing_J1            DB "Elija el color del Jugador 1$"
    varColor_Ing_J2            DB "Elija el color del Jugador 2$"
    varColor_repetido            DB "COLOR REPETIDO. Ingrese nuevamente $"


	varCrear	DB	?
	varBuscar	DB	?
;************************* VARIABLES PARA RS232  *********************************
	RS232_DIR	DW	?
	LCR		DB	?
	LSR		DB	?
	MCR		DB	?
	DLL		DB	?
	DLM		DB	?
	RBR		DB	?
	THR		DB	?
	IIR		DB	?
	IER		DB	?

	varBuffer_RS232		DB	'                '
	
MY_DATA ENDS

;************************* SEGMENTO DE PILA *********************************
MY_STACK SEGMENT

    dw  100 dup(?)
top     equ this word

MY_STACK ENDS

;************************* SEGMENTO DE CODIGO ******************************

MY_CODE SEGMENT

;************************* PROCEDIMIENTO INICIAL ***************************

;**************************************************

    ASSUME CS:MY_CODE, SS:MY_STACK
    ASSUME DS:MY_DATA


INICIO:
    MOV AX, MY_DATA      ;Inicializa DS
    MOV DS, AX
    MOV AX, MY_STACK     ;Inicializa SS
    MOV SS, AX
    MOV SP, OFFSET TOP   ;Inicializa SP

    JMP INICIO_SALTA_INCLUDE

	;INCLUDE mouse.h
	INCLUDE modo13h.h
	INCLUDE rs232.h
	INCLUDE menu.asm

INICIO_SALTA_INCLUDE:
;**************************************************

;*************************

    CALL video_iniciar
	CALL rs232_iniciar
    ;CALL mouse_iniciar
    ;CALL mouse_mostrar

    CALL presentacion
;*************************
    CALL cuadro_fondo

main_ciclo:

    MENU 9, 8, 22, 8, 3, 4, MENU_PRINCIPAL
    MOV AX, menu_posicion

    CMP AX, 4                ;OPCION SALIR
    JNZ main_seguir

    MOV varMenu_salir, 1
    JMP main_salir

main_seguir:
    MOV BX, menu_posicion
    DEC BX
    SHL BX, 1

    CALL [BX + OFFSET OPCIONES_MENU_PRINCIPAL]

main_salir:
    CMP varMenu_salir, 0
    JZ main_ciclo

;*************************
    ;CALL mouse_ocultar
    CALL video_finalizar

    MOV AH,04Ch
    INT 21h

;*************************

;***************************************************************************

;************************ MAIN_JUEGO ***************************************
main_juego	PROC NEAR

    CALL fondo

esperar:
    CALL delay

    CMP varFin,0
    JNZ esperar_salto

    CALL mover_naves
    CALL muerte
    CALL dibujar_naves

    CALL mover_naves
    CALL muerte
    CALL dibujar_naves

    CALL mover_naves
    CALL muerte

esperar_salto:
    CALL dibujar_naves

    CALL leer_teclas

    JNC ESPERAR

    MOV varFin, 0
    MOV varVida_Jugador1, 5
    MOV varVida_Jugador2, 5
    MOV varPerdioVida_Jugador1, 0
    MOV varPerdioVida_Jugador2, 0
    MOV varVidaBandera, 0

    CALL cuadro_fondo
	
	RET
main_juego	ENDP
;***************************************************************************

;************************ JUGAR ********************************************
jugar    PROC NEAR

        PUSH AX
        PUSH BX

		MOV varMenu_volver, 0
		
        CALL cuadro_fondo
		
jugar_ciclo:
        MENU 9, 8, 22, 7, 3, 3, MENU_JUGAR
        MOV AX, menu_posicion

        CMP AX, 3                ;OPCION VOLVER
        JNZ jugar_seguir

        MOV varMenu_volver, 1
        JMP jugar_salir

jugar_seguir:
        MOV BX, menu_posicion
        DEC BX
        SHL BX, 1

        CALL [BX + OFFSET OPCIONES_MENU_JUGAR]

jugar_salir:
        CMP varMenu_volver, 0
        JZ jugar_ciclo

        MOV varMenu_volver, 0

        CALL cuadro_fondo

        POP BX
        POP AX
        RET
jugar    ENDP

;***************************************************************************

;************************ MODO_LOCAL ***************************************
modo_local    PROC NEAR

    PUSH DI
    PUSH SI

    CUADROR 0, 0, 319, 199, 0, 0
    TEXTO 10, 24, varPresioneEnter, 000001111b

    TEXTO 2, 5, varIngreseNombre, 000001111b
    TEXTO 2, 6, varIngreseJugador1, 000001111b

    MOV DI, OFFSET varNombre_Jugador1
    CALL cargar_nombre

    TEXTO 2, 15, varIngreseNombre, 000001111b
    TEXTO 2, 16, varIngreseJugador2, 000001111b

    MOV DI, OFFSET varNombre_Jugador2
    CALL cargar_nombre

	CALL main_juego
	
    MOV SI, OFFSET varNombreAux_Jugador1
    MOV DI, OFFSET varNombre_Jugador1
    CALL volver_nombre

    MOV SI, OFFSET varNombreAux_Jugador2
    MOV DI, OFFSET varNombre_Jugador2
    CALL volver_nombre

    POP SI
    POP DI
            RET
modo_local    ENDP
;***************************************************************************

;************************ MODO_REMOTO **************************************
modo_remoto    PROC NEAR

            PUSH AX
            PUSH BX

            MOV varMenu_volver, 0
            CALL cuadro_fondo
modo_remoto_ciclo:
            MENU 9, 8, 22, 7, 3, 3, MENU_REMOTO
            MOV AX, menu_posicion

            CMP AX, 3                ;OPCION VOLVER
            JNZ modo_remoto_seguir

            MOV varMenu_volver, 1
            JMP modo_remoto_salir

modo_remoto_seguir:
            MOV BX, menu_posicion
            DEC BX
            SHL BX, 1

            CALL [BX + OFFSET OPCIONES_MENU_REMOTO]

			CALL cuadro_fondo
			
modo_remoto_salir:
            CMP varMenu_volver, 0
            JZ modo_remoto_ciclo

            MOV varMenu_volver, 0

            CALL cuadro_fondo

            POP BX
            POP AX

            RET
modo_remoto    ENDP
;***************************************************************************

;************************ CREAR ********************************************
crear        PROC NEAR
	PUSH AX
	PUSH BX
	PUSH DI

	CALL cuadro_fondo
	
	TEXTO 2, 5, varIngreseNombre, 000001111b
	TEXTO 2, 6, varIngreseJugador1, 000001111b
	
	MOV DI, OFFSET varNombre_Jugador1
	CALL cargar_nombre

	TEXTO 2, 8, varEsperando,  000001111b
	TEXTO 2, 9, varEscCancela, 000001111b

	MOV AL, 0
	MOV BL, 0
	
crear_esperar_j1:

	LEER_REG LSR, LSR
	TEST LSR, DR
	JZ crear_no_B
	LEER_REG RBR, BL
crear_no_B:
	
	MOV AH, 06h
	MOV DL, 0FFh
	INT 21h
	
	CMP BL, 'B'
	JZ crear_esperar_j1_salir
	CMP AL, 27
	JZ crear_esperar_j1_salir
	
	JMP crear_esperar_j1
crear_esperar_j1_salir:
	CMP AL, 27
	JZ crear_salir_int

	MOV DI, OFFSET varNombre_Jugador2
	
crear_recibiendo:
	CALL esperar_dato
	
	LEER_REG RBR, [DI]
    
	MOV AL, [DI]
	INC DI
	CMP AL, 255
	JNZ crear_recibiendo
	
	CALL esperar_dato
	LEER_REG RBR, <BYTE PTR varColor_Jugador2>
	
	CALL esperar_enviar
	ENV_REG THR, 'C'

;***************************	
	
	MOV DI, OFFSET varNombre_Jugador1
	
crear_enviando:
	CALL esperar_enviar
	
	ENV_REG THR, [DI]
	
	MOV AL, [DI]
	INC DI
	CMP AL, '$'
	JNZ crear_enviando

	CALL esperar_enviar
	ENV_REG THR, 255

	CALL esperar_enviar
	ENV_REG THR, <BYTE PTR varColor_Jugador1>
	
	CALL esperar_enviar
	ENV_REG THR, varVida_Jugador1

	CMP SP, 0			;SP NUNCA ES CERO, DE ESTA MANERA LA BANDERA Z ES DISTINTO DE 0
crear_salir_int:
	JZ crear_salir

	MOV varTecla_Arriba_Jugador1, (72 + 128)
	MOV varTecla_Abajo_Jugador1, (80 + 128)
	MOV varTecla_Derecha_Jugador1, (77 + 128)
	MOV varTecla_Izquierda_Jugador1, (75 + 128)

	MOV varTecla_Arriba_Jugador2, 0
	MOV varTecla_Abajo_Jugador2, 0
	MOV varTecla_Derecha_Jugador2, 0
	MOV varTecla_Izquierda_Jugador2, 0

	CALL main_juego
	
	MOV varTecla_Arriba_Jugador1, 'w'
	MOV varTecla_Abajo_Jugador1, 's'
	MOV varTecla_Derecha_Jugador1, 'd'
	MOV varTecla_Izquierda_Jugador1, 'a'

	MOV varTecla_Arriba_Jugador2, (72 + 128)
	MOV varTecla_Abajo_Jugador2, (80 + 128)
	MOV varTecla_Derecha_Jugador2, (77 + 128)
	MOV varTecla_Izquierda_Jugador2, (75 + 128)

crear_salir:	
	POP DI
	POP BX
	POP AX
	RET
crear        ENDP
;***************************************************************************

;************************ BUSCAR  ******************************************
buscar        PROC NEAR
	PUSH AX
	PUSH BX
	PUSH DI

	CALL cuadro_fondo	
	
	TEXTO 2, 5, varIngreseNombre, 000001111b
	TEXTO 2, 6, varIngreseJugador2, 000001111b
	
	MOV DI, OFFSET varNombre_Jugador2
	CALL cargar_nombre

	TEXTO 2, 8, varBuscando,  000001111b
	TEXTO 2, 9, varEscCancela, 000001111b

	MOV AL, 0
	MOV BL, 0

buscar_enviar_otra_vez:

	LEER_REG LSR, LSR
	TEST LSR, DR
	JZ buscar_no_C
	LEER_REG RBR, BL
buscar_no_C:

	MOV AH, 06h
	MOV DL, 0FFh
	INT 21h
	
	CMP BL, 'C'
	JZ buscar_enviar_otra_vez_salir
	CMP AL, 27
	JZ buscar_enviar_otra_vez_salir
	
	MOV DI, OFFSET varNombre_Jugador2

	CALL esperar_enviar
	ENV_REG THR, 'B'
	
buscar_enviando:

	CALL esperar_enviar
	ENV_REG THR, [DI]
	
	MOV AL, [DI]
	INC DI
	CMP AL, '$'
	JNZ buscar_enviando

	CALL esperar_enviar
	ENV_REG THR, 255

	CALL esperar_enviar
	ENV_REG THR, <BYTE PTR varColor_Jugador2>
	
	JMP buscar_enviar_otra_vez

buscar_enviar_otra_vez_salir:
	CMP AL, 27
	JZ buscar_salir
	
;****************************************	

	MOV DI, OFFSET varNombre_Jugador1

buscar_recibiendo:
	CALL esperar_dato
	
	LEER_REG RBR, [DI]
    
	MOV AL, [DI]
	INC DI
	CMP AL, 255
	JNZ buscar_recibiendo
	
	CALL esperar_dato
	LEER_REG RBR, <BYTE PTR varColor_Jugador1>	
	
	CALL esperar_dato
	LEER_REG RBR, varVida_Jugador1
	
	MOV AL, varVida_Jugador1
	MOV varVida_Jugador2, AL	

	MOV varTecla_Arriba_Jugador1, 0
	MOV varTecla_Abajo_Jugador1, 0
	MOV varTecla_Derecha_Jugador1, 0
	MOV varTecla_Izquierda_Jugador1, 0

	CALL main_juego
	
	MOV varTecla_Arriba_Jugador1, 'w'
	MOV varTecla_Abajo_Jugador1, 's'
	MOV varTecla_Derecha_Jugador1, 'd'
	MOV varTecla_Izquierda_Jugador1, 'a'

buscar_salir:
	POP DI
	POP BX
	POP AX

	RET
buscar        ENDP
;***************************************************************************

;************************ OPCIONES *****************************************
opciones        PROC NEAR

            PUSH AX
            PUSH BX

            MOV varMenu_volver, 0
            CALL cuadro_fondo
opciones_ciclo:

            MENU 9, 8, 22, 7, 3, 3, MENU_OPCIONES
            MOV AX, menu_posicion

            CMP AX, 3                ;OPCION VOLVER
            JNZ opciones_seguir

            MOV varMenu_volver, 1
            JMP opciones_salir

opciones_seguir:
            MOV BX, menu_posicion
            DEC BX
            SHL BX, 1

            CALL [BX + OFFSET OPCIONES_MENU_OPCIONES]

opciones_salir:
            CMP varMenu_volver, 0
            JZ opciones_ciclo

            MOV varMenu_volver, 0

            CALL cuadro_fondo

            POP BX
            POP AX

            RET
opciones        ENDP
;***************************************************************************

;************************ COLOR ********************************************
color        PROC NEAR

            PUSH AX
            PUSH DX

            CUADROR 0, 0, 319, 199, 15, 0
color_ciclo:
            TEXTO 5,2,varColor_Ing_J1,00001111b
            CALL color_opciones
color_tecla:
            MOV AH, 06H
            MOV DL,0FFH
            INT 21H
            JZ color_tecla

            PUSH AX

            MOV AH, 06H
            MOV DL, AL
            INT 21H
            CALL leer_teclas2

            POP AX

            CMP AL, 31H
            JL color_mal_ingresado

            CMP AL,38H
            JG color_mal_ingresado

            SUB AL,30H
            MOV AH,0
            MOV varColor_Jugador1,AX
            JMP color_salir

color_mal_ingresado:
            CUADROR 0, 0, 319, 199, 15, 0
            TEXTO 2, 22, varMal_ingresado, 00000100b

            JMP color_ciclo
color_salir:

;******************************
            CUADROR 0, 0, 319, 199, 15, 0
color_ciclo2:
            TEXTO 5,2,varColor_Ing_J2,00001111b
            CALL color_opciones
color_tecla2:
            MOV AH, 06H
            MOV DL,0FFH
            INT 21H
            JZ color_tecla2

            PUSH AX

            MOV AH, 06H
            MOV DL, AL
            INT 21H
            CALL leer_teclas2

            POP AX

            CMP AL, 31H
            JL color_mal_ingresado2

            CMP AL,38H
            JG color_mal_ingresado2

            MOV AH,0
            SUB AL,30H

            CMP varColor_Jugador1, AX
            JZ color_repetido

            MOV varColor_Jugador2,AX
            JMP color_salir2

color_mal_ingresado2:
            CUADROR 0, 0, 319, 199, 15, 0
            TEXTO 2, 22, varMal_ingresado, 00000100b
            JMP color_ciclo2

color_repetido:
            CUADROR 0, 0, 319, 199, 15, 0
            TEXTO 2, 22, varColor_repetido, 00000100b
            JMP color_ciclo2
color_salir2:
            CALL cuadro_fondo

            POP DX
            POP AX

            RET
color        ENDP
;***************************************************************************

;************************ COLOR_OPCIONES ********************************
color_opciones        PROC NEAR
                TEXTO 8, 23, varPresioneEnter, 00001111b
                TEXTO 14, 4, varColor1, 1
                TEXTO 14, 6, varColor2, 2
                TEXTO 14, 8, varColor3, 3
                TEXTO 14, 10, varColor4, 4
                TEXTO 14, 12, varColor5, 5
                TEXTO 14, 14, varColor6, 6
                TEXTO 14, 16, varColor7, 7
                TEXTO 14, 18, varColor8, 8
                TEXTO 6, 20, varIngrese_color, 00001111b
                RET
color_opciones        ENDP
;************************************************************************

;************************ VIDA ******************************************
vida            PROC NEAR

            CUADROR 0, 0, 319, 199, 15, 0
            PUSH AX
            PUSH DX
vida_ciclo:
            CALl vida_texto
vida_tecla:
            MOV AH, 06H
            MOV DL,0FFH
            INT 21H
            JZ vida_tecla

            PUSH AX
            MOV AH, 06H
            MOV DL, AL
            INT 21H

            CALL leer_teclas2

            POP AX

            CMP AL, 31H
            JL vida_mal_ingresado

            CMP AL,38H
            JG vida_mal_ingresado

            SUB AL,30H

            MOV varVida_Jugador1,AL
            MOV varVida_Jugador2,AL
            JMP vida_salir

vida_mal_ingresado:
            CUADROR 0, 0, 319, 199, 15, 0
            TEXTO 2, 22, varMal_ingresado, 00000100b
            JMP vida_ciclo
vida_salir:
            POP DX
            POP AX

            CALL cuadro_fondo

            RET
vida            ENDP
;***************************************************************************

;************************ VIDA_TEXTO *****************************************
vida_texto    PROC NEAR

            TEXTO 8, 23, varPresioneEnter, 00001111b
            TEXTO 2, 10, varIngrese_vida, 000011b
            TEXTO 16, 15, varCuadro1,000011b
            TEXTO 16, 16, varCuadro2,000011b
            TEXTO 16, 17, varCuadro3,000011b
            TEXTO 17, 16, varVacio,00001111b

            RET
vida_texto    ENDP
;***************************************************************************

;************************ CREDITOS *****************************************
creditos    PROC NEAR

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    CUADROR 0, 0, 319, 199, 0, 0

    MOV CX,17

    MOV AX, DS
    MOV ES, AX

creditos_c:
    PUSH CX

    MOV DL, CL
    DEC DL
    MOV AX, 35
    MUL DL

    MOV BP, AX
    ADD BP, OFFSET CREDITOS_DIBUJO

    MOV DL, 3
    MOV DH, 4
    ADD DH, CL

    MOV BH, 00h
    MOV CX, 35

    MOV AX, 1301h
    INT 10h                 ;LEE DESDE ES:BP

    POP CX
    LOOP creditos_c

    CALL getch

    POP DX
    POP CX
    POP BX
    POP AX
    CUADROR 0, 0, 319, 199, 15, 1
    TEXTO 11, 22, varDesplacese, 000001111b
    TEXTO 4, 23, varSelecionEnter, 00001111b

    RET
creditos    ENDP

;***************************************************************************

;************************ MUERTE *******************************************
muerte    PROC NEAR

    MOV varVidaBandera, 0
    MOV varPerdioVida_Jugador1, 0
    MOV varPerdioVida_Jugador2, 0

    PUSH DX

    VERPUNTO varPosicion_X_Jugador1, varPosicion_Y_Jugador1, varColorTmp
    CMP varColorTmp, 0
    JZ muerte_jugador1_no_choca

       CMP varVida_Jugador1,0
       JZ muerte_jugador1_no_choca

       MOV DL, varVida_Jugador1
       DEC DL
       MOV varVida_Jugador1, DL
       MOV varVidaBandera, 1
       MOV varPerdioVida_Jugador1, 1

muerte_jugador1_no_choca:
       VERPUNTO varPosicion_X_Jugador2, varPosicion_Y_Jugador2, varColorTmp
       CMP varColorTmp, 0
       JZ muerte_jugador2_no_choca

       CMP varVida_Jugador2,0
       JZ muerte_jugador2_no_choca

       MOV DL, varVida_Jugador2
       DEC DL
       MOV varVida_Jugador2, DL
       MOV varVidaBandera, 1
       MOV varPerdioVida_Jugador2, 1

muerte_jugador2_no_choca:
       CMP varVidaBandera, 0
       JZ muerte_salir_i

       CMP varPerdioVida_Jugador1, 0
       JZ muerte_jugador2_choco

       CMP varPerdioVida_Jugador2, 0
       JZ muerte_jugador1_choco
       TEXTO 9, 12, varAmbosPerdieron, 00000011b
       JMP muerte_choque_fin

muerte_salir_i:
    JMP muerte_salir

muerte_jugador1_choco:
       TEXTO 11, 12, varPerdio, varColor_Jugador1
       TEXTO 14, 13, varNombre_Jugador1, varColor_Jugador1
    JMP muerte_choque_fin

muerte_jugador2_choco:
       TEXTO 11, 12, varPerdio, varColor_Jugador2
       TEXTO 14, 13, varNombre_Jugador2, varColor_Jugador2

muerte_choque_fin:
       TEXTO 11, 7, varPresioneEnter,00000111b
       CALL leer_teclas2

       CALL fondo

muerte_salir:
    POP DX

    RET
muerte    ENDP

;***************************************************************************

;************************* FONDO *******************************************
fondo    PROC NEAR
    PUSH CX

    CALL video_iniciar

    CUADRO 6, 17, 313, 150, 7

    CUADRO 6, 155, 157, 188, 7
    CUADRO 162, 155, 313, 188, 7

    TEXTO 12, 1, varTitulo, 00000100b

    TEXTO 2, 20, varNombre_Jugador1, varColor_Jugador1
    TEXTO 14, 20, varNavecita1, varColor_Jugador1
    TEXTO 14, 21, varNavecita2, varColor_Jugador1
    TEXTO 14, 22, varNavecita3, varColor_Jugador1

    TEXTO 21, 20, varNombre_Jugador2, varColor_Jugador2
    TEXTO 33, 20, varNavecita1, varColor_Jugador2
    TEXTO 33, 21, varNavecita2, varColor_Jugador2
    TEXTO 33, 22, varNavecita3, varColor_Jugador2

    TEXTO 25, 24, varEsc, 00000111b

    XOR CX, CX

fondo_Jugador1:

    ADD CX, 2

    CMP varVida_Jugador1, 0
    JZ fondo_Jugador1_sin_vidas

    TEXTO CX, 22, varVida, 00000100b
    SUB CX, 2

    INC CX
    CMP CL, varVida_Jugador1
    JNZ fondo_Jugador1

fondo_Jugador1_sin_vidas:
    XOR CX, CX

fondo_Jugador2:
    ADD CX, 21

    CMP varVida_Jugador2,0
    JZ fondo_Jugador2_sin_vidas

    TEXTO CX, 22, varVida, 00000100b
    SUB CX, 21

    INC CX
    CMP CL, varVida_Jugador2
    JNZ fondo_Jugador2

fondo_Jugador2_sin_vidas:
    CMP varVida_Jugador1,0
    JZ fondo_Jugador1_vida_0
    CMP varVida_Jugador2,0
    JZ fondo_Jugador2_vida_0

    JMP fondo_salir

fondo_Jugador2_vida_0:
    TEXTO 11, 12, varGano, varColor_Jugador1
    TEXTO 15, 13, varNombre_Jugador1, varColor_Jugador1
    TEXTO CX, 22, varSinVida, 00000100b

    MOV varFin, 1
    JMP fondo_salir

fondo_Jugador1_vida_0:
    MOV varFin, 1

    CMP varVida_Jugador2,0
    JZ fondo_empate

    TEXTO 11, 12, varGano, varColor_Jugador2
    TEXTO 15, 13, varNombre_Jugador2, varColor_Jugador2
    TEXTO CX, 22, varSinVida, 00000100b

    JMP fondo_salir

fondo_empate:
    TEXTO 15, 12, varEmpate, 00000111b

    TEXTO 2, 22, varSinVida, 00000100b
    TEXTO 21, 22, varSinVida, 00000100b

fondo_salir:
    MOV varMovimiento_Vertical_Jugador1, 0
    MOV varMovimiento_Horizontal_Jugador1, 1

    MOV varMovimiento_Vertical_Jugador2, 0
    MOV varMovimiento_Horizontal_Jugador2, -1

    MOV varPosicion_X_Jugador1, 10
    MOV varPosicion_Y_Jugador1, 100

    MOV varPosicion_X_Jugador2, 310
    MOV varPosicion_Y_Jugador2, 100

    POP CX
    RET
fondo    ENDP

;***************************************************************************

;************************ CARGAR NOMBRE ************************************
cargar_nombre    PROC NEAR
    PUSH AX
    PUSH DX
    PUSH CX
    PUSH BX

    MOV CX, 9
    MOV AL, 0

cargar_nombre_tecla:
    CMP BYTE PTR AL, [varTecla_Enter]
    JZ cargar_nombre_fin
    MOV AH, 01H
    INT 21H
    JZ cargar_nombre_tecla

    CMP BYTE PTR AL, [varTecla_Enter]
    JZ cargar_nombre_fin

    MOV [DI], AL
    INC DI

    LOOP cargar_nombre_tecla

cargar_nombre_fin:
    CMP CX, 9
    JZ cargar_nombre_salto

    CMP CX, 0
    JNZ cargar_nombre_salto1
    INC DI

cargar_nombre_salto1:
    MOV BYTE PTR [DI], '$'

cargar_nombre_salto:
    DEC DI
    POP BX
    POP CX
    POP DX
    POP AX

    RET
cargar_nombre    ENDP

;***************************************************************************

;************************* LEER_TECLAS *************************************
leer_teclas     PROC NEAR

;*************************

    MOV AH, 06h
    MOV DL, 0FFh
    INT 21h

    JZ leer_teclas_salir_int

    CMP AL, 0
    JNZ leer_teclas_no_extendido
    INT 21h
	ADD AL, 128
;*************************

leer_teclas_no_extendido:

    CMP AL, varTecla_Escape
    JZ leer_teclas_escape

    CMP varCrear, 1
	JZ no_Jugador2
	
	CMP AL, varTecla_Arriba_Jugador2
    JZ leer_teclas_arriba_jugador2
    CMP AL, varTecla_Abajo_Jugador2
    JZ leer_teclas_abajo_jugador2
    CMP AL, varTecla_Derecha_Jugador2
    JZ leer_teclas_derecha_jugador2
    CMP AL, varTecla_Izquierda_Jugador2
    JZ leer_teclas_izquierda_jugador2

no_Jugador2:

;*************************
	
	CMP varBuscar, 1
	JZ leer_teclas_salir_int
	
    CMP AL, varTecla_Arriba_Jugador1
    JZ leer_teclas_arriba_jugador1
    CMP AL, varTecla_Abajo_Jugador1
    JZ leer_teclas_abajo_jugador1
    CMP AL, varTecla_Derecha_Jugador1
    JZ leer_teclas_derecha_jugador1
    CMP AL, varTecla_Izquierda_Jugador1
    JZ leer_teclas_izquierda_jugador1

leer_teclas_salir_int:
    JMP leer_teclas_salir

;*************************

leer_teclas_escape:

    STC

    JMP leer_teclas_salir_

leer_teclas_arriba_jugador2:

    MOV AX, -1
    MOV varMovimiento_Vertical_Jugador2, AX

    MOV AX, 0
    MOV varMovimiento_Horizontal_Jugador2, AX

    JMP leer_teclas_salir

leer_teclas_abajo_jugador2:

    MOV AX, 1
    MOV varMovimiento_Vertical_Jugador2, AX

    MOV AX, 0
    MOV varMovimiento_Horizontal_Jugador2, AX

              JMP leer_teclas_salir

leer_teclas_derecha_jugador2:

              MOV AX, 0
              MOV varMovimiento_Vertical_Jugador2, AX

              MOV AX, 1
              MOV varMovimiento_Horizontal_Jugador2, AX

              JMP leer_teclas_salir

leer_teclas_izquierda_jugador2:

              MOV AX, 0
              MOV varMovimiento_Vertical_Jugador2, AX

              MOV AX, -1
              MOV varMovimiento_Horizontal_Jugador2, AX

              JMP leer_teclas_salir

;*************************

leer_teclas_arriba_jugador1:

              MOV AX, -1
              MOV varMovimiento_Vertical_Jugador1, AX

              MOV AX, 0
              MOV varMovimiento_Horizontal_Jugador1, AX

              JMP leer_teclas_salir

leer_teclas_abajo_jugador1:

              MOV AX, 1
              MOV varMovimiento_Vertical_Jugador1, AX

              MOV AX, 0
              MOV varMovimiento_Horizontal_Jugador1, AX

              JMP leer_teclas_salir

leer_teclas_derecha_jugador1:

              MOV AX, 0
              MOV varMovimiento_Vertical_Jugador1, AX

              MOV AX, 1
              MOV varMovimiento_Horizontal_Jugador1, AX

              JMP leer_teclas_salir

leer_teclas_izquierda_jugador1:

              MOV AX, 0
              MOV varMovimiento_Vertical_Jugador1, AX

              MOV AX, -1
              MOV varMovimiento_Horizontal_Jugador1, AX

;*************************

leer_teclas_salir:

              CLC

leer_teclas_salir_:

           RET
leer_teclas     ENDP

;***************************************************************************


;************************* LEER_TECLAS2 *************************************

leer_teclas2    PROC NEAR

       PUSH AX
       PUSH DX

leer_teclas2_saltar:
       MOV AH, 06h
       MOV DL, 0FFh
       INT 21h

       CMP AL, [varTecla_Enter]
       JNZ leer_teclas2_saltar

       POP DX
       POP AX

       RET
leer_teclas2    ENDP


;***************************************************************************

;************************ PRESENTACION *****************************************
presentacion    PROC NEAR

           PUSH AX
           PUSH DX
           PUSH CX

           CUADROR 0, 0, 319, 199, 0, 0

           TEXTO 2, 5, varDibujo1, varColor_Jugador1
           TEXTO 2, 6, varDibujo2, varColor_Jugador1
           TEXTO 2, 7, varDibujo3, varColor_Jugador1
           TEXTO 2, 8, varDibujo4, varColor_Jugador1
           TEXTO 2, 9, varDibujo5, varColor_Jugador1
           TEXTO 2, 10, varDibujo6, varColor_Jugador1
           TEXTO 2, 11, varDibujo7, varColor_Jugador1
           TEXTO 2, 12, varDibujo8, varColor_Jugador1
           TEXTO 2, 13, varDibujo9, varColor_Jugador1
           TEXTO 2, 14, varDibujo10, varColor_Jugador1
           TEXTO 2, 15, varDibujo11, varColor_Jugador1
           TEXTO 2, 16, varDibujo12, varColor_Jugador1
           TEXTO 16, 3, varDibujo13, 00000100b
           TEXTO 24, 8, varDibujo14, varColor_Jugador2
           TEXTO 24, 9, varDibujo15, varColor_Jugador2
           TEXTO 24, 10, varDibujo16, varColor_Jugador2
           TEXTO 24, 11, varDibujo17, varColor_Jugador2
           TEXTO 24, 12, varDibujo18, varColor_Jugador2
           TEXTO 24, 13, varDibujo19, varColor_Jugador2
           TEXTO 24, 14, varDibujo20, varColor_Jugador2

           MOV CX, 15

presentacion_repita:
           TEXTO 24, CX, varDibujo21, varColor_Jugador2
           INC CX
           CMP CX, 20
           JNZ presentacion_repita

           TEXTO 3, 24, varPresione, 00000111b

presentacion_tecla:
           MOV AH, 06h
           MOV DL, 0FFh
           INT 21h
           JZ presentacion_tecla

           POP CX
           POP DX
           POP AX

           RET
presentacion    ENDP

;***************************************************************************



;************************* MOVER_NAVES *************************************
mover_naves     PROC NEAR

              MOV AX, varPosicion_X_Jugador1
              MOV BX, varMovimiento_Horizontal_Jugador1
              ADD AX, BX
              MOV varPosicion_X_Jugador1, AX

              MOV AX, varPosicion_Y_Jugador1
              MOV BX, varMovimiento_Vertical_Jugador1
              ADD AX, BX
              MOV varPosicion_Y_Jugador1, AX

              MOV AX, varPosicion_X_Jugador2
              MOV BX, varMovimiento_Horizontal_Jugador2
              ADD AX, BX
              MOV varPosicion_X_Jugador2, AX

              MOV AX, varPosicion_Y_Jugador2
              MOV BX, varMovimiento_Vertical_Jugador2
              ADD AX, BX
              MOV varPosicion_Y_Jugador2, AX

              RET
mover_naves     ENDP
;***************************************************************************

;************************* DIBUJAR_NAVES ***********************************
dibujar_naves   PROC NEAR

              PUNTO varPosicion_X_Jugador1, varPosicion_Y_Jugador1, varColor_Jugador1
              PUNTO varPosicion_X_Jugador2, varPosicion_Y_Jugador2, varColor_Jugador2

              RET
dibujar_naves   ENDP
;***************************************************************************

;************************ VOLVER_NOMBRE ************************************
volver_nombre    PROC NEAR

           PUSH AX
           PUSH CX

           MOV CX, 10
volver_nombre_repita:
           MOV AX, [SI]
           MOV [DI], AX
           INC SI
           INC DI
           LOOP volver_nombre_repita

           POP CX
           POP AX

           RET
volver_nombre    ENDP

;***************************************************************************

;******************************** GETCH ************************************
getch           PROC NEAR

              PUSH AX

              MOV AH, 7h
              INT 21h

              POP AX

              RET
getch           ENDP
;***************************************************************************

;******************************** CUADRO_FONDO *****************************
cuadro_fondo        PROC NEAR

                CUADROR 0, 0, 319, 199, 15, 1
                TEXTO 11, 22, varDesplacese, 000001111b
                TEXTO 4, 23, varSelecionEnter, 00001111b

                      RET
cuadro_fondo         ENDP
;***************************************************************************





;************************* DELAY *******************************************
delay           PROC NEAR

              MOV DX, varTiempo
              SUB CX, CX
              MOV ES, CX
              ADD DX, ES:[46Ch]
              ADD CX, ES:[46Eh]

delay_ciclo:    MOV BX, ES:[46Ch]
              MOV AX, ES:[46Eh]
              SUB BX, DX
              SBB AX, CX
              JC delay_ciclo

              RET
delay           ENDP
;***************************************************************************

OPCIONES_MENU_PRINCIPAL    DW jugar
                    DW opciones
                    DW creditos

OPCIONES_MENU_JUGAR        DW modo_local
                    DW modo_remoto

OPCIONES_MENU_REMOTO    DW crear
                    DW buscar

OPCIONES_MENU_OPCIONES    DW color
                    DW vida


MY_CODE ENDS

              END INICIO 
