MY_DATA SEGMENT
	PUERTO		DW	?
	varCar		DB	0

	ant_int0C		LABEL DWORD
	ant_int0C_off	DW	?
	ant_int0C_seg	DW	?
	
	strINICIO	DB	"Autodiagnóstico UART 8250 por interrupciones.", 0Dh, 0Ah, '$'
	strENTER		DB	0Dh, 0Ah, '$'
MY_DATA ENDS

MY_EXTRA	SEGMENT
MY_EXTRA	ENDS

MY_STACK	SEGMENT
	dw	100 dup(?)
top	equ	this word
MY_STACK	ENDS

MY_CODE SEGMENT
	ASSUME CS:MY_CODE, DS:MY_DATA
	ASSUME ES:MY_EXTRA, SS:MY_STACK

;*************************
	RS232_DIR		DW	?
	
	LCR		DB	?
	DLAB	EQU	80h
	BRK		EQU	40h
	STKP	EQU	20h
	EPS		EQU	10h
	PEN		EQU	08h
	STB		EQU	04h
	WLS1	EQU	02h
	WLS0	EQU	01h
	
	LSR		DB	?
	TEMP	EQU	40h
	THRE	EQU	20h
	BI		EQU	10h
	FE		EQU	08h
	PE		EQU	04h
	OE		EQU	02h
	DR		EQU	01h

	MCR		DB	?
	LP		EQU	10

	DLL		DB	?
	DLM		DB	?
	RBR		DB	?
	THR		DB	?

	IIR		DB	?
	DCD		EQU	80h
	RI		EQU	40h
	DSR		EQU	20h
	CTS		EQU	10h
	DDCD	EQU	08h
	ID		EQU	06h
	PI		EQU	01h
	
	IER		DB	?
	IMSR	EQU	08h
	IERR	EQU	04h
	ITHR	EQU	02h
	IDR		EQU	01h

ENV_REG MACRO REG, DATO
	PUSH AX
	PUSH DX

	MOV DX, RS232_DIR
	MOV AL, DATO

	IF  REG EQ LSR
		ADD DX, 5
	ENDIF
	IF  REG EQ LCR
		ADD DX, 3
	ENDIF
	IF  REG EQ MCR
		ADD DX, 4
	ENDIF
	IF  REG EQ DLM
		ADD DX, 1
	ENDIF
	IF  REG EQ IIR
		ADD DX, 2
	ENDIF
	IF  REG EQ IER
		ADD DX, 1
	ENDIF

	OUT DX, AL
	
	POP DX
	POP AX
		ENDM

LEER_REG	MACRO REG, DEST
	PUSH AX
	PUSH DX
	
	MOV DX, RS232_DIR

	IF  REG EQ LSR
		ADD DX, 5
	ENDIF
	IF  REG EQ LCR
		ADD DX, 3
	ENDIF
	IF  REG EQ MCR
		ADD DX, 4
	ENDIF
	IF  REG EQ DLM
		ADD DX, 1
	ENDIF
	IF  REG EQ IIR
		ADD DX, 2
	ENDIF
	IF  REG EQ IER
		ADD DX, 1
	ENDIF
	
	IN AL, DX
	MOV DEST, AL

	POP DX
	POP AX
		ENDM

RS232DIRECCION	MACRO DEST, PUERTO
	PUSH AX
	PUSH BX
	PUSH ES
	
	MOV AX, 40h
	MOV ES, AX

	MOV BX, PUERTO
	DEC BX
	SHL BX, 1

	MOV AX, ES:BX
	MOV DEST, AX

	POP ES
	POP BX
	POP AX
				ENDM
;*************************

dato_en_puerto	PROC NEAR		;Interrupcion
	PUSH AX
	PUSH DX
	
	LEER_REG RBR, DS:varCar
	
	MOV AL, 20h
	OUT 20h, AL

	POP DX
	POP AX
	IRET
dato_en_puerto	ENDP

main:
	MOV AX, MY_DATA 	;Inicializa DS
	MOV DS, AX
	MOV AX, MY_EXTRA		;Inicializa SS
	MOV ES, AX
	MOV AX, MY_STACK		;Inicializa ES
	MOV SS, AX
	MOV SP, OFFSET top		;Inicializa SP

	RS232DIRECCION RS232_DIR, 1
	
	MOV AH, 35h
	MOV AL, 0Ch
	INT 21h
	MOV ant_int0C_seg, ES
	MOV ant_int0C_off, BX

	MOV DX, OFFSET dato_en_puerto
	PUSH DS
	MOV AX, CS
	MOV DS, AX
	MOV AX, 250Ch
	INT 21h

	POP DS

	IN AL, 21h
	AND AL, 0EFh
	MOV DX, 21h
	OUT DX, AL

	ENV_REG LCR, 80h
	ENV_REG DLL, 12
	ENV_REG DLM, 0
	ENV_REG LCR, 00000011b
	ENV_REG MCR, 00010000b
	ENV_REG IER, 00000001b
	ENV_REG IER, 1			;Habilita interrupcion de dato disponible
	
	MOV AH, 09h
	MOV DX, OFFSET strINICIO
	INT 21h

ciclo:

;tecla:
	MOV AH, 06h
	MOV DL, 0FFh
	INT 21h
;	JZ tecla

	;MOV AH, 06h
	;MOV DL, AL
	;INT 21h
	PUSH AX
	
	THR_vacio:	
	LEER_REG LSR, LSR
	TEST LSR, THRE				;Compara con bit 5 (THRE)
	JZ THR_vacio				;Sale del ciclo cuando byte THR quede libre
	
	ENV_REG THR, AL 		;Envia al puerto la tecla que se ha pulsado

	MOV AL, varCar
	CMP AL, 0
	JZ no_mostrar
	MOV AH, 06h
	MOV DL, varCar
	INT 21h
	MOV varCar, 0
no_mostrar:
	
	POP AX
	
	CMP AL, 27
	JNZ ciclo

	MOV AH, 09h
	MOV DX, OFFSET strENTER
	INT 21h

	MOV DX, ant_int0C_off
	PUSH DS
	MOV AX, ant_int0C_seg
	MOV DS, AX
	MOV AX, 250Ch
	INT 21h
	POP DS
	
	MOV AH, 04Ch
	INT 21h

MY_CODE ENDS

	END main
