clean:
	rm -rf *.o
	rm a.out

%:
	nasm -g -f elf $@.asm && ld -g -m elf_i386 $@.o -o a.out && ./a.out 
