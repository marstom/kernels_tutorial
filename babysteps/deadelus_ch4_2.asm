%if 0



pusha
jmp procedure

after_procedure:
popa
...

procedure:
...
jmp after_procedure
The stack

-----------

auto handle stack
call procedure - does it automaticaly
                                                                    


Segmentation - put memory to 64kb segments


    data  code      stack
....----..--------..-------
     ds    cs        ss           -registers

ds - data segment
cs - code segment
ss - stack segment


mov al, [variableName] ds:variableName,    :-offseted by variableName


--using stack--
mov bp, 0x7000
mov sp, bp
; it is ss:bp     stack offseted by bp

%endif

[org 0x7c00] ; ds:offset 0x7c0 * 16 + offcet = 0x7c00 + offset

; print al function
pop bx
mov ah, 0x0e
mov al, 'X'
int 0x10

jmp $
times 510-($-$$) db 0 ; align
db 0x55, 0xaa


