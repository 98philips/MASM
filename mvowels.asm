.model small
.stack 100h
.data
    msg1 db 10,13,'Enter a string :  $'
    msg2 db 10,13,'Count of vowels in the string :  $'
    P1 label byte
    M1 db 0FFH
    l db ?
    P11 db 0FFH DUP ('$')

display macro msg
    mov ah,09h
    lea dx,msg
    int 21h
endm
.code
    mov ax,@data
    mov ds,ax

    display msg1
    lea dx,P1
    mov ah,0ah
    int 21h

    lea si,P11

    mov cl,l
    mov ch,00h
    mov bl,00h

    check:
        mov al,[si]
        cmp al,'A'
        jz count
        cmp al,'E'
        jz count
        cmp al,'I'
        jz count
        cmp al,'O'
        jz count
        cmp al,'U'
        jz count
        cmp al,'a'
        jz count
        cmp al,'e'
        jz count
        cmp al,'i'
        jz count
        cmp al,'o'
        jz count
        cmp al,'u'
        jz count
        jmp next
    
        count:
            inc bl
        next:
            inc si
        loop check

    display msg2
    add bl,30h
    mov dl,bl
    mov ah,02h
    int 21h

    mov ah,4ch
    int 21h

end         


