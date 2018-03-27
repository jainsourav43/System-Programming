.model small
.stack 128
.data

row dw 50
col dw 50
temp1 dw ?
temp2 dw ?
temp3 dw ?
 h1 dw ?
 v1 dw ?
 
.code
main proc far
mov ax,@data
mov ds,ax
call setmode
call drawstline
mov h1,100
mov v1,100
mov row , 50
mov col  ,50
call drawsquare
mov row , 75
mov col  ,200
mov h1,50
mov v1,50
call drawsquare
mov row , 87
mov col  ,300
mov h1,25
mov v1,25
call drawsquare





mov ax,4c00h
int 21h
main endp



setmode proc near
 
	mov ah,00
	mov al,12h
	int 10h
ret
setmode endp

drawsquare proc near
mov ax,h1
mov temp1,ax

mov ax,v1
mov temp2,ax

xxx:
	mov ah,0ch
	mov bl,01h
	mov bh,00
	mov cx,col
	mov dx,row
	int 10h
	inc col
	dec h1
jnz xxx

xxx1:
	mov ah,0ch
	mov bl,01h
	mov bh,00
	mov cx,col
	mov dx,row
	int 10h
	inc row
	dec v1
jnz xxx1

mov ax,temp1
mov h1,ax


xxx2:
	mov ah,0ch
	mov bl,01h
	mov bh,00
	mov cx,col
	mov dx,row
	int 10h
	dec col
	dec h1
jnz xxx2

mov ax,temp2
mov v1,ax

xxx3:
	mov ah,0ch
	mov bl,01h
	mov bh,00
	mov cx,col
	mov dx,row
	int 10h
	dec row
	dec v1
jnz xxx3


ret 


drawsquare endp





drawstline proc near 
mov v1,420
mov row,170
mov col,00
xxx6:
	mov ah,0ch
	mov bl,01h
	mov bh,00
	mov cx,col
	mov dx,row
	int 10h
	inc col
	dec v1
jnz xxx6
ret 
drawstline endp 

end main
