%if 0
protected mode 32bit
GDT - global description table

mem models
-flat
-segmentation
-paging

Code segment descripton 
-present 1 for used segments
- Privilege = 00 ("ring")  (0-3 levels)
- type: 1 if code OR data seg


Code Segment descriptor
Flags:
- Type flags 1010
    - code?
    - conforming: can this code be exec from lower priv segment 0
    - Readable: 1 to read constants
    - Accessed : Managed by cpu 0

- Other flags: 1100
Granularity -> limit *=0x1000 4GB
32 bits: yes, 1


Data segment descriptor
Flags:
- Type flags: 0010
    - code?
    - direction
    - writeable
    - Accessed : Managed by cpu 0
- Other flags: 1100



Defining GTD assembly
db: bytes
dw: words 2bytes
dd: d words 4bytes
%endif





[org 0x7c00]

KERNEL_LOCATION equ 0x1000

mov [BOOT_DISK], dl        


;setup stack
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
mov bx, NL
mov bx, NL
call getMemoryMap

mov ah, 0x0			; clear screen (set text mode)
mov al, 0x3
int 0x10

; jmp $
;;
; call readDisk




cli ; disable interrupts
lgdt [GDT_descriptor]
;change last bit cr0 to 1
mov eax, cr0
or eax, 1
mov cr0, eax ; yay, 32 bit mode!!
; far jump (jump to other segment)
jmp CODE_SEG:start_protected_mode
jmp $

ERROR:
    mov bx, ERROR_MSG
    jmp $

%include "ReadFromDisk.asm"
%include "gdt.asm"
%include "AvailableMemory.asm"

OK:
	db 'Ok', 10, 13, 0

NL:
	db 10, 13, 0

ERROR_MSG:
	db 10, 13,'Error', 10, 13, 0
Extended_Memory_Size: db 0, 0
[bits 32]
start_protected_mode:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	
	mov ebp, 0x90000		; 32 bit stack base pointer
	mov esp, ebp
    call begin_pm
begin_pm:
    mov bx, [Extended_Memory_Size] ; record memory size in bx
    ; mov al, 'A'
    ; mov ah, 0x0f
    ; mov [0xb8000], ax
    ; mov al, 'B'
    ; mov ah, 0x0f
    ; mov [0xb8000+2], ax
    ; mov al, 'B'
    ; mov ah, 0x0f
    ; mov [0xb8000+4], ax
    ; mov al, 'A'
    ; mov ah, 0x0f
    ; mov [0xb8000+6], ax
    jmp KERNEL_LOCATION
    jmp $

                                     
 
times 510-($-$$) db 0              
dw 0xaa55
