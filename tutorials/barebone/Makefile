all: boot kernel link

boot:
	# i686-elf-as boot.s -o boot.o
	nasm -felf32 boot.asm -o boot.o

kernel:
	i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra


link:
	i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

clean:
	find . -type f -name "*.o" -delete
	find . -type f -name "*.S" -delete
	find . -type f -name "*.elf" -delete
	find . -type f -name "*.bin" -delete

run:
	qemu-system-i386 -kernel myos.bin
