
#include "strutils.h"
#include "mem.h"

extern "C" void asm_c_function(char c);
extern "C" int my_strlen(char* str);

void print(char* video_mem, char* message, char color){
    int i=0;
    int j=0;
    while(1){
        video_mem[j+1] = color;
        video_mem[j] = message[i];
        j+=2;
        i+=1;
        if(message[i] == '\0')
            break;
    }
}



void new_line(char **video_mem){
    *video_mem += 160;
}

void print_xy(char c, char color, int x, int y){
    char *video_text_mem = (char*)0xb8000;
    int pos = x*2 + y*160;
    video_text_mem[pos+1]=color;
    video_text_mem[pos]=c;
}

void clear_screen(){
    char *video_text_mem = (char*)0xb8000;
    for(int i=0; i<160; i++){
        for(int j=0; j<160; j++){
            print_xy(' ', 0x00, i, j);
    
        }
    }
}


#define SIZE (1 << 4)
int sierpinsky()
{
	int x, y, i;
	for (y = SIZE - 1; y >= 0; y--, print_xy('\n', 0x0b, x, y)) {
		for (i = 0; i < y; i++) print_xy(' ', 0x0b, x, y);
		for (x = 0; x + y < SIZE; x++)
			print_xy((x & y) ? ' ' : '*', 0x0b, x, y);
	}
	return 0;
}



extern "C" void main(){
    char *video_text_mem = (char*)0xb8000;
    // video_text_mem+=160;
    // video_text_mem[0] = 'R';
    // video_text_mem[1] = 'a';
    // video_text_mem[2] = 's';
    // video_text_mem[3] = 't';
    // video_text_mem[4] = 'a';
    // print(video_text_mem, "Tomek\n Safir\0", 0x0b);
    // asm_c_function('.');
    initializeMem();
    char *buff = (char*)kmalloc(100);
    int charlen = my_strlen("alefajnyznak\0\0\0");
    print(video_text_mem, "Tak to bedzie nowa liniaa\0", 0x0b);
    new_line(&video_text_mem);
    print(video_text_mem, itoa(charlen, buff, 10), 0x0b);
    new_line(&video_text_mem);
    print(video_text_mem, itoa(24, buff, 10), 0x0b);
    new_line(&video_text_mem);
    memset(buff, 'x', 100);
    print(video_text_mem, buff, 0x0b);
    print_xy('*', 0x0b, 0, 9);
    clear_screen();
    sierpinsky();
	return;
}