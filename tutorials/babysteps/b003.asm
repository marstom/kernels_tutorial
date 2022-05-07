%if 0
ef


%endif
mov ah, 0x0e ;teletype mode

mov sp, 512
mov bp, 512

; mov al, 65
mov al, 'a'
int 0x10

mov bx, 0

aphpabet:
inc al
inc bx
int 0x10
cmp bx, 25
jl aphpabet




jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa
