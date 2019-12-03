#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <limits.h>
#include <stdlib.h>

/* Overflow test */
int main()
{
	unsigned int u_max = UINT_MAX + 1;
	unsigned int u_min = 0 - 1;
	short s = 255; //0b0000000011111111
	short s2 = 127; //0b0000000001111111

	/* 2바이트 자료형 값을 1바이트 format specifier(%hhd)에
	   넣으려고 하니 앞의 1바이트는 날아가고 그 다음 바이트를 가지고 출력 */
	printf("short :%hhd, %hd, %d\n", s, s, s);
	printf("short2 :%hhd, %hd, %d\n", s2, s2, s2);

	/* _itoa는 10진수를 2진수로 바꿔주는 메소드(stdlib.h에 있다)
	   결과적으로 buffer에는 0과 1로 구성된 배열이 된다. */
	char buffer[33];
	_itoa(u_max, buffer, 2);

	printf("decimal : %u \n", u_max);
	printf("binary : %s \n", buffer);

	_itoa(u_min, buffer, 2);
	printf("decimal : %u \n", u_min);
	printf("binary : %s \n", buffer);

	return 0;
}

