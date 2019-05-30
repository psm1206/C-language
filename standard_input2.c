#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main()
{
	/*char data; // -128 ~127 값 저장가능.
	scanf("%hhd", &data);
	printf("data = %d", data);*/

	int num = 0;
	while (1)
	{
		printf("input age : ");
		if (0 == scanf("%d", &num))
		{
			rewind(stdin);
			printf("Please enter digit number!!\n");
		}
		else
		{
			if (num > 0 && num <= 130)
			{
				printf("your age = %d\n", num);
			}
			else
			{
				printf("Please enter correct age!!\n");
			}
		}
	}
}