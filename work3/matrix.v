module matrix(
	input [2:0]conter,
	input [1:0]image,
	input colour_red
	output reg [7:0]red,green,ctrl
);

reg [7:0]data;

assign red = (colour)? data : 8'd0;
assign green = (colour)? 8'd0 : data;

always@()

endmodule
