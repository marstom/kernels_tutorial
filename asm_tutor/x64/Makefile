all: asm clean

asm:
	nasm -felf64 $(FILE).asm && gcc $(FILE).o && ./a.out


clean:
	rm -rf *.o
