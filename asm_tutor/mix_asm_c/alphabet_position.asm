;cheatsheet https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
global alphabet_position
extern malloc, realloc

section .text

; <----- char *alphabet_position(const char *text) ----->
; first arg edi(rdi)
alphabet_position:
    push rbp
    mov rbp, rsp
    mov dword [rbp-20], edi
    xor rax, rax                ; RAX <- the result

    ;allocate
    mov rdi, 512
    call malloc
    .loop:
    mov [rax+]

    ; call rm_non_alpha_chars
    mov rax, r9
    pop rbp
    ret
; ---------> end of abcpos <---------


rm_non_alpha_chars:
    push rbx
    push rcx
    xor rcx, rcx
    mov r9, rdi

    .loop:
    lea r10, [r9+1]
    ; mov [r10], byte 's'
    ; inc rcx
    ; cmp rcx, 37
    ; jne .loop
    ; mov r9, rbx
    pop rcx
    pop rbx

    ret
    ; WIP



text:
db "to jest tekst", 0

alphabet:
db "abcdefghijklmnopqrstuvwxyz"