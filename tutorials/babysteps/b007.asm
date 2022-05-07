%if 0
Functions in bios mode, defining it, moving to separate file.
%endif

jmp main
%include 'bios_functions.asm'

[ORG 0x07c00]
main:
    xor ax, ax
    mov ds, ax
    cld

    mov si, msg
    call print

    jmp end


msg db "to jest wiadomosc", 13, 10, 0

end:
    jmp $                 ; infinte jump to itself
    times 510-($-$$) db 0 ; align
    db 0x55, 0xaa
