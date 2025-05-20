//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           mculcd.h
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

#ifndef MCULCD_H
#define MCULCD_H

//#include "system.h"
#include "altera_avalon_pio_regs.h"

#define   u8   unsigned char
#define   u16  unsigned int
#define   u32  unsigned long

//LCD重要参数集
typedef struct{
    u16 width;         //LCD 宽度
    u16 height;        //LCD 高度
}_lcd_gui;

//LCD重要参数集
typedef struct
{
    u16 width;         //LCD 宽度
    u16 height;        //LCD 高度
    u16 id ;           //LCD ID
    u8  dir;           //横屏还是竖屏控制：0，竖屏；1，横屏。
    u16 wramcmd;       //开始写gram指令
    u16 setxcmd;       //设置x坐标指令
    u16 setycmd;       //设置y坐标指令
}_lcd_dev;

//extern _lcd_dev lcddev; //管理LCD重要参数
//LCD的画笔颜色和背景色
extern u32  POINT_COLOR;//默认红色
extern u32  BACK_COLOR; //背景颜色.默认为白色

//扫描方向定义
#define L2R_U2D  0      //从左到右,从上到下
#define L2R_D2U  1      //从左到右,从下到上
#define R2L_U2D  2      //从右到左,从上到下
#define R2L_D2U  3      //从右到左,从下到上

#define U2D_L2R  4      //从上到下,从左到右
#define U2D_R2L  5      //从上到下,从右到左
#define D2U_L2R  6      //从下到上,从左到右
#define D2U_R2L  7      //从下到上,从右到左

#define DFT_SCAN_DIR  L2R_U2D  //默认的扫描方向

//*************************************************
//画笔颜色
#define MLCD_WHITE        0XFFFF
#define MLCD_BLACK        0X0000
#define MLCD_BLUE         0X001F
#define MLCD_BRED         0XF81F
#define MLCD_GRED         0XFFE0
#define MLCD_GBLUE        0X07FF
#define MLCD_RED          0XF800
#define MLCD_MAGENTA      0XF81F
#define MLCD_GREEN        0X07E0
#define MLCD_CYAN         0X7FFF
#define MLCD_YELLOW       0XFFE0
#define MLCD_BROWN        0XBC40 //棕色
#define MLCD_BRRED        0XFC07 //棕红色
#define MLCD_GRAY         0X8430 //灰色

#define MLCD_DARKBLUE     0X01CF //深蓝色
#define MLCD_LIGHTBLUE    0X7D7C //浅蓝色
#define MLCD_GRAYBLUE     0X5458 //灰蓝色

#define MLCD_LIGHTGREEN   0X841F //浅绿色
//#define MLCD_LIGHTGRAY    0XEF5B //浅灰色(PANNEL)
#define MLCD_LGRAY        0XC618 //浅灰色(PANNEL),窗体背景色

#define MLCD_LGRAYBLUE    0XA651 //浅灰蓝色(中间层颜色)
#define MLCD_LBBLUE       0X2B12 //浅棕蓝色(选择条目的反色)

//*************************************************
//LCD分辨率设置
#define SSD_HOR_RESOLUTION      800             //LCD水平分辨率
#define SSD_VER_RESOLUTION      480             //LCD垂直分辨率
//LCD驱动参数设置
#define SSD_HOR_PULSE_WIDTH     1               //水平脉宽
#define SSD_HOR_BACK_PORCH      46              //水平前廊
#define SSD_HOR_FRONT_PORCH     210             //水平后廊

#define SSD_VER_PULSE_WIDTH     1               //垂直脉宽
#define SSD_VER_BACK_PORCH      23              //垂直前廊
#define SSD_VER_FRONT_PORCH     22              //垂直前廊
//如下几个参数，自动计算
#define SSD_HT  (SSD_HOR_RESOLUTION+SSD_HOR_BACK_PORCH+SSD_HOR_FRONT_PORCH)
#define SSD_HPS (SSD_HOR_BACK_PORCH)
#define SSD_VT  (SSD_VER_RESOLUTION+SSD_VER_BACK_PORCH+SSD_VER_FRONT_PORCH)
#define SSD_VPS (SSD_VER_BACK_PORCH)

u16  LCD_RD_DATA();
void LCD_WR_CMD(u16 CMD);
void LCD_WR_DATA(u16 DATA);
void LCD_WriteReg(u16 LCD_REG,u16 LCD_REGVALUE);
u16  LCD_ReadReg(u16 LCD_REG);
void MY_LCD_Init(void);                                 //初始化
void LCD_DisplayOn(void);                               //开显示
void LCD_DisplayOff(void);                              //关显示
void LCD_Clear(u32 Color);                              //清屏
void LCD_SetCursor(u16 Xpos, u16 Ypos);                 //设置光标
void LCD_DrawPoint(u16 x,u16 y);                        //画点
void LCD_Fast_DrawPoint(u16 x,u16 y,u32 color);         //快速画点
u32  LCD_ReadPoint(u16 x,u16 y);                        //读点
//void LCD_Draw_Circle(u16 x0,u16 y0,u8 r);               //画圆
void LCD_DrawLine(u16 x1, u16 y1, u16 x2, u16 y2);      //画线
void LCD_DrawRectangle(u16 x1, u16 y1, u16 x2, u16 y2);         //画矩形
void LCD_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u32 color);           //填充单色
void LCD_Color_Fill(u16 sx,u16 sy,u16 ex,u16 ey,u16 *color);    //填充指定颜色
//void LCD_ShowChar(u16 x,u16 y,u8 num,u8 size,u8 mode);          //显示一个字符
void LCD_ShowNum(u16 x,u16 y,u32 num,u8 len,u8 size);           //显示一个数字
void LCD_ShowxNum(u16 x,u16 y,u32 num,u8 len,u8 size,u8 mode);  //显示 数字
//void LCD_ShowString(u16 x,u16 y,u16 width,u16 height,u8 size,u8 mode,u8 *p);  //显示一个字符串,12/16字体

void LCD_WriteRAM_Prepare(void);
void LCD_WriteRAM(u16 RGB_Code);
void LCD_SSD_BackLightSet(u8 pwm);  //SSD1963 背光控制
void LCD_Scan_Dir(u8 dir);          //设置屏扫描方向
void LCD_Display_Dir(u8 dir);       //设置屏幕显示方向
void LCD_Set_Window(u16 sx,u16 sy,u16 width,u16 height);        //设置窗口
void LCD_DisplayPic(u16 x,u16 y,u32 size,const u8 *pic);       //显示图片

#endif /* LCD_H */
