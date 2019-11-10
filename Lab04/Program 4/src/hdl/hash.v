module hash(
  input [31:0] hash,
  input [7:0] c,
  output wire [31:0]S
);
  assign S = hash*33+{24'b0,c};

endmodule
