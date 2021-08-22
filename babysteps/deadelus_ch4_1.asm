%if 0
The stack

https://www.youtube.com/watch?v=DmDJsQqafBE
%endif

[org 0x7c00] ; memory addreses not  starting from zero but offset 0x7c00 then I must add this offset

times 510-($-$$) db 0 ; align
db 0x55, 0xaa


