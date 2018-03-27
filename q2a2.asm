.model small
.stack 64
.data
temp1 db ?
temp2 db 'CSE ','$'
temp3 db 'A','$'
count db ?
ascii db 00h
row db 00H
col db 02h
.code
main proc far
mov ax,@data
mov ds,ax
call clearscreen
call printfirst
call printasciis1
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
mov bx,0f09h
mov cx,0000h
mov dx,184fh
int 10h
ret
Clearscreen endp

printtwo proc near
mov ah,02h
mov dl,0b3h
int 21h
ret
printtwo endp

printasciis proc near
mov cl,10h
mov bl,10h
yyy1:
call printtwo
mov bl,10h
xxx1:
cmp ascii,08h
ja def
mov ah,02h
mov  dl,ascii
inc ascii
int 21h
;mov ah,02h
;mov  dl,20h
;int 21h

dec bl
jnz xxx1
inc row
call printtwo
call  setcursor
dec cl
jnz yyy1
jz dfg

def :
cmp ascii,0eh
jb xyz
mov ah,02h
mov  dl,ascii
inc ascii
int 21h
;mov ah,02h
;mov  dl,20h
;int 21h
dec bl
jnz xxx1
inc row
call printtwo
call setcursor
dec cl
jnz yyy1
jz dfg

xyz :

inc ascii
dec bl
jnz xxx1
dec cl
jnz yyy1
 jz dfg

dfg:
;inc row
call setcursor
call printend
ret
printasciis endp

printasciis1 proc near
mov cl,0fh
mov bl,11h
yyy2:
call printtwo
mov bl,11h
mov col,02h
xxx2:
mov ah,02h
mov  dl,ascii
inc ascii
int 21h
;mov ah,02h
;mov  dl,20h
;int 21h
inc col
call setcursor
dec bl
jnz xxx2 
call printtwo
inc row
mov col,02h
call setcursor
dec cl
jnz yyy2
mov col,02h
call setcursor
call printend
ret
printasciis1 endp


printend proc near
;call setcursor
mov cl,10h
mov ah,02h
mov dl,0c0h
int 21h
ABC:
mov ah,02h
mov dl,0c4h
int 21h
;mov ah,02h
;mov dl,20h
;int 21h
dec cl
jnz abc
mov ah,02h
mov dl,0d9H
int 21h
inc row
call setcursor
ret
printend endp

print1 proc near
lea dx,temp1
mov ah,09h
int 21h   
ret
print1 endp


print2 proc near
lea dx,temp2
mov ah,09h
int 21h   
ret
print2 endp


printfirst proc near
call setcursor
mov cl,10h
mov ah,02h
mov dl,0dah
int 21h
ABC1:
mov ah,02h
mov dl,0c4h
int 21h
;mov ah,02h
;mov dl,20h
;int 21h
dec cl
jnz abc1
mov ah,02h
mov dl,0bfH
int 21h
inc row
call setcursor
ret
printfirst endp

print3 proc near
lea dx,temp3
mov ah,09h
int 21h   
ret
print3 endp

end main







