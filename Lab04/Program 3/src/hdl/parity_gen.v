module parity_gen(
	input [31:0] idata,
	output odata
);

assign odata = ^idata;

endmodule