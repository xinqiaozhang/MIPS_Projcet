`timescale 1ns / 1ps

module SignExtend_26X32(
    input [25:0] Input_26,
    output [31:0] Output_32
    );
	 
	  assign Output_32 = {{6{Input_26[25]}},Input_26[25:0]};


endmodule
