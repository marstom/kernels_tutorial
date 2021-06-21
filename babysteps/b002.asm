;https://www.youtube.com/watch?v=APiHPkPmwwU
mov ah, 0x0e ;teletype mode


mov al, 'M'
int 0x10
mov al, 'y'
int 0x10
mov al, ' '
int 0x10
mov al, 'B'
int 0x10
mov al, 'i'
int 0x10
mov al, 'o'
int 0x10
mov al, 's'
int 0x10
mov al, ' !'
int 0x10
mov al, 0x0a
int 0x10

mov al, 0b1000001
int 0x10

jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa
