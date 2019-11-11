/***************************** Include Files *******************************/
#include "program4.h"
#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xparameters.h"

/************************** Function Definitions ***************************/


u32 hash(UINTPTR baseAddr,u32 hash, u32 c) {
	u32 Sum;
	HASH_mWriteReg(baseAddr, 0, hash);
	HASH_mWriteReg(baseAddr, 4, c);
	Sum = HASH_mReadReg (baseAddr, 8);
	return Sum;
}

