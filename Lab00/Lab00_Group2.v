module triangle (clk, reset, nt, xi, yi, busy, po, xo, yo);

input clk, reset, nt;
input [2:0] xi, yi;
output reg busy, po;
output reg [2:0] xo, yo;

reg [2:0] cs, ns;
reg [2:0] x2, y2, x3, y3;
reg [2:0] dx, dy; // dx = x2 - x3 // dy = y3 - y2
reg [2:0] x, y;
reg [2:0] _dx, _dy; // _dx = x2 - x // _dy = y - y2
reg [5:0] product1, product2;


parameter
	S_WAIT = 3'd0,
	S_GET_P2 = 3'd1,
	S_GET_P3 = 3'd2,
	S_FIND = 3'd3;

// cs
always@(posedge clk or posedge reset) begin
	if(reset)
		cs <= S_WAIT;
	else
		cs <= ns;
end

// ns, busy
always@(*) begin
	case(cs)
		S_WAIT: begin
			ns = (nt)? S_GET_P2 : S_WAIT;
			busy = 1'b0;
		end
		S_GET_P2: begin
			ns = S_GET_P3;
			busy = 1'b0;
		end
		S_GET_P3: begin
			ns = S_FIND;
			busy = 1'b1;
		end
		S_FIND: begin
			ns = (xo == x3 && yo == y3)? S_WAIT : S_FIND;
			busy = 1'b1;
		end
		default: begin
			ns = S_WAIT;
			busy = 1'b0;
		end
	endcase
end

// 
always@(posedge clk or posedge reset) begin
	if(reset) begin
		xo <= 'd0;
		yo <= 'd0;
		x2 <= 'd0;
		y2 <= 'd0;
		x3 <= 'd0;
		y3 <= 'd0;
		x <= 'd0;
		y <= 'd0;
		po <= 1'b0;
	end
	else begin
		case(cs)
			S_WAIT: begin
				x <= xi;
				y <= yi;
			end
			S_GET_P2: begin
				x2 <= xi;
				y2 <= yi;
			end
			S_GET_P3: begin
				x3 <= xi;
				y3 <= yi;
			end
			S_FIND: begin
				xo <= x;
				yo <= y;
				if(x == x2 && y == y2) begin
					po <= 1'b1;
					x <= x3;
					y <= y+1;
				end
				else if(product1 >= product2) begin
					po <= 1'b1;
					x <= x+1;
					y <= y;
				end
				else begin
					po <= 1'b0;
					x <= x3;
					y <= y+1;
				end
			end
		endcase
	end
end

always@(*) begin
	dx = x2 - x3;
	dy = y3 - y2;
	_dx = x2 - x;
	_dy = y - y2;
	product1 = _dx*dy;
	product2 = dx*_dy;
end

endmodule
