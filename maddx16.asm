.model small
.stack 100h
.data
    msg1 db 0ah,0dh,"Enter First Number: $"
    msg2 db 0ah,0dh,"Enter Second Number: $"
    msg3 db 0ah,0dh,"Sum: $"
    d db 00h
.code
    mov ax,@data
    mov ds,ax

    mov dx,offset msg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov bh,al

    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al

    mov dx,offset msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov ch,al

    mov ah,01h
    int 21h
    sub al,30h
    mov cl,al

    add al,bl
    mov ah,00h
    aaa

    add bh,ah
    add bh,ch

    mov d,al
    mov al,bh
    mov ah,00h
    aaa

    mov bx,ax
    add bx,3030h

    mov dx,offset msg3
    mov ah,09h
    int 21h

    mov dl,bh
    mov ah,02h
    int 21h

    mov dl,bl
    mov ah,02h
    int 21h

    mov dl,d
    add dl,30h
    mov ah,02h
    int 21h

    mov ah,4ch
    int 21h

end    






