#include <stdio.h>
#include <stdlib.h>

extern void hello();
extern int add(char a, char b, char c);
extern int add_arr(int *a, int size);
extern int square_sum(int32_t arr[], int32_t len);extern int square_sum(int32_t arr[], int32_t len);
extern char *rgb(int r, int g, int b, char *outp);
extern unsigned *cntbyx(unsigned *outp, unsigned x, size_t n);
extern int get_real_floor(int floor);
extern int last_digit(long); // TODO WIP

void test_old_katas(){
    hello();
    printf("\n addddition: %d\n", add(3,6,9));
    printf("\n addddition: %d\n", add(2,5,8));
    printf("\n addddition: %d\n", add(1,4,7));

    int arr[5] ={9,8,7,6,5};
    printf("\n array: %d\n", add_arr(arr, 5));

    // printf("\n Square sum: %d\n", square_sum((int32_t[]){1, 2, 3, 4, 5, 6}, 5));
    printf("\n Square sum: %d\n", square_sum((int32_t[]){3, 5, 5}, 3));
    printf("\n Square sum: %d\n", square_sum((int32_t[]){1}, 0));
    printf("\n Square sumx: %d\n", square_sum((int32_t[]){1}, 1));

    //https://www.codewars.com/kata/5513795bd3fafb56c200049e/train/nasm
    unsigned data[10];
    int32_t len = 10;
    unsigned *actual = cntbyx(data, 5, len);
    printf("\n KATA cntbyx:");
    for(int i = 0; i < 10; i++){
        printf(" %d", actual[i]);
    }
    printf("\n");

    // https://www.codewars.com/kata/513e08acc600c94f01000001/train/nasm
    char outp[7];
    rgb(0, 0, 0, outp);
    printf("Hex RGB %s\n", outp);

    rgb(148, 0, 211, outp);
    printf("Hex RGB %s\n", outp);

    rgb(255, 255, 255, outp);
    printf("Hex RGB %s\n", outp);    
    rgb(255, 255, 255, outp);
    printf("Hex RGB %s\n", outp);  
    rgb(255, 255, 255, outp);
    printf("Hex RGB %s\n", outp);  
    rgb(1223, 845, 256, outp);
    printf("Hex RGB %s\n", outp);
    rgb(255, 255, 255, outp);
    printf("Hex RGB %s\n", outp); 
    rgb(NULL, NULL, NULL, outp);
    printf("Hex RGB %s\n", outp); 
    rgb(257, 0, 255, outp);
    printf("Hex RGB %s\n", outp); 
    rgb(-25, -125, -255, outp);
    printf("Hex RGB NEGATIVE %s\n", outp); 
    printf("Floor(1) %d\n", get_real_floor(1)); 
    printf("Floor(5) %d\n", get_real_floor(5)); 
    printf("Floor(15) %d\n", get_real_floor(15)); 
    printf("Floor(15) %d\n", get_real_floor(-3)); 
}


void test_last_digit(){
    printf("Last int last_digit(long); 5->2 %d\n", last_digit(5));
    printf("Last int last_digit(long); 9->8 %d\n", last_digit(9));
    printf("Last int last_digit(long); 12->6 %d\n", last_digit(12));
    printf("Last int last_digit(long); 13->8 %d\n", last_digit(13));
}

int main(){
    // test_old_katas();
    test_last_digit();
    return 0;
}