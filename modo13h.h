EXTRN video_iniciar:FAR, video_finalizar:FAR
EXTRN _punto:FAR, _verpunto:FAR, _cuadro:FAR, _cuadror:FAR 
EXTRN _imprimir:FAR

PUNTO           MACRO _x, _y, _color

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

VERPUNTO        MACRO _x, _y, _color

                PUSH AX

                MOV AX, _color
                PUSH AX

                MOV AX, _y
                PUSH AX

                MOV AX, _x
                PUSH AX

                CALL _verpunto

                POP AX
                POP AX
                POP AX

                MOV _color, AX
		
                POP AX
		
                ENDM


CUADRO          MACRO _x1, _y1, _x2, _y2, _colc

                PUSH AX
 
                MOV AX, _colc
                PUSH AX
                MOV AX, _y2
                PUSH AX
                MOV AX, _x2
                PUSH AX
                MOV AX, _y1
                PUSH AX
                MOV AX, _x1
                PUSH AX

                CALL _cuadro

                POP AX
                POP AX
                POP AX
                POP AX
                POP AX

                POP AX
		
                ENDM

CUADROR          MACRO _x1, _y1, _x2, _y2, _colc, _colf

                PUSH AX
 
                MOV AX, _colf
                PUSH AX
                MOV AX, _colc
                PUSH AX
                MOV AX, _y2
                PUSH AX
                MOV AX, _x2
                PUSH AX
                MOV AX, _y1
                PUSH AX
                MOV AX, _x1
                PUSH AX

                CALL _cuadror

                POP AX
                POP AX
                POP AX
                POP AX
                POP AX
                POP AX

                POP AX
		
                ENDM
		
TEXTO           MACRO _x, _y, _texto, _color
                	
                PUSH AX
                	
                MOV AX, _color
                PUSH AX
                MOV AX, OFFSET _texto
                PUSH AX
                MOV AX, _y
                PUSH AX
                MOV AX, _x
                PUSH AX
                
                CALL _imprimir
                	
                POP AX
                POP AX
                POP AX
                POP AX
                POP AX
                	
                ENDM