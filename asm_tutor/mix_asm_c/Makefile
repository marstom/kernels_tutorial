
SRCS=$(wildcard *.asm)

FILENAMES=$(SRCS:.asm=)
OBJS=$(SRCS:.asm=.o)

all: assembly compile run

assembly:
	for obj in $(FILENAMES); do \
		nasm -f elf64 $$obj.asm -o $$obj.o; \
	done

compile: $(OBJS)
	gcc -g hello.c $^ -o a.out

run:
	./a.out

clean:
	rm -rf *.o
	rm a.out