
module ImmGen(op_code, instruction, ImmExt);

input [6:0] op_code;
input [31:0] instruction;
output reg [31:0] ImmExt;

////////// Combinational Logic //////////

always @(*)
begin

	case(op_code)

///////// Load //
//////////////// Purpose: Loads a 32-bit word from memory into a register.

	7'b0000011 : ImmExt <= {{20{instruction[31]}}, instruction[31:20]}; 

///////// Store //
///////////////// Purpose: Stores a 32-bit word from a register into memory.

	7'b0100011 : ImmExt <= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};

///////// Branch //
////////////////// Purpose: Branches to a new instruction address if two registers contain equal values.

	7'b1100011 : ImmExt <= {{19{instruction[31]}}, instruction[31], instruction[30:25],instruction[11:8], 1'b0};

default		    : ImmExt <= 32'b0;
	endcase

end


endmodule

