//// adds 4 to program counter

module pcplus4 (from_pc, to_pc);

input [31:0] from_pc;

output  [31:0] to_pc;


assign to_pc = 32'h0004 + from_pc;

endmodule
