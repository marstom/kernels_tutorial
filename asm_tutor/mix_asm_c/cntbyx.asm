
global cntbyx

section .text

cntbyx:
    xor r8, r8
    mov r9d, 2
    mov ebx, 2


.loop:
    cmp r8, rdx
    je .endLoop
    xor eax, eax
    mov eax, esi
    imul eax, r9d
    mov eax, eax
    mov [rdi+4*r8], eax
    mov eax, 0
    mov r9d, 2
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