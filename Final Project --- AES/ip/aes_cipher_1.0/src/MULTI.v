module MULTI(
	input clk,
	input rst,
	
	input valid,
	input [7:0] datain,
	input [3:0] multiplier,
	
	output done,
	output reg [7:0] dataout
);

reg [1:0] cs, ns;
reg [7:0] data;
reg [3:0] multi;
reg [1:0] multi_addr;

parameter
		S_IDLE = 2'd0,
		S_ADD1 = 2'd1,
		S_MUL2 = 2'd2,
		S_DONE = 2'd3;

always@(posedge clk or posedge rst) begin
	if(rst)
		cs <= S_IDLE;
	else
		cs <= ns;
end

always@(*) begin
	case(cs)
		S_IDLE: begin
			ns = (valid)? S_ADD1 : S_IDLE;
		end
		S_ADD1: begin
			ns = (multi_addr == 'd0)? S_DONE : S_MUL2;
		end
		S_MUL2: begin
			ns = S_ADD1;
		end
		S_DONE: begin
			ns = S_IDLE; //(valid)? S_ADD1 : S_DONE;
		end
		default: begin
			ns = S_IDLE;
		end
	endcase
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		multi_addr <= 2'd3;
		dataout <= 'd0;
		data <= 'd0;
		multi <= 'd0;
	end
	else if(valid) begin
		multi_addr <= 2'd3;
		dataout <= 'd0;
		data <= datain;
		multi <= multiplier;
	end
	else if(cs == S_ADD1) begin
		dataout <= (multi[multi_addr])? dataout ^ data : dataout;
	end
	else if(cs == S_MUL2) begin
		multi_addr <= multi_addr - 2'd1;
		dataout <= (dataout[7])? {dataout[6:0], 1'b0} ^ 8'h1B : {dataout[6:0], 1'b0};
	end
end

assign done = (cs == S_DONE);

endmodule