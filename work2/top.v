module top(
	input ck,reset,
	input co5,co10,pay,
	output [6:0]seg,
	output [1:0]ctrl,
	output payok,change
);

wire co5_w,co10_w,pay_w;
wire ck1;
wire [3:0]seg_data;
wire [1:0]ctrl_data;
wire [1:0]ctrl_not;
wire payok_not,change_not;
wire [3:0]ten,single;


assign seg_data = (ck1)? ten : single;
assign ctrl_data = (ck1)? 2'd2 : 2'd1;
assign payok = ~payok_not;
assign change = ~change_not;
assign ctrl = ~ctrl_not;


/*main u4(
	.ck(ck),
	.reset(reset),
	.co5(co5),
	.co10(co10),
	.pay(pay),
	.ten(ten),
	.single(single),
	.payok(payok_not),
	.change(change_not)
);*/

main u4(
	.ck(ck),
	.reset(reset),
	.co5(~co5_w),
	.co10(~co10_w),
	.pay(~pay_w),
	.ten(ten),
	.single(single),
	.payok(payok_not),
	.change(change_not)
);

seg7 u5(
	.seg_data(seg_data),
	.ctrl_data(ctrl_data),
	.seg(seg),
	.ctrl(ctrl_not)
);

butten u1(
	.ck(ck),
	.reset(reset),
	.sw(co5),
	.db(co5_w)
);

butten u2(
	.ck(ck),
	.reset(reset),
	.sw(co10),
	.db(co10_w)
);

butten u6(
	.ck(ck),
	.reset(reset),
	.sw(pay),
	.db(pay_w)
);

CLK #(.data(500000))
u3(
	.ck(ck),
	.reset(reset),
	.ck1(ck1)
);



endmodule
