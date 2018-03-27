.model small
.stack 64
.data
temp1 db  'Sourav'
temp2 db 'CSE'
temp3 db 'A'
count db ?
row db 0cH
col db 27h
.code
main proc far
mov ax,@data
mov ds,ax
mov es,ax
;mov ah,00h
;mov al,03h
;int 10h
call  Clearscreen
call setcursor
call print1
mov ax,0000
mov ax,4c00h
int 21h
main endp


;SetCursorFunction
Setcursor proc near
mov ah,02h
mov bh,00h
mov dh,row
mov dl,col
int 10h
ret
Setcursor endp

;ClearScreenProc
Clearscreen proc near
mov ah,06h
mov al,00
mov bh,0a8h
mov cx,0000h
mov dx,184fh
int 10h
ret
Clearscreen endp


print1 proc near
mov cx,0ffffh
xxx6:
mov ah,02h
mov dl,07h
int 21h
loop xxx6
mov ah,13h
mov al,01
mov bh,00h
mov bl,81h
lea bp,temp1
mov cx,06
mov dh,12
mov dl,39
int 10h
ret 
print1 endp


print2 proc near
mov ah,13h
mov al,01
mov bh,00h
mov bl,81h
lea bp,temp2
mov cx,03
mov dh,12
mov dl,39
int 10h   
ret
print2 endp



print3 proc near
mov ah,13h
mov al,01
mov bh,00h
mov bl,81h
lea bp,temp3
mov cx,06
mov dh,12
mov dl,39
int 10h
ret
print3 endp

end main













