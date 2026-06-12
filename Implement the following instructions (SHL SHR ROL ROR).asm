.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'SHL Result: $'
MSG2 DB 0DH,0AH,'SHR Result: $'
MSG3 DB 0DH,0AH,'ROL Result: $'
MSG4 DB 0DH,0AH,'ROR Result: $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; ---------------- SHL ----------------
    MOV AL, 5

    SHL AL, 1

    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; ---------------- SHR ----------------
    MOV AL, 8

    SHR AL, 1

    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; ---------------- ROL ----------------
    MOV AL, 3

    ROL AL, 1

    LEA DX, MSG3
    MOV AH, 09H
    INT 21H

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; ---------------- ROR ----------------
    MOV AL, 8

    ROR AL, 1

    LEA DX, MSG4
    MOV AH, 09H
    INT 21H

    ; ROR may create non-displayable value
    ; so display only low digit

    AND AL, 0FH
    ADD AL, 30H

    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN