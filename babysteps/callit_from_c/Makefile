all: nasm gcc

nasm:
	nasm kmain.asm -f bin -o kmain.o


CFLAGS=-g -fno-PIE -static -std=gnu99 -m16 -Os -mregparm=3 \
    -fomit-frame-pointer -nostdlib -ffreestanding -Wall -Wextra

gcc:
	i686-elf-gcc -c $(CFLAGS) os.c kmain.o -o boot.bin

ld:
	i686-elf-ld -melf_i386 -Tlink.ld ./kmain.o ./os.o -o boot.elf

run:
	qemu-system-i386 -hda boot.bin

clean:
	rm -rf *.o