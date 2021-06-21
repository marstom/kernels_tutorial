%if 0
Printing in bios mode


https://en.wikipedia.org/wiki/FLAGS_register


cld - df flag to zero / std
direction flag



Goto label if previous comparison came out as less-than.  Other conditionals available are:
jle (<=), je (==), jge (>=), jg (>), jne (!=), and many others.
Also available in unsigned comparisons: jb (<), jbe (<=), ja (>), jae (>=)

%endif

mov ax, 0x07c0
mov ds, ax
cld
;std
;lodsb

mov ah, 0x0e ;teletype mode
mov bh, 0

mov sp, 512
mov bp, 512

; mov al, 65
mov si, msg

mov bx, 0

aphpabet:
inc bx
lodsb
or al, al
mov bh, 0
int 0x10
cmp al, 0
jne aphpabet


msg db "to jest wiadomosc", 13, 10, 0



jmp $                 ; infinte jump to itself
times 510-($-$$) db 0 ; align
db 0x55, 0xaa
