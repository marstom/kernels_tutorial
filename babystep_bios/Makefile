
all: baby run_log

baby:
	nasm baby1.asm -f bin -o boot.bin


# target remote localhost:1234
rufn:
	qemu-system-i386 -s -S -hda boot.bin

run_log:
	qemu-system-i386 -monitor stdio -hda boot.bin
clean:
	rm boot.bin

debug:
	objcopy -O binary boot.bin 