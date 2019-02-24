module seg7(
	input [2:0]data1,
	input [2:0]data2,
	output reg [7:0]seg,
	output reg [5:0]ctrl
);

always@(data1)
begin
	case(data1)
		3'd0:
		begin
			seg = 8'b1000_0000;
		end
		3'd1:
		begin
			seg = 8'b0100_0000;
		end
		3'd2:
		begin
			seg = 8'b0010_0000;
		end
		3'd3:
		begin
			seg = 8'b0001_0000;
		end
		3'd4:
		begin
			seg = 8'b0000_1000;
		end
		3'd5:
		begin
			seg = 8'b0000_0100;
		end
		3'd6:
		begin
			seg = 8'b0000_0010;
		end
		3'd7:
		begin
			seg = 8'b0000_0001;
		end
		default:
		begin
			seg = 8'b1111_1111;
		end
end

always@(data2)
begin
	case(data2)
		3'd0:
		begin
			ctrl = 6'b000001;
		end
		3'd1:
		begin
			ctrl = 6'b000010;
		end
		3'd2:
		begin
			ctrl = 6'b000100;
		end
		3'd3:
		begin
			ctrl = 6'b001000;
		end
		3'd4:
		begin
			ctrl = 6'b010000;
		end
		3'd5:
		begin
			ctrl = 6'b100000;
		end
		default:
		begin
			ctrl = 6'b111111;
		end
end

endmodule
