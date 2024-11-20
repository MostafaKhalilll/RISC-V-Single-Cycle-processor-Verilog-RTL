
module top ( clk, reset);

input clk, reset;

////// Inter_Connection Wires

//** 32 bit wires

wire [31:0] pc_top, instruction_top, Rd1_top, Rd2_top, ImmExt_top, mux1_top, sum_out_top, to_pc_top, pc_in_top, address_top, mem_data_top,write_regdata_top;

//** 1-bit wires

wire reg_write_top, aluSrc_top, zero_top, branch_top, sel2_AND_top, memtoReg_top, memWrite_top, memRead_top;

//** 2-bit wires

wire [1:0] aluOp_top;

wire [3:0] control_top;


/////*********** instances && Connections *************** ///

//// Program Counter ***

program_counter pc (.clk(clk), .reset(reset), .pc_in(pc_in_top), .pc_out(pc_top));


//// pc adder + 4 ******

pcplus4 pc_adder (.from_pc(pc_top), .to_pc(to_pc_top));

//// instruction memory

instruction_mem inst_mem (.clk(clk),
 .reset(reset),
 .read_address(pc_top),
 .instruction_out(instruction_top));

//// Register file *****

reg_file reg_file1 (
 .clk(clk),
 .reset(reset),
 .reg_write(reg_write_top),
 .Rs1(instruction_top[19:15]),
 .Rs2(instruction_top[24:20]),
 .Rd(instruction_top[11:7]),
 .write_data(write_regdata_top),
 .read_data1(Rd1_top),
 .read_data2(Rd2_top) 
);


//// Immediate Generator *******

ImmGen ImmGen1 (.op_code(instruction_top[6:0]), .instruction(instruction_top), .ImmExt(ImmExt_top));



//// Control Unit *****

control control1 (
.instruction(instruction_top[6:0]),
.branch(branch_top),
.memRead(memRead_top),
.memtoReg(memtoReg_top),
.aluOp(aluOp_top),
.memWrite(memWrite_top),
.aluSrc(aluSrc_top),
.regWrite(reg_write_top)
);

///// ALU Control *********

ALU_control ALU_C(.aluOp(aluOp_top),
 .fun7(instruction_top[30]),
 .fun3(instruction_top[14:12]),
 .control_out(control_top)
);


///// ALU ***********

ALU ALU1(
.A(Rd1_top),
 .B(mux1_top),
 .control_in(control_top),
 .alu_result(address_top),
 .zero(zero_top)
);

/////// ALU_Mux ********

mux1 ALU_mux(
.sel_1(aluSrc_top),
 .A1(Rd2_top),
 .B1(ImmExt_top),
 .mux1_out(mux1_top)
);


/// Adder *******

adder adder1 (.in_1(pc_top), .in_2(ImmExt_top), .sum_out(sum_out_top));


//// And Gate ********


and_logic and_logic1 (.branch(branch_top), .zero(zero_top), .and_out(sel2_AND_top));

//// Mux Adder

mux2 mux2_adder(.sel_2(sel2_AND_top), .A2(to_pc_top), .B2(sum_out_top), .mux2_out(pc_in_top));

//// Data Memory ****

data_memory data_mem (
.clk(clk),
 .reset(reset),
 .memWrite(memWrite_top),
 .memRead(memRead_top),
 .read_address(address_top),
 .write_data(Rd2_top),
 .memData_out(mem_data_top)
);

///// Mux Data Memory ***

mux3 mux_memory (.sel_3(memtoReg_top), .A3(address_top), .B3(mem_data_top), .mux3_out(write_regdata_top));




endmodule
