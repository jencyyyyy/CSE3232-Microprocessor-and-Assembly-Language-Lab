.model small
.stack 100h
.data
    ms1 db 'Enter string: $'
    ms2 db 'Transformed String: $'  
    string db 100 DUP('$') 
    nl db 0ah,0dh,'$'
.code  
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah,9
    lea dx,ms1
    int 21h
    
    mov SI,0 
    mov ah,1
    
    input:
        int 21h
        cmp al,0dh
        jz end_input
        mov string[si],al
        inc si 
        loop input
        
    end_input: 
    
    call nlp 
    
    
    mov ah,9
    lea dx, ms2
    int 21h
    
    mov cx,si 
    
    mov si,0
    
    output:
    mov bl,string[si]
    cmp bl,41h       ;A
    jge greaterThanA
    jmp print
    
    greaterThanA:
        cmp bl, 5Ah  ;Z
        jle tolower
        cmp bl,61h ;a 
        jge greaterThanSmalla
            
     tolower:
        add bl,20H ;make smaller
        jmp print
        
     greaterThanSmalla:
        cmp bl,7Ah ;z
        jle toUpper
        jmp print
        
     toUpper:
        sub bl,20h   
        jmp print
        
        
     print:
        mov ah,2
        mov dl,bl
        int 21h
        inc si
        loop output
     
     
     
     
     
     
     mov ah,4ch
     int 21h
        
        
       
main endp

nlp proc
    mov ah,9h
    lea dx,nl
    int 21h
    ret
nlp endp    
end main
    
    
                
        
        
    
    