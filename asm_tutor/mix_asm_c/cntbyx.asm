; esi - x = 50value
; rdx - n = number of multiplers (the same ar array size) 5

global cntbyx

section .text

cntbyx:
    xor r8, r8
    mov r9d, 2   ; multipler 2
    mov r10d, esi; value x
    mov ebx, 2


.loop:
    cmp r8, rdx
    je .endLoop
    mov eax, esi
    imul r10d, r9d
    mov [rdi+4*r8], r10d

    inc r8
    jmp .loop
.endLoop:
    mov rax, rdi            ; copying <outp> to RAX as the result
    ret







