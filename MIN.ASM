.model small
.stack 64
.data
array db  04,02,01,03,05,06,07,08,09,11
min db 0050
max db 0000
n db 10
temp db 0ah
temp1 db ?
temp2 db ?
temp3 db ?
temp4 db 'minimum is' , '$'
temp5 db 'MAXIMUM  IS' ,  '$'
.code
main proc far
mov ax,@data
mov ds,ax
mov cl,n
lea si,array
xxx:
mov al,[si]
cmp al,max
ja yyy
inc si
dec cl
jz eee
jnz xxx
yyy:
mov al,[si]
mov max,al
inc si
dec cl
jnz xxx
eee:
mov cl,n
lea si,array
xxx1:
mov al,[si]
cmp al,min
jb yyy1
inc si
dec cl
jz sss
jnz xxx1
yyy1:
mov al,[si]
mov min,al
inc si
dec cl
jnz xxx1

sss:
lea si,temp1
mov ax,min
mov ah,00
mov cl,00
abc:
div temp
mov [si],ah
inc si
inc cl
cmp al,00
jnz abc
dec si
abc1:
mov ah,02h
mov dl,[si]
add dl,30h
int 21h
dec cl
jnz abc1
mov ah,02h
mov dl,20h
int 21h
lea si,temp1
mov ax,max
mov ah,00
mov cl,00
abc2:
mov ah,00
div temp
mov [si],ah
inc si
inc cl
cmp al,00
ja abc2
dec si
abc3:
mov ah,02h
mov dl,[si]
add dl,30h
int 21h
dec si
dec cl
jnz abc3
mov ax,4c00h
int 21h
main endp
end main