.model small
.stack 100h
.data
 arr db 16h,48h,41h,03h,32h
 msg1 db 10,13,"Element not found !$"
 msg2 db 10,13,"Number found at position : $"
 msg3 db 10,13,"Key : $"

.code

    mov ax,@data
    mov ds,ax

    mov dx, offset msg3
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h
	sub al,30h
	mov ah,00h
	mov dl,10h
	mul dl
	mov bl,al

	mov ah,01h
	int 21h
	sub al,30h
	add bl,al

	mov al,bl

	mov cl,05h
	mov si,0000h
L1:	cmp al,arr [si]
	jz L2
	add si,01
	loop L1
	cmp si,05
	jz L3
L2:	mov dx,offset msg2
	mov ah,09h
	int 21h
	mov dx,si
	add dl,01h
	add dl,30h
	mov ah,02h
	int 21h
	jmp L4
L3:	mov dx,offset msg1
	mov ah,09h
	int 21h

L4:	mov ah,4ch
	int 21h
	end
