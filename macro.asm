;-------------------------------
addi macro a1,b1,c1
mov al,a1
add al,b1
;mov al,a1
mov c1,al
endm
;-----------------
print macro  msg
lea dx,msg
mov ah,09h
int 21h
endm
;---------------
;----------------------------------
finish macro
mov ax,4c00h
int 21h
endm
.model small
.stack 64
;---------------------------------------
.data 
a1 db 2
b1 db 2
c1 db 0
message db 'i love india$'
.code
main proc far
mov ax,@data
mov ds,ax
print message
addi a1,b1,c1

mov ah,02h
mov dl,c1
add dl,30h
int 21h
finish
main endp
end main
