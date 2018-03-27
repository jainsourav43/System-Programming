.model tiny
.code

org 100h		;start the code from 100h
;leaving 256d=100h for PSP

;macro to display two digits of passed parameter on screen 

begin:	jmp init_port

oldip dw 00h	;variable declaration
oldcs dw 00h

res_port:
	 push ax
	 push bx
	 push cx
	 push dx
	 push si
	 push di
 	 push ss
	 push es
	 push ds
oop:
mov ax,0b800h   ; base Address of Video Ram 
mov es,ax
mov di,3984    ; Cursor Position

mov ah,02h      ;get time
int 1Ah         ; ch-hr, cl-min, dh-sec
mov bh,ch
call displayscreen 	;macro call

mov al,':'
mov byte ptr es:[di],al
add di,02h
mov bh,cl
call displayscreen 

mov al,':'
mov byte ptr es:[di],al
add di,02h
mov bh,dh
call displayscreen 


pop ds
pop es
pop ss
pop di
pop si
pop dx
pop cx
pop bx
pop ax
jmp oop
displayscreen proc near 
        ;mov bh,xx
	mov ah,bh
	and ah,0fh
	and bh,0f0h
	shr bh,4

	add bh,30h
	mov byte ptr es:[di],bh
	add di,02h
	
	add ah,30h
	mov byte ptr es:[di],ah
	add di,02h
	ret 
displayscreen endp                   ;end of macro

jmp dword ptr cs:oldip

init_port:
	  mov ah,35h            ; Get Interrupt Address
	  mov al,08		; s/w interrupt of MS-DOS for RTC
	  int 21h

mov word ptr cs:oldip,bx
mov word ptr cs:oldcs,es      


mov ah,25h        ; Set Interrupt Address
mov al,08
mov dx,offset res_port
int 21h


mov ah,31h         ; Make Program Resident 
mov dx,offset init_port
int 21h

end begin