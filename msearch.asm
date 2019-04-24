.model small
.stack 100h
.data
    arr db 16h,48h,33h,02h,50h
    found db 0ah,0dh,"Number found at position: $"
    nfound db 0ah,0dh,"Number not found! $"
    key db 0ah,0dh,"Key: $"
.code
    mov ax,@data
    mov ds,ax

    mov dx,offset key
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h

    mov dl,al
    mov al,10h
    mul dl
    mov bl,al

    mov ah,01h
    int 21h
    sub al,30h

    add bl,al
    mov al,bl

    mov si,0000h
    mov cl,05h

    L1: cmp al,arr[si]
        jz L2
        inc si
        loop L1

        jmp L3

    L2: mov bx,si
        add bl,01h

        mov dx,offset found
        mov ah,09h
        int 21h

        mov dl,bl
        add dl,30h
        mov ah,02h
        int 21h

        jmp L4

    L3: mov dx,offset nfound
        mov ah,09h
        int 21h

    L4: mov ah,4ch
        int 21h

end            




