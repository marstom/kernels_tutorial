

;------------------------------
; print string in BIOS mode
; usage:
; mov si, msg
; call alphabet
print:
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
