BITS 16
ORG 32768

%INCLUDE "mikedev.inc"  ;import system calls def

start:		;start point programu

;Double line
MOV AX, 1
CALL os_print_horiz_line

;print Uvod
MOV SI, welcome
CALL os_print_string

;new line
CALL os_print_newline

;Double line
MOV AX, 1
CALL os_print_horiz_line

;new line
CALL os_print_newline
;new line
CALL os_print_newline

;-- main quiz

QUIZ:
; OTAZKA1 PRINT
MOV SI, otz1
CALL os_print_string
;new line
CALL os_print_newline

; ODPOVED NA 1 OTZ A)
MOV SI, otz1odA
CALL os_print_string
;new line
CALL os_print_newline

; ODPOVED NA 1 OTZ B)
MOV SI, otz1odB
CALL os_print_string
;new line
CALL os_print_newline

; ODPOVED NA 1 OTZ C)
MOV SI, otz1odC
CALL os_print_string
;new line
CALL os_print_newline

;--Odpoved--
MOV AX, Odp1otz1
MOV BX, 2
CALL os_input_string

MOV AL, [Odp1otz1]
CMP AL, '2'
JE GOOD

BAD:
;new line
CALL os_print_newline
MOV SI, odp1WRNG
CALL os_print_string
;new line
CALL os_print_newline
JMP QUIZ

GOOD:
;new line
CALL os_print_newline
MOV SI, odp1RIGHT
CALL os_print_string
;new line
CALL os_print_newline

END:
CALL os_wait_for_key
RET   ;povinná instrukce pro konec programu -> předává kontrolu OS


welcome db 'Hi, welcome to my cli-based quiz!',0


;---otazka1-----
otz1 db 'Who was T.G. Masaryk?',0

otz1odA db '1) The best czech cook',0
otz1odB db '2) The first Czechoslovakia president',0
otz1odC db '3) The tallest man ever',0

Odp1otz1 times 2 db 0

odp1WRNG db 'That is wrong :(',0
odp1RIGHT db 'That is right :)',0