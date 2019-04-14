#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main()
{
	/*char data;
	char *p = &data;
	
	char data[5];
	data[0] = 3;
	*(data + 1) = 3;

	printf("%d %d", *(data), *(data+1));*/

	int data[2] = { 0x12345678, 0x12345678 };

/*	data[0] = 0x22;*/

	*(char *)(data) = 0x22; //포인터를 이용해서 바꾸고 싶은 부분의 자료형만 콕 집어 바꿔줌.

	printf("0x%X\n", data[0]);

	int tips = 0x12345678, sum;
	char * p = (char *)&tips;

	sum = *(p + 0) + *(p + 1) + *(p + 2) + *(p + 3);
	sum = p[0] + p[1] + p[2] + p[3];
	printf("0x%x", sum);

}