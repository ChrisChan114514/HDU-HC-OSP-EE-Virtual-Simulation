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
	 input            [1:0] key ,
    //seg_led interface
    output    [7:0]  seg_sel  ,       // 数码管位选信号
    output    [7:0]  seg_led          // 数码管段选信号
);

//wire define
wire    [32:0]  data;                 // 数码管显示的数值
wire    [ 7:0]  point;                // 数码管小数点的位置
wire            en;                   // 数码管显示使能信号
wire            sign;                 // 数码管显示数据的符号位

//*****************************************************
//**                    main code
//*****************************************************

//计数器模块，产生数码管需要显示的数据
reg [31:0] time_counter; // 用于计时的计数器
reg [31:0] total_seconds; // 统一的秒数计数器
// 时间调整逻辑
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        time_counter <= 0;
        total_seconds <= 12*3600; // 初始化为12:00:00
    end else begin
        time_counter <= time_counter + 1;
        if (time_counter == 50000000) begin // 每秒钟更新一次时间（假设时钟频率为25MHz）
            time_counter <= 0;
            case (key)
            2'b11: total_seconds <= (total_seconds >= 86400)?0:total_seconds + 3600; // 按下是低电平
            2'b10: total_seconds <= (total_seconds >= 86400)?0:total_seconds + 60;
            2'b01: total_seconds <= (total_seconds >= 86400)?0:total_seconds + 2;
            2'b00: total_seconds <= total_seconds + 1;
            default:total_seconds <= total_seconds + 1;
       	    endcase
//            if (total_seconds == 86400) begin // 一天86400秒
//                total_seconds <= 0;
//            end
        end

    end
end
// 通过组合逻辑将秒数分解为小时、分钟和秒
wire [4:0] hours = total_seconds / 3600;
wire [5:0] minutes = (total_seconds % 3600) / 60;
wire [5:0] seconds = total_seconds % 60;

// 将 hours、minutes 和 seconds 拼接成一个 32 位的信号
assign data = hours*10000+minutes*100+seconds;

assign en=1'b1;
assign point=8'b00010100;
assign sign=1'b0;
//数码管动态显示模块
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