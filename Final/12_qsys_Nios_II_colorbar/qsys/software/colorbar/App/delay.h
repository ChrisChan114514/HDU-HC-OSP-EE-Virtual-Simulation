//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           delay.h
// Last modified Date:  2018/12/5 14:36:54
// Last Version:        V1.0
// Descriptions:        延时头文件
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/12/5 14:37:13
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

#ifndef DELAY_H_
#define DELAY_H_
#include "defines.h"
//#define u8  unsigned char     /* unsigned 8  bits. */
//#define u16 unsigned short    /* unsigned 16 bits. */
//#define u32 unsigned long   /* unsigned 32 bits. */

void delay_ms(u32 n);
void delay_us(u32 n);


#endif /* DELAY_H_ */
