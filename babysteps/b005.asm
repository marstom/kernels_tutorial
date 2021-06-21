%if 0

DRAWING!
Int 10h interrrupt in bios
https://en.wikipedia.org/wiki/INT_10H



%endif

[ORG 0x07c00]
xor ax, ax
mov ds, ax

; video mode
mov ah, 0
mov al, 4
int 0x10

; set cursor position
mov ah, 2
mov dh, 3
mov dl, 7
mov bh, 0
int 0x10

; set backgoround color
mov ah, 0x0b
mov bl, 10
int 0x10

; set palette
mov ah, 0x0b
mov bh, 1
mov bl, 5
int 0x10

; write pixel
line_horizontal:
mov cx, 2
.loop:
mov ah, 0x0c
mov al, 1
mov bh, 0
mov dx, 4
int 0x10
inc cx
cmp cx, 90
jl .loop

line_vertical:
mov dx, 4
.loop:
mov ah, 0x0c
mov al, 1
mov bh, 0
int 0x10
inc dx
cmp dx, 90
jl .loop

mov ah, 0x0e ;teletype mode
mov bh, 0
mov bx, 0


print_message:
mov si, msg     ; pointer to message
cld
.loop:
inc bx
lodsb            ;move next letter to al
or al, al
mov bh, 0x00
mov bl, 0xff00aa
int 0x10
cmp al, 0
jne .loop


msg db "to jest wiadomosc", 13, 10, 0


jmp $                 ; infinte jump to itself
times 510-($-$$) db 0 ; align
db 0x55, 0xaa
