.model small
.stack 64
.data
array db 'GODIS EVERY WHERE HERE AND THERE','$'
temp1 db 0ah
temp2 db ?
temp3 db ?
n db 18
count db 00
.code
main proc far
mov ax,@data
mov ds,ax
mov ah,01h
int 21h
lea si,array
mov cl,n
xxx:
cmp al,[si]
jz yyy
ja abc
jb def
abc:
sub al,20h
cmp al,[si]
jz yyy
inc si
dec cl
cmp cl,00
ja xxx
jz sed
def:
add al,20h
cmp al,[si]
jz yyy
inc si
dec cl
cmp cl,00
ja xxx
jz sed
yyy:
inc count
inc si
dec cl
cmp cl,00
ja xxx
jz sed
sed:
mov ax,count
mov ah,00
mov cl,00
lea si,temp2
asd:
mov ah,00
div temp1
mov [si],ah
inc si
inc cl
cmp al,00
ja asd
dec si
asdf:
mov ah,02h
mov dl,[si]
add dl,30h
dec si
int 21h
dec cl
jnz asdf
mov ax,4c00h
int 21h
main endp
end main



