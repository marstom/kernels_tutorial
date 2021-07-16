global main
; extern puts
extern printf

section .text


main:
    push rbp
    mov     rdi, format
    movq    xmm0, [num1]
    movq    xmm1, [num2]
    addps   xmm0, xmm1
    call    printf
    mov     rax, 0      ; return 0
    pop rbp
    ret


section .data
; msg: db "Hikfef", 0
num1: dd 2.432
num2: dd 5.13132

format: db "to jest format %f", 10, 0