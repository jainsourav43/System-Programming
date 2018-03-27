.stack 64
.model small
.data
temp1 db 50
temp2 db 6
result dw ?
temp4 db ?
temp3 db ?
temp6 db 00 
temp5 dw ?
.code
main proc far
mov ax,@data
mov ds,ax
mov al,temp1
mul temp2
mov temp3,0ah
mov temp5,ax
lea si,temp6
mov cl,00
XXX:
mov ax,temp5
inc cl
div temp3
mov [si],ah
lea di,temp5
mov [di],al
mov bl,00
mov [di+1],bl
inc si
cmp al,00h
jne XXX
lea si,temp6
YYY:
mov dl,[si] 
add dl,30h
inc  si
mov ah,02h
int 21h
dec cl
jnz YYY
mov ax,4c00h
int 21h
main endp
end main
