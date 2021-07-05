
global rgb

section .text
;                 edi     esi    edx        rcx
; <----- int rgb(int r, int g, int b, char *outp) ----->
rgb:
    ; push rbp
    ; mov rbp, rsp
    mov r9, hex

    ; push rdx
    ; xor edx, edx
    ; xor eax, eax
    mov r9, 4
    xor rax, rax
    xor rdx, rdx
    mov rax, rdi
    mov rdx, 16
    div rax
    ; pop rdx



    mov byte [rcx],   'H'
    mov byte [rcx+1], 'e'
    mov byte [rcx+2], 'l'
    mov byte [rcx+3], 'l'
    mov byte [rcx+4], 'o'

    mov rax, rcx
    ; rax <- outp
    ; pop rbp
    ret
; ---------> end of rgb <---------





section .data
    hex: db '0123456789ABCDEF'
