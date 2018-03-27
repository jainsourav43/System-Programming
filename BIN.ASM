.model small
.stack 64
.dataexit

arr db 01,02,03,04,05,06,07,08,09

OUTPUT db 'NUMBER FOUND','$'
OUTPUT1 db 'NUMBER FOUND','$'
temp1 db 03
.code
main proc far
mov ax,@data
mov ds,ax
lea si,arr
mov cl,04
mov al,09
shr al,01
mov cl,al
gty:
inc si
dec cl
jnz gty
XXX:
mov bl,[si]
cmp  bl,temp1
ja  YYY
cmp  bl,temp1
jz ABC
cmp  bl,temp1
jb CCC
YYY:
shr al,01
mov bl,al
new:

dec si
dec bl
jnz new
mov bl,[si]
cmp  bl,temp1
ja  YYY
cmp  bl,temp1
jz ABC
cmp  bl,temp1
jb CCC
CCC:
shr al,01
mov dl,al
NWd:

dec si
dec dl
jnz NWd
mov dl,[si]
cmp dl,temp1
ja  YYY
cmp dl,temp1
jz ABC
cmp dl,temp1
jb CCC
dec cl
jnz XXX
ABC :
lea dx,OUTPUT
mov ah,09h
int 21h
mov  ax,4c00h
int  21h
FGH :
lea dx,OUTPUT1
mov ah,09h
int 21h
mov  ax,4c00h
main endp
end main
