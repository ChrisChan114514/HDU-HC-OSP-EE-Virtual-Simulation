module decl7s(
    input [3:0] A,
    output reg [6:0] led7s
    );
always @ (A)
    case(A)
    4'b0000: led7s = 7'b1000000;
    4'b0001: led7s = 7'b1111001;
    4'b0010: led7s = 7'b0100100;
    4'b0011: led7s = 7'b0110000;
    4'b0100: led7s = 7'b0011001;
    4'b0101: led7s = 7'b0010010;
    4'b0110: led7s = 7'b0000010;
    4'b0111: led7s = 7'b1111000;
    4'b1000: led7s = 7'b0000000;
    4'b1001: led7s = 7'b0010000;
    4'b1010: led7s = 7'b0001000;
    4'b1011: led7s = 7'b0000011;
    4'b1100: led7s = 7'b1000110;
    4'b1101: led7s = 7'b0100001;
    4'b1110: led7s = 7'b0000110;
    4'b1111: led7s = 7'b0001110;
    endcase

endmodule