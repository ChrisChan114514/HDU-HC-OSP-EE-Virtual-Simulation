//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           top_seg_led
// Last modified Date:  2018年5月16日17:30:50
// Last Version:        V1.0
// Descriptions:        数码管动态显示实验顶层模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018年5月16日17:30:56
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module top_seg_led(
    //global clock
    input            sys_clk  ,       // 全局时钟信号
    input            sys_rst_n,       // 复位信号（低有效）
	 
    input [3:0] A,
    input [3:0] B,

    //seg_led interface
    output    [7:0]  seg_sel  ,       // 数码管位选信号
    output    [7:0]  seg_led          // 数码管段选信号
	 
);

//wire define
wire    [32:0]  data;                 // 数码管显示的数值
wire    [ 7:0]  point;                // 数码管小数点的位置
wire            en;                   // 数码管显示使能信号
wire            sign;                 // 数码管显示数据的符号位
wire [7:0] Result;

//*****************************************************
//**                    main code
//*****************************************************


assign en=1'b1;
assign point=6'b000000;
assign sign=1'b0;
assign Result = A * B; // 直接使用乘法运算符

assign data=Result[7]*10000000+Result[6]*1000000+Result[5]*100000+Result[4]*10000+Result[3]*1000+Result[2]*100+Result[1]*10+Result[0];
//数码管动态显示块
seg_led u_seg_led(
    .clk           (sys_clk  ),       // 时钟信号
    .rst_n         (sys_rst_n),       // 复位信号

    .data          (data     ),       // 显示的数值
    .point         (point    ),       // 小数点具体显示的位置,高电平有效
    .en            (en       ),       // 数码管使能信号
    .sign          (sign     ),       // 符号位，高电平显示负号(-)
    
    .seg_sel       (seg_sel  ),       // 位选
    .seg_led       (seg_led  )        // 段选
);

//assign seg_led[7:0]=8'b10110000;
//assign seg_sel[5:0]=8'b101010;

endmodule