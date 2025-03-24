module ecode (
    input wire[2:0] cd,

    output reg [7:0] sg

);


always @(cd)
    case(cd)
        3'b000: sg = 8'b11111110;
        3'b001: sg = 8'b11111101;
        3'b010: sg = 8'b11111011;
        3'b011: sg = 8'b11110111;
        3'b100: sg = 8'b11101111;
        3'b101: sg = 8'b11011111;
        3'b110: sg = 8'b10111111;
        3'b111: sg = 8'b01111111;
    endcase

endmodule
        