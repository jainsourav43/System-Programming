.model small
.stack 64
.data
a1 db ?
a2 db ?
a3 db 'E:\SP>','$'
.code
main proc far
mov ax,@data
mov ds,ax
call Clearscreen


call setcursor

call shrinkmonitor
call print

mov cx,0fh
xxx:
mov ah,01h
int 21h
loop xxx
mov ax,4c00h
int 21h
main endp


Clearscreen proc near
	mov ah,06h
	mov al,00
	mov bh,07h
	mov cx,0000h
	mov dx,184fh
	int 10h
	ret
	Clearscreen endp
	
shrinkmonitor proc near

	mov ah,06h
	mov al,15
	mov bh,01fh
	mov cx,0510h
	mov dx,1240h
	int 10h
	
ret
shrinkmonitor endp

setcursor proc near
mov ah,02h
mov bh,00
mov dh,04
mov dl,16
int 10h
ret 
setcursor endp

print proc near
mov ah,09h
lea dx,a3
int 21h
ret
print endp

end main
