module AES_cipher(
	input clk,
	input rst,
	
	input valid,
	input mode, // 0: encryption // 1: decryption
	input [127:0] datain,
	input [127:0] key,
	
	output reg done,
	output reg [127:0] dataout
);

reg [1:0] cs, ns;
reg mode_tmp;
reg [127:0] datain_tmp;
reg [127:0] key_tmp;
reg en_valid, de_valid;

wire en_done, de_done;
wire [127:0] en_dataout, de_dataout;

parameter
	S_WAIT = 2'd0,
	S_WORK = 2'd1,
	S_DONE = 2'd2;

AES_encryption aes_en(
	.clk(clk),
	.rst(rst),
	.valid(en_valid),
	.datain(datain_tmp),
	.key(key_tmp),
	.done(en_done),
	.dataout(en_dataout)
);

AES_decryption aes_de(
	.clk(clk),
	.rst(rst),
	.valid(de_valid),
	.datain(datain_tmp),
	.key(key_tmp),
	.done(de_done),
	.dataout(de_dataout)
);

always@(posedge clk or posedge rst) begin
	if(rst)
		cs <= S_WAIT;
	else
		cs <= ns;
end

always@(*) begin
	case(cs)
		S_WAIT: ns = (valid)? S_WORK : S_WAIT;
		S_WORK: ns = (en_done | de_done)? S_DONE : S_WORK;
		S_DONE: ns = S_WAIT;
		default: ns = S_WAIT;
	endcase
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		mode_tmp <= 1'b0;
		datain_tmp <= 'd0;
		key_tmp <= 'd0;
		en_valid <= 1'b0;
		de_valid <= 1'b0;
		done <= 1'b0;
		dataout <= 'd0;
	end
	else begin
		case(cs)
			S_WAIT: begin
				if(valid) begin
					mode_tmp <= mode;
					datain_tmp <= datain;
					key_tmp <= key;
					en_valid <= ~mode;
					de_valid <= mode;
					done <= 1'b0;
					dataout <= 'd0;
				end
			end
			S_WORK: begin
				en_valid <= 1'b0;
				de_valid <= 1'b0;
			end
			S_DONE: begin
				done <= 1'b1;
				dataout <= (mode_tmp)? de_dataout : en_dataout;
			end
		endcase
	end
end

endmodule