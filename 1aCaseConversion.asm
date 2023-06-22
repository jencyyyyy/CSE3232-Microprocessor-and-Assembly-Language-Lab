.model small
.stack 100H
.data
    
    CR EQU 0DH ;Carriege Return
    LF EQU 0AH ;Line Feed
    array DB 8 dup(?)
    input_msg DB "Input String of 8 charecters: $"
    output_msg DB 0ah,0dh,"Output: $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, input_msg
    mov ah, 9
    int 21h
    
    mov cx, 8
    mov si, offset array      ; we can also write lea si, array instead of mov si,offset array--- same task.. loading effective address ie offset address of array into the si register
    mov ah, 1 ;Move function number 1 to ah for single bit input
    
    input:            
        int 21h
        mov array[si], al
        inc si
        loop input
    
    
    ;Create New Line
    ;mov ah, 2     ;Single Character Output
    ;mov dl, CR    ;Carriege Return
    ;int 21H
    ;mov dl, LF    ;Line Feed
    ;int 21H
    
    ;output mesaage print
    lea dx, output_msg
    mov ah, 9
    int 21h
    
    ;output processing
    mov cx, 8
    mov si, offset array; lea si, array
    
    output:
        mov bl, array[si]
        cmp bl, 41h    ;Check if greater than or equal to 65= A
        jge inner
        jmp print
    
    inner:
        cmp bl, 5ah ;check if less than or equal to 90
        jle tolower
        cmp bl, 61h ;check if greater than or equal to 97
        jge  toupper
        jmp  print
    
    tolower:
            add  bl, 20h  ;add 32d or 20h to the upper to make lower
            jmp  print
    toupper:
            cmp  bl,7Ah
            jg print
            sub  bl, 20h
            jmp  print
                
    print:  
            mov  dl, bl
            mov  ah, 2
            int  21h
            inc  si
            loop output
 
 
            mov  ah, 4ch
            int  21h
          

main endp
end main

