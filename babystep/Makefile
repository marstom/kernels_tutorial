real_mode_assembly1:
	nasm real_mode_assembly1.asm -f bin -o boot.bin

real_mode_assembly2:
	nasm real_mode_assembly2.asm -f bin -o boot.bin

run:
	qemu-system-i386 -hda boot.bin

runx:
	qemu-system-x86_64 -hda boot.bin
