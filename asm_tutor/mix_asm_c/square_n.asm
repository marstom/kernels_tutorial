%if 0

sometimes??
  ; rax <- return value
  ; rdi <- first parameter
  ; rsi <- second parameter

%endif

global  square_sum
SECTION .text

square_sum:
    push    rbp
    mov     rbp, rsp

    mov     QWORD [rbp-8], rdi
    mov     DWORD [rbp-12], esi

;     mov esi, 0 ; counter
;     mov ecx, dword [esp+12]
    
; .get_array:
;     mov edx, dword [esp+8]
;     mov eax, [edx+4*esi]   ; +0 +4 +8 get number by index n from array
;     mul eax
;     add [result], eax      ; variable += eax
;     inc esi                ; inc array index
;     cmp esi, ecx
;     jne .get_array

    ; mov eax, [rsp+24] ;;2nd argument

    mov edx, dword [rsp+8] ;;1st argument
    mov eax, dword [edx]
    
    pop rbp                ; restore stack
    ret


SECTION .data
    result: db 0
