[ORG 0x7c00]
 
   xor ax, ax ; make it zero
   mov ds, ax
 
   mov si, msg
   cld
ch_loop:
   lodsb
   or al, al  ; zero=end of string, sets zero flag at jump jz
   jz hang    ; get out
   mov ah, 0x0E
   mov bh, 0
   int 0x10
   jmp ch_loop
 
hang:
   mov si, msg2
   cld
   mov ah, 0x00
   int 0x16
   cmp al, 0x0D ; enter
   je ch_loop
   jmp hang
 
msg   db 'Hellofs World', 13, 10, 0
msg2   db 'New message    ', 13, 10, 0 
   times 510-($-$$) db 0
   db 0x55
   db 0xAA