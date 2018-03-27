.model small
.stack 64
.data
a0 dw 2 dup(0)
a1 dw 2 dup(0)
a2 dw 2 dup(0)
v0 dw ?
v1 dw ?
v2 dw ?
v3 dw ?
arr0 db 01,02,03,04
arr1 db 05,06,07,08
arr2 db 09,10,11,12
arr3 db 13,14,15,14
x1 dw ?
x2 dw ?
wri db 'Found ','$'
wri1 db 'Not Found ','$' 
tesi dw ?
tedi dw ?
tebp  dw ?

temp1 db 00
temp2 db ?
temp3 db 04h
temp6 db 00
temp4 db 02
temp5 db 02
inp db 16
.code 
main proc far
mov ax,@data
mov ds,ax
lea si,a1
mov a0,si
lea si,a2
mov a0+2,si
lea si,v0
mov a1,si
lea si,v1
mov a1+2,si
lea si,v2
mov a2,si
lea si,v3
mov a2+2,si
lea si,arr0
mov v0,si
lea si,arr1
mov v1,si
lea si,arr2
mov v2,si
lea si,arr3
mov v3,si

lea si,a0
xxx:
mov tesi,si
mov ax,[si]
mov si,ax
mov tedi,si
mov temp5,02
yyy:
mov ax,[si]
 mov si,ax
 mov ax,[si]
 mov si,ax
 mov temp3,04
 zzz:
 mov al,[si]
 cmp al,inp
 jz out1 
 inc si
 dec temp3
 jnz zzz
 mov si,tedi
 inc si
 inc si
 dec temp5
 jnz yyy
 
 mov si,tesi
 inc si
 inc si
 dec temp6
 jnz xxx
 jmp out2
 


out1:
lea dx,wri
mov ah,09h
int 21h
jmp out3

out2:
lea dx,wri1
mov ah,09h
int 21h
out3: 
mov ax,4c00h
int 21h
 main endp
 end main
