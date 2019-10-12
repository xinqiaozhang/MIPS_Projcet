module memory
 
#(
  parameter NUM_REGS = 64, 
  parameter SIZE = 32
)(
  input clk,
  input rst,
  input  [5:0]  DMA,
  input         DMWE,
  input  [31:0] DMWD,
  input  [5:0]  DMA_R,
  output [31:0] DMRD

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
	
    assign DMRD = rf[DMA_R - 2];

endmodule