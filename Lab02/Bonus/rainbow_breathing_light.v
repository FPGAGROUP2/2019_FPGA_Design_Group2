module rainbow_breathing_light(
	input clk,
	input rst,
	output reg led4_r, led4_g, led4_b
);

reg [7:0] r_time, g_time, b_time, cnt_time;
reg [8:0] cnt_brightness, brightness;
reg add_sub; // 0: add // 1: sub
reg [2:0] color;

parameter NONE   = 3'd0;
parameter RED    = 3'd1;
parameter ORANGE = 3'd2;
parameter YELLOW = 3'd3;
parameter GREEN  = 3'd4;
parameter BLUE   = 3'd5;
parameter INDIGO = 3'd6;
parameter VIOLET = 3'd7;

// cnt_time
always@(posedge clk or posedge rst) begin
	if(rst)
		cnt_time <= 'd0 - 'd1;
	else
		cnt_time <= cnt_time + 'd1;
end

// cnt_brightness
always@(posedge clk or posedge rst) begin
	if(rst)
		cnt_brightness <= 'd0 - 'd1;
	else if(&cnt_time)
		cnt_brightness <= cnt_brightness + 'd1;
end

// brightness
always@(posedge clk or posedge rst) begin
	if(rst)
		brightness <= 'd0;
	else if(&cnt_brightness && &cnt_time)
		if(add_sub)
			brightness <= brightness - 'd1;
		else
			brightness <= brightness + 'd1;
end

// add_sub
always@(posedge clk or posedge rst) begin
	if(rst)
		add_sub <= 1'b0;
	else if(&brightness)
		add_sub <= 1'b1;
	else if(brightness == 'd0)
		add_sub <= 1'b0;
end

// color
always@(posedge clk or posedge rst) begin
	if(rst)
		color <= 'd0;
	else if(color == 'd0)
		color <= color + 'd1;
	else if(brightness == 'd0 && add_sub == 1'b1)
		color <= (&color)? 'd1 : color + 'd1;
end

// r_time, g_time, b_time
always@(*) begin
	case(color)
		NONE: begin
			r_time = 8'd0;
			g_time = 8'd0;
			b_time = 8'd0;
		end
		RED: begin
			r_time = 8'd255;
			g_time = 8'd0;
			b_time = 8'd0;
		end
		ORANGE: begin
			r_time = 8'd255;
			g_time = 8'd12;
			b_time = 8'd0;
		end
		YELLOW: begin
			r_time = 8'd255;
			g_time = 8'd255;
			b_time = 8'd0;
		end
		GREEN: begin
			r_time = 8'd0;
			g_time = 8'd255;
			b_time = 8'd0;
		end
		BLUE: begin
			r_time = 8'd0;
			g_time = 8'd0;
			b_time = 8'd255;
		end
		INDIGO: begin
			r_time = 8'd12;
			g_time = 8'd0;
			b_time = 8'd255;
		end
		VIOLET: begin
			r_time = 8'd48;
			g_time = 8'd0;
			b_time = 8'd255;
		end
		default: begin
			r_time = 8'd0;
			g_time = 8'd0;
			b_time = 8'd0;
		end
	endcase
end

always@(*) begin
	if(brightness == 'd0) begin
		led4_r = 0;
		led4_g = 0;
		led4_b = 0;
	end
	else if(brightness >= cnt_brightness) begin
		led4_r = (r_time > cnt_time);
		led4_g = (g_time > cnt_time);
		led4_b = (b_time > cnt_time);
	end
	else begin
		led4_r = 0;
		led4_g = 0;
		led4_b = 0;
	end
end

endmodule