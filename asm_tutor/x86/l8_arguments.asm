%if 0

make l8_arguments 

https://asmtutor.com/#lesson8

./a.out "napis peirwszy" 23 tomek

%endif

%include 'functions.asm'


SECTION .text
global  _start
 
_start:

    pop     ecx     ; first val of staci is argc
nextArg:
    cmp     ecx, 0
    jz      noMoreArgs
    dec     ecx
    pop     eax     ; argument from stack
    call    sprintLF
    jmp nextArg
noMoreArgs:
    call    quit