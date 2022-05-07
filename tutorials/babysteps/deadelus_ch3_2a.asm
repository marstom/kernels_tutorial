%if 0
Print text from buffer on hit enter in reversed order
%endif

[org 0x7c00] ; memory addreses not  starting from zero but offset 0x7c00 then I must add this offset



systemloop:
; without org xxx [buffer + 0x7c00]
mov bx, buffer

mov [bx], byte 0x0a
inc bx

;input key
printandreverse:
mov ah, 0
int 0x16 ; bios interrupt 0x16 with ah=0 - system waits for keypress
; al - ascii character
; ah - BIOS scancode

; store to buffer
mov [bx], al
inc bx


cmp al, 13
jne continue
; print function when hit enter 13

mov ah, 0x0e ; teletype mode
loop:
printString:
    mov al, [bx]
    cmp al, 0x0a
    je end
    int 0x10
    dec bx
    jmp printString
end:
jmp systemloop
continue:

jmp printandreverse

buffer:
    times 10 db 0



jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa


