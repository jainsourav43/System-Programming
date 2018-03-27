.model small
.386
.stack 64
.data
a1 dd  01021234,12345432
a2 dd  06444682,12457910
result dd ?
.code
main proc far
mov ax,@data
mov ds,ax
mov eax,a1
mul a2
mov result,eax
mov result+4,edx
mov eax,a1
mul a2+4
add result+4,eax
adc result+8,edx
adc result+12,00
mov eax,a1+4
mul a2
add result+4,eax
adc result+8,edx
adc result+12,00
mov eax,a1+4
mul a2+4
add result+8,eax
adc result+12,edx
main endp
end main
