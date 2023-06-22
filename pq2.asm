.model small
.stack 100h
.data
    ms1 db 'Enter 1st digit: $'
    ms2 db 10,13,'Enter 2nd digit: $' 
    ms3 db 10,13,'Addition: $' 
    ms4 db 10,13,'Substruction: $'     
    a db ?
    b db ?
.code  
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah,9
    lea dx,ms1
    int 21h
    
    mov ah,1
    int 21h 
    
    sub al,48
    
    mov cl,al
    mov a,al
    
    mov ah,9
    lea dx, ms2
    int 21h
    
    
    mov ah,1
    int 21h 
    
    sub al,48
    
    mov bl,al
    mov b,al
    
    add bl,a 
    
    add bl,48
    mov ah,9
    lea dx, ms3
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    sub cl,b
    
    add cl,48
    
    mov ah,9
    lea dx, ms4
    int 21h
    
    mov ah,2
    mov dl,cl
    int 21h
   
     
     mov ah,4ch
     int 21h
        
        
       
main endp
  
end main
    
    
                
        
        
    
    