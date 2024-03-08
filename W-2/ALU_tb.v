module ALU_tb();
wire [4:0]result;
reg [3:0]num1, num2;
reg [1:0]op;

ALU dut(num1,num2,op,result);

initial 
begin
	$dumpfile("ALU.vcd");
	$dumpvars(0,ALU_tb);

	num1=4'b1000;
	num2=4'b0010;
	op=2'b00;
	#10;

	op=2'b10;

	#10;

	op=2'b11;

	#10;

	op=2'b01;

	#60;

end

initial
	$monitor("num1=%d num2=%d op=%d result=%d",num1,num2,op,result);
endmodule

