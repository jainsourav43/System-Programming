.model small
;--------------------------------------------------------------
STACK SEGMENT PARA STACK 'Stack'
DW 32 DUP(0)
STACK ENDS
;----------------------------------------------------------------
DATASEG SEGMENT PARA 'Data'
FLDD DW 215
FLDE DW 115
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



mov ax,8841h
mov di,2000
mov al,41h
mov ah,01h
mov bx,12
lea si,name1
xxx5:
mov al,[si]
mov es:word ptr[di],ax
inc di 
inc di
inc si
inc al
inc ah
dec bx
jnz xxx5
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