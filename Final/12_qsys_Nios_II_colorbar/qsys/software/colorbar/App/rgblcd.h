//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           ltdc.h
// Last modified Date:  2018/10/10 14:45:27
// Last Version:        V1.0
// Descriptions:        TFTLCD驱动程序的头文件
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/10/10 14:45:31
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

#ifndef LTDC_H
#define LTDC_H

#include "system.h"
#include "altera_avalon_pio_regs.h"

#define   u8   unsigned char
#define   u16  unsigned int
#define   u32  unsigned long

//LCD LTDC重要参数集
/*
typedef struct
{
	u32 pwidth;			//LCD面板的宽度,固定参数,不随显示方向改变,如果为0,说明没有任何RGB屏接入
	u32 pheight;		//LCD面板的高度,固定参数,不随显示方向改变
	u16 hsw;			//水平同步宽度
	u16 vsw;			//垂直同步宽度
	u16 hbp;			//水平后廊
	u16 vbp;			//垂直后廊
	u16 hfp;			//水平前廊
	u16 vfp;			//垂直前廊
	u8 activelayer;		//当前层编号:0/1
	u8 dir;				//0,竖屏;1,横屏;
	u16 width;			//LCD宽度
	u16 height;			//LCD高度
	u32 pixsize;		//每个像素所占字节数
}_ltdc_dev;
//extern _ltdc_dev lcdltdc;							//管理LCD LTDC参数

*/

#define LCD_PIXFORMAT_ARGB8888		0X00			//ARGB8888格式
#define LCD_PIXFORMAT_RGB888 		0X01			//ARGB8888格式
#define LCD_PIXFORMAT_RGB565 		0X02 			//ARGB8888格式
#define LCD_PIXFORMAT_ARGB1555		0X03			//ARGB8888格式
#define LCD_PIXFORMAT_ARGB4444		0X04			//ARGB8888格式
#define LCD_PIXFORMAT_L8			0X05			//ARGB8888格式
#define LCD_PIXFORMAT_AL44			0X06			//ARGB8888格式
#define LCD_PIXFORMAT_AL88 			0X07			//ARGB8888格式

///////////////////////////////////////////////////////////////////////
//用户修改配置部分:

//定义颜色像素格式,一般用RGB565
#define LCD_PIXFORMAT				LCD_PIXFORMAT_RGB565
//定义默认背景层颜色
#define LTDC_BACKLAYERCOLOR			0X00000000
//LCD帧缓冲区首地址,这里定义在SDRAM里面.
#define LCD_FRAME_BUF_ADDR			0XC0000000


/*
//void LTDC_Switch(u8 sw);					//LTDC开关
//void LTDC_Layer_Switch(u8 layerx,u8 sw);	//层开关
void LTDC_Select_Layer(u8 layerx);			//层选择
void LTDC_Display_Dir(u8 dir);				//显示方向控制
void LTDC_Draw_Point(u16 x,u16 y,u32 color);//画点函数
u32 LTDC_Read_Point(u16 x,u16 y);			//读点函数
void LTDC_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u32 color);			//矩形单色填充函数
void LTDC_Color_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u16 *color);	//矩形彩色填充函数
void LTDC_Clear(u32 color);					//清屏函数
u8 LTDC_Clk_Set(u32 pllsain,u32 pllsair,u32 pllsaidivr);//LTDC时钟配置
void LTDC_Layer_Window_Config(u8 layerx,u16 sx,u16 sy,u16 width,u16 height);//LTDC层窗口设置
void LTDC_Layer_Parameter_Config(u8 layerx,u32 bufaddr,u8 pixformat,u8 alpha,u8 alpha0,u8 bfac1,u8 bfac2,u32 bkcolor);//LTDC基本参数设置
*/
u16 LTDC_PanelID_Read(void);				//LCD ID读取函数
void LTDC_Init(void);						//LTDC初始化函数
#endif







