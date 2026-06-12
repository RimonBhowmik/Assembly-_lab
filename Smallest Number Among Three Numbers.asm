.MODEL SMALL
.STACK 100H

.DATA
NUM1 DB 8
NUM2 DB 3
NUM3 DB 5

MSG DB 'Smallest Number: $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Display message
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; Assume NUM1 is smallest
    MOV AL, NUM1

    ; Compare with NUM2
    CMP AL, NUM2
    JL CHECK_THIRD

    MOV AL, NUM2

CHECK_THIRD:

    ; Compare current smallest with NUM3
    CMP AL, NUM3
    JL DISPLAY

    MOV AL, NUM3

DISPLAY:

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