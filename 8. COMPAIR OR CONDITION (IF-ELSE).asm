CMP= compare
JG = jump if greater than
JL = jump if less than
JE = jump if equal
JGE= jump if greater than or equal
JNG= jump if not greater than
JNE= jump if not equal
JMP= jump
INC= increase
DEC= decrease


      CMP BL,BH    ;CMP A,B HOBE NA
      JGE L2
      
      L1:
      MOV AH,2
      MOV DL,CL
      INT 21H
      
      JMP EXIT
      
      L2:
      MOV AH,2
      MOV DL,CL
      INT 21H
      
      JMP EXIT