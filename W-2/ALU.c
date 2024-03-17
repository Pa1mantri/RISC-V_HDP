#include<stdio.h>
int main()
{
	int num1,num2,op;
	int result=0;
	printf("choose the operation(+,-,*,/):");
	scanf("%lc", &op);

	printf("Enter the two numbers");
	scanf("%d%d", &num1,&num2);

	switch (op)
	{
		case '+':
		result = num1 + num2;
		printf("sum of two numbers %d\n",result);
		break;

		case '-':
		result = num1 - num2;
		printf("Diff of two numbers %d\n",result);
		break;

		case '*':
		result = num1 * num2;
		printf("Mul of two numbers %d\n",result);
		break;

		case '/':
		result = num1 / num2;
		printf("Div of two numbers %d\n",result);
		break;

		default:
		printf("Invalid choice");
		break;
	}

	return 0;
}


		
