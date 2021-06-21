%if 0

make recursion 


%endif

%include 'functions.asm'




SECTION .data
msg_sep           db      '------hello-----', 0

SECTION .text
global  _start

_start:

    mov ecx, 20
    push ecx

recursion:
    xor ecx, ecx
    mov eax, msg_sep
    call sprintLF
    pop ecx
    dec ecx
    cmp ecx, 0
    push ecx
    jz .cont
    jmp recursion
.cont:
    call quit

