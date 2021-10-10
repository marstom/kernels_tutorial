
.PHONY= : all

all: clean compile run

compile:
	nasm -g boot.asm -f bin -o ./bin/boot.bin
	nasm -g empty_end.asm -f bin -o ./bin/empty_end.bin
	
	i686-elf-gcc -ffreestanding -m32 -g -c "kernel.cpp" -o "bin/kernel.o"
	i686-elf-ld -o "bin/kernel.bin" -Ttext 0x1000 "bin/kernel.o" --oformat binary
	
	cat ./bin/boot.bin ./bin/kernel.bin  > ./bin/boot.bin 
	cat ./bin/boot.bin ./bin/empty_end.bin  > tomos.bin

run:
	qemu-system-i386 -hda tomos.bin

# run in debug mode
# (gdb) target remote localhost:1234
run_debug_mode:
	qemu-system-i386 -s -S -hda tomos.bin

# run with qemu controll teminal
run_log:
	qemu-system-i386 -monitor stdio -hda tomos.bin

clean:
	find . -type f -name "*.o" -delete
	find . -type f -name "*.bin" -delete

# debugg
debug:
	objcopy -O binary tomos.bin 