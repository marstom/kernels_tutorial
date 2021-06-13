;https://godbolt.org/z/vaE5PWx3s
global  add

SECTION .text
; add(a, b) 1arg rdi 2arg rsi 3arg rdx
;return rax

add:
    push rbp      ;store stack
    mov rbp, rsp  ;
    
    xor rax, rax

    push rdi
    push rsi
    push rdx

    add rax, [rsp+16]   ; 3 2 1      ; stos maleje gdy dodaje ( + 16 to 3ci od końca)
    add rax, [rsp+8]    ; 6 5 4      ; 2gi od końca
    add rax, [rsp]      ; 9 8 7      ; pierwszy z góry stosu

    mov rsp, rbp
    pop rbp  ;resotre stack
    ret



