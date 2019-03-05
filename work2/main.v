module main(
	input ck,reset,
	input co5,co10,pay,
	output reg [3:0]ten,single,
	output reg payok,change
);

reg [2:0]fsm,fsm_next;
reg [3:0]ten_next,single_next;

always@(posedge ck,negedge reset)
begin
	if(!reset)
	begin
		fsm <= 3'd0;
		ten <= 4'd0;
		single <= 4'd0;
	end
	else
	begin
		fsm <= fsm_next;
		ten <= ten_next;
		single <= single_next;
	end
end

always@(*)
begin
	case(fsm)
		3'd0:
		begin
			fsm_next = fsm;
			ten_next = ten;
			single_next = single;
			change = 1'b0;
			payok = 1'b0;
			
			if(co5 == 1'b1)
			begin
				fsm_next = 3'd1;
			end
			if(co10 == 1'b1)
			begin
				fsm_next = 3'd2;
			end
			if(pay == 1'b1)
			begin
				fsm_next = 3'd3;
			end
		end
		3'd1:
		begin
			fsm_next = fsm;
			ten_next = ten;
			single_next = single;
			change = 1'b0;
			payok = 1'b0;
			
			if(co5 == 1'b0)
			begin
				if(ten < 4'd3 && single == 4'd0)
				begin
					single_next = 4'd5;
				end
				else if(ten < 4'd3 && single == 4'd5)
				begin
					single_next = 4'd0;
					if(ten < 4'd3)
					begin
						ten_next = ten + 4'd1;
					end
				end
				fsm_next = 3'd0;
			end
		end
		3'd2:
		begin
			fsm_next = fsm;
			ten_next = ten;
			single_next = single;
			change = 1'b0;
			payok = 1'b0;
			
			if(co10 == 1'b0)
			begin
				if(ten < 4'd3)
				begin
					ten_next = ten + 4'd1;
				end
				fsm_next = 3'd0;
			end
		end
		3'd3:
		begin
			fsm_next = fsm;
			ten_next = ten;
			single_next = single;
			change = 1'b0;
			payok = 1'b0;
			if(pay == 1'b0)
			begin
				fsm_next = 3'd0;
				if(ten == 4'd3)
				begin
					fsm_next = 3'd5;
				end
				else if(ten == 4'd2 && single == 4'd5)
				begin
					fsm_next = 3'd4;
				end
			end
		end
		3'd4:
		begin
			fsm_next = fsm;
			ten_next = 4'd0;
			single_next = 4'd0;
			change = 1'b0;
			payok = 1'b1;
		end
		3'd5:
		begin
			fsm_next = fsm;
			ten_next = 4'd0;
			single_next = 4'd5;
			change = 1'b1;
			payok = 1'b1;
		end
		default:
		begin
			fsm_next = 3'd0;
			ten_next = 4'd0;
			single_next = 4'd0;
		end
	endcase
end


endmodule
