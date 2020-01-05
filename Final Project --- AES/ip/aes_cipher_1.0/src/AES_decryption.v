module AES_decryption(
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
reg [127:0] data_tmp;
reg [127:0] key_reg [0:10];
reg imc_valid;
reg [127:0] curr_key;

wire [127:0] new_key, isb_data, isr_data, imc_data;
wire imc_done;

parameter
	S_WAIT = 3'd0,
	S_KeyGeneration = 3'd1,
	S_InverseAddRoundKey = 3'd2,
	S_InverseShiftRows = 3'd3,
	S_InverseSubBytes = 3'd4,
	S_InverseMixColumns = 3'd5,
	S_DONE = 3'd6;
	
integer i;

// KeyGenerator
KeyGenerator KG(
	.rc(rc),
	.key(curr_key),
	.new_key(new_key)
);

// InverseShiftRows
InverseShiftRows ISR(
	.data(data_tmp),
	.isr_data(isr_data)
);

// InverseSubBytes
InverseSubBytes ISB(
	.data(data_tmp),
	.isb_data(isb_data)
);

// InverseMixColumns
mixcolumn2 mc2(
    .clk(clk),
	.rst(rst),
    .valid(imc_valid),
    .datain(data_tmp),
	.done(imc_done),
    .dataout(imc_data)
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
			ns = (valid)? S_KeyGeneration : S_WAIT;
		S_KeyGeneration:
			ns = (rc == 4'd10)? S_InverseAddRoundKey : S_KeyGeneration;
		S_InverseAddRoundKey:
			ns = (rc == 'd10)? S_InverseShiftRows : (rc == 'd0)? S_DONE : S_InverseMixColumns;
		S_InverseShiftRows:
			ns = S_InverseSubBytes;
		S_InverseSubBytes:
			ns = S_InverseAddRoundKey;
		S_InverseMixColumns:
			ns = (imc_done)? S_InverseShiftRows : S_InverseMixColumns;
		S_DONE:
			ns = S_WAIT;
		default:
			ns = S_WAIT;
	endcase
end

// rc, data_tmp, imc_valid
always@(posedge clk or posedge rst) begin
	if(rst) begin
		rc <= 'd1;
		data_tmp <= 'd0;
		curr_key <= key;
		for(i=0; i<=10; i=i+1) key_reg[i] <= 'd0;
		imc_valid <= 1'b0;
	end
	else if(valid) begin
		rc <= 'd1;
		data_tmp <= datain;
		curr_key <= key;
		key_reg[0] <= key;
		for(i=1; i<=10; i=i+1) key_reg[i] <= 'd0;
		imc_valid <= 1'b0;
	end
	else begin
		case(cs)
			S_WAIT: begin
			end
			S_KeyGeneration: begin
				rc <= (rc == 'd10)? rc : rc + 'd1;
				key_reg[rc] <= new_key;
				curr_key <= new_key;
			end
			S_InverseAddRoundKey: begin
				rc <= (rc == 'd0)? rc : rc - 'd1;
				data_tmp <= data_tmp ^ key_reg[rc];
				imc_valid <= (ns == S_InverseMixColumns);
			end
			S_InverseShiftRows: begin
				data_tmp <= isr_data;
			end
			S_InverseSubBytes: begin
				data_tmp <= isb_data;
			end
			S_InverseMixColumns: begin
				data_tmp <= (imc_done)? imc_data : data_tmp;
				imc_valid <= 1'b0;
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