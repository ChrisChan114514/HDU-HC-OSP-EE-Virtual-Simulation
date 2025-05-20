//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           clk_div
// Last modified Date:  2018/11/2 11:12:36
// Last Version:        V1.0
// Descriptions:        时钟分频模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/11/1 8:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
// Modified by:		    正点原子
// Modified date:	    2018/11/2 11:12:36
// Version:			    V1.1
// Descriptions:	    时钟分频模块
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module clk_div(
    input                 clk_50m,
    input                 rst_n  ,
    input  [15:0]         lcd_id , //LCD的ID
    output reg            clk_lcd  //驱动LCD的时钟
);

//reg define 
reg         clk_25m;
reg         clk_8_3m;
reg         clk_12_5m;
reg  [2:0]  div6_cnt;
reg  [1:0]  div4_cnt;

//*****************************************************
//**                    main code
//*****************************************************

//25mhz
always @ (posedge clk_50m or negedge rst_n) begin
    if(!rst_n)
        clk_25m <= 1'b0;
    else
        clk_25m <= ~clk_25m;
end            

//12.5mhz
always @ (posedge clk_50m or negedge rst_n) begin
    if(!rst_n) begin
        clk_12_5m <= 1'b0;
        div4_cnt <= 1'b0;
    end
    else begin
        if(div4_cnt == 'd1) begin
            div4_cnt <= 1'b0;
            clk_12_5m <= ~clk_12_5m;   
        end
        else
            div4_cnt <= div4_cnt + 1'b1;
    end        
end

//8.3mhz
always @ (posedge clk_50m or negedge rst_n) begin
    if(!rst_n) begin
        clk_8_3m <= 1'b0;
        div6_cnt <= 1'b0;
    end
    else begin
        if(div6_cnt == 'd2) begin
            div6_cnt <= 1'b0;
            clk_8_3m <= ~clk_8_3m;   
        end
        else
            div6_cnt <= div6_cnt + 1'b1;
    end        
end

//选择输出的时钟
always @ ( * ) begin
    case(lcd_id)
        16'h4342 : clk_lcd = clk_8_3m;
        16'h7084 : clk_lcd = clk_25m;
        16'h9341 : clk_lcd = clk_12_5m;
        16'h5310 : clk_lcd = clk_25m;
        16'h5510 : clk_lcd = clk_50m;
        16'h1963 : clk_lcd = clk_50m;
        16'h7016 : clk_lcd = clk_50m;
        16'h1018 : clk_lcd = clk_50m;
        default :  clk_lcd = clk_8_3m;
    endcase
end 

endmodule