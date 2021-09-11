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
      
BOOT_DISK: db 0
mov [BOOT_DISK], dl        

; missing part
xor ax, ax                          
mov es, ax
mov ds, ax
mov bp, 0x8000
mov sp, bp


CODE_SEG equ GDT_code - GDT_start
DATA_SEG equ GDT_data - GDT_start


cli ; disable interrupts
lgdt [GDT_descriptor]
;change last bit cr0 to 1
mov eax, cr0
or eax, 1
mov cr0, eax ; yay, 32 bit mode!!
; far jump (jump to other segment)
jmp CODE_SEG:start_protected_mode
jmp $

GDT_start:
    GDT_null:
        dd 0x0
        dd 0x0

    GDT_code:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10011010
        db 0b11001111
        db 0x0

    GDT_data:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b10010010
        db 0b11001111
        db 0x0

GDT_end:

GDT_descriptor:
    dw GDT_end - GDT_start - 1
    dd GDT_start

[bits 32]
start_protected_mode:
    mov al, 'A'
    mov ah, 0x0f
    mov [0xb8000], ax
    mov al, 'B'
    mov ah, 0x0f
    mov [0xb8000+2], ax
    mov al, 'B'
    mov ah, 0x0f
    mov [0xb8000+4], ax
    mov al, 'A'
    mov ah, 0x0f
    mov [0xb8000+6], ax
    jmp $

                                     
 
times 510-($-$$) db 0              
dw 0xaa55