#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void Test(short data)
{
	short soft = 0;
	soft = data;
	printf("%d\n", soft);
}

void main()
{
	short tips = 5;
	Test(tips);

	int birthday;
	int *ptr;
	ptr = &birthday;
	*ptr = 0x0101;
	//short *ptr = &birthday;

	printf("birthday 변수의 주소는 %p입니다.\n", ptr);

	printf("birthday = %d (0x%04X)", birthday, birthday);
}