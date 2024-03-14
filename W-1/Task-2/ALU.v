module ALU(
input [3:0]num1,num2, 
input[1:0]op, 
output reg [4:0]result
);

	input sel;
	always@(*)
	begin
		case(op)
			2'b00: result = num1 + num2;
			2'b01: result = num1 - num2;
			2'b10: result = num1 * num2;
			2'b11: result = num1 / num2;
			default: result = 5'b00000;
		endcase
	end
	endmodule

