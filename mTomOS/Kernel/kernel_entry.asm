section .text
[bits 32]



global MemSize
    MemSize: db 0, 0
    mov [MemSize], bx   ; Get memory size from bx


_start:
[extern main]
call main		        ; calls kernel function main()
jmp $

;%include "../CPU/interrupt.asm"



section .rodata		    ; read only data

;%include "IncBins.asm"	; including binaries
