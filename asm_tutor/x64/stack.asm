%if 0

DB - Define Byte. 8 bits
DW - Define Word. Generally 2 bytes on a typical x86 32-bit system
DD - Define double word. Generally 4 bytes on a typical x86 32-bit system

r9 nie może być w cmp z jakiegoś powodu nie działa

https://www.tutorialspoint.com/assembly_programming/assembly_conditions.htm


Quick cheatsheet
https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
%endif 
global main
extern printf
extern putchar


section .text


main:
    call fill_array
    ; call print_separator
    ; call test_drukuj_tablice
    ; call print_separator
    ; call test_divide
    ; call print_separator
    mov     rax, 0      ; return 0
    ret

%include 'utils.inc'

;-------------------tests-------------------

test_drukuj_tablice:
    lea rdi, [tablica]
    mov rsi, 6
    call drukuj_tablice
    mov     rax, 0      ; return 0
    ret

test_divide:
    mov rdi, 72
    mov rsi, 5
    call divide

    push rdx         ;printf modyfikuje rdx hmm... głupi
    mov  rdi, .wynik
    mov  rsi, rax
    xor rax, rax
    call printf
    pop rdx

    mov  rdi, .reszta
    mov  rsi, rdx
    xor rax, rax
    call printf
    ret
    .wynik: db "wynik %d", 0x0a, 0 
    .reszta: db "reszta %d", 0x0a, 0 


;-----------functions--------------

fill_array:
    push rbx
    mov rbx, 0 ; counter
    mov rax, '0'
.loop:
    lea r9, [a2d_array+rbx]
.sequence: ; fill ax from '0' to 'Z' letters
    add rax, 1
    cmp rax, 'Z'
    jne .end_sequence
.reset:
    mov rax, '0'
.end_sequence:
    mov [r9], byte rax
    inc rbx
    cmp rbx, 20*30
    jge .endloop
    jmp .loop
.endloop:
    mov rdx, 0   ;counter
    mov rcx, 0   ;columns counter
.printloop:
    lea r9, [a2d_array+rdx] ; a2d_array[rdx]
    mov  rdi, [r9]          ;value from rdi dereferenxe
    call safe_putchar
    inc rcx
    cmp rcx, 20     ; if(array element > 20) putchar("ENTER")
    jl .continue
    push rdi
    mov rdi, 0x0a
    call safe_putchar
    mov rcx, 0
    pop rdi
.continue:
    inc rdx
    cmp rdx, 20*30 ;should be
    jge .end_printloop
    jmp .printloop
.end_printloop:
    mov rdi, '*'
    call putchar

    mov rdi, '*'
    call putchar

    mov rdi, '*'
    call putchar

    mov rdi, 0x0a
    call putchar

    mov rdi, 0
    call putchar
    pop rbx
    ret

put_chars:
    mov rdi, '*'
    call putchar

    mov rdi, '*'
    call putchar

    mov rdi, '*'
    call putchar

    mov rdi, 0x0a
    call putchar

    mov rdi, 0
    call putchar

    ret

print_separator:
    mov  rdi, .separator
    ; mov  rsi, 0 ;no second argument
    xor rax, rax
    call printf
    ret
    .separator: db "-------------------------", 0x0a, 0 

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
    ; pushf   ; push flags on stack, bacause printf mess up my flags
    add     rbx, 1
    jl      .cont                       ; continue when
    mov     dword [rdi+2*4], 77777      ; access element 3rd [2] of array and write 7777
    push    rdi
    push    rsi
    mov     rdi, .format                    ; set 1st parameter (format)
    lea     r9, [tablica+4*(rbx-1)]     ; copy effective address to r9
    mov     rdx, [r9]                   ; get value from address under r9, printf 2nd vaarg array value
    mov     rsi, rbx                    ; printf 1st vaarg index
    xor     rax, rax                    ; because printf is varargs
    call    printf
    pop     rsi
    pop     rdi
    ; popf    ; to avoid cmp again I pushed flags
    cmp rbx, rsi
    jle     .loop
.cont:
    pop rbx
    pop rsi
    ret
.format: db "element[%d]->%d", 0x0a, 0



section .data
tablica: dd 11, 22, 33, 44, 55, 66, 0 ; I can modify this data, it's read/write initialized memory dd=dword 32bit integer

section .bss
a2d_array: resb 20*30