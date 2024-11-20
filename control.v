
module control(instruction, branch, memRead, memtoReg, aluOp, memWrite, aluSrc, regWrite);

input [6:0] instruction;
output reg branch, memRead, memtoReg, memWrite, aluSrc, regWrite;
output reg [1:0] aluOp;


always @(*) begin

	case (instruction)

///// R-format

		7'b0110011 : {aluSrc, memtoReg, regWrite, memRead, memWrite, branch, aluOp} <= 8'b001000_01;

///// lw - load word

		7'b0000011 : {aluSrc, memtoReg, regWrite, memRead, memWrite, branch, aluOp} <= 8'b111100_00;

///// sw - store word

		7'b0100011 : {aluSrc, memtoReg, regWrite, memRead, memWrite, branch, aluOp} <= 8'b100010_00;

///// Branch

		7'b1100011 : {aluSrc, memtoReg, regWrite, memRead, memWrite, branch, aluOp} <= 8'b000001_01;

	default		    : {aluSrc, memtoReg, regWrite, memRead, memWrite, branch, aluOp} <= 8'b001000_01;

	endcase
end

endmodule
