#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void Test(short *ptr) 
{
	short soft = 0;
	soft = *ptr; //*ptr == ptr이 가리키는 대상(여기서는 tips를 의미)
	*ptr = 3;
}

void main()
{
	short tips = 5;
	Test(&tips); //ptr에 tips의 address를 대입한다.
	printf("%d\n", tips); //3이 출력된다.

	int a = 3;
	int *p = &a;
	printf("%d  %x  %x  %x  %d", a, &a, p, &p, *p); // &a==p, *p==a

}