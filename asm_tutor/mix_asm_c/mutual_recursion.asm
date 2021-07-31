%if 0

https://www.codewars.com/kata/53a1eac7e0afd3ad3300008b/train/nasm

%endif

global F
global M
section .text
; input: edi = n
; output: eax
F:
    mov r9, rdi     ; n variable
    cmp r9, 0
    je .return_zero
    jmp .continue
.return_zero:
    mov eax, 5
    ret
.continue:
    ;n - m(f(n-1))
    dec rdi
    call F
    call M
    ;n - expr
    ;sub rdi, rax
    ret



M:
    mov r9, rdi     ; n variable
    cmp r9, 0
    je .return_zero
    jmp .continue
.return_zero:
    mov eax, 5
    ret
.continue:
    ;n - f(m(n-1))
    dec rdi
    call M
    call F
    ;n - expr
    ;sub r9, rax
    ret