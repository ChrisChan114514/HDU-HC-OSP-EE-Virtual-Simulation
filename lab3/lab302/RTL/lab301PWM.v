/*
### 模块说明

- `clk`：输入时钟信号。
- `rst_n`：复位信号，低电平有效。
- `duty`：占空比控制信号，8位宽，范围为0到255，对应0%到100%的占空比。
- `period`：周期控制信号，32位宽，用于设置PWM信号的周期。
- `pwm_out`：PWM输出信号。

### 工作原理

1. 计数器 `counter` 在每个时钟周期递增，直到达到设定的 `period` 值，然后复位为0。
2. 根据 `duty` 信号计算占空比，当 `counter` 小于 `(period * duty) >> 8` 时，输出 `pwm_out` 为高电平，否则为低电平。

通过调整 `duty` 和 `period` 信号，可以控制PWM信号的占空比和频率。
*/


module lab301PWM (
    input wire clk,          // 输入时钟信号
    input wire rst_n,        // 复位信号，低电平有效
	 input wire [7:0] duty,
    //output reg pwm_out       // PWM输出信号
	 output wire [7:0] DAC
);

    // 将period定义为参数
    parameter [31:0] period = 32'd1000000;
		reg pwm_out ;
    reg [31:0] counter;      // 计数器

    always @(posedge clk or posedge rst_n) begin
        if (rst_n) begin
            counter <= 32'd0;
            pwm_out <= 1'b0;
        end else begin
            if (counter < period) begin
                counter <= counter + 1;
            end else begin
                counter <= 32'd0;
            end

            if (counter < (period * duty) >> 8) begin
                pwm_out <= 1'b1;
            end else begin
                pwm_out <= 1'b0;
            end
        end
    end
	 
	 assign DAC=(pwm_out==1'd1)?8'b1111_1111:8'b0000_0000;

endmodule