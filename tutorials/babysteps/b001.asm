; bios mode it runs. Basic Input Output System
jmp $                   ; empty everlasting loop
times 510-($-$$) db 0   ; align (3<label size> - 1<code size>)  =  512
db 0x55, 0xaa
