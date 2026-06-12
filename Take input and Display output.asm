.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'Enter a character: $'
MSG2 DB 10,13,'You entered: $'
CHAR DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    MOV AH, 01H
    INT 21H
    MOV CHAR, AL

    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    MOV DL, CHAR
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN