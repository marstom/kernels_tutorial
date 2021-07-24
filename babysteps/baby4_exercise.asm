;=====================================
; nasmw boot.asm -f bin -o boot.bin
; partcopy boot.bin 0 200 -f0
 
[ORG 0x7c00]      ; add to offsets
   xor ax, ax    ; make it zero
   mov ds, ax   ; DS=0
   mov ss, ax   ; stack starts at 0
   cld

   mov ax, 0xb800 ; vid memory
   mov es, ax
   
   mov ax, 't' ; save to print



   mov ax, 5
   mov bx, 5
   mov di, 0
.red:
   mov ah, 0x1d
   mov cx, ax ; save char
   ;xy position

   add di, ax
   add di, bx

   mov ax, cx
   stosw
   inc di
   cmp di, 200
   jle .red
   ; cmp bx, 0xb820
   ; jl hang
   ; mov al, 'W' ;colour
   ; mov ah, 0x20 ;character
   ; mov word [es:bx], ax
   ; add bx, 2
   ; jmp .red



hang:
   jmp hang

;------------------------------------

xpos   db 0
ypos   db 0

;==================================


; aligh
times 510-($-$$) db 0
db 0x55
db 0xAA