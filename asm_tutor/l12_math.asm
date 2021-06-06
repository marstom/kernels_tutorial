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
    mov     ebx, 9  ; second arg
    mul     ebx     ; mul eax by X (ebx) - result in eax
    call    iprintLF

.divide: 
    mov     eax, 94  ; first arg
    mov     ebx, 9   ; divider
    div     ebx      ; eax / ebx   - result 10 in eax
    call    iprintLF
    mov     eax, edx ; remaining 4 in edx
    call    iprintLF
    xor edx, edx
    xor eax, eax
    ; before next div clear edx and eax


.add:
    xor     eax, eax
    mov     edi, 90 ; first arg
    mov     esi, 9  ; second arg
    add     edi, esi     ; 

    mov     eax, edi
    call    iprintLF

.add2:
    xor     eax, eax
    xor     ebx, ebx
    mov     bl, 90 ; first arg
    mov     bh, 9  ; second arg
    add     bl, bh     ; 

    movzx     eax, bl  ; fill with zeros missing bits
    call    iprintLF
    call    quit