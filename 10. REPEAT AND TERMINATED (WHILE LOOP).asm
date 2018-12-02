.MODEL SMALL
.STACK 100H 
.DATA

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX
   
   L: 
   
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    CMP BL,'@'
    JE EXIT
    JMP L
    
  EXIT: 

    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN