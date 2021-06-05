clean:
	rm -rf *.o
	rm a.out

%:
	nasm -f elf $@.asm && ld -m elf_i386 $@.o -o a.out && ./a.out 
