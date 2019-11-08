/*
 * main.c
 *
 *  Created on: 2019¦~11¤ë8¤é
 *      Author: JJHU
 */

#include<stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"
#include "test2.h"
int main()
{

	//u32	A, B, Sum;
	u32 A, B, Sum;
	u32 x;
	u32 C;//operator signal
	char D;

		printf("Program Start.\n\r");

			printf("Operator:");
			scanf("%c", &D);
			printf(" %c\r\n", D);
			printf("Input A:");
			scanf("%d", &A);
			printf(" %d\r\n", A);
			printf("Input B:");
			scanf("%d", &B);
			printf(" %d\r\n", B);


			if(D =='+')
			{
				C = 0;
				Sum = test2(XPAR_TEST2_0_S00_AXI_BASEADDR, A, B, C);
				printf("A + B = %d\n\r", Sum);
			}
			if(D =='-')
			{
				C = 1;
				Sum = test2(XPAR_TEST2_0_S00_AXI_BASEADDR, A, B, C);
				printf("A - B = %d\n\r", Sum);
			}
			if(D =='*')
			{
				C =2;
				Sum = test2(XPAR_TEST2_0_S00_AXI_BASEADDR, A, B, C);
				printf("A * B = %d\n\r", Sum);
			}

			x = TEST2_mReadReg (XPAR_TEST2_0_S00_AXI_BASEADDR, 8);
			printf("%d\n\r",x);

		printf("Program End.\n\r");
  		return 0;


}

