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
    je .n_is_zero
    jmp .continue
.n_is_zero:
    mov eax, 1
    ret
.continue:
    ;n - m(f(n-1))
    push rdi
    dec rdi
    call F
    pop rdi
    call M
    ;n - expr
    ;sub rdi, rax
    ret



M:
    mov r9, rdi     ; n variable
    cmp r9, 0
    je .n_is_zero
    jmp .continue
.n_is_zero:
    mov eax, 1
    ret
.continue:
    ;n - f(m(n-1))
    dec rdi
    call M
    call F
    ;n - expr
    ;sub r9, rax
    ret