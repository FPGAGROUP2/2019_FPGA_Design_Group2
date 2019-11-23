(* keep_hierarchy = "yes" *)module matrix_ctrl(
	input clk,
	input rst_n,
	input [7:0] data_in,
	output reg we,
	output reg [7:0] addr,
	output reg [7:0] data_out
);

reg [1:0] clk_4;
reg [4:0] cs, ns;
reg [7:0] cmd;
reg [7:0] A11, A12, A21, A22, B11, B12, B21, B22;

wire clk_4_f;
wire data_form;
wire [15:0] C11, C12, C21, C22;

parameter
		S_IDLE = 5'd0,
		S_READ_A11 = 5'd1,
		S_READ_A12 = 5'd2,
		S_READ_A21 = 5'd3,
		S_READ_A22 = 5'd4,
		S_READ_B11 = 5'd5,
		S_READ_B12 = 5'd6,
		S_READ_B21 = 5'd7,
		S_READ_B22 = 5'd8,
		S_READ_CMD = 5'd9,
		S_WRITE_DATA_FORM = 5'd10,
		S_WRITE_C11_L = 5'd11,
		S_WRITE_C11_M = 5'd12,
		S_WRITE_C12_L = 5'd13,
		S_WRITE_C12_M = 5'd14,
		S_WRITE_C21_L = 5'd15,
		S_WRITE_C21_M = 5'd16,
		S_WRITE_C22_L = 5'd17,
		S_WRITE_C22_M = 5'd18,
		S_DONE = 5'd19;

// subcircuit: processor
processor proc(
	// input
	.cmd(cmd),
	.A11(A11), .A12(A12), .A21(A21), .A22(A22),
	.B11(B11), .B12(B12), .B21(B21), .B22(B22),
	// output
	.data_form(data_form),
	.C11(C11), .C12(C12), .C21(C21), .C22(C22)
);

// clk_4_f
assign clk_4_f = clk_4[1];

// clk_4
always@(negedge clk or negedge rst_n) begin
	if(!rst_n)
		clk_4 <= 'd0;
	else
		clk_4 <= clk_4 + 'd1;
end

// cs
always@(negedge clk_4_f or negedge rst_n) begin
	if(!rst_n)
		cs <= S_IDLE;
	else
		cs <= ns;
end

// ns
always@(*) begin
	case(cs)
		S_IDLE: begin
			ns = (data_in == 'd1)? S_READ_A11 : S_IDLE; // 1 means cmd, matrixA and matrixB were input completely
		end
		S_READ_A11: begin
			ns = S_READ_A12;
		end
		S_READ_A12: begin
			ns = S_READ_A21;
		end
		S_READ_A21: begin
			ns = S_READ_A22;
		end
		S_READ_A22: begin
			ns = S_READ_B11;
		end
		S_READ_B11: begin
			ns = S_READ_B12;
		end
		S_READ_B12: begin
			ns = S_READ_B21;
		end
		S_READ_B21: begin
			ns = S_READ_B22;
		end
		S_READ_B22: begin
			ns = S_READ_CMD;
		end
		S_READ_CMD: begin
			ns = S_WRITE_DATA_FORM;
		end
		S_WRITE_DATA_FORM: begin
			ns = S_WRITE_C11_L;
		end
		S_WRITE_C11_L: begin
			ns = S_WRITE_C11_M;
		end
		S_WRITE_C11_M: begin
			ns = S_WRITE_C12_L;
		end
		S_WRITE_C12_L: begin
			ns = S_WRITE_C12_M;
		end
		S_WRITE_C12_M: begin
			ns = S_WRITE_C21_L;
		end
		S_WRITE_C21_L: begin
			ns = S_WRITE_C21_M;
		end
		S_WRITE_C21_M: begin
			ns = S_WRITE_C22_L;
		end
		S_WRITE_C22_L: begin
			ns = S_WRITE_C22_M;
		end
		S_WRITE_C22_M: begin
			ns = S_DONE;
		end
		S_DONE: begin
			ns = S_IDLE;
		end
		default: begin
			ns = S_IDLE;
		end
	endcase
end

// addr, data_out
always@(negedge clk_4_f or negedge rst_n) begin
	if(!rst_n) begin
		we <= 1'b0;
		addr <= 'd0;
		data_out <= 'd0;
	end
	else begin
		case(cs)
			S_IDLE: begin
				we <= 1'b0; // start to read
				addr <= (data_in == 'd1)? 'd2 : 'd0; // 1 means cmd, matrixA and matrixB were input completely
			end
			S_READ_A11: begin
				addr <= addr + 'd1;
				A11 <= data_in;
			end
			S_READ_A12: begin
				addr <= addr + 'd1;
				A12 <= data_in;
			end
			S_READ_A21: begin
				addr <= addr + 'd1;
				A21 <= data_in;
			end
			S_READ_A22: begin
				addr <= addr + 'd1;
				A22 <= data_in;
			end
			S_READ_B11: begin
				addr <= addr + 'd1;
				B11 <= data_in;
			end
			S_READ_B12: begin
				addr <= addr + 'd1;
				B12 <= data_in;
			end
			S_READ_B21: begin
				addr <= addr + 'd1;
				B21 <= data_in;
			end
			S_READ_B22: begin
				addr <= 'd1;
				B22 <= data_in;
			end
			S_READ_CMD: begin
				addr <= 'd1;
				cmd <= data_in;
			end
			S_WRITE_DATA_FORM: begin
				we <= 1'b1; // start to write
				addr <= 'd1;
				data_out <= data_form;
			end
			S_WRITE_C11_L: begin
				addr <= addr + 'd1;
				data_out <= C11[7:0];
			end
			S_WRITE_C11_M: begin
				addr <= addr + 'd1;
				data_out <= C11[15:8];
			end
			S_WRITE_C12_L: begin
				addr <= addr + 'd1;
				data_out <= C12[7:0];
			end
			S_WRITE_C12_M: begin
				addr <= addr + 'd1;
				data_out <= C12[15:8];
			end
			S_WRITE_C21_L: begin
				addr <= addr + 'd1;
				data_out <= C21[7:0];
			end
			S_WRITE_C21_M: begin
				addr <= addr + 'd1;
				data_out <= C21[15:8];
			end
			S_WRITE_C22_L: begin
				addr <= addr + 'd1;
				data_out <= C22[7:0];
			end
			S_WRITE_C22_M: begin
				addr <= addr + 'd1;
				data_out <= C22[15:8];
			end
			S_DONE: begin
				addr <= 'd0;
				data_out <= 'd2; // 2 means matrix calculation is finish
			end
			default: begin
				we <= 1'b0;
				addr <= 'd0;
				data_out <= 'd0;
			end
		endcase
	end
end

endmodule