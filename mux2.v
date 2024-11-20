
module mux2(sel_2, A2, B2, mux2_out);


input sel_2;
input [31:0] A2, B2;
output [31:0] mux2_out;


assign mux2_out = (sel_2 == 1'b0) ? A2 : B2;

endmodule
