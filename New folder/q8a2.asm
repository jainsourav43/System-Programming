TITLE access keyboard buffer area
;-------------------------------------------
.model small
.stack 64
.data
;-----------------------------------------------

keyarea segment at 40h
org 1ah
keydata db 32 dup(?)
keyarea ends

;-----------------------------------------------------
.code
main proc far
assume es:keyarea
mov ax,@data
mov ds,ax
mov ax,keyarea
mov es,ax
mov di,1ah
mov [es:di],1eh
mov di,1ch
mov [es:di],1eh
mov ah,10h
int 16h
mov bl,al
mov bh,ah

mov di,1ah
mov bx,es:word ptr [di]
sub bx,02
mov di,bx
inc al
mov es:byte ptr[di],al
inc di

CMP AH,1EH
JZ BBB
CMP AH,30H
JZ CCC
CMP AH,2EH
JZ DDD
BBB:
    MOV AH,30H
    JMP DEF
CCC:
    MOV AH,2EH
    JMP DEF
DDD:
    MOV AH,20H
    JMP DEF    
DEF:
MOV ES:BYTE PTR[DI],AH    
MOV DI,1AH
MOV ES:BYTE PTR[DI],1EH
MOV AH,01H;READS IN FROM KEYBOARD BUFFER AREA
INT 21H
mov ax,4c00h
int 21h
main endp
end main

