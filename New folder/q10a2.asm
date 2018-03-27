.model small
.stack 256
.data
row  dw 0010
col dw  0200
.code
main proc far
mov ax,@data
mov ds,ax
mov ah,00h
mov al,12h
int 10h
mov bl,1fh
;xxx:
;mov ah,0ch
;mov al,03h
;mov bh,00
;mov cx,col
;mov dx,row
;int 10h
;inc col
;inc row
;dec bl
;jnz xxx
mov col,200
mov row,100
call horizontal
mov col,200
mov row,100
call vertical
mov col,295
mov row,100
call vertical
mov col,200
mov row,100
call incline
mov col,295
mov row,100
call incline
mov col,200
mov row,195
call incline
mov col,295
mov row,195
call incline
mov row,163
mov col,263
call vertical
mov ax,4c00h
int 21h

main endp





horizontal proc near
mov bl,5fh
xxx1:
mov ah,0ch
mov al,02h
mov bh,00
mov cx,col
mov dx,row
int 10h
inc col
;inc row
dec bl
jnz xxx1
mov col,295
mov row,100
;call vertical
ret 
horizontal endp


vertical proc near
mov bl,5fh
xxx2:
mov ah,0ch
mov al,02h
mov bh,00
mov cx,col
mov dx,row
int 10h
;inc col
inc row
dec bl
jnz xxx2
mov col,200
mov row,195
call horizontal
ret 
vertical endp




incline proc near
mov bl,3fh
xxx3:
mov ah,0ch
mov al,02h
mov bh,00
mov cx,col
mov dx,row
int 10h
inc col
inc row
dec bl
jnz xxx3
;mov col,200
;mov row,195
cmp col,358
jb xxx4
jae xxx5
xxx4:call horizontal
xxx5:
cmp row,258
jb xxx6
cmp col,263
jbe xxx6
jae xxx7
xxx6 :call vertical
xxx7:
ret 
incline endp

end main