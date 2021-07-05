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

    mov dword [rbp-4], edi

red:
    xor rax, rax
    mov rax, qword [rbp-4]
    xor rdx, rdx
    xor rbx, rbx
    mov rbx, 16
    div rbx       ; rax / rbx    result in rax(al), remaining in rdx (dl)
    hex_to_array_on_pos 1
    div rbx 
    hex_to_array_on_pos 0

green:
    xor rax, rax
    mov rax, rsi
    xor rdx, rdx
    xor rbx, rbx
    mov rbx, 16
    div rbx       ; rax / rbx    result in rax(al), remaining in rdx (dl)
    hex_to_array_on_pos 3
    div rbx 
    hex_to_array_on_pos 2

blue:
    xor rax, rax
    mov rax, rdx ; rdx has wrong value
    xor rdx, rdx
    xor rbx, rbx
    mov rbx, 16
    div rbx       ; rax / rbx    result in rax(al), remaining in rdx (dl)
    hex_to_array_on_pos 5
    div rbx 
    hex_to_array_on_pos 4


    mov rax, rcx
    ; rax <- outp
    ; pop rbp
    ret
; ---------> end of rgb <---------





