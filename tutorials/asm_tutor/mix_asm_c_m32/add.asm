%if 0

sometimes??
  ; rax <- return value
  ; rdi <- first parameter
  ; rsi <- second parameter

%endif

;https://godbolt.org/z/vaE5PWx3s
global  add

SECTION .text
; add(a, b) 1arg rdi 2arg rsi 3arg rdx
;return rax

add:
    push ebp      ;store stack
    mov ebp, esp  ;
    
    ; xor eax, eax

    ; useless code
    ; push edi
    ; push esi
    ; push edx

    ; pop edi
    ; pop edi
    ; pop edi
    ; useless code example

    mov eax, 0
    add eax, [esp+16]   ;  9 8 7      ; stos maleje gdy dodaje ( + 16 to 3ci od końca)
    add eax, [esp+12]   ;  6 5 4      ; 2gi od końca
    add eax, [esp+8]      ;  3 2 1      ; pierwszy z góry stosu

    mov esp, ebp
    pop ebp  ;resotre stack
    ret



