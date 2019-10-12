`timescale 1ns / 1ps

module SignExtend_16X32(
    input [15:0] Input_16,
    output [31:0] Output_32
    );
	 
	 assign Output_32 = {{16{Input_16[15]}},Input_16[15:0]};


endmodule
