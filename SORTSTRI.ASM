;Program to sort string
.model small
.stack 64
.data
arr db 'maya','$','rama','$','maam','$','xray','$','love','$','hate','$'
temp db ?
.code
main proc far
mov ax,@data
mov ds,ax
lea si,arr
lea di,arr
lea bx,arr
lea bp,arr
mov cl,06
mov dl,06
abc:
mov dl,cl
lea di,arr
lea bx,arr
call incdi
mov bp,di
mov bx,si
abc2:
mov al,[si]
cmp al,[di]
jbe abc1
ja swap



abc1:inc di
dec dl
jnz abc2
swap:



jnz 


def:
























;inc di
incdi proc near
mov bl,05
xxx:
inc di
dec bl
jnz xxx
ret
incdi  endp
