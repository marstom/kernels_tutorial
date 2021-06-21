NASM:

Rejestry

FLAGS - https://pl.wikipedia.org/wiki/FLAGS

16-bit-mode:
AX, BX, CX, DX
    These general purpose registers can also be addressed as 8-bit registers. So AX = AH (high 8-bit) and AL (low 8-bit).
SI, DI
    These registers are usually used as offsets into data space. By default, SI is offset from the DS data segment, DI is offset from the ES extra segment, but either or both of these can be overridden.
SP
    This is the stack pointer, offset usually from the stack segment SS. Data is pushed onto the stack for temporary storage, and popped off the stack when it is needed again.
BP
    The stack frame, usually treated as an offset from the stack segment SS. Parameters for subroutines are commonly pushed onto the stack when the subroutine is called, and BP is set to the value of SP when a subroutine starts. BP can then be used to find the parameters on the stack, no matter how much the stack is used in the meanwhile.
CS, DS, SS, ES
    The segment pointers. These are the offset in memory of the current code segment, data segment, stack segment and extra segment respectively.
IP
    The instruction pointer. Offset from the code segment CS, this points at the instruction currently being executed.
FLAGS (F)
    A number of single-bit flags that indicate (or sometimes set) the current status of the processor.


SS - gdzie zaczyna się stos

SI - Source Index register (SI). Used as a pointer to a source in stream operations.

Przerwania:
0x10h stdout -   https://en.wikipedia.org/wiki/INT_10H
0x16h read key - https://en.wikipedia.org/wiki/INT_16H

(Rejestry)
https://en.wikibooks.org/wiki/X86_Assembly/X86_Architecture




(Instrukcje)
https://pl.wikibooks.org/wiki/Asembler_x86/Instrukcje/Transferowe
https://sites.google.com/site/microprocessorsbits/home

STOSW - Opis: Ładuje słowo z %ax do miejsca o adresie %ds:%edi, i następnie zmniejsza lub zwiększa ( w zależności od znacznika DF : jeśli DF=1, to zmniejsza) %edi o 2. 
lodsb - 	Load byte at address DS:(E)SI into AL
		Loads a byte (B), word (W), or doubleword (D) from the source operand into the
		AL, AX, or EAX register, respectively.

STOSB - Stores a byte, word, or doubleword from the AL, AX, or EAX register, respectively, into the destination operand. The destination operand is a memory location, the address of which is read from either the ES:EDI or the ES:DI registers (depending on the address-size attribute of the instruction, 32 or 16, respectively). The ES segment cannot be overridden with a segment override prefix.

SBB - https://faydoc.tripod.com/cpu/sbb.htm

mov dest, variable/source

CLD - Clears the DF flag in the EFLAGS register. When the DF flag is set to 0, string operations increment the index registers (ESI and/or EDI). https://en.wikipedia.org/wiki/Direction_flag

IN - Input from Port https://c9x.me/x86/html/file_module_x86_id_139.html


********Tryby*******


-Real mode-
1MB ram max adres. BIOS aktywny


Rejestry dostępne:
There are six 16-bit segment registers: CS, DS, ES, FS, GS, and SS.



-Protected Mode-
max 4GB ram alokowalne