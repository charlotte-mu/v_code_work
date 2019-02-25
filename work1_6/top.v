module top(
	input ck,reset,
	output [7:0]seg,
	output [5:0]ctrl
);

wire [5:0]ctrl_w;
wire ck1,ck2;
wire [2:0]data1,data2;
wire [2:0]data3,data4;
wire [2:0]data1_w,data2_w;

assign data1_w = (ck2)? data1 : data3;
assign data2_w = (ck2)? data2 : data4;

parameter clk1 = 12500000;
parameter clk2 = 10000;


assign ctrl = ~ctrl_w;


CLK 
	#(
	.data(clk1)
	)
	u1(
	.ck(ck),
	.reset(reset),
	.ck1(ck1)
);


CLK 
	#(
	.data(clk2)
	)
	u4(
	.ck(ck),
	.reset(reset),
	.ck1(ck2)
);

control u2(
	.ck(ck1),
	.reset(reset),
	.data1(data1),
	.data2(data2),
	.data3(data3),
	.data4(data4)
);

seg7 u3(
	.data1(data1_w),
	.data2(data2_w),
	.seg(seg),
	.ctrl(ctrl_w)
);

endmodule
