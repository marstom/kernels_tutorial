%if 0



make l11_ipritn_and_divide 

https://asmtutor.com/#lesson11

funkcja ITOA

%endif

%include 'functions.asm'




SECTION .data
msg_sep     db      '-----------', 0

SECTION .text
global  _start
_start:
    mov     eax, 1112223334
    call    iprintLF
    call    quit

%if 0
; debug example
how_division_works:
    mov     eax, 173
    mov     esi, 10
    idiv    esi ; div eax by esi ( eax result, remaining edx)
    int3
    mov edx, 0  ; if not clear remaining large number appers in eax
    idiv    esi
    int3
    mov edx, 0
    idiv    esi
    int3
    mov edx, 0
    ;edx 3...7...1
%endif