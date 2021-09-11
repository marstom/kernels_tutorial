all: compile assembly link run

compile:
	i686-elf-gcc -ffreestanding -m32 -g -c "kernel.cpp" -o "Binaries/kernel.o"

assembly:
	nasm "boot.asm" -f bin -o "Binaries/boot.bin"
	nasm "kernel_entry.asm" -f elf -o "Binaries/kernel_entry.o"
	nasm "zeroes.asm" -f bin -o "Binaries/zeroes.bin"

link:
	i686-elf-ld -o "Binaries/full_kernel.bin" -Ttext 0x1000 "Binaries/kernel_entry.o" "Binaries/kernel.o" --oformat binary
	cat "Binaries/boot.bin" "Binaries/full_kernel.bin" "Binaries/zeroes.bin"  > "Binaries/OS.bin"

run:
	qemu-system-x86_64 -drive format=raw,file="Binaries/OS.bin",index=0,if=floppy,  -m 128M


clean:
	rm -r Binaries/*