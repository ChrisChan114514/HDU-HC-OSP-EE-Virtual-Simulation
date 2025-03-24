module seg_led(
    input                   clk    ,        // 时钟信号
    input                   rst_n  ,        // 复位信号

    input         [32:0]    data   ,        // 8位数码管要显示的数值
    input         [7:0]     point  ,        // 小数点具体显示的位置,从高到低,高电平有效
    input                   en     ,        // 数码管使能信号
    input                   sign   ,        // 符号位（高电平显示“-”号）

    output   reg  [7:0]     seg_sel,        // 数码管位选，最左侧数码管为最高位
    output   reg  [7:0]     seg_led         // 数码管段选
    );

//parameter define
localparam  CLK_DIVIDE = 4'd10     ;        // 时钟分频系数
localparam  MAX_NUM    = 13'd5000  ;        // 对数码管驱动时钟(5MHz)计数1ms所需的计数值

//reg define
reg    [ 3:0]             clk_cnt  ;        // 时钟分频计数器
reg                       dri_clk  ;        // 数码管的驱动时钟,5MHz
reg    [31:0]             num      ;        // 32位bcd码寄存器
reg    [12:0]             cnt0     ;        // 数码管驱动时钟计数器
reg                       flag     ;        // 标志信号（标志着cnt0计数达1ms）
reg    [2:0]              cnt_sel  ;        // 数码管位选计数器
reg    [3:0]              num_disp ;        // 当前数码管显示的数据
reg                       dot_disp ;        // 当前数码管显示的小数点

//wire define
wire   [3:0]              data0, data1, data2, data3, data4, data5, data6, data7;

// 提取各个位的BCD数值
assign  data0 = data % 10;
assign  data1 = (data / 10) % 10;
assign  data2 = (data / 100) % 10;
assign  data3 = (data / 1000) % 10;
assign  data4 = (data / 10000) % 10;
assign  data5 = (data / 100000) % 10;
assign  data6 = (data / 1000000) % 10;
assign  data7 = (data / 10000000) % 10;

// 时钟分频
always @(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
       clk_cnt <= 4'd0;
       dri_clk <= 1'b1;
   end
   else if(clk_cnt == CLK_DIVIDE/2 - 1'd1) begin
       clk_cnt <= 4'd0;
       dri_clk <= ~dri_clk;
   end
   else begin
       clk_cnt <= clk_cnt + 1'b1;
   end
end

// 将26位二进制数转换为BCD码
always @ (posedge dri_clk or negedge rst_n) begin
    if (!rst_n)
        num <= 32'b0;
    else begin
        num[31:0] <= {data7, data6, data5, data4, data3, data2, data1, data0};
    end
end

// 计数器实现1ms脉冲
always @ (posedge dri_clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt0 <= 13'b0;
        flag <= 1'b0;
    end
    else if (cnt0 < MAX_NUM - 1'b1) begin
        cnt0 <= cnt0 + 1'b1;
        flag <= 1'b0;
    end
    else begin
        cnt0 <= 13'b0;
        flag <= 1'b1;
    end
end

// 计数器循环选择8个数码管
always @ (posedge dri_clk or negedge rst_n) begin
    if (!rst_n)
        cnt_sel <= 3'b0;
    else if(flag) begin
        if(cnt_sel < 3'd7)
            cnt_sel <= cnt_sel + 1'b1;
        else
            cnt_sel <= 3'b0;
    end
end

// 控制数码管位选信号
always @ (posedge dri_clk or negedge rst_n) begin
    if (!rst_n) begin
        seg_sel  <= 8'b11111111;
        num_disp <= 4'b0;
        dot_disp <= 1'b1;
    end
    else if (en) begin
        seg_sel  <= ~(8'b00000001 << cnt_sel);
        num_disp <= num[(cnt_sel * 4) +: 4];
        dot_disp <= ~point[cnt_sel];
    end
    else begin
        seg_sel  <= 8'b11111111;
        num_disp <= 4'b0;
        dot_disp <= 1'b1;
    end
end

// 控制数码管段选信号
always @ (posedge dri_clk or negedge rst_n) begin
    if (!rst_n)
        seg_led <= 8'hc0;
    else begin
        case (num_disp)
            4'd0 : seg_led <= {dot_disp,7'b1000000};
            4'd1 : seg_led <= {dot_disp,7'b1111001};
            4'd2 : seg_led <= {dot_disp,7'b0100100};
            4'd3 : seg_led <= {dot_disp,7'b0110000};
            4'd4 : seg_led <= {dot_disp,7'b0011001};
            4'd5 : seg_led <= {dot_disp,7'b0010010};
            4'd6 : seg_led <= {dot_disp,7'b0000010};
            4'd7 : seg_led <= {dot_disp,7'b1111000};
            4'd8 : seg_led <= {dot_disp,7'b0000000};
            4'd9 : seg_led <= {dot_disp,7'b0010000};
            default: seg_led <= 8'b11111111;
        endcase
    end
end

endmodule