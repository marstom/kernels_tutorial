[org 0x7c00]


KERNEL_LOCATION equ 0x1000	; Was 0x7e00 but I changed it because of buffer overflow problems
				; Implementing SSP asap
				

mov [BOOT_DISK], dl		; Stores the boot disk number

xor ax, ax			; clear bits of ax
mov es, ax			; set es to 0
mov ds, ax			; set ds to 0
mov bp, 0x8000 		; stack base
mov sp, bp			; stack pointer to stack base
					; A:B = A*d16 + B
mov bx, KERNEL_LOCATION	; ES:BX is the location to read from, e.g. 0x0000:0x9000 = 0x00000 + 0x9000 = 0x9000
mov dh, 50			; read 35 sectors (blank sectors: empty_end)

call readDisk
AFTER_DISK_READ: 

clear_screen:
	mov ah, 0x0			; clear screen (set text mode)
	mov al, 0x3
	int 0x10
	; jmp $

; call getMemoryMap

call switchToPM
jmp $

%include "PrintString.asm"
%include "PrintDecimal.asm"
%include "ReadFromDisk.asm"
%include "PrintStringPM.asm"
%include "GDT.asm"
%include "EnterPM.asm"

OK:
	db 'Ok', 10, 13, 0

MSG:
	db 'Moja wiadomosc 32bitmode', 10, 13, 0

NL:
	db 10, 13, 0

ERROR_MSG:
	db 10, 13,'Error', 10, 13, 0

Extended_Memory_Size: db 0, 0

[bits 32]
;-----miejsce na funkcje 32bit
test_print:
	mov ebx, MSG
	call PrintStringPM
	jmp KERNEL_LOCATION	; jumps to entry_kernel
	ret
;-------------
jmp $
BEGIN_PM:
    mov bx, [Extended_Memory_Size] ; record memory size in bx

	;video memory
	; mov edi, 0xb8000
	; mov byte [edi], 'a'
	; inc edi
	; inc edi
	; mov byte [edi], 'b'

	call test_print
	; mov ebx, MSG
	; call PrintStringPM
	; jmp KERNEL_LOCATION	; jumps to entry_kernel

times 510-($-$$) db 0
dw 0xaa55



