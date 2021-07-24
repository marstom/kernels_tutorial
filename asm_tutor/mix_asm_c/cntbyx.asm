; esi - x = 50value
; rdx - n = number of multiplers (the same ar array size) 5
global cntbyx

section .text

cntbyx:
    xor r8, r8
    xor r10, r10
    mov r10d, esi; value x
.loop:
    cmp r8, rdx
    je .endLoop
    mov [rdi+4*r8], r10d
    add r10d, esi
    inc r8
    jmp .loop
.endLoop:
    xor rax, rax
    mov rax, rdi            ; copying <outp> to RAX as the result
    ret





; interesting copying  mov dword [rdi], ecx

;;;;;;;;;;others
%if 0 
global cntbyx

section .text

; <-- [dword RAX] cntbyx([dword RDI] outp, ESI x, RDX n) -->
cntbyx:
  mov rax, rdi
  xor ecx, ecx
.loop:
  add ecx, esi
  mov dword [rdi], ecx
  add rdi, 4
  dec rdx
  jnz .loop
  ret
; -----> endof cntbyx <-----

global cntbyx

section .text

; <-- [dword RAX] cntbyx([dword RDI] outp, ESI x, RDX n) -->
cntbyx:
    mov rax, rdi            ; copying <outp> to RAX as the result
    xor ecx, ecx            ; resetting ECX as <x> and treating ESI as <c>oefficient
.loop:
    add ecx, esi            ; getting the current <x> += <c>
    mov [rdi], ecx          ; loading <x> to <*outp>
    add rdi, 0x4            ; pointing RDI to the next outp data item
    dec rdx                 ; decrementing <n>
    jne .loop               ; jumping to the next iteration if not zero
    ret
; -----> endof cntbyx <-----

%endif 