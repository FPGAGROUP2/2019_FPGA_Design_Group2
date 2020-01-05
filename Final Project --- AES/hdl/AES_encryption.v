module AES_encryption(
	input clk,
	input rst,
	
	input valid,
	input [127:0] datain,
	input [127:0] key,
	
	output done,
	output [127:0] dataout
);

reg [2:0] cs, ns;
reg [3:0] rc;
reg [127:0] data_tmp, key_tmp;
reg mc_valid;

wire [127:0] new_key, sb_data, sr_data, mc_data;
wire mc_done;

parameter
	S_WAIT = 3'd0,
	S_AddRoundKey = 3'd1,
	S_SubBytes = 3'd2,
	S_ShiftRows = 3'd3,
	S_MixColumns = 3'd4,
	S_DONE = 3'd5;

// KeyGenerator (in AddRoundKey): new_key
KeyGenerator KG(
	.rc(rc),
	.key(key_tmp),
	.new_key(new_key)
);

// SubBytes: sb_data
SubBytes SB(
	.data(data_tmp),
	.sb_data(sb_data)
);

// ShiftRows: sr_data
ShiftRows SR(
	.data(data_tmp),
	.sr_data(sr_data)
);

// MixColumns: mc_done, mc_data
mixcolumn1 mc1(
	.clk(clk),
	.rst(rst),
	.valid(mc_valid),
    .datain(data_tmp),
    .done(mc_done),
	.dataout(mc_data)
);

// cs
always@(posedge clk or posedge rst) begin
	if(rst)
		cs <= S_WAIT;
	else
		cs <= ns;
end

// ns
always@(*) begin
	case(cs)
		S_WAIT:
			ns = (valid)? S_AddRoundKey : S_WAIT;
		S_AddRoundKey:
			ns = (rc == 4'd11)? S_DONE : S_SubBytes;
		S_SubBytes:
			ns = S_ShiftRows;
		S_ShiftRows:
			ns = (rc == 4'd11)? S_AddRoundKey : S_MixColumns;
		S_MixColumns:
			ns = (mc_done)? S_AddRoundKey : S_MixColumns;
		S_DONE:
			ns = S_WAIT;
		default:
			ns = S_WAIT;
	endcase
end

// rc, data_tmp, key_tmp, mc_valid
always@(posedge clk or posedge rst) begin
	if(rst) begin
		rc <= 'd1;
		data_tmp <= 'd0;
		key_tmp <= 'd0;
		mc_valid <= 1'b0;
	end
	else if(valid) begin
		rc <= 'd1;
		data_tmp <= datain;
		key_tmp <= key;
		mc_valid <= 1'b0;
	end
	else begin
		case(cs)
			S_WAIT: begin
			end
			S_AddRoundKey: begin
				rc <= rc + 'd1;
				data_tmp <= data_tmp ^ key_tmp;
				key_tmp <= new_key;
			end
			S_SubBytes: begin
				data_tmp <= sb_data;
			end
			S_ShiftRows: begin
				data_tmp <= sr_data;
				mc_valid <= (ns == S_MixColumns);
			end
			S_MixColumns: begin
				data_tmp <= (mc_done)? mc_data : data_tmp;
				mc_valid <= 1'b0;
			end
			S_DONE: begin
			end
		endcase
	end
end

// done
assign done = (cs == S_DONE);

// dataout
assign dataout = data_tmp;

endmodule