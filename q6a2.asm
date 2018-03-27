.model small
.stack 64
.data

temp1 db 'Press Esc for blocking the kayboard for 20 sec ','$'
 
.code
main proc far
mov ax,@data
mov ds,ax
mov cx,0ffffh
mov dx,0ffffh
mov bx,0ffffh
mov ah,09h
lea dx,temp1
int 21h
mov ah,10h
int 16h
cmp ah,01h
jz xxx
jnz out1
xxx:
mov cx,0ffh
yyy:
mov bx,000fh
zzz:
dec bx
jnz zzz
dec cx
jnz  yyy
dec dx
jnz xxx
out1:
mov ax,4c00h
int 21h 
main endp
end main




clearscreen proc near
mov ah,06h
mov al,00
mov cx,0000h
mov dx,184fh
mov bh,00
mov bl,71h
int 10h
ret 
clearscreen endp
