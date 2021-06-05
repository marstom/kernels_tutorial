%if 0

Here is example of sys_read function

make l10_count_numbers 

https://asmtutor.com/#lesson10

%endif

%include 'functions.asm'




SECTION .data
msg_sep     db      '-----------', 0

SECTION .text
global  _start
_start:
    mov     eax, msg_sep
    call    sprintLF

    mov     ecx, 0
nexNumber:
    inc     ecx
    mov     eax, ecx
    add     eax, 48     ; dodanie 48 zadziała to ascii 0-9 resta to alfanumeryczne znaki
    push    eax         ; na stos
    mov     eax, esp    ; wskaźnik na stos
    call    sprintLF
    pop     eax         ;przywróc eax do starej wartości
    cmp     ecx, 25
    jne     nexNumber   ; jeśli nie równa się skacz

    call    quit