
.model small
.stack 64
.data
arr db 06,05,04,03,02,01,08,'$'
.code
main proc far
mov ax,@data
mov ds,ax
mov cl,06
mov dl,06
xxx:
lea si,arr
mov cl,dl
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
inc si  b
dec cl
jnz yyy
dec dl
jnz xxx
jmp dfg
abc:
inc si
dec cl
jnz  yyy
dec dl
jnz xxx
dfg:
lea si,arr
mov cl,07
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
