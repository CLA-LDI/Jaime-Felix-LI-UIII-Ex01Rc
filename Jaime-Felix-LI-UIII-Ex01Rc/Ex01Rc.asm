					TITLE	Programa para determinar si un número es primo o no primo utilizando una macro
					PAGE	60, 132

; Incluir las macros
Include Macros.inc

; MacroPrimoNoPrimo para determinar si un número es primo o no primo
; Parámetros de entrada: Numero
; Parámetros de salida: Resultado
; NOTA: Resultado = 1 es primo. Resultado = 0 es no primo

MacroPimoNoPrimo	MACRO	Numero, Resultado
					; Guardar los registros utilizados

					; Almacenar el resultado en el parámetro de salida

					; Recuperar los registros
					ENDM

; Prototipos de llamadas al sistema operativo
GetStdHandle	PROTO	:QWORD
ReadConsoleW	PROTO	:QWORD,	:QWORD, :QWORD, :QWORD, :QWORD
WriteConsoleW	PROTO	:QWORD,	:QWORD, :QWORD, :QWORD, :QWORD

				.DATA
Num				QWORD	0
Res				QWORD	0
MenEnt01		WORD	'P', 'r', 'o', 'p', 'o', 'r', 'c', 'i', 'o', 'n', 'e', ' ', 'u', 'n', ' ', 'n', 'ú', 'm', 'e', 'r', 'o', ':', ' '
MenSal01		WORD	'E', 'l', ' ', 'n', 'ú', 'm', 'e', 'r', 'o', ' ', 'e', 's', ' ', 'p', 'r', 'i', 'm', 'o', '.'

; Variables utilizadas por las llamadas al sistema
ManejadorE		QWORD	?
ManejadorS		QWORD	?
Caracteres		QWORD	?
Texto			WORD	13 DUP ( ? )				; Variable temporal para conversión Entero - Cadena, Cadena - Entero
SaltoLinea		WORD	13, 10
STD_INPUT		EQU		-10
STD_OUTPUT		EQU		-11

				.CODE
Principal		PROC

				; Alinear espacio en la pila
				SUB		RSP, 40

				; Obtener manejador estándar del teclado
				MOV		RCX, STD_INPUT
				CALL	GetStdHandle
				MOV		ManejadorE, RAX

				; Obtener manejador estándar de la consola
				MOV		RCX, STD_OUTPUT
				CALL	GetStdHandle
				MOV		ManejadorS, RAX

				; Solicitar la variable Num

				; Llamar la macro para determinar si el número es primo o no primo

				; Mostrar el mensaje de salida correspondiente según el resultado

				; Salto de línea
				MOV		RCX, ManejadorS				; Manejador de la consola donde se escribe
				LEA		RDX, SaltoLinea				; Dirección de la cadena a escribir
				MOV		R8, LENGTHOF SaltoLinea		; Número de caracteres a escribir
				LEA		R9, Caracteres				; Dirección de la variable donde se guarda el total de caracteres escrito
				MOV		R10, 0						; Reservado para uso futuro
				PUSH	R10
				CALL	WriteConsoleW
				POP		R10

				; Recuperar el espacio de la pila
				ADD		RSP, 40

				; Salir al S. O
				MOV		RAX, 0					; Código de salida 0
				RET								; Retornar al sistema operativo
Principal		ENDP
				END
