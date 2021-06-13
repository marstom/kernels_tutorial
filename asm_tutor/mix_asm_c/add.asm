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
    ; push rdx

    add rax, [rsp+16]   ; 3 2 1
    add rax, [rsp+8]    ; 6 5 4
    add rax, [rsp]      ; 9 8 7


    
    mov rsp, rbp
    pop rbp  ;resotre stack
    ret



