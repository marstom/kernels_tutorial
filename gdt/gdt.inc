GDT_start:
    GDT_null:
        dd 0x0
        dd 0x0

    GDT_code:
        dw 0xffff       ; limit
        dw 0x0          ; pres,priv,type
        db 0x0          ; type flags
        db 0b1001_1010  ; other flags (second four)
        ;  1-code yes
        ;  0-conforming:can this code can be exex from lower privlege segment? No
        ;  1-readable? Yes
        ;  0 -accessed - let CPU controll it

        db 0b11001111   ; other + limit(last four bits)
        ; 1-granularity 4GB yes
        ; 1-32bit memory - yes
        db 0x0          ; last  bits of the base

    GDT_data:
        dw 0xffff
        dw 0x0
        db 0x0
        db 0b1001_0010 ; (second four) 
        ; 0-not code 
        ; 0-direction 
        ; 1-writeable
        ; 0-readable, 0 means it's writeable
        db 0b11001111
        db 0x0

GDT_end:

GDT_descriptor:
    dw GDT_end - GDT_start - 1 ; size of GDT
    dd GDT_start               ; start of GDT



CODE_SEG equ GDT_code - GDT_start
DATA_SEG equ GDT_data - GDT_start