/*
 * rgb_ctrl.c
 *
 *  Created on: 2019¦~10¤ë14¤é
 *      Author: Ian
 */


#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"

#define RGB_DEVICE_ID XPAR_GPIO_0_DEVICE_ID

#define TIME 16000

XGpio RGB_Gpio;

int main(){
	int RGB_status;
	int r, g, b; // time of R, G, B
	u32 rgb_data;

	/* Initialize the GPIO driver */
	RGB_status = XGpio_Initialize(&RGB_Gpio, RGB_DEVICE_ID);
	if (RGB_status != XST_SUCCESS) {
		xil_printf("Gpio Initialization Failed\r\n");
		return XST_FAILURE;
	}

	/* Set the direction for all signals as inputs except the LED output */
	XGpio_SetDataDirection(&RGB_Gpio, 1, 0x00);

	while(1){
		// RED
		for(int time = 0; time < TIME; time++){
			for(int counter = 0; counter < 256; counter++){
				r = 1;
				g = 0;
				b = 0;
				rgb_data = r*4 + g*2 + b;
				XGpio_DiscreteWrite(&RGB_Gpio, 1, rgb_data);
			}
		}
		// ORANGE
		for(int time = 0; time < TIME; time++){
			for(int counter = 0; counter < 256; counter++){
				r = 1;
				g = (counter < 32);
				b = 0;
				rgb_data = r*4 + g*2 + b;
				XGpio_DiscreteWrite(&RGB_Gpio, 1, rgb_data);
			}
		}
		// YELLOW
		for(int time = 0; time < TIME; time++){
			for(int counter = 0; counter < 256; counter++){
				r = 1;
				g = 1;
				b = 0;
				rgb_data = r*4 + g*2 + b;
				XGpio_DiscreteWrite(&RGB_Gpio, 1, rgb_data);
			}
		}
		// GREEN
		for(int time = 0; time < TIME; time++){
			for(int counter = 0; counter < 256; counter++){
				r = 0;
				g = 1;
				b = 0;
				rgb_data = r*4 + g*2 + b;
				XGpio_DiscreteWrite(&RGB_Gpio, 1, rgb_data);
			}
		}
		// BLUE
		for(int time = 0; time < TIME; time++){
			for(int counter = 0; counter < 256; counter++){
				r = 0;
				g = 0;
				b = 1;
				rgb_data = r*4 + g*2 + b;
				XGpio_DiscreteWrite(&RGB_Gpio, 1, rgb_data);
			}
		}
		// INDIGO
		for(int time = 0; time < TIME; time++){
			for(int counter = 0; counter < 256; counter++){
				r = (counter < 32);
				g = 0;
				b = 1;
				rgb_data = r*4 + g*2 + b;
				XGpio_DiscreteWrite(&RGB_Gpio, 1, rgb_data);
			}
		}
		// VIOLET
		for(int time = 0; time < TIME; time++){
			for(int counter = 0; counter < 256; counter++){
				r = (counter < 127);
				g = 0;
				b = 1;
				rgb_data = r*4 + g*2 + b;
				XGpio_DiscreteWrite(&RGB_Gpio, 1, rgb_data);
			}
		}
	}
	return XST_SUCCESS;
}
