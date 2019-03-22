#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/*1년 1월 1일은 월요일이다.*/

int num_day(int month, int day)
{
	
	int m1 = 31, m2 = 59, m3 = 90, m4 = 120, m5 = 151, m6 = 181, m7 = 212, m8 = 243, m9 = 273, m10 = 304, m11 = 334;
		int new_month = month - 1;
		if (new_month == 0)
			 return day;
		else if (new_month == 1)
			return m1 + day;
		else if (new_month == 2)
			return m2 + day;
		else if (new_month == 3)
			return m3 + day;
		else if (new_month == 4)
			return m4 + day;
		else if (new_month == 5)
			return m5 + day;
		else if (new_month == 6)
			return m6 + day;
		else if (new_month == 7)
			return m7 + day;
		else if (new_month == 8)
			return m8 + day;
		else if (new_month == 9)
			return m9 + day;
		else if (new_month == 10)
			return m10 + day;
		else 
			return m11 + day;
}
void main()
{
	while (1) {
		int a, year, month, day;
		scanf("%d", &year);

		if(year)
		{
		scanf("%d %d",&month, &day);
		
			if (year % 4 == 0)
			{
				a = 1;
				if (year % 100 == 0)
				{
					a = 0;
					if (year % 400 == 0)
					{
						a = 1;
					}
				}
			}
			else a = 0;

			int num_day1;
			if (a == 0)
			{
				num_day1 = num_day(month, day);
			}
			else
			{
				if (month <= 2)
				{
					num_day1 = num_day(month, day);
				}
				else
				{
					num_day1 = num_day(month, day) + 1;
				}
			}
			int sub_year = year - 1;
			int p = sub_year / 4 - sub_year / 100 + sub_year / 400; /*윤년 개수*/
			int d = (sub_year - 1) + 364 + p + num_day1;
			int final_d = d % 7;
			if (final_d == 0)
			{
				printf("월요일입니다.\n");
			}
			else if (final_d == 1)
			{
				printf("화요일입니다.\n");
			}
			else if (final_d == 2)
			{
				printf("수요일입니다.\n");
			}
			else if (final_d == 3)
			{
				printf("목요일입니다.\n");
			}
			else if (final_d == 4)
			{
				printf("금요일입니다.\n");
			}
			else if (final_d == 5)
			{
				printf("토요일입니다.\n");
			}
			else if (final_d == 6)
			{
				printf("일요일입니다.\n");
			}
		}

		else
			break;
	}
}