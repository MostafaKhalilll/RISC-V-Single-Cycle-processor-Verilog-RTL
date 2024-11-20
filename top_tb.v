`timescale 1ns/1ps
module top_tb;

reg clk, reset;

top uut (.clk(clk), .reset(reset));

initial begin

clk = 0;



reset = 1;

#5;

reset = 0;

#400;


end

always begin

#5 clk = ~clk;

end

endmodule
