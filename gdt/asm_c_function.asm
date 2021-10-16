
[bits 32]
section .text
global asm_c_function
global my_strlen

asm_c_function:
    push ebp
    mov ebp, esp
    mov al, 'A'
    mov ah, 0x0f
    mov [0xb8000+8], ax
    mov al, 'B'
    mov ah, 0x0f
    mov [0xb8000+10], ax
    mov al, 'B'
    mov ah, 0x0f
    mov [0xb8000+12], ax
    mov al, 'A'
    mov ah, 0x0f
    mov [0xb8000+14], ax
    mov al, byte [ebp+8] ; to go to next char add esp+16
    mov ah, 0x0f
    mov [0xb8000+16], ax
    leave
    ret

my_strlen:
    push ebp
    mov ebp, esp
    push ecx

    xor ecx, ecx ; counter
.loop:
    mov al, byte [ebp+8]
    add esp, 16
    inc ecx
    cmp al, 0
    jne .loop
    mov eax, ecx
    pop ecx
    leave
    ret