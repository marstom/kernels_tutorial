; recursive function factorial
section .text
global  recursion_factorial

; int last_drecursion_factorialigit(int_64 n)
; n: rdi
; return value: rax
recursion_factorial:
        cmp     rdi, 1  ; n<=1
        jnbe    L1      ; if not goto l1
        mov     rax, 1  ; else return 1
        ret
L1:
        push    rdi     ; save n on stack (aligns rsp too)
        dec     rdi
        call    recursion_factorial
        pop     rdi     ; restore n
        imul    rax, rdi; rax=n* factorial(n-1)
        ret