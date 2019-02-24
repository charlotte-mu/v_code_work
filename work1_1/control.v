module control(
	input ck,reset,
	output reg [7:0]seg,
	output reg [5:0]ctrl
);

reg data;

always@(posedge ck,negedge reset)
begin
	if(!reset)
	begin
		seg <= 8'b0000_0000;
		ctrl <= 6'b000000;
		data <= 1'b0;
	end
	else
	begin
		if(data == 1'b0)
		begin
			seg <= 8'b1100_0110;
			ctrl <= 6'b111000;
			data <= 1'd1;
		end
		else
		begin
			seg <= 8'b0011_1010;
			ctrl <= 6'b000111;
			data <= 1'd0;
		end
	end
end


endmodule
