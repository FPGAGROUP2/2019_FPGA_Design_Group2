module sorting(
	input clk,
	input valid,
	input  [31:0] idata,
	output [31:0] odata
);

reg [2:0] cnt;
reg [3:0] data [0:7];

always@(posedge clk) begin
	if(valid) begin
		cnt <= (&cnt)? cnt : cnt + 'd1;
		case(cnt[0])
			1'b0: begin
				data[0] <= (data[0] < data[1])? data[0] : data[1];
				data[1] <= (data[0] < data[1])? data[1] : data[0];
				data[2] <= (data[2] < data[3])? data[2] : data[3];
				data[3] <= (data[2] < data[3])? data[3] : data[2];
				data[4] <= (data[4] < data[5])? data[4] : data[5];
				data[5] <= (data[4] < data[5])? data[5] : data[4];
				data[6] <= (data[6] < data[7])? data[6] : data[7];
				data[7] <= (data[6] < data[7])? data[7] : data[6];
			end
			1'b1: begin
				data[0] <= (data[0] < data[7])? data[0] : data[7];
				data[1] <= (data[1] < data[2])? data[1] : data[2];
				data[2] <= (data[1] < data[2])? data[2] : data[1];
				data[3] <= (data[3] < data[4])? data[3] : data[4];
				data[4] <= (data[3] < data[4])? data[4] : data[3];
				data[5] <= (data[5] < data[6])? data[5] : data[6];
				data[6] <= (data[5] < data[6])? data[6] : data[5];
				data[7] <= (data[0] < data[7])? data[7] : data[0];
			end
		endcase
	end
	else begin
		cnt <= 'd0;
		{data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]} <= idata;
	end
end

assign odata = {data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7]};

endmodule