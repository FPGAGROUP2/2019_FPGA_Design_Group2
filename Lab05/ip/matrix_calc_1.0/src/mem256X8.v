(* keep_hierarchy = "yes" *)module	mem256X8(
	input clk,
	// port 0
	input write_enable0,
	input [7:0] data_in0,
	input [7:0] address0,
	output reg [7:0] data_out0,
	// port 1
	input write_enable1,
	input [7:0] data_in1,
	input [7:0] address1,
	output reg [7:0] data_out1
);

reg [7:0] mem [0:255];

// port 0
always@(posedge clk) begin
	if(write_enable0)
		mem[address0] <= data_in0;
	else
		data_out0 <= mem[address0];
end

// port 1
always@(posedge clk) begin
	if(write_enable1)
		mem[address1] <= data_in1;
	else
		data_out1 <= mem[address1];
end

endmodule
