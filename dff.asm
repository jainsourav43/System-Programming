.model small
.stack 64
.data 
temp1 db 0ah
temp2 db ?
temp3 db ?
num dw 0000

.code
main proc far
mov ax,@data
mov ds,ax
xxx:
mov ah,01h
int 21h
cmp al,0dh
je yyy
mov temp2,al
mov ax,num
mul temp1
mov num,ax
mov al,temp2
sub al,30h
add num,al
jmp xxx
lea si,num
mov ax,si

mov ah,02h
mov dx,ax
int 21h
yyy:
mov dl,num
mov ah,02h
int 21h

mov ax,4c00h
int 21h
main endp
end main



