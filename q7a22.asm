.model small
;--------------------------------------------------------------
STACK SEGMENT PARA STACK 'Stack'
DW 32 DUP(0)
STACK ENDS
;----------------------------------------------------------------
DATASEG SEGMENT PARA 'Data'
FLDD DW 215
FLDE DW 115
temp db ?
don1 db 'Enter the letter for with video display','$'
don db 'Enter the letter for without video display','$'
FLDF DW ?
name1 db 'Sourav Jain'
DATASEG ENDS
;----------------------------------------------------------------------
extraseg segment at 0b900h
data1  db 1000h dup(?)
extraseg ends
;------------------------------------------------------------------------
codeseg segment para 'code' 
main proc far
assume cs:codeseg ,es:extraseg
mov ax,dataseg
mov ds,ax
mov ax,extraseg
mov es,ax
call setmode
call setactivepage
lea dx,don1
mov ah,09h
int 21h
mov ah,01h
int 21h
;mov ax,8841h
mov di,2000
mov ah,01h
mov bx,12
lea si,name1
;mov al,[si]
inc al
mov es:word ptr[di],ax
inc di 
inc di
inc si
inc al
inc ah
dec bx
mov ah,02h
mov dl,10
int 21h
lea dx,don
mov ah,09h
int 21h
mov ah,02h
mov dl,10
int 21h
mov ah,01h
int 21h
mov temp,al
mov ah,02h
mov dl,10
int 21h
mov al,temp
inc al
mov dl,al
mov ah,02h
int 21h
mov ax,4c00h
int 21h
main endp









;-----------------------------------------
setmode proc near
mov ah,00h
mov al,03h
int 10h

ret 
setmode endp



;---------------------------




setactivepage proc near

mov ah,05h
mov al,01h
int 10h

ret 
setactivepage endp
;-------------------------------------------






codeseg ends
end main