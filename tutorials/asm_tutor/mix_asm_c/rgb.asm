;;
;Cheat sheet
;https://www.cs.tufts.edu/comp/40/docs/x64_cheatsheet.pdf
; Value is cheted!
;https://www.codewars.com/kata/513e08acc600c94f01000001/solutions/nasm


global rgb
section .text
;                 edi     esi    edx        rcx
; <----- int rgb(int r, int g, int b, char *outp) ----->
rgb:
    sub rsp, 80
    push rbx

    mov dword [rsp + 4], edi
    mov dword [rsp + 8], esi
    mov dword [rsp + 12], edx

red:

    mov eax, dword [rsp + 4]
    mov r11d, eax
    xor rdx, rdx
    xor rbx, rbx
    mov rbx, 16
    div rbx       ; rax / rbx    result in rax(al), remaining in rdx (dl)
    mov r10, 1
    call hex_to_array_on_r10_position
    div rbx
    mov r10, 0
    call hex_to_array_on_r10_position


green:

    mov eax, dword [rsp + 8]
    mov r11d, eax
    xor rdx, rdx
    xor rbx, rbx
    mov rbx, 16
    div rbx       ; rax / rbx    result in rax(al), remaining in rdx (dl)
    mov r10, 3
    call hex_to_array_on_r10_position ; r10 - position index, r11d; eax value, to check if is negative
    div rbx 
    mov r10, 2
    call hex_to_array_on_r10_position


blue:
    mov eax, dword [rsp + 12]
    mov r11d, eax
    xor rdx, rdx
    xor rbx, rbx
    mov rbx, 16
    div rbx       ; rax / rbx    result in rax(al), remaining in rdx (dl)
    mov r10, 5
    call hex_to_array_on_r10_position
    div rbx 
    mov r10, 4
    call hex_to_array_on_r10_position

    mov [rcx + 6], byte 0
    mov rax, rcx
    pop rbx
    add rsp, 80
    ret
; ---------> end of rgb <---------




; shift in r10
hex_to_array_on_r10_position:
    cmp r11d, 0
    jl .zero

    cmp r11d, 255
    jge .F

    cmp dl, 10
    je .A
    cmp dl, 11
    je .B
    cmp dl, 12
    je .C
    cmp dl, 13
    je .D
    cmp dl, 14
    je .E
    cmp dl, 15
    je .F
    add dl, 48
    mov byte [rcx+r10], dl
    sub dl, 48
    jmp .end
    .A:
    mov byte [rcx+r10],   'A'
    jmp .end
    .B:
    mov byte [rcx+r10],   'B'
    jmp .end
    .C:
    mov byte [rcx+r10],   'C'
    jmp .end
    .D:
    mov byte [rcx+r10],   'D'
    jmp .end
    .E:
    mov byte [rcx+r10],   'E'
    jmp .end
    .F:
    mov byte [rcx+r10],   'F'
    jmp .end
    .zero:
    mov byte [rcx+r10],   '0'
    jmp .end
    .end:
    ret