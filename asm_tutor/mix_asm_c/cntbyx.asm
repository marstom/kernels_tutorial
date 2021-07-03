
global cntbyx

section .text

cntbyx:
    xor r8, r8

.loop:
    cmp r8, rdx
    je .endLoop
    mov [rdi+4*r8], dword 188
    inc r8
    jmp .loop
.endLoop:

    ; mov [rdi], dword 1
    ; mov [rdi+4], dword 2
    ; mov [rdi+8], dword 3
    ; mov [rdi+12], dword 4
    ; mov [rdi+16], dword 5
    
    mov rax, rdi            ; copying <outp> to RAX as the result
    ret





; esi - x = 50value
; rdx - n = number of multiplers (the same ar array size) 5

temp_fetch_array_data:
    mov [rdi], dword 1
    mov [rdi+4], dword 2
    mov [rdi+8], dword 3
    mov [rdi+12], dword 4
    mov [rdi+16], dword 5