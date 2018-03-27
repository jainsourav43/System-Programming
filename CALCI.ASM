.model small
.386
.stack 64
.data
a1 db 21,31,41,52
b1 dw 5 dup(?)
b2 dw 5 dup(?)
a2 db 12,34,45,67
divisor dw 1234
a4 	db 12
a5 	dw 13
op1	db 09
op2	db 39
a3	db ?
doll db '$'
temp1 db ?
temp2 db 0ah
temp3 db ?
t1 db ?
t2 db ?
choice db ' HII ENTER YOUR CHOICE 1 for add 2 for sub 3 for mul 4 for div','$'


.code
main proc far
mov ax,@data
mov ds,ax
call print
cmp al,31h
jz abc2
cmp al,32h
jz bcd
cmp al,33h
jz cde
cmp al,34h
jz def
abc2:
call add1
mov ax,4c00h
int 21h

bcd:
call sub1
mov ax,4c00h
int 21h

cde :
call mul1
mov ax,4c00h
int 21h

def:
call div1
mov ax,4c00h
int 21h

mov ax,4c00h
int 21h
main endp



;----------------------------------------------------printing the choice string 



;print proc
print proc near

lea dx,choice
mov ah,09h
int 21h
mov ah,01h
int 21h
ret
print endp



;-----------------------------------------addition 
;add function
add1 proc near

mov cx,04
lea si,a1
lea di,a2
lea bx,a3
clc 
jain:
mov al,[si]
adc al,[di]
mov [bx],al
inc si
inc di
inc bx
loop jain
inc bx
mov al,doll
mov [bx],al
call print3
;mov al,a1
;add al,a2
;call print1

ret
add1 endp



;----------------------------------------------------------------subtraction
;sub function
sub1 proc near

lea si,a1
lea di,a2
mov cx,04
clc
lea bx,a3
abc3:
mov al,[si]
add al,[di]
mov [bx],al
inc si
inc di
inc bx
loop abc3
inc bx
mov al,doll
mov [bx],al
call print3

ret
sub1 endp



;------------------------------------------------------------------------multiplication 
;mul function
mul1 proc near

mov al,a4
cbw
mul a5
call print4

ret
mul1 endp



;----------------------------------------------------------multiply second




mul2 proc near

mov eax,0000h
mov edx,0000h
mov eax,op1
mul op2
mov t1,edx
mov [t2+4],eax
lea dx,t1
mov ah,09h
int 21h
mov ax,4c00h
int 21h

ret
mul2 endp




;-----------------------------------------------------------division function 
;div funcion

div1 proc near

;cmp al,31h
;jz abc6
;cmp al,32h
;jz abc7
;cmp al,33h
;jz abc8
mov ax,0000h
mov dx,0000h
mov ax,0000h
mov bx,divisor
mov ax,a1
mov dx,a1+2
div bx
mov b2[0],dx
mov cl,doll
mov b2[2],cl
lea dx,b2
mov ah,09h
int 21h
mov b1[0],ax
mov al,doll
mov b1[2],al
mov ah,09h
int 21h
mov ax,4c00h
int 21h


ret
div1 endp




;-------------------------------------------------------------printing division 
;print1 funcion
print1 proc near
lea si,temp1
mov cl,00
abc1 :
mov ah,00
div temp2
mov [si],ah
inc si
inc cl
cmp al,00
ja abc1
dec si
mov ah,02h
mov dl,20h
int 21h
xxx1:
mov dl,[si]
add dl,30h
mov ah,02h
int 21h
dec si
dec cl
jnz xxx1
ret 
print1  endp



;print2 function
;---------------------------------------------------------------printing number in correct order 




print2 proc near

lea si,temp1
div temp2
mov [si],ah
inc si
mov cl,00
abc :
mov ah,00
div temp2
mov [si],ah
inc si
inc cl
cmp al,00
ja abc

dec si
inc cl
xxx:
mov dl,[si]
add dl,30h
mov ah,02h
int 21h
dec si
dec cl
jnz xxx

ret 
print2  endp



;print3 function
;--------------------------------------------------------------printing string 

print3 proc near

lea dx,a3
mov ah,09h
int 21h

ret
print3 endp





;----------------------------------------------printing the result of multiplication
print4 proc near

mov dl,ah
mov ah,02h
int 21h
mov dl,al
mov ah,02h
int 21h
mov ax,4c00h
int 21h

ret 
print4 endp
 
;--------------------------------------------- printing dx and ax 
print5 proc near

mov ah,02h
int 21h
mov ah,02h
mov dx,ax
int 21h

ret
print5 endp


end main

