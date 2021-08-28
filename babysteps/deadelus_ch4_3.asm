%if 0
Homework

1. finction that prints int in base 10
2. read enter-termineted input string using the stack and pritn it out
%endif

[org 0x7c00] ; ds:offset 0x7c0 * 16 + offcet = 0x7c00 + offset
;2. Solution
; setup stack
mov bp, 0x8000
mov sp, bp


read_string:
; bios interrupt 0x16 with ah=0 - system waits for keypress
; al - ascii character
; ah - BIOS scancode
    mov ah, 0
    int 0x16
    cmp al, 0x0D ; 13 enter
    push ax ; accumulator to stack
    jne read_string


; print al function
print_stack:
    pop ax
    mov ah, 0x0e
    int 0x10
    cmp sp, 0x8000 ; when I pop from stack as many times as initial it will be
    jne print_stack



jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa


