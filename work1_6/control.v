module control(
	input ck,reset,
	output reg [2:0]data1,data2,
	output reg [2:0]data3,data4
);

reg [2:0]fsm,fsm_next;
reg [2:0]data1_next,data2_next;
reg [2:0]data3_next,data4_next;


always@(posedge ck,negedge reset)
begin
	if(!reset)
	begin
		fsm <= 3'd0;
		data1 <= 3'd0;
		data2 <= 3'd6;
		data3 <= 3'd6;
		data4 <= 3'd3;
	end
	else
	begin
		fsm <= fsm_next;
		data1 <= data1_next;
		data2 <= data2_next;
		data3 <= data3_next;
		data4 <= data4_next;
	end
end

always@(*)
begin
	case(fsm)
		3'd0:
		begin
			fsm_next = 3'd1;
			data1_next = data1;
			data2_next = 3'd5;
			data3_next = data3;
			data4_next = 3'd2;
		end
		3'd1:
		begin
			fsm_next = 3'd2;
			data1_next = data1;
			data2_next = 3'd4;
			data3_next = data3;
			data4_next = 3'd1;
		end
		3'd2:
		begin
			fsm_next = 3'd3;
			data1_next = 3'd1;
			data2_next = data2;
			data3_next = 3'd2;
			data4_next = data4;
		end
		3'd3:
		begin
			fsm_next = 3'd4;
			data1_next = 3'd6;
			data2_next = data2;
			data3_next = 3'd3;
			data4_next = data4;
		end
		3'd4:
		begin
			fsm_next = 3'd5;
			data1_next = data1;
			data2_next = 3'd5;
			data3_next = data3;
			data4_next = 3'd2;
		end
		3'd5:
		begin
			fsm_next = 3'd6;
			data1_next = data1;
			data2_next = 3'd6;
			data3_next = data3;
			data4_next = 3'd3;
		end
		3'd6:
		begin
			fsm_next = 3'd7;
			data1_next = 3'd5;
			data2_next = data2;
			data3_next = 3'd4;
			data4_next = data4;
		end
		3'd7:
		begin
			fsm_next = 3'd0;
			data1_next = 3'd0;
			data2_next = data2;
			data3_next = 3'd6;
			data4_next = data4;
		end
		default:
		begin
			
		end
	endcase
end
/*
always@(*)
begin
	case(fsm2)
		3'd0:
		begin
			data3_next = data3;
			if(data4 == 3'd1)
			begin
				data3_next = 3'd2;
				data4_next = data4;
				fsm2_next = 3'd1;
			end
			else
			begin
				data3_next = data3;
				data4_next = data4 - 3'd1;
				fsm2_next = fsm2;
			end
		end
		3'd1:
		begin
			data3_next = 3'd3;
			fsm2_next = 3'd2;
			data4_next = data4;
		end
		3'd2:
		begin
			data3_next = data3;
			if(data4 == 3'd3)
			begin
				data3_next = 3'd4;
				data4_next = data4;
				fsm2_next = 3'd3;
			end
			else
			begin
				data3_next = data3;
				data4_next = data4 + 3'd1;
				fsm2_next = fsm2;
			end
		end
		3'd3:
		begin
			data3_next = 3'd6;
			fsm2_next = 3'd0;
			data4_next = data4;
		end
		default:
		begin
			fsm2_next = 3'd0;
			data4_next = 3'd0;
			data3_next = 3'd0;
		end
	endcase
end
*/

endmodule
