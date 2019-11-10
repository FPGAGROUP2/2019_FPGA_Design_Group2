module test2(
    input clk,
	input  [31:0] A,
	input  [31:0] B,
	input [1:0] C,
	output wire [31:0] S
);

reg  [31:0] temp;

	always@(posedge clk)begin
	case(C)
	2'b00: begin
    temp = A+B;
	end

	2'b01: begin
	temp = A-B;
	end
	
	2'b10: begin
	temp = A*B;
	end

	2'b11: begin	
	temp = A+B;
	end

	default: begin	
	temp = A+B;
	end

	endcase
	end	
	
    assign S = temp; 

endmodule