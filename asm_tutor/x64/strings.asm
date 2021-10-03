global main
extern printf
extern strlen

section .text


main:
    call copy
    mov     rdi, output    ; set 1st parameter (format)
    mov     rsi, r9     ; set 2nd parameter
    xor     rax, rax    ; because printf is varargs
    call    printf
    mov     rax, 0      ; return 0
    ret

copy:
    mov rdi, msg
    call strlen
    mov r9, rax
    
    xor r10, r10
    .buff_to_buff:
    ;copy buffer to buffer
    mov r11b, [msg+r10]
    call replace_o
    mov byte [output+r10], r11b
    ;---------
    inc r10
    cmp r10, rax
    jne .buff_to_buff
    ret


replace_o:
    cmp r11b, 'o'
    jne .skip
    mov r11b, '*'
    .skip:
    ret

section .data
msg: db "Hello %d jako argument długość napisu", 0x0a, 0
napis: db "Napis", 0
; output: db "                                                           e", 0x0a, 0
section .bss
output: resb 100