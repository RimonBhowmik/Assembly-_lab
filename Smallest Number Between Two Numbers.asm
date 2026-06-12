.MODEL SMALL
.STACK 100H

.DATA
NUM1 DB 4
NUM2 DB 7
MSG DB 'Smallest Number: $'

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

    ; Compare with second number
    CMP AL, NUM2
    JL FIRST_SMALL

    ; If NUM2 is smaller
    MOV AL, NUM2

FIRST_SMALL:

    ; Convert to ASCII
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