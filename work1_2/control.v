module control(
	input ck,reset,
	output reg [7:0]seg,
	output reg [5:0]ctrl
);


always@(posedge ck,negedge reset)
begin
	if(!reset)
	begin
		seg <= 8'b1100_0110;
		ctrl <= 6'b000001;
	end
	else
	begin
		seg <= seg ^ 8'b1111_1100;
		ctrl <= {ctrl[4:0],ctrl[5]};
	end
end


endmodule
