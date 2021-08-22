%if 0
Printing chars in loop
%endif

;https://www.youtube.com/watch?v=APiHPkPmwwU
mov ah, 0x0e ;teletype mode

mov al, 65
loop:
    inc al
    int 0x10
    cmp al, 100
    jg end
    jmp loop
end:


jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa
