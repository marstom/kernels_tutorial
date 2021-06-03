; ----------------------------------------------------------------------------------------
; https://cs.lmu.edu/~ray/notes/nasmtutorial/
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;    
;     nasm -felf64 one.asm && ld one.o && ./a.out
;     nasm -felf64 one.asm && ld one.o && ./a.out # debug
;
; debug
; p/x $al    -print register
;
;
; ----------------------------------------------------------------------------------------

          global    _start

          section   .text
_start:   
          mov       rax, 1                  ; system call for write
          mov       rdi, 1                  ; file handle 1 is stdout
          mov       rsi, message            ; address of string to output
          mov       rdx, 13                 ; number of bytes
          syscall                           ; invoke operating system to do the write
          ;mov       rax, 60                 ; system call for exit
          ;xor       rdi, rdi                ; exit code 0
          ;syscall                           ; invoke operating system to exit
          jmp test
test:
          ; test writing regs
          mov ax, 1
          mov cx, 1
          mov dx, 1
          push ax
          pop ax
          mov al, 254
          mov ah, 22
          mov byte [rsi], '*'
          xor ax, cx
          mov rdi, 0x2540BE400 ; max 64bit
          mov edi, 255
          mov esi, 255
          mov byte[buffer], 'T'
          mov byte[buffer+1], 'o'
          mov byte[buffer+2], 'm'
          mov byte[buffer+3], 'a'
          inc byte[buffer+3]
          mov byte[buffer+4], 10

          ; todo do function from this
          mov       rax, 1                  ; system call for write
          mov       rdi, 1                  ; file handle 1 is stdout
          mov       rsi, buffer            ; address of string to output
          mov       rdx, 5                 ; number of bytes
          syscall                           ; invoke operating system to do the write

          mov       rax, 60                 ; system call for exit
          xor       rdi, rdi                ; exit code 0
          
          syscall      
          ; https://en.wikipedia.org/wiki/Data_segment
          section   .data
message:  db        "Hello, World", 10      ; note the newline at the end

          ; global varialbles
          section .bss
buffer:   resb 64 ; 64 bytes reserve