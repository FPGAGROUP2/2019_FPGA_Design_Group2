module LED(
    input   clk ,
    input   rst ,
    input   [1:0] sw,
    output  reg led4_g , led4_b , led4_r , led5_g , led5_b , led5_r,
    output  reg [3:0]led
    );
    reg [3:0]state,n_state;
    
   
    always@(posedge rst or posedge clk)begin  
        if(rst)begin
            state<=4'b0000;
        end
        else if(clk) begin
            state<=n_state;
        end
    end
    always@(state or sw)begin//n_state   the code can be combined with next paragragh
        case(sw)
            2'b00:
                case(state)
                    4'b0000:begin
                        led4_g = 1'b1;
						led4_b = 1'b0;
						led4_r = 1'b0;
						led5_g = 1'b0;
						led5_b = 1'b0;
						led5_r = 1'b1;
						led=4'b0001;
						n_state=4'b0001;
			        end
			        4'b0001:begin
                        led4_g = 1'b1;
						led4_b = 1'b0;
						led4_r = 1'b0;
						led5_g = 1'b0;
						led5_b = 1'b0;
						led5_r = 1'b1;
						led=4'b0010;
						n_state=4'b0010;
			        end
			        4'b0010:begin
                        led4_g = 1'b1;
						led4_b = 1'b0;
						led4_r = 1'b0;
						led5_g = 1'b0;
						led5_b = 1'b0;
						led5_r = 1'b1;
						led=4'b0011;
						n_state=4'b0011;
			        end
			        4'b0011:begin
                        led4_g = 1'b1;
						led4_b = 1'b0;
						led4_r = 1'b0;
						led5_g = 1'b0;
						led5_b = 1'b0;
						led5_r = 1'b1;
						led=4'b0100;
						n_state=4'b0100;
						
			        end
			        4'b0100:begin
                        led4_g = 1'b1;
						led4_b = 1'b0;
						led4_r = 1'b0;
						led5_g = 1'b0;
						led5_b = 1'b0;
						led5_r = 1'b1;
						led=4'b0101;
						n_state=4'b0101;
			        end
                    4'b0101:begin
                        led4_g = 1'b1;
						led4_b = 1'b0;
						led4_r = 1'b1;
						led5_g = 1'b0;
						led5_b = 1'b0;
						led5_r = 1'b1;
						led=4'b0001;
						n_state=4'b0110;
			        end
			        4'b0110:begin
                        led4_g = 1'b0;
						led4_b = 1'b0;
						led4_r = 1'b1;
						led5_g = 1'b0;
						led5_b = 1'b0;
						led5_r = 1'b1;
						led=4'b0001;
						n_state=4'b0111;
			        end
                    4'b0111:begin
                        led4_g = 1'b0;
						led4_b = 1'b0;
						led4_r = 1'b1;
						led5_g = 1'b1;
						led5_b = 1'b0;
						led5_r = 1'b0;
						led=4'b0010;
						n_state=4'b1000;
			        end
			         4'b1000:begin
                        led4_g = 1'b0;
						led4_b = 1'b0;
						led4_r = 1'b1;
						led5_g = 1'b1;
						led5_b = 1'b0;
						led5_r = 1'b0;
						led=4'b0011;
						n_state=4'b1001;
			        end
                    4'b1001:begin
                        led4_g = 1'b0;
						led4_b = 1'b0;
						led4_r = 1'b1;
						led5_g = 1'b1;
						led5_b = 1'b0;
						led5_r = 1'b0;
						led=4'b0100;
						n_state=4'b1010;
			        end
			        4'b1010:begin
                        led4_g = 1'b0;
						led4_b = 1'b0;
						led4_r = 1'b1;
						led5_g = 1'b1;
						led5_b = 1'b0;
						led5_r = 1'b0;
						led=4'b0101;
						n_state=4'b1011;
			        end
			        4'b1011:begin
                        led4_g = 1'b0;
						led4_b = 1'b0;
						led4_r = 1'b1;
						led5_g = 1'b1;
						led5_b = 1'b0;
						led5_r = 1'b0;
						led=4'b0110;
						n_state=4'b1100;
			        end
			        4'b1100:begin
                        led4_g = 1'b0;
						led4_b = 1'b0;
						led4_r = 1'b1;
						led5_g = 1'b1;
						led5_b = 1'b0;
						led5_r = 1'b1;
						led=4'b0111;
						n_state=4'b1101;
			        end
			        4'b1101:begin
                        led4_g = 1'b0;
						led4_b = 1'b0;
						led4_r = 1'b1;
						led5_g = 1'b0;
						led5_b = 1'b0;
						led5_r = 1'b1;
						led=4'b1000;
						n_state=4'b0000;
			        end
                    default :n_state=4'b0000;
                endcase
            default:n_state =4'b0000;
        endcase
    end   
endmodule