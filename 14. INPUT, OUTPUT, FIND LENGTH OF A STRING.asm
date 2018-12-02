.MODEL SMALL
.STACK 100H 
.DATA

    STR1    DB "ENTER YOUR STRING HERE: $"
    STR2    DB "YOUR STRING IS: $"
    STR3    DB "LENGTH OF STRING IS(DIRECT): $"
    STR4    DB "LENGTH OF STRING IS(COUNT): $"
    INSTR1  DB 20 DUP("$")
    N       DB 0

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX
    
    LEA SI,INSTR1        ;DECLAR STRING
    
;INPUT STRING    
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    MOV AH,0AH
    MOV DX,SI            ;INPUT STRING
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H              ;NEW LINE
    MOV DL,0AH
    INT 21H
    
;PRINT STRING
    LEA DX,STR2
    MOV AH,9
    INT 21H
    
    LEA DX,INSTR1+2
    MOV AH,9             ;OUTPUT STRING
    INT 21H

    MOV AH,2
    MOV DL,0DH
    INT 21H              ;NEW LINE
    MOV DL,0AH
    INT 21H

;PRINT LENGTH OF STRING (DIRECT)
    LEA DX,STR3
    MOV AH,9
    INT 21H
    
    MOV BL,INSTR1+1      ;LENGTH COUNT
    ADD BL,48
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,2
    MOV DL,0DH
    INT 21H              ;NEW LINE
    MOV DL,0AH
    INT 21H
    
;PRINT LENGTH OF STRING ANOTHER WAY
    LEA DX,STR4
    MOV AH,9
    INT 21H    
    
    ADD SI,2
    
  L2:
    CMP BYTE PTR[SI],'$'   ;VISIT INDEX
    JE L1
    INC SI
    INC N
    JMP L2
  
  L1:
    DEC N
    ADD N,48
    
    MOV AH,2
    MOV DL,N                ;PRINT LENGTH
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN