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

    //seg_led interface
    output    [7:0]  seg_sel  ,       // 数码管位选信号
    output    [7:0]  seg_led          // 数码管段选信号
);

//wire define
reg    [32:0]  data;                 // 数码管显示的数值
wire    [ 7:0]  point;                // 数码管小数点的位置
wire            en;                   // 数码管显示使能信号
wire            sign;                 // 数码管显示数据的符号位

//*****************************************************
//**                    main code
//*****************************************************

//计数器模块，产生数码管需要显示的数据
reg [25:0] div_counter; // 分频计数器
reg [5:0] counter; // 6位计数器，范围0-63

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        div_counter <= 26'd0;
        counter <= 6'd1;
    end else if (div_counter == 26'd25_000_000) begin // 50MHz时钟，0.5秒分频
        div_counter <= 26'd0;
        if (counter == 6'd37)
            counter <= 6'd1;
        else
            counter <= counter + 1'b1;
    end else begin
        div_counter <= div_counter + 1'b1;
    end
end

// 使用 case 语句为 data 赋值
always @(*) begin
    case (counter)
        6'd0:  data = 32'd00000000;
        6'd1:  data = 32'd01000000;
        6'd2:  data = 32'd02000000;
        6'd3:  data = 32'd03000000;
        6'd4:  data = 32'd04000000;
        6'd5:  data = 32'd05000000;
        6'd6:  data = 32'd06000000;
        6'd7:  data = 32'd07000000;
        6'd8:  data = 32'd08000000;
        6'd9:  data = 32'd09000000;
        6'd10: data = 32'd0100_0000;
        6'd11: data = 32'd0100_1000;
        6'd12: data = 32'd0100_2000;
        6'd13: data = 32'd0100_3000;
        6'd14: data = 32'd0100_4000;
        6'd15: data = 32'd0100_5000;
        6'd16: data = 32'd0100_6000;
        6'd17: data = 32'd0100_7000;
        6'd18: data = 32'd0100_8000;
        6'd19: data = 32'd0100_9000;
        6'd20: data = 32'd0200_0000;
        6'd21: data = 32'd0200_1000;
        6'd22: data = 32'd0200_2000;
        6'd23: data = 32'd0200_3000; // 计数到23时，显示 00030020
        6'd24: data = 32'd0200_4000;
        6'd25: data = 32'd0200_5000;
        6'd26: data = 32'd0200_6000;
        6'd27: data = 32'd0200_7000;
        6'd28: data = 32'd0200_8000;
        6'd29: data = 32'd0200_9000;
        6'd30: data = 32'd0300_0000;
        6'd31: data = 32'd0300_1000;
        6'd32: data = 32'd0300_2000;
        6'd33: data = 32'd0300_3000;
        6'd34: data = 32'd0300_4000;
        6'd35: data = 32'd0300_5000;
        6'd36: data = 32'd0300_6000;
        6'd37: data = 32'd0300_7000;
        6'd38: data = 32'd0300_8000;
        default: data = 32'h00000000; // 保险默认值
    endcase
end


assign en=1'b1;
assign point=6'b000000;
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