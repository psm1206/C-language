#include <stdio.h>
#include <stdlib.h>

int main(void) {
	
	char arr[10];
	int i;
	
	for(i = 0; i < 10; i++) {
		scanf("%c", &arr[i]);
	}

	// �� ������ Ȯ��. 
//	for(i = 0; i < 10; i++) {
//		printf("%c", arr[i]);
//	}
	
	int cnt = 0;
	int j = 0;
	
	while(j < 10) {
		
		if(arr[j] == '(') cnt++;
		else if(arr[j] == ')') cnt--;
		// else printf("�ߺ�! �Ұ�ȣ�� �ƴմϴ�.");
		
		j++; 
	
	}
	
	if(cnt == 0) printf("��ȣ ���� �´�.");
	else printf("��ȣ ���� ���� �ʽ��ϴ�.");
	
	
	return 0;
}
