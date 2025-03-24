module FrequencyDivider #(
    parameter Prescaler=32'd99_999
  )
  (
    input wire rst_n,
    input wire clk_input,
    output reg clk_output
  );
  //1Hz时钟生成
  reg         [31:0]clk_counter = 0;
  always@(posedge clk_input or negedge rst_n)
  begin
    if (!rst_n)
    begin
      clk_counter<=0;
    end
    else
    begin
      if(clk_counter == Prescaler)
      begin
        clk_counter <= 0;
        clk_output <= !clk_output;
      end
      else
      begin
        clk_counter = clk_counter + 1;
      end
    end
  end
endmodule
