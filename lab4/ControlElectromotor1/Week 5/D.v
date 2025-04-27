module D (
    input clk,        // 时钟信号
    input D,          // 输入信号 D
    output reg Q      // 输出信号 Q
);

    // D触发器的逻辑
    always @(posedge clk) begin
            Q <= D;          // 否则将输入 D 的值传递给输出 Q
    end

endmodule