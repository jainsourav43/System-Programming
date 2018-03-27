.model small
.stack 256
.data 
name1 db 'Welcome  Sourav','$'
row db 00h
col db 00h
temp1 db ?
.code
main proc far
mov ax,@data
mov ds,ax
mov ah,06h
mov al,00h
mov bh,71h
mov cx,0000h
mov dx,184fh
int 10h
;mov cx,2000
mov bl,10h
xxx:
mov cx,0ffffh
lea dx,name1
mov ah,09h
int 21h
yyy :
dec cx
jnz yyy
call clearscreen
inc row
call setcursor
dec bl
jnz xxx
mov bl,40h
xxx1:
mov cx,0ffffh
lea dx,name1
mov ah,09h
int 21h
yyy1 :
dec cx
jnz yyy1
call clearscreen
inc col
call setcursor
dec bl
jnz xxx1
mov bl,40h
xxx2:
mov cx,0ffffh
lea dx,name1
mov ah,09h
int 21h
yyy2 :
dec cx
jnz yyy2
call clearscreen
dec col
call setcursor
dec bl
jnz xxx2
mov bl,10h
xxx3:
mov cx,0ffffh
lea dx,name1
mov ah,09h
int 21h
yyy3 :
dec cx
jnz yyy3
call clearscreen
dec row
call setcursor
dec bl
jnz xxx3
mov ax,4c00h
int 21h
main endp



setcursor proc near
mov ah,02h
mov bh,00h
mov dh,row
mov dl,col
int 10h
ret
setcursor endp


clearscreen proc near
mov ah,06h
mov al,01h
mov bh,71h
mov ch,row
mov cl,00h
mov dh,row
mov dl,4fh
int 10h
ret 
clearscreen endp

end main