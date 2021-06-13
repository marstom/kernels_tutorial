all: compile run

compile:
	nasm -f elf64 hello.asm -o hello.o
	nasm -f elf64 add.asm -o add.o
	nasm -f elf64 add_arr.asm -o add_arr.o
	gcc -g hello.c hello.o add.o add_arr.o

run:
	./a.out

clean:
	rm -rf *.o
	rm a.out