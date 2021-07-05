%macro hex_to_array_on_pos 1
    cmp dl, 10
    je %%A
    cmp dl, 11
    je %%B
    cmp dl, 12
    je %%C
    cmp dl, 13
    je %%D
    cmp dl, 14
    je %%E
    cmp dl, 15
    je %%F
    add dl, 48
    mov byte [rcx+%1], dl
    sub dl, 48
    jmp %%end
    %%A:
    mov byte [rcx+%1],   'A'
    jmp %%end
    %%B:
    mov byte [rcx+%1],   'B'
    jmp %%end
    %%C:
    mov byte [rcx+%1],   'C'
    jmp %%end
    %%D:
    mov byte [rcx+%1],   'D'
    jmp %%end
    %%E:
    mov byte [rcx+%1],   'E'
    jmp %%end
    %%F:
    mov byte [rcx+%1],   'F'
    jmp %%end
    %%end:
%endmacro

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
    hex_to_array_on_pos 1
    ;mov rbx, 16
    div rbx 
    hex_to_array_on_pos 0


    ; mov byte [rcx],   dl
    ; mov byte [rcx+1], 'e'

    mov byte [rcx+2], ' '
    mov byte [rcx+3], ' '
    
    mov byte [rcx+4], ' '
    mov byte [rcx+4], ' '

    mov rax, rcx
    ; rax <- outp
    ; pop rbp
    ret
; ---------> end of rgb <---------





