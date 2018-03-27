.model small
.stack 64
.data
arr db 06,05,04,03,02,01,'$'
.code
main proc far
mov ax,@data
mov ds,ax
lea si,arr
mov cl,04                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
mov bl,04
xxx:
lea si,arr
mov cl,bl
yyy:
mov al,[si]
cmp al,[si+1]
ja zzz
jmp abc 
zzz:
mov al,[si]
mov bl ,[si+1]
mov [si],bl
mov [si+1],al
inc si
dec cl
jnz yyy
dec bl
jnz xxx
jmp dfg
abc:
inc si
dec cl
jnz  yyy
dec bl
jz xxx
dfg:
lea si,arr
mov cl,05
bcd:
mov dl,[si]
mov ah,02h
inc si
add dl,30h
int 21h
mov ah,02h
mov dl,20h
int 21h
dec cl
jnz bcd
mov ax,4c00h
int 21h
main endp
end main
