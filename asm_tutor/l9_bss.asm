%if 0

Here is example of sys_read function

make l8_arguments 

https://asmtutor.com/#lesson8

./a.out "napis peirwszy" 23 tomek

%endif

%include 'functions.asm'




SECTION .data
msg_sep     db      '-----------', 0
msg_prompt    db      'Enter name: ', 0
msg_repsonse     db      'Hello: ', 0

SECTION .bss
    variableName1:      RESB    1       ; reserve space for 1 byte
    variableName2:      RESW    1       ; reserve space for 1 word
    variableName3:      RESD    1       ; reserve space for 1 double word
    variableName4:      RESQ    1       ; reserve space for 1 double precision float (quad word)
    variableName5:      REST    1       ; reserve space for 1 extended precision float
    sinput:             RESB    255     ; input text
SECTION .text
global  _start
_start:
    mov     eax, msg_sep
    call    sprintLF


    mov     eax, msg_prompt
    call    sprint

    mov     edx, 255        ; bytest to read
    mov     ecx, sinput     ; buffer address
    
    mov     ebx, 0          ; write to STDIN file
    mov     eax, 3          ; SYS read function 3 is sys_read
    int     80h

    mov     eax, msg_repsonse
    call    sprint

    mov     eax, sinput
    call    sprint

    mov     eax, msg_sep
    call    sprintLF

    call    quit