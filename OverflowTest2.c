#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

int main()
{
	/* 분명 자료형 char는 -128 ~ 127의 값을 가지지만, 이 범위를 벗어난 수를 넣어줄 수도 있다.
	   단, overflow가 일어난다는 점을 알아두어야 한다. */
	/* 자료형 char로 하면 %d나 %u로 4바이트 중에 3바이트를 1로 채운다.
	   하지만 자료형 short로 하면 2바이트만을 사용한다. -> 왜 그럴까? 
	   char의 값이 원래 범위의 값을 벗어나면, 1로 채우는 것을 확인했다. 
	   벗어나지 않으면 1바이트의 크기를 그대로 유지한다. -> 왜 그럴까? */
	unsigned char of = 129; //0b10000001 = -127
	char c = -1; //0b11111111

	printf("%d\n", of);     // -127
	printf("%u\n", of);     // 4294967169
	printf("%hhd\n", of);   // -127
	printf("%hhu\n", of);   // 129
	
	char buffer[33];
	_itoa(of, buffer, 2);

	printf("decimal : %d \n", of); 
	printf("binary : %s \n", buffer);

	return 0;
}

