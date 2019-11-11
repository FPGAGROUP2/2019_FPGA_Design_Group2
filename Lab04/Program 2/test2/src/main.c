#include<stdio.h>

int main()
(

	//u32	A, B, Sum;
	signed int 32 A, B, Sum;
	u2 C;//operator signal
	char D;
		printf("Program Start.\n\r");
		while(getchar() != EOF) 
		{

			printf("Input A:");
			scanf("%d", &A);
			printf(" %d\r\n", A);
			printf("Input B:");
			scanf("%d", &B);
			printf(" %d\r\n", B);
			printf("Operator:");
			scanf("%c", &E);
			printf(" %c\r\n", E);
			
			if(D =='+')
			{
				C = 0;
				Sum = add(XPAR_PRO2_0_S00_AXI_BASEADDR, A, B);
				printf("A + B = %d\n\r", Sum);
			}
			if(D =='-')
			{
				C = 1;
				Sum = add(XPAR_PRO2_0_S00_AXI_BASEADDR, A, B);
				printf("A - B = %d\n\r", Sum);
			}
			if(D =='*')
			{
				C =2;
				Sum = add(XPAR_PRO2_0_S00_AXI_BASEADDR, A, B);
				printf("A * B = %d\n\r", Sum);
			}
			

		}
		printf("Program End.\n\r");
  		return 0;


) 
