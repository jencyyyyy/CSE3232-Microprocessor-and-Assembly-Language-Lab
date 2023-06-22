.MODEL SMALL

.STACK 100H

.DATA
 inmsg db 'Enter a number(1 to 3): $' 
 outmsg db 'Factorial: $'
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
    
    SUB AL, 30h      
    MOV BL, AL 
    
    call nl
    mov ah,9
    lea dx,outmsg
    int 21h
    
    MOV AL, 1 
     
    FACTORIAL:
        CMP BL, 0
        JE OUTPUT 
        MUL BL
        DEC BL
        JMP FACTORIAL
    
    OUTPUT: 
        
        ADD AL, 30h
        MOV DL, AL
        MOV AH, 2
        

        INT 21H
        
         mov ah,4ch
    int 21h  
  
main endp

 nl proc
    MOV AH, 9    
    LEA DX, NEWLINE
    INT 21H
    ret
nl endp

END MAIN
    