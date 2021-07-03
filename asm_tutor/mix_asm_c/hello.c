#include <stdio.h>
#include <stdlib.h>

extern void hello();
extern int add(char a, char b, char c);
extern int add_arr(int *a, int size);
extern int square_sum(int32_t arr[], int32_t len);extern int square_sum(int32_t arr[], int32_t len);

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
    unsigned data[5];
    unsigned *actual = cntbyx(data, 50, 5);
    printf("\n KATA cntbyx: %d %d %d %d %d\n", actual[0], actual[1], actual[2], actual[3], actual[4]);

    return 0;
}