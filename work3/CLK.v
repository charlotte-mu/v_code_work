module CLK(
	input ck,reset,
	output reg ck1
);

reg [31:0]conter;

parameter data = 10;

always@(posedge ck,negedge reset)
begin
	if(reset == 1'b0)
	begin
		conter <= 32'd0;
		ck1 <= 1'b0;
	end
	else
	begin
		if(conter == data)
		begin
			conter <= 32'd0;
			ck1 <= ~ck1;
		end
		else
		begin
			conter <= conter + 32'd1;
		end
	end
end

endmodule
