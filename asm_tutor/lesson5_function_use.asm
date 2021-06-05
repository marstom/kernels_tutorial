%if 0

make lesson5_function_use 
https://asmtutor.com/#lesson5

%endif

%include 'functions.asm'

SECTION .data
msg0     db      '------------------------', 0Ah, 0
msg1     db      'Wykorzystanie funkcji w nasm.', 0
msg2     db      'Hejka mnie też wydrukuj!', 0
msg3     db      '------------------------', 0

SECTION .text
global  _start
 
_start:
    mov     eax, msg0
    call    sprint

    mov     eax, msg1
    call    sprintLF    ; nie potrzebuje linefeed 0Ah w tekscie

    mov     eax, msg2
    call    sprintLF
    
    mov     eax, msg3
    call    sprintLF
    
    call    quit