

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


void putpixel(unsigned char* screen, int pos_x, int pos_y, unsigned char VGA_COLOR)
{
    unsigned char* location = screen + 320 * pos_y + pos_x;
    *location = VGA_COLOR;
}

extern "C" void main(){
	/* asm volatile ("sti"); */
	char *video_text_mem = (char*)0xb8000;
	/* unsigned char *screen = (unsigned char*)0xA0000; */
	print(video_text_mem, "Tomek\n Safir\0", 0x0b);


	/* for(int i=0; i<320; i+=1){ */
	/*     putpixel(screen, i,i,i); */
	/* } */


	/* *(char*)0xb8000 = 'Q'; */
	return;
}
