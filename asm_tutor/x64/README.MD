
# Debug

```
gdb ./a.out

b stack.asm:64

(gdb) ni ;next instruction
(gdb) n  ; next, it not eneter to prinf for example
(gdb) p/x $rsi
(gdb) p/c *($rdi+3)    ; third char of string under rdi address

```


## Komendy GDB

Pokaż flagi które są ustawione
info registers eflags


# Funkcje C

printf

format rdi
arg1 - rsi
arg2 - rdx
arg3 - rcx


# Cheat sheety
czym są db dw, rozmiary rejestrów, instrukcje cmp, jak użyć div
https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
