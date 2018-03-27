TITLE access keyboard buffer area
;-------------------------------------------
STACK SEGMENT PARA STACK 'Stack'
DW 32 DUP(0)
STACK ENDS
;--------------------------------------
keyarea segment at 40h
org 17h
keydata db ?
keyarea ends
codeseg segment para 'code'
main proc far
ASSUME SS:STACK,CS:CODESEG,es:keyarea
mov ax,keyarea
mov es,ax
mov al,es:keydata
and al,80h
mov al,00
mov es:keydata,al
mov ax,4c00h
int 21h
main endp
codeseg ends
end main

