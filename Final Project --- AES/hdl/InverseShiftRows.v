module InverseShiftRows(
	input [127:0] data,
	output [127:0] isr_data
);

wire [7:0] d [0:15];
wire [7:0] r [0:15];

assign            {d[00], d[01], d[02], d[03], d[04], d[05], d[06], d[07], d[08], d[09], d[10], d[11], d[12], d[13], d[14], d[15]} = data;
assign isr_data = {r[00], r[01], r[02], r[03], r[04], r[05], r[06], r[07], r[08], r[09], r[10], r[11], r[12], r[13], r[14], r[15]};

assign {r[00], r[04], r[08], r[12]} = {d[00], d[04], d[08], d[12]};
assign {r[01], r[05], r[09], r[13]} = {d[13], d[01], d[05], d[09]};
assign {r[02], r[06], r[10], r[14]} = {d[10], d[14], d[02], d[06]};
assign {r[03], r[07], r[11], r[15]} = {d[07], d[11], d[15], d[03]};

endmodule