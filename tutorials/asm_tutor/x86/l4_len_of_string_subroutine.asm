%if 0
/*
compile
nasm -f elf l4_len_of_string_subroutine.asm && ld -m elf_i386 l4_len_of_string_subroutine.o -o a.out && ./a.out 
https://asmtutor.com/#lesson4
*/
%endif

SECTION .data
msg     db      'Funkcja sprawdza długość napisu!!! Robi to skutecznie.', 0Ah
 
SECTION .text
global  _start
 
_start:
    mov eax, msg     ; address of message
    call strlen
    mov edx, eax       ; sizeof char - save in edx
    mov ecx, msg       ; this is all the same as before arg1
    
    call print
    jmp exit


;//////
;strlen(string str)
;store len in eax
strlen:
    push ebx         ;store ebx
    mov ebx, eax     ; ebx point the same address as eax

nextchar:
    cmp byte[eax], 0
    jz finished
    inc eax
    jmp nextchar

finished:
    sub eax, ebx
    pop ebx
    ret

exit:
    mov     ebx, 0
    mov     eax, 1
    int     80h

print:
    mov ebx, 1 
    mov eax, 4
    int 80h
    ret

