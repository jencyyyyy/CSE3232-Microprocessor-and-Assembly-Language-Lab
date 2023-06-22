.MODEL SMALL

.STACK 100H

.DATA
inmsg db 'Enter a number(0 to 9): $' 

PRIME_MSG DB 0AH,0DH,'PRIME','$'   
NOT_PRIME_MSG DB 0AH,0DH,'NOT PRIME','$'
NEWLINE DB 0AH,0DH,'$' 


.CODE

MAIN PROC  
    
    MOV AX, DATA
    MOV DS, AX
    
    mov ah,9
    lea dx,inmsg
    int 21h
      
    MOV AH, 1
    INT 21H 
          
    MOV BL,AL 
    
    
        
    ;Prime
    ;SUB AL, '0' 
    PRIME_CHECK:
    CMP BL, 2
    JE PRINT_PRIME_MSG
    
    CMP BL, 3
    JE PRINT_PRIME_MSG 
    
    CMP BL, 5
    JE PRINT_PRIME_MSG 
    
    CMP BL, 7
    JE PRINT_PRIME_MSG    
    
    LEA DX, NOT_PRIME_MSG
    MOV AH, 9
    INT 21H
    JMP EXIT    
    
    PRINT_PRIME_MSG:
        LEA DX, PRIME_MSG
        MOV AH, 9
        INT 21H    

    EXIT: 
        MOV AH,4CH
        INT 21H 
        
MAIN ENDP


             
END MAIN   