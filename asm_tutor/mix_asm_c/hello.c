#include <stdio.h>
#include <stdlib.h>

extern void hello();
extern int add(int a, int b, int c);

int main(){
    hello();
    printf("\n addddition: %d\n", add(3,6,9));
    printf("\n addddition: %d\n", add(2,5,8));
    printf("\n addddition: %d\n", add(1,4,7));
    return 0;
}