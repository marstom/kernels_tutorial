%if 0



make l16_atoi 

https://asmtutor.com/#lesson16

need to use
jl - jump then lower
jg - jump than greater
mul (store res in eax)
use very short register (bl for example)

EBX -  starsze8=BH, młodsze8=BL

num to convert mov esi, eax (in esi)

%endif

%include 'functions.asm'




SECTION .data
msg_sep           db      '-----------', 0
msg_atoi          db      'Atoi', 0
ditit_to_convert  db  '639'

SECTION .text
global  _start

_start:


    mov eax, ditit_to_convert
    call atoi

    ; mov eax, 23
    call iprintLF

    call quit

