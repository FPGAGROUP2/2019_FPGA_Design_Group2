#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"

void aes_work(u32 mode, u32* datain, u32* key);

int main(){
	printf("Program Start\n\r");

	u32 mode, datain[4], key[4];
	// initialize
	mode = 0;
	for(int i = 0; i < 4; i++){
		datain[i] = 0;
		key[i] = 0;
	}
	// input mode
	printf("mode\n\r");
	printf("encryption(0)/decryption(1): ");
	scanf("%d", &mode);
	printf("%d\n\r", mode);
	// input datain
	printf("datain\n\r");
	for(int i = 0; i < 4; i++){
		printf("datain[%d] = ", i);
		scanf("%x", &datain[i]);
		printf("%08x\n\r", datain[i]);
	}
	// input key
	printf("key\n\r");
	for(int i = 0; i < 4; i++){
		printf("key[%d] = ", i);
		scanf("%x", &key[i]);
		printf("%08x\n\r", key[i]);
	}
	// input data to AES cipher
	printf("dataout\n\r");
	aes_work(mode, datain, key);

	printf("Program End\n\r\n\r");

	return 0;
}

void aes_work(u32 mode, u32* datain, u32* key){
	// mode
	printf("mode\n\r");
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x04, mode);
	// datain
	printf("datain\n\r");
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x08, datain[0]);
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x0C, datain[1]);
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x10, datain[2]);
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x14, datain[3]);
	// key
	printf("key\n\r");
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x18, key[0]);
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x1C, key[1]);
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x20, key[2]);
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x24, key[3]);
	// valid
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR, 0x01);
	Xil_Out32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR, 0x00);
	// done
	u32 ans = 0x00;
	while(ans != 0x01){
		ans = Xil_In32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR);
	}
	// dataout
	u32 dataout;
	dataout = Xil_In32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x04);
	printf("dataout[0] = %08x\n\r", dataout);
	dataout = Xil_In32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x08);
	printf("dataout[1] = %08x\n\r", dataout);
	dataout = Xil_In32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x0C);
	printf("dataout[2] = %08x\n\r", dataout);
	dataout = Xil_In32(XPAR_AES_CIPHER_0_S00_AXI_BASEADDR + 0x10);
	printf("dataout[3] = %08x\n\r", dataout);
}

// XPAR_AES_CIPHER_0_S00_AXI_BASEADDR
