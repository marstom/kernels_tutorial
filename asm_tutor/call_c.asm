; ----------------------------------------------------------------------------------------
; Writes "Hola, mundo" to the console using a C library. Runs on Linux.
;
;     nasm -felf64 call_c.asm && gcc call_c.o && ./a.out
; ----------------------------------------------------------------------------------------

print:
          pop rdi
        ;   mov       rdi, message            ; First integer (or pointer) argument in rdi
          call      puts                    ; puts(message)
          ret                               ; Return from main back into C library wrapper
;--------------------------------
          global    main
          extern    puts

          section   .text
main:                                       ; This is called by the C library startup code
          push rbp
          mov rbp, rsp
          sub rsp, 16
          push message
          call print
          mov rsp, rbp
          pop rbp
          ret
message:
          db        "Hola, mundo", 0        ; Note strings must be terminated with 0 in C