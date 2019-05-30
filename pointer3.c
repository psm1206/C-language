#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main()
{
	/*int data = 0x12345678;
	char *p = (char *)&data;
	*p = 0;
	*(short *)p = 5;
	printf("%x\n", data);*/

	int data = 0xF2345678;
	short * ptr = (short *)&data;
	*ptr = 0x0412;
	printf("0x%X\n", data);

	char a = 0x12, b = 0x34;
	short c = 0x5678;
	int t;

	char *p = (char *)&t;
	*(short *)p = c;
	p = p + 2;
	*p = b;
	p++;
	*p = a;

	printf("0x%X", t);
}