
module mux1(sel_1, A1, B1, mux1_out);


input sel_1;
input [31:0] A1, B1;
output [31:0] mux1_out;


assign mux1_out = (sel_1 == 1'b0) ? A1 : B1;

endmodule

