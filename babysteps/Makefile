
.PHONY= : all

all: compile run

compile:
	nasm $(IN) -f bin -o boot.bin

run:
	qemu-system-i386 -hda boot.bin

# run in debug mode
# (gdb) target remote localhost:1234
run_debug_mode:
	qemu-system-i386 -s -S -hda boot.bin

# run with qemu controll teminal
run_log:
	qemu-system-i386 -monitor stdio -hda boot.bin

clean:
	find . -type f -name "*.o" -delete
	find . -type f -name "*.S" -delete
	find . -type f -name "*.elf" -delete
	find . -type f -name "*.bin" -delete

# debugg
debug:
	objcopy -O binary boot.bin 