.model small
.stack 64
.data
a1 dw  0102,1234
a2 dw  0644,4682
result dw ?
.code
main proc far
mov ax,@data
mov ds,ax
mov ax,a1
mul a2
mov result,ax
mov result+2,dx
mov ax,a1
mul a2+2
add result+2,ax
adc result+4,dx
adc result+6,00
mov ax,a1+2
mul a2
add result+2,ax
adc result+4,dx
adc result+6,00
mov ax,a1+2
mul a2+2
add result+4,ax
adc result+6,dx
main endp
end main
