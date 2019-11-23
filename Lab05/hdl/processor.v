(* keep_hierarchy = "yes" *)module processor(
	input [7:0] cmd,
	input signed [7:0] A11, A12, A21, A22, B11, B12, B21, B22, // matrixA and matrixB, 2*2, range: -128~127
	output reg data_form, // form: 0 => constant, 1 => matrix
	output reg signed [15:0] C11, C12, C21, C22 // matrixC, 2*2, calculation result, range: -32768~32767
);

parameter
	ADD = 8'd1,
	SUB = 8'd2,
	MUL = 8'd3,
	TRA = 8'd4,
	DET = 8'd5;

always@(*) begin
	case(cmd)
		ADD: begin
			C11 = A11 + B11;
			C12 = A12 + B12;
			C21 = A21 + B21;
			C22 = A22 + B22;
			data_form = 1;
		end
		SUB: begin
			C11 = A11 - B11;
			C12 = A12 - B12;
			C21 = A21 - B21;
			C22 = A22 - B22;
			data_form = 1;
		end
		MUL: begin
			C11 = A11*B11 + A12*B21;
			C12 = A11*B12 + A12*B22;
			C21 = A21*B11 + A22*B21;
			C22 = A21*B12 + A22*B22;
			data_form = 1;
		end
		TRA: begin
			C11 = A11;
			C12 = A21;
			C21 = A12;
			C22 = A22;
			data_form = 1;
		end
		DET: begin
			C11 = A11*A22 - A12*A21;
			C12 = 'd0;
			C21 = 'd0;
			C22 = 'd0;
			data_form = 0;
		end
		default: begin
			C11 = 'd0;
			C12 = 'd0;
			C21 = 'd0;
			C22 = 'd0;
			data_form = 1;
		end
	endcase
end

endmodule