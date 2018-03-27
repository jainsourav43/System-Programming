.model small
.stack 64
.data
row db 09h
col db 09h
name1 db 'Sourav Jain','$'
.code
main proc far
mov ax,@data
mov ds,ax
call setcursor
call scroll_left
call scroll_right
call scroll_top
call scroll_bottom
mov ax,4c00h
int 21h
main endp

;Calling for Scroll left

scroll_left proc near
sub col,05h
call setcursor
lea dx,name1
mov ah,09h
int 21h
ret
scroll_left endp



scroll_right proc near
add col,10h
call setcursor
lea dx,name1
mov ah,09h
int 21h
ret
scroll_right endp



scroll_top proc near
add row,01h
call setcursor
lea dx,name1
mov ah,09h
int 21h
ret
scroll_top endp



scroll_bottom proc near
sub row,05h
call setcursor
lea dx,name1
mov ah,09h
int 21h
ret
scroll_bottom endp





setcursor proc near
mov ah,02h
mov dh,row
mov dl,col
int 10h
ret
setcursor endp

end main




