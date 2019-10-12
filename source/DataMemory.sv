`timescale 1ns / 1ps

module DataMemory
	#(
  parameter NUM_REGS = 256, 
  parameter SIZE = 32
)(
  input clk,
  input rst,
  input  [31:0]  DMA,
  input         DMWE,
  input DMRD,
  input  [31:0] DMWD,
  output logic [31:0] DMOut

);
  
    logic [SIZE-1:0] rf [NUM_REGS-1:0];
  
    integer i;
	 always_ff @ (posedge clk) begin
      if (rst)
			for (i = 0; i < NUM_REGS-1; i = i + 1)
				rf[i] <= 0;
		else  if (DMWE)
        rf[DMA] <= DMWD;
		
	end
	
	always_comb begin
		if (DMRD)
		 DMOut = rf[DMA];
		else DMOut = 0;
	 end

endmodule
	
	 

