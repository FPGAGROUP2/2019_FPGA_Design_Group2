module PWM_Decoder (
  //input  [1:0] sw,
  input clk,
  output reg [7:0] R_time_out,
  output reg [7:0] G_time_out,
  output reg [7:0] B_time_out
  
);
  reg [3:0] cs, ns;
  parameter

		state_1 = 3'd0,
		state_2 = 3'd1,
		state_3 = 3'd2,
		state_4 = 3'd3,
		state_5 = 3'd4,
		state_6 = 3'd5,
		state_7 = 3'd6;
		
		

  always@(posedge clk) begin
	   cs <= ns;
  end

  always @ ( * ) begin
    case(cs)
      state_1: begin
        R_time_out = 8'd255;
        G_time_out = 8'd0;
        B_time_out = 8'd0;
	ns = state_2;
      end
      state_2: begin
        R_time_out = 8'd255;
        G_time_out = 8'd12;
        B_time_out = 8'd0;
	ns = state_3;
      end
      state_3: begin
        R_time_out = 8'd255;
        G_time_out = 8'd255;
        B_time_out = 8'd0;
	ns = state_4;
      end
      state_4: begin
        R_time_out = 8'd0;
        G_time_out = 8'd255;
        B_time_out = 8'd0;
	ns = state_5;
      end
      state_5: begin
        R_time_out = 8'd0;
        G_time_out = 8'd0;
        B_time_out = 8'd255;
	ns = state_6;
      end
      state_6: begin
        R_time_out = 8'd12;
        G_time_out = 8'd0;
        B_time_out = 8'd255;
	ns = state_7;
      end
      state_7: begin
        R_time_out = 8'd48;
        G_time_out = 8'd0;
        B_time_out = 8'd255;
	ns = state_1;
      end
      default: begin
        R_time_out = 8'd0;
        G_time_out = 8'd0;
        B_time_out = 8'd0;
	ns = state_1;
      end
    endcase
  end

endmodule // Decoder