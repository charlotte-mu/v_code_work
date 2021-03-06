module seg7(
	input [3:0]seg_data,
	input [1:0]ctrl_data,
	output reg [6:0]seg,
	output reg [1:0]ctrl
);

always@(seg_data)
begin
	case(seg_data)
		4'd0:
		begin
			seg = 7'b1111110;
		end
		4'd1:
		begin
			seg = 7'b0110000;
		end
		4'd2:
		begin
			seg = 7'b1101101;
		end
		4'd3:
		begin
			seg = 7'b1111001;
		end
		4'd4:
		begin
			seg = 7'b0110011;
		end
		4'd5:
		begin
			seg = 7'b1011011;
		end
		4'd6:
		begin
			seg = 7'b1011111;
		end
		4'd7:
		begin
			seg = 7'b1110010;
		end
		4'd8:
		begin
			seg = 7'b1111111;
		end
		4'd9:
		begin
			seg = 7'b1111011;
		end
		default:
		begin
			seg = 7'b1110110;
		end
	endcase
end

always@(ctrl_data)
begin
	case(ctrl_data)
		2'd1:
		begin
			ctrl = 2'b01;
		end
		2'd2:
		begin
			ctrl = 2'b10;
		end
		default:
		begin
			ctrl = 2'b11;
		end
	endcase
end

endmodule
