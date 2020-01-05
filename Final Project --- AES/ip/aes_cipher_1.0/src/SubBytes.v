module SubBytes(
	input [127:0] data,
	output [127:0] sb_data
);

wire [7:0] d [0:15];
wire [7:0] s [0:15];

assign           {d[00], d[01], d[02], d[03], d[04], d[05], d[06], d[07], d[08], d[09], d[10], d[11], d[12], d[13], d[14], d[15]} = data;
assign sb_data = {s[00], s[01], s[02], s[03], s[04], s[05], s[06], s[07], s[08], s[09], s[10], s[11], s[12], s[13], s[14], s[15]};

ForwardSbox fsb00(.data(d[00]), .fsb_data(s[00]));
ForwardSbox fsb01(.data(d[01]), .fsb_data(s[01]));
ForwardSbox fsb02(.data(d[02]), .fsb_data(s[02]));
ForwardSbox fsb03(.data(d[03]), .fsb_data(s[03]));
ForwardSbox fsb04(.data(d[04]), .fsb_data(s[04]));
ForwardSbox fsb05(.data(d[05]), .fsb_data(s[05]));
ForwardSbox fsb06(.data(d[06]), .fsb_data(s[06]));
ForwardSbox fsb07(.data(d[07]), .fsb_data(s[07]));
ForwardSbox fsb08(.data(d[08]), .fsb_data(s[08]));
ForwardSbox fsb09(.data(d[09]), .fsb_data(s[09]));
ForwardSbox fsb10(.data(d[10]), .fsb_data(s[10]));
ForwardSbox fsb11(.data(d[11]), .fsb_data(s[11]));
ForwardSbox fsb12(.data(d[12]), .fsb_data(s[12]));
ForwardSbox fsb13(.data(d[13]), .fsb_data(s[13]));
ForwardSbox fsb14(.data(d[14]), .fsb_data(s[14]));
ForwardSbox fsb15(.data(d[15]), .fsb_data(s[15]));

endmodule