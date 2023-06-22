.MODEL SMALL

.STACK 100H

.DATA
 inmsg db 'Enter a number(1 to 3): $' 
 outmsg db 'SUM: $' 
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
    SUB AL, 48      
    MOV BL, 0   
     
    SUM:
        ADD BL, AL
        DEC AL 
        CMP AL, 0
        JG SUM
    
    call nl
    
    mov ah,9
    lea dx,outmsg
    int 21h
    
    ADD BL, 48
    MOV DL, BL
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