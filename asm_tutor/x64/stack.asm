%if 0

DB - Define Byte. 8 bits
DW - Define Word. Generally 2 bytes on a typical x86 32-bit system
DD - Define double word. Generally 4 bytes on a typical x86 32-bit system

%endif 
global main
extern printf

section .text


main:
    mov rdi, tablica
    mov rsi, 6
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
    xor r9, r9
    
.loop:
    dec rsi
    cmp rsi, -1
    je .cont
    push rdi
    push rsi
    mov     rdi, msg    ; set 1st parameter (format)
    mov     rsi, [tablica+4*rsi]  ; set 2nd parameter
    mov     dword [tablica+4*1], 999 ; modify second .data element
    ;lea     r9, [tablica+4*rsi]
    xor     rax, rax    ; because printf is varargs
    call    printf
    pop rsi
    pop rdi
    jnz .loop
.cont:
    pop rsi
    ret

section .data
msg: db "Hello %d", 0x0a, 0
napis: db "Napis", 0
tablica: dd 11, 28, 21, 24, 55, 66, 0