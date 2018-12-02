.MODEL SMALL
.STACK 100H 
.DATA
VAR DB 0

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV BH,AL
    INT 21H
    MOV CL,AL
    
    CMP BL,VAR
    JG L1
    JMP L2
    L1:
    MOV VAR,BL
    
    L2:
    CMP BH,VAR
    JG L3
    JMP L4
    L3:
    MOV VAR,BH
    
    L4:
    CMP CL,VAR
    JG L5
    JMP EXIT
    L5:
    MOV VAR,CL

    EXIT:
    MOV AH,2
    MOV DL,VAR
    INT 21H 
    
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN