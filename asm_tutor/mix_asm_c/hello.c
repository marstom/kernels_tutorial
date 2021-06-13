#include <stdio.h>
#include <stdlib.h>

extern void hello();
extern int add(char a, char b, char c);
extern int add_arr(int *a, int size);

int main(){
    hello();
    printf("\n addddition: %d\n", add(3,6,9));
    printf("\n addddition: %d\n", add(2,5,8));
    printf("\n addddition: %d\n", add(1,4,7));

    int arr[5] ={9,8,7,6,5};
    printf("\n array: %d\n", add_arr(arr, 5));
    return 0;
}