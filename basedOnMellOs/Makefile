all: compile concat run

compile:
	nasm "Bootloader/boot.asm" -f bin -o "WeeBins/boot.bin" -i Bootloader
	nasm "Kernel/empty_end.asm" -f bin -o "WeeBins/empty_end.bin"
	i686-elf-gcc -ffreestanding -m32 -g -c "Kernel/kernel.cpp" -o "WeeBins/kernel.o" -I Kernel
	nasm "Kernel/kernel_entry.asm" -f elf -o "WeeBins/kernel_entry.o" -i Kernel
	i686-elf-ld -o "WeeBins/kernel.bin" -Ttext 0x1000 "WeeBins/kernel_entry.o" "WeeBins/kernel.o" --oformat binary



concat:
	cat "WeeBins/boot.bin" "WeeBins/kernel.bin" > "WeeBins/short.bin"
	cat "WeeBins/short.bin" "WeeBins/empty_end.bin" > os_image.bin



run:
	qemu-system-x86_64 -drive format=raw,file=os_image.bin,index=0,if=floppy,  -m 128M



clean:
	find ./WeeBins -type f -print0| xargs -0 rm 
