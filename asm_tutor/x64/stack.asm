%if 0

DB - Define Byte. 8 bits
DW - Define Word. Generally 2 bytes on a typical x86 32-bit system
DD - Define double word. Generally 4 bytes on a typical x86 32-bit system

r9 nie może być w cmp z jakiegoś powodu nie działa

https://www.tutorialspoint.com/assembly_programming/assembly_conditions.htm
%endif 
global main
extern printf

section .text


main:
    lea rdi, [tablica]
    mov rsi, 5
    ; call divide
    call drukuj_tablice

    ; mov     rdi, msg    ; set 1st parameter (format)
    ; mov     rsi, rax  ; set 2nd parameter
    ; xor     rax, rax    ; because printf is varargs
    ; call    printf
    mov     rax, 0      ; return 0
    ret


multiply: ;rdi * rsi, result rax
    push rdi
    xor rax, rax
    imul rdi, rsi ; store result in first rdi
    mov rax, rdi
    pop rdi
    ret

divide: ;rdi / rsi, result rax, remaining rdx
    xor rdx, rdx
    mov rax, rdi
    mov rcx, rsi
    div rcx ; store result in first rdi
    ret

drukuj_tablice: ; rdi  adres, rsi rozmiar
    push rsi
    push rbx
    xor rbx, rbx
    
.loop:
    cmp     rbx,  rsi
    pushf   ; push flags on stack, bacause printf mess up my flags
    add     rbx, 1
    jl      .cont                       ; continue when
    mov     dword [rdi+2*4], 77777      ; access element 3rd [2] of array and write 7777
    push    rdi
    push    rsi
    mov     rdi, msg                    ; set 1st parameter (format)
    lea     r9, [tablica+4*(rbx-1)]     ; copy effective address to r9
    mov     rsi, [r9]                   ; get value from address under r9
    xor     rax, rax                    ; because printf is varargs
    call    printf
    pop     rsi
    pop     rdi
    popf    ; to avoid cmp again I pushed flags
    ; cmp rbx, rsi
    jle     .loop
.cont:
    pop rbx
    pop rsi
    ret

section .data
msg: db "Hello %d", 0x0a, 0
napis: db "Napis", 0
tablica: dd 11, 28, 21, 24, 55, 66, 0