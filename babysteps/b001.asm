; bios mode it runs. Basic Input Output System
jmp $                   ; empty everlasting loop
times 510-($-$$) db 0   ; align
db 0x55, 0xaa
