
.PHONY= : all

all: clean compile run

compile:
	nasm -g boot.asm -f bin -o ./bin/boot.bin
	nasm -g empty_end.asm -f bin -o ./bin/empty_end.bin
	nasm -g kernel_entry.asm -f elf -o ./bin/kernel_entry.o

	# functions for c in asm
	nasm -g asm_c_function.asm -f elf -o ./bin/asm_c_function.o

	i686-elf-gcc -ffreestanding -m32 -g -c "kernel.cpp" -o "bin/kernel.o"
	i686-elf-ld -g -o "bin/kernel.bin" -Ttext 0x1000 "bin/kernel_entry.o" "./bin/asm_c_function.o" "bin/kernel.o"  --oformat binary
	
	cat ./bin/boot.bin ./bin/kernel.bin  > ./bin/short.bin 
	cat ./bin/short.bin ./bin/empty_end.bin  > tomos.bin

run:
	qemu-system-i386 -drive format=raw,file=tomos.bin,index=0,if=floppy,  -m 128M

# run in debug mode
# (gdb) target remote localhost:1234
run_debug_mode:
	qemu-system-i386 -s -S -drive format=raw,file=tomos.bin,index=0,if=floppy,  -m 128M

# run with qemu controll teminal
run_log:
	qemu-system-i386 -monitor stdio -hda tomos.bin

clean:
	find . -type f -name "*.o" -delete
	find . -type f -name "*.bin" -delete

# debugg
debug:
	objcopy -O binary tomos.bin 