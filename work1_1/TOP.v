module TOP(
	input ck,reset,
	output [7:0]seg,
	output [5:0]ctrl
);

wire [5:0]ctrl_w;
wire ck1;

assign ctrl = ~ctrl_w;

CLK u1(
	.ck(ck),
	.reset(reset),
	.ck1(ck1)
);

control u2(
	.ck(ck1),
	.reset(reset),
	.seg(seg),
	.ctrl(ctrl_w)
);

endmodule
