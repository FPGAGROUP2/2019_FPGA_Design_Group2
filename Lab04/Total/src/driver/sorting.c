/***************************** Include Files *******************************/
#include "program1.h"

/************************** Function Definitions ***************************/
u32 sorting(UINTPTR BaseAddr, u32 data){
	SORTING_mWriteReg(BaseAddr, 4, 0);
	SORTING_mWriteReg(BaseAddr, 0, data);
	SORTING_mWriteReg(BaseAddr, 4, 1);

	u32 sorting_result = SORTING_mReadReg(BaseAddr, 4);

	return sorting_result;
}