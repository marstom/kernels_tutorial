; last factorial non zero digit
;https://www.codewars.com/kata/5f79b90c5acfd3003364a337/train/nasm

;cmovl - conditional

section .text
global  last_digit

; int last_digit(long n)
; n: rdi
; return value: rax
last_digit:
        sub rsp, 24     ; allocate stack
        push rbx
        
        cmp rdi, 10     ; if (n < 10)
        jl .lower_ten
        jmp .next
.lower_ten:
        mov al, byte [digits+rdi]
        jmp .end
.next:

        xor rbx, rbx
        xor rdx, rdx
        mov rax, rdi
        mov rbx, 10
        div rbx      ; rax / rbx -- remaining in rdx

        mov rax, rdx  ; n/10 remaining
        xor rdx, rdx
        mov rbx, 2    ; / 2
        div rbx
        ;mov rax, rdx
        cmp rdx, 0
        je .formula1
        cmp rdx, 1
        je .formula2
        jmp .end
.formula1: ; return (6*lastNon0Digit(n/5)*dig[n%10]) % 10
        mov rax, 22
        jmp .end
.formula2: ; return (4*lastNon0Digit(n/5)*dig[n%10]) % 10
        mov rax, 33
        jmp .end
        ; mov qword [rsp+4], rdx  ; store n/10 remaining
        ; mov rax, [rsp+4] ;
.end:
        pop rbx
        add rsp, 24
        ret






section .data

digits: db 1, 1, 2, 6, 4, 2, 2, 4, 2, 8, 0xFF