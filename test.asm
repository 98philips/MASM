DATA SEGMENT
    MSG1 DB 10,13,'Enter a Number :  $'
    MSG2 DB 10,13,'Element found at position :  $'
    MSG3 DB 10,13,'Number not Found $'
    ARRAY DB 05H, 07H, 01H, 09H, 02H 
    P1 LABEL BYTE
    M1 DB 0FFH
    P11 DB 0FFH DUP ('$')
DATA ENDS 
DISPLAY MACRO MSG
    MOV AH,9
    LEA DX,MSG
    INT 21H
ENDM   
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START:
        MOV AX,DATA
        MOV DS,AX                
               
        DISPLAY MSG1  
        
        MOV AH,01H    
        INT 21H
        MOV BL,AL
        SUB BL,30H
        
         
           
        MOV CX,0005H
        MOV SI,0000H
        MOV BH,00H
        
BACK:   
        MOV AL,ARRAY [SI]
        CMP AL,BL
        JZ DONE
        INC BH
        INC SI
        LOOP BACK
        DISPLAY MSG3
        JMP DONEE
        
DONE:
        DISPLAY MSG2
        INC BH
        ADD BH,30H
        MOV DL,BH
        MOV AH,02H
        INT 21H                
DONEE:        
        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
