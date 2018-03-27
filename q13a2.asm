.model small
.stack 64
.data
menu db 0dah,      17 dup(0c4h)        ,0bfh
     db 0b3h,      'ADD RECORDS      ',0b3h 
	 db 0b3h,      'Delete RECORDS   ',0b3h 
	 db 0b3h,      'Enter REcords    ',0b3h 
	 db 0b3h,      'Print  RECORDS   ',0b3h 
	 db 0c0h,      17 dup(0c4h)       ,0d9h
	 
	 row db 04h
	 col db 14h
	 temp db ?
	 
	 
	 .code
	 main proc far
	 mov ax,@data
	 mov ds,ax
	 mov es,ax
	 call clearscreen
	 mov ah,13h
	 lea bp,menu
	 mov cx,19
	 mov al,01h
	 mov dh,row
	 mov dl,col
	 mov bl,07h
	 mov bh,00h
	 mov temp,6
	 xxx:
	 int 10h
	 add bp,19
	 inc dh
	 dec temp 
	 jnz xxx
	 mov row,05
	 mov col,14h
	 call setcursor
	 mov ah,13h
	 lea bp,menu
	 add bp,19
	 mov cx,19
	 mov al,01h
	 mov dh,row
	 mov dl,col
	 mov bl,0fh
	 mov bh,00h
	 int 10h
	 
	 mov temp,10
	 xxx2:
	 
     mov ah,10h
     int 16h	
    cmp  ah,50h
	jz xxx1
	cmp ah,48h
	jz xxx3
	xxx1:
	call print1
	inc row
	add bp,19
	call print
	dec temp 
	jnz xxx2
	jz out1
	xxx3:
    call print1
	dec row
	sub bp,19
	call print
	dec temp 
	jnz xxx2
	jz out1
	out1 :

	 
	 mov ax,4c00h
	 int 21h
	 main endp
	 
	 
	 print1 proc near
	 
	 mov ah,13h
	; lea bp,menu
	 mov cx,19
	 mov al,01h
	 mov dh,row
	 mov dl,col
	 mov bl,07h
	 mov bh,00h
	 int 10h
	
	 ret 
	 print1 endp
	 
	 
	 
	 
	 
	 
	 print proc near
	 
	 mov ah,13h
	; lea bp,menu
	 mov cx,19
	 mov al,01h
	 mov dh,row
	 mov dl,col
	 mov bl,0fh
	 mov bh,00h
	 int 10h
	
	 ret 
	 print endp
	;ClearScreenProc
	Clearscreen proc near
	mov ah,06h
	mov al,00
	mov bh,07h
	mov cx,0000h
	mov dx,184fh
	int 10h
	ret
	Clearscreen endp



setcursor proc near
mov ah,02h
mov bh,00h
mov dh,row
mov dl,col
int 10h
ret
setcursor endp



	 end main
	 
	 