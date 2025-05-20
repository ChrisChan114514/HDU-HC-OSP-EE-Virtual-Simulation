//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           mculcd.c
// Last modified Date:  2018/10/10 14:36:54
// Last Version:        V1.0
// Descriptions:        TFTLCD的驱动程序C文件
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/10/10 14:37:13
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

#include <unistd.h>
//#include "font.h"
#include "mculcd.h"
#include "rgblcd.h"
#include "system.h"
extern _lcd_dev lcddev;	//管理LCD重要参数

//读取面板参数
//PG6=R7(M0);PI2=G7(M1);PI7=B7(M2);
//M2:M1:M0
//0 :0 :0	//4.3寸480*272 RGB屏,ID=0X4342
//0 :0 :1	//7寸800*480 RGB屏,ID=0X7084
//0 :1 :0	//7寸1024*600 RGB屏,ID=0X7016
//1 :0 :1	//10.1寸1280*800 RGB屏,ID=0X1018
//返回值:LCD ID:0,非法;其他值,ID;
u16 LTDC_PanelID_Read(void)
{
	u8 idx=0;
	u16 read_data = 0;

	IOWR_ALTERA_AVALON_PIO_DATA(PIO_LCD_DATA_DIR_BASE,0);          // mlcd_data_dir=0 为输入
	delay_ms(50);
	read_data = IORD_ALTERA_AVALON_PIO_DATA(PIO_LCD_DATA_IN_BASE); //获取lcd_data数据
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_LCD_DATA_DIR_BASE,1);          // mlcd_data_dir=0 为输出
	idx=(read_data & 0x8000)>>15;		//读取M0
	idx |= (read_data & 0x0400)>>9;      //读取M1
	idx |= (read_data & 0x0010)>>2;      //读取M2
	switch(idx)
	{
		case 0:return 0X4342;		//4.3寸屏,480*272分辨率
		case 1:return 0X7084;		//7寸屏,800*480分辨率
		case 2:return 0X7016;		//7寸屏,1024*600分辨率
		case 5:return 0X1018; 		//10.1寸屏,1280*800分辨率
		default:return 0;
	}
}


//LTDC初始化函数
void LTDC_Init(void)
{
	u16 lcdid=0;
	lcdid=LTDC_PanelID_Read();  //读取LCD面板ID
	if(lcdid==0X4342)
	{
		lcddev.width=480;	    //面板宽度,单位:像素
		lcddev.height=272;		//面板高度,单位:像素
	}else if(lcdid==0X7084)
	{
		lcddev.width=800;	    //面板宽度,单位:像素
		lcddev.height=480;		//面板高度,单位:像素
	}else if(lcdid==0X7016)
	{
		lcddev.width=1024;		//面板宽度,单位:像素
		lcddev.height=600;		//面板高度,单位:像素
	}else if(lcdid==0X7018)
	{
		lcddev.width=1280;		//面板宽度,单位:像素
		lcddev.height=800;		//面板高度,单位:像素
		//其他参数待定.
	}else if(lcdid==0X8016)
	{
		lcddev.width=1024;		//面板宽度,单位:像素
		lcddev.height=600;		//面板高度,单位:像素
		//其他参数待定.
	}else if(lcdid==0X1018)	    //10.1寸1280*800 RGB屏
	{
		lcddev.width=1280;		//面板宽度,单位:像素
		lcddev.height=800;		//面板高度,单位:像素
	}
}



 






















