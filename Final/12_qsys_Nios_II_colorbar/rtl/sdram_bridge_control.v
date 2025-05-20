//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           sdram_bridge_control
// Last modified Date:  2018/10/25 14:56:00
// Last Version:        V1.1
// Descriptions:        pipeline桥读SDRAM数据
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/10/11 8:24:48
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
// Modified by:         正点原子
// Modified date:       2018/10/25 14:56:00
// Version:             V1.1
// Descriptions:        pipeline桥读SDRAM数据
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module sdram_bridge_control(
    input               clk                   ,
    input               rst_n                 ,
    
    output  reg         bridge_write          ,
    output  reg         bridge_read           ,
    output  reg  [25:0] bridge_address        ,
    output  reg  [9:0]  bridge_burstcount     ,
    input               bridge_waitrequest    ,
    input               bridge_readdatavalid  ,
    
    input        [15:0] lcd_id                ,
    input        [ 9:0] source_fifo_wrusedw
    );

//parameter define

//SDRAM 存储容量 = 2^13(row)*2^9(col)*4(bank)*2(byte)
parameter SDRAM_SPAN = 33554432;

//LCD存储图像地址参数设置（800*480）
parameter  sdram_addr_start   = SDRAM_SPAN - 2048000 - 1000;     //sdram显存起始地址;
parameter  sdram_addr_end_320_240  = sdram_addr_start + 153600;  //结束地址（320*240）
parameter  sdram_addr_end_480_272  = sdram_addr_start + 261120;  //结束地址（480*272）
parameter  sdram_addr_end_480_320  = sdram_addr_start + 307200;  //结束地址（480*320）
parameter  sdram_addr_end_800_480  = sdram_addr_start + 768000;  //结束地址（800*480）
parameter  sdram_addr_end_1024_600 = sdram_addr_start + 1228800; //结束地址（1024*600）
parameter  sdram_addr_end_1280_800 = sdram_addr_start + 2048000; //结束地址（1280*800）
parameter  burstcount            = 10'd512;                      //SDRAM 突发长度
parameter  burst_addr            = 11'd1024 ;                    //一次突发的地址长度
parameter  usedw_wr              = 512;                          //读fifo的数据深度

//reg define
reg  [25:0] address_rd;       //读fifo端读取数据的sdram地址
reg  [9:0]  cnt_burst;        //计数一次突发读数据过程中已读取的个数
reg         step;             //step
reg         step_1;
reg  [25:0] sdram_addr_end;   //sdram显存结束地址

//wire define 
wire burst_start;             //开始突发标志

//*****************************************************
//**                    main code
//*****************************************************

//采集step上升沿信号，标志着突发传输指令已发出
assign burst_start = (~step_1 ) & step;

//寄存step信号，用于边沿捕获
always @ (posedge clk  or negedge rst_n ) begin 
    if(!rst_n ) 
        step_1 <= 1'b0;
    else    
        step_1 <=  step;  
end

always @ (*) begin
    case(lcd_id)
        16'h4342 : sdram_addr_end = sdram_addr_end_480_272 ;
        16'h7084 : sdram_addr_end = sdram_addr_end_800_480 ;
        16'h7016 : sdram_addr_end = sdram_addr_end_1024_600;
        16'h1018 : sdram_addr_end = sdram_addr_end_1280_800;
        16'h9341 : sdram_addr_end = sdram_addr_end_320_240 ;
        16'h5310 : sdram_addr_end = sdram_addr_end_480_320 ;
        16'h5510 : sdram_addr_end = sdram_addr_end_480_320 ;
        16'h1963 : sdram_addr_end = sdram_addr_end_480_320 ;
    default  : sdram_addr_end = sdram_addr_end_480_272 ;
    endcase 
end

//读SDRAM的地址
always @ (posedge clk or negedge rst_n ) begin
    if(!rst_n )
        address_rd <= sdram_addr_start;
    else if (address_rd == sdram_addr_end) 
            address_rd <= sdram_addr_start;
    else if (burst_start)
        address_rd <= address_rd + burst_addr; 
end

//计数突发读出的数据个数
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        cnt_burst <= 10'b0;
    else if (cnt_burst == burstcount) 
        cnt_burst <= 10'b0;
    else if (bridge_readdatavalid)
        cnt_burst <= cnt_burst + 1'b1;
end 

//fifo中的数据量低于512时，从sdram中读数据
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        step                <= 1'b0;   
        bridge_read         <= 1'b0;         
        bridge_write        <= 1'b0;
        bridge_address      <= 26'b0;
        bridge_burstcount   <= 10'b0;
    end 
    else if((! bridge_waitrequest) && (source_fifo_wrusedw < usedw_wr) 
            &&(cnt_burst == 10'd0) ) begin  //从sdram读数据
        case(step)    
            1'b0: begin 
                step                <= 1'b1;
                bridge_read         <= 1'b1;   
                bridge_write        <= 1'b0;
                bridge_address      <= address_rd;
                bridge_burstcount   <= burstcount;
            end 
            1'b1: begin
                bridge_read       <= 1'b0;   
                bridge_address    <= 26'b0;
                bridge_burstcount <= 10'b0;
            end
        default: ;         
        endcase   
    end 
    else if (cnt_burst == burstcount)  
        step <= 1'b0;
end

endmodule       