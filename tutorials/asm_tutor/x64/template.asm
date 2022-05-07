global main
extern printf

section .text


main:
    mov     rdi, msg    ; set 1st parameter (format)
    mov     rsi, 12  ; set 2nd parameter
    xor     rax, rax    ; because printf is varargs
    call    printf
    mov     rax, 0      ; return 0
    ret


section .data
msg: db "Hello %d", 0x0a, 0
napis: db "Napis", 0