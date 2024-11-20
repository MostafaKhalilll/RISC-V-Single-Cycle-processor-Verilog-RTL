module instruction_mem (clk, reset, read_address, instruction_out);

input clk, reset;
input [31:0] read_address;
output [31:0] instruction_out;
integer k;
///////////////////Memory_Assigned >>>

reg [31:0] i_mem [63:0];

assign instruction_out = i_mem[read_address];
/// Sequential Logic >>>


always @(posedge clk or posedge reset)

begin

if(reset== 1'b1)
	begin
		for(k=0; k<64; k=k+1) begin

		i_mem[k] <= 32'b0;
		end
	end
else

// R-type
i_mem[0]   = 32'b0000_0000_0000_0000_0000_0000_0000_0000; // no operation
i_mem[4]   = 32'b0000000_11001_10000_000_01101_0110011; // add x13, x16, x25
i_mem[8]   = 32'b0000000_00011_01000_000_00101_0110011; // sub x5, x8, x3
i_mem[12] = 32'b00000000_00011_00010_111_00001_0110011; // and x1, x2, x3
i_mem[16] = 32'b00000000_00101_00011_110_00100_0110011; // or x4, x3, x5

// I_type

i_mem[20] = 32'b0000000000011_10101_000_10110_0010011; // addi x22, x21, 3
i_mem[24] = 32'b0000000000001_01000_110_01001_0010011; // ori x9, x8, 1

// L-type
i_mem[28] = 32'b0000000_01111_00101_010_01000_0000011; // lw x8, 15(x5)
i_mem[32] = 32'b0000000_00011_00011_010_01001_0000011; // lw x9, 3(x3)

// S-type
i_mem[36] = 32'b00000000_01111_00101_010_01100_0100011; // sw x15, 12(x5)
i_mem[40] = 32'b00000000_01110_00110_010_01010_0100011; // sw x14, 10(x6)

// SB-type
i_mem[44] = 32'h00948663; // beq x9, x9, 12


end

endmodule
