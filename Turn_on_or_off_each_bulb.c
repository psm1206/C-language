#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned char turn_bulb(unsigned char bulb_state, unsigned char bulb_num, unsigned char turn)
{
	unsigned char bit_num = 8 - bulb_num;

		if (turn == 1)
		{
			return bulb_state | (1 << bit_num);
		}
		else
		{
			return bulb_state & ~(1 << bit_num);
		}
}

void main()
{
	unsigned char bulb_state = 0;
	while (1) 
	{
		int bulb_num;
		printf("몇 번째 전구를 키거나 끄고 싶으신가요?\n");
		scanf("%d", &bulb_num);

		if (bulb_num <= 8 && bulb_num >= 1)
		{	
			int turn;
			printf("그 전구를 키고 싶다면 '1', 끄고 싶다면 '0'을 입력해주세요.\n");
			scanf("%d", &turn);

			bulb_state = turn_bulb(bulb_state, bulb_num, turn);
			/*printf("%d\n", bulb_state); /*10진수로 출력한 전구상태*/

			printf("현재 전구 상태 : ");
			int i;
			for (i = 7; i>=0; i--)
			{
				printf("%d", (bulb_state >> i) & 1);
			}
			printf("\n");
		}
		else printf("그 번호의 전구는 없습니다. ㅠㅠ\n");
	}
}