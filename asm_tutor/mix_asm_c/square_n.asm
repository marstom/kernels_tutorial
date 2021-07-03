%if 0

sometimes??
  ; rax <- return value
  ; rdi <- first parameter
  ; rsi <- second parameter

%endif
; todo not workin 64 bit :( 
global  square_sum
SECTION .text

square_sum:
    ;push    rbp
    ;mov     rbp, rsp

    mov     QWORD [rbp-8], rdi
    mov     DWORD [rbp-12], esi

    mov esi, 0
    mov rax, [rbp-12]
    mov [args], rax

    
.get_array:
    mov rdx, [rbp-8]
    mov eax, [rdx+4*rsi]   ; +0 +4 +8 get number by index n from array
    mul eax
    add [result], eax      ; variable += eax
    inc esi               ; inc array index
    cmp esi,  [args]
    jne .get_array

    mov rax, [result]

    ;pop rbp                ; restore stack
    ret


SECTION .data
    result: dd 0
    counter: dd 0
    args: dd 0

    arg1: dd 0
    arg2: dd 0
