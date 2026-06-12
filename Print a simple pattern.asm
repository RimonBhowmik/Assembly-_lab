.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    MOV BL, 1      ; Current row stars
    MOV BH, 5      ; Total rows

OUTER_LOOP:

    MOV CL, BL     ; Number of stars in current row
    MOV CH, 0

INNER_LOOP:

    MOV DL, '*'
    MOV AH, 02H
    INT 21H

    LOOP INNER_LOOP

    ; New Line
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H

    MOV DL, 0AH
    MOV AH, 02H
    INT 21H

    INC BL         ; Increase stars count

    CMP BL, 6      ; Stop after 5 rows
    JL OUTER_LOOP

    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN