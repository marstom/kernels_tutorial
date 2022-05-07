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
    push    rbp
    push    rdi
    push    rdx

    mov     rbp, rsp
    xor rax, rax

    mov [args], esi
    mov esi, 0

    
.get_array:
    mov rdx, rdi
    mov eax, [rdx+4*rsi]   ; +0 +4 +8 get number by index n from array
    mul eax
    add [result], eax      ; variable += eax

    cmp [args], dword 0
    jz .end

    inc esi               ; inc array index
    cmp esi,  [args]
    jne .get_array

    mov rax, [result]

    pop rdx
    pop rdi
    pop rbp
    xor esi, esi
    mov [result], dword 0
    ret

.end:
    mov rax, 0
    pop rdx
    pop rdi
    pop rbp
    xor esi, esi
    mov [result], dword 0
    ret

SECTION .data
    result: dq 0
    counter: dq 0
    args: dq 0

    array_ptr: dq 0
    arr_len: dq 0
