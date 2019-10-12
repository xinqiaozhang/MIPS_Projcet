`timescale 1ns/ 1ps

module testbench();
reg clk;
reg rst;
reg start;

Top_MIPS (clk, rst);

initial begin rst <= 1; # 22; rst <= 0; end 
always begin	clk <= 1; # 5;  clk <= 0; # 5; end

initial begin
 #30 start = 1;
 #1000 $stop;

end


endmodule