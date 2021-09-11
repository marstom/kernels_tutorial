/*
Protected mode
*/

/* example for 320x200 VGA */
void putpixel(int pos_x, int pos_y, unsigned char VGA_COLOR)
{
    unsigned char* location = (unsigned char*)0xA0000 + 320 * pos_y + pos_x;
    *location = VGA_COLOR;
}


/*
message /0 terminated
*/
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

extern "C" void main(){
    char *video_mem = (char*)0xb8000;
    // *(char*)0xb8000 = 'Q';
    // video_mem[0] = 'M';
    // video_mem[2] = 'y';
    // video_mem[4] = ' ';
    // video_mem[6] = 'f';
    // video_mem[6] = 'i';
    print(video_mem, "Tomek\n Safir", 0x0b);
    // for(int j=0; j<320; j++){
    //     for(int i=0; i<320; i+=1){
    //         putpixel(i,j,1);
    //     }
    // }

    for(int i=0; i<320; i+=1){
        putpixel(i,i,i);
    }
    return;
}
