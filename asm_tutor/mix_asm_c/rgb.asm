global rgb

section .text
;                 edi     esi    edx        rcx
; <----- int rgb(int r, int g, int b, char *outp) ----->
rgb:

division:
    xor rax, rax
    xor rdx, rdx
    mov rax, rdi
    ; loop1 (2)
    mov rbx, 16
    
.two_hex_loop:
    div rbx       ; rax / rbx    wynik w rax(al), reszta rdx (dl)
    add dl, 48
    mov byte [rcx+1],   dl
    sub dl, 48
    ;loop 2 (1)
    mov rbx, 16
    div rbx 
    add dl, 48
    mov byte [rcx],   dl

    ; conv to digit
    add al, 48
    add dl, 48

    ; mov byte [rcx],   dl
    ; mov byte [rcx+1], 'e'

    mov byte [rcx+2], 'l'
    mov byte [rcx+3], 'l'
    
    mov byte [rcx+4], 'o'
    mov byte [rcx+4], 'x'

    mov rax, rcx
    ; rax <- outp
    ; pop rbp
    ret
; ---------> end of rgb <---------





