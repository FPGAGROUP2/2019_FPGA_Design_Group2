#include<stdio.h>
#include "pro5.h"
int main()
{ 
		int A, B, C;
		printf("Input R:");
		scanf("%d", &A);
		printf(" %d\r\n", A);
		printf("Input G:");	
		scanf("%d", &B);
		printf(" %d\r\n", B);
		printf("Input B:");
		scanf("%d", &C);
		printf(" %d\r\n", C);
		
		pro5(XPAR_PRO5_0_S00_AXI_BASEADDR,A,B,C);
		printf("END");
		return 0;
		
}
