title Resident programs
codeseg segment para
assume cs :codeseg
org 100h  
begin: jmp b10init
save dd ?
;duration dw 100h

mov word ptr save+2,es
mov ah,25h
mov al,09h
mov dx,offset a10test
int 21h
mov ah,31h
mov dx,offset b10init
sti
int 21h
codeseg ends
end begin
