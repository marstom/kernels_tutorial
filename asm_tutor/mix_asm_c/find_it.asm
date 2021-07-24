%if 0
https://www.geeksforgeeks.org/find-the-number-occurring-odd-number-of-times/

https://www.codewars.com/kata/54da5a58ea159efa38000836/train/nasm
int32_t find_it(int32_t* arr, size_t len)
1arg rdi 2arg rsi
return rax

%endif
global  find_it

SECTION .text


find_it:
    mov r9, 0   ; main loop i
    mov r10, 0  ; internal loop j
    mov r11, 0  ; counter

.main_loop:
    mov r11, 0  ; reset counter

;---internal loop---
    mov r10, 0  ;internal j loop
    mov rax, [rdi]
    nop
.internal_loop:
    mov r12d, dword [rdi+r9*4]
    mov r13d, dword [rdi+r10*4]
    cmp r12d, r13d ; compare arr[i] arr[j]
    nop
    jne .arr_i_arr_j_not_equals
.arr_i_arr_j_equals:
    inc r11
.arr_i_arr_j_not_equals:
    inc r10
    cmp r10, rsi
    jne .internal_loop
;---end of internal loop---


;--check if r11 % 2 != 0 if so, return counter--
    push rdx
    push rcx

    mov rdx, 0
    mov rax, r11
    mov rcx, 2
    div rcx
    
    cmp rdx, 0
    
    pop rcx
    pop rdx
    jne .return_element_with_odd_counter
    
;-------------

    inc r9
    cmp r9, rsi
    jne .main_loop
.return_element_with_odd_counter:
    mov rax, [rdi+r9*4] ; arr[i]
    ret



