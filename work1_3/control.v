module control(
	input ck,reset,
	output reg [2:0]data1,
	output reg [2:0]data2
);

reg [2:0]fsm,fsm_next;
reg [2:0]data1_next;
reg [2:0]data2_next;


always@(posedge ck,negedge reset)
begin
	if(!reset)
	begin
		fsm <= 3'd0;
		data1 <= 3'd1;
		data2 <= 3'd2;
	end
	else
	begin
		fsm <= fsm_next;
		data1 <= data1_next;
		data2 <= data2_next;
	end
end

always@(*)
begin
	case(fsm)
		3'd0:
		begin
			fsm_next = 3'd1;
			data2_next = data2 - 3'd1;
			data1_next = 3'd5;
		end
		3'd1:
		begin
			fsm_next = 3'd2;
			data2_next = data2;
			data1_next = 3'd6;
		end
		3'd2:
		begin
			fsm_next = 3'd3;
			data2_next = data2;
			data1_next = 3'd4;
		end
		3'd3:
		begin
			fsm_next = 3'd4;
			data2_next = data2 + 3'd1;
			data1_next = 3'd2;
		end
		3'd4:
		begin
			fsm_next = 3'd5;
			data2_next = data2;
			data1_next = 3'd6;
		end
		3'd5:
		begin
			fsm_next = 3'd0;
			if(data2 == 3'd6)
			begin
				data2_next = 3'd2;
			end
			else
			begin
				data2_next = data2 + 3'd2;
			end
			data1_next = 3'd1;
		end
		default:
		begin
			fsm_next = 3'd0;
			data2_next = 3'd2;
			data1_next = 3'd1;
		end
	endcase
end


endmodule
