; putchar(rdi: char)
; safe putchar not mess registers
safe_putchar:
    push rdx         ;putchar messed it up ;( 
    push rcx         ;putchar messed up this register again!
    push rax
    call putchar
    pop rax
    pop rcx
    pop rdx
    ret