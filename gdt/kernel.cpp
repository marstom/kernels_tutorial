
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

void swap(char x, char y)
{
    char tmp = x;
    x = y;
    y = tmp;
}

/* A utility function to reverse a string  */
void reverse(char str[], int length)
{
    int start = 0;
    int end = length -1;
    while (start < end)
    {
        swap(*(str+start), *(str+end));
        start++;
        end--;
    }
}

// Implementation of itoa()
char* itoa(int num, char* str, int base)
{
    int i = 0;
    bool isNegative = false;
  
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (num == 0)
    {
        str[i++] = '0';
        str[i] = '\0';
        return str;
    }
  
    // In standard itoa(), negative numbers are handled only with 
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
    {
        isNegative = true;
        num = -num;
    }
  
    // Process individual digits
    while (num != 0)
    {
        int rem = num % base;
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        num = num/base;
    }
  
    // If number is negative, append '-'
    if (isNegative)
        str[i++] = '-';
  
    str[i] = '\0'; // Append string terminator
  
    // Reverse the string
    reverse(str, i);
  
    return str;
}


extern "C" void main(){
    char *video_text_mem = (char*)0xb8000;
    // video_text_mem[0] = 'R';
    // video_text_mem[1] = 'a';
    // video_text_mem[2] = 's';
    // video_text_mem[3] = 't';
    // video_text_mem[4] = 'a';
    // print(video_text_mem, "Tomek\n Safir\0", 0x0b);
    // asm_c_function('.');
    int charlen = my_strlen("TOmek\0\0\0");
    print(video_text_mem, "Tak to bedzie nowa liniaa\0", 0x0b);
	return;
}