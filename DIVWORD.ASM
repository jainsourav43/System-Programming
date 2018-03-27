.model small
.stack 64
.data
a1 dw 2123
a2 dw 1223
temp dw ?
temp2 dw ?
.code
main proc far
mov ax,@data
mov ds,ax
mov ax,a1
cwd
div a2
mov temp2,dx
mov ah,02h
mov temp,ax
int 21h
mov dx,temp
mov ah,02h
add dx,30h
int 21h
mov ax,4c00h
int 21h
main endp
end main
