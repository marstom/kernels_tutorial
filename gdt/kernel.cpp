

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
    video_text_mem[0] = 'A';
    print(video_text_mem, "Tomek\n Safir\0", 0x0b);
	return;
}