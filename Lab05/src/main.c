#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"

void write_data(u32 address, u32 data);
u32 read_data(u32 address);

int main(){
	printf("-------------------------\n\r");

	//---------- cmd ----------//
	int	cmd = 1;
	write_data(0x00000001, cmd);
	//---------- matrix A (A11 A12 A21 A22) ----------//
	int A11 = 4;	int A12 = 3;
	int A21 = 1;	int A22 = 2;
	// A11
	write_data(0x00000002, A11);
	// A12
	write_data(0x00000003, A12);
	// A21
	write_data(0x00000004, A21);
	// A22
	write_data(0x00000005, A22);
	//---------- matrix B (B11 B12 B21 B22) ----------//
	int B11 = -1;	int B12 = -1;
	int B21 = -1;	int B22 = -1;
	// B11
	write_data(0x00000006, B11);
	// B12
	write_data(0x00000007, B12);
	// B21
	write_data(0x00000008, B21);
	// B22
	write_data(0x00000009, B22);
	//---------- write valid ----------//
	write_data(0x00000000, 0x00000001);

	//---------- wait calculation finish (done) ----------//
	u32 done = 0x00000000;
	while(done != 0x00000002){
		done = read_data(0x00000000);
	}
	//---------- get form ----------//
	u32 form = read_data(0x00000001);
	//---------- matrix C (C11 C12 C21 C22) ----------//
	u32 data0, data1;
	int C11, C12, C21, C22;
	int det;
	printf("answer\n\r");
	if(form == 1){ // matrix
		// C11
		data0 = read_data(0x00000002);
		data1 = read_data(0x00000003);
		C11 = (65535 << 16)*(data1 >> 7) + (data1 << 8) + data0;
		// C12
		data0 = read_data(0x00000004);
		data1 = read_data(0x00000005);
		C12 = (65535 << 16)*(data1 >> 7) + (data1 << 8) + data0;
		// C21
		data0 = read_data(0x00000006);
		data1 = read_data(0x00000007);
		C21 = (65535 << 16)*(data1 >> 7) + (data1 << 8) + data0;
		// C22
		data0 = read_data(0x00000008);
		data1 = read_data(0x00000009);
		C22 = (65535 << 16)*(data1 >> 7) + (data1 << 8) + data0;
		// display the matrix
		printf("%d\t%d\n\r", C11, C12);
		printf("%d\t%d\n\r", C21, C22);
	}
	else{ // constant // determinant
		data0 = read_data(0x00000002);
		data1 = read_data(0x00000003);
		det = (65535 << 16)*(data1 >> 7) + (data1 << 8) + data0;
		printf("%d\n\r", det);
	}

	printf("-------------------------\n\r");

    return 0;
}

void write_data(u32 address, u32 data){
	u32 ans;

    Xil_Out32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR + 0x00000004, 0x00000002);	//cmd	write
    Xil_Out32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR + 0x00000008, data);			//data_in
    Xil_Out32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR + 0x0000000C, address);		//address
    Xil_Out32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR, 0x00000001);					//cmd valid
    Xil_Out32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR, 0x00000000);					//cmd no valid
    ans = 0x00000000;
    while(ans != 0x00000001){
    	ans = Xil_In32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR);					//waiting for cmd done
    }
}

u32 read_data(u32 address){
	u32 ans;
	u32 data;

    Xil_Out32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR + 0x00000004, 0x00000001);	//cmd	read
    Xil_Out32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR + 0x0000000C, address);		//address
    Xil_Out32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR, 0x00000001);					//cmd valid
    Xil_Out32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR, 0x00000000);					//cmd no valid
    ans = 0x00000000;
    while(ans != 0x00000001){
    	ans = Xil_In32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR);					//waiting for cmd done
    }
    data = Xil_In32(XPAR_MATRIX_CALC_0_S00_AXI_BASEADDR + 0x00000004);			//data_out
    return data;
}
