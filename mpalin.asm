.model small
.stack 100h
.data
    msg1 db 0ah,0dh,"Enter a String: $"
    msg2 db 0ah,0dh,"Reverse: $"
    msg3 db 0ah,0dh,"Palindrome $"
    msg4 db 0ah,0dh,"Not Palindrome $"
    s label byte
    m db 0ffh
    l db ?
    s1 db 0ffh dup('$')
    s2 db 0ffh dup('$')    
display macro msg
    lea dx,msg
    mov ah,09h
    int 21h
endm    
.code
    mov ax,@data
    mov ds,ax

    display msg1
    lea dx,s
    mov ah,0ah
    int 21h

    lea si,s1
    lea di,s2

    mov dl,l
    dec dl
    mov dh,00h
    add si,dx
    mov cl,l
    mov ch,00h

    rev:    mov al,[si]
            mov [di],al
            dec si
            inc di
            loop rev

    lea si,s1
    lea di,s2

    mov cl,l
    mov ch,00h

    check:  mov al,[si]
            cmp al,[di]
            jne npalin
            loop check

    display msg3
    jmp done

    npalin: display msg4

    done:   mov ah,4ch
            int 21h

end            

