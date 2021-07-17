
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