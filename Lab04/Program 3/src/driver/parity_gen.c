

/***************************** Include Files *******************************/
#include "parity_gen.h"

/************************** Function Definitions ***************************/
u32 parity_gen(UINTPTR BaseAddr, u32 data){
	u32 parity_bit;
	PARITY_GEN_mWriteReg(BaseAddr, 0, data);
	parity_bit = PARITY_GEN_mReadReg(BaseAddr, 4);
	return /*PARITY_GEN_mReadReg(BaseAddr, 4); /*/parity_bit;
}
