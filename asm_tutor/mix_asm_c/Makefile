all: compile run

compile:
	nasm -f elf64 hello.asm -o hello.o
	nasm -f elf64 add.asm -o add.o
	nasm -f elf64 add_arr.asm -o add_arr.o
	nasm -f elf64 square_n.asm -o square_n.o
	nasm -f elf64 cntbyx.asm -o cntbyx.o
	gcc -g hello.c hello.o add.o add_arr.o square_n.o cntbyx.o

run:
	./a.out

clean:
	rm -rf *.o
	rm a.out