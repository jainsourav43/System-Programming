title real time clock
codesegment segment para 
assume cs:codesegment
org 100h
display macro xx
        mov bh,xx
	mov ah,bh
	and ah,0fh
	and bh,0f0h
	shr bh,04

	add bh,30h
	mov byte ptr es:[di],bh
	add di,02h
	
	add ah,30h
	mov byte ptr es:[di],ah
	add di,02h
endm

begin:jmp b10init
 save dd ?
a10init:
     push ax
	 push bx
	 push cx
	 push dx
	 push si
	 push di
 	 push ss
	 push es
	 push ds
	 
	mov ax,0b800h
	mov es,ax
	mov,di,844h
	mov ah,02h
	int 1ah
	display ch
	
	mov al,':'
	mov byte ptr  [di],al
	add di,02h
	
	
	display cl
	
	
	mov al,':'
	mov byte ptr es:[di],al
	add di,02h

	display dh

pop ds
pop es
pop ss
pop di
pop si
pop dx
pop cx
pop bx
pop ax

jmp cs:save

b10init:
cli
mov ah,35h
mov al,09h
int 21h
mov word ptr save,bx
mov word ptr save+2,es
mov ah,25h
mov al,09h
lea dx,a10init
int 21h
mov ah,31h
mov dx,offset b10init
sti
int 21h
codesegment ends
end begin
