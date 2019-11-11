/*
 * main.c
 *
 *  Created on: 2019¦~11¤ë4¤é
 *      Author: Ian
 */


#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"
#include "sorting.h"

int main(){
	printf("Program1 Start.\r\n");
	u32 data1 = 0;
	int num1 = 0;
	for(int i = 0; i < 8; i++){
		printf("Number %d = ", i+1);
		scanf("%d", &num1);
		printf("%d\r\n", num1);
		data1 = (data1 << 4) + num1;
	}
	printf("Your input: %x\r\n", data1);
	u32 sorting_result = sorting(XPAR_PROGRAM1_0_S00_AXI_BASEADDR, data1);
	printf("%x\r\n", sorting_result);
	printf("Program1 End.\r\n");
	
	
	u32 A2, B2, Sum2;
	u32 C2;//operator signal
	char D2;

		printf("Program2 Start.\n\r");

			printf("Operator:");
			scanf("%c", &D2);
			printf(" %c\r\n", D2);
			printf("Input A:");
			scanf("%d", &A2);
			printf(" %d\r\n", A2);
			printf("Input B:");
			scanf("%d", &B2);
			printf(" %d\r\n", B2);


			if(D2 =='+')
			{
				C2 = 0;
				Sum2 = test2(XPAR_PROGRAM2_0_S00_AXI_BASEADDR, A2, B2, C2);
				printf("A + B = %d\n\r", Sum2);
			}
			if(D2 =='-')
			{
				C2 = 1;
				Sum2 = test2(XPAR_PROGRAM2_0_S00_AXI_BASEADDR, A2, B2, C2);
				printf("A - B = %d\n\r", Sum2);
			}
			if(D2 =='*')
			{
				C2 =2;
				Sum2 = test2(XPAR_PROGRAM2_0_S00_AXI_BASEADDR, A2, B2, C2);
				printf("A * B = %d\n\r", Sum2);
			}

			

		printf("Program2 End.\n\r");
	
	
	
	
	int i3; // for loop
	int c3; // clean buffer
	int num3; // get input number
	u32 data3 = 0, parity_bit3 = 0;
	printf("You can input a 32 bits number.\n");
	printf("You will input 8 times, each times input 4 bits.\n");
	printf("Input number in decimal(0~15), please!\r\n");
	for(i=0; i<8; i++){
		//num = -1;
		while(1){
			printf("data[%2d:%2d] = ", 31-i3*4, 28-i3*4);
			scanf("%d", &num3);
			printf(" %d\r\n", num3);
			//while ((c = getchar()) != EOF && c != '\n');
			if(0 <= num3 && num3 <= 15){
				data3 = (data3 << 4) + num3;
				break;
			}
			else{
				printf("Out of range(0~15).\r\n");
			}
		}
	}
	parity_bit = parity_gen(XPAR_PROGRAM3_0_S00_AXI_BASEADDR, data3);
	printf("parity bit = %d\r\n", parity_bit3);
	printf("Program3 End.\n\r");
	
	
	u32	sum4;
	char str4[9];
	char* c4;

	printf("Program4 Start.\n\r");
	printf("Please enter string:\n\r");

	for(int i=0;i<10;i++){
		scanf("%c",&str4[i]);
	}

	c4 = &str4;
	sum4 = 5381;


	while(*c4++){
		sum4 = hash(XPAR_PROGRAM4_0_S00_AXI_BASEADDR,sum4, *c4);
	}

	printf("The result is %d\n\r", sum4);

	printf("Program4 End.\n\r");
	
	
	
	
	printf("Program5 Start.\n\r");
	int A5, B5, C5;
		printf("Input R:");
		scanf("%d", &A5);
		printf(" %d\r\n", A5);
		printf("Input G:");	
		scanf("%d", &B5);
		printf(" %d\r\n", B5);
		printf("Input B:");
		scanf("%d", &C5);
		printf(" %d\r\n", C5);
		
		pro5(XPAR_PROGRAM5_0_S00_AXI_BASEADDR,A5,B5,C5);
		printf("Program5 End.\n\r");
	return 0;
}
