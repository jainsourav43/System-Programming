.model small
.stack 256
.data 
name1 db 'Sourav jain','$'
row db 00h
col db 00h
temp1 db ?
.code
main proc far
mov ax,@data
mov ds,ax
mov ah,06h
mov al,00h
mov bh,88h
mov cx,0000h
mov dx,184fh
int 10h
mov ah,06h
mov al,01h
mov bh,0a8h
mov cx,0000h
mov dx,014fh
int 10h
mov ax,4c00h
int 21h
main endp
end main