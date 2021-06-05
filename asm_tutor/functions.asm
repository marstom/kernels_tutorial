;---------------------------------------------
;iprint(integer number)
;
iprint:
    push    eax
    push    ecx
    push    edx
    push    esi
    mov     ecx, 0
divideLoop:
    inc     ecx     ; count every byte to print, num of chars
    mov     edx, 0  ; clean remaining
    mov     esi, 10 ; to divide by 10
    idiv    esi     ; div eax by esi
    add     edx, 48 ; convert edx to ascii repr (edx is remaining)
    push    edx     ; save remaining
    cmp     eax, 0  ; can be divided more? (eax is result)
    jnz     divideLoop
printLoop:
    dec     ecx     ; count down stack bytes
    mov     eax, esp; bo chcę adres
    call    sprint
    pop     eax     ;zdejmuje liczbe ze stosu
    cmp     ecx, 0
    jnz     printLoop

    pop     esi
    pop     edx
    pop     ecx
    pop     eax
    ret

;---------------------------------------------
;iprintLF(integer number)
;
iprintLF:
    call iprint
    push    eax        ; preserve eax
    mov     eax, 0Ah   ; linefeed store
    push    eax        ; push linefeed
    mov     eax, esp   ; current stack pointer save in eax
    call    sprint
    pop     eax        ; remove feed
    pop     eax        ; restore original value
    ret


;---------------------------------------------
;slen(string str)
;store len in eax
slen:
    push ebx         ;store ebx
    mov ebx, eax     ; ebx point the same address as eax

nextchar:
    cmp byte[eax], 0
    jz finished
    inc eax
    jmp nextchar

finished:
    sub eax, ebx
    pop ebx
    ret

;---------------
;void sprint(string message)
; pointer to string must be in eax
sprint:
    push edx
    push ecx
    push ebx
    push eax
    call slen

    mov edx, eax ; len to edx
    pop eax

    mov ecx, eax ; print string from ecx
    mov ebx, 1 
    mov eax, 4
    int 80h

    pop ebx
    pop ecx
    pop edx
    ret

;---------------
;void sprintLF(string message)
; print with auto add 0Ah(linefeed)
sprintLF:
    call    sprint
    push    eax        ; preserve eax
    mov     eax, 0Ah   ; linefeed store
    push    eax        ; push linefeed
    mov     eax, esp   ; current stack pointer save in eax
    call    sprint
    pop     eax        ; remove feed
    pop     eax        ; restore original value
    ret

;-------------
;void quit()
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret