all: asm compile link run

asm:
	nasm -f elf32 kernel.asm -o kasm.o

compile:
	i686-elf-gcc -m32 -c kernel.c -o kc.o

link:
	i686-elf-ld -m elf_i386 -T link.ld -o kernel kasm.o kc.o

run:
	qemu-system-i386 -kernel kernel

clean:
	find . -type f -name "*.o" -delete
	find . -type f -name "*.S" -delete
	find . -type f -name "*.elf" -delete
	find . -type f -name "*.bin" -delete