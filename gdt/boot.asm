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

BOOT_DISK: db 0
mov [BOOT_DISK], dl        

; missing part
xor ax, ax                          
mov es, ax
mov ds, ax
mov bp, 0x8000
mov sp, bp

mov bx, KERNEL_LOCATION	; ES:BX is the location to read from, e.g. 0x0000:0x9000 = 0x00000 + 0x9000 = 0x9000
mov dh, 50			; read 35 sectors (blank sectors: empty_end)


;;boot disk

mov ah, 0x02	 ; BIOS read from disk routine
mov al, dh  	 ; dh is the number of segments we want to read
mov ch, 0x00	 ; track / cylinder number 0
mov dh, 0x00	 ; head 0
mov cl, 0x02	 ; start reading from sector 2 (after boot sector)

mov dl, [BOOT_DISK]
int 0x13	 ; read from disk interrupt

;;;
mov bx, NL
mov bx, NL

mov ah, 0x0			; clear screen (set text mode)
mov al, 0x3
int 0x10






cli ; disable interrupts
lgdt [GDT_descriptor]
;change last bit cr0 to 1
mov eax, cr0
or eax, 1
mov cr0, eax ; yay, 32 bit mode!!
; far jump (jump to other segment)
jmp CODE_SEG:init_pm
jmp $

%include "gdt.asm"

NL:
	db 10, 13, 0
[bits 32]
init_pm:

	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	
	mov ebp, 0x90000		; 32 bit stack base pointer
	mov esp, ebp
    call start_pm
    jmp $

start_pm:
    ; mov al, 'A'
    ; mov ah, 0x0f
    ; mov [0xb8000], ax
    ; mov al, 'B'
    ; mov ah, 0x0f
    ; mov [0xb8000+2], ax
    ; mov al, 'C'
    ; mov ah, 0x0f
    ; mov [0xb8000+4], ax
    ; mov al, 'A'
    ; mov ah, 0x0f
    ; mov [0xb8000+6], ax                      

    jmp KERNEL_LOCATION    
    jmp $         
 
times 510-($-$$) db 0              
dw 0xaa55
