

/***************************** Include Files *******************************/
#include "pro5.h"

/************************** Function Definitions ***************************/


u32 pro5(UINTPTR baseAddr, u8 R, u8 G, u8 B) {
	u32 sum;
	sum = R+ (G<<8) + (B<<16); 
	PRO5_mWriteReg(baseAddr, 0, sum);
	
	}
