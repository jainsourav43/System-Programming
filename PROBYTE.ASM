.model small
.stack 64
.data
a1 db  01,02
a2 db  06,44
result db ?
.code
main proc far
mov ax,@data
mov ds,ax
mov al,a1
mul a2
mov result,al
mov result+1,ah
mov al,a1
mul a2+1
add result+1,al
adc result+2,ah
adc result+3,00
mov al,a1+1
mul a2
add result+1,al
adc result+2,ah
adc result+3,00
mov al,a1+1
mul a2+1
add result+2,al
adc result+3,ah
main endp
end main
