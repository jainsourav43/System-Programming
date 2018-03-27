.model small
.stack 64
.data
temp1 db 01,02,03,02,01
result db ?
temp2 db 05
.code
main proc far

mov ax,@data;
mov ds,ax
lea si,temp1
add bl,[si]
inc si
mov cl,05
XXX: add bl,[si]
inc si
dec cl
jnz XXX
mov result ,bl
mov ah,02h
mov dl,result
add dl,30h
int 21h
mov ah,02h
mov dl,20h
int 21h
mov ax,result
mov ah,00
div temp2
mov ah,02h
mov dl,al
add dl,30h
int 21h
mov dl,ah
add dl,30h
int 21h
mov ax,4c00h
int 21h

main endp
end main
