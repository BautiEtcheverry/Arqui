#include <stdio.h>
#include <stdlib.h>

long long int fibo(unsigned int n);
int main(int argc, char *argv[]){
    if(argc>1)
        printf("Fibo(%d)=%lld\n",atoi(argv[1]), fibo(atoi(argv[1])));
    else 
        printf("Fibo(%d)=%lld\n",0, fibo(0));
    return 0;
}

long long int fibo(unsigned int n){
    if (n == 0) return 0;
    if (n == 1) return 1;
    long long int a = 0, b = 1, temp;
    for (unsigned int i = 2; i <= n; i++) {
        temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}