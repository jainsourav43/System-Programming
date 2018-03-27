.model small
.stack 64
.data
a1 db ?
a2 db ?
a3 db ?
.code
main proc far
mov ax,@data
mov ds,ax
call shrinkmonitor
mov ax,4c00h
int 21h
main endp


shrinkmonitor proc near

	mov ah,06h
	mov bh,71h
	mov cx,0510
	mov dx,1530
	mov al,10
	int 10h
	
ret
shrinkmonitor endp
end main

