.MODEL SMALL
.STACK 100H

.DATA
NUM1 DB 8
NUM2 DB 2
MSG DB 'Result of Division: $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Display message
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; Load dividend
    MOV AL, NUM1
    MOV AH, 00H

    ; Divide by NUM2
    DIV NUM2

    ; Convert quotient to ASCII
    ADD AL, 30H

    ; Display result
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN