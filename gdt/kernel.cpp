
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



int new_line(char **video_mem){
    *video_mem += 160;
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
	return;
}