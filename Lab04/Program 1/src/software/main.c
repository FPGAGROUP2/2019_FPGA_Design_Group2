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
	printf("Program Start.\r\n");
	u32 data = 0;
	int num = 0;
	for(int i = 0; i < 8; i++){
		printf("Number %d = ", i+1);
		scanf("%d", &num);
		printf("%d\r\n", num);
		data = (data << 4) + num;
	}
	printf("Your input: %x\r\n", data);
	u32 sorting_result = sorting(XPAR_SORTING_0_S00_AXI_BASEADDR, data);
	printf("%x\r\n", sorting_result);
	printf("Program End.\r\n");
	return 0;
}
