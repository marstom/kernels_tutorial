%if 0

make l21_time 
https://asmtutor.com/#lesson21


%endif

%include 'functions.asm'



SECTION .text
global  _start

_start:


    mov eax, 13
    int 80h
    
    call iprintLF

    call quit

