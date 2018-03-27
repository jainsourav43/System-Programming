.model small
.stack 128
.data
temp1 db ?
arr1  db 'I love INDIA','$'
arr2 db 'I love PRaaa','$'
arr3 db 'I lOVE NITWA','$'
arr4 db 'I LOve CSEAA','$'
temp2 db ?
temp3 dw ?
t dw ?
t2 dw ?
temp4 dw ?
temp5 db '$'
pageno db ?
row db ?
col db ?
tarr1 db 12 dup(?)
tarr2 db 12 dup(?)
tarr3 db 80 dup(?)
count db 50h
.code
main proc far
mov ax,@data
mov ds,ax
mov ah,00h
mov al,03h
int 10h
call clearscreen
mov pageno,00h
mov row,00
mov col,00
call setcursor
call print1
mov row,24
mov col,00
call setcursor
call print2
mov row,00
mov col,00
mov pageno,01h
call setcursor
lea si,arr3
call print3
mov row,24
mov col,00
mov pageno,01h
call setcursor
lea si,arr4
call print4
call delayf
call delayf
mov cx,0ffffh
mov bx,0ffffh
xxx:
call ans1
call delayf
dec count 
jnz xxx

;call clearscreen
;mov pageno,01
;call setactivepage
;
;mov pageno,01
;call setactivepage

mov ax,4c00h
int 21h
main endp
	
	
	









;------------------------------------------------------------------
ans1 proc near 

    mov pageno,00h
	;call setactivepage
	mov row,00
	mov col,00
	call setcursor
	lea si,tarr1
	mov bl,12
	yyy:
		mov ah,08h
		mov bh,pageno
		int 10h
		mov [si],al
		inc si
		inc col
		call setcursor
		dec bl
	jnz yyy
	lea si,tarr2
	mov bl,12
	
	mov pageno,01
	mov row,00
	mov col,00
	call setcursor
	yyy1:
		mov ah,08h
		mov bh,pageno
		int 10h
		mov [si],al
		inc si
		inc col
		call setcursor
		dec bl
	jnz yyy1
	call scrollone 
	;printing on the last line of 1st page 
	mov pageno,00
	mov row,24
	mov col,00
	call setcursor
	lea si,tarr2
	call print3
	;int 21h
	;printing on the last line of 2nd page 
	call scrollsecond 
	mov pageno,01
	mov row,24
	mov col,00
	call setcursor
	lea si,tarr1
	call print4
	ret 
	ans1 endp 
	;---------------------------------------------------
	
setactivepage proc near
;push ax
mov ah,05h
mov al,pageno
int 10h
;pop ax
ret 
setactivepage endp
;--------------------------------------------------------------------------
setcursor proc near
	push ax
	push bx
	push dx
	mov ah,02h
	mov bh,pageno
	mov dh,row
	mov dl,col
	int 10h
	pop dx
	pop bx
	pop ax
	ret 	
setcursor endp
	;------------------------------------------------------
clearscreen proc near
mov ah,06h
mov al,00
mov bh,61h
mov cx,0000
mov dx,184fh
int 10h
ret 
clearscreen endp
;-------------------------------------------------
print1 proc near
	lea dx,arr1
	mov ah,09h
	int 21h
ret
print1 endp
;----------------------------------------------------
scrollone proc near
mov ah,06h
mov al,01
mov bh,61h
mov cx,0000
mov dx,184fh
int 10h
ret 
scrollone endp
;-------------------------------------------------
print2 proc near
	lea dx,arr2
	mov ah,09h
	int 21h
ret
print2 endp
;-------------------------------------------------
print3 proc near
   ;lea si,arr3
  push ax
	mov dx,12
	asd:
	mov ah,09h
	mov al,[si]
	inc si
	mov bh,pageno
	mov bl,16h
	mov cx,1
	int 10h
	inc col 
	call setcursor
	dec dx
	jnz asd
	pop ax
ret
print3 endp
;-------------------------------------------------
print4 proc near
	;lea si,arr4
	;mov ah,09h
	;int 21h
	mov dl,12
	asd1:
	mov ah,09h
	mov al,[si]
	inc si
	mov bh,pageno
	mov bl,16h
	mov cx,1
	int 10h
	inc col 
	call setcursor
	dec dl
	jnz asd1
ret
print4 endp
  ;--------------------------------- 
  
  
 scrollsecond proc near
 
 mov temp2,24
 mov pageno,01
 mov row,01
 mov col,00
 call setcursor
 abc2 :
 mov col,00
 call setcursor
 lea si,tarr3
 mov temp1,12
 abc1:
	mov ah,08h
	mov bh,01
	int 10h
	mov [si],al
	inc si
	inc col
	call setcursor
	dec temp1
jnz abc1
dec row 
mov col,00
call setcursor
lea si,tarr3
mov pageno,01
call print3
inc row
inc row 
dec temp2
jnz abc2
ret 
scrollsecond endp

delayf proc near
mov t,0ffh
mov t2,0ffh
ase:
mov t2,0fffh
ase1:
dec t2
jnz ase1
dec t
jnz ase

ret
delayf endp

end main
 