/*
Protected mode
*/

#define PIXEL_WIDTH 320 // horizontal
#define PIXEL_HEIGHT 200 // horizontal
#define PITCH 320
/* example for 320x200 VGA */
void putpixel(unsigned char* screen, int pos_x, int pos_y, unsigned char VGA_COLOR)
{
    unsigned char* location = screen + 320 * pos_y + pos_x;
    *location = VGA_COLOR;
}

static void putpixel2(unsigned char* screen, int x,int y, int color) {
    unsigned where = x*1 + y*PIXEL_WIDTH;
    screen[where] = color & 255;              // BLUE
    screen[where + 1] = (color >> 8) & 255;   // GREEN
    screen[where + 2] = (color >> 16) & 255;  // RED
}



static void fillrect(unsigned char *vram, unsigned char r, unsigned char g, unsigned   char b, unsigned char w, unsigned char h) {
    unsigned char *where = vram;
    int i, j;
    int pixelwidth=1;
 
    for (i = 0; i < w; i++) {
        for (j = 0; j < h; j++) {
            //putpixel(vram, 64 + j, 64 + i, (r << 16) + (g << 8) + b);
            where[j*pixelwidth] = r;
            where[j*pixelwidth + 1] = g;
            where[j*pixelwidth + 2] = b;
        }
        where+=PITCH;
    }
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
    char *video_text_mem = (char*)0xb8000;
    unsigned char *screen = (unsigned char*)0xA0000;
    print(video_text_mem, "Tomek\n Safir", 0x0b);
    // *(char*)0xb8000 = 'Q';
    // video_mem[0] = 'M';
    // video_mem[2] = 'y';
    // video_mem[4] = ' ';
    // video_mem[6] = 'f';
    // video_mem[6] = 'i';
    // for(int j=0; j<320; j++){
    //     for(int i=0; i<320; i+=1){
    //         putpixel(i,j,1);
    //     }
    // }

    // for(int i=0; i<320; i+=1){
    //     putpixel(screen, i,i,i);
    // }

    for(int i=0; i<320; i+=1){
        // putpixel2(screen, i,i,0x2abcde);
    }

    int color = 0x3a;
    putpixel2(screen, 1, 3, color);
    putpixel2(screen, 1, 5, color);
    putpixel2(screen, 1, 6, color);
    putpixel2(screen, 1, 8, color);


    putpixel2(screen, 15, 3, color);
    putpixel2(screen, 15, 5, color);
    putpixel2(screen, 15, 6, color);
    putpixel2(screen, 15, 8, color);

    fillrect(screen, 23, 43, 55, 150, 200);
    return;
}
