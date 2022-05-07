%if 0
https://www.youtube.com/watch?v=hseFqtRpK0M
%endif

[org 0x7c00] ; memory addreses not  starting from zero but offset 0x7c00 then I must add this offset
mov ah, 0x0e ; teletype mode

mov al, [string] ; first character(not addres) []-dereference
int 0x10



string: db "But the fool on the hill", 0

jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa


