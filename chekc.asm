.model small
.stack 64
.data
ab db 'ilove iundia$'
.code 
main proc far
mov ax,@data
mov ds,ax
mov ah,02h
int 1ah
lea dx,ab
mov ah,09h
int 21h

mov dl,20h
mov ah,02h
int 21h

mov dl,ch 
mov ah,02h
int 21h

lea dx,ab
mov ah,09h
int 21h

mov dl,20h
mov ah,02h
int 21h


mov dl,20h
mov ah,02h
int 21h

mov dl,cl
mov ah,02h
int 21h

lea dx,ab
mov ah,09h
int 21h

mov dl,20h
mov ah,02h
int 21h

mov ax,4c00h
int 21
main endp 
end  main
