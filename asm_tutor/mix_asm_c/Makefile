all: compile run

compile:
	nasm -f elf64 hello.asm -o hello.o
	nasm -f elf64 add.asm -o add.o
	gcc hello.c hello.o add.o

run:
	./a.out

clean:
	rm -rf *.o
	rm a.out