.model small
.stack 64
.data
array db 12 dup(?)
temp1 db 'GOD IS EVERY WHERE HERE AND THERE','$'
temp2 db ?
temp3 db ?
n db 02
.code
main proc far
mov ax,@data
mov ds,ax
lea si,temp1
lea di,temp2
mov cl,n
fgh:
inc si
loop fgh
mov cl,18
XXX : mov al,[si]
mov [di],al
inc si
inc di
dec cl
jnz XXX
lea si,temp2
mov cl,18
YYY:
mov dl,[si]
mov ah,02h
int 21h
inc si
dec cl
jnz YYY
mov ax,4c00h
int 21h
main endp
end main
