module data_memory(clk, reset, memWrite, memRead, read_address, write_data, memData_out);

input clk, reset, memWrite, memRead;

input [31:0] read_address, write_data;

output [31:0] memData_out;

integer k;

////// Memory inst. ////

reg [31:0] D_memory [63:0];

always @(posedge clk or posedge reset)begin

	if(reset) begin

	for(k=0; k<64; k=k+1)begin

	D_memory[k] <= 32'b00;
	end


end


else if(memWrite) begin

	D_memory[read_address] <= write_data;

end

end

//////// Combinational logic ***

assign memData_out = (memRead) ? D_memory[read_address] : 32'b00;


endmodule
