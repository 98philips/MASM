.model small
.stack 100h
.data
        op1 dw ?
        op2 dw ?
        msg1 db 0ah,0dh,"Enter number 1: $"
        msg2 db 0ah,0dh,"Enter number 2: $"
        msg3 db 0ah,0dh,"Result: $"
        result dw 01 dup(?), '$'
.code
        mov ax,@data
        mov ds,ax
        
        mov dx,offset msg1
        mov ah,09h
        int 21h
        
        mov ah,01h
        int 21h
        mov cl,al
        sub cl,30h
        mov ah,01h
        int 21h
        mov ch,al
        sub ch,30h
        mov op1,cx
        
        mov dx,offset msg2
        mov ah,09h
        int 21h
        
        mov ah,01h
        int 21h
        mov bl,al
        sub bl,30h
        mov ah,01h
        int 21h
        mov bh,al
        sub bh,30h
        mov op2,cx
       
       
        add cl,bl
        adc ch,bh
        add cl,30h
        add ch,30h
        mov result,cx
        
        mov dx,offset msg3
        mov ah,09h
        int 21h
        
        mov dx,offset result
        mov ah,09h
        int 21h
        
        mov ah,4ch
        int 21h
end
        
