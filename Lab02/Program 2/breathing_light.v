`define COUNTER_SIZE 14
module breathing_light(
	input clk,
	input rst,
	output led
);

reg stop_work; // stop = 0, work = 1
reg [`COUNTER_SIZE-1:0] counter, light_length, counter_inv;
reg add_sub; // add = 0, sub = 1

integer i;

// stop_work
always@(posedge clk or posedge rst) begin
	if(rst)
		stop_work <= 0;
	else
		stop_work <= 1;
end

// counter
always@(posedge clk or posedge rst) begin
	if(rst)
		counter <= 'd0 - 'd1;
	else
		counter <= counter + 'd1;
end

// light_length
always@(posedge clk or posedge rst) begin
	if(rst)
		light_length <= 'd0 - 'd1;
	else if(&counter)
		if(add_sub)
			light_length <= light_length - 'd1;
		else
			light_length <= light_length + 'd1;
end

// add_sub
always@(posedge clk or posedge rst) begin
	if(rst)
		add_sub <= 1'b0;
	else if(stop_work && (&light_length))
		add_sub <= 1'b1;
	else if(stop_work && (light_length == 'd0))
		add_sub <= 1'b0;
end

// counter_inv
always@(*) begin
	for(i=0; i<`COUNTER_SIZE; i=i+1)
		counter_inv[i] = counter[`COUNTER_SIZE-1-i];
end

// led
assign led = (stop_work)? (light_length >= counter_inv) : 0;

endmodule