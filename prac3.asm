.model small
.stack 64
.code
org 100h
begin:
      jmp portion1
save dd ?
portion2:
         push ax
         push cx
         mov ax,40h
         mov es,ax
         call cleankba
         in al,60h ;ascii in ah
         
         ;mov di,1ah;storing head pointer location
         ;mov bx,es: word ptr [di]
         ;sub bx,02
         mov di,1eh;shifting back head pointer to previous location
         inc ah
         mov es:byte ptr[di],ah
         inc di

         cmp al,1eh
         jz bbb
         cmp al,30h
         jz ccc
         cmp al,2eh
         jz ddd
bbb:
    mov al,30h
    jmp def
ccc:
    mov al,2eh
    jmp def
ddd:
    mov al,20h
    jmp def    
def:
mov es:byte ptr[di],al    
mov di,1ah
mov es:byte ptr[di],1eh
mov ah,01h;reads in from keyboard buffer area
int 21h
jmp exit

cleankba proc near
mov di,1ah
mov [es:di],1eh
mov di,1ch
mov [es:di],1eh
ret
cleankba endp
         
exit:
     pop cx
     pop ax
     jmp cs:save     

portion1:
         cli
         mov ah,35h
         mov al,08h
         int 21h  
         mov word ptr save,bx
         mov word ptr save+2,es
         mov ah,25h
         mov al,08h
         lea dx,portion2
         int 21h
         mov ah,31h
         lea dx,portion1
         int 21h
         sti
end begin         