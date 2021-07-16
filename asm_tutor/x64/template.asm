global main
extern puts

section .text


main:
    mov     rdi, msg
    call    puts
    mov     rax, 0      ; return 0
    ret


section .data
msg: db "Hello", 0