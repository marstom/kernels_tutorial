; this is whare I can add extern c files!
section .text
    [bits 32]
    [extern main]
    call main
    jmp $