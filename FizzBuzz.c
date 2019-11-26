#include <stdio.h>
#include <stdbool.h>
// FizzBuzz ����
// �־��� ���ڰ� 3�� ����� Fizz��, 5�� ����� Buzz�� ����Ѵ�.
// ���� 3�� ������� 5�� ����� FizzBuzz�� ����Ѵ�. 

int main() {
	
	int num;
	
	while(true) {

		scanf("%d", &num);
		
		bool divByThree = (num%3==0); // 3�� ����� 1, �ƴϸ� 0 
		bool divByFive = (num%5==0); // 5�� ����� 1, �ƴϸ� 0
		
		printf("divByThree : %d\ndivByFive : %d\n", divByThree, divByFive);
		
		if (divByThree && divByFive) {
			printf("FizzBuzz\n");
			
		} else if (divByThree) {
			printf("Fizz\n");
			
		} else if (divByFive) {
			printf("Buzz\n");
		} else {
			printf("Nothing\n");
		}
		
	}
	
	return 0;
}
