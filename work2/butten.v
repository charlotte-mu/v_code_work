module butten(
	input ck,sw,reset,
	output reg db
);

parameter n = 20;
reg [n-1:0] q_reg,q_next;
reg DFF1,DFF2;
wire q_add,q_reset;

assign q_reset = ( DFF1 ^ DFF2 );
assign q_add = ~(q_reg[n-1]);

always@(q_reset,q_add,q_reg)
begin
	case({q_reset,q_add})
		2'b00:
			q_next <= q_reg;
		2'b01:
			q_next <= q_reg + 1;
		default:
			q_next <= {n{1'b0}};
	endcase
end

always@(posedge ck,negedge reset)
begin
	if(reset == 1'b0)
	begin
		DFF1 <= 1'b0;
		DFF2 <= 1'b0;
		q_reg <= {n{1'b0}};
	end
	else
	begin
		DFF1 <= sw;
		DFF2 <= DFF1;
		q_reg <= q_next;
	end
end

always@(posedge ck)
begin
	if(q_reg[n-1] == 1'b1)
		db <= DFF2;
	else
		db <= db;
end

endmodule 