.model small
.stack 64
.data
a1 db 01,02,03,04,05,06
a2 db 07,08,09,10,11,12
result db ?
.code
main proc far
mov ax,@data
mov ds,ax
lea si,a1
lea di,a2
lea bx,result
clc
mov cl,06
abc:
mov al,[si]
sbb al,[di]
mov [bx],al
inc si
inc di
inc bx
dec cl
jnz abc
mov result+6,'$'
mov ah,09h
lea dx,result
int 21h
mov ax,4c00h
int 21h
main endp
end main



