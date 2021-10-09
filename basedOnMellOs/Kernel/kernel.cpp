

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

void rainbow_test(){
    unsigned char *screen = (unsigned char*)0xa8000;
    for(int c=-160; c<160; c+=1){
        for(int i=-160; i<160; i+=1){
            putpixel(screen, c,i,c);
        }
    }
}

/*
To run uncomment
;call GraphicsMode in boot.asm
*/
void textmode_print_test(){
	char *video_text_mem = (char*)0xb8000;
	print(video_text_mem, "Tomek\n Safir\0", 0x0b);
}

extern "C" void main(){
	/* asm volatile ("sti"); */
    // rainbow_test();
    textmode_print_test();


	return;
}
