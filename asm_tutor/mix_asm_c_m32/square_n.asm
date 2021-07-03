%if 0

sometimes??
  ; rax <- return value
  ; rdi <- first parameter
  ; rsi <- second parameter

%endif

global  square_sum
SECTION .text

square_sum:
    push    ebp
    mov     ebp, esp

    mov esi, 0 ; counter
    mov ecx, dword [esp+12]
    
.get_array:
    mov edx, dword [esp+8]
    mov eax, [edx+4*esi]   ; +0 +4 +8 get number by index n from array
    mul eax
    add [result], eax      ; variable += eax
    inc esi                ; inc array index
    cmp esi, ecx
    jne .get_array

    mov eax, [result]
    
    pop ebp                ; restore stack
    ret


SECTION .data
    result: db 0
