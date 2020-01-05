module KeyGenerator(
	input [3:0] rc,
	input [127:0] key,
	output [127:0] new_key
);

reg [7:0] rcon;

wire [31:0] k [0:3];
wire [7:0] b [0:3];
wire [7:0] wb [0:3];
wire [31:0] wr;
wire [31:0] w0, w1, w2, w3;

// divide key into four words
assign {k[0], k[1], k[2], k[3]} = key;

// RotWord
assign {b[0], b[1], b[2], b[3]} = {k[3][23:0], k[3][31:24]};

// SubWord
ForwardSbox sw0(.data(b[0]), .fsb_data(wb[0]));
ForwardSbox sw1(.data(b[1]), .fsb_data(wb[1]));
ForwardSbox sw2(.data(b[2]), .fsb_data(wb[2]));
ForwardSbox sw3(.data(b[3]), .fsb_data(wb[3]));

// Rcon
always@(*) begin
	case(rc)
		4'h1: rcon = 8'h01;
		4'h2: rcon = 8'h02;
		4'h3: rcon = 8'h04;
		4'h4: rcon = 8'h08;
		4'h5: rcon = 8'h10;
		4'h6: rcon = 8'h20;
		4'h7: rcon = 8'h40;
		4'h8: rcon = 8'h80;
		4'h9: rcon = 8'h1b;
		4'ha: rcon = 8'h36;
		default: rcon = 8'h00;
	endcase
end

assign wr = {wb[0]^rcon, wb[1], wb[2], wb[3]};

// new key
assign w0 = wr ^ k[0];
assign w1 = w0 ^ k[1];
assign w2 = w1 ^ k[2];
assign w3 = w2 ^ k[3];

assign new_key = (rc == 4'h0)? key : {w0, w1, w2, w3};

endmodule