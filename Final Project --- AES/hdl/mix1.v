module mixcolumn1(
	input valid,
	input clk,rst,
    input [127:0] datain,
    output reg done,
	output reg[127:0] dataout
    );
	
	reg valid_tmp;
	
    reg [7:0] d00;//column 1
	reg [7:0] d01;
	reg [7:0] d02;
	reg [7:0] d03;
	
	reg [7:0] d10;//column 2
	reg [7:0] d11;
	reg [7:0] d12;
	reg [7:0] d13;
	
	reg [7:0] d20;//column 3
	reg [7:0] d21;
	reg [7:0] d22;
	reg [7:0] d23;
	
	reg [7:0] d30;//column 4
	reg [7:0] d31;
	reg [7:0] d32;
	reg [7:0] d33;
	
	reg [1:0] cstate,nstate;
	
	parameter
		S_IDLE = 2'd0,
		S_WORK = 2'd1,
		S_DONE = 2'd2;
	
	wire done_mul;
	
	wire m000_done, m010_done, m020_done, m030_done;
	wire m100_done, m110_done, m120_done, m130_done;
	wire m200_done, m210_done, m220_done, m230_done;
	wire m300_done, m310_done, m320_done, m330_done;
	
	wire m001_done, m011_done, m021_done, m031_done;
	wire m101_done, m111_done, m121_done, m131_done;
	wire m201_done, m211_done, m221_done, m231_done;
	wire m301_done, m311_done, m321_done, m331_done;
	
	wire m002_done, m012_done, m022_done, m032_done;
	wire m102_done, m112_done, m122_done, m132_done;
	wire m202_done, m212_done, m222_done, m232_done;
	wire m302_done, m312_done, m322_done, m332_done;
	
	wire m003_done, m013_done, m023_done, m033_done;
	wire m103_done, m113_done, m123_done, m133_done;
	wire m203_done, m213_done, m223_done, m233_done;
	wire m303_done, m313_done, m323_done, m333_done;
	
	wire [7:0] m000_dataout, m010_dataout, m020_dataout, m030_dataout;
	wire [7:0] m100_dataout, m110_dataout, m120_dataout, m130_dataout;
	wire [7:0] m200_dataout, m210_dataout, m220_dataout, m230_dataout;
	wire [7:0] m300_dataout, m310_dataout, m320_dataout, m330_dataout;
	
	wire [7:0] m001_dataout, m011_dataout, m021_dataout, m031_dataout;
	wire [7:0] m101_dataout, m111_dataout, m121_dataout, m131_dataout;
	wire [7:0] m201_dataout, m211_dataout, m221_dataout, m231_dataout;
	wire [7:0] m301_dataout, m311_dataout, m321_dataout, m331_dataout;
	
	wire [7:0] m002_dataout, m012_dataout, m022_dataout, m032_dataout;
	wire [7:0] m102_dataout, m112_dataout, m122_dataout, m132_dataout;
	wire [7:0] m202_dataout, m212_dataout, m222_dataout, m232_dataout;
	wire [7:0] m302_dataout, m312_dataout, m322_dataout, m332_dataout;
	
	wire [7:0] m003_dataout, m013_dataout, m023_dataout, m033_dataout;
	wire [7:0] m103_dataout, m113_dataout, m123_dataout, m133_dataout;
	wire [7:0] m203_dataout, m213_dataout, m223_dataout, m233_dataout;
	wire [7:0] m303_dataout, m313_dataout, m323_dataout, m333_dataout;
	
	//row1 * 4 different columns
	MULTI m000(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d00),
	.multiplier(4'd2),//14
	.done(m000_done),
	.dataout(m000_dataout)
	);
	
	MULTI m010(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d01),
	.multiplier(4'd3),//11
	.done(m010_done),
	.dataout(m010_dataout)
	);
	
	MULTI m020(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d02),
	.multiplier(4'd1),//13
	.done(m020_done),
	.dataout(m020_dataout)
	);
	
	MULTI m030(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d03),
	.multiplier(4'd1),//9
	.done(m030_done),
	.dataout(m030_dataout)
	);
	
	///////////
	
	MULTI m100(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d10),
	.multiplier(4'd2),//14
	.done(m100_done),
	.dataout(m100_dataout)
	);
	
	MULTI m110(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d11),
	.multiplier(4'd3),//11
	.done(m110_done),
	.dataout(m110_dataout)
	);
	
	MULTI m120(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d12),
	.multiplier(4'd1),//13
	.done(m120_done),
	.dataout(m120_dataout)
	);
	
	MULTI m130(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d13),
	.multiplier(4'd1),//9
	.done(m130_done),
	.dataout(m130_dataout)
	);
	
	/////////////////////
	
	MULTI m200(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d20),
	.multiplier(4'd2),//14
	.done(m200_done),
	.dataout(m200_dataout)
	);
	
	MULTI m210(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d21),
	.multiplier(4'd3),//11
	.done(m210_done),
	.dataout(m210_dataout)
	);
	
	MULTI m220(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d22),
	.multiplier(4'd1),//13
	.done(m220_done),
	.dataout(m220_dataout)
	);
	
	MULTI m230(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d23),
	.multiplier(4'd1),//9
	.done(m230_done),
	.dataout(m230_dataout)
	);
	////////////
	
	MULTI m300(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d30),
	.multiplier(4'd2),//14
	.done(m300_done),
	.dataout(m300_dataout)
	);
	
	MULTI m310(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d31),
	.multiplier(4'd3),//11
	.done(m310_done),
	.dataout(m310_dataout)
	);
	
	MULTI m320(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d32),
	.multiplier(4'd1),//13
	.done(m320_done),
	.dataout(m320_dataout)
	);
	
	MULTI m330(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d33),
	.multiplier(4'd1),//9
	.done(m330_done),
	.dataout(m330_dataout)
	);
	
	//row 2 * 4diffent columns
	MULTI m001(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d00),
	.multiplier(4'd1),//9
	.done(m001_done),
	.dataout(m001_dataout)
	);
	
	MULTI m011(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d01),
	.multiplier(4'd2),//14
	.done(m011_done),
	.dataout(m011_dataout)
	);
	
	MULTI m021(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d02),
	.multiplier(4'd3),//11
	.done(m021_done),
	.dataout(m021_dataout)
	);
	
	MULTI m031(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d03),
	.multiplier(4'd1),//13
	.done(m031_done),
	.dataout(m031_dataout)
	);
	//
	MULTI m101(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d10),
	.multiplier(4'd1),//9
	.done(m101_done),
	.dataout(m101_dataout)
	);
	
	MULTI m111(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d11),
	.multiplier(4'd2),//14
	.done(m111_done),
	.dataout(m111_dataout)
	);
	
	MULTI m121(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d12),
	.multiplier(4'd3),//11
	.done(m121_done),
	.dataout(m121_dataout)
	);
	
	MULTI m131(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d13),
	.multiplier(4'd1),//13
	.done(m131_done),
	.dataout(m131_dataout)
	);
	MULTI m201(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d20),
	.multiplier(4'd1),//9
	.done(m201_done),
	.dataout(m201_dataout)
	);
	
	MULTI m211(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d21),
	.multiplier(4'd2),//14
	.done(m211_done),
	.dataout(m211_dataout)
	);
	
	MULTI m221(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d22),
	.multiplier(4'd3),//11
	.done(m221_done),
	.dataout(m221_dataout)
	);
	
	MULTI m231(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d23),
	.multiplier(4'd1),//13
	.done(m231_done),
	.dataout(m231_dataout)
    );
	
	//
	MULTI m301(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d30),
	.multiplier(4'd1),//9
	.done(m301_done),
	.dataout(m301_dataout)
	);
	
	MULTI m311(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d31),
	.multiplier(4'd2),//14
	.done(m311_done),
	.dataout(m311_dataout)
	);
	
	MULTI m321(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d32),
	.multiplier(4'd3),//11
	.done(m321_done),
	.dataout(m321_dataout)
	);
	
	MULTI m331(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d33),
	.multiplier(4'd1),//13
	.done(m331_done),
	.dataout(m331_dataout)
	);
	//row 3 * 4diffent columns
	
	MULTI m002(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d00),
	.multiplier(4'd1),//13 
	.done(m002_done),
	.dataout(m002_dataout)
	);
	
	MULTI m012(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d01),
	.multiplier(4'd1),//9 
	.done(m012_done),
	.dataout(m012_dataout)
	);
	
	MULTI m022(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d02),
	.multiplier(4'd2),//14 
	.done(m022_done),
	.dataout(m022_dataout)
	);
	
	MULTI m032(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d03),
	.multiplier(4'd3),//11
	.done(m032_done),
	.dataout(m032_dataout)
	);
	//
	MULTI m102(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d10),
	.multiplier(4'd1),//13 
	.done(m102_done),
	.dataout(m102_dataout)
	);
	
	MULTI m112(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d11),
	.multiplier(4'd1),//9 
	.done(m112_done),
	.dataout(m112_dataout)
	);
	
	MULTI m122(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d12),
	.multiplier(4'd2),//14 
	.done(m122_done),
	.dataout(m122_dataout)
	);
	
	MULTI m132(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d13),
	.multiplier(4'd3),//11
	.done(m132_done),
	.dataout(m132_dataout)
	);
	//
	MULTI m202(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d20),
	.multiplier(4'd1),//13 
	.done(m202_done),
	.dataout(m202_dataout)
	);
	
	MULTI m212(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d21),
	.multiplier(4'd1),//9 
	.done(m212_done),
	.dataout(m212_dataout)
	);
	
	MULTI m222(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d22),
	.multiplier(4'd2),//14 
	.done(m222_done),
	.dataout(m222_dataout)
	);
	
	MULTI m232(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d23),
	.multiplier(4'd3),//11
	.done(m232_done),
	.dataout(m232_dataout)
	);
	//
	MULTI m302(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d30),
	.multiplier(4'd1),//13 
	.done(m302_done),
	.dataout(m302_dataout)
	);
	
	MULTI m312(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d31),
	.multiplier(4'd1),//9 
	.done(m312_done),
	.dataout(m312_dataout)
	);
	
	MULTI m322(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d32),
	.multiplier(4'd2),//14 
	.done(m322_done),
	.dataout(m322_dataout)
	);
	
	MULTI m332(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d33),
	.multiplier(4'd3),//11
	.done(m332_done),
	.dataout(m332_dataout)
	);
	//row 4 * 4 diffent columns
	MULTI m003(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d00),
	.multiplier(4'd3),//11
	.done(m003_done),
	.dataout(m003_dataout)
	);
	
	MULTI m013(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d01),
	.multiplier(4'd1),//13
	.done(m013_done),
	.dataout(m013_dataout)
	);
	
	MULTI m023(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d02),
	.multiplier(4'd1),//9
	.done(m023_done),
	.dataout(m023_dataout)
	);
	
	MULTI m033(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d03),
	.multiplier(4'd2),//14
	.done(m033_done),
	.dataout(m033_dataout)
	);
	//
	MULTI m103(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d10),
	.multiplier(4'd3),//11
	.done(m103_done),
	.dataout(m103_dataout)
	);
	
	MULTI m113(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d11),
	.multiplier(4'd1),//13
	.done(m113_done),
	.dataout(m113_dataout)
	);
	
	MULTI m123(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d12),
	.multiplier(4'd1),//9
	.done(m123_done),
	.dataout(m123_dataout)
	);
	
	MULTI m133(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d13),
	.multiplier(4'd2),//14
	.done(m133_done),
	.dataout(m133_dataout)
	);
	//
	MULTI m203(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d20),
	.multiplier(4'd3),//11
	.done(m203_done),
	.dataout(m203_dataout)
	);
	
	MULTI m213(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d21),
	.multiplier(4'd1),//13
	.done(m213_done),
	.dataout(m213_dataout)
	);
	
	MULTI m223(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d22),
	.multiplier(4'd1),//9
	.done(m223_done),
	.dataout(m223_dataout)
	);
	
	MULTI m233(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d23),
	.multiplier(4'd2),//14
	.done(m233_done),
	.dataout(m233_dataout)
	);
	//
	MULTI m303(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d30),
	.multiplier(4'd3),//11
	.done(m303_done),
	.dataout(m303_dataout)
	);
	
	MULTI m313(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d31),
	.multiplier(4'd1),//13
	.done(m313_done),
	.dataout(m313_dataout)
	);
	
	MULTI m323(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d32),
	.multiplier(4'd1),//9
	.done(m323_done),
	.dataout(m323_dataout)
	);
	
	MULTI m333(//
	.clk(clk),
	.rst(rst),
	.valid(valid_tmp),
	.datain(d33),
	.multiplier(4'd2),//14
	.done(m333_done),
	.dataout(m333_dataout)
	);
	
	always@(posedge clk or posedge rst) begin
		if(rst)
			cstate <= S_IDLE;
		else
			cstate <= nstate;
	end	
	
	always@(*) begin
		case(cstate)
			S_IDLE:
				nstate = (valid)? S_WORK : S_IDLE;
			S_WORK:
				nstate = (done_mul)? S_DONE : S_WORK;
			S_DONE:
				nstate = S_IDLE;
			default:
				nstate = S_IDLE;
		endcase
	end
	
	always@(posedge clk or posedge rst)begin
		if(rst) begin
			{d00, d01, d02, d03, d10, d11, d12, d13, d20, d21, d22, d23, d30, d31, d32, d33} <= 'd0;
			dataout <= 'd0;
		end
		else begin
			case(cstate)
				S_IDLE: begin
					if(valid) begin
						{d00, d01, d02, d03, d10, d11, d12, d13, d20, d21, d22, d23, d30, d31, d32, d33} <= datain;
						dataout <= 'd0;
					end
				end
				S_WORK: begin
				end
				S_DONE: begin
					dataout[127:120] <= (m000_dataout)^(m010_dataout)^(m020_dataout)^(m030_dataout);
					dataout[119:112] <= (m001_dataout)^(m011_dataout)^(m021_dataout)^(m031_dataout);
					dataout[111:104] <= (m002_dataout)^(m012_dataout)^(m022_dataout)^(m032_dataout);
					dataout[103:96] <= (m003_dataout)^(m013_dataout)^(m023_dataout)^(m033_dataout);
					//
					dataout[95:88] <= (m100_dataout)^(m110_dataout)^(m120_dataout)^(m130_dataout);
					dataout[87:80] <= (m101_dataout)^(m111_dataout)^(m121_dataout)^(m131_dataout);
					dataout[79:72] <= (m102_dataout)^(m112_dataout)^(m122_dataout)^(m132_dataout);
					dataout[71:64] <= (m103_dataout)^(m113_dataout)^(m123_dataout)^(m133_dataout);
					//
					dataout[63:56] <= (m200_dataout)^(m210_dataout)^(m220_dataout)^(m230_dataout);
					dataout[55:48] <= (m201_dataout)^(m211_dataout)^(m221_dataout)^(m231_dataout);
					dataout[47:40] <= (m202_dataout)^(m212_dataout)^(m222_dataout)^(m232_dataout);
					dataout[39:32] <= (m203_dataout)^(m213_dataout)^(m223_dataout)^(m233_dataout);
					//
					dataout[31:24] <= (m300_dataout)^(m310_dataout)^(m320_dataout)^(m330_dataout);
					dataout[23:16] <= (m301_dataout)^(m311_dataout)^(m321_dataout)^(m331_dataout);
					dataout[15:8] <= (m302_dataout)^(m312_dataout)^(m322_dataout)^(m332_dataout);
					dataout[7:0] <= (m303_dataout)^(m313_dataout)^(m323_dataout)^(m333_dataout);
				end
			endcase
		end
	end
	
	always@(posedge clk or posedge rst) begin
		if(rst)
			valid_tmp <= 1'b0;
		else
			valid_tmp <= valid;
	end
	
	always@(posedge clk or posedge rst) begin
		if(rst)
			done <= 1'b0;
		else if(cstate == S_DONE)
			done <= 1'b1;
		else
			done <= 1'b0;
	end
	
	assign done_mul = m000_done & m010_done & m020_done & m030_done
					& m100_done & m110_done & m120_done & m130_done
					& m200_done & m210_done & m220_done & m230_done
					& m300_done & m310_done & m320_done & m330_done
					& m001_done & m011_done & m021_done & m031_done
					& m101_done & m111_done & m121_done & m131_done
					& m201_done & m211_done & m221_done & m231_done
					& m301_done & m311_done & m321_done & m331_done
					& m002_done & m012_done & m022_done & m032_done
					& m102_done & m112_done & m122_done & m132_done
					& m202_done & m212_done & m222_done & m232_done
					& m302_done & m312_done & m322_done & m332_done
					& m003_done & m013_done & m023_done & m033_done
					& m103_done & m113_done & m123_done & m133_done
					& m203_done & m213_done & m223_done & m233_done
					& m303_done & m313_done & m323_done & m333_done;
	
endmodule