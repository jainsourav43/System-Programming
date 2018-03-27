.model small
.386
.stack 64
.data
a1 dd 01020304,05061223
a2 dd 07080910,11121234
result db ?
.code
main proc far
mov ax,@data
mov ds,ax
lea si,a1
lea di,a2
lea bx,result
clc
mov cl,02
abc:
mov eax,[si]
adc eax,[di]
mov [bx],eax
inc si
inc si
inc si
inc si
inc di
inc di
inc di
inc di
inc bx
inc bx
inc bx
inc bx
dec cl
jnz abc
mov cl,02
xxx:
mov dx,result
mov ah,09h
int 21h
loop xxx
mov ax,4c00h
int 21h
main endp
end main
