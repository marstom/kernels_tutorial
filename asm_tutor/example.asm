; ----------------------------------------------------------------------------------------
; https://cs.lmu.edu/~ray/notes/nasmtutorial/
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;    
;     nasm -felf64 example.asm && ld example.o && ./a.out
;     nasm -felf64 example.asm && ld example.o && ./a.out # debug
;
; debug
; p/x $al    -print register
;
; registers
; stack
; https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
; stack 32 bit
; https://grandidierite.github.io/functions-and-stack-in-NASM-32-bit/
; ----------------------------------------------------------------------------------------

          global    _start

          section   .text
_start:
        bits 64
        push byte 'a'
        push byte 't'
        push byte 0
        call print
        mov       rax, 60                 ; system call for exit
        xor       rdi, rdi                ; exit code 0
        syscall        
print:
          push rbp
          mov rbp, rsp
          sub rsp, 12
          
          ;mov rax, DWORD[rbp+8]
          ;mov DWORD(rbp-4)


          ;printing
          mov       rax, 1                  ; system call for write
          mov       rdi, 1                  ; file handle 1 is stdout
          
          mov       rsi, [rbp+12]            ; address of string to output
          mov       rdx, 2                 ; number of bytes
          syscall                           ; invoke operating system to do the write
          ;pringtin end

          mov rsp, rbp
          pop rbp
          ret

          ; https://en.wikipedia.org/wiki/Data_segment
          section   .data
message1:  db        "Hello, World", 10    
message2:  db        "Tomek", 10 
message3:  db        "Maciek", 10 

          ; global varialbles
          section .bss
buffer:   resb 64 ; 64 bytes reserve