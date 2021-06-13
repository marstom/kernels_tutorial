;https://godbolt.org/z/vaE5PWx3s
global  add_arr

SECTION .text
; add(a, b) 1arg rdi 2arg rsi 3arg rdx
;return rax

add_arr:
    push rbp      ;store stack
    mov rbp, rsp  ;

    push rcx
    
    xor eax, eax
    xor rcx, rcx

    xor rax, rax
    xor rbx, rbx
    .calculate_size:
    push rax ;store
    mov rax, 4
    mul rsi ;2nd arg * rax
    mov rbx, rax
    pop rax ;restore rax

    .loop:
    add eax, [rdi+rcx]
    add rcx, 4
    cmp rcx, rbx
    jne .loop


    pop rcx
    mov rsp, rbp
    pop rbp  ;resotre stack
    ret



