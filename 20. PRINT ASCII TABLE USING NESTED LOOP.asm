.MODEL SMALL
.STACK 100H 
.DATA
.CODE
MAIN PROC
    
    MOV CX,0
 
 L1:   
    MOV BX,CX         ;LINE
    MOV CX,8
    
 L2:
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    INC BL
    CMP BL,255          ;CONTROL BX
    
    JE EXIT
    LOOP L2
    
    MOV AH,2
    MOV DL,0DH
    INT 21H           ;NEWLINE
    MOV DL,0AH
    INT 21H
    
    INC BL
    MOV CX,BX
    
    LOOP L1
    
EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN