`timescale 1ns/10ps
`define CYCLE 10.0
module processor_test;

reg [7:0] cmd;
reg signed [7:0] A11, A12, A21, A22, B11, B12, B21, B22;

wire data_form;
wire signed [15:0] C11, C12, C21, C22;

processor proc(
	// input
	.cmd(cmd),
	.A11(A11), .A12(A12), .A21(A21), .A22(A22),
	.B11(B11), .B12(B12), .B21(B21), .B22(B22),
	// output
	.data_form(data_form),
	.C11(C11), .C12(C12), .C21(C21), .C22(C22)
);

initial begin
	cmd = 'd5;
	// matrixA
	A11 = 'd4;	A12 = 'd3;
	A21 = 'd1;	A22 = 'd2;
	// matrixB
	B11 = 'd1;	B12 = 'd1;
	B21 = 'd1;	B22 = 'd1;
	//
	#1
	$display("dataform = %b", data_form);
	if(data_form == 1'b1) begin
		$display("%d\t%d", C11, C12);
		$display("%d\t%d", C21, C22);
	end
	else begin
		$display("det = %d", C11);
	end
	$finish;
end

endmodule