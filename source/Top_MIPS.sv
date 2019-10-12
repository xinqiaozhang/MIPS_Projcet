module Top_MIPS (
	input clk,
	input rst,
	output [7:0] DATA,
	output RW, EN, RS, ON
);

logic [8:0] data_mem;
logic [5:0] address;
logic wr_en;
logic [31:0] wr_addr;
logic [31:0] wr_data;


memory mem(
	clk,
	rst,
	wr_addr,
	wr_en,
	wr_data,
	address,
	data_mem
);

MIPS mips(
	clk,
	rst,
	wr_addr,
	wr_data,
	wr_en
);



endmodule