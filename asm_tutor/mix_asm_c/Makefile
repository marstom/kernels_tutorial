all:
	nasm -f elf64 hello.asm -o hello.o
	gcc hello.c hello.o

clean:
	rm -rf *.o
	rm a.out