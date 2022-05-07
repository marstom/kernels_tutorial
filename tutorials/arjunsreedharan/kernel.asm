;;kernel.asm

;nasm directive - 32 bit
bits 32
section .text
        ;multiboot spec
        align 4
        dd 0x1BADB002            ;magic
        dd 0x00                  ;flags
        dd - (0x1BADB002 + 0x00) ;checksum. m+f+c should be zero

global start
extern kmain	        ;kmain is defined in the c file

start:
  cli                       ;block interrupts
  mov esp,  stack_space	    ;set stack pointer
  ;call      kmain
  call write_text
  hlt                       ;halt the CPU
  ret


write_text:
  mov edi, 0xb8000         ; start of video memory
.loop:
  mov eax, 5
  mov word [ds:edi], 0x202a
  cmp edi, 0xb7000
  add edi, 2
  jg .loop
  ret

section .bss
resb 8192		                ;8KB for stack
stack_space: