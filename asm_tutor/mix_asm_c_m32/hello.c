#include <stdio.h>
#include <stdlib.h>


extern int add(int32_t a, int32_t b, int32_t c);
extern int square_sum(int32_t arr[], int32_t len);


int main(){
    printf("\n addddition: %d\n", add(3,6,9));
    printf("\n addddition: %d\n", add(2,5,8));
    printf("\n addddition: %d\n", add(1,4,7));

    // printf("\n Square sum: %d\n", square_sum((int32_t[]){11, 22, 33}, 119));
    printf("\n Square sum: %d\n", square_sum((int32_t[]){3, 5, 5}, 3));



    return 0;
}