extern "C" void main(){
    char *video_mem = (char*)0xb8000;
    // *(char*)0xb8000 = 'Q';
    video_mem[0] = 'M';
    video_mem[2] = 'y';
    video_mem[4] = ' ';
    video_mem[6] = 'f';
    video_mem[6] = 'i';
    return;
}
