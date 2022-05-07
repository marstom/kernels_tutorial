; Hello World Program - asmtutor.com
; Compile with: 
; nasm -f elf l3_len_of_string.asm && ld -m elf_i386 l3_len_of_string.o -o a.out && ./a.out 
; https://asmtutor.com/#lesson1

; generas save stack frame, allocate stack for function?
;push EBP
;mov  EBP, ESP
;sub  ESP, <some_number> ; increase stack size!





SECTION .data
msg     db      'To sprawdza długość napisu! Robi to skutecznie.', 0Ah
 
SECTION .text
global  _start
 
_start:
    mov ebx, msg     ; address of message
    mov eax, ebx     ; both poitn to same addres of memory
nextchar:
    cmp byte[eax], 0
    jz finished
    inc eax
    jmp nextchar


finished:
     sub eax, ebx        ; both addresses are byte, when sub each other, result will be len
     
     ;variant 1
     ;mov edx, eax       ; sizeof char - save in edx
     
     ;variant 2 - the same  playing around with stack
     push eax
     push 8     ; i pushed 8
     add esp, 4 ; working like pop because shrink stack
     pop edx
     
     mov ecx, msg       ; this is all the same as before arg1
     mov ebx, 1
     mov eax, 4
     int 80h

noerrorexit:
    mov     ebx, 0
    mov     eax, 1
    int     80h

