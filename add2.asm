.model small
.stack 100h
.data
a db 0ah,0dh, "Enter the first number : $"
b db 0ah,0dh, "Enter the second number : $"
c db 0ah,0dh, "The sum is : $"
d db 00h

.code
start:
mov ax,@data
mov ds,ax

mov dx,offset a
mov ah,09h
int 21h

mov ah,01h
int 21h
mov bh,al

mov ah,01h
int 21h
mov bl,al

mov dx,offset b
mov ah,09h
int 21h

mov ah,01h
int 21h
mov ch,al

mov ah,01h
int 21h  
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

mov dx,offset c
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

mov ah, 4ch
int 21h

end start
