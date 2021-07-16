all: asm

asm:
	nasm -felf64 -g $(FILE).asm && gcc -g $(FILE).o && ./a.out


clean:
	rm -rf *.o
	rm a.out
