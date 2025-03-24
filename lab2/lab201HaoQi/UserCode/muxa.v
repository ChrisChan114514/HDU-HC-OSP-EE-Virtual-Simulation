module muxa(A,B,C,D,E,F,G,H,S,Y,DP);
input [3:0] A,B,C,D,E,F,G,H;
input [2:0] S;

output reg [3:0] Y;
output reg DP;
always @(A,B,C,D,E,F,G,H,S)
begin
    if(S == 3'b000) begin Y = A; DP = 1'b1; end
    else if(S == 3'b001) begin Y = B; DP = 1'b1; end
    else if(S == 3'b010) begin Y = C; DP = 1'b0; end
    else if(S == 3'b011) begin Y = D; DP = 1'b1; end
    else if(S == 3'b100) begin Y = E; DP = 1'b0; end
    else if(S == 3'b101) begin Y = F; DP = 1'b1; end
    else if(S == 3'b110) begin Y = G; DP = 1'b1; end
    else if(S == 3'b111) begin Y = H; DP = 1'b1; end
end
endmodule