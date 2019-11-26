#include <stdio.h>
#include <stdbool.h>
// FizzBuzz 문제
// 주어진 숫자가 3의 배수면 Fizz를, 5의 배수면 Buzz를 출력한다.
// 만약 3의 배수이자 5의 배수면 FizzBuzz를 출력한다. 

int main() {
	
	int num;
	
	while(true) {

		scanf("%d", &num);
		
		bool divByThree = (num%3==0); // 3의 배수면 1, 아니면 0 
		bool divByFive = (num%5==0); // 5의 배수면 1, 아니면 0
		
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
