//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           Nios_II_colorbar
// Last modified Date:  2018/10/25 14:56:00
// Last Version:        V1.1
// Descriptions:        Nios II 彩条显示实验
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
// Descriptions:        对正点原子多款屏幕兼容
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module Nios_II_colorbar(

    //时钟和复位接口
    input           sys_clk,      //晶振时钟
    input           sys_rst_n,    //按键复位
    
    //SDRAM 接口
    output          sdram_clk,
    output [12:0]   sdram_addr,
    output [ 1:0]   sdram_ba,
    output          sdram_cas_n,
    output          sdram_cke,
    output          sdram_cs_n,
    inout  [15:0]   sdram_dq,
    output [ 1:0]   sdram_dqm,
    output          sdram_ras_n,
    output          sdram_we_n,

    //EPCS Flash 接口
    output          epcs_dclk,
    output          epcs_sce,
    output          epcs_sdo,
    input           epcs_data0,
    
    //LCD接口
    output          lcd_rst    ,  //LCD复位信号
    output          lcd_bl     ,  //LCD背光控制
    output          lcd_de_cs  ,  //LCD RGB:DE  MCU:CS
    output          lcd_vs_rs  ,  //LCD RGB:VS  MCU:RS
    output          lcd_hs_wr  ,  //LCD RGB:HS  MCU:WR
    output          lcd_clk_rd ,  //LCD RGB:CLK MCU:RD
    inout  [15:0]   lcd_data      //LCD DATA
);

//reg define

//wire define
wire        clk_100m_shift;
wire        sys_clk_100m;
wire        clk_50m_pll;
wire        lcd_clk;
wire        pll_locked;
wire        rst_n;

//读写 SDRAM 桥接信号
wire        bridge_write;
wire        bridge_read;  
wire [15:0] bridge_writedata;
wire [15:0] bridge_readdata;
wire [25:0] bridge_address;
wire [ 9:0] bridge_burstcount;
wire        bridge_waitrequest;             
wire        bridge_readdatavalid;

//source_st_fifo信号
wire [9:0]  source_fifo_wrusedw;

//LCD驱动模块接口信号
wire        lcd_data_req;
wire [15:0] lcd_pixel_data;

//LCD初始化完成
wire        lcd_init_done     ;
wire [15:0] lcd_id            ;
wire        mlcd_cs_n_init    ; 
wire        mlcd_wr_n_init    ;
wire        mlcd_rd_n_init    ;
wire        mlcd_rst_n_init   ;
wire        mlcd_rs_init      ;
wire        mlcd_bl_init      ;
wire        mlcd_data_dir_init;
wire [15:0] mlcd_data_out_init;
wire [15:0] mlcd_data_in_init ;

//*****************************************************
//**                    main code
//*****************************************************

assign rst_n = sys_rst_n & pll_locked ;
assign sdram_clk = clk_100m_shift;

//例化锁相环模块
pll u_pll (
    .inclk0                             (sys_clk   ),
    .areset                             (~sys_rst_n),
    .c0                                 (sys_clk_100m),             //QSYS 系统时钟
    .c1                                 (clk_100m_shift),           //SDRAM 时钟
    .c2                                 (clk_50m_pll),              //LCD 驱动时钟
    .locked                             (pll_locked)
    );

//例化QSYS系统
qsys u_qsys(

    //时钟和复位
    .clk_clk                            (sys_clk_100m),
    .reset_reset_n                      (rst_n),
        
    //EPCS  
    .epcs_flash_dclk                    (epcs_dclk ),
    .epcs_flash_sce                     (epcs_sce  ),
    .epcs_flash_sdo                     (epcs_sdo  ),
    .epcs_flash_data0                   (epcs_data0),
        
    //SDRAM 
    .sdram_addr                         (sdram_addr),
    .sdram_ba                           (sdram_ba),
    .sdram_cas_n                        (sdram_cas_n),
    .sdram_cke                          (sdram_cke),
    .sdram_cs_n                         (sdram_cs_n),
    .sdram_dq                           (sdram_dq),
    .sdram_dqm                          (sdram_dqm),
    .sdram_ras_n                        (sdram_ras_n),
    .sdram_we_n                         (sdram_we_n),

    //读写SDRAM的桥     
    .sdram_bridge_slave_waitrequest     (bridge_waitrequest),
    .sdram_bridge_slave_readdata        (bridge_readdata),
    .sdram_bridge_slave_readdatavalid   (bridge_readdatavalid),
    .sdram_bridge_slave_burstcount      (bridge_burstcount),
    .sdram_bridge_slave_writedata       (bridge_writedata),
    .sdram_bridge_slave_address         (bridge_address),
    .sdram_bridge_slave_write           (bridge_write),
    .sdram_bridge_slave_read            (bridge_read),
    .sdram_bridge_slave_byteenable      (2'b11),
    .sdram_bridge_slave_debugaccess     (),
    
    //PIO 输入输出
    .mlcd_cs_n_export                   (mlcd_cs_n_init),            
    .mlcd_wr_n_export                   (mlcd_wr_n_init),            
    .mlcd_rd_n_export                   (mlcd_rd_n_init),            
    .mlcd_rst_n_export                  (mlcd_rst_n_init),            
    .mlcd_rs_export                     (mlcd_rs_init),            
    .mlcd_bl_export                     (mlcd_bl_init),            
    .lcd_data_in_export                 (mlcd_data_in_init),            
    .lcd_data_out_export                (mlcd_data_out_init),            
    .lcd_data_dir_export                (mlcd_data_dir_init),            
    .lcd_init_done_export               (lcd_init_done),           //LCD初始化完成    
    .lcd_id_export                      (lcd_id)                   //LCD ID     
    );
    
//读写 SDRAM 桥 控制模块
sdram_bridge_control u_bridge_ctrl(
    .clk                                (sys_clk_100m),
    .rst_n                              (rst_n & lcd_init_done),
    
    .bridge_write                       (bridge_write),
    .bridge_read                        (bridge_read),
    .bridge_address                     (bridge_address),
    .bridge_burstcount                  (bridge_burstcount), 
    .bridge_waitrequest                 (bridge_waitrequest),
    .bridge_readdatavalid               (bridge_readdatavalid),
    
    .lcd_id                             (lcd_id),
    .source_fifo_wrusedw                (source_fifo_wrusedw)
    );

// FIFO：缓存SDRAM中读出的数据供LCD读取
fifo u_fifo(
    .wrclk                              (sys_clk_100m),
    .rdclk                              (lcd_clk),
                        
    .wrreq                              (bridge_readdatavalid),
    .data                               (bridge_readdata),
    .wrusedw                            (source_fifo_wrusedw),
                        
    .rdreq                              (lcd_data_req),
    .q                                  (lcd_pixel_data),
    .rdempty                            (),
                        
    .aclr                               (~(rst_n & lcd_init_done))
    );

//RGB LCD 和 MCU LCD驱动
lcd_top  u_lcd_top(
    .clk                                (clk_50m_pll),
    .rst_n                              (rst_n & lcd_init_done),
    .pixel_data                         (lcd_pixel_data),
    .pixel_en                           (lcd_data_req),
    .lcd_clk                            (lcd_clk),

    .lcd_rst                            (lcd_rst),
    .lcd_bl                             (lcd_bl),
    .lcd_de_cs                          (lcd_de_cs),
    .lcd_vs_rs                          (lcd_vs_rs),
    .lcd_hs_wr                          (lcd_hs_wr),
    .lcd_clk_rd                         (lcd_clk_rd),
    .lcd_data                           (lcd_data),
                
    .mlcd_cs_n_init                     (mlcd_cs_n_init),
    .mlcd_wr_n_init                     (mlcd_wr_n_init),
    .mlcd_rd_n_init                     (mlcd_rd_n_init),
    .mlcd_rst_n_init                    (mlcd_rst_n_init),
    .mlcd_rs_init                       (mlcd_rs_init),
    .mlcd_bl_init                       (mlcd_bl_init),
    .mlcd_data_dir_init                 (mlcd_data_dir_init),
    .mlcd_data_out_init                 (mlcd_data_out_init),
    .mlcd_data_in_init                  (mlcd_data_in_init ),
    .lcd_init_done                      (lcd_init_done),
    .lcd_id                             (lcd_id)
    );

endmodule 