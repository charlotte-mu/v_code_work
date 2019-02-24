module control(
	input ck,reset,
	output reg [2:0]data1,
	output reg [1:0]data2
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
