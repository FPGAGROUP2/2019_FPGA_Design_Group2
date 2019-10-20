#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"

#define SW_DEVICE_ID  XPAR_GPIO_0_DEVICE_ID

#define LED_DELAY     10000000
XGpio SW_Gpio;




int main() {
	int SW_Status;
	u32 sw_data;
	/* Initialize the GPIO driver */
	SW_Status = XGpio_Initialize(&SW_Gpio, SW_DEVICE_ID);
	if (SW_Status) {
		xil_printf("Gpio Initialization Failed\r\n");
		return XST_FAILURE;
	}
	/* Set the direction for all signals as inputs except the LED output */
	XGpio_SetDataDirection(&SW_Gpio, 1, 0x0f);
	int status = 0;
	while (1) {
			sw_data = XGpio_DiscreteRead(&SW_Gpio, 1);

			/* Set the LED to High */
			if(sw_data == 0 && status != 1)
			{	
				int hash_num1;
				hash_num1 = (56352*56352)%100000;
				
				xil_printf("The ID is E24056352 , coding...\n");
				xil_printf("%d\n",hash_num1);
				xil_printf("switches data = %d\r\n", sw_data);
				status = 1;
			}
			if(sw_data == 1 && status != 2)
			{
				int hash_num2;
				hash_num2 = (56904*56904)%100000;
				
				xil_printf("The ID is E24056904 , coding...\n");
				xil_printf("%d\n",hash_num2);
				xil_printf("switches data = %d\r\n", sw_data);
				status = 2;
			}
			if(sw_data == 2 && status != 3)
			{
				int hash_num3;
				hash_num3 = (51904*51904)%100000;
				
				xil_printf("The ID is E24051904 , coding...\n");
				xil_printf("%d\n",hash_num3);
				xil_printf("switches data = %d\r\n", sw_data);
				status = 3;
			}
			if(sw_data == 3 && status != 4)
			{
				xil_printf("switches data = %d\r\n", sw_data);
				xil_printf("Recipient Unknown\n");
				status = 4;
			}
			for (int Delay = 0; Delay < LED_DELAY; Delay++);
		}

		xil_printf("Successfully ran Gpio Example\r\n");
		return XST_SUCCESS;
}