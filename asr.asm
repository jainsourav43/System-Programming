title Resident programs
codeseg segment para
assume cs :codeseg
org 100h  
begin: jmp b10init
save dd ?
duration dw 100h
a10test:
push ax
push cx
in al,60
cmp al,01
jne a50exit
in al,61h
push ax
or al,00000011b
out 61h,al
mov cx,512h
a20:

 loop a20

or al,00000010b
mov cx,512h
a30 : loop a30
pop ax
and al,11111100b
out 61h,al
a50exit:
pop cx
pop ax
jmp cs:save

b10init:
cli
mov ah,35h
mov al,09h
int 21h
mov word ptr save,bx
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
