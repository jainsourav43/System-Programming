.model small
.stack 64
.code
org 100h
begin:
      jmp portion1
save dd ?
naming db "Shoumorup$"
count db 00
portion2:
         push ax
         push cx
         mov ax,0b800h
         mov es,ax
         ;mov ax,@data
        ; mov ds,ax
         mov di,1500
         mov cl,09
         ;lea si,naming
         mov ah,07h
         mov al,'a'
         loop1:
               ;mov al,naming
               ;mov al,[si]
               mov es:word ptr [di],ax
               ;inc si
               add di,02
               ;inc count
               inc al
               dec cl
               jnz loop1
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