global  add

SECTION .text
; add(a, b) 1arg rdi 2arg rsi 3arg rdx
;return rax

add:
    ; push rbp      ;store stack
    ; mov rbp, rsp  ;


    add rdi, rsi
    add rdi, rdx
    mov rax, rdi
    ; mov [rbp-4], edi ; use stack
    ; mov rsp, rbp
    ; pop rbp  ;resotre stack
    ret



