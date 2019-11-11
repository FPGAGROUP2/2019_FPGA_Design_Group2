/***************************** Include Files *******************************/
#include "program2.h"

/************************** Function Definitions ***************************/


signed test2(UINTPTR baseAddr, signed A, signed B, signed C) {
	signed Sum;
	TEST2_mWriteReg(baseAddr, 0, A);
	TEST2_mWriteReg(baseAddr, 4, B);
	TEST2_mWriteReg(baseAddr, 8, C);
	Sum = TEST2_mReadReg (baseAddr, 12);
	return Sum;
}