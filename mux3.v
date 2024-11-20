module mux3(sel_3, A3, B3, mux3_out);


input sel_3;
input [31:0] A3, B3;
output [31:0] mux3_out;


assign mux3_out = (sel_3 == 1'b0) ? A3 : B3;

endmodule

