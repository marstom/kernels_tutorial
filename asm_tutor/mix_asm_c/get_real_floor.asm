;https://www.codewars.com/kata/574b3b1599d8f897470018f6/train/nasm

global get_real_floor
get_real_floor:
    cmp edi, 13
    jg .big_floor
    cmp edi, 0
    jl .below_0
    je .zero
    jmp .below_13
.big_floor:
    mov eax, edi
    sub eax, 2
    jmp .end
    
.below_13:
    sub edi, 1
    mov eax, edi
    jmp .end
.below_0:
    mov eax, edi
    jmp .end
.zero:
    mov eax, edi
    jmp .end
.end:
    ret