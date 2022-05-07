all: compile run

compile:
	nasm -f elf add.asm -o add.o
	nasm -f elf square_n.asm -o square_n.o
	gcc -m32 -g hello.c add.o square_n.o

run:
	./a.out

clean:
	rm -rf *.o
	rm a.out