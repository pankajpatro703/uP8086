.MODEL SMALL
.STACK 100
.DATA
NUM1 DD 01234567H
NUM2 DD 10003241H
RESULT DD 00000000H
.CODE
START:
MOV AX,@DATA
MOV DS,AX
MOV DX,0000H
MOV AX, WORD PTR NUM1
MOV BX, WORD PTR NUM2
ADD AX,BX
MOV WORD PTR RESULT, AX
MOV CX,AX
MOV AX, WORD PTR NUM1+2
MOV BX, WORD PTR NUM2+2
ADC AX,BX
MOV WORD PTR RESULT+2,AX
MOV BX,AX
JNC STAR
INC DX
STAR:  MOV WORD PTR RESULT+4, DX
MOV AH,4CH
INT 21H
END START
END