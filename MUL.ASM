.model small
.stack 64
.data
 temp1 dw 1234,5678
 temp2 dw  1253
 result dw  ?
 .code
  main proc far
  mov ax,@data
  mov ds,ax
  mov ax,temp1
  mul temp2
  mov result,ax
  mov result+2,dx
  mov ax,temp1+2
  mul temp2
  add result+2,ax
  adc result+4,dx
  mov ax,result
  mov bx,result+2
  mov dx,result+4
  main endp
  end main
