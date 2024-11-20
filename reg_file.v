module reg_file(clk, reset, reg_write, Rs1, Rs2, Rd, write_data, read_data1, read_data2 );

input clk, reset, reg_write;

input [4:0] Rs1, Rs2, Rd;

input [31:0] write_data;

output [31:0] read_data1, read_data2;

///////////// Memory ////////

reg [31:0] Registers [31:0];


initial begin

    Registers[0] = 0;
    Registers[1] = 4;
    Registers[2] = 22;
    Registers[3] = 24;
    Registers[4] = 4;
    Registers[5] = 1;
    Registers[6] = 44;
    Registers[7] = 4;
    Registers[8] = 2;
    Registers[9] = 21;
    Registers[10] = 23;
    Registers[11] = 4;
    Registers[12] = 90;
    Registers[13] = 10;
    Registers[14] = 20;
    Registers[15] = 30;
    Registers[16] = 40;
    Registers[17] = 50;
    Registers[18] = 60;
    Registers[19] = 70;
    Registers[20] = 80;
Registers[21] = 80;
Registers[22] = 90;
Registers[23] = 70;
Registers[24] = 60;
Registers[25] = 65;
Registers[26] = 4;
Registers[27] = 32;
Registers[28] = 12;
Registers[29] = 34;
Registers[30] = 05;
Registers[31] = 10;

end

integer k;




/////////// Sequential Logic /////////

always @(posedge clk ) begin
/*
////////loop///
	if(reset)begin 

	for(k=0; k<32; k=k+1)begin

		Registers[k] <= 32'b00;
	end
end

////////end loop///

else if(reg_write == 1'b1)begin

	Registers[Rd] <= write_data;

	end
*/


if(reg_write)begin

	Registers[Rd] <= write_data;

	end

	
	
end



/////////// Combinational Logic /////////


assign read_data1 = Registers[Rs1];

assign read_data2 = Registers[Rs2];


endmodule
