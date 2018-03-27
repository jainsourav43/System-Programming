.model small
.stack 128
.data 
pathname db 'E:\SP\myfile.txt',00h
ab db 'Error$'
;sourav db 'Sourav jain is smart$'
jain db 20 dup(?)
filehand dw ?
.code
main proc far
mov ax,@data
mov ds,ax
;---------------------------------------
mov ah,3dh
mov al,00
lea dx,pathname
int 21h
;--------------------------------
jc error
mov filehand,ax
jmp out1
error:
lea dx,error
mov ah,09h
int 21h

out1:
;-----------------------------
;mov dl,filehand
;mov ah,02h
;int 21h
;mov ah,40h
;mov cx,21
;mov bx,filehand
;mov dx,offset sourav
;int 21h
;---------------------------------
mov ah,3fh
mov cx,21
mov bx,filehand
mov dx,offset jain
int 21h
;--------------------------------
lea dx,jain
mov ah,09h
int 21h
;---------------------------
mov ax,4c00h
int 21h
;---------------------------------------
main endp
end main