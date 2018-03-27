   .MODEL SMALL
  .STACK 64
  .DATA
  TEMP1 Dw 1111
  TEMP2 Dw 500
  TEMP4 DB 10 DUP(?)
  TEMP3 DB ?
  TEMP5 Dw ?
  temp6 db 00
  .CODE
  MAIN PROC FAR
  MOV AX,@DATA
  MOV DS,AX
  MOV AX,TEMP1
  ADD AX,TEMP2
  mov temp5,ax
  MOV TEMP3,0AH
  lea si,temp4
  mov cl,00
  XXX:
  inc cl
  mov ax,temp5
  DIV TEMP3
  MOV [si],ah
  inc si
  mov temp5,al
  lea di,temp5
  mov [di],al
  mov bl,al
  mov al,temp6
  mov [di+1],al
  cmp bl,00H
  jne XXX
  mov bl,cl
  lea si,temp4
  YYY :
  mov dl,[si]
  add dl,30h
  inc si
  dec cl
 jnz YYY
 mov cl,bl
 dec si
 ZZZ :
 mov dl,[si]
 add dl,30h
 dec si
mov ah,02h
int 21h
 dec cl
 jnz ZZZ
 mov ax,4c00h
 int 21h
 main endp
 end main

