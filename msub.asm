.model small
.stack 100h
.data
    op1 db ?
    op2 db ?
    result db 01 dup(?), '$'
    msg1 db 0ah,0dh,"Enter First Number: $"
    msg2 db 0ah,0dh,"Enter Second Number: $"
    msg3 db 0ah,0dh,"Result: $"
.code
    mov ax,@data
    mov ds,ax

    mov dx,offset msg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h

    sub al,30h
    mov op1,al

    mov dx,offset msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h

    sub al,30h
    mov op2,al

    mov al,op1
    sub al,op2
    add al,30h
    mov result,al

    mov dx,offset msg3
    mov ah,09h
    int 21h

    mov dx,offset result
    mov ah,09h
    int 21h

    mov ah,4ch
    int 21h
end    

