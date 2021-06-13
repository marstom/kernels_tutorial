#include <stdio.h>
#include <stdlib.h>

extern void hello();
extern int add(int a, int b, int c);

int main(){
    hello();
    printf("\n addddition: %d\n", add(4,5,9));
    printf("\n addddition: %d\n", add(1,1,1));
    printf("\n addddition: %d\n", add(7,7,7));
    return 0;
}