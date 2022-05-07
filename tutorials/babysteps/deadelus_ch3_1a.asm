%if 0
https://www.youtube.com/watch?v=hseFqtRpK0M
%endif

[org 0x7c00] ; memory addreses not  starting from zero but offset 0x7c00 then I must add this offset



;input string

mainloop:
mov ah, 0
int 0x16 ; bios interrupt 0x16 with ah=0 - system waits for keypress
; al - ascii character
; ah - BIOS scancode


mov ah, 0x0e ; teletype mode




mov bx, string ; store address
printString:
    mov al, [bx]
    cmp al, 0x0a
    je end
    int 0x10
    inc bx
    jmp printString
end:


jmp mainloop

string: db "But the fool on the hill", 0, 0x0a

jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa


