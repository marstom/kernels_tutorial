extern	printf	

SECTION .data
msg_sep     db      'Hello assembly function!', 10, 0
fmt         db      '%s', 10, 0
SECTION .text
global  hello

hello:

    push rbp
    mov rdi, fmt
    mov rsi, msg_sep ; print string
    mov rax, 0

    pop rbp
    ret



