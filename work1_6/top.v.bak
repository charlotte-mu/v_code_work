module top(
	input ck,reset,
	output [7:0]seg,
	output [5:0]ctrl
);

wire [5:0]ctrl_w;
wire ck1;
wire [2:0]data1;
wire [2:0]data2;

assign ctrl = ~ctrl_w;

CLK u1(
	.ck(ck),
	.reset(reset),
	.ck1(ck1)
);

control u2(
	.ck(ck1),
	.reset(reset),
	.data1(data1),
	.data2(data2)
);

seg7 u3(
	.data1(data1),
	.data2(data2),
	.seg(seg),
	.ctrl(ctrl_w)
);

endmodule
