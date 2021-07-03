
global cntbyx

section .text

cntbyx:
    mov [rdi], dword 0
    mov [rdi+4], dword 1
    mov [rdi+8], dword 2
    ; mov [rdi+24], word 3
    ; mov [rdi+32], word 4
    mov rax, rdi            ; copying <outp> to RAX as the result
    ret





