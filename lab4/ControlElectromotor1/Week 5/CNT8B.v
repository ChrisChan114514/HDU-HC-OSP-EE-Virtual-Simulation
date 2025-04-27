module CNT8B (
    input clk,          // 时钟信号
    output reg [7:0] count // 8位计数器输出
);

    // 计数器更新逻辑
    always @(posedge clk) begin
            count <= count + 1;    // 否则计数器加1
    end

endmodule