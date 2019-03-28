DATA SEGMENT
    MSG1 DB 10,13,'Enter a string :  $'
    MSG2 DB 10,13,'Count of vowels in the string :  $'
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
        
        LEA DX,P1
        MOV AH,0AH    
        INT 21H 
        
        MOV BL,00H
        LEA SI,P11
        
    
CHECK :
        MOV AL,[SI]
        CMP AL,'$'
        JZ FINAL
        CMP AL,'A'
        JZ COUNT
        CMP AL,'E'
        JZ COUNT
        CMP AL,'I'
        JZ COUNT
        CMP AL,'O'
        JZ COUNT
        CMP AL,'U'
        JZ COUNT
        CMP AL,'a'
        JZ COUNT
        CMP AL,'e'
        JZ COUNT
        CMP AL,'i'
        JZ COUNT
        CMP AL,'o'
        JZ COUNT
        CMP AL,'u'
        JZ COUNT
        JMP HP

COUNT: 
        INC BL
        
HP:        
        INC SI
        JMP CHECK
FINAL:
        DISPLAY MSG2
        ADD BL,30H
        MOV DL,BL
        MOV AH,02H
        INT 21H
        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
