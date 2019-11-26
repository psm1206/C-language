#include <stdio.h>
#include <stdlib.h>

int main(void) {
	
	char arr[10];
	int i;
	
	for(i = 0; i < 10; i++) {
		scanf("%c", &arr[i]);
	}

	// Àß µé¾î°¬´ÂÁö È®ÀÎ. 
//	for(i = 0; i < 10; i++) {
//		printf("%c", arr[i]);
//	}
	
	int cnt = 0;
	int j = 0;
	
	while(j < 10) {
		
		if(arr[j] == '(') cnt++;
		else if(arr[j] == ')') cnt--;
		// else printf("»ßº÷! ¼Ò°ýÈ£°¡ ¾Æ´Õ´Ï´Ù.");
		
		j++; 
	
	}
	
	if(cnt == 0) printf("°ýÈ£ ½ÖÀÌ ¸Â´Ù.");
	else printf("°ýÈ£ ½ÖÀÌ ¸ÂÁö ¾Ê½À´Ï´Ù.");
	
	
	return 0;
}
