.model small
.stack 100h
.data
    arr db 4h,22h,16h,77h,11h
    len equ $-arr
.code
    mov ax,@data
    mov ds,ax
    mov bl,len-1

    A:  mov cl,bl  
        lea si,arr
    B:  mov al,[si]
        inc si
        cmp al,[si]
        jg swap
        jmp back
    swap:    
        xchg al,[si]
        mov [si-1],al    
    back:
        loop B
        dec bl
        cmp bl,00h
        jnz A

        lea si,arr
        mov cl,len
    print: 

        mov dl, 2ch
        mov ah, 02h
        int 21h
        mov dl, 20h
        mov ah, 02h
        int 21h
   
        mov al,[si]
        
        xor ah,ah
        mov bl,10h
        div bl

        add al,30h
        mov dh,ah
        add dh,30h

        mov dl,al
        mov ah,02h
        int 21h

        mov dl,dh
        mov ah,02h
        int 21h

        inc si

        loop print

    mov ah,4ch
    int 21h

end        



        
        
    
