`timescale 1ns/10ps

module testbench;

reg ck,reset,co5,co10,pay;
wire [6:0]seg;
wire [1:0]ctrl;
wire payok,change;

top top(
	.ck(ck),
	.reset(reset),
	.co5(co5),
	.co10(co10),
	.pay(pay),
	.seg(seg),
	.ctrl(ctrl),
	.payok(payok),
	.change(change)
);

always
	#10 ck = ~ck;
	
initial 
begin
	#0 
		ck = 1'b0;
		reset = 1'b0;
		co5 = 1'b0;
		co10 = 1'b0;
		pay = 1'b0;
	#100
		reset = 1'b1;
	#100
		co5 = 1'b1;
		co10 = 1'b0;
		pay = 1'b0;
	#100
		co5 = 1'b0;
	#100
		co10 = 1'b1;
	#100
		co10 = 1'b0;
	#100
		co10 = 1'b1;
	#100
		co10 = 1'b0;
	#100
		pay = 1'b1;
	#100
		pay = 1'b0;
	#1000
		$finish;	
end


endmodule
