; ----------------------------------------------------------------------------------------
; https://cs.lmu.edu/~ray/notes/nasmtutorial/
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;    
;     nasm -felf64 two.asm && ld two.o && ./a.out
;     nasm -felf64 two.asm && ld two.o && ./a.out # debug
;
; debug
; p/x $al    -print register
;
; registers
; stack
; https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
; ----------------------------------------------------------------------------------------

          global    _start

          section   .text
_start:   
          push qword message1
          push 13
          call print


          mov       rax, 60                 ; system call for exit
          xor       rdi, rdi                ; exit code 0
          syscall                           ; invoke operating system to exit

print:
          push rbp                           ; Store the current stack frame
          mov rbp, rsp                       ; Preserve ESP into EBP for argument references
          ;sub rsp, 512
          mov       rax, 1                  ; system call for write
          mov       rdi, 1                  ; file handle 1 is stdout
          ;mov       rsi, message            ; address of string to output
          ;mov       rdx, 13                 ; number of bytes
          mov rsi, qword[rbp]
          mov rdx, qword[rbp+8]
          syscall                           ; invoke operating system to do the write
          mov  rsp, rbp       ; Restore the stack and ebp
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