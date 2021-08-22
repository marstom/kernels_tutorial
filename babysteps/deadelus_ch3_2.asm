%if 0
https://www.youtube.com/watch?v=hseFqtRpK0M
%endif

[org 0x7c00] ; memory addreses not  starting from zero but offset 0x7c00 then I must add this offset


systemloop:

;input key
mainloop:
mov ah, 0
int 0x16 ; bios interrupt 0x16 with ah=0 - system waits for keypress
; al - ascii character
; ah - BIOS scancode


mov ah, 0x0e ; teletype mode
mov al, ah
int 0x10     ; print al


jmp systemloop


jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa


