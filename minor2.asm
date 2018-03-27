.model small
.stack 128
.data
name1 db  20 dup(' ')
name2 db 12 dup(' ')
paralist label byte
maxlen db 20
actlen db ?
myname db 20 dup() 
prompt db 'Enter your name ',10,'$'
endof db '$'
.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax
mov ah,09h
lea dx,prompt
int 21h

mov ah,0ah

lea dx,paralist
int 21h
mov ah,02h
mov dl,10
int 21h
lea si,myname
mov al,actlen
xxx:
inc si
dec al
jnz xxx
mov al,endof
mov [si],al
lea dx,myname
mov ah,09h
int 21h




mov al,endof
lea si,myname
add si,actlen
mov [si],al




lea dx,myname
mov ah,09h
int 21h
;cld
std
mov ch,00
mov cl,actlen
lea di,name1
add di,20
mov	bx,0000
mov bl,actlen
lea si,myname
add si,bx
inc cx
rep movsb

mov ah,02h
mov dl,10
int 21h

lea dx,name1
mov ah,09h
int 21h


mov ax,4c00h
int 21h
main endp
end main



