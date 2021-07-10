%if 0

Fun with nasm
lets play

make fun1

%endif

%include 'functions.asm'

global  _start

SECTION .bss
    buffer    RESB    255     ;255 array
SECTION .data
    fname   db      'file.txt', 0
SECTION .text
_start:

fopen:
    mov     ecx, 0
    mov     ebx, fname
    mov     eax, 5      ; SYS_OPEN kernel opcode 5
    int     80h         ; save file descriptor to eax

fread:
    mov     ebx, eax           ; file descriptor
    mov     ecx, buffer        ; buffer
    mov     edx, 255            ; bytes to read
    mov     eax, 3             ;SYS_CLOSE
    int     80h

fclose:
    mov     ecx, 0
    mov     ebx, fname
    mov     eax, 6     ; SYS_CLOSE
    int     80h


printit:
    mov eax, buffer
    call sprintLF
    
    call    quit