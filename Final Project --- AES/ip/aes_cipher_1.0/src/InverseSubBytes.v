module InverseSubBytes(
	input [127:0] data,
	output [127:0] isb_data
);

wire [7:0] d [0:15];
wire [7:0] s [0:15];

assign            {d[00], d[01], d[02], d[03], d[04], d[05], d[06], d[07], d[08], d[09], d[10], d[11], d[12], d[13], d[14], d[15]} = data;
assign isb_data = {s[00], s[01], s[02], s[03], s[04], s[05], s[06], s[07], s[08], s[09], s[10], s[11], s[12], s[13], s[14], s[15]};

InverseSbox isb00(.data(d[00]), .isb_data(s[00]));
InverseSbox isb01(.data(d[01]), .isb_data(s[01]));
InverseSbox isb02(.data(d[02]), .isb_data(s[02]));
InverseSbox isb03(.data(d[03]), .isb_data(s[03]));
InverseSbox isb04(.data(d[04]), .isb_data(s[04]));
InverseSbox isb05(.data(d[05]), .isb_data(s[05]));
InverseSbox isb06(.data(d[06]), .isb_data(s[06]));
InverseSbox isb07(.data(d[07]), .isb_data(s[07]));
InverseSbox isb08(.data(d[08]), .isb_data(s[08]));
InverseSbox isb09(.data(d[09]), .isb_data(s[09]));
InverseSbox isb10(.data(d[10]), .isb_data(s[10]));
InverseSbox isb11(.data(d[11]), .isb_data(s[11]));
InverseSbox isb12(.data(d[12]), .isb_data(s[12]));
InverseSbox isb13(.data(d[13]), .isb_data(s[13]));
InverseSbox isb14(.data(d[14]), .isb_data(s[14]));
InverseSbox isb15(.data(d[15]), .isb_data(s[15]));

endmodule