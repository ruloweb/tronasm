;*************************

;	LCR
	DLAB	EQU	80h
	BRK		EQU	40h
	STKP	EQU	20h
	EPS		EQU	10h
	PEN		EQU	08h
	STB		EQU	04h
	WLS1	EQU	02h
	WLS0	EQU	01h

;	LSR	
	TEMP	EQU	40h
	THRE	EQU	20h
	BI		EQU	10h
	FE		EQU	08h
	PE		EQU	04h
	OE		EQU	02h
	DR		EQU	01h

;	MCR
	LP		EQU	10

;	IIR
	DCD		EQU	80h
	RI		EQU	40h
	DSR		EQU	20h
	CTS		EQU	10h
	DDCD	EQU	08h
	ID		EQU	06h
	PI		EQU	01h
	
;	IER
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
	IF  (REG EQ DLM) OR (REG EQ IER)
		ADD DX, 1
	ENDIF
	IF  REG EQ IIR
		ADD DX, 2
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
	IF  (REG EQ DLM) OR (REG EQ IER)
		ADD DX, 1
	ENDIF
	IF  REG EQ IIR
		ADD DX, 2
	ENDIF
	
	IN AL, DX
	MOV DEST, AL

	POP DX
	POP AX
		ENDM

RS232PUERTO	MACRO PUERTO
	PUSH AX
	PUSH BX
	PUSH ES
	
	MOV AX, 40h
	MOV ES, AX

	MOV BX, PUERTO
	DEC BX
	SHL BX, 1

	MOV AX, ES:BX
	MOV RS232_DIR, AX

	POP ES
	POP BX
	POP AX
			ENDM

;*************************

rs232_iniciar	PROC NEAR
	RS232PUERTO 1
	
	ENV_REG LCR, 80h
	ENV_REG DLL, 12
	ENV_REG DLM, 0
	ENV_REG LCR, 00000011b
	;ENV_REG MCR, 00010000b
	ENV_REG IER, 00000000b
	
	RET
rs232_iniciar	ENDP

esperar_dato	PROC NEAR
DR_vacio:	
	LEER_REG LSR, LSR			;Lee el registro LSR
	TEST LSR, DR				;Compara con bit 0 (DR)
	JZ DR_vacio					;Sale del ciclo cuando byte DR quede libre
	RET
esperar_dato	ENDP

esperar_enviar	PROC NEAR
THR_vacio:	
	LEER_REG LSR, LSR			;Lee el registro LSR
	TEST LSR, THRE				;Compara con bit 5 (THRE)
	JZ THR_vacio				;Sale del ciclo cuando byte THR quede libre
	RET
esperar_enviar	ENDP
