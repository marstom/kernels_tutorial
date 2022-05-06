all: compile concat run

compile:
	nasm "Bootloader/boot.asm" -f bin -o "WeeBins/boot.bin" -i Bootloader
	nasm "Kernel/empty_end.asm" -f bin -o "WeeBins/empty_end.bin"

concat:
	cat "WeeBins/boot.bin" "WeeBins/empty_end.bin" > os_image.bin



run:
	qemu-system-x86_64 -drive format=raw,file=os_image.bin,index=0,if=floppy,  -m 128M



clean:
	find ./WeeBins -type f -print0| xargs -0 rm 
	
