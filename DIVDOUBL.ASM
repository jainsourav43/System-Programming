.model small
.386
.stack 64
.data
a1 dd 21232987
a2 dd 12236543
temp dd ?
temp2 dw ?
.code
main proc far
mov ax,@data
mov ds,ax
mov eax,a1
cdq
div a2
mov ah,02h
add dx,30h
int 21h
mov ah,02h
add dx,30h
int 21h
mov ax,4c00h
int 21h
main endp
end main
