.model small
.stack 256
.data 
temp db ?
temp1 db ?
.code
main proc far
mov ax,@data
mov ds,ax
mov ah,10h
int 16h
mov ax,4c00h
int 21h
main endp
end main
