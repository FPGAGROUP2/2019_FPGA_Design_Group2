/*
 * main.c
 *
 *  Created on: 2019¦~10¤ë31¤é
 *      Author: Ian
 */

#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"
#include "parity_gen.h"

int main(){
	int i; // for loop
	int c; // clean buffer
	int num; // get input number
	u32 data = 0, parity_bit = 0;
	printf("You can input a 32 bits number.\n");
	printf("You will input 8 times, each times input 4 bits.\n");
	printf("Input number in decimal(0~15), please!\r\n");
	for(i=0; i<8; i++){
		//num = -1;
		while(1){
			printf("data[%2d:%2d] = ", 31-i*4, 28-i*4);
			scanf("%d", &num);
			printf(" %d\r\n", num);
			//while ((c = getchar()) != EOF && c != '\n');
			if(0 <= num && num <= 15){
				data = (data << 4) + num;
				break;
			}
			else{
				printf("Out of range(0~15).\r\n");
			}
		}
	}
	parity_bit = parity_gen(XPAR_PARITY_GEN_0_S00_AXI_BASEADDR, data);
	printf("parity bit = %d\r\n", parity_bit);
	return 0;
}
