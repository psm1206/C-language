#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main()
{
	int input_data1, input_data2; //변수를 다르게 할당해주어도 결국 하나의 표준입력버퍼를 사용함을 확인.
	input_data1 = getchar();
	rewind(stdin); //initialize standard input buffer
	printf("the first input = %c\n", input_data1);
	input_data2 = getchar();
	printf("the second input = %c\n", input_data2);

	char input_string[10]; //maximum character : 9 because the last character have to be NULL(0).
	gets(input_string);
	printf("input : %s\n", input_string);


}