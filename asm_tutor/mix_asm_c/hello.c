#include <stdio.h>
#include <stdlib.h>

extern void hello();
extern int add(char a, char b, char c);
extern int add_arr(int *a, int size);
extern int square_sum(int32_t arr[], int32_t len);extern int square_sum(int32_t arr[], int32_t len);
extern char *rgb(int r, int g, int b, char *outp);

extern unsigned *cntbyx(unsigned *outp, unsigned x, size_t n);

int main(){
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
    return 0;
}