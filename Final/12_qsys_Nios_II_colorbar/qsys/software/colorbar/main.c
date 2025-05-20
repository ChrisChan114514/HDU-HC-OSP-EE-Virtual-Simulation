//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           main.c
// Last modified Date:  2018/12/5 14:36:54
// Last Version:        V1.0
// Descriptions:        写彩条程序C文件
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/12/5 14:37:13
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

#include <stdio.h>
#include "system.h"
#include "io.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include "unistd.h"
#include <string.h>
#include "App/mculcd.h"
#include "sys/alt_cache.h"

extern _lcd_dev lcddev;	//管理LCD重要参数
_lcd_gui lcdgui;

//SDRAM显存的地址
alt_u16 *ram_disp = (alt_u16 *)(SDRAM_BASE + SDRAM_SPAN - 2049000);

int main()
{
    int i,j;
    MY_LCD_Init();              //LCD初始化
    lcdgui.width = lcddev.height;
    lcdgui.height = lcddev.width;
//向sdram中写数据，
   for(i=0;i<lcdgui.width;i++){
      for(j=0;j<lcdgui.height;j++){
        if(j<lcdgui.height/5)
            *(ram_disp++) = 0xf800;     //红色
        else if(j<(lcdgui.height/5*2))
        	*(ram_disp++) = 0xffff;     //白色
        else if(j<(lcdgui.height/5*3))
        	*(ram_disp++) = 0x0;        //黑色
        else if(j<(lcdgui.height/5*4))
            *(ram_disp++) = 0x07e0;     //绿色
        else
            *(ram_disp++) = 0x001f;     //蓝色
        }
   alt_dcache_flush_all();
   }

return 0;
}

