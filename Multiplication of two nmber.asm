.MODEL SMALL
.STACK 100H

.DATA
NUM1 DB 3
NUM2 DB 3
MSG DB 'Result of Multiplication: $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Display message
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; Load first number
    MOV AL, NUM1

    ; Multiply with second number
    MUL NUM2

    ; Convert result to ASCII
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