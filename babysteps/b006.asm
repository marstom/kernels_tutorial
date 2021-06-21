%if 0
Printing in bios mode

Functions

%endif
[ORG 0x07c00]
main:
    xor ax, ax
    mov ds, ax
    cld

    mov si, msg
    call alphabet

    jmp end


; mov al, 65

alphabet:
    mov bx, 0
    mov ah, 0x0e ;teletype mode
    mov bh, 0
.loop:
    inc bx
    lodsb
    or al, al
    mov bh, 0
    int 0x10
    cmp al, 0
    jne .loop
    ret


msg db "to jest wiadomosc", 13, 10, 0


end:

jmp $                 ; infinte jump to itself
times 510-($-$$) db 0 ; align
db 0x55, 0xaa
