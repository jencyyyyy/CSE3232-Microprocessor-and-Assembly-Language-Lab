.MODEL SMALL

.STACK 100H

.DATA   
INPUT_MSG DB 'ENTER YOUR STRING: $'  
OUTPUT DB 0AH,0DH,'AFTER SORTING: $'

INPUT DB 50 DUP('$') 

.CODE

MAIN PROC

    MOV AX, DATA
    MOV DS, AX        
    
    mov ah,9
    lea dx,INPUT_MSG
    int 21h
        
    MOV SI, 0 
    MOV AH, 1   
                      
    START_INPUT:
        INT 21H
        CMP AL, 0DH
        JE END_INPUT
        MOV INPUT[SI], AL
        INC SI
        JMP START_INPUT
    
    END_INPUT:   
    
    MOV AH, 9
    LEA DX, OUTPUT
    INT 21H
    
    MOV SI, 0
    
    LOOP1:
        MOV DI, SI
        
        MOV AH, INPUT[SI]
        CMP AH, '$'
        JE END_LOOP1
        
        LOOP2:
            INC DI
            CMP INPUT[DI], '$'
            JE END_LOOP2
            CMP AH, INPUT[DI]
            JL SWAP 
            JMP LOOP2
        
        SWAP:
            MOV AL, AH
            MOV AH, INPUT[DI]
            MOV INPUT[SI], AH
            MOV INPUT[DI], AL
            JMP LOOP2
        
        END_LOOP2:
            INC SI
            JMP LOOP1        
            
    END_LOOP1:  
    
    MOV AH, 9
    LEA DX, INPUT
    INT 21H       
        
END MAIN
        
