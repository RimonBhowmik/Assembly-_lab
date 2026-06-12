.MODEL SMALL
.STACK 100H

.DATA
MSG DB 'Sum of N numbers: $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Initialize
    MOV CX, 5      ; N = 5
    MOV AL, 0      ; SUM = 0
    MOV BL, 1      ; Starting number

SUM_LOOP:

    ADD AL, BL
    INC BL
    LOOP SUM_LOOP

    ; Display message
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

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