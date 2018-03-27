.model small
.386
.stack 256
.data 
.code 
main proc  far
mov  ax,@data
mov ds,ax
mov ax,50
mov dx ,03
mov bx,20
div bx
mov ax,4c00h
int  21h
main endp
end main