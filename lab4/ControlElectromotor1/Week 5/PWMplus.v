module PWMplus(
    input wire clk,             // 时钟信号
    input wire GND,             // 接地信号 (未使用，但保留接口)
    input wire CNTN,            // 光电信号，用于测量转速
    input wire [7:0] A,         // 占空比控制信号 (0-255)
    output reg PWM_motor,       // PWM 输出信号
    output wire [7:0] seg_sel,  // 数码管位选信号
    output wire [7:0] seg_led   // 数码管段选信号
);

reg [19:0] clk_div = 20'd0; // 分频计数器 (20位，支持较大的分频系数)
reg slow_clk = 0;           // 分频后的时钟信号
reg [7:0] counter = 8'd0;   // 8位计数器

// 转速测量相关寄存器
reg [31:0] period_count = 32'd0; // 记录相邻两个 CNTN 上升沿之间的时钟周期数
reg [31:0] speed = 32'd0;        // 转速值
reg CNTN_prev = 0;               // CNTN 的前一时钟状态

// 分频器逻辑，将时钟信号分频为 256 倍的 5000Hz
always @(posedge clk) begin
    if (clk_div == 20'd999) begin // 假设输入时钟为 50MHz，分频系数为 50,000,000 / (5000 * 256) = 100,0
        clk_div <= 20'd0;
        slow_clk <= ~slow_clk; // 翻转分频时钟信号
    end else begin
        clk_div <= clk_div + 1;
    end
end

// 使用分频后的时钟信号驱动计数器和 PWM 输出逻辑
always @(posedge slow_clk) begin
    // 计数器递增
    if (counter == 8'd255)
        counter <= 8'd0; // 计数器循环
    else
        counter <= counter + 1;

    // 根据占空比控制输出
    if (counter < A)
        PWM_motor <= 1;
    else
        PWM_motor <= 0;
end

// 转速测量逻辑
always @(posedge clk) begin
    if (CNTN && !CNTN_prev) begin // 检测 CNTN 的上升沿
        if (period_count != 0) begin
            speed <= (60 * 50_000_000) / period_count; // 转速 = 60 * 时钟频率 / 周期计数
        end else begin
            speed <= 0; // 避免除以 0 的情况
        end
        period_count <= 0; // 重置周期计数器
    end else begin
        period_count <= period_count + 1; // 周期计数器递增
    end
    CNTN_prev <= CNTN; // 更新 CNTN 的前一状态
end

// 数码管动态显示模块
seg_led u_seg_led(
    .clk           (clk      ),       // 时钟信号
    .rst_n         (1'b1     ),       // 复位信号，始终有效
    .data          (32'd10   ),       // 显示的转速值
    .point         (8'b00000000),     // 小数点具体显示的位置，高电平有效
    .en            (8'b11111111),     // 数码管使能信号
    .sign          (1'b0     ),       // 符号位，高电平显示负号(-)
    .seg_sel       (seg_sel  ),       // 位选
    .seg_led       (seg_led  )        // 段选
);

endmodule