//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           lcd_signal_sel
// Last modified Date:  2018/11/2 16:20:36
// Last Version:        V1.1
// Descriptions:        LCD信号选择
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/11/2 16:20:36
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module lcd_signal_sel(
    input                   clk               ,  //时钟
    input                   rst_n             ,  //复位，低电平有效
    
    input         [15:0]    pixel_data        ,
    output  reg             pixel_en,      
    //LCD接口                                             
    output  reg             lcd_rst           ,  //LCD复位信号 
    output  reg             lcd_bl            ,  //LCD背光控制 
    output  reg             lcd_de_cs         ,  //LCD RGB:
    output  reg             lcd_vs_rs         ,  //LCD RGB:
    output  reg             lcd_hs_wr         ,  //LCD RGB:    
    output  reg             lcd_clk_rd        ,  //LCD RGB:    
    inout         [15:0]    lcd_data          ,  //LCD DATA    
    //LCD初始化
    input                   mlcd_cs_n_init    ,   
    input                   mlcd_wr_n_init    ,  
    input                   mlcd_rd_n_init    ,  
    input                   mlcd_rst_n_init   ,  
    input                   mlcd_rs_init      ,  
    input                   mlcd_bl_init      ,  
    input                   mlcd_data_dir_init,  
    input         [15:0]    mlcd_data_out_init,  
    output        [15:0]    mlcd_data_in_init ,  
    input                   lcd_init_done     ,
    input         [15:0]    lcd_id            ,
    //RGB LCD
    input                   rlcd_hs           , 
    input                   rlcd_vs           , 
    input                   rlcd_de           , 
    input         [15:0]    rlcd_data         , 
    input                   rlcd_bl           , 
    input                   rlcd_rst          , 
    input                   rlcd_pclk         , 
    output  reg   [15:0]    rlcd_pixel_data   ,
    input                   rlcd_pixel_en     ,
    //MCU LCD
    input                   mlcd_bl           ,       
    input                   mlcd_cs           ,       
    input                   mlcd_rst          ,       
    input                   mlcd_wr           ,       
    input                   mlcd_rd           ,       
    input                   mlcd_rs           ,       
    input         [15:0]    mlcd_data         ,
    output  reg   [15:0]    mlcd_pixel_data   ,
    input                   mlcd_pixel_en  
    );

//reg define
reg      [15:0]   lcd_data_out;
reg               lcd_data_dir;

assign lcd_data = (lcd_data_dir == 1'b1) ? lcd_data_out : {16{1'bz}};
assign mlcd_data_in_init = lcd_data;

//*****************************************************
//**                    main code
//*****************************************************

always @(*) begin
    if(!lcd_init_done) begin
        lcd_rst = mlcd_rst_n_init;
        lcd_bl = mlcd_bl_init;      
        lcd_de_cs = mlcd_cs_n_init; 
        lcd_vs_rs = mlcd_rs_init; 
        lcd_hs_wr = mlcd_wr_n_init; 
        lcd_clk_rd= mlcd_rd_n_init;
        lcd_data_dir = mlcd_data_dir_init;        
        lcd_data_out = mlcd_data_out_init;
        pixel_en = 1'b0;
        mlcd_pixel_data = 16'b0;
        rlcd_pixel_data = 16'b0; 
    end
    else begin
        lcd_data_dir = 1'b1;
        //RGB LCD
        if(lcd_id[15:8] == 8'h43 || lcd_id[15:8] == 8'h70 ||
        lcd_id[15:8]==8'h80 || lcd_id[15:8]==8'h10) begin
            lcd_rst = rlcd_rst;
            lcd_bl = rlcd_bl;
            lcd_de_cs = rlcd_de;
            lcd_vs_rs = rlcd_vs;
            lcd_hs_wr = rlcd_hs;
            lcd_clk_rd = rlcd_pclk;
            lcd_data_out = rlcd_data;
            mlcd_pixel_data = 16'b0;
            rlcd_pixel_data = pixel_data;
            pixel_en = rlcd_pixel_en;
        end 
        else begin    
        //MCU LCD
            lcd_rst = mlcd_rst;
            lcd_bl = mlcd_bl;      
            lcd_de_cs = mlcd_cs; 
            lcd_vs_rs = mlcd_rs; 
            lcd_hs_wr = mlcd_wr; 
            lcd_clk_rd= mlcd_rd;
            lcd_data_out = mlcd_data;
            mlcd_pixel_data = pixel_data;
            rlcd_pixel_data = 16'b0; 
            pixel_en = mlcd_pixel_en;      
        end         
    end    
end

endmodule 
