all:
	nasm -felf32 -o start.o start.asm
	i686-elf-ld -T link.ld -o kernel.bin start.o


clean:
	find . -type f -name "*.o" -delete
	find . -type f -name "*.S" -delete
	find . -type f -name "*.elf" -delete
	find . -type f -name "*.bin" -delete