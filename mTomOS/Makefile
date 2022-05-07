all: compile concat run

compile:
	nasm "Bootloader/boot.asm" -f bin -o "Binaries/boot.bin" -i Bootloader
	nasm "Kernel/empty_end.asm" -f bin -o "Binaries/empty_end.bin"
	nasm "Kernel/keyboard.asm" -f elf -o "Binaries/keyboard.o"

	i686-elf-gcc -ffreestanding -m32 -g -c "Kernel/kernel.cpp" -o "Binaries/kernel.o" -I Kernel
	nasm "Kernel/kernel_entry.asm" -f elf -o "Binaries/kernel_entry.o" -i Kernel
	i686-elf-ld -o "Binaries/kernel.bin" -Ttext 0x1000 "Binaries/kernel_entry.o" "Binaries/kernel.o" "Binaries/keyboard.o" --oformat binary



concat:
	cat "Binaries/boot.bin" "Binaries/kernel.bin" > "Binaries/short.bin"
	cat "Binaries/short.bin" "Binaries/empty_end.bin" > os_image.bin



run:
	qemu-system-x86_64 -drive format=raw,file=os_image.bin,index=0,if=floppy,  -m 128M



clean:
	find ./Binaries -type f -print0| xargs -0 rm 
	

create_dirs:
	mkdir Binaries