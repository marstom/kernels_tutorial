; Hello World Program - asmtutor.com
; Compile with: 
; nasm -f elf arguments_push_x86.asm && ld -m elf_i386 arguments_push_x86.o -o a.out && ./a.out 
; https://asmtutor.com/#lesson1





SECTION .data
msg     db      'Hello, brave new world22!', 0Ah
 
SECTION .text
global  _start
 
_start:
    push 396;arg3 not used
    push 19 ;arg2 length
    push msg;arg1 message address
    call my_function
    call noerrorexit
 
noerrorexit:
    mov     ebx, 0
    mov     eax, 1
    int     80h





my_function:
    push ebp            ; Store the current stack frame
    mov  ebp, esp       ; Preserve ESP into EBP for argument references
    and  esp, 0xfffffff0; Align the stack to allow library calls
    ;mov  eax, [ebp+8]   ; Move the contents of EBP+8 into EAX
                        ; [EBP] should be the saved 32 bit EBP.
                        ; [EBP+4] should be the 32 bit EIP (return address).
                        ; [EBP+8] should be the pushed parameter.
                        ;... Do lots of cool stuff
     mov     ah,  [ebp+16] ;arg3 notu used
     mov     edx, [ebp+12]      ;arg2
     mov     ecx, [ebp+8]       ; this is all the same as before arg1
     mov     ebx, 1
     mov     eax, 4
     int     80h


    mov  esp, ebp       ; Restore the stack and ebp
    pop  ebp
    ret


main:
   push 0x08
   call my_function
   pop ebx              ; Clean up the stack