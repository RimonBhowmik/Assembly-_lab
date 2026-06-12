.MODEL SMALL
.STACK 100H

.DATA
NUM1 DB 4
NUM2 DB 9
NUM3 DB 6

MSG DB 'Largest Number: $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Display message
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; Assume NUM1 is largest
    MOV AL, NUM1

    ; Compare with NUM2
    CMP AL, NUM2
    JG CHECK_THIRD

    MOV AL, NUM2

CHECK_THIRD:

    ; Compare current largest with NUM3
    CMP AL, NUM3
    JG DISPLAY

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