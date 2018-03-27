
.model small
.stack 256
.data
x1 dw ?
y1 dw ?
x3 dw ?
y3 dw ?
row dw ?
col dw ?
row1 db ?
col1 db ?
temp1 dw ?
temp2 dw ?
temp3 dw ?
two db 02
check dw 00h
x2 dw ?
y2 dw ?
temp5 dw ?
tx dw ?
temp4 dw ?
temp6 dw ?
temp7 dw ?
temp8 dw ?
temp9 dw ?
temp10 dw ?
temp11 dw ?
temp12 dw ?
temp13 dw ?
temp14 dw ?

.code
main proc far
mov ax,@data
mov ds,ax
mov ah,00h
mov al,12h
int 10h
call clearscreen

call movemaruti
 
mov ax,4c00h
int 21h



main endp


;------------------------------------------------------------------
movemaruti proc near
mov temp6,20
mov temp7,100
mov temp8,100
mov temp9,245
mov temp10,300
mov temp11,243
mov temp13,371
mov temp14,300
mov temp5,250
mov tx,100
movem:
call me 
inc check
call clearscreen
dec temp5
jnz movem

call me
ret 
movemaruti endp
;---------------------------------------------
me proc near 

mov ax,temp6
mov col,ax
mov ax,temp7
mov row,ax
call horizontal
mov ax,temp6
mov col,ax
mov ax,temp7
mov row,ax
call vertical
mov ax,temp11
mov row,ax
mov ax,temp6
mov col,ax
call horizontal
mov ax,temp7
mov row,ax
mov ax,temp13
mov col,ax
call vertical
mov ax,temp8
mov x1,ax
mov ax,temp9
mov y1,ax
call printcircle
mov ax,temp10
mov x1,ax
mov ax,temp9
mov y1,ax
call printcircle
mov y2,260
mov ax,tx
mov x2,ax
mov ax,check
div two
cmp ah,00
jnz dfg
jz dfg1
dfg:
mov ax,tx
mov x3,ax
mov y3,320
call final1
jmp out2 
dfg1:call final
out2:
mov bx,0ffffh
iiii:
dec bx
jnz iiii
inc temp6
;inc temp7
inc temp8
;inc temp9
inc temp10
;inc temp11
inc temp13
inc tx



ret 


me endp
;---------------------------------------------------------------
vertical proc near
mov bl,08fh
xxx12:
mov ah,0ch
mov al,02h
mov bh,00
mov cx,col
mov dx,row
int 10h
;inc col
inc row
dec bl
jnz xxx12
ret 
vertical endp


;-----------------------------------------------------------------

horizontal proc near
mov temp4,015fh
xxx13:
mov ah,0ch
mov al,02h
mov bh,00
mov cx,col
mov dx,row
int 10h
inc col
dec temp4
jnz xxx13
ret 
horizontal endp

;--------------------------------------------------------------------
    setcursor proc near
    mov ah,02h
    mov bh,00h
    mov dh,row1
    mov dl,col1
    int 10h
    ret
    setcursor endp
    ;--------------------------------------------------------------------

 Clearscreen proc near
    mov ah,06h
    mov al,00
    mov bh,00h
    mov cx,0000h
    mov dx,184fh
    int 10h
    ret
    Clearscreen endp
    ;---------------------------------------
    
    printcircle proc near
     mov temp2,2
    mov temp1,6
    call printincx
    
    mov temp2,4
    mov temp1,4
    call printincx
    
    mov temp2,4
    mov temp1,2
    call printincx
    
     mov temp2,4
     mov temp1,1
    call printincx
    
    dec x1
    ;---------------------------------
      mov temp2,5
       mov temp1,1
      call printincy
  
       mov temp2,6
       mov temp1,2
      call printincy
     
      mov temp2,5
      mov temp1,5
      call printincy
      
     
    
   
    
  
    ;------------------------------------
     
  
       
      mov temp2,5
      mov temp1,5
      call printincy1
      
     mov temp2,6
       mov temp1,2
       call printincy1
     
    mov temp2,5
       mov temp1,1
       call printincy1
       
      ;----------------------------------------------------------------------
     
      dec x1
      dec y1
       mov temp2,4
     mov temp1,1
     call printincx1
     
        
    mov temp2,4
    mov temp1,2
    call printincx1
    
      mov temp2,4
    mov temp1,4
    call printincx1
    
      mov temp2,2
    mov temp1,6
    call printincx1
    
  
 
    
    
    ;---------------------------------------------------------------------
    ;dec y1
   ; inc x1
     mov temp2,2
    mov temp1,6
    call printincx2
    
    mov temp2,4
    mov temp1,4
    call printincx2
    
    mov temp2,4
    mov temp1,2
    call printincx2
    
     mov temp2,4
     mov temp1,1
     call printincx2
    
    ;----------------------------------------------------------------
    dec y1
    inc x1
       mov temp2,5
       mov temp1,1
       call printincy2
  
       mov temp2,6
       mov temp1,2
       call printincy2
     
      mov temp2,5
      mov temp1,5
      call printincy2
      
     
    
   
    
  
    ;------------------------------------
     
    dec x1
    inc  y1
       
      mov temp2,5
      mov temp1,5
      call printincy3
      
     mov temp2,6
       mov temp1,2
       call printincy3
     
    mov temp2,5
       mov temp1,1
       call printincy3
    
    
    
       ;------------------------------------------------------------
      
       dec x1
       inc  y1
       dec y1
       inc x1
       inc x1
       inc y1
     mov temp2,4
     mov temp1,1
     call printincx3
     
        
    mov temp2,4
    mov temp1,2
    call printincx3
    
      mov temp2,4
    mov temp1,4
    call printincx3
    
      mov temp2,2
    mov temp1,6
    call printincx3

    ret 
    printcircle endp
    
    ;---------------------------------------------------------------------------------------------------
    printincx proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
   
    
    yyy3:
    inc y1
    mov ax,temp3
    mov temp1,ax
    xxx3:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x1
    mov dx,y1
    int 10h
    inc x1
    ;inc y1
    ;call condition
    dec temp1
    jnz xxx3
    dec temp2
    jnz yyy3
    
   
    ret
    printincx endp
    ;----------------------------------------------------------------
    ;---------------------------------------------------------------------------------------------------
    printincx6 proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
    mov ax,x1
    push ax
    mov bx,y1
    push bx
    
    yyy30:
    inc y2
    mov ax,temp3
    mov temp1,ax
    xxx30:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x2
    mov dx,y2
    int 10h
    inc x2
    ;inc y1
    ;call condition
    dec temp1
    jnz xxx30
    dec temp2
    jnz yyy30
    
    pop bx
    mov y1,bx
    pop ax
    mov x1,ax
    ret
    printincx6 endp
    ;---------------------------------------------------------------
    
     printincy proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
    yyy4:
    inc x1
    mov ax,temp3
    mov temp1,ax
    xxx4:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x1
    mov dx,y1
    int 10h
    ;inc x1
    inc y1
    ;call condition
    dec temp1
    jnz xxx4
    dec temp2
    jnz yyy4
    
    ret
    printincy endp
  ;--------------------------------------------------------------------------------------  
  
  
  
  printincy1 proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
    yyy5:
    dec x1
    mov ax,temp3
    mov temp1,ax
    xxx5:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x1
    mov dx,y1
    int 10h
    ;inc x1
    inc y1
    ;call condition
    dec temp1
    jnz xxx5
    dec temp2
    jnz yyy5
    
    ret
    printincy1 endp
    ;-----------------------------------------------------------
    printincx1 proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
    yyy6:
    inc y1
    mov ax,temp3
    mov temp1,ax
    xxx6:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x1
    mov dx,y1
    int 10h
    dec x1
    ;inc y1
    ;call condition
    dec temp1
    jnz xxx6
    dec temp2
    jnz yyy6
    
    ret
    printincx1 endp
    ;---------------------------------------------------------------------------
     printincx2 proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
    yyy7:
    dec y1
    mov ax,temp3
    mov temp1,ax
    xxx7:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x1
    mov dx,y1
    int 10h
    dec x1
    ;inc y1
    ;call condition
    dec temp1
    jnz xxx7
    dec temp2
    jnz yyy7
    
    ret
    printincx2 endp
 
    ;---------------------------------------------------------------------------
    printincx7 proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
    yyy70:
    dec y3
    mov ax,temp3
    mov temp1,ax
    xxx70:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x3
    mov dx,y3
    int 10h
    dec x3
    ;inc y1
    ;call condition
    dec temp1
    jnz xxx70
    dec temp2
    jnz yyy70
    
    ret
    printincx7 endp
       
    ;------------------------------------------------------------
     printincy2 proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
    yyy8:
    dec x1
    mov ax,temp3
    mov temp1,ax
    xxx8:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x1
    mov dx,y1
    int 10h
    ;inc x1
    dec y1
    ;call condition
    dec temp1
    jnz xxx8
    dec temp2
    jnz yyy8
    
    ret
    printincy2 endp
    
    
    ;------------------------------------------------------------
    
    printincy3 proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
    yyy9:
    inc x1
    mov ax,temp3
    mov temp1,ax
    xxx9:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x1
    mov dx,y1
    int 10h
    ;inc x1
    dec y1
    ;call condition
    dec temp1
    jnz xxx9
    dec temp2
    jnz yyy9
    
    ret
    printincy3 endp
    
    
  ;-----------------------------------------------------------------------  
  printincx3 proc near 
    
     ;mov temp2,10
    mov ax,temp1
    mov temp3,ax
    yyy10:
    dec y1
    mov ax,temp3
    mov temp1,ax
    xxx10:
    mov ah,0ch
    mov al,04h
    mov bh,00
    mov cx,x1
    mov dx,y1
    int 10h
    inc x1
    ;inc y1
    ;call condition
    dec temp1
    jnz xxx10
    dec temp2
    jnz yyy10
    
    ret
    printincx3 endp
 
    ;------------------------------------------------------------------
    
    
    
    
    final proc near
    
    
     mov temp2,2
    mov temp1,6
    call printincx6
    
    mov temp2,4
    mov temp1,4
    call printincx6
    
    mov temp2,4
    mov temp1,2
    call printincx6
    
     mov temp2,4
     mov temp1,1
     call printincx6
    
    ret 
    final endp
    ;------------------------------------------
       final1 proc near
    
    
     mov temp2,2
    mov temp1,6
    call printincx7
    
    mov temp2,4
    mov temp1,4
    call printincx7
    
    mov temp2,4
    mov temp1,2
    call printincx7
    
     mov temp2,4
     mov temp1,1
     call printincx7
    
    ret 
    final1 endp
    ;------------------------------------------
    end main