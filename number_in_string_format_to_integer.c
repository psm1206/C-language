#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int ConvertInteger(char string[])
{
	int num = 0, count = 0;
	while (string[count] != 0)
	{
		num = num * 10 + string[count] - '0';
		count++;
	}
	return num;
}

void main()
{
	int pos_num = 100, num = 0, i, temp_num;
	char num_string[4] = "789";
	for (i = 0; i < 3; i++)
	{
		temp_num = num_string[i] - '0';
		num = num + temp_num * pos_num;
		pos_num = pos_num / 10;
	}
	printf("%s -> %d\n", num_string, num);

	printf("%d", ConvertInteger(num_string));

}