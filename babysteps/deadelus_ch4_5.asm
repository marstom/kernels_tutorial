%if 0
Homework

1. finction that prints int in base 10

div X
ax - quotient
dx - remainder

%endif

[org 0x7c00] 
; setup stack

mov bp, 0x8000
mov sp, bp

; mov ah, 0x0e
; mov al, 'X'
; int 0x10



;input
mov bx, 245
mov cx, 10

; print decimal number WIP
print_decimal:
    .loop:
    div cx
    mov ah, 0x0e
    mov al, 'A'
    int 0x10



jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa


