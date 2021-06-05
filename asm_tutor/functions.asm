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
;
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