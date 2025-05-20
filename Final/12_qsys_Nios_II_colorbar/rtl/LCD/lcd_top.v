//****************************************Copyright (c)***********************************//
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取FPGA & STM32资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           lcd_top
// Last modified Date:  2018/11/2 16:20:36
// Last Version:        V1.1
// Descriptions:        
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2018/11/2 16:20:36
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module lcd_top(
    input              clk               ,  //时钟50Mhz
    input              rst_n             ,  //复位，低电平有效  
    input    [15:0]    pixel_data        ,
    output             pixel_en          ,
    output             lcd_clk           ,                       
    //LCD接口                              
    output             lcd_rst           ,  //LCD复位信号
    output             lcd_bl            ,  //LCD背光控制
    output             lcd_de_cs         ,  //LCD RGB:DE  MCU:CS
    output             lcd_vs_rs         ,  //LCD RGB:VS  MCU:RS
    output             lcd_hs_wr         ,  //LCD RGB:HS  MCU:WR
    output             lcd_clk_rd        ,  //LCD RGB:CLK MCU:RD
    inout      [15:0]  lcd_data          ,  //LCD DATA
    //LCD初始化
    input              mlcd_cs_n_init    ,   
    input              mlcd_wr_n_init    ,  
    input              mlcd_rd_n_init    ,  
    input              mlcd_rst_n_init   ,  
    input              mlcd_rs_init      ,  
    input              mlcd_bl_init      ,  
    input              mlcd_data_dir_init,  
    input    [15:0]    mlcd_data_out_init,  
    output   [15:0]    mlcd_data_in_init ,  
    input              lcd_init_done     ,
    input    [15:0]    lcd_id             
    );

//wire define
wire          rlcd_hs  ;      
wire          rlcd_vs  ;      
wire          rlcd_de  ;      
wire  [15:0]  rlcd_data;      
wire          rlcd_bl  ;      
wire          rlcd_rst ;      
wire          rlcd_pclk;      
wire  [15:0]  rlcd_pixel_data;
wire          rlcd_pixel_en  ;

wire          mlcd_bl ; 
wire          mlcd_cs ; 
wire          mlcd_rst; 
wire          mlcd_wr ; 
wire          mlcd_rd ; 
wire          mlcd_rs ; 
wire  [15:0]  mlcd_data;  
wire  [15:0]  mlcd_pixel_data;
wire          mlcd_pixel_en;

//*****************************************************
//**                    main code
//*****************************************************

lcd_signal_sel u_lcd_signal_sel(
    .clk                 (clk),
    .rst_n               (rst_n), 
    .pixel_data          (pixel_data),   
    .pixel_en            (pixel_en),
    //LCD 接口  
    .lcd_rst             (lcd_rst         ),
    .lcd_bl              (lcd_bl          ),
    .lcd_de_cs           (lcd_de_cs       ),
    .lcd_vs_rs           (lcd_vs_rs       ),
    .lcd_hs_wr           (lcd_hs_wr       ),
    .lcd_clk_rd          (lcd_clk_rd      ),
    .lcd_data            (lcd_data        ),    
    //LCD初始化
    .mlcd_cs_n_init      (mlcd_cs_n_init    ),
    .mlcd_wr_n_init      (mlcd_wr_n_init    ),
    .mlcd_rd_n_init      (mlcd_rd_n_init    ),
    .mlcd_rst_n_init     (mlcd_rst_n_init   ),
    .mlcd_rs_init        (mlcd_rs_init      ),
    .mlcd_bl_init        (mlcd_bl_init      ),
    .mlcd_data_dir_init  (mlcd_data_dir_init),
    .mlcd_data_out_init  (mlcd_data_out_init),
    .mlcd_data_in_init   (mlcd_data_in_init ),
    .lcd_init_done       (lcd_init_done     ),
    .lcd_id              (lcd_id            ),
    //RGB LCD         
    .rlcd_hs             (rlcd_hs        ),
    .rlcd_vs             (rlcd_vs        ),
    .rlcd_de             (rlcd_de        ),
    .rlcd_data           (rlcd_data      ),
    .rlcd_bl             (rlcd_bl        ),
    .rlcd_rst            (rlcd_rst       ),
    .rlcd_pclk           (rlcd_pclk      ),
    .rlcd_pixel_data     (rlcd_pixel_data),
    .rlcd_pixel_en       (rlcd_pixel_en  ),
    //MCU LCD
    .mlcd_bl             (mlcd_bl        ),
    .mlcd_cs             (mlcd_cs        ),
    .mlcd_rst            (mlcd_rst       ),
    .mlcd_wr             (mlcd_wr        ),
    .mlcd_rd             (mlcd_rd        ),
    .mlcd_rs             (mlcd_rs        ),
    .mlcd_data           (mlcd_data      ),
    .mlcd_pixel_data     (mlcd_pixel_data),
    .mlcd_pixel_en       (mlcd_pixel_en  )
    );

//RGB LCD驱动    
rlcd_driver u_rlcd_driver(                      
    .lcd_clk             (lcd_clk),    
    .sys_rst_n           (rst_n & lcd_init_done),    
     
    .lcd_hs              (rlcd_hs),       
    .lcd_vs              (rlcd_vs),       
    .lcd_de              (rlcd_de),       
    .lcd_bl              (rlcd_bl),
    .lcd_rst             (rlcd_rst),
    .lcd_pclk            (rlcd_pclk),
    .lcd_data            (rlcd_data),
         
    .data_req            (rlcd_pixel_en),
    .pixel_xpos          (), 
    .pixel_ypos          (),
    .pixel_data          (rlcd_pixel_data),    
    .lcd_id              (lcd_id)
    ); 

//MCU LCD 驱动
mlcd_driver  u_mlcd_driver(
    .clk                 (lcd_clk      ),
    .rst_n               (rst_n        ),
    .mlcd_bl             (mlcd_bl      ),
    .mlcd_cs             (mlcd_cs      ),
    .mlcd_rst            (mlcd_rst     ),
    .mlcd_wr             (mlcd_wr      ),
    .mlcd_rd             (mlcd_rd      ),
    .mlcd_rs             (mlcd_rs      ),
    .mlcd_data           (mlcd_data    ),
    .lcd_init_done       (lcd_init_done),
    .lcd_id              (lcd_id       ),
    .pixel_data          (mlcd_pixel_data),
    .rd_en               (mlcd_pixel_en)    
    );

//分频模块，根据LCD ID输出相应频率的时钟
clk_div  u_clk_div(
    .clk_50m             (clk),
    .rst_n               (rst_n),
    .lcd_id              (lcd_id),
    .clk_lcd             (lcd_clk)
);

endmodule 
        