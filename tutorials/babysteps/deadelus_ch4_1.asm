%if 0
The stack

https://www.youtube.com/watch?v=DmDJsQqafBE
                                                                    
      push bx                                                              
      <sp - stack pointer>
      top                                                              
       |                                                            
       v                                                            
       xA                                                           
        ^                                                           
        \                                                           
        base                                                            
      <bp - base>                                                    
                                                                    
                                                                    
ax  ah al - Accumulator
bx  bh bl - Base
cx  ch cl - Counter
dx  dh dl - Data


pusha - pushes ax, cx, dx, bx, sp, bp, si, di ( in this order)
popa  - pops in reverse order
%endif

[org 0x7c00] ; memory addreses not  starting from zero but offset 0x7c00 then I must add this offset

mov bp, 0x8000
mov sp, bp
mov bh, 'A'
push bx

; print al function
mov bh, 'B'

pop bx
mov ah, 0x0e
mov al, bh
int 0x10

jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa


