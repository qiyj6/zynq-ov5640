/*
 * main.c
 *
 *  Created on: 2019年05月10日
 *      Author: Administrator
 */

//#include "I2C_16bit.h"
//#include "xiicps.h"
#include <stdio.h>
#include "xil_io.h"
#include "xparameters.h"
#include "sleep.h"
#include "xgpiops.h"

#define VDMA_BASEADDR	XPAR_AXI_VDMA_0_BASEADDR

#define VIDEO_BASEADDR0 0x01000000
#define VIDEO_BASEADDR1 0x02000000
#define VIDEO_BASEADDR2 0x03000000

#define H_ACTIVE	1280
#define V_ACTIVE	720
#define H_STRIDE	1280

static XGpioPs psGpioInstancePtr;   //一个就可以作用于所有MIO和EMIO
static int led0 = 54;     //MIO的范围是0-53，第一个EMIO为54
static int led1 = 55;     //MIO的范围是0-53，第一个EMIO为54
static int led2 = 56;     //MIO的范围是0-53，第一个EMIO为54


//XIicPs	Iic;

int led_init(){

		int xStatus;
		XGpioPs_Config * GpioConfigPtr;
		GpioConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_DEVICE_ID);
		xStatus = XGpioPs_CfgInitialize(&psGpioInstancePtr, GpioConfigPtr, GpioConfigPtr->BaseAddr);
	    XGpioPs_SetDirectionPin(&psGpioInstancePtr, led0, 1);
	    XGpioPs_SetOutputEnablePin(&psGpioInstancePtr, led0, 1);

	    XGpioPs_SetDirectionPin(&psGpioInstancePtr, led1, 1);
	    XGpioPs_SetOutputEnablePin(&psGpioInstancePtr, led1, 1);

	    XGpioPs_SetDirectionPin(&psGpioInstancePtr, led2, 1);
	    XGpioPs_SetOutputEnablePin(&psGpioInstancePtr, led2, 1);
}

void led_shine(int led_num){

	XGpioPs_WritePin(&psGpioInstancePtr, led_num, 0);
	sleep(1);
	XGpioPs_WritePin(&psGpioInstancePtr, led_num, 1);
	sleep(1);
}

void main()
{

	led_init();
//	// Initialize OV5640 regesiter
	led_shine(54);
	led_shine(55);
//	led_shine(56);

//	I2C_config_init();



	//Xil_Out32((VDMA_BASEADDR + 0x030), 0x108B);// enable circular mode
	Xil_Out32((VDMA_BASEADDR + 0x030), 0x108B);// enable circular mode
	Xil_Out32((VDMA_BASEADDR + 0x0AC), VIDEO_BASEADDR0);	// start address
	Xil_Out32((VDMA_BASEADDR + 0x0B0), VIDEO_BASEADDR1);	// start address
	Xil_Out32((VDMA_BASEADDR + 0x0B4), VIDEO_BASEADDR2);	// start address
	Xil_Out32((VDMA_BASEADDR + 0x0A8), (H_STRIDE*3));		// h offset (H_STRIDE* 3) bytes
	Xil_Out32((VDMA_BASEADDR + 0x0A4), (H_ACTIVE*3));		// h size (H_ACTIVE * 3) bytes
	Xil_Out32((VDMA_BASEADDR + 0x0A0), V_ACTIVE);			// v size (V_ACTIVE)
		/*****************从DDR读数据设置**********************/
	Xil_Out32((VDMA_BASEADDR + 0x000), 0x8B); 		// enable circular mode
	Xil_Out32((VDMA_BASEADDR + 0x05c), VIDEO_BASEADDR0); 	// start address
	Xil_Out32((VDMA_BASEADDR + 0x060), VIDEO_BASEADDR1); 	// start address
	Xil_Out32((VDMA_BASEADDR + 0x064), VIDEO_BASEADDR2); 	// start address
	Xil_Out32((VDMA_BASEADDR + 0x058), (H_STRIDE*3)); 		// h offset (H_STRIDE * 3) bytes
	Xil_Out32((VDMA_BASEADDR + 0x054), (H_ACTIVE*3)); 		// h size (H_ACTIVE * 3) bytes
	Xil_Out32((VDMA_BASEADDR + 0x050), V_ACTIVE); 			// v size (V_ACTIVE)

	while (1) ;


}

