section .text
global  _start
_start:
    mov edx, 18; len 
    mov ecx, msg
    ; mov eax, 13
    ; int 80h ; get timestapm

    mov ebx, 1 
    mov eax, 4
    int 80h

section .data
msg db 'to jest wiadomosc', 0
section .bss
    buf resb 12111