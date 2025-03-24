module chengfaqi(
    input sys_clk,          // 系统时钟输入
    input [7:0] multi_input, // 乘法器输入信号，8位宽

    output [7:0] result,    // 乘法器输出结果，8位宽
    output [7:0] sg,        // 数码管段选信号，8位宽
    output [7:0] led        // LED显示信号，8位宽
  );

  reg [2:0] q = 0;          // 3位计数器，用于选择当前显示的数码管位
  wire [31:0] num;          // 32位宽信号，每4位存储一个十进制数字，共8位
  wire [3:0] y;             // 4位宽信号，存储当前选中的数码管显示值

  // 1Hz时钟生成模块
  wire clk_1Hz;
  FrequencyDivider #(.Prescaler(32'd24_999_999)) CLK_1Hz
                   (.rst_n(1'b1),                // 复位信号，始终为高电平
                    .clk_input(sys_clk),         // 输入系统时钟
                    .clk_output(clk_1Hz));       // 输出1Hz时钟

  // 1000Hz时钟生成模块
  wire clk_1000Hz;
  FrequencyDivider #(.Prescaler(32'd24_999)) CLK_1000Hz
                   (.rst_n(1'b1),                // 复位信号，始终为高电平
                    .clk_input(sys_clk),         // 输入系统时钟
                    .clk_output(clk_1000Hz));    // 输出1000Hz时钟

  // 1000Hz时钟驱动计数器，用于轮动显示数码管位
  always@(posedge clk_1000Hz)
  begin
    if(q == 3'b111)          // 如果计数器达到最大值（7），则复位为0
      q <= 3'd0;
    else
      q <= q + 1;            // 否则计数器加1
  end

  // 查找表乘法器模块
  multi multi_inst (
          .address(multi_input), // 输入地址信号
          .inclock(sys_clk),     // 输入时钟信号
          .q(result));           // 输出乘法结果

  // 将乘法结果转换为8位十进制数字，存储到num中
  assign num = {4'b0000, 4'b0000, 4'b0000, 4'b0000, 4'b0000,
                result/100, result%100, result%10};

  // 数码管位选信号生成模块
  ecode ecode_inst(.cd(q), .sg(sg));

  // 多路选择器模块，根据q选择num中的4位数字，输出到y
  muxa muxa_inst(
         .A(num[3:0]),      // 第1位数字
         .B(num[7:4]),      // 第2位数字
         .C(num[11:8]),     // 第3位数字
         .D(num[15:12]),    // 第4位数字
         .E(num[19:16]),    // 第5位数字
         .F(num[23:20]),    // 第6位数字
         .G(num[27:24]),    // 第7位数字
         .H(num[31:28]),    // 第8位数字
         .S(q),             // 选择信号
         .Y(y),            // 输出选中的4位数字
         .DP(led[7])        // 小数点信号
       );

  // BCD码转数码管段选信号模块
  decl7s decl7s_inst(.A(y), .led7s(led[6:0]));

endmodule