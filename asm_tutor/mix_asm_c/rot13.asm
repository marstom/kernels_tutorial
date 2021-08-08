
%if 0

https://www.codewars.com/kata/530e15517bc88ac656000716/train/nasm
Rot 13 cipher

%endif

global rot13
extern malloc
extern strlen

section .text

; <--- char *rot13(const char *s) ---> *s - edi(rdi)
rot13:
    xor rax, rax            ; BestPerformance

    call len_of_input       ;store input len in r10
    call alloc_output_string;allocate utput string r9





    mov r12, [rdi]
    add r12b, 2
    mov byte[r9], r12b

    mov r12, [rdi+1]
    add r12b, 2
    mov byte[r9+1], r12b

    mov r12, [rdi+2]
    add r12b, 2
    mov byte[r9+2], r12b

    mov r12, [rdi+3]
    add r12b, 2
    mov byte[r9+3], r12b

    mov byte [r9+4], 0x0a
    mov byte [r9+4], 0x00
    
    mov rax, r9            ; return string from r9
    ret
; ---------> endof rot13 <---------


len_of_input:
    push rdi
    call strlen
    mov r10, rax
    add r10, 2
    pop rdi
    ret

alloc_output_string:
    push rdi
    mov rdi, r10
    call malloc
    mov r9, rax
    pop rdi
    ret