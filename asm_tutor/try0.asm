%if 0



make l12_math 

https://asmtutor.com/#lesson11

funkcja ITOA

%endif

%include 'functions.asm'




SECTION .data

SECTION .text
global  _start

_start:

.mul:
    mov     eax, 90 ; first arg
    mov     esi, 9  ; second arg
    mul     esi     ; mul eax by X (ebx) - result in eax
    call    iprintLF

    call quit