section .text
[bits 32]


_start:
[extern main]
call main		        ; calls kernel function main()
jmp $

