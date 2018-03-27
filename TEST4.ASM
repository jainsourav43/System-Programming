  .MODEL SMALL
  .STACK 64
  .DATA
  TEMP1 DW 60
  TEMP2 DW 40
  temp6 dw ?
  temp7 dw ?
  TEMP3 DB ?
  TEMP4 DB ?
  TEMP5 DB ?
  TEMP10 DB ?
  .CODE
  MAIN PROC FAR
  MOV AX,@DATA
  MOV DS,AX
  MOV AX,TEMP1
  ADD AX,TEMP2
  mov TEMP3,0AH
  div TEMP3
  mov bl,AH
  mov cl,bl
  mov temp7,al
  mov ax,temp7
  mov TEMP3,0ah
  div  TEMP3
  mov bl,cl
  mov temp10,al
  lea si,temp10
  mov dl,[si]
  mov cl,ah
  mov ah,02h
  add dl,30H
  INT 21H
  MOV TEMP10,cl
  LEA SI,TEMP10
  MOV DL,[SI]
  MOV AH,02H
  ADD DL,30H
  INT 21H
  MOV TEMP10,BL
  LEA SI,TEMP10
  MOV DL,[SI]
  MOV AH,02H
  ADD DL,30H
  INT 21H
  MOV AX,4C00H
  INT 21H
  MAIN ENDP
  END MAIN
