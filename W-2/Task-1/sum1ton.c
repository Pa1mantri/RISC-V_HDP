#include<stdio.h>

int main()
{
	int i, sum=0 , n=100;
	for(i=0;i<=n;i=i+1) {
		sum +=i;
	}
	printf("Sum of the numbers from 1 to n is %d\n", sum);
return 0;
}

