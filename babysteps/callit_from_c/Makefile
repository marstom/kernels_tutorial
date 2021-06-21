CFLAGS=-std=gnu99 -ffreestanding


all: nasm gcc link

nasm:
	nasm -f elf32 boot.asm -o boot.o

gcc:
	i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

link:
	i686-elf-gcc -T linker.ld -o kernel.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
run:
	qemu-system-i386 -kernel kernel.bin

clean:
	find . -type f -name "*.o" -delete
	find . -type f -name "*.S" -delete
	find . -type f -name "*.elf" -delete
	find . -type f -name "*.bin" -delete
