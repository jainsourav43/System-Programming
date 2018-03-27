.model small
.stack 64
.data
a1 dw 0102,0304,0506
a2 dw 0708,0910,1112
result db ?
.code
main proc far
mov ax,@data
mov ds,ax
lea si,a1
lea di,a2
clc
lea bx,result
mov cl,03
abc:
mov ax,[si]
adc ax,[di]
mov [bx],al
inc si
inc si
inc di
inc di
inc bx
inc bx
dec cl
jnz abc
main endp
end main
