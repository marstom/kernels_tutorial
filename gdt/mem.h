#pragma once

#define FREE_MEM 0x10000;
int freeMem = FREE_MEM;

void initializeMem(){
    freeMem = FREE_MEM;
}

void* memset(void* dest, unsigned char val, int count){ 
	unsigned char* destC = (unsigned char*)dest;
	int i;
	for (i = 0; i < count; i++)
		destC[i] = val;
	return dest;
}

/* allocate space linearly (Welcome to the worst allocation method ever), starting from address 0x10000 */
void* kmalloc(int size){
    memset((void*)freeMem, 0, size); 
    void* address = (void*)freeMem;
    freeMem += size;
    return address;
}
