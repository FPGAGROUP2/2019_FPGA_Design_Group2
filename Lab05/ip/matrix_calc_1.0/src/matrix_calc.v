(* keep_hierarchy = "yes" *)module matrix_calc(
	input clk,
	input rst_n,
	input write_enable,
	input [7:0] data_in,
	input [7:0] address,
	output [7:0] data_out
);

wire write_enable1;
wire [7:0] address1, data_in1, data_out1;

matrix_ctrl mat_ctrl(
	// input
	.clk(clk),
	.rst_n(rst_n),
	.data_in(data_out1),
	// output
	.we(write_enable1),
	.addr(address1),
	.data_out(data_in1)
);

mem256X8 bram_dual(
	.clk(clk),
	// port 0
	// connect to memory_ctrl
	// input
	.write_enable0(write_enable),
	.data_in0(data_in),
	.address0(address),
	// output
	.data_out0(data_out),
	// port 1
	// connect to matrix_ctrl
	// input
	.write_enable1(write_enable1),
	.data_in1(data_in1),
	.address1(address1),
	// output
	.data_out1(data_out1)
);

endmodule