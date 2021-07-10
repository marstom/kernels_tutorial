OUT=test.out

SRCS=$(wildcard *.asm)
FILENAMES=$(SRCS:.asm=)
OBJS=$(SRCS:.asm=.o)

all: assembly compile run clean

assembly:
	for obj in $(FILENAMES); do \
		nasm -f elf64 $$obj.asm -o $$obj.o; \
	done

compile: $(OBJS)
	gcc -g hello.c $^ -o $(OUT)

run:
	./$(OUT)

clean:
	rm -rf *.o

clean_exec:
	rm $(OUT)