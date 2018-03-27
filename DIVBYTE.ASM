.model small
.stack 64
.data
a1 db 21
a2 db 12
temp db ?
.code
main proc far
mov ax,@data
mov ds,ax
mov al,a1
cbw
div a2
mov dl,ah
mov ah,02h
add dl,30h
mov temp,al
int 21h
mov dl,temp
mov ah,02h
add dl,30h
int 21h
mov ax,4c00h
int 21h
main endp
end main
