module adder (in_1, in_2, sum_out);

input [31:0] in_1, in_2;

output [31:0] sum_out;

assign sum_out = in_1 + in_2;

endmodule
