					TITLE	Programa para determinar si un n�mero es primo o no primo utilizando una macro
					PAGE	60, 132

; Incluir las macros
Include Macros.inc

; MacroPrimoNoPrimo para determinar si un n�mero es primo o no primo
; Par�metros de entrada: Numero
; Par�metros de salida: Resultado
; NOTA: Resultado = 1 es primo. Resultado = 0 es no primo

MacroPimoNoPrimo	MACRO	Numero, Resultado
					; Guardar los registros utilizados

					; Almacenar el resultado en el par�metro de salida

					; Recuperar los registros
					ENDM

; Prototipos de llamadas al sistema operativo
GetStdHandle	PROTO	:QWORD
ReadConsoleW	PROTO	:QWORD,	:QWORD, :QWORD, :QWORD, :QWORD
WriteConsoleW	PROTO	:QWORD,	:QWORD, :QWORD, :QWORD, :QWORD
ExitProcess		PROTO	CodigoSalida:QWORD

				.DATA
Num				QWORD	0
Res				QWORD	0
MenEnt01		WORD	'P', 'r', 'o', 'p', 'o', 'r', 'c', 'i', 'o', 'n', 'e', ' ', 'u', 'n', ' ', 'n', '�', 'm', 'e', 'r', 'o', ':', ' '
MenSal01		WORD	'E', 'l', ' ', 'n', '�', 'm', 'e', 'r', 'o', ' ', 'e', 's', ' ', 'p', 'r', 'i', 'm', 'o', '.'

; Variables utilizadas por las llamadas al sistema
ManejadorE		QWORD	?
ManejadorS		QWORD	?
Caracteres		QWORD	?
Texto			WORD	13 DUP ( ? )				; Variable temporal para conversi�n Entero - Cadena, Cadena - Entero
SaltoLinea		WORD	13, 10
STD_INPUT		EQU		-10
STD_OUTPUT		EQU		-11

				.CODE
Principal		PROC

				; Alinear espacio en la pila
				SUB		RSP, 40

				; Obtener manejador est�ndar del teclado
				MOV		RCX, STD_INPUT
				CALL	GetStdHandle
				MOV		ManejadorE, RAX

				; Obtener manejador est�ndar de la consola
				MOV		RCX, STD_OUTPUT
				CALL	GetStdHandle
				MOV		ManejadorS, RAX

				; Solicitar la variable Num

				; Llamar la macro para determinar si el n�mero es primo o no primo

				; Mostrar el mensaje de salida correspondiente seg�n el resultado

				; Salto de l�nea
				MOV		RCX, ManejadorS				; Manejador de la consola donde se escribe
				LEA		RDX, SaltoLinea				; Direcci�n de la cadena a escribir
				MOV		R8, LENGTHOF SaltoLinea		; N�mero de caracteres a escribir
				LEA		R9, Caracteres				; Direcci�n de la variable donde se guarda el total de caracteres escrito
				MOV		R10, 0						; Reservado para uso futuro
				CALL	WriteConsoleW

				; Salir al sistema operativo
				MOV		RCX, 0
				CALL	ExitProcess

Principal		ENDP
				END